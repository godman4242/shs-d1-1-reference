package
{
   public class §1t3637s0§ extends §1t80s0§
   {
      
      private var §1t1406s0§:§1t98s0§ = new §1t98s0§();
      
      private var §1t3638s0§:§1t98s0§;
      
      private var §1t3639s0§:§1t98s0§;
      
      public var end:int;
      
      internal var hasSet:Boolean = false;
      
      internal var hasModify:Boolean = false;
      
      public function §1t3637s0§(param1:XML)
      {
         super();
         type = "outcome";
         if(param1.id.toString() == "")
         {
            this.§1t1406s0§.§1t695s0§(-1);
         }
         else
         {
            this.§1t1406s0§.§1t695s0§(param1.id);
         }
         if(param1.set.toString() != "")
         {
            this.§1t3638s0§ = new §1t98s0§();
            this.§1t3638s0§.§1t695s0§(param1.set);
            this.hasSet = true;
         }
         if(param1.modify.toString() != "")
         {
            this.§1t3639s0§ = new §1t98s0§();
            this.§1t3639s0§.§1t695s0§(param1.modify);
            this.hasModify = true;
         }
         if(param1.end.toString() == "")
         {
            this.end = 0;
         }
         else
         {
            this.end = param1.end;
         }
      }
      
      public function §1t795s0§() : *
      {
         var _loc2_:int = 0;
         var _loc1_:int = this.§1t1406s0§.§1t697s0§();
         if(_loc1_ >= 0)
         {
            if(this.hasModify)
            {
               _loc2_ = this.§1t3639s0§.§1t697s0§();
               if(_loc1_ == 11 && _loc2_ > 0)
               {
                  §1t406s0§.instance.§1t6488s0§.§1t5846s0§(_loc2_);
               }
               else if(_loc1_ >= 2000 && _loc1_ < 30000 && _loc2_ > 0)
               {
                  §1t406s0§.instance.§1t6488s0§.§1t6186s0§(_loc1_,_loc2_);
               }
               else if(_loc1_ == §1t1523s0§.§1t8755s0§)
               {
                  §1t406s0§.instance.§1t6488s0§.§1t6201s0§(_loc2_);
               }
               else if(_loc1_ > §1t1523s0§.§1t9366s0§)
               {
                  §1t1523s0§.§1t9713s0§(_loc1_,_loc2_);
               }
            }
            else if(this.hasSet)
            {
               if(_loc1_ > §1t1523s0§.§1t9366s0§)
               {
                  §1t1523s0§.§1t9712s0§(_loc1_,this.§1t3638s0§.§1t697s0§());
               }
            }
         }
         if(this.end == -1)
         {
            §1t126s0§.§1t9190s0§().§1t1695s0§();
         }
         else if(this.end == 1)
         {
            §1t126s0§.§1t9190s0§().§1t1696s0§();
         }
         else
         {
            §1t126s0§.§1t9190s0§().§1t813s0§();
         }
      }
   }
}

