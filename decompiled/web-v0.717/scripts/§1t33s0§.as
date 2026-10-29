package
{
   public class §1t33s0§
   {
      
      private var §1t564s0§:Array;
      
      private var §1t978s0§:Array;
      
      internal var §1t979s0§:int = 0;
      
      internal var §1t980s0§:int = 0;
      
      internal var §1t981s0§:int = 0;
      
      internal var §1t982s0§:int = 0;
      
      internal var §1t983s0§:int = 0;
      
      internal var §1t984s0§:int = 0;
      
      internal var §1t985s0§:int = 0;
      
      public function §1t33s0§(param1:XML)
      {
         super();
         this.§1t564s0§ = new Array(§1t24s0§.§1t8754s0§);
         this.§1t978s0§ = new Array(§1t24s0§.§1t8754s0§);
         var _loc2_:int = 0;
         while(_loc2_ < §1t24s0§.§1t8754s0§)
         {
            this.§1t564s0§[_loc2_] = 0;
            this.§1t978s0§[_loc2_] = 0;
            _loc2_++;
         }
         if(param1.cfood.toString() != "")
         {
            this.§1t981s0§ = param1.cfood;
         }
         if(param1.cwood.toString() != "")
         {
            this.§1t982s0§ = param1.cwood;
         }
         if(param1.cmetal.toString() != "")
         {
            this.§1t983s0§ = param1.cmetal;
         }
         if(param1.ccloth.toString() != "")
         {
            this.§1t984s0§ = param1.ccloth;
         }
         if(param1.ccoin.toString() != "")
         {
            this.§1t980s0§ = param1.ccoin;
         }
         if(param1.sfood.toString() != "")
         {
            this.§1t564s0§[§1t24s0§.§1t8749s0§] = int(param1.sfood);
         }
         if(param1.swood.toString() != "")
         {
            this.§1t564s0§[§1t24s0§.§1t8750s0§] = int(param1.swood);
         }
         if(param1.smetal.toString() != "")
         {
            this.§1t564s0§[§1t24s0§.§1t8752s0§] = int(param1.smetal);
         }
         if(param1.scloth.toString() != "")
         {
            this.§1t564s0§[§1t24s0§.§1t8751s0§] = int(param1.scloth);
         }
         if(param1.scoin.toString() != "")
         {
            this.§1t564s0§[§1t24s0§.§1t8748s0§] = int(param1.scoin);
         }
         if(param1.snpc.toString() != "")
         {
            this.§1t564s0§[§1t24s0§.§1t8747s0§] = int(param1.snpc);
         }
         if(param1.sitem.toString() != "")
         {
            this.§1t564s0§[§1t24s0§.§1t8753s0§] = int(param1.sitem);
         }
         if(param1.gfood.toString() != "")
         {
            this.§1t978s0§[§1t24s0§.§1t8749s0§] = int(param1.gfood);
         }
         if(param1.gwood.toString() != "")
         {
            this.§1t978s0§[§1t24s0§.§1t8750s0§] = int(param1.gwood);
         }
         if(param1.gmetal.toString() != "")
         {
            this.§1t978s0§[§1t24s0§.§1t8752s0§] = int(param1.gmetal);
         }
         if(param1.gcloth.toString() != "")
         {
            this.§1t978s0§[§1t24s0§.§1t8751s0§] = int(param1.gcloth);
         }
         if(param1.gcoin.toString() != "")
         {
            this.§1t978s0§[§1t24s0§.§1t8748s0§] = int(param1.gcoin);
         }
         if(param1.gitem.toString() != "")
         {
            this.§1t978s0§[§1t24s0§.§1t8753s0§] = int(param1.gitem);
         }
         if(param1.gtime.toString() != "")
         {
            this.§1t979s0§ = param1.gtime;
         }
         if(param1.towerreq.toString() != "")
         {
            this.§1t985s0§ = param1.towerreq;
         }
      }
      
      public function §1t939s0§(param1:int) : int
      {
         return this.§1t564s0§[param1];
      }
      
      public function §1t986s0§(param1:int) : int
      {
         return this.§1t978s0§[param1];
      }
      
      public function §1t987s0§() : int
      {
         return this.§1t979s0§;
      }
      
      public function §1t988s0§() : int
      {
         var _loc1_:int = 0;
         while(_loc1_ < §1t24s0§.§1t8754s0§)
         {
            if(this.§1t978s0§[_loc1_] > 0)
            {
               return _loc1_;
            }
            _loc1_++;
         }
         return -1;
      }
      
      public function §1t989s0§() : int
      {
         var _loc1_:int = 0;
         while(_loc1_ < §1t24s0§.§1t8754s0§)
         {
            if(this.§1t564s0§[_loc1_] > 0)
            {
               return _loc1_;
            }
            _loc1_++;
         }
         return -1;
      }
      
      public function §1t977s0§() : Array
      {
         var _loc1_:Array = new Array(§1t24s0§.§1t8754s0§);
         _loc1_[§1t24s0§.§1t8747s0§] = 0;
         _loc1_[§1t24s0§.§1t8748s0§] = this.§1t980s0§;
         _loc1_[§1t24s0§.§1t8749s0§] = this.§1t981s0§;
         _loc1_[§1t24s0§.§1t8750s0§] = this.§1t982s0§;
         _loc1_[§1t24s0§.§1t8752s0§] = this.§1t983s0§;
         _loc1_[§1t24s0§.§1t8751s0§] = this.§1t984s0§;
         _loc1_[6] = this.§1t985s0§;
         return _loc1_;
      }
   }
}

