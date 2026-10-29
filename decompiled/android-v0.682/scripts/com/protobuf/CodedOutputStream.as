package com.protobuf
{
   import flash.utils.ByteArray;
   import flash.utils.IDataOutput;
   
   public final class CodedOutputStream
   {
      
      public static const DEFAULT_BUFFER_SIZE:int = 4096;
      
      public static var LITTLE_ENDIAN_32_SIZE:int = 4;
      
      private var limit:int;
      
      private var position:int;
      
      private var output:IDataOutput;
      
      public function CodedOutputStream(output:IDataOutput)
      {
         super();
         this.output = output;
         this.limit = 4096;
      }
      
      public static function newInstance(output:IDataOutput) : CodedOutputStream
      {
         return new CodedOutputStream(output);
      }
      
      public static function computeVarint64Size(fieldNumber:int, value:Number) : int
      {
         return computeTagSize(fieldNumber) + computeRawVarint64Size(value);
      }
      
      public static function computeRawVarint64Size(num:Number) : int
      {
         if(num < 0)
         {
            return 10;
         }
         var size:int = 1;
         while(num > 128)
         {
            num = Math.floor(num / 128);
            size++;
         }
         return size;
      }
      
      public static function computeFieldSize(number:int, value:*, type:int) : int
      {
         if(value is String)
         {
            return computeStringSize(number,value as String);
         }
         if(value is Boolean)
         {
            return computeBoolSize(number,value as Boolean);
         }
         if(value is Number && type == 13)
         {
            return computeUInt32Size(number,value as uint);
         }
         if(value is Number && type == 5)
         {
            return computeInt32Size(number,value as int);
         }
         if(value is Number && type == 2)
         {
            return computeFloatSize(number,value as Number);
         }
         if(value is Number && type == 1)
         {
            return computeDoubleSize(number,value as Number);
         }
         if(value is Number && type == 3)
         {
            return computeVarint64Size(number,value as Number);
         }
         if(value is Number)
         {
            return computeInt32Size(number,value as Number);
         }
         if(value is Message)
         {
            return value.getSerializedSize();
         }
         throw new InvalidProtocolBufferException("Could not compute size of field, type was not valid");
      }
      
      public static function computeDoubleSize(fieldNumber:int, value:Number) : int
      {
         return computeTagSize(fieldNumber) + LITTLE_ENDIAN_32_SIZE;
      }
      
      public static function computeFloatSize(fieldNumber:int, value:Number) : int
      {
         return computeTagSize(fieldNumber) + LITTLE_ENDIAN_32_SIZE;
      }
      
      public static function computeInt32Size(fieldNumber:int, value:int) : int
      {
         if(value >= 0)
         {
            return computeTagSize(fieldNumber) + computeRawVarint32Size(value);
         }
         return computeTagSize(fieldNumber) + 10;
      }
      
      public static function computeFixed32Size(fieldNumber:int, value:int) : int
      {
         return computeTagSize(fieldNumber) + LITTLE_ENDIAN_32_SIZE;
      }
      
      public static function computeBoolSize(fieldNumber:int, value:Boolean) : int
      {
         return computeTagSize(fieldNumber) + 1;
      }
      
      public static function computeStringSize(fieldNumber:int, value:String) : int
      {
         var bytes:ByteArray = new ByteArray();
         bytes.writeUTFBytes(value);
         return computeTagSize(fieldNumber) + computeRawVarint32Size(bytes.length) + bytes.length;
      }
      
      public static function computeGroupSize(fieldNumber:int, value:Message) : int
      {
         return computeTagSize(fieldNumber) * 2 + value.getSerializedSize();
      }
      
      public static function computeMessageSize(fieldNumber:int, value:Message) : int
      {
         var size:int = value.getSerializedSize();
         return computeTagSize(fieldNumber) + computeRawVarint32Size(size) + size;
      }
      
      public static function computeBytesSize(fieldNumber:int, value:ByteArray) : int
      {
         var len:int = int(value.length);
         return computeTagSize(fieldNumber) + computeRawVarint32Size(len) + len;
      }
      
      public static function computeUInt32Size(fieldNumber:int, value:int) : int
      {
         return computeTagSize(fieldNumber) + computeRawVarint32Size(value);
      }
      
      public static function computeEnumSize(fieldNumber:int, value:int) : int
      {
         return computeTagSize(fieldNumber) + computeRawVarint32Size(value);
      }
      
      public static function computeSFixed32Size(fieldNumber:int, value:int) : int
      {
         return computeTagSize(fieldNumber) + LITTLE_ENDIAN_32_SIZE;
      }
      
      public static function computeSInt32Size(fieldNumber:int, value:int) : int
      {
         return computeTagSize(fieldNumber) + computeRawVarint32Size(encodeZigZag32(value));
      }
      
      public static function computeMessageSetExtensionSize(fieldNumber:int, value:Message) : int
      {
         return computeTagSize(1) * 2 + computeUInt32Size(2,fieldNumber) + computeMessageSize(3,value);
      }
      
      public static function computeRawMessageSetExtensionSize(fieldNumber:int, value:String) : int
      {
         var bytesVal:* = null;
         bytesVal.writeUTFBytes(value);
         return computeTagSize(1) * 2 + computeUInt32Size(2,fieldNumber) + computeBytesSize(3,bytesVal);
      }
      
      public static function computeTagSize(fieldNumber:int) : int
      {
         return computeRawVarint32Size(WireFormat.makeTag(fieldNumber,0));
      }
      
      public static function computeRawVarint32Size(value:int) : int
      {
         if((value & -128) == 0)
         {
            return 1;
         }
         if((value & -16384) == 0)
         {
            return 2;
         }
         if((value & -2097152) == 0)
         {
            return 3;
         }
         if((value & -268435456) == 0)
         {
            return 4;
         }
         return 5;
      }
      
      public static function encodeZigZag32(n:int) : int
      {
         return n << 1 ^ n >> 31;
      }
      
      public function writeVariableInt64(fieldNumber:int, value:Number) : void
      {
         writeTag(fieldNumber,0);
         writeRawVariableInt64(value);
      }
      
      public function writeRawVariableInt64(num:Number) : void
      {
         var binary:Array = null;
         var binary2:Array = null;
         var offset:Number = NaN;
         var a:int = 0;
         var o2:int = 0;
         var a2:int = 0;
         var a3:int = 0;
         var cut:int = 0;
         if(num < 0)
         {
            num = Math.abs(num);
            binary = [0,0,0,0,0,0,0,0,0];
            binary2 = [127,127,127,127,127,127,127,127,127,1];
            offset = 0;
            while(num >= 128)
            {
               binary[offset++] = num & 0x7F;
               num = Math.floor(num / 128);
            }
            binary[offset++] = num & 0x7F;
            for(a = 0; a < binary.length; )
            {
               binary2[a] ^= binary[a];
               a++;
            }
            binary2[0]++;
            o2 = 0;
            while(binary2[o2] > 127)
            {
               binary2[o2] = 0;
               binary2[o2 + 1]++;
            }
            for(a2 = 0; a2 < binary2.length - 1; )
            {
               binary2[a2] |= 128;
               a2++;
            }
            for(a3 = 0; a3 < binary2.length; )
            {
               writeRawByte(binary2[a3]);
               a3++;
            }
         }
         else
         {
            while(num >= 128)
            {
               cut = num & 0x7F | 0x80;
               writeRawByte(cut);
               num = Math.floor(num / 128);
            }
            writeRawByte(num);
         }
      }
      
      public function writeDouble(fieldNumber:int, value:Number) : void
      {
         writeTag(fieldNumber,1);
         writeRawDouble(value);
      }
      
      public function writeRawDouble(value:Number) : void
      {
         var bytes:ByteArray = new ByteArray();
         bytes.writeDouble(value);
         bytes.position = 0;
         var b8:int = bytes.readByte();
         var b7:int = bytes.readByte();
         var b6:int = bytes.readByte();
         var b5:int = bytes.readByte();
         var b4:int = bytes.readByte();
         var b3:int = bytes.readByte();
         var b2:int = bytes.readByte();
         var b1:int = bytes.readByte();
         writeRawByte(b1);
         writeRawByte(b2);
         writeRawByte(b3);
         writeRawByte(b4);
         writeRawByte(b5);
         writeRawByte(b6);
         writeRawByte(b7);
         writeRawByte(b8);
      }
      
      public function writeFloat(fieldNumber:int, value:Number) : void
      {
         writeTag(fieldNumber,5);
         writeRawFloat(value);
      }
      
      public function writeRawFloat(value:Number) : void
      {
         var bytes:ByteArray = new ByteArray();
         bytes.writeFloat(value);
         bytes.position = 0;
         var b4:int = bytes.readByte();
         var b3:int = bytes.readByte();
         var b2:int = bytes.readByte();
         var b1:int = bytes.readByte();
         writeRawByte(b1);
         writeRawByte(b2);
         writeRawByte(b3);
         writeRawByte(b4);
      }
      
      public function writeInt32(fieldNumber:int, value:Number) : void
      {
         writeTag(fieldNumber,0);
         writeRawVarint32(value);
      }
      
      public function writeFixed32(fieldNumber:int, value:int) : void
      {
         writeTag(fieldNumber,5);
         writeRawLittleEndian32(value);
      }
      
      public function writeBool(fieldNumber:int, value:Boolean) : void
      {
         writeTag(fieldNumber,0);
         writeRawByte(value ? 1 : 0);
      }
      
      public function writeString(fieldNumber:int, value:String) : void
      {
         writeTag(fieldNumber,2);
         var bytes:ByteArray = new ByteArray();
         bytes.writeUTFBytes(value);
         writeRawVarint32(bytes.length);
         writeRawBytes(bytes);
      }
      
      public function writeMessage(fieldNumber:int, value:Message) : void
      {
         writeTag(fieldNumber,2);
         var tempStream:ByteArray = new ByteArray();
         value.writeToDataOutput(tempStream);
         tempStream.position = 0;
         writeRawVarint32(tempStream.length);
         output.writeBytes(tempStream,0,tempStream.length);
      }
      
      public function writeBytes(fieldNumber:int, value:ByteArray) : void
      {
         writeTag(fieldNumber,2);
         value.position = 0;
         writeRawVarint32(value.length);
         writeRawBytes(value);
      }
      
      public function writeUInt32(fieldNumber:int, value:int) : void
      {
         writeTag(fieldNumber,0);
         writeRawVarint32(value);
      }
      
      public function writeEnum(fieldNumber:int, value:int) : void
      {
         writeTag(fieldNumber,0);
         writeRawVarint32(value);
      }
      
      public function writeSFixed32(fieldNumber:int, value:int) : void
      {
         writeTag(fieldNumber,5);
         writeRawLittleEndian32(value);
      }
      
      public function writeSInt32(fieldNumber:int, value:int) : void
      {
         writeTag(fieldNumber,0);
         writeRawVarint32(encodeZigZag32(value));
      }
      
      public function writeField(number:int, value:*, type:int) : void
      {
         if(value is String)
         {
            writeString(number,value as String);
         }
         else if(value is Boolean)
         {
            writeBool(number,value as Boolean);
         }
         else if(value is Number && type == 13)
         {
            writeUInt32(number,value as uint);
         }
         else if(value is int && type == 5)
         {
            writeInt32(number,value as int);
         }
         else if(value is Number && type == 2)
         {
            writeFloat(number,value as Number);
         }
         else if(value is Number && type == 1)
         {
            writeDouble(number,value as Number);
         }
         else if(value is Number && type == 3)
         {
            writeVariableInt64(number,value as Number);
         }
         else if(value is Number)
         {
            writeInt32(number,value as Number);
         }
         else
         {
            if(!(value is ByteArray))
            {
               throw new InvalidProtocolBufferException("Tried to write primative field type, but type was not valid");
            }
            writeBytes(number,value as ByteArray);
         }
      }
      
      public function writeRawByte(value:int) : void
      {
         output.writeByte(value);
      }
      
      public function writeRawBytes(value:ByteArray) : void
      {
         writeRawBytesPartial(value,0,value.length);
      }
      
      public function writeRawBytesPartial(value:ByteArray, offset:int, length:int) : void
      {
         output.writeBytes(value,offset,length);
      }
      
      public function writeTag(fieldNumber:int, wireType:int) : void
      {
         writeRawVarint32(WireFormat.makeTag(fieldNumber,wireType));
      }
      
      public function writeRawVarint32(value:int) : void
      {
         while((value & -128) != 0)
         {
            writeRawByte(value & 0x7F | 0x80);
            value >>>= 7;
         }
         writeRawByte(value);
      }
      
      public function writeRawLittleEndian32(value:int) : void
      {
         writeRawByte(value & 0xFF);
         writeRawByte(value >> 8 & 0xFF);
         writeRawByte(value >> 16 & 0xFF);
         writeRawByte(value >> 24 & 0xFF);
      }
   }
}

