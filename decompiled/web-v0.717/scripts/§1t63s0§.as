package
{
   public class §1t63s0§
   {
      
      private var §1t1406s0§:§1t98s0§ = new §1t98s0§();
      
      private var §1t1407s0§:§1t98s0§ = new §1t98s0§();
      
      public var chance:Number;
      
      private var §1t1409s0§:String;
      
      public function §1t63s0§(param1:XML)
      {
         super();
         this.§1t1406s0§.§1t695s0§(param1.id);
         this.§1t1409s0§ = this.encrypt(param1.itemcode.toString());
         if(param1.qty.toString() == "")
         {
            this.§1t1407s0§.§1t695s0§(1);
         }
         else
         {
            this.§1t1407s0§.§1t695s0§(param1.qty);
         }
         if(param1.chance.toString() == "")
         {
            this.chance = 1;
         }
         else
         {
            this.chance = param1.chance;
         }
      }
      
      internal function encrypt(param1:String) : String
      {
         var _loc4_:* = 0;
         if(param1 == "")
         {
            return "";
         }
         var _loc2_:int = param1.length;
         var _loc3_:String = "";
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_)
         {
            _loc4_ = §1t1523s0§.§1t9777s0§(param1,_loc5_);
            _loc4_ = _loc4_ + 1;
            _loc3_ += §1t1523s0§.§1t9778s0§(_loc4_);
            _loc5_++;
         }
         return _loc3_;
      }
      
      public function §1t760s0§() : int
      {
         return this.§1t1406s0§.§1t697s0§();
      }
      
      public function getQty() : int
      {
         return this.§1t1407s0§.§1t697s0§();
      }
      
      public function §1t1411s0§() : String
      {
         var _loc3_:* = 0;
         if(this.§1t1409s0§ == "")
         {
            return "";
         }
         var _loc1_:int = this.§1t1409s0§.length;
         var _loc2_:String = "";
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_)
         {
            _loc3_ = §1t1523s0§.§1t9777s0§(this.§1t1409s0§,_loc4_);
            _loc3_--;
            _loc2_ += §1t1523s0§.§1t9778s0§(_loc3_);
            _loc4_++;
         }
         return _loc2_;
      }
   }
}

