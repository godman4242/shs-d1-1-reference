package com.protobuf
{
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   public class CodedInputStream
   {
      
      private static const DEFAULT_RECURSION_LIMIT:int = 64;
      
      private static const DEFAULT_SIZE_LIMIT:int = 67108864;
      
      private var bufferSize:int;
      
      private var bufferSizeAfterLimit:int = 0;
      
      private var bufferPos:int = 0;
      
      private var input:IDataInput;
      
      private var lastTag:int = 0;
      
      private var sizeLimit:int = 67108864;
      
      public function CodedInputStream(input:IDataInput)
      {
         super();
         this.bufferSize = 0;
         this.input = input;
      }
      
      public static function newInstance(input:IDataInput) : CodedInputStream
      {
         return new CodedInputStream(input);
      }
      
      public static function decodeZigZag32(n:int) : int
      {
         return n >>> 1 ^ -(n & 1);
      }
      
      public function readTag() : int
      {
         if(input.bytesAvailable != 0)
         {
            lastTag = readRawVarint32();
         }
         else
         {
            lastTag = 0;
         }
         return lastTag;
      }
      
      public function checkLastTagWas(value:int) : void
      {
         if(lastTag != value)
         {
            throw InvalidProtocolBufferException.invalidEndTag();
         }
      }
      
      public function skipField(tag:int) : Boolean
      {
         switch(WireFormat.getTagWireType(tag))
         {
            case 0:
               while(input.readUnsignedByte() > 128)
               {
               }
               return true;
            case 2:
               skipRawBytes(readRawVarint32());
               return true;
            case 3:
               skipMessage();
               checkLastTagWas(WireFormat.makeTag(WireFormat.getTagFieldNumber(tag),4));
               return true;
            case 4:
               return false;
            case 5:
               readRawLittleEndian32();
               return true;
            default:
               throw InvalidProtocolBufferException.invalidWireType();
         }
      }
      
      public function skipMessage() : void
      {
         var tag:int = 0;
         do
         {
            tag = readTag();
         }
         while(!(tag == 0 || !skipField(tag)));
      }
      
      public function readDouble() : Number
      {
         var b1:int = readRawByte();
         var b2:int = readRawByte();
         var b3:int = readRawByte();
         var b4:int = readRawByte();
         var b5:int = readRawByte();
         var b6:int = readRawByte();
         var b7:int = readRawByte();
         var b8:int = readRawByte();
         var ba:ByteArray = new ByteArray();
         ba.writeByte(b8);
         ba.writeByte(b7);
         ba.writeByte(b6);
         ba.writeByte(b5);
         ba.writeByte(b4);
         ba.writeByte(b3);
         ba.writeByte(b2);
         ba.writeByte(b1);
         ba.position = 0;
         return ba.readDouble();
      }
      
      public function readFloat() : Number
      {
         var b1:int = readRawByte();
         var b2:int = readRawByte();
         var b3:int = readRawByte();
         var b4:int = readRawByte();
         var ba:ByteArray = new ByteArray();
         ba.writeByte(b4);
         ba.writeByte(b3);
         ba.writeByte(b2);
         ba.writeByte(b1);
         ba.position = 0;
         return ba.readFloat();
      }
      
      public function readInt32() : int
      {
         return readRawVarint32();
      }
      
      public function readFixed32() : int
      {
         return readRawLittleEndian32();
      }
      
      public function readBool() : Boolean
      {
         return readRawVarint32() != 0;
      }
      
      public function readString() : String
      {
         var size:int = readRawVarint32();
         return new String(readRawBytes(size));
      }
      
      public function readBytes() : ByteArray
      {
         var size:int = readRawVarint32();
         return readRawBytes(size);
      }
      
      public function readUInt32() : int
      {
         return readRawVarint32();
      }
      
      public function readEnum() : int
      {
         return readRawVarint32();
      }
      
      public function readSFixed32() : int
      {
         return readRawLittleEndian32();
      }
      
      public function readSInt32() : int
      {
         return decodeZigZag32(readRawVarint32());
      }
      
      public function readPrimitiveField(type:int) : Object
      {
         switch(type - 1)
         {
            case 0:
               return readDouble();
            case 1:
               return readFloat();
            case 2:
               return readInt64();
            case 4:
               return readInt32();
            case 6:
               return readFixed32();
            case 7:
               return readBool();
            case 8:
               return readString();
            case 11:
               return readBytes();
            case 12:
               return readUInt32();
            case 13:
               return readEnum();
            case 14:
               return readSFixed32();
            case 16:
               return readSInt32();
            default:
               trace("Unknown primative field type: " + type);
               return null;
         }
      }
      
      public function readInt64() : Number
      {
         var o2:int = 0;
         var a:int = 0;
         var a3:int = 0;
         var tmp:Number = input.readUnsignedByte();
         var offset:int = 0;
         var vals:Array = [];
         while(tmp >= 128)
         {
            vals[offset++] = tmp & 0x7F;
            tmp = input.readUnsignedByte();
         }
         vals[offset++] = tmp;
         var isNeg:Boolean = false;
         if(vals.length == 10)
         {
            isNeg = true;
            vals.pop();
            vals[0]--;
            o2 = 0;
            while(vals[o2] < 0)
            {
               vals[o2] = 127;
               vals[o2 + 1]--;
            }
            for(a = 0; a < vals.length; )
            {
               vals[a] = 0x7F ^ vals[a];
               a++;
            }
         }
         var num:Number = 0;
         var mod:Number = 1;
         for(a3 = 0; a3 < vals.length; )
         {
            num += vals[a3] * mod;
            mod *= 128;
            a3++;
         }
         return isNeg ? -num : num;
      }
      
      public function readRawVarint32() : int
      {
         var i:int = 0;
         var tmp:int = readRawByte();
         if(tmp >= 0)
         {
            return tmp;
         }
         var result:int = tmp & 0x7F;
         tmp = readRawByte();
         if(tmp >= 0)
         {
            result |= tmp << 7;
         }
         else
         {
            result |= (tmp & 0x7F) << 7;
            tmp = readRawByte();
            if(tmp >= 0)
            {
               result |= tmp << 14;
            }
            else
            {
               result |= (tmp & 0x7F) << 14;
               tmp = readRawByte();
               if(tmp >= 0)
               {
                  result |= tmp << 21;
               }
               else
               {
                  result |= (tmp & 0x7F) << 21;
                  result |= (tmp = readRawByte()) << 28;
                  if(tmp < 0)
                  {
                     for(i = 0; i < 5; )
                     {
                        if(readRawByte() >= 0)
                        {
                           return result;
                        }
                        i++;
                     }
                     throw InvalidProtocolBufferException.malformedVarint();
                  }
               }
            }
         }
         return result;
      }
      
      public function readRawLittleEndian32() : int
      {
         var b1:int = readRawByte();
         var b2:int = readRawByte();
         var b3:int = readRawByte();
         var b4:int = readRawByte();
         return b1 & 0xFF | (b2 & 0xFF) << 8 | (b3 & 0xFF) << 16 | (b4 & 0xFF) << 24;
      }
      
      public function readRawByte() : int
      {
         return input.readByte();
      }
      
      public function readRawBytes(size:int) : ByteArray
      {
         if(size < 0)
         {
            throw InvalidProtocolBufferException.negativeSize();
         }
         var bytes:ByteArray = new ByteArray();
         if(size != 0)
         {
            input.readBytes(bytes,0,size);
         }
         return bytes;
      }
      
      public function skipRawBytes(size:int) : void
      {
         readRawBytes(size);
      }
   }
}

