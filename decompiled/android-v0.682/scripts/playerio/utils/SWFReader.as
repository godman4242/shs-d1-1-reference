package playerio.utils
{
   import flash.geom.*;
   import flash.utils.ByteArray;
   
   public class SWFReader
   {
      
      public var compressed:Boolean;
      
      public var version:uint;
      
      public var fileSize:uint;
      
      private var _dimensions:Rectangle = new Rectangle();
      
      private var _tagCallbackBytesIncludesHeader:Boolean = false;
      
      public var frameRate:uint;
      
      public var totalFrames:uint;
      
      public var asVersion:uint;
      
      public var usesNetwork:Boolean;
      
      public var backgroundColor:uint;
      
      public var protectedFromImport:Boolean;
      
      public var debuggerEnabled:Boolean;
      
      public var metadata:XML;
      
      public var recursionLimit:uint;
      
      public var scriptTimeoutLimit:uint;
      
      public var hardwareAcceleration:uint;
      
      public var tagCallback:Function;
      
      public var parsed:Boolean;
      
      public var errorText:String = "";
      
      private var bytes:ByteArray;
      
      private var currentByte:int;
      
      private var bitPosition:int;
      
      private var currentTag:uint;
      
      private var bgColorFound:Boolean;
      
      private const GET_DATA_SIZE:int = 5;
      
      private const TWIPS_TO_PIXELS:Number = 0.05;
      
      private const TAG_HEADER_ID_BITS:int = 6;
      
      private const TAG_HEADER_MAX_SHORT:int = 63;
      
      private const SWF_C:uint = 67;
      
      private const SWF_F:uint = 70;
      
      private const SWF_W:uint = 87;
      
      private const SWF_S:uint = 83;
      
      private const TAG_ID_EOF:uint = 0;
      
      private const TAG_ID_BG_COLOR:uint = 9;
      
      private const TAG_ID_PROTECTED:uint = 24;
      
      private const TAG_ID_DEBUGGER1:uint = 58;
      
      private const TAG_ID_DEBUGGER2:uint = 64;
      
      private const TAG_ID_SCRIPT_LIMITS:uint = 65;
      
      private const TAG_ID_FILE_ATTS:uint = 69;
      
      private const TAG_ID_META:uint = 77;
      
      private const TAG_ID_SHAPE_1:uint = 2;
      
      private const TAG_ID_SHAPE_2:uint = 22;
      
      private const TAG_ID_SHAPE_3:uint = 32;
      
      private const TAG_ID_SHAPE_4:uint = 83;
      
      public function SWFReader(swfBytes:ByteArray = null)
      {
         super();
         parse(swfBytes);
      }
      
      public function get dimensions() : Rectangle
      {
         return _dimensions;
      }
      
      public function get width() : uint
      {
         return uint(_dimensions.width);
      }
      
      public function get height() : uint
      {
         return uint(_dimensions.height);
      }
      
      public function get tagCallbackBytesIncludesHeader() : Boolean
      {
         return _tagCallbackBytesIncludesHeader;
      }
      
      public function set tagCallbackBytesIncludesHeader(value:Boolean) : void
      {
         _tagCallbackBytesIncludesHeader = value;
      }
      
      public function toString() : String
      {
         var compression:String = null;
         var frames:String = null;
         if(parsed)
         {
            compression = compressed ? "compressed" : "uncompressed";
            frames = totalFrames > 1 ? "frames" : "frame";
            return "[SWF" + version + " AS" + asVersion + ".0: " + totalFrames + " " + frames + " @ " + frameRate + " fps " + _dimensions.width + "x" + _dimensions.height + " " + compression + "]";
         }
         return Object.prototype.toString.call(this);
      }
      
      public function parse(swfBytes:ByteArray) : void
      {
         var swfFC:* = 0;
         var swfW:* = 0;
         var swfS:* = 0;
         var temp:ByteArray = null;
         parseDefaults();
         if(swfBytes == null)
         {
            parseError("Error: Cannot parse a null value.");
            return;
         }
         parsed = true;
         try
         {
            bytes = swfBytes;
            bytes.endian = "littleEndian";
            bytes.position = 0;
            swfFC = bytes.readUnsignedByte();
            swfW = bytes.readUnsignedByte();
            swfS = bytes.readUnsignedByte();
            if(swfFC != 70 && swfFC != 67 || swfW != 87 || swfS != 83)
            {
               parseError("Error: Invalid SWF header.");
               return;
            }
            compressed = swfFC == 67;
            version = bytes.readUnsignedByte();
            fileSize = bytes.readUnsignedInt();
            if(compressed)
            {
               temp = new ByteArray();
               bytes.readBytes(temp);
               bytes = temp;
               bytes.endian = "littleEndian";
               bytes.position = 0;
               temp = null;
               bytes.uncompress();
            }
            _dimensions = readRect();
            bytes.position++;
            frameRate = bytes.readUnsignedByte();
            totalFrames = bytes.readUnsignedShort();
         }
         catch(error:Error)
         {
            parseError(error.message);
            return;
         }
         try
         {
            while(readTag())
            {
            }
         }
         catch(error:Error)
         {
            parseError(error.message);
            return;
         }
         bytes = null;
      }
      
      private function parseDefaults() : void
      {
         compressed = false;
         version = 1;
         fileSize = 0;
         _dimensions = new Rectangle();
         frameRate = 12;
         totalFrames = 1;
         metadata = null;
         asVersion = 2;
         usesNetwork = false;
         backgroundColor = 16777215;
         protectedFromImport = false;
         debuggerEnabled = true;
         scriptTimeoutLimit = 256;
         recursionLimit = 15;
         hardwareAcceleration = 0;
         errorText = "";
         bgColorFound = false;
      }
      
      private function parseError(message:String = "Unkown error.") : void
      {
         compressed = false;
         version = 0;
         fileSize = 0;
         _dimensions = new Rectangle();
         frameRate = 0;
         totalFrames = 0;
         metadata = null;
         asVersion = 0;
         usesNetwork = false;
         backgroundColor = 0;
         protectedFromImport = false;
         debuggerEnabled = false;
         scriptTimeoutLimit = 0;
         recursionLimit = 0;
         hardwareAcceleration = 0;
         parsed = false;
         bytes = null;
         errorText = message;
      }
      
      private function paddedHex(value:uint, numChars:int = 6) : String
      {
         var str:String = value.toString(16);
         while(str.length < numChars)
         {
            str = "0" + str;
         }
         return "0x" + str;
      }
      
      private function readString() : String
      {
         var i:uint = bytes.position;
         try
         {
            while(bytes[i] != 0)
            {
               i++;
            }
         }
         catch(error:Error)
         {
            return "";
         }
         return bytes.readUTFBytes(i - bytes.position);
      }
      
      private function readRect() : Rectangle
      {
         nextBitByte();
         var rect:Rectangle = new Rectangle();
         var dataSize:uint = readBits(5);
         rect.left = readBits(dataSize,true) * 0.05;
         rect.right = readBits(dataSize,true) * 0.05;
         rect.top = readBits(dataSize,true) * 0.05;
         rect.bottom = readBits(dataSize,true) * 0.05;
         return rect;
      }
      
      private function readMatrix() : Matrix
      {
         var dataSize:* = 0;
         nextBitByte();
         var matrix:Matrix = new Matrix();
         if(readBits(1))
         {
            dataSize = uint(readBits(5));
            matrix.a = readBits(dataSize,true);
            matrix.d = readBits(dataSize,true);
         }
         if(readBits(1))
         {
            dataSize = uint(readBits(5));
            matrix.b = readBits(dataSize,true);
            matrix.c = readBits(dataSize,true);
         }
         dataSize = uint(readBits(5));
         matrix.tx = readBits(dataSize,true) * 0.05;
         matrix.ty = readBits(dataSize,true) * 0.05;
         return matrix;
      }
      
      private function readBits(numBits:uint, signed:Boolean = false) : Number
      {
         var mask:* = 0;
         var firstValue:* = 0;
         var over:* = 0;
         var value:Number = 0;
         var remaining:uint = 8 - bitPosition;
         if(numBits <= remaining)
         {
            mask = uint((1 << numBits) - 1);
            value = currentByte >> remaining - numBits & mask;
            if(numBits == remaining)
            {
               nextBitByte();
            }
            else
            {
               bitPosition += numBits;
            }
         }
         else
         {
            mask = uint((1 << remaining) - 1);
            firstValue = uint(currentByte & mask);
            over = uint(numBits - remaining);
            nextBitByte();
            value = firstValue << over | readBits(over);
         }
         if(signed && value >> numBits - 1 == 1)
         {
            remaining = 32 - numBits;
            mask = uint((1 << remaining) - 1);
            return mask << numBits | value;
         }
         return uint(value);
      }
      
      private function nextBitByte() : void
      {
         currentByte = bytes.readByte();
         bitPosition = 0;
      }
      
      private function readTag() : Boolean
      {
         var currentTagPosition:uint = bytes.position;
         var tagHeader:int = int(bytes.readUnsignedShort());
         currentTag = tagHeader >> 6;
         var tagLength:uint = uint(tagHeader & 0x3F);
         if(tagLength == 63)
         {
            tagLength = bytes.readUnsignedInt();
         }
         var nextTagPosition:uint = bytes.position + tagLength;
         var moreTags:Boolean = readTagData(tagLength,currentTagPosition,nextTagPosition);
         if(!moreTags)
         {
            return false;
         }
         bytes.position = nextTagPosition;
         return true;
      }
      
      private function readTagData(tagLength:uint, start:uint, end:uint) : Boolean
      {
         var tagBytes:ByteArray = null;
         if(tagCallback != null)
         {
            tagBytes = new ByteArray();
            if(_tagCallbackBytesIncludesHeader)
            {
               tagBytes.writeBytes(bytes,start,end - start);
            }
            else if(tagLength)
            {
               tagBytes.writeBytes(bytes,bytes.position,tagLength);
            }
            tagBytes.position = 0;
            tagCallback(currentTag,tagBytes);
         }
         switch(currentTag)
         {
            case 69:
               nextBitByte();
               readBits(1);
               hardwareAcceleration = readBits(2);
               readBits(1);
               asVersion = readBits(1) && version >= 9 ? 3 : 2;
               readBits(2);
               usesNetwork = readBits(1) == 1;
               break;
            case 77:
               try
               {
                  metadata = new XML(readString());
               }
               catch(error:Error)
               {
               }
               break;
            case 9:
               if(!bgColorFound)
               {
                  bgColorFound = true;
                  backgroundColor = readRGB();
               }
               break;
            case 24:
               protectedFromImport = bytes.readUnsignedByte() != 0;
               break;
            case 58:
               if(version == 5)
               {
                  debuggerEnabled = true;
               }
               break;
            case 64:
               if(version > 5)
               {
                  debuggerEnabled = true;
               }
               break;
            case 65:
               recursionLimit = bytes.readUnsignedShort();
               scriptTimeoutLimit = bytes.readUnsignedShort();
               break;
            case 0:
               return false;
         }
         return true;
      }
      
      private function readRGB() : uint
      {
         return bytes.readUnsignedByte() << 16 | bytes.readUnsignedByte() << 8 | bytes.readUnsignedByte();
      }
      
      private function readARGB() : uint
      {
         return bytes.readUnsignedByte() << 24 | bytes.readUnsignedByte() << 16 | bytes.readUnsignedByte() << 8 | bytes.readUnsignedByte();
      }
      
      private function readRGBA() : uint
      {
         var rByte:uint = bytes.readUnsignedByte();
         var gByte:uint = bytes.readUnsignedByte();
         var bByte:uint = bytes.readUnsignedByte();
         var aByte:uint = bytes.readUnsignedByte();
         return aByte << 24 | rByte << 16 | gByte << 8 | bByte;
      }
   }
}

