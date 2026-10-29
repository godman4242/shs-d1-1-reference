package
{
   public class §1t76s0§
   {
      
      public static var §1t9196s0§:int = -1;
      
      public static var §1t9197s0§:int = -2;
      
      public static var §1t9198s0§:int = -3;
      
      public static var §1t9199s0§:int = -4;
      
      public static var §1t9200s0§:int = -5;
      
      public static var §1t9201s0§:int = -6;
      
      public static var §1t9202s0§:int = 700;
      
      public static var §1t9203s0§:int = 701;
      
      public static var §1t9204s0§:int = 702;
      
      public static var §1t9205s0§:int = 703;
      
      public static var §1t9206s0§:int = 704;
      
      public static var §1t9207s0§:int = 705;
      
      public static var §1t9208s0§:int = 706;
      
      public static var §1t9209s0§:int = 707;
      
      public static var §1t9210s0§:int = 708;
      
      public static var §1t9211s0§:int = 709;
      
      public static var §1t9212s0§:String = "4017|0|6019|0|8005|0|0|11017|12017|13002|13002|0|0";
      
      public static var §1t9214s0§:int = 0;
      
      public static var §1t9215s0§:int = 1;
      
      public static var §1t9216s0§:int = 2;
      
      public static var §1t9217s0§:int = 3;
      
      public static var §1t9218s0§:int = 4;
      
      public static var §1t9219s0§:int = 5;
      
      public var id:int;
      
      public var _name:int = -1;
      
      internal var §1t1168s0§:String = "";
      
      public var lvl:int;
      
      public var ai:int;
      
      public var hp:int;
      
      public var currenthp:int;
      
      public var chi:int;
      
      public var currentchi:int;
      
      public var attack:int;
      
      public var defense:int;
      
      public var speed:int;
      
      public var §1t1222s0§:Vector.<§1t57s0§> = null;
      
      public var scaleX:Number = 1;
      
      public var scaleY:Number = 1;
      
      public var skills:XMLList;
      
      public var mcs:XMLList;
      
      private var reward:§1t77s0§;
      
      public var §1t1227s0§:Boolean = true;
      
      public var minDamage:int;
      
      public var damageRange:int;
      
      public var slashUsage:int;
      
      public var controlledBy:int = 1;
      
      public var nid:String = "";
      
      public var rightPos:Boolean = true;
      
      public var equipmentStr:String = "";
      
      public var stance:int = -1;
      
      public var §1t1235s0§:int = 0;
      
      public var §1t1236s0§:int = 0;
      
      public var §1t1237s0§:int = 0;
      
      public var §1t1238s0§:int = 0;
      
      public var §1t1239s0§:int = 0;
      
      public var §1t1240s0§:int = 0;
      
      public var §1t1241s0§:int = 0;
      
      public var §1t1242s0§:int = 0;
      
      public var §1t1243s0§:int = 0;
      
      public var §1t1244s0§:int = 0;
      
      public function §1t76s0§(param1:XML)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         this.id = param1.id;
         this.lvl = param1.lvl;
         if(param1.name.toString() != "")
         {
            this._name = param1.name;
         }
         else
         {
            this._name = -1;
            this.§1t1168s0§ = "?";
         }
         if(param1.ai.toString() != "")
         {
            this.ai = param1.ai;
         }
         else
         {
            this.ai = 1;
         }
         if(param1.hp.toString() != "")
         {
            this.hp = param1.hp;
         }
         else
         {
            this.hp = 1;
         }
         if(param1.chi.toString() != "")
         {
            this.chi = param1.chi;
         }
         else
         {
            this.chi = 1;
         }
         if(param1.attack.toString() != "")
         {
            this.attack = param1.attack;
         }
         else
         {
            this.attack = 1;
         }
         if(param1.defense.toString() != "")
         {
            this.defense = param1.defense;
         }
         else
         {
            this.defense = 0;
         }
         if(param1.speed.toString() != "")
         {
            this.speed = param1.speed;
         }
         else
         {
            this.speed = 1;
         }
         this.mcs = XMLList(param1.mcs).copy();
         this.skills = XMLList(param1.skills).copy();
         this.reward = new §1t77s0§(param1.reward);
         if(param1.scalex.toString() != "")
         {
            this.scaleX = param1.scalex;
         }
         if(param1.scaley.toString() != "")
         {
            this.scaleY = param1.scaley;
         }
         if(param1.fire.toString() != "")
         {
            this.§1t1235s0§ = param1.fire;
            this.§1t1242s0§ = param1.fire;
         }
         if(param1.wind.toString() != "")
         {
            this.§1t1236s0§ = param1.wind;
            this.§1t1241s0§ = param1.wind;
         }
         if(param1.water.toString() != "")
         {
            this.§1t1237s0§ = param1.water;
            this.§1t1239s0§ = param1.water;
         }
         if(param1.earth.toString() != "")
         {
            this.§1t1238s0§ = param1.earth;
            this.§1t1240s0§ = param1.earth;
         }
      }
      
      public static function §1t9220s0§(param1:String) : Vector.<int>
      {
         var _loc4_:int = 0;
         var _loc2_:Vector.<int> = new Vector.<int>(§1t1523s0§.§1t9366s0§);
         var _loc3_:Array = param1.split("|");
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.length)
         {
            switch(_loc5_)
            {
               case 0:
                  _loc4_ = §1t1523s0§.§1t9402s0§;
                  break;
               case 1:
                  _loc4_ = §1t1523s0§.§1t9403s0§;
                  break;
               case 2:
                  _loc4_ = §1t1523s0§.§1t9405s0§;
                  break;
               case 3:
                  _loc4_ = §1t1523s0§.§1t9406s0§;
                  break;
               case 4:
                  _loc4_ = §1t1523s0§.§1t9408s0§;
                  break;
               case 5:
                  _loc4_ = §1t1523s0§.§1t9409s0§;
                  break;
               case 6:
                  _loc4_ = §1t1523s0§.§1t9410s0§;
                  break;
               case 7:
                  _loc4_ = §1t1523s0§.§1t1235s0§;
                  break;
               case 8:
                  _loc4_ = §1t1523s0§.§1t1236s0§;
                  break;
               case 9:
                  _loc4_ = §1t1523s0§.§1t1237s0§;
                  break;
               case 10:
                  _loc4_ = §1t1523s0§.§1t1238s0§;
                  break;
               case 11:
                  _loc4_ = §1t1523s0§.§1t9431s0§;
                  break;
               case 12:
                  _loc4_ = §1t1523s0§.§1t9432s0§;
                  break;
               case 13:
                  _loc4_ = §1t1523s0§.§1t9433s0§;
            }
            if(_loc5_ <= 13)
            {
               _loc2_[_loc4_] = _loc3_[_loc5_];
            }
            _loc5_++;
         }
         return _loc2_;
      }
      
      public static function §1t9221s0§(param1:String) : Vector.<§1t57s0§>
      {
         if(param1.indexOf(§1t1701s0§.§1t11255s0§) != -1)
         {
            param1 = param1.split(§1t1701s0§.§1t11255s0§)[0];
         }
         var _loc2_:Vector.<§1t57s0§> = new Vector.<§1t57s0§>();
         if(param1 == null)
         {
            return _loc2_;
         }
         var _loc3_:Array = param1.split("|");
         var _loc4_:* = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc2_.push(§1t57s0§.parse(_loc3_[_loc4_],1000));
            _loc4_++;
         }
         return _loc2_;
      }
      
      public function §1t509s0§() : String
      {
         if(this._name != -1)
         {
            return §1t1521s0§.getString(this._name);
         }
         return this.§1t1168s0§;
      }
      
      public function setName(param1:String) : *
      {
         this._name = -1;
         this.§1t1168s0§ = param1;
      }
      
      public function §1t1246s0§() : §1t74s0§
      {
         var _loc1_:§1t74s0§ = new §1t74s0§();
         _loc1_.§1t1550s0§(this.mcs);
         return _loc1_;
      }
      
      public function §1t1247s0§() : §1t75s0§
      {
         var _loc1_:§1t75s0§ = new §1t75s0§();
         _loc1_.§1t1550s0§(this.mcs);
         if(this.scaleX != 1 || this.scaleY != 1)
         {
            _loc1_.§1t6284s0§(this.scaleX,this.scaleY);
         }
         return _loc1_;
      }
      
      public function §1t1248s0§(param1:String, param2:int, param3:String, param4:String, param5:String, param6:int, param7:String, param8:Boolean, param9:int) : *
      {
         var _loc16_:Array = null;
         if(param1.substr(0,4) == "bot_")
         {
            _loc16_ = param1.split("_");
            param1 = §1t136s0§.§1t9190s0§().§1t1818s0§(int(_loc16_[1]) * 130 + int(_loc16_[2]) * 11);
         }
         if(param3 == null || param3 == "")
         {
            param3 = "0|0|0|0|0|0|0|0|0|0|0|0|0|0";
            §1t3318s0§.instance.client.§1t731s0§.§1t4655s0§("XMLNpc.initDuelist: statsStr null " + §1t1523s0§.charname + " " + param1,"","",null);
         }
         var _loc10_:Vector.<int> = this.§1t1256s0§(param3);
         if(param4 == null || param4 == "")
         {
            param4 = §1t9212s0§;
         }
         var _loc11_:Vector.<§1t17s0§> = this.§1t1257s0§(param4);
         this.equipmentStr = param4;
         this.id = §1t9196s0§;
         this.setName(param1);
         this.nid = param7;
         this.rightPos = param8;
         this.stance = param9;
         this.lvl = param2;
         this.ai = 0;
         this.controlledBy = param6;
         this.currenthp = _loc10_[§1t1523s0§.§1t9402s0§];
         this.hp = _loc10_[§1t1523s0§.§1t9403s0§] + §1t1523s0§.§1t9596s0§(§1t1523s0§.§1t9403s0§,_loc11_);
         this.currentchi = _loc10_[§1t1523s0§.§1t9405s0§];
         this.chi = _loc10_[§1t1523s0§.§1t9406s0§] + §1t1523s0§.§1t9596s0§(§1t1523s0§.§1t9406s0§,_loc11_);
         this.attack = _loc10_[§1t1523s0§.§1t9408s0§] + §1t1523s0§.§1t9596s0§(§1t1523s0§.§1t9408s0§,_loc11_);
         this.defense = _loc10_[§1t1523s0§.§1t9409s0§] + §1t1523s0§.§1t9596s0§(§1t1523s0§.§1t9409s0§,_loc11_);
         this.speed = _loc10_[§1t1523s0§.§1t9410s0§] + §1t1523s0§.§1t9596s0§(§1t1523s0§.§1t9410s0§,_loc11_);
         var _loc12_:int = §1t3317s0§.instance.§1t1847s0§();
         if(_loc10_[§1t1523s0§.§1t9431s0§] == §1t1523s0§.§1t9453s0§ && _loc10_[§1t1523s0§.§1t9432s0§] > _loc12_)
         {
            this.attack *= 1.5;
         }
         else if(_loc10_[§1t1523s0§.§1t9431s0§] == §1t1523s0§.§1t9454s0§ && _loc10_[§1t1523s0§.§1t9432s0§] > _loc12_)
         {
            this.defense *= 1.5;
         }
         else if((§1t1540s0§.§1t10047s0§() || §1t1540s0§.§1t10048s0§()) && _loc10_[§1t1523s0§.§1t9433s0§] != 0)
         {
            this.attack /= 2;
            this.defense /= 2;
            this.speed /= 2;
         }
         this.§1t1235s0§ = _loc10_[§1t1523s0§.§1t1235s0§] + §1t1523s0§.§1t9596s0§(§1t1523s0§.§1t1235s0§,_loc11_);
         this.§1t1236s0§ = _loc10_[§1t1523s0§.§1t1236s0§] + §1t1523s0§.§1t9596s0§(§1t1523s0§.§1t1236s0§,_loc11_);
         this.§1t1237s0§ = _loc10_[§1t1523s0§.§1t1237s0§] + §1t1523s0§.§1t9596s0§(§1t1523s0§.§1t1237s0§,_loc11_);
         this.§1t1238s0§ = _loc10_[§1t1523s0§.§1t1238s0§] + §1t1523s0§.§1t9596s0§(§1t1523s0§.§1t1238s0§,_loc11_);
         this.§1t1239s0§ = _loc10_[§1t1523s0§.§1t1237s0§] + §1t1523s0§.§1t9596s0§(§1t1523s0§.§1t1239s0§,_loc11_);
         this.§1t1240s0§ = _loc10_[§1t1523s0§.§1t1238s0§] + §1t1523s0§.§1t9596s0§(§1t1523s0§.§1t1240s0§,_loc11_);
         this.§1t1241s0§ = _loc10_[§1t1523s0§.§1t1236s0§] + §1t1523s0§.§1t9596s0§(§1t1523s0§.§1t1241s0§,_loc11_);
         this.§1t1242s0§ = _loc10_[§1t1523s0§.§1t1235s0§] + §1t1523s0§.§1t9596s0§(§1t1523s0§.§1t1242s0§,_loc11_);
         this.§1t1243s0§ = §1t1523s0§.§1t9596s0§(§1t1523s0§.§1t1243s0§,_loc11_);
         this.§1t1244s0§ = §1t1523s0§.§1t9596s0§(§1t1523s0§.§1t1244s0§,_loc11_);
         this.§1t1222s0§ = §1t9221s0§(param5);
         if(_loc11_[§1t1523s0§.§1t9448s0§] == null)
         {
            _loc11_[§1t1523s0§.§1t9448s0§] = new §1t17s0§(0);
         }
         var _loc13_:§1t104s0§ = §1t1524s0§.§1t9862s0§(_loc11_[§1t1523s0§.§1t9448s0§].§1t483s0§());
         if(_loc13_ == null || _loc11_[§1t1523s0§.§1t9448s0§].§1t483s0§() == 0)
         {
            if(_loc13_ == null)
            {
            }
            this.minDamage = this.attack;
            this.damageRange = 0;
            this.slashUsage = 48;
         }
         else
         {
            this.minDamage = this.attack + _loc13_.mindamage;
            this.damageRange = _loc13_.maxdamage - _loc13_.mindamage;
            this.slashUsage = _loc13_.slashusage;
            if(this.slashUsage < 48)
            {
               this.slashUsage = 48;
            }
         }
         var _loc14_:String = "<mcs>";
         _loc14_ = _loc14_ + ("<armor>" + _loc11_[§1t1523s0§.§1t9439s0§].§1t483s0§() + "</armor>");
         if(_loc11_[§1t1523s0§.§1t9439s0§].§1t527s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc14_ += "<armorpcolor>" + _loc11_[§1t1523s0§.§1t9439s0§].§1t527s0§() + "</armorpcolor>";
         }
         if(_loc11_[§1t1523s0§.§1t9439s0§].§1t528s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc14_ += "<armorscolor>" + _loc11_[§1t1523s0§.§1t9439s0§].§1t528s0§() + "</armorscolor>";
         }
         _loc14_ += "<gloves>" + _loc11_[§1t1523s0§.§1t9440s0§].§1t483s0§() + "</gloves>";
         if(_loc11_[§1t1523s0§.§1t9440s0§].§1t527s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc14_ += "<glovespcolor>" + _loc11_[§1t1523s0§.§1t9440s0§].§1t527s0§() + "</glovespcolor>";
         }
         if(_loc11_[§1t1523s0§.§1t9440s0§].§1t528s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc14_ += "<glovesscolor>" + _loc11_[§1t1523s0§.§1t9440s0§].§1t528s0§() + "</glovesscolor>";
         }
         _loc14_ += "<hair>" + _loc11_[§1t1523s0§.§1t9441s0§].§1t483s0§() + "</hair>";
         _loc14_ = _loc14_ + ("<hat>" + _loc11_[§1t1523s0§.§1t9442s0§].§1t483s0§() + "</hat>");
         if(_loc11_[§1t1523s0§.§1t9442s0§].§1t527s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc14_ += "<hatpcolor>" + _loc11_[§1t1523s0§.§1t9442s0§].§1t527s0§() + "</hatpcolor>";
         }
         if(_loc11_[§1t1523s0§.§1t9442s0§].§1t528s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc14_ += "<hatscolor>" + _loc11_[§1t1523s0§.§1t9442s0§].§1t528s0§() + "</hatscolor>";
         }
         _loc14_ += "<head>" + _loc11_[§1t1523s0§.§1t9443s0§].§1t483s0§() + "</head>";
         _loc14_ = _loc14_ + ("<mask>" + _loc11_[§1t1523s0§.§1t9444s0§].§1t483s0§() + "</mask>");
         if(_loc11_[§1t1523s0§.§1t9444s0§].§1t527s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc14_ += "<maskpcolor>" + _loc11_[§1t1523s0§.§1t9444s0§].§1t527s0§() + "</maskpcolor>";
         }
         if(_loc11_[§1t1523s0§.§1t9444s0§].§1t528s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc14_ += "<maskscolor>" + _loc11_[§1t1523s0§.§1t9444s0§].§1t528s0§() + "</maskscolor>";
         }
         _loc14_ += "<neck>" + _loc11_[§1t1523s0§.§1t9445s0§].§1t483s0§() + "</neck>";
         _loc14_ = _loc14_ + ("<pants>" + _loc11_[§1t1523s0§.§1t9446s0§].§1t483s0§() + "</pants>");
         if(_loc11_[§1t1523s0§.§1t9446s0§].§1t527s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc14_ += "<pantspcolor>" + _loc11_[§1t1523s0§.§1t9446s0§].§1t527s0§() + "</pantspcolor>";
         }
         if(_loc11_[§1t1523s0§.§1t9446s0§].§1t528s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc14_ += "<pantsscolor>" + _loc11_[§1t1523s0§.§1t9446s0§].§1t528s0§() + "</pantsscolor>";
         }
         _loc14_ += "<shoes>" + _loc11_[§1t1523s0§.§1t9447s0§].§1t483s0§() + "</shoes>";
         if(_loc11_[§1t1523s0§.§1t9447s0§].§1t527s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc14_ += "<shoespcolor>" + _loc11_[§1t1523s0§.§1t9447s0§].§1t527s0§() + "</shoespcolor>";
         }
         if(_loc11_[§1t1523s0§.§1t9447s0§].§1t528s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc14_ += "<shoesscolor>" + _loc11_[§1t1523s0§.§1t9447s0§].§1t528s0§() + "</shoesscolor>";
         }
         var _loc15_:int = _loc11_[§1t1523s0§.§1t9448s0§].§1t483s0§();
         if(_loc15_ == 0)
         {
            _loc15_ = 13001;
         }
         _loc14_ += "<weapon>" + _loc15_ + "</weapon>";
         if(_loc11_[§1t1523s0§.§1t9448s0§].§1t527s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc14_ += "<weaponpcolor>" + _loc11_[§1t1523s0§.§1t9448s0§].§1t527s0§() + "</weaponpcolor>";
         }
         if(_loc11_[§1t1523s0§.§1t9448s0§].§1t528s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc14_ += "<weaponscolor>" + _loc11_[§1t1523s0§.§1t9448s0§].§1t528s0§() + "</weaponscolor>";
         }
         _loc14_ += "<prop1>" + _loc11_[§1t1523s0§.§1t9449s0§].§1t483s0§() + "</prop1>";
         _loc14_ = _loc14_ + "</mcs>";
         this.mcs = new XMLList(_loc14_);
      }
      
      public function §1t1249s0§(param1:int, param2:int, param3:int, param4:int, param5:Boolean = false) : *
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Array = null;
         var _loc11_:Array = null;
         var _loc12_:Array = null;
         var _loc13_:Array = null;
         var _loc14_:Array = null;
         var _loc15_:Array = null;
         var _loc16_:Array = null;
         var _loc27_:§1t76s0§ = null;
         var _loc6_:int = param1 * param4 + param2 * (param3 + 3);
         var _loc7_:§1t58s0§ = §1t58s0§.§1t8804s0§(_loc6_);
         this.§1t1227s0§ = true;
         _loc9_ = _loc7_.rand(8);
         if(_loc9_ == 0 || _loc9_ == 6)
         {
            _loc8_ = §1t9214s0§;
         }
         else if(_loc9_ == 1)
         {
            _loc8_ = §1t9215s0§;
         }
         else if(_loc9_ == 2)
         {
            _loc8_ = §1t9216s0§;
         }
         else if(_loc9_ == 3)
         {
            _loc8_ = §1t9217s0§;
         }
         else if(_loc9_ == 4)
         {
            _loc8_ = §1t9218s0§;
         }
         else if(_loc9_ == 5 || _loc9_ == 7)
         {
            _loc8_ = §1t9219s0§;
         }
         if(param5)
         {
            _loc8_ = §1t9219s0§;
         }
         if(_loc8_ == §1t9219s0§)
         {
            _loc9_ = _loc7_.rand(3);
            if(_loc9_ == 2)
            {
               this.§1t1227s0§ = false;
            }
         }
         var _loc17_:Array = [0];
         if(_loc8_ == §1t9214s0§)
         {
            this.setName(§1t136s0§.§1t9190s0§().§1t1815s0§(_loc7_,this.§1t1227s0§));
            _loc10_ = [4007,4012,4013];
            _loc11_ = [6000,6001,6002,6003,6004,6007,6008,6009,6013,6014,6015.6017,6018,6019];
            _loc12_ = [0];
            _loc13_ = [8004,8005,8006,8007,8012,8017,8018,8019,8020,8021,8023];
            _loc14_ = [9000,9002,9004,9005,9012,9036,9037,9038,9039];
            _loc15_ = [11006,11007,11009,11010,11011,11012,11013,11020];
            _loc16_ = [12005];
         }
         else if(_loc8_ == §1t9215s0§)
         {
            this.setName(§1t136s0§.§1t9190s0§().§1t1815s0§(_loc7_,this.§1t1227s0§));
            _loc10_ = [4008,4010,4012,4013,4016,4017,4018,4019,4020];
            _loc11_ = [6005];
            _loc12_ = [0];
            _loc13_ = [8003,8017,8020,8023];
            _loc14_ = [0,9003];
            _loc15_ = [11006,11007,11008,11009,11010,11011,11012,11013,11016,11017,11018,11019];
            _loc16_ = [12003,12004,12005];
            if(_loc7_.rand(2) == 1)
            {
               this.ai = 32;
            }
         }
         else if(_loc8_ == §1t9216s0§)
         {
            this.setName(§1t136s0§.§1t9190s0§().§1t1816s0§(_loc7_,this.§1t1227s0§));
            _loc10_ = [4008,4010];
            _loc11_ = [6000,6001,6002,6003,6004,6007,6008,6009,6013,6014,6015.6017,6018,6019];
            _loc12_ = [0,7004,7006];
            _loc13_ = [8004,8005,8006,8007,8012,8017,8018,8019,8020,8021,8023];
            _loc14_ = [9000,9002,9004,9005,9012,9036,9037,9038,9039];
            _loc15_ = [11008,11016,11017,11018,11019];
            _loc16_ = [12001];
         }
         else if(_loc8_ == §1t9217s0§)
         {
            this.setName(§1t136s0§.§1t9190s0§().§1t1816s0§(_loc7_,this.§1t1227s0§));
            _loc10_ = [4014,4015];
            _loc11_ = [6000,6001,6002,6003,6004,6007,6008,6009,6013,6014,6015.6017,6018,6019];
            _loc12_ = [0,7004];
            _loc13_ = [8004,8005,8006,8007,8012,8017,8018,8019,8020,8021,8023];
            _loc14_ = [9000,9002,9004,9005,9012,9036,9037,9038,9039];
            _loc15_ = [11004,11008,11014,11015,11019];
            _loc16_ = [12001];
         }
         else if(_loc8_ == §1t9218s0§)
         {
            this.§1t1227s0§ = false;
            this.setName(§1t136s0§.§1t9190s0§().§1t1815s0§(_loc7_,this.§1t1227s0§));
            _loc10_ = [4107,4059,4060,4062];
            _loc11_ = [6500,6501,6502,6503,6504,6505,6506,6507,6508,6509,6518,6519];
            _loc12_ = [0,0,0,0,0,0,0,0,0,0,0,7003,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017];
            _loc13_ = [8500,8501,8502,8503,8504,8505,8506];
            _loc14_ = [0];
            if(_loc7_.rand(2) == 0)
            {
               _loc15_ = [11503];
               _loc16_ = [12003,12004];
            }
            else
            {
               _loc15_ = [11501];
               _loc16_ = [12001,12002,12005,12017];
            }
            this.ai = 33;
         }
         else if(_loc8_ == §1t9219s0§)
         {
            if(this.§1t1227s0§)
            {
               this.setName(§1t136s0§.§1t9190s0§().§1t1817s0§(_loc7_,true));
               _loc10_ = [4000,4004,4007,4012,4013,4016,4017,4018,4019,4020];
               _loc11_ = [6000,6001,6002,6003,6004,6007,6008,6009,6013,6014,6015.6017,6018,6019];
               _loc12_ = [0,0,0,0,0,0,0,0,0,7003,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017];
               _loc13_ = [8004,8005,8006,8007,8012,8017,8018,8019,8020,8021,8023];
               _loc14_ = [9000,9002,9004,9005,9012,9036,9037,9038,9039];
               _loc15_ = [11002,11003,11004,11006,11007,11009,11010,11011,11012,11013,11016,11017,11018,11019,11020,11021,11022,11023,11024,11025,11026,11027,11028];
               _loc16_ = [12000,12001,12005,12010];
               _loc17_ = [13100,13101,13103,13104,13105,13106,13107,13108,13109,13110,13111,13112,13113,13114,13115,13116,13117,13118,13119,13121,13124,13125,13126,13127,13128,13200,13201,13202,13203,13204,13205,13206,13207,13001,13002,13003,13008,13010,13011];
            }
            else
            {
               this.setName(§1t136s0§.§1t9190s0§().§1t1817s0§(_loc7_,false));
               _loc10_ = [4107,4059,4060,4062];
               _loc11_ = [6500,6501,6502,6503,6504,6505,6506,6507,6508,6509,6518,6519];
               _loc12_ = [0,0,0,0,0,0,0,0,0,0,0,7003,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017];
               _loc13_ = [8500,8501,8502,8503,8504,8505,8506];
               _loc14_ = [0];
               _loc17_ = [13100,13101,13103,13104,13105,13106,13107,13108,13109,13110,13111,13112,13113,13114,13115,13116,13117,13118,13119,13121,13124,13125,13126,13127,13128,13200,13201,13202,13203,13204,13205,13206,13207,13001,13002,13003,13008,13010,13011];
               if(_loc7_.rand(2) == 0)
               {
                  _loc15_ = [11503];
                  _loc16_ = [12003,12004];
               }
               else
               {
                  _loc15_ = [11501];
                  _loc16_ = [12001,12002,12005,12017];
               }
            }
         }
         var _loc18_:int = int(_loc10_[_loc7_.rand(_loc10_.length)]);
         var _loc19_:int = int(_loc11_[_loc7_.rand(_loc11_.length)]);
         var _loc20_:int = int(_loc12_[_loc7_.rand(_loc12_.length)]);
         var _loc21_:int = int(_loc13_[_loc7_.rand(_loc13_.length)]);
         var _loc22_:int = int(_loc14_[_loc7_.rand(_loc14_.length)]);
         var _loc23_:int = int(_loc15_[_loc7_.rand(_loc15_.length)]);
         var _loc24_:int = int(_loc16_[_loc7_.rand(_loc16_.length)]);
         var _loc25_:int = int(_loc17_[_loc7_.rand(_loc17_.length)]);
         var _loc26_:String = "<mcs>";
         _loc26_ = _loc26_ + ("<armor>" + _loc18_ + "</armor>");
         _loc26_ = _loc26_ + "<gloves>5000</gloves>";
         _loc26_ = _loc26_ + ("<hair>" + _loc19_ + "</hair>");
         _loc26_ = _loc26_ + ("<hat>" + _loc20_ + "</hat>");
         _loc26_ = _loc26_ + ("<head>" + _loc21_ + "</head>");
         _loc26_ = _loc26_ + ("<mask>" + _loc22_ + "</mask>");
         _loc26_ = _loc26_ + "<neck>10000</neck>";
         _loc26_ = _loc26_ + ("<pants>" + _loc23_ + "</pants>");
         _loc26_ = _loc26_ + ("<shoes>" + _loc24_ + "</shoes>");
         _loc26_ = _loc26_ + ("<weapon>" + _loc25_ + "</weapon>");
         _loc26_ = _loc26_ + ("<prop1>" + _loc25_ + "</prop1>");
         _loc26_ = _loc26_ + "</mcs>";
         this.mcs = new XMLList(_loc26_);
         if(param5)
         {
            _loc27_ = §1t1524s0§.§1t9874s0§(18);
            this.id = §1t9199s0§;
            this.ai = _loc27_.ai;
            this.hp = _loc27_.hp;
            this.chi = _loc27_.chi;
            this.currenthp = _loc27_.currenthp;
            this.currentchi = _loc27_.currentchi;
            this.attack = _loc27_.attack;
            this.defense = _loc27_.defense;
            this.speed = _loc27_.speed;
            this.reward = _loc27_.§1t992s0§();
            this.skills = _loc27_.skills;
         }
         _loc7_.destroy();
      }
      
      public function §1t1250s0§(param1:int) : *
      {
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:Array = null;
         var _loc8_:Array = null;
         var _loc9_:Array = null;
         var _loc10_:Array = null;
         var _loc11_:int = 0;
         var _loc2_:§1t58s0§ = §1t58s0§.§1t8804s0§(param1);
         var _loc3_:int = _loc2_.rand(3);
         this.§1t1227s0§ = _loc3_ != 2;
         if(_loc2_.rand(2) == 0)
         {
            this.setName(§1t136s0§.§1t9190s0§().§1t1817s0§(_loc2_,this.§1t1227s0§));
         }
         else
         {
            this.setName(§1t136s0§.§1t9190s0§().§1t1815s0§(_loc2_,this.§1t1227s0§));
         }
         if(this.§1t1227s0§)
         {
            _loc4_ = [4000,4004,4007,4012,4013,4016,4017,4018,4019,4020];
            _loc5_ = [6000,6001,6002,6003,6004,6007,6008,6009,6013,6014,6015.6017,6018,6019];
            _loc6_ = [0,0,0,0,0,0,0,0,0,7003,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017];
            _loc7_ = [8004,8005,8006,8007,8012,8017,8018,8019,8020,8021,8023];
            _loc8_ = [11002,11003,11004,11006,11007,11009,11010,11011,11012,11013,11016,11017,11018,11019,11020,11021,11022,11023,11024,11025,11026,11027,11028];
            _loc9_ = [12000,12001,12005,12010];
            _loc10_ = [13100,13101,13103,13104,13105,13106,13107,13108,13109,13110,13111,13112,13113,13114,13115,13116,13117,13118,13119,13121,13124,13125,13126,13127,13128,13200,13201,13202,13203,13204,13205,13206,13207,13001,13002,13003,13008,13010,13011];
            _loc11_ = 10000;
         }
         else
         {
            if(_loc2_.rand(2) == 0)
            {
               _loc4_ = [4107,4059,4060,4062];
               _loc8_ = [0];
            }
            else
            {
               _loc4_ = [4000,4004,4007,4012,4013,4016,4017,4018,4019,4020];
               _loc8_ = [11002,11003,11004,11006,11007,11009,11010,11011,11012,11013,11016,11017,11018,11019,11020,11021,11022,11023,11024,11025,11026,11027,11028];
            }
            _loc5_ = [6500,6501,6502,6503,6504,6505,6506,6507,6508,6509,6518,6519];
            _loc6_ = [0,0,0,0,0,0,0,0,0,0,0,7003,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017];
            _loc7_ = [8500,8501,8502,8503,8504,8505,8506];
            _loc10_ = [13100,13101,13103,13104,13105,13106,13107,13108,13109,13110,13111,13112,13113,13114,13115,13116,13117,13118,13119,13121,13124,13125,13126,13127,13128,13200,13201,13202,13203,13204,13205,13206,13207,13001,13002,13003,13008,13010,13011];
            _loc9_ = [12001,12002,12005,12017];
            _loc11_ = 10001;
         }
         var _loc12_:int = int(_loc4_[_loc2_.rand(_loc4_.length)]);
         var _loc13_:int = int(_loc5_[_loc2_.rand(_loc5_.length)]);
         var _loc14_:int = int(_loc6_[_loc2_.rand(_loc6_.length)]);
         var _loc15_:int = int(_loc7_[_loc2_.rand(_loc7_.length)]);
         var _loc16_:int = int(_loc8_[_loc2_.rand(_loc8_.length)]);
         var _loc17_:int = int(_loc9_[_loc2_.rand(_loc9_.length)]);
         var _loc18_:int = int(_loc10_[_loc2_.rand(_loc10_.length)]);
         this.equipmentStr = _loc12_ + "|" + "0" + "|" + _loc13_ + "|" + _loc14_ + "|" + _loc15_ + "|" + "0" + "|" + _loc11_ + "|" + _loc16_ + "|" + _loc17_ + "|" + _loc18_ + "|" + _loc18_ + "|0|0";
         _loc2_.destroy();
      }
      
      public function §1t1251s0§() : String
      {
         return this.mcs.armor + "|" + this.mcs.gloves + "|" + this.mcs.hair + "|" + this.mcs.hat + "|" + this.mcs.head + "|" + this.mcs.mask + "|" + this.mcs.neck + "|" + this.mcs.pants + "|" + this.mcs.shoes + "|" + this.mcs.weapon + "|" + this.mcs.prop1;
      }
      
      public function §1t1252s0§(param1:String) : *
      {
         var _loc2_:Vector.<§1t17s0§> = this.§1t1257s0§(param1);
         this.equipmentStr = param1;
         var _loc3_:String = "<mcs>";
         _loc3_ += "<armor>" + _loc2_[§1t1523s0§.§1t9439s0§].§1t483s0§() + "</armor>";
         if(_loc2_[§1t1523s0§.§1t9439s0§].§1t527s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc3_ += "<armorpcolor>" + _loc2_[§1t1523s0§.§1t9439s0§].§1t527s0§() + "</armorpcolor>";
         }
         if(_loc2_[§1t1523s0§.§1t9439s0§].§1t528s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc3_ += "<armorscolor>" + _loc2_[§1t1523s0§.§1t9439s0§].§1t528s0§() + "</armorscolor>";
         }
         _loc3_ += "<gloves>" + _loc2_[§1t1523s0§.§1t9440s0§].§1t483s0§() + "</gloves>";
         if(_loc2_[§1t1523s0§.§1t9440s0§].§1t527s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc3_ += "<glovespcolor>" + _loc2_[§1t1523s0§.§1t9440s0§].§1t527s0§() + "</glovespcolor>";
         }
         if(_loc2_[§1t1523s0§.§1t9440s0§].§1t528s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc3_ += "<glovesscolor>" + _loc2_[§1t1523s0§.§1t9440s0§].§1t528s0§() + "</glovesscolor>";
         }
         _loc3_ += "<hair>" + _loc2_[§1t1523s0§.§1t9441s0§].§1t483s0§() + "</hair>";
         _loc3_ += "<hat>" + _loc2_[§1t1523s0§.§1t9442s0§].§1t483s0§() + "</hat>";
         if(_loc2_[§1t1523s0§.§1t9442s0§].§1t527s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc3_ += "<hatpcolor>" + _loc2_[§1t1523s0§.§1t9442s0§].§1t527s0§() + "</hatpcolor>";
         }
         if(_loc2_[§1t1523s0§.§1t9442s0§].§1t528s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc3_ += "<hatscolor>" + _loc2_[§1t1523s0§.§1t9442s0§].§1t528s0§() + "</hatscolor>";
         }
         _loc3_ += "<head>" + _loc2_[§1t1523s0§.§1t9443s0§].§1t483s0§() + "</head>";
         _loc3_ += "<mask>" + _loc2_[§1t1523s0§.§1t9444s0§].§1t483s0§() + "</mask>";
         if(_loc2_[§1t1523s0§.§1t9444s0§].§1t527s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc3_ += "<maskpcolor>" + _loc2_[§1t1523s0§.§1t9444s0§].§1t527s0§() + "</maskpcolor>";
         }
         if(_loc2_[§1t1523s0§.§1t9444s0§].§1t528s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc3_ += "<maskcolor>" + _loc2_[§1t1523s0§.§1t9444s0§].§1t528s0§() + "</maskscolor>";
         }
         _loc3_ += "<neck>" + _loc2_[§1t1523s0§.§1t9445s0§].§1t483s0§() + "</neck>";
         _loc3_ += "<pants>" + _loc2_[§1t1523s0§.§1t9446s0§].§1t483s0§() + "</pants>";
         if(_loc2_[§1t1523s0§.§1t9446s0§].§1t527s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc3_ += "<pantspcolor>" + _loc2_[§1t1523s0§.§1t9446s0§].§1t527s0§() + "</pantspcolor>";
         }
         if(_loc2_[§1t1523s0§.§1t9446s0§].§1t528s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc3_ += "<pantsscolor>" + _loc2_[§1t1523s0§.§1t9446s0§].§1t528s0§() + "</pantsscolor>";
         }
         _loc3_ += "<shoes>" + _loc2_[§1t1523s0§.§1t9447s0§].§1t483s0§() + "</shoes>";
         if(_loc2_[§1t1523s0§.§1t9447s0§].§1t527s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc3_ += "<shoespcolor>" + _loc2_[§1t1523s0§.§1t9447s0§].§1t527s0§() + "</shoespcolor>";
         }
         if(_loc2_[§1t1523s0§.§1t9447s0§].§1t528s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc3_ += "<shoesscolor>" + _loc2_[§1t1523s0§.§1t9447s0§].§1t528s0§() + "</shoesscolor>";
         }
         var _loc4_:int = _loc2_[§1t1523s0§.§1t9448s0§].§1t483s0§();
         if(_loc4_ == 0)
         {
            _loc4_ = 13001;
         }
         _loc3_ += "<weapon>" + _loc4_ + "</weapon>";
         if(_loc2_[§1t1523s0§.§1t9448s0§].§1t527s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc3_ += "<weaponpcolor>" + _loc2_[§1t1523s0§.§1t9448s0§].§1t527s0§() + "</weaponpcolor>";
         }
         if(_loc2_[§1t1523s0§.§1t9448s0§].§1t528s0§() != §1t17s0§.§1t8733s0§)
         {
            _loc3_ += "<weaponscolor>" + _loc2_[§1t1523s0§.§1t9448s0§].§1t528s0§() + "</weaponscolor>";
         }
         _loc3_ += "<prop1>" + _loc2_[§1t1523s0§.§1t9449s0§].§1t483s0§() + "</prop1>";
         _loc3_ += "</mcs>";
         this.mcs = new XMLList(_loc3_);
      }
      
      public function §1t1253s0§() : Boolean
      {
         return this.ai == 8 || this.ai == 10 || this.ai == 11 || this.ai == 12 || this.ai == 16 || this.ai == 17 || this.ai == 18 || this.ai == 19 || this.ai == 21 || this.ai == 24;
      }
      
      public function §1t1254s0§() : *
      {
         var _loc2_:XMLList = null;
         var _loc3_:int = 0;
         this.§1t1222s0§ = new Vector.<§1t57s0§>();
         if(this.skills == null)
         {
            return;
         }
         var _loc1_:int = int(this.skills.skill.length());
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_)
         {
            _loc2_ = XMLList(this.skills.skill[_loc4_]);
            if(_loc2_.lvl.toString() != "")
            {
               _loc3_ = int(_loc2_.lvl);
            }
            else
            {
               _loc3_ = 1;
            }
            this.§1t1222s0§.push(new §1t57s0§(_loc2_.id,_loc3_));
            _loc4_++;
         }
      }
      
      public function §1t1255s0§(param1:int) : int
      {
         if(this.§1t1222s0§ == null)
         {
            this.§1t1254s0§();
         }
         var _loc2_:int = int(this.§1t1222s0§.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.§1t1222s0§[_loc3_].§1t760s0§() == param1)
            {
               return this.§1t1222s0§[_loc3_].§1t761s0§();
            }
            _loc3_++;
         }
         return 0;
      }
      
      internal function §1t1256s0§(param1:String) : Vector.<int>
      {
         var _loc2_:Array = param1.split("|");
         var _loc3_:int = int(_loc2_.length);
         if(_loc3_ == 14 || _loc3_ == 18)
         {
            return §1t9220s0§(param1);
         }
         var _loc4_:Vector.<int> = new Vector.<int>(§1t1523s0§.§1t9366s0§);
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_.length - 1)
         {
            _loc4_[_loc5_] = _loc2_[_loc5_];
            _loc5_++;
         }
         return _loc4_;
      }
      
      internal function §1t1257s0§(param1:String) : Vector.<§1t17s0§>
      {
         if(param1.indexOf(§1t1701s0§.§1t11255s0§) != -1)
         {
            param1 = param1.split(§1t1701s0§.§1t11255s0§)[0];
         }
         var _loc2_:Vector.<§1t17s0§> = new Vector.<§1t17s0§>(13);
         var _loc3_:Array = param1.split("|");
         var _loc4_:* = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc2_[_loc4_] = §1t17s0§.§1t8745s0§(_loc3_[_loc4_]);
            _loc4_++;
         }
         return _loc2_;
      }
      
      public function §1t1258s0§() : *
      {
         return this.equipmentStr;
      }
      
      public function getClone() : §1t76s0§
      {
         var _loc1_:§1t76s0§ = new §1t76s0§(null);
         _loc1_.id = this.id;
         if(this._name != -1)
         {
            _loc1_._name = this._name;
         }
         else
         {
            _loc1_.setName(this.§1t509s0§());
         }
         _loc1_.lvl = this.lvl;
         _loc1_.ai = this.ai;
         _loc1_.hp = this.hp;
         _loc1_.currenthp = this.currenthp;
         _loc1_.chi = this.chi;
         _loc1_.currentchi = this.currentchi;
         _loc1_.attack = this.attack;
         _loc1_.defense = this.defense;
         _loc1_.speed = this.speed;
         _loc1_.skills = this.skills;
         _loc1_.mcs = this.mcs;
         _loc1_.§1t1260s0§(this.§1t992s0§());
         _loc1_.§1t1222s0§ = this.§1t1222s0§;
         _loc1_.minDamage = this.minDamage;
         _loc1_.damageRange = this.damageRange;
         _loc1_.slashUsage = this.slashUsage;
         _loc1_.controlledBy = this.controlledBy;
         _loc1_.nid = this.nid;
         _loc1_.rightPos = this.rightPos;
         _loc1_.equipmentStr = this.equipmentStr;
         return _loc1_;
      }
      
      public function §1t992s0§() : §1t77s0§
      {
         return this.reward;
      }
      
      public function §1t1260s0§(param1:§1t77s0§) : *
      {
         this.reward = param1;
      }
   }
}

