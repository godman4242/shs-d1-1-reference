package
{
   public class §1t77s0§
   {
      
      public var §1t830s0§:§1t98s0§ = new §1t98s0§();
      
      public var loot:Vector.<§1t63s0§> = new Vector.<§1t63s0§>();
      
      public var forShow:Boolean = false;
      
      public function §1t77s0§(param1:XMLList)
      {
         super();
         if(param1 == null)
         {
            this.§1t830s0§.§1t695s0§(0);
            return;
         }
         if(param1.exp.toString() == "")
         {
            this.§1t830s0§.§1t695s0§(0);
         }
         else
         {
            this.§1t830s0§.§1t695s0§(param1.exp);
         }
         if(param1.forshow.toString() == "1")
         {
            this.forShow = true;
         }
         var _loc2_:int = int(param1.loot.length());
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.loot.push(new §1t63s0§(param1.loot[_loc3_]));
            _loc3_++;
         }
      }
      
      public function §1t833s0§() : int
      {
         return this.§1t830s0§.§1t697s0§();
      }
   }
}

