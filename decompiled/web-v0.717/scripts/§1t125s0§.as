package
{
   import flash.utils.getDefinitionByName;
   
   public class §1t125s0§
   {
      
      public var §1t797s0§:int;
      
      public var §1t2179s0§:int;
      
      public var nodeid:int;
      
      public var roomid:int;
      
      public var index:int;
      
      public var §1t2181s0§:Boolean;
      
      public function §1t125s0§(param1:int = 0, param2:int = 0)
      {
         super();
         this.§1t797s0§ = param1;
         this.§1t2179s0§ = param2;
      }
      
      public static function parse(param1:String) : §1t125s0§
      {
         var _loc3_:§1t125s0§ = null;
         var _loc2_:Array = param1.split(",");
         if(_loc2_.length == 0)
         {
            return null;
         }
         if(_loc2_[0] == -1)
         {
            _loc3_ = new §1t125s0§(-1);
            _loc3_.§1t1113s0§(_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5] == "1");
            return _loc3_;
         }
         if(_loc2_[0] == 0)
         {
            return null;
         }
         if(_loc2_.length == 2)
         {
            return new §1t125s0§(_loc2_[0],_loc2_[1]);
         }
         return new §1t125s0§(_loc2_[0],0);
      }
      
      public function §1t1113s0§(param1:int, param2:int, param3:int, param4:int, param5:Boolean) : *
      {
         this.nodeid = param1;
         this.roomid = param2;
         this.index = param3;
         this.§1t2179s0§ = param4;
         this.§1t2181s0§ = param5;
      }
      
      public function §1t2182s0§(param1:int, param2:int, param3:int, param4:int) : Boolean
      {
         return this.nodeid == param1 && this.roomid == param2 && this.index == param3 && this.§1t2179s0§ == param4;
      }
      
      public function §1t2183s0§() : Boolean
      {
         return this.§1t797s0§ == -1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = null;
         if(!this.§1t2183s0§() && this.§1t2179s0§ != 0 && this.§1t2179s0§ != §1t3317s0§.instance.§1t1848s0§())
         {
            return "";
         }
         if(this.§1t2183s0§() && this.§1t2179s0§ != §1t3317s0§.instance.§1t1848s0§())
         {
            return "";
         }
         if(this.§1t797s0§ == -1)
         {
            _loc1_ = "0";
            if(this.§1t2181s0§)
            {
               _loc1_ = "1";
            }
            return this.§1t797s0§ + "," + this.nodeid + "," + this.roomid + "," + this.index + "," + this.§1t2179s0§ + "," + _loc1_;
         }
         if(this.§1t2179s0§ == 0)
         {
            return this.§1t797s0§.toString();
         }
         return this.§1t797s0§ + "," + this.§1t2179s0§;
      }
   }
}

