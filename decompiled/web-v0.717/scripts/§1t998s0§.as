package
{
   public class §1t998s0§
   {
      
      private var keys:Array;
      
      private var values:Array;
      
      public function §1t998s0§()
      {
         super();
         this.keys = new Array();
         this.values = new Array();
      }
      
      public function put(param1:int, param2:*, param3:Boolean = false) : int
      {
         var _loc4_:int = this.§1t1002s0§(param1);
         if(_loc4_ == -1)
         {
            this.keys.push(param1);
            this.values.push(param2);
            return this.keys.length - 1;
         }
         if(param3)
         {
            this.values[_loc4_] = param2;
            return _loc4_;
         }
         return -1;
      }
      
      public function §1t1002s0§(param1:int) : int
      {
         var _loc2_:int = int(this.keys.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.keys[_loc3_] == param1)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return -1;
      }
      
      public function contains(param1:int) : Boolean
      {
         return this.§1t1002s0§(param1) != -1;
      }
      
      public function get(param1:int) : *
      {
         var _loc2_:int = int(this.keys.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.keys[_loc3_] == param1)
            {
               return this.values[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      public function §1t1005s0§(param1:int) : int
      {
         var _loc2_:int = int(this.keys.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.keys[_loc3_] == param1)
            {
               return this.values[_loc3_];
            }
            _loc3_++;
         }
         return 0;
      }
      
      public function §1t1006s0§() : Array
      {
         return this.keys;
      }
      
      public function §1t1007s0§() : Array
      {
         return this.values;
      }
      
      public function reset() : *
      {
         this.keys.length = 0;
         this.values.length = 0;
      }
   }
}

