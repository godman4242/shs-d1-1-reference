package
{
   public class §1t400s0§
   {
      
      public var §1t776s0§:Vector.<§1t766s0§> = new Vector.<§1t766s0§>();
      
      public function §1t400s0§(param1:XML)
      {
         super();
         var _loc2_:int = param1.option.length();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.§1t776s0§.push(new §1t766s0§(param1.option[_loc3_]));
            _loc3_++;
         }
         this.§1t776s0§.fixed = true;
      }
      
      public function §1t777s0§() : int
      {
         return this.§1t776s0§.length;
      }
   }
}

