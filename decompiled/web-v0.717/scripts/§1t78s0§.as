package
{
   public class §1t78s0§
   {
      
      public static var §1t11506s0§:int = 0;
      
      public static var §1t11507s0§:int = 1;
      
      public static var §1t11508s0§:int = 2;
      
      public static var §1t11509s0§:int = 3;
      
      public static var §1t11510s0§:int = 4;
      
      public static var §1t11511s0§:int = 5;
      
      public static var §1t11512s0§:int = 6;
      
      public static var §1t463s0§:int = 7;
      
      public static var §1t11513s0§:int = 0;
      
      public static var §1t11514s0§:int = 1;
      
      public static var §1t9134s0§:int = 2;
      
      public static var §1t9135s0§:int = 3;
      
      internal var x:int;
      
      internal var y:int;
      
      internal var nodeid:int;
      
      internal var type:int;
      
      internal var §1t1746s0§:Array = [0,0,0,0];
      
      internal var §1t1750s0§:int = -1;
      
      public function §1t78s0§(param1:int, param2:int, param3:int)
      {
         super();
         this.x = param1;
         this.y = param2;
         this.nodeid = param3;
      }
      
      public function toString() : String
      {
         return this.x + "," + this.y;
      }
      
      public function §1t2127s0§(param1:int) : *
      {
         this.type = param1;
      }
      
      public function §1t2128s0§() : int
      {
         return this.type;
      }
      
      public function §1t2129s0§() : int
      {
         return this.nodeid;
      }
      
      public function §1t2130s0§() : int
      {
         return this.x;
      }
      
      public function §1t2131s0§() : int
      {
         return this.y;
      }
      
      public function §1t1756s0§(param1:int) : *
      {
         this.§1t1746s0§[param1] = 1;
         this.§1t1750s0§ = param1;
      }
      
      public function §1t2132s0§() : *
      {
         if(this.§1t1750s0§ != -1)
         {
            this.§1t1746s0§ = [0,0,0,0];
            this.§1t1746s0§[this.§1t1750s0§] = 1;
         }
      }
      
      public function §1t2133s0§(param1:int) : int
      {
         if(param1 == 0)
         {
            return this.§1t1746s0§[1];
         }
         if(param1 == 1)
         {
            return this.§1t1746s0§[0];
         }
         if(param1 == 2)
         {
            return this.§1t1746s0§[3];
         }
         if(param1 == 3)
         {
            return this.§1t1746s0§[2];
         }
         return 0;
      }
      
      public function §1t2134s0§() : int
      {
         return this.§1t1746s0§[0] + this.§1t1746s0§[1] + this.§1t1746s0§[2] + this.§1t1746s0§[3];
      }
      
      public function §1t2135s0§() : Boolean
      {
         return this.§1t1746s0§[0] + this.§1t1746s0§[1] + this.§1t1746s0§[2] + this.§1t1746s0§[3] == 0;
      }
      
      public function §1t1159s0§() : Boolean
      {
         return this.§1t1746s0§[0] + this.§1t1746s0§[1] + this.§1t1746s0§[2] + this.§1t1746s0§[3] == 1;
      }
      
      public function §1t2136s0§() : Boolean
      {
         return this.§1t1746s0§[0] + this.§1t1746s0§[1] + this.§1t1746s0§[2] + this.§1t1746s0§[3] == 3;
      }
      
      public function §1t2137s0§() : Boolean
      {
         return this.§1t1746s0§[0] + this.§1t1746s0§[1] + this.§1t1746s0§[2] + this.§1t1746s0§[3] == 4;
      }
      
      public function §1t1158s0§() : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:int = this.§1t1746s0§[0] + this.§1t1746s0§[1] + this.§1t1746s0§[2] + this.§1t1746s0§[3];
         if(_loc1_ == 2)
         {
            _loc2_ = this.§1t1746s0§[0] + this.§1t1746s0§[1];
            _loc3_ = this.§1t1746s0§[2] + this.§1t1746s0§[3];
            if(_loc2_ == 2 || _loc3_ == 2)
            {
               return true;
            }
         }
         return false;
      }
      
      public function §1t1156s0§() : int
      {
         return this.§1t1746s0§[3] << 3 | this.§1t1746s0§[2] << 2 | this.§1t1746s0§[1] << 1 | this.§1t1746s0§[0];
      }
      
      public function §1t2138s0§(param1:int) : Boolean
      {
         if(param1 == §1t11513s0§ && (this.§1t1746s0§[§1t9134s0§] == 1 || this.§1t1746s0§[§1t9135s0§] == 1))
         {
            return false;
         }
         if(param1 == §1t11514s0§ && (this.§1t1746s0§[§1t9134s0§] == 1 || this.§1t1746s0§[§1t9135s0§] == 1))
         {
            return false;
         }
         if(param1 == §1t9134s0§ && (this.§1t1746s0§[§1t11513s0§] == 1 || this.§1t1746s0§[§1t11514s0§] == 1))
         {
            return false;
         }
         if(param1 == §1t9135s0§ && (this.§1t1746s0§[§1t11513s0§] == 1 || this.§1t1746s0§[§1t11514s0§] == 1))
         {
            return false;
         }
         return true;
      }
   }
}

