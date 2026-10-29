package
{
   import flash.utils.getDefinitionByName;
   
   public class §1t100s0§
   {
      
      private var id:int;
      
      private var §1t2178s0§:§1t98s0§;
      
      public function §1t100s0§(param1:int, param2:int)
      {
         super();
         this.id = param1;
         this.§1t2178s0§ = new §1t98s0§();
         this.§1t2178s0§.§1t695s0§(param2);
      }
      
      public static function parse(param1:String, param2:int = 0) : §1t100s0§
      {
         var _loc3_:Array = param1.split(",");
         var _loc4_:int = int(_loc3_[0]);
         if(_loc4_ < param2)
         {
            _loc4_ += param2;
         }
         return new §1t100s0§(_loc4_,_loc3_[1]);
      }
      
      public function §1t760s0§() : int
      {
         return this.id;
      }
      
      public function §1t761s0§() : int
      {
         return this.§1t2178s0§.§1t697s0§();
      }
      
      public function §1t762s0§(param1:int) : *
      {
         this.§1t2178s0§.§1t695s0§(param1);
      }
      
      public function §1t763s0§(param1:int) : *
      {
         this.§1t2178s0§.§1t698s0§(param1);
      }
      
      public function getString(param1:int = 0) : String
      {
         return this.id - param1 + "," + this.§1t761s0§();
      }
   }
}

