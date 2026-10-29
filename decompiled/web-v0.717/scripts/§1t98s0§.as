package
{
   import flash.utils.ByteArray;
   
   public class §1t98s0§
   {
      
      private var §1t690s0§:ByteArray = new ByteArray();
      
      private var §1t691s0§:int = 33;
      
      internal var ba:ByteArray = new ByteArray();
      
      public function §1t98s0§(param1:int = 0)
      {
         super();
         if(param1 == 0)
         {
            this.§1t691s0§ = §1t1523s0§.§1t9391s0§;
         }
         else
         {
            this.§1t691s0§ = param1;
         }
         this.§1t695s0§(0);
      }
      
      private function §1t692s0§(param1:ByteArray, param2:int) : void
      {
         var _loc3_:int = int(param1.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            param1[_loc4_] ^= param2;
            _loc4_++;
         }
      }
      
      private function §1t694s0§(param1:ByteArray, param2:int) : ByteArray
      {
         this.ba.clear();
         this.ba.writeBytes(param1);
         var _loc3_:int = int(this.ba.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            this.ba[_loc4_] ^= param2;
            _loc4_++;
         }
         this.ba.position = 0;
         return this.ba;
      }
      
      public function §1t695s0§(param1:int) : void
      {
         this.§1t690s0§.clear();
         this.§1t690s0§.writeInt(param1);
         var _loc2_:int = int(this.§1t690s0§.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.§1t690s0§[_loc3_] ^= this.§1t691s0§;
            _loc3_++;
         }
         this.§1t690s0§.position = 0;
      }
      
      public function §1t696s0§() : int
      {
         this.§1t690s0§.position = 0;
         return this.§1t690s0§.readUnsignedInt();
      }
      
      public function §1t697s0§() : int
      {
         return this.§1t694s0§(this.§1t690s0§,this.§1t691s0§).readInt();
      }
      
      public function §1t698s0§(param1:int) : *
      {
         this.§1t695s0§(this.§1t697s0§() + param1);
      }
      
      public function toString() : String
      {
         return this.§1t697s0§().toString();
      }
   }
}

