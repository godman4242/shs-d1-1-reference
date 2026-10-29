package
{
   public class §1t101s0§
   {
      
      internal var id:int;
      
      internal var value:Boolean;
      
      public function §1t101s0§(param1:int, param2:Boolean)
      {
         super();
         this.id = param1;
         this.value = param2;
      }
      
      public static function parse(param1:String, param2:int = 0) : §1t101s0§
      {
         var _loc3_:Array = param1.split(",");
         var _loc4_:int = int(_loc3_[0]);
         if(_loc4_ < param2)
         {
            _loc4_ += param2;
         }
         return new §1t101s0§(_loc4_,_loc3_[1] == 1);
      }
      
      public function §1t760s0§() : int
      {
         return this.id;
      }
      
      public function §1t761s0§() : Boolean
      {
         return this.value;
      }
      
      public function §1t762s0§(param1:Boolean) : *
      {
         this.value = param1;
      }
      
      public function getString(param1:int = 0) : String
      {
         if(this.value)
         {
            return this.id - param1 + ",1";
         }
         return this.id - param1 + ",0";
      }
   }
}

