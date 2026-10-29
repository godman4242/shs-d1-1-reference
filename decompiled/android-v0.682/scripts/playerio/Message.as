package playerio
{
   import flash.utils.ByteArray;
   
   public class Message
   {
      
      private var content:Array;
      
      private var _type:String;
      
      public function Message(type:String, ... args)
      {
         var a:int = 0;
         content = [];
         super();
         this._type = type;
         for(a = 0; a < args.length; )
         {
            _add(args[a]);
            a++;
         }
      }
      
      public function add(... args) : void
      {
         var a:int = 0;
         for(a = 0; a < args.length; )
         {
            _add(args[a]);
            a++;
         }
      }
      
      public function getNumber(index:int) : Number
      {
         return content[index] as Number;
      }
      
      public function getInt(index:int) : int
      {
         return content[index] as int;
      }
      
      public function getUInt(index:int) : uint
      {
         return content[index] as uint;
      }
      
      public function getString(index:int) : String
      {
         return content[index].toString();
      }
      
      public function getBoolean(index:int) : Boolean
      {
         return content[index] as Boolean;
      }
      
      public function getByteArray(index:int) : ByteArray
      {
         return content[index] as ByteArray;
      }
      
      public function getObject(index:int) : *
      {
         return content[index];
      }
      
      public function clone(to:Object) : void
      {
         var a:int = 0;
         for(a = 0; a < content.length; )
         {
            to.Add(content[a]);
            a++;
         }
      }
      
      public function get length() : int
      {
         return content.length;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function set type(type:String) : void
      {
         _type = type;
      }
      
      public function toString() : String
      {
         var a:int = 0;
         var ce:* = undefined;
         var ta:ByteArray = null;
         var ret:String = "[playerio.Message]\n";
         ret += "type:\t\t" + type + "\n";
         ret += "length:\t\t" + length + "\n";
         ret += "content:\tId\tType\t\tValue\n";
         ret += "\t\t\t---------------------\n";
         for(a = 0; a < content.length; )
         {
            ce = content[a];
            if(ce === undefined)
            {
               ret += "\t\t\t" + a + "\tundefined\t\t" + ce + "\n";
            }
            else if(ce is String)
            {
               ret += "\t\t\t" + a + "\tString\t\t" + ce + "\n";
            }
            else if(ce is Boolean)
            {
               ret += "\t\t\t" + a + "\tBoolean\t\t" + ce + "\n";
            }
            else if(ce is ByteArray)
            {
               ret += "\t\t\t" + a + "\tByteArray\tLength:" + ce.length + "\n";
            }
            else
            {
               ta = new ByteArray();
               ta.writeInt(ce);
               ta.position = 0;
               switch(ce)
               {
                  case ta.readInt():
                     ret += "\t\t\t" + a + "\tint\t\t\t" + ce + "\n";
                     break;
                  case ta = new ByteArray(),ta.writeUnsignedInt(ce),ta.position = 0,ta.readUnsignedInt():
                     ret += "\t\t\t" + a + "\tuint\t\t" + ce + "\n";
                     break;
                  case ta = new ByteArray(),ta.writeFloat(ce),ta.position = 0,ta.readFloat():
                     ret += "\t\t\t" + a + "\tFloat\t\t" + ce + "\n";
                     break;
                  default:
                     ret += "\t\t\t" + a + "\tDouble\t\t" + ce + "\n";
               }
            }
            a++;
         }
         return ret;
      }
      
      private function _add(o:*) : void
      {
         if(o is Number || o is Boolean || o is String || o is ByteArray)
         {
            content.push(o);
            return;
         }
         throw new Error(typeof o + " is not yet supported");
      }
   }
}

