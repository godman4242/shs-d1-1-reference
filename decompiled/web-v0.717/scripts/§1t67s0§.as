package
{
   public class §1t67s0§
   {
      
      public static var §1t9116s0§:int = 0;
      
      public static var §1t9117s0§:int = 1;
      
      public static var §1t9118s0§:int = 2;
      
      public static var §1t9119s0§:int = 3;
      
      public static var §1t9120s0§:int = 4;
      
      public static var §1t9121s0§:int = 5;
      
      public static var §1t9122s0§:int = 6;
      
      public static var §1t9123s0§:int = 7;
      
      public static var §1t9124s0§:int = 8;
      
      public static var §1t9125s0§:int = 9;
      
      internal var damage:int = 0;
      
      internal var stance:int = -1;
      
      internal var attackerlvl:int = 0;
      
      internal var §1t1061s0§:int = 0;
      
      internal var §1t1062s0§:int = 0;
      
      internal var §1t1063s0§:int = 0;
      
      internal var §1t1064s0§:int = 0;
      
      internal var §1t1065s0§:int = 0;
      
      internal var §1t1066s0§:int = 0;
      
      internal var §1t1067s0§:int = 0;
      
      internal var §1t1068s0§:int = 0;
      
      internal var §1t1069s0§:int = -1;
      
      private var attacker:§1t68s0§;
      
      internal var §1t1071s0§:Boolean = false;
      
      public function §1t67s0§(param1:int = 0, param2:int = 0, param3:int = 0, param4:int = -1, param5:int = 0, param6:int = 0, param7:int = 0, param8:int = 0)
      {
         super();
         this.damage = param1;
         this.§1t1066s0§ = param3;
         this.attackerlvl = param2;
         this.stance = param4;
         this.§1t1062s0§ = param5;
         this.§1t1063s0§ = param6;
         this.§1t1064s0§ = param7;
         this.§1t1065s0§ = param8;
      }
      
      public static function §1t9126s0§(param1:String) : §1t67s0§
      {
         var _loc2_:Array = param1.split(",");
         var _loc3_:§1t67s0§ = new §1t67s0§();
         _loc3_.damage = int(_loc2_[0]);
         _loc3_.attackerlvl = int(_loc2_[1]);
         _loc3_.stance = int(_loc2_[2]);
         _loc3_.§1t1062s0§ = int(_loc2_[3]);
         _loc3_.§1t1063s0§ = int(_loc2_[4]);
         _loc3_.§1t1064s0§ = int(_loc2_[5]);
         _loc3_.§1t1065s0§ = int(_loc2_[6]);
         _loc3_.§1t1061s0§ = int(_loc2_[7]);
         _loc3_.§1t1066s0§ = int(_loc2_[8]);
         _loc3_.§1t1067s0§ = int(_loc2_[9]);
         _loc3_.§1t1068s0§ = int(_loc2_[10]);
         _loc3_.§1t1069s0§ = int(_loc2_[11]);
         _loc3_.§1t1071s0§ = _loc2_[12] == "1";
         return _loc3_;
      }
      
      public function §1t1072s0§(param1:int) : *
      {
         this.§1t1061s0§ = param1;
      }
      
      public function §1t1073s0§() : Boolean
      {
         return this.§1t1066s0§ == §1t9117s0§;
      }
      
      public function §1t1074s0§() : *
      {
         if(this.§1t1066s0§ == §1t9117s0§)
         {
            this.§1t1066s0§ = §1t9116s0§;
         }
      }
      
      public function §1t1075s0§() : Boolean
      {
         return this.§1t1066s0§ == §1t9118s0§;
      }
      
      public function §1t1076s0§() : Boolean
      {
         return this.§1t1066s0§ == §1t9119s0§;
      }
      
      public function §1t1077s0§() : Boolean
      {
         return this.§1t1066s0§ == §1t9120s0§;
      }
      
      public function §1t1078s0§() : Boolean
      {
         return this.§1t1066s0§ == §1t9121s0§;
      }
      
      public function §1t1079s0§() : Boolean
      {
         return this.§1t1066s0§ == §1t9125s0§;
      }
      
      public function §1t1080s0§() : Boolean
      {
         return this.§1t1066s0§ == §1t9122s0§;
      }
      
      public function §1t1081s0§() : Boolean
      {
         return this.§1t1066s0§ == §1t9123s0§;
      }
      
      public function §1t1082s0§() : *
      {
         return this.§1t1066s0§ == §1t9124s0§;
      }
      
      public function §1t1083s0§(param1:Boolean) : *
      {
         if(param1)
         {
            this.§1t1067s0§ = 1;
         }
         else
         {
            this.§1t1067s0§ = 0;
         }
      }
      
      public function §1t1084s0§(param1:int, param2:int) : *
      {
         this.§1t1067s0§ = param1;
         this.§1t1068s0§ = param2;
      }
      
      public function §1t1085s0§(param1:int, param2:int) : *
      {
         this.§1t1066s0§ = §1t9119s0§;
         this.§1t1067s0§ = param1;
         this.§1t1068s0§ = param2;
      }
      
      public function §1t1086s0§(param1:int, param2:int = 0) : *
      {
         this.§1t1067s0§ = param1;
         this.§1t1068s0§ = param2;
      }
      
      public function §1t1087s0§() : *
      {
         this.damage = 0;
         this.§1t1062s0§ = 0;
         this.§1t1064s0§ = 0;
         this.§1t1063s0§ = 0;
         this.§1t1065s0§ = 0;
         this.attackerlvl = 0;
         this.§1t1066s0§ = §1t9124s0§;
      }
      
      public function §1t1088s0§() : int
      {
         if(this.damage == 0)
         {
            return 0;
         }
         if(this.attackerlvl == 0)
         {
            return this.damage;
         }
         if(this.attackerlvl <= 10)
         {
            return 1 + this.§1t1061s0§;
         }
         if(this.attackerlvl <= 20)
         {
            return this.attackerlvl / 8 + this.§1t1061s0§;
         }
         if(this.attackerlvl <= 30)
         {
            return this.attackerlvl / 6 + this.§1t1061s0§;
         }
         return this.attackerlvl / 4 + this.§1t1061s0§;
      }
      
      public function §1t1089s0§(param1:§1t68s0§) : *
      {
         this.attacker = param1;
      }
      
      public function §1t1090s0§() : §1t68s0§
      {
         return this.attacker;
      }
      
      public function §1t1091s0§() : String
      {
         if(this.attacker == null)
         {
            return "";
         }
         return this.attacker.nid;
      }
      
      public function §1t1092s0§(param1:int) : *
      {
         this.damage = param1;
      }
      
      public function §1t1093s0§(param1:int) : *
      {
         this.attackerlvl = param1;
      }
      
      public function §1t1094s0§(param1:int) : *
      {
         this.§1t1066s0§ = param1;
      }
      
      public function §1t1095s0§(param1:int) : *
      {
         this.§1t1062s0§ = param1;
      }
      
      public function §1t1096s0§(param1:int) : *
      {
         this.§1t1063s0§ = param1;
      }
      
      public function §1t1097s0§(param1:int) : *
      {
         this.§1t1064s0§ = param1;
      }
      
      public function §1t1098s0§(param1:int) : *
      {
         this.§1t1065s0§ = param1;
      }
      
      public function §1t1099s0§(param1:int) : *
      {
         this.§1t1069s0§ = param1;
      }
      
      public function §1t1100s0§() : String
      {
         var _loc1_:String = "";
         if(this.§1t1066s0§ == §1t9117s0§ || this.§1t1066s0§ == §1t9118s0§)
         {
            _loc1_ = this.§1t1066s0§ + "," + this.§1t1067s0§;
         }
         else if(this.§1t1066s0§ == §1t9119s0§ || this.§1t1066s0§ == §1t9120s0§ || this.§1t1066s0§ == §1t9122s0§ || this.§1t1066s0§ == §1t9123s0§)
         {
            _loc1_ = this.§1t1066s0§ + "," + this.§1t1067s0§ + "," + this.§1t1068s0§;
         }
         else if(this.§1t1066s0§ == §1t9121s0§)
         {
            _loc1_ = this.§1t1066s0§ + "," + this.§1t1067s0§ + "," + this.§1t1068s0§ + "," + this.attackerlvl;
         }
         else if(this.§1t1066s0§ == §1t9125s0§)
         {
            _loc1_ = this.§1t1066s0§ + "," + this.§1t1067s0§ + "," + this.§1t1068s0§;
         }
         else
         {
            _loc1_ = this.§1t1066s0§.toString();
         }
         if(this.§1t1069s0§ != -1)
         {
            _loc1_ += "," + this.§1t1069s0§;
         }
         return _loc1_;
      }
      
      public function §1t1101s0§(param1:Boolean) : String
      {
         var _loc2_:String = this.damage + "," + this.attackerlvl + "," + this.stance + "," + this.§1t1062s0§ + "," + this.§1t1063s0§ + "," + this.§1t1064s0§ + "," + this.§1t1065s0§ + "," + this.§1t1061s0§ + "," + this.§1t1066s0§ + "," + this.§1t1067s0§ + "," + this.§1t1068s0§ + "," + this.§1t1069s0§;
         if(param1)
         {
            _loc2_ += ",1";
         }
         else
         {
            _loc2_ += ",0";
         }
         return _loc2_;
      }
   }
}

