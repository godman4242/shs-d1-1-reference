package
{
   import flash.utils.ByteArray;
   
   public class ObfuscatedObject
   {
      
      private var mBytes:ByteArray = new ByteArray();
      
      private var mKey:int = 33;
      
      public function ObfuscatedObject(key:int = 33)
      {
         super();
         this.mKey = key;
         this.setIntValue(0);
      }
      
      private function xorByteArrayInPlace(source:ByteArray, key:int) : void
      {
         for(var i:int = 0; i < source.length; i++)
         {
            source[i] ^= key;
         }
      }
      
      private function xorByteArray(source:ByteArray, key:int) : ByteArray
      {
         var ba:ByteArray = new ByteArray();
         ba.writeBytes(source);
         for(var i:int = 0; i < ba.length; i++)
         {
            ba[i] ^= key;
         }
         ba.position = 0;
         return ba;
      }
      
      public function setIntValue(source:int) : void
      {
         this.mBytes.position = 0;
         this.mBytes.writeInt(source);
         this.mBytes = this.xorByteArray(this.mBytes,this.mKey);
      }
      
      public function getByteValue() : int
      {
         this.mBytes.position = 0;
         return this.mBytes.readUnsignedInt();
      }
      
      public function getIntValue() : int
      {
         return this.xorByteArray(this.mBytes,this.mKey).readInt();
      }
      
      public function changeIntValue(valueChange:int) : *
      {
         this.setIntValue(this.getIntValue() + valueChange);
      }
      
      public function toString() : String
      {
         return this.getIntValue().toString();
      }
   }
}

