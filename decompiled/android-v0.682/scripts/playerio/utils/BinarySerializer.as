package playerio.utils
{
   import flash.events.EventDispatcher;
   import flash.utils.ByteArray;
   import playerio.Message;
   import playerio.MessageEvent;
   
   public class BinarySerializer extends EventDispatcher
   {
      
      public static const ON_MESSAGE:String = "onmessage";
      
      public static const ShortStringPattern:uint = parseInt("11000000",2);
      
      public static const ShortUnsignedIntPattern:uint = parseInt("10000000",2);
      
      public static const ShortByteArrayPattern:uint = parseInt("01000000",2);
      
      public static const UnsignedLongPattern:uint = parseInt("00111000",2);
      
      public static const LongPattern:uint = parseInt("00110000",2);
      
      public static const ByteArrayPattern:uint = parseInt("00010000",2);
      
      public static const StringPattern:uint = parseInt("00001100",2);
      
      public static const UnsignedIntPattern:uint = parseInt("00001000",2);
      
      public static const IntPattern:uint = parseInt("00000100",2);
      
      public static const DoublePattern:uint = parseInt("00000011",2);
      
      public static const FloatPattern:uint = parseInt("00000010",2);
      
      public static const BooleanTruePattern:uint = parseInt("00000001",2);
      
      public static const BooleanFalsePattern:uint = parseInt("00000000",2);
      
      private var tokens:Array = [];
      
      private var tokenBuilder:TokenBuilder = null;
      
      private var messageBuilder:MessageBuilder = null;
      
      public function BinarySerializer()
      {
         super();
         tokens.push(new Token(ShortStringPattern,readUnsignedInt,function(b:ByteArray):String
         {
            return b.readUTFBytes(b.length);
         }));
         tokens.push(new Token(ShortUnsignedIntPattern,readUnsignedInt));
         tokens.push(new Token(ShortByteArrayPattern,readUnsignedInt,function(b:ByteArray):ByteArray
         {
            return b;
         }));
         tokens.push(new Token(UnsignedLongPattern,readLength,function():int
         {
            trace("Longs are unsupported in ActionScript, returning (int)0.");
            return 0;
         }));
         tokens.push(new Token(LongPattern,readLength,function():int
         {
            trace("Longs are unsupported in ActionScript, returning (int)0.");
            return 0;
         }));
         tokens.push(new Token(ByteArrayPattern,readLength,readUnsignedInt,function(b:ByteArray):ByteArray
         {
            return b;
         }));
         tokens.push(new Token(StringPattern,readLength,readUnsignedInt,function(b:ByteArray):String
         {
            return b.readUTFBytes(b.length);
         }));
         tokens.push(new Token(UnsignedIntPattern,readLength,readUnsignedInt));
         tokens.push(new Token(IntPattern,readLength,function(b:ByteArray):int
         {
            return readUnsignedInt(b);
         }));
         tokens.push(new Token(DoublePattern,function(b:ByteArray):int
         {
            return 8;
         },function(b:ByteArray):Number
         {
            return b.readDouble();
         }));
         tokens.push(new Token(FloatPattern,function(b:ByteArray):int
         {
            return 4;
         },function(b:ByteArray):Number
         {
            return b.readFloat();
         }));
         tokens.push(new Token(BooleanTruePattern,function(b:ByteArray):Boolean
         {
            return true;
         }));
         tokens.push(new Token(BooleanFalsePattern,function(b:ByteArray):Boolean
         {
            return false;
         }));
      }
      
      private function readLength(b:ByteArray) : uint
      {
         return readUnsignedInt(b) + 1;
      }
      
      private function readUnsignedInt(b:ByteArray) : uint
      {
         var o:uint = 0;
         while(b.position < b.length)
         {
            o = uint(o << 8 | b.readUnsignedByte());
         }
         return o;
      }
      
      public function AddByte(b:uint) : void
      {
         if(tokenBuilder == null)
         {
            for each(var t in tokens)
            {
               if((t.Type & b) == t.Type)
               {
                  tokenBuilder = new TokenBuilder(t);
                  tokenBuilder.addEventListener("onValue",onValue);
                  tokenBuilder.AddByte(b & ~t.Type);
                  break;
               }
            }
         }
         else
         {
            tokenBuilder.AddByte(b);
         }
      }
      
      public function AddBytes(b:ByteArray) : void
      {
         var a:int = 0;
         b.position = 0;
         for(a = 0; a < b.length; )
         {
            AddByte(b.readUnsignedByte());
            a++;
         }
      }
      
      public function Serialize(o:*) : ByteArray
      {
         if(o is Number || o is Boolean || o is String || o is ByteArray)
         {
            return serialize(o);
         }
         throw new Error(typeof o + " is not yet supported");
      }
      
      public function SerializeMessage(m:Message) : ByteArray
      {
         var t:ByteArray;
         var ret:ByteArray = new ByteArray();
         var l:ByteArray = serialize(m.length);
         ret.writeBytes(l,0,l.length);
         t = serialize(m.type);
         ret.writeBytes(t,0,t.length);
         m.clone({"Add":function(d:*):void
         {
            var db:ByteArray = Serialize(d);
            ret.writeBytes(db,0,db.length);
         }});
         ret.position = 0;
         return ret;
      }
      
      private function serialize(o:*) : ByteArray
      {
         var l:ByteArray = null;
         var res:ByteArray = null;
         var t:ByteArray = new ByteArray();
         if(o is String)
         {
            res = new ByteArray();
            res.writeUTFBytes(o);
            res.length < 64 ? t.writeByte(ShortStringPattern | res.length) : writeHeader(StringPattern,t,getUIntBytes(res.length));
            t.writeUTFBytes(o);
         }
         if(o is Boolean)
         {
            t.writeByte(o == true ? BooleanTruePattern : BooleanFalsePattern);
         }
         if(o is ByteArray)
         {
            o.position = 0;
            o.length < 64 ? t.writeByte(ShortByteArrayPattern | o.length) : writeHeader(ByteArrayPattern,t,getUIntBytes(o.length));
            t.writeBytes(o,0,o.length);
         }
         if(o is Number)
         {
            l = new ByteArray();
            l.writeInt(o);
            l.position = 0;
            if(l.readInt() == o)
            {
               o >= 0 && o < 64 ? t.writeByte(ShortUnsignedIntPattern | o) : writeHeader(IntPattern,t,trim(l));
            }
            else
            {
               l = new ByteArray();
               l.writeUnsignedInt(o);
               l.position = 0;
               if(l.readUnsignedInt() == o)
               {
                  writeHeader(UnsignedIntPattern,t,trim(l));
               }
               else
               {
                  l = new ByteArray();
                  l.writeFloat(o);
                  l.position = 0;
                  if(l.readFloat() == o)
                  {
                     t.writeByte(FloatPattern);
                     t.writeFloat(o);
                  }
                  else
                  {
                     t.writeByte(DoublePattern);
                     t.writeDouble(o);
                  }
               }
            }
         }
         t.position = 0;
         return t;
      }
      
      private function onMessage(m:MessageEvent) : void
      {
         messageBuilder.removeEventListener("onMessage",onMessage);
         messageBuilder = null;
         this.dispatchEvent(new MessageEvent("onMessage",m.message));
      }
      
      private function onValue(t:TokenEvent) : void
      {
         if(messageBuilder == null)
         {
            messageBuilder = new MessageBuilder();
            messageBuilder.addEventListener("onMessage",onMessage);
         }
         tokenBuilder.removeEventListener("onValue",onValue);
         tokenBuilder = null;
         messageBuilder.AddValue(t.Value);
      }
      
      private function writeHeader(head:int, t:ByteArray, l:ByteArray) : void
      {
         t.writeByte(head | l.length - 1);
         l.position = 0;
         t.writeBytes(l,0,l.length);
      }
      
      private function getUIntBytes(l:int) : ByteArray
      {
         var ob:ByteArray = new ByteArray();
         ob.writeUnsignedInt(l);
         return trim(ob);
      }
      
      private function trim(b:ByteArray) : ByteArray
      {
         var a:int = 0;
         var ret:ByteArray = new ByteArray();
         ret.position = 0;
         b.position = 0;
         for(a = 0; a < b.length; )
         {
            if(b.readUnsignedByte() != 0)
            {
               ret.writeBytes(b,a,b.length - a);
               return ret;
            }
            a++;
         }
         return ret;
      }
   }
}

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.utils.ByteArray;
import playerio.Message;
import playerio.MessageEvent;

class MessageBuilder extends EventDispatcher
{
   
   private var message:Message;
   
   private var length:int = -1;
   
   public function MessageBuilder()
   {
      super();
      this.message = new Message("");
   }
   
   public function AddValue(d:*) : void
   {
      if(length == -1)
      {
         length = d;
      }
      else
      {
         if(message.type == "")
         {
            message.type = d;
         }
         else
         {
            message.add(d);
         }
         if(length == message.length)
         {
            dispatchEvent(new MessageEvent("onMessage",message));
         }
      }
   }
}

class TokenBuilder extends EventDispatcher
{
   
   private var token:Token;
   
   private var offset:uint = 0;
   
   private var length:uint = 1;
   
   private var tba:ByteArray = new ByteArray();
   
   public function TokenBuilder(token:Token)
   {
      super();
      this.token = token;
   }
   
   public function AddByte(b:int) : void
   {
      tba.writeByte(b);
      if(tba.length == length)
      {
         tba.position = 0;
         if(offset == token.length - 1)
         {
            dispatchEvent(new TokenEvent("onValue",token.Handlers[token.Handlers.length - 1](tba)));
         }
         else
         {
            length = token.Handlers[offset](tba);
            tba = new ByteArray();
            offset++;
            if(length == 0)
            {
               dispatchEvent(new TokenEvent("onValue",token.Handlers[token.Handlers.length - 1](tba)));
            }
         }
      }
   }
}

class Token
{
   
   public var Handlers:Array;
   
   public var Type:uint;
   
   public function Token(type:uint, ... args)
   {
      var a:int = 0;
      Handlers = [];
      super();
      Type = type;
      for(a = 0; a < args.length; )
      {
         Handlers.push(args[a]);
         a++;
      }
   }
   
   public function get length() : int
   {
      return Handlers.length;
   }
}

class TokenEvent extends Event
{
   
   public static const ON_VALUE:String = "onValue";
   
   public var Value:*;
   
   public function TokenEvent(type:String, value:*)
   {
      this.Value = value;
      super(type);
   }
   
   override public function clone() : Event
   {
      return new TokenEvent(type,Value);
   }
}
