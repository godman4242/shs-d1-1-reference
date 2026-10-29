package
{
   import flash.utils.ByteArray;
   
   public class §1t2266s0§
   {
      
      private var §1t2267s0§:uint;
      
      private var crcTable:Array;
      
      public function §1t2266s0§()
      {
         super();
         this.crcTable = this.§1t2269s0§();
         this.reset();
      }
      
      private function §1t2269s0§() : Array
      {
         var _loc3_:uint = 0;
         var _loc4_:int = 0;
         var _loc1_:Array = new Array(256);
         var _loc2_:int = 0;
         while(_loc2_ < 256)
         {
            _loc3_ = uint(_loc2_);
            _loc4_ = 8;
            while(--_loc4_ >= 0)
            {
               if((_loc3_ & 1) != 0)
               {
                  _loc3_ = uint(0xEDB88320 ^ _loc3_ >>> 1);
               }
               else
               {
                  _loc3_ >>>= 1;
               }
            }
            _loc1_[_loc2_] = _loc3_;
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function §1t2270s0§() : uint
      {
         return this.§1t2267s0§ & 0xFFFFFFFF;
      }
      
      public function reset() : void
      {
         this.§1t2267s0§ = 0;
      }
      
      public function update(param1:ByteArray) : void
      {
         this.§1t2267s0§ = 0;
         var _loc2_:uint = 0;
         var _loc3_:uint = param1.length;
         var _loc4_:uint = uint(~this.§1t2267s0§);
         while(--_loc3_ >= 0)
         {
            _loc4_ = uint(this.crcTable[(_loc4_ ^ param1[_loc2_++]) & 0xFF] ^ _loc4_ >>> 8);
         }
         this.§1t2267s0§ = ~_loc4_;
      }
   }
}

