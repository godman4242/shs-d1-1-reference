package
{
   public class §1t1701s0§
   {
      
      internal static var §1t11255s0§:String = "^";
      
      internal static var §1t11257s0§:String = "(";
      
      internal static var §1t11258s0§:String = ")";
      
      public static var §1t11259s0§:String = "a";
      
      internal var §1t1702s0§:int;
      
      internal var msg:Object;
      
      internal var §1t1704s0§:String;
      
      internal var time:int;
      
      internal var §1t1705s0§:String = "";
      
      public function §1t1701s0§(param1:int, param2:Object, param3:String, param4:int, param5:Boolean = false)
      {
         super();
         this.§1t1702s0§ = param1;
         this.msg = param2;
         this.§1t1704s0§ = param3;
         this.time = param4;
         if(param5 && param1 != 2)
         {
            this.§1t1705s0§ = this.toString();
         }
      }
      
      public static function parse(param1:String) : Array
      {
         var _loc2_:§1t1701s0§ = null;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:String = null;
         var _loc11_:Object = null;
         var _loc12_:Array = null;
         var _loc3_:Array = param1.split(§1t11258s0§);
         var _loc4_:int = int(_loc3_.length);
         var _loc5_:Array = new Array();
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            if(_loc3_[_loc6_] == "")
            {
               break;
            }
            _loc7_ = _loc3_[_loc6_].split(§1t11255s0§);
            _loc8_ = int(_loc7_[0]);
            _loc9_ = int(_loc7_[1]);
            _loc10_ = _loc7_[2];
            _loc11_ = new Object();
            _loc12_ = _loc7_[3].split(§1t11257s0§);
            switch(_loc9_)
            {
               case 2:
                  _loc11_.charname = _loc12_[0];
                  _loc11_.charlvl = _loc12_[1];
                  _loc11_.stats = _loc12_[2];
                  _loc11_.equip = _loc12_[3];
                  _loc11_.skills = _loc12_[4];
                  _loc11_.taunt = _loc12_[5];
                  _loc11_.bg = _loc12_[6];
                  if(_loc12_.length == 8)
                  {
                     _loc11_.stance = -1;
                     _loc11_.win = _loc12_[7] == "1";
                  }
                  else if(_loc12_.length == 9)
                  {
                     _loc11_.stance = _loc12_[7];
                     _loc11_.win = _loc12_[8] == "1";
                  }
                  break;
               case 6:
                  _loc11_.lineArrayStr = _loc12_[0];
                  if(_loc12_.length == 1)
                  {
                     _loc11_.nid = _loc10_;
                  }
                  else
                  {
                     _loc11_.nid = _loc12_[1];
                  }
                  if(_loc12_.length >= 3)
                  {
                     _loc11_.posX = _loc12_[2];
                  }
                  else
                  {
                     _loc11_.posX = -1;
                  }
                  break;
               case 7:
                  _loc11_.hp = _loc12_[0];
                  _loc11_.victim = _loc12_[1];
                  _loc11_.launched = _loc12_[2];
                  _loc11_.canreject = _loc12_[3];
                  _loc11_.attacker = _loc12_[4];
                  if(_loc12_.length == 6)
                  {
                     _loc11_.effdmg = _loc12_[5];
                  }
                  else
                  {
                     _loc11_.effdmg = 0;
                  }
                  break;
               case 8:
                  _loc11_.stance = _loc12_[0];
                  break;
               case 9:
                  _loc11_.anim = _loc12_[0];
                  break;
               case 10:
                  _loc11_.actionState = _loc12_[0];
                  _loc11_.x = _loc12_[1];
                  _loc11_.y = _loc12_[2];
                  _loc11_.facingRight = _loc12_[3] == "1";
                  if(_loc12_.length == 5)
                  {
                     _loc11_.anim = _loc12_[4];
                  }
                  else
                  {
                     _loc11_.anim = "";
                  }
                  break;
               case 11:
                  _loc11_.ptype = _loc12_[0];
                  _loc11_.x = _loc12_[1];
                  _loc11_.y = _loc12_[2];
                  _loc11_.velX = _loc12_[3];
                  _loc11_.velY = _loc12_[4];
                  _loc11_.damage = _loc12_[5];
                  _loc11_.skilllevel = _loc12_[6];
                  break;
               case 12:
                  _loc11_.text = _loc12_[0];
                  break;
               case 13:
                  _loc11_.time = _loc12_[0];
                  break;
               case 14:
                  _loc11_.time = _loc12_[0];
                  break;
               case 17:
                  _loc11_.attacker = _loc12_[0];
                  _loc11_.victim = _loc12_[1];
                  _loc11_.damagestr = _loc12_[2];
                  break;
               case 18:
                  _loc11_.victim = _loc12_[0];
                  _loc11_.hp = _loc12_[1];
                  _loc11_.launched = _loc12_[2];
                  _loc11_.attacker = _loc12_[3];
                  break;
               case 19:
                  _loc11_.victim = _loc12_[0];
                  if(_loc12_.length == 2)
                  {
                     _loc11_.§1t13194s0§ = _loc12_[1];
                  }
                  else
                  {
                     _loc11_.§1t13194s0§ = "";
                  }
            }
            _loc2_ = new §1t1701s0§(_loc9_,_loc11_,_loc10_,_loc8_);
            _loc5_.push(_loc2_);
            _loc6_++;
         }
         return _loc5_;
      }
      
      public static function §1t11261s0§() : Array
      {
         return §1t1056s0§.§1t9111s0§.split(§1t11259s0§);
      }
      
      public function §1t1706s0§() : int
      {
         return this.time;
      }
      
      public function §1t1707s0§() : int
      {
         return this.§1t1702s0§;
      }
      
      public function §1t1708s0§() : Object
      {
         return this.msg;
      }
      
      public function §1t1709s0§() : String
      {
         return this.§1t1704s0§;
      }
      
      public function §1t1710s0§() : String
      {
         var _loc1_:String = this.time + " " + this.§1t1702s0§ + " from " + this.§1t1704s0§ + " [";
         var _loc2_:String = "";
         switch(this.§1t1702s0§)
         {
            case 2:
               _loc2_ = "charname:" + this.msg.charname + " charlvl:" + this.msg.charlvl + " stats:" + this.msg.stats + " equip:" + this.msg.equip + " skills:" + this.msg.skills + " taunt:" + this.msg.taunt + " bg:" + this.msg.bg + " win:" + this.msg.win + " stance:" + this.msg.stance;
               break;
            case 6:
               _loc2_ = "lineArrayStr:" + this.msg.lineArrayStr + " posX:" + this.msg.posX;
               break;
            case 7:
               _loc2_ = "hp:" + this.msg.hp + " nid:" + this.msg.victim + " launched:" + this.msg.launched;
               break;
            case 8:
               _loc2_ = "stance:" + this.msg.stance;
               break;
            case 9:
               _loc2_ = "anim:" + this.msg.anim;
               break;
            case 10:
               _loc2_ = "actionState:" + this.msg.actionState + " x:" + this.msg.x + " y:" + this.msg.y + " facingRight:" + this.msg.facingRight + " anim:" + this.msg.anim;
               break;
            case 11:
               _loc2_ = "ptype:" + this.msg.ptype + " x:" + this.msg.x + " y:" + this.msg.y + " velX:" + this.msg.velX + " velY:" + this.msg.velY + " damage:" + this.msg.damage + " skilllevel:" + this.msg.skilllevel;
               break;
            case 12:
               _loc2_ = "text: " + this.msg.text;
               break;
            case 13:
               _loc2_ = "time: " + this.msg.time;
               break;
            case 14:
               _loc2_ = "time : " + this.msg.time;
         }
         return _loc1_ + _loc2_ + "]";
      }
      
      internal function toString() : String
      {
         var _loc1_:String = null;
         var _loc2_:String = null;
         if(this.§1t1705s0§ != "")
         {
            return this.§1t1705s0§;
         }
         _loc1_ = this.time + §1t11255s0§ + this.§1t1702s0§ + §1t11255s0§ + this.§1t1704s0§ + §1t11255s0§;
         switch(this.§1t1702s0§)
         {
            case 2:
               _loc2_ = this.msg.charname + §1t11257s0§ + this.msg.charlvl + §1t11257s0§ + this.msg.stats + §1t11257s0§ + this.msg.equip + §1t11257s0§ + this.msg.skills + §1t11257s0§ + this.msg.taunt + §1t11257s0§ + this.msg.bg + §1t11257s0§ + this.msg.stance + §1t11257s0§;
               if(this.msg.win)
               {
                  _loc2_ += "1";
               }
               else
               {
                  _loc2_ += "0";
               }
               break;
            case 6:
               _loc2_ = this.msg.lineArrayStr + §1t11257s0§ + this.msg.nid + §1t11257s0§ + this.msg.posX;
               break;
            case 7:
               _loc2_ = this.msg.hp + §1t11257s0§ + this.msg.victim + §1t11257s0§ + this.msg.launched + §1t11257s0§ + this.msg.canreject + §1t11257s0§ + this.msg.attacker + §1t11257s0§ + this.msg.effdmg;
               break;
            case 8:
               _loc2_ = this.msg.stance;
               break;
            case 9:
               _loc2_ = this.msg.anim;
               break;
            case 10:
               _loc2_ = this.msg.actionState + §1t11257s0§ + this.msg.x + §1t11257s0§ + this.msg.y + §1t11257s0§;
               if(this.msg.facingRight)
               {
                  _loc2_ += "1";
               }
               else
               {
                  _loc2_ += "0";
               }
               if(this.msg.anim != "")
               {
                  _loc2_ += §1t11257s0§ + this.msg.anim;
               }
               break;
            case 11:
               _loc2_ = this.msg.ptype + §1t11257s0§ + this.msg.x + §1t11257s0§ + this.msg.y + §1t11257s0§ + this.msg.velX + §1t11257s0§ + this.msg.velY + §1t11257s0§ + this.msg.damage + §1t11257s0§ + this.msg.skilllevel;
               break;
            case 12:
               _loc2_ = this.msg.text;
               break;
            case 13:
               _loc2_ = this.msg.time;
               break;
            case 14:
               _loc2_ = this.msg.time;
               break;
            case 17:
               _loc2_ = this.msg.attacker + §1t11257s0§ + this.msg.victim + §1t11257s0§ + this.msg.damagestr;
               break;
            case 18:
               _loc2_ = this.msg.victim + §1t11257s0§ + this.msg.hp + §1t11257s0§ + this.msg.launched + §1t11257s0§ + this.msg.attacker;
               break;
            case 19:
               _loc2_ = this.msg.victim + §1t11257s0§ + this.msg.§1t13194s0§;
         }
         return _loc1_ + _loc2_;
      }
   }
}

