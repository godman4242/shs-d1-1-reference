package
{
   public class §1t111s0§
   {
      
      public var §1t765s0§:Vector.<§1t400s0§> = new Vector.<§1t400s0§>();
      
      public function §1t111s0§(param1:XML)
      {
         super();
         var _loc2_:int = param1.menu.length();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.§1t765s0§.push(new §1t400s0§(param1.menu[_loc3_]));
            _loc3_++;
         }
         this.§1t765s0§.fixed = true;
      }
   }
}

