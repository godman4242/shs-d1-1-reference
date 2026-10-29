package
{
   import flash.display.MovieClip;
   
   public class §1t68s0§ extends §1t1544s0§
   {
      
      internal var velY:int;
      
      internal var velX:int;
      
      internal var §1t3243s0§:int;
      
      internal var damage:int = 10;
      
      internal var defense:int = 1;
      
      internal var level:int;
      
      internal var xp:int;
      
      internal var §1t3244s0§:int = 24;
      
      internal var §1t3245s0§:int = 0;
      
      internal var §1t3246s0§:int = 0;
      
      internal var §1t3247s0§:int = 96;
      
      internal var ttl:int = this.§1t3247s0§;
      
      internal var target:§1t68s0§;
      
      internal var reward:§1t77s0§;
      
      internal var §1t3248s0§:§1t158s0§;
      
      internal var §1t3249s0§:§1t158s0§;
      
      internal var fatal:Boolean = true;
      
      internal var §1t3250s0§:Boolean = false;
      
      internal var §1t3251s0§:int;
      
      internal var §1t3252s0§:String;
      
      internal var §1t3253s0§:int;
      
      internal var §1t3254s0§:int;
      
      internal var §1t3255s0§:Boolean = false;
      
      internal var §1t3256s0§:Boolean = false;
      
      private var hp:int = 1;
      
      internal var §1t3257s0§:int = 1;
      
      internal var §1t3258s0§:Boolean = false;
      
      internal var §1t1071s0§:Boolean = false;
      
      internal var actionState:int;
      
      internal var §1t3260s0§:Boolean = false;
      
      internal var nid:String = "";
      
      internal var controlledBy:int = 0;
      
      internal var §1t1235s0§:int;
      
      internal var §1t1236s0§:int;
      
      internal var §1t1237s0§:int;
      
      internal var §1t1238s0§:int;
      
      internal var §1t1239s0§:int;
      
      internal var §1t1240s0§:int;
      
      internal var §1t1241s0§:int;
      
      internal var §1t1242s0§:int;
      
      internal var §1t3261s0§:Boolean = true;
      
      internal var §1t3262s0§:Boolean = true;
      
      internal var §1t3263s0§:Boolean = true;
      
      internal var §1t3264s0§:Boolean = true;
      
      internal var §1t3265s0§:Boolean = true;
      
      public function §1t68s0§(param1:§1t75s0§ = null)
      {
         super();
         if(param1 == null)
         {
            this.mcs = new §1t75s0§();
         }
         else
         {
            this.mcs = param1;
         }
         this.controlledBy = 1;
         this.target = §1t1523s0§.§1t9586s0§();
      }
      
      internal static function §1t12068s0§() : int
      {
         var _loc1_:int = §1t1523s0§.getLevel();
         if(_loc1_ < 6)
         {
            return 0;
         }
         if(_loc1_ < 40)
         {
            return _loc1_ - Math.floor(_loc1_ / 10) - 5;
         }
         if(_loc1_ < 60)
         {
            return _loc1_ - Math.floor(_loc1_ / 5) - 1;
         }
         return _loc1_ - 9;
      }
      
      internal static function §1t12069s0§() : int
      {
         var _loc1_:int = §1t1523s0§.getLevel();
         if(_loc1_ < 8)
         {
            return 5;
         }
         if(_loc1_ < 10)
         {
            return 6;
         }
         if(_loc1_ < 12)
         {
            return 7;
         }
         if(_loc1_ < 16)
         {
            return 8;
         }
         if(_loc1_ < 20)
         {
            return 9;
         }
         if(_loc1_ < 30)
         {
            return 11;
         }
         if(_loc1_ < 40)
         {
            return 12;
         }
         if(_loc1_ < 45)
         {
            return 13;
         }
         if(_loc1_ < 50)
         {
            return 14;
         }
         if(_loc1_ < 55)
         {
            return 15;
         }
         if(_loc1_ < 60)
         {
            return 16;
         }
         if(_loc1_ < 80)
         {
            return 17;
         }
         return 17;
      }
      
      public static function §1t12070s0§(param1:int, param2:int, param3:int, param4:Boolean) : *
      {
         if(param2 <= §1t12068s0§())
         {
            return 0;
         }
         if(param2 - param1 > 3)
         {
            return 0;
         }
         var _loc5_:int = param3;
         if(param1 < param2)
         {
            _loc5_ = param3 * (1 + 0.05 * (param2 - param1));
         }
         else if(param1 > param2)
         {
            _loc5_ = param3 * (1 - (param1 - param2) / §1t12069s0§());
         }
         if(param4)
         {
            _loc5_ *= 2;
         }
         return _loc5_;
      }
      
      internal function reset() : *
      {
         mcs.visible = true;
         mcs.alpha = 1;
         this.§1t3258s0§ = false;
         this.§1t1071s0§ = false;
         this.§1t3256s0§ = false;
         this.§1t3250s0§ = false;
         this.§1t3308s0§(this.§1t3257s0§);
         this.velX = 0;
         this.velY = 0;
         this.§1t3245s0§ = 0;
         this.§1t3269s0§(§1t11141s0§);
         mcs.§1t6279s0§();
         this.§1t3301s0§();
         mcs.§1t5493s0§();
         this.ttl = this.§1t3247s0§;
      }
      
      public function init(param1:§1t76s0§) : *
      {
         §1t1550s0§(param1.mcs);
         this.damage = param1.attack;
         this.defense = param1.defense;
         this.§1t3257s0§ = param1.hp;
         this.level = param1.lvl;
         this.xp = this.level * 2 + 20;
         this.reset();
         if(mcs.y == §1t1525s0§.§1t4467s0§())
         {
            this.§1t3269s0§(§1t11143s0§);
         }
         else
         {
            this.§1t3269s0§(§1t11145s0§);
         }
         this.reward = param1.§1t992s0§();
         this.§1t1235s0§ = param1.§1t1235s0§;
         this.§1t1236s0§ = param1.§1t1236s0§;
         this.§1t1237s0§ = param1.§1t1237s0§;
         this.§1t1238s0§ = param1.§1t1238s0§;
         this.§1t1239s0§ = param1.§1t1239s0§;
         this.§1t1240s0§ = param1.§1t1240s0§;
         this.§1t1241s0§ = param1.§1t1241s0§;
         this.§1t1242s0§ = param1.§1t1242s0§;
      }
      
      public function setLevel(param1:int) : *
      {
         var _loc2_:Number = param1 / this.level;
         if(param1 <= 20)
         {
            _loc2_ *= 0.9;
         }
         this.level = param1;
         this.damage *= _loc2_;
         this.defense *= _loc2_;
         this.§1t3257s0§ *= _loc2_;
         this.§1t3308s0§(this.§1t3257s0§);
         this.§1t3301s0§();
         this.xp = param1 * 2 + 20;
         if(param1 <= 10)
         {
            this.damage = 1;
            this.defense = 1;
            this.§1t3257s0§ = 1;
            this.§1t3308s0§(this.§1t3257s0§);
         }
      }
      
      public function §1t3267s0§() : *
      {
         this.§1t3255s0§ = true;
         this.target = §1t1543s0§.§1t10231s0§(§1t1555s0§(),!this.§1t3255s0§);
      }
      
      public function update() : *
      {
      }
      
      public function §1t3268s0§() : *
      {
         mcs.§1t3268s0§();
      }
      
      public function §1t3269s0§(param1:int) : *
      {
      }
      
      internal function §1t3270s0§() : *
      {
      }
      
      internal function §1t3271s0§() : Boolean
      {
         --this.§1t3245s0§;
         if(this.§1t3245s0§ <= 0)
         {
            this.§1t3245s0§ = this.§1t3244s0§;
            return true;
         }
         return false;
      }
      
      public function §1t3272s0§() : Boolean
      {
         return this.§1t3246s0§ == 0;
      }
      
      public function §1t3273s0§(param1:int, param2:int, param3:§1t67s0§) : Boolean
      {
         var _loc5_:MovieClip = null;
         var _loc4_:int = mcs.§1t6260s0§();
         var _loc6_:Vector.<MovieClip> = mcs.§1t6231s0§;
         var _loc7_:* = int(_loc4_ - 1);
         while(_loc7_ >= 0 && !this.§1t3256s0§)
         {
            _loc5_ = _loc6_[_loc7_];
            if(_loc5_.hitTestPoint(param1,param2))
            {
               if(this.§1t3277s0§(_loc5_,param3))
               {
                  return true;
               }
               return false;
            }
            _loc7_--;
         }
         return false;
      }
      
      public function §1t3274s0§(param1:MovieClip, param2:§1t67s0§, param3:Boolean = false, param4:Boolean = false) : Boolean
      {
         var _loc6_:MovieClip = null;
         var _loc5_:int = mcs.§1t6260s0§();
         var _loc7_:Vector.<MovieClip> = mcs.§1t6231s0§;
         var _loc8_:* = int(_loc5_ - 1);
         while(_loc8_ >= 0)
         {
            _loc6_ = _loc7_[_loc8_];
            if(_loc6_.hitTestObject(param1))
            {
               if(this.§1t3277s0§(_loc6_,param2))
               {
                  return true;
               }
               return false;
            }
            _loc8_--;
         }
         this.§1t3256s0§ = false;
         return false;
      }
      
      public function §1t3275s0§(param1:MovieClip, param2:§1t67s0§) : Boolean
      {
         var _loc4_:MovieClip = null;
         var _loc3_:int = mcs.§1t6260s0§();
         var _loc5_:Vector.<MovieClip> = mcs.§1t6231s0§;
         var _loc6_:* = int(_loc3_ - 1);
         while(_loc6_ >= 0 && !this.§1t3256s0§)
         {
            _loc4_ = _loc5_[_loc6_];
            if(_loc4_.hitTestObject(param1))
            {
               if(this.§1t3277s0§(_loc4_,param2))
               {
                  this.§1t3256s0§ = false;
                  return true;
               }
               return false;
            }
            _loc6_--;
         }
         this.§1t3256s0§ = false;
         return false;
      }
      
      public function §1t3276s0§(param1:MovieClip) : Boolean
      {
         var _loc3_:MovieClip = null;
         var _loc2_:int = mcs.§1t6260s0§();
         var _loc4_:Vector.<MovieClip> = mcs.§1t6231s0§;
         var _loc5_:* = int(_loc2_ - 1);
         while(_loc5_ >= 0 && !this.§1t3256s0§)
         {
            _loc3_ = _loc4_[_loc5_];
            if(_loc3_.hitTestObject(param1))
            {
               return true;
            }
            _loc5_--;
         }
         return false;
      }
      
      public function §1t3277s0§(param1:MovieClip, param2:§1t67s0§) : Boolean
      {
         if(this.§1t3246s0§ > 0)
         {
            return false;
         }
         var _loc3_:int = param2.damage;
         var _loc4_:int = param2.§1t1062s0§ - this.§1t1239s0§;
         var _loc5_:int = param2.§1t1063s0§ - this.§1t1241s0§;
         var _loc6_:int = param2.§1t1064s0§ - this.§1t1240s0§;
         var _loc7_:int = param2.§1t1065s0§ - this.§1t1242s0§;
         if(param2.§1t1062s0§ > 0 && _loc4_ < 1)
         {
            _loc4_ = 1;
         }
         else if(_loc4_ < 0)
         {
            _loc4_ = 0;
         }
         if(param2.§1t1063s0§ > 0 && _loc5_ < 1)
         {
            _loc5_ = 1;
         }
         else if(_loc5_ < 0)
         {
            _loc5_ = 0;
         }
         if(param2.§1t1064s0§ > 0 && _loc6_ < 1)
         {
            _loc6_ = 1;
         }
         else if(_loc6_ < 0)
         {
            _loc6_ = 0;
         }
         if(param2.§1t1065s0§ > 0 && _loc7_ < 1)
         {
            _loc7_ = 1;
         }
         else if(_loc7_ < 0)
         {
            _loc7_ = 0;
         }
         switch(param1)
         {
            case mcs.§1t6231s0§[§1t75s0§.§1t12394s0§]:
            case mcs.§1t6231s0§[§1t75s0§.§1t12393s0§]:
            case mcs.§1t6231s0§[§1t75s0§.§1t12389s0§]:
               this.§1t1071s0§ = true;
               this.§1t3256s0§ = true;
               break;
            case mcs.§1t6231s0§[§1t75s0§.§1t12380s0§]:
               this.§1t3256s0§ = false;
               _loc3_ = 0;
               return false;
            default:
               this.§1t3256s0§ = true;
         }
         if(this.§1t3309s0§() > 0)
         {
            _loc3_ -= this.defense;
            if(_loc3_ < param2.§1t1088s0§())
            {
               _loc3_ = param2.§1t1088s0§();
            }
            if(this.§1t1071s0§)
            {
               _loc3_ *= 1.3;
            }
            if(param2.§1t1081s0§())
            {
               _loc3_ = 500;
               param2.§1t1066s0§ = §1t67s0§.§1t9119s0§;
            }
            this.§1t3308s0§(this.§1t3309s0§() - (_loc3_ + _loc4_ + _loc6_ + _loc5_ + _loc7_));
            this.§1t3301s0§();
            this.§1t3246s0§ = 12;
            this.§1t3254s0§ = 0;
            if(this.§1t3309s0§() > 0)
            {
               this.§1t1071s0§ = false;
               if(param2.§1t1078s0§())
               {
                  this.§1t3284s0§(param2.§1t1067s0§,param2.§1t1068s0§,param2.attackerlvl);
               }
               else if(param2.§1t1079s0§())
               {
                  this.§1t3285s0§(param2.§1t1067s0§,param2.§1t1068s0§);
               }
               else if((param2.§1t1073s0§() || this.actionState == §1t11147s0§ || this.actionState == §1t11145s0§ || this.actionState == §1t11144s0§) && !this.§1t3292s0§())
               {
                  this.§1t3280s0§();
               }
               else if(param2.§1t1075s0§())
               {
                  this.§1t3281s0§();
               }
               else if(param2.§1t1076s0§())
               {
                  this.§1t3282s0§(param2.§1t1067s0§,param2.§1t1068s0§);
               }
               else if(param2.§1t1077s0§())
               {
                  this.§1t3283s0§(param1.x,param1.y);
               }
               else if(param2.§1t1080s0§())
               {
                  this.§1t3286s0§(param2.§1t1067s0§,param2.§1t1068s0§);
               }
               if(_loc3_ > 0)
               {
                  §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc3_.toString(),10027008);
               }
               if(_loc4_ > 0)
               {
                  §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc4_.toString(),16737792);
               }
               if(_loc6_ > 0)
               {
                  §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc6_.toString(),13421772);
               }
               if(_loc5_ > 0)
               {
                  §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc5_.toString(),26367);
               }
               if(_loc7_ > 0)
               {
                  §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc7_.toString(),6697728);
               }
            }
            §1t88s0§.instance.§1t1508s0§();
         }
         return true;
      }
      
      public function §1t3278s0§() : Boolean
      {
         if(this.§1t3309s0§() <= 0)
         {
            this.§1t3298s0§();
            return true;
         }
         return false;
      }
      
      public function §1t3279s0§() : Boolean
      {
         return this.§1t3309s0§() <= 0;
      }
      
      internal function §1t3280s0§() : *
      {
         if(!this.§1t3261s0§ || this.§1t3292s0§() && !this.actionState == §1t11173s0§ || this.actionState == §1t11153s0§)
         {
            return;
         }
         if(this.actionState == §1t11147s0§ || this.actionState == §1t11145s0§ || this.actionState == §1t11144s0§ || this.actionState == §1t11173s0§)
         {
            this.velY = -20;
            if(§1t1559s0§().§1t6283s0§())
            {
               mcs.§1t5492s0§();
            }
            else
            {
               §1t1559s0§().§1t5493s0§();
            }
            this.§1t3269s0§(§1t11147s0§);
         }
         else
         {
            this.§1t3269s0§(§1t11147s0§);
            this.velY = -25;
         }
         if(§1t1559s0§().§1t6283s0§())
         {
            this.velX = -3;
         }
         else
         {
            this.velX = 3;
         }
      }
      
      internal function §1t3281s0§() : *
      {
         if(!this.§1t3262s0§ || this.§1t3292s0§() || this.actionState == §1t11153s0§)
         {
            return;
         }
         var _loc1_:int = §1t1525s0§.§1t4467s0§();
         if(mcs.y >= _loc1_)
         {
            mcs.y = _loc1_;
            this.§1t3269s0§(§1t11172s0§);
            mcs.§1t6280s0§();
         }
      }
      
      internal function §1t3282s0§(param1:int, param2:int) : *
      {
         if(!this.§1t3263s0§ || this.§1t3292s0§() || this.actionState == §1t11153s0§)
         {
            return;
         }
         if(this.§1t3309s0§() <= 0)
         {
            this.§1t3298s0§();
            return;
         }
         this.§1t3269s0§(§1t11173s0§);
         §1t1557s0§(§1t10305s0§);
         if(param1 > 0)
         {
            mcs.§1t5492s0§();
         }
         else
         {
            mcs.§1t5493s0§();
         }
         this.velX = param1;
         this.velY = param2;
         mcs.§1t6280s0§();
      }
      
      internal function §1t3283s0§(param1:int, param2:int) : *
      {
         if(!this.§1t3263s0§ || this.§1t3292s0§() || this.actionState == §1t11153s0§)
         {
            return;
         }
         if(this.§1t3309s0§() <= 0)
         {
            this.§1t3298s0§();
            return;
         }
         this.§1t3269s0§(§1t11173s0§);
         §1t1557s0§(§1t10305s0§);
         if(param1 > §1t1559s0§().x)
         {
            mcs.§1t5493s0§();
            this.velX = -20;
            this.velY = -10;
         }
         else
         {
            mcs.§1t5492s0§();
            this.velX = 20;
            this.velY = -10;
         }
         mcs.§1t6280s0§();
      }
      
      internal function §1t3284s0§(param1:int, param2:int, param3:int) : *
      {
         if(!this.§1t3264s0§ || this.§1t3292s0§() || this.actionState == §1t11153s0§)
         {
            return;
         }
         if(param1 > §1t1555s0§())
         {
            §1t1559s0§().§1t5493s0§();
         }
         else
         {
            §1t1559s0§().§1t5492s0§();
         }
         this.actionState = §1t11190s0§;
         §1t1557s0§(§1t10896s0§);
         setPosition(param1,param2);
      }
      
      internal function §1t3285s0§(param1:int, param2:int) : *
      {
         if(!this.§1t3264s0§ || this.§1t3292s0§() || this.actionState == §1t11153s0§)
         {
            return;
         }
         if(param1 > §1t1555s0§())
         {
            §1t1559s0§().§1t5493s0§();
         }
         else
         {
            §1t1559s0§().§1t5492s0§();
         }
         this.actionState = §1t11190s0§;
         §1t1557s0§(§1t10899s0§);
         setPosition(param1,param2);
         mcs.§1t6280s0§();
      }
      
      internal function §1t3286s0§(param1:int, param2:int = 0) : *
      {
         if(!this.§1t3265s0§ || this.§1t3292s0§() || this.actionState == §1t11153s0§)
         {
            return;
         }
         this.§1t3254s0§ = param1;
         this.actionState = §1t11174s0§;
         §1t1557s0§(§1t10783s0§);
         if(param2 != 0)
         {
            setPosition(param2,§1t1559s0§().y);
         }
      }
      
      internal function §1t3287s0§() : *
      {
         --this.§1t3254s0§;
         if(this.§1t3254s0§ <= 0)
         {
            this.§1t3269s0§(§1t11141s0§);
         }
      }
      
      internal function §1t3288s0§() : *
      {
         mcs.y += this.velY;
         §1t1553s0§(this.velX);
         this.velY += 3;
         if(this.velY < 0 && this.velY > -4)
         {
            §1t1557s0§(§1t10405s0§);
         }
         var _loc1_:int = §1t1525s0§.§1t4467s0§();
         if(this.velY > 0 && mcs.y >= _loc1_)
         {
            mcs.y = _loc1_;
            this.§1t3269s0§(§1t11152s0§);
            mcs.§1t6280s0§();
         }
         else if(this.velX < 0 && §1t1555s0§() < 20 || this.velX > 0 && §1t1555s0§() > §1t1525s0§.§1t8124s0§() - 20)
         {
            this.§1t3280s0§();
            this.velX *= 2;
         }
      }
      
      internal function §1t3289s0§() : *
      {
         if(mcs.animation == §1t10307s0§)
         {
            return;
         }
         mcs.y += this.velY;
         §1t1553s0§(this.velX);
         this.velY += 1;
         var _loc1_:int = §1t1525s0§.§1t4467s0§();
         if(this.velY > 0 && mcs.y >= _loc1_ - 10)
         {
            mcs.y = _loc1_;
            §1t1557s0§(§1t10307s0§);
         }
         else if(this.velX < 0 && §1t1555s0§() < 20 || this.velX > 0 && §1t1555s0§() > §1t1525s0§.§1t8124s0§() - 20)
         {
            this.§1t3280s0§();
            this.velX *= 2;
         }
      }
      
      public function §1t3290s0§() : *
      {
         if(this.actionState == §1t11169s0§ || this.actionState == §1t11149s0§)
         {
            return;
         }
         this.§1t3251s0§ = this.actionState;
         this.§1t3252s0§ = mcs.animation;
         this.§1t3253s0§ = mcs.§1t6269s0§;
         this.actionState = §1t11169s0§;
         §1t1557s0§(§1t10421s0§);
      }
      
      public function §1t3291s0§() : *
      {
         this.actionState = this.§1t3251s0§;
         §1t1557s0§(this.§1t3252s0§);
         mcs.§1t6269s0§ = this.§1t3253s0§;
      }
      
      public function §1t3292s0§() : Boolean
      {
         return this.actionState == §1t11152s0§ || this.actionState == §1t11172s0§ || this.actionState == §1t11173s0§ || this.actionState == §1t11190s0§;
      }
      
      public function §1t3293s0§() : Boolean
      {
         return this.actionState == §1t11145s0§ || mcs.y < §1t1525s0§.§1t4467s0§() - 50;
      }
      
      internal function §1t3294s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc5_:§1t63s0§ = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc11_:int = 0;
         var _loc4_:int = mcs.x;
         if(this.§1t3292s0§())
         {
            if(mcs.scaleX > 0)
            {
               _loc4_ -= 100;
            }
            else
            {
               _loc4_ += 100;
            }
         }
         var _loc9_:int = int(this.reward.loot.length);
         var _loc10_:int = 0;
         while(_loc10_ < _loc9_)
         {
            _loc5_ = this.reward.loot[_loc10_];
            _loc7_ = _loc5_.§1t760s0§();
            _loc8_ = _loc5_.getQty();
            _loc6_ = _loc5_.chance * 100;
            if(_loc6_ == 100 || Math.random() * 100 < _loc6_)
            {
               if(!§1t1525s0§.§1t9952s0§())
               {
                  _loc11_ = 0;
                  while(_loc11_ < _loc8_)
                  {
                     _loc1_ = Math.random() * 16 - 8;
                     if(posX < 100 && _loc1_ < 0)
                     {
                        _loc1_ *= -1;
                     }
                     else if(posX > §1t1525s0§.§1t8124s0§() - 100 && _loc1_ > 0)
                     {
                        _loc1_ *= -1;
                     }
                     _loc3_ = 20;
                     if(_loc1_ < 0)
                     {
                        _loc3_ = -20;
                     }
                     if(_loc7_ == 0)
                     {
                        _loc2_ = -Math.random() * 10 - 20;
                     }
                     else
                     {
                        _loc2_ = -Math.random() * 10 - 25;
                     }
                     §1t1712s0§.§1t11326s0§(_loc4_,mcs.y - 50,_loc1_,_loc2_,_loc3_,_loc7_);
                     _loc11_++;
                  }
               }
               if(_loc7_ == 0)
               {
                  §1t406s0§.instance.§1t6488s0§.§1t5846s0§(1 * _loc8_);
               }
               else if(_loc7_ == 1)
               {
                  §1t406s0§.instance.§1t6488s0§.§1t5846s0§(5 * _loc8_);
               }
               else if(_loc7_ == 2)
               {
                  §1t406s0§.instance.§1t6488s0§.§1t6183s0§();
               }
               else if(_loc7_ == 3)
               {
                  §1t406s0§.instance.§1t6488s0§.§1t6194s0§(this.level,false,true);
               }
               else
               {
                  §1t406s0§.instance.§1t6488s0§.§1t6186s0§(_loc7_,_loc8_);
               }
            }
            _loc10_++;
         }
      }
      
      internal function §1t3295s0§() : *
      {
         §1t406s0§.instance.§1t6488s0§.§1t6201s0§(§1t12070s0§(§1t1523s0§.getLevel(),this.level,this.xp,false));
      }
      
      public function getLevel() : int
      {
         return this.level;
      }
      
      internal function §1t3296s0§() : int
      {
         var _loc1_:int = §1t1523s0§.getLevel();
         if(this.level >= _loc1_ + 5)
         {
            return 4;
         }
         if(this.level >= _loc1_ + 3)
         {
            return 3;
         }
         if(this.level >= _loc1_ - 2)
         {
            return 2;
         }
         if(this.level > §1t12068s0§())
         {
            return 1;
         }
         return 0;
      }
      
      public function §1t3297s0§(param1:Boolean) : *
      {
         this.fatal = param1;
      }
      
      public function §1t3298s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         var _loc3_:MovieClip = null;
         if(mcs == null)
         {
            return;
         }
         §1t88s0§.instance.§1t1507s0§();
         if(!§1t1540s0§.§1t10015s0§() && !this.§1t3250s0§)
         {
            this.§1t3294s0§();
            this.§1t3295s0§();
         }
         if(this.actionState == §1t11147s0§)
         {
            this.§1t3258s0§ = true;
            return;
         }
         if(this.§1t3292s0§())
         {
            this.actionState = §1t11153s0§;
            §1t1557s0§(§1t10417s0§);
            if(!§1t1523s0§.§1t9471s0§)
            {
               this.§1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12392s0§),§1t1525s0§.§1t9942s0§(),90);
               this.§1t3248s0§.§1t2253s0§(15);
            }
            this.§1t3258s0§ = true;
            return;
         }
         if(mcs.animation == §1t10357s0§)
         {
            this.actionState = §1t11153s0§;
            if(!this.§1t1071s0§ || §1t1523s0§.§1t9471s0§)
            {
               §1t1557s0§(§1t10359s0§);
               if(!§1t1523s0§.§1t9471s0§)
               {
                  this.§1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12392s0§),§1t1525s0§.§1t9942s0§(),-90,0,5);
               }
            }
            else
            {
               §1t1557s0§(§1t10363s0§);
               _loc2_ = mcs.§1t6258s0§(§1t75s0§.§1t12393s0§);
               _loc1_ = Math.random() * 3;
               if(_loc1_ == 0)
               {
                  this.§1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12389s0§),§1t1525s0§.§1t9942s0§(),130);
               }
               else if(_loc1_ == 1)
               {
                  this.§1t3249s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,_loc2_,§1t1525s0§.§1t9942s0§(),180);
               }
               else
               {
                  this.§1t3249s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,_loc2_,§1t1525s0§.§1t9942s0§(),180);
                  this.§1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12389s0§),§1t1525s0§.§1t9942s0§(),130);
               }
               if(this.§1t3249s0§ != null)
               {
                  this.§1t3249s0§.§1t2251s0§(4);
                  this.§1t3249s0§.§1t2250s0§(10);
               }
            }
            this.§1t3258s0§ = true;
            return;
         }
         mcs.y = §1t1525s0§.§1t4467s0§();
         this.actionState = §1t11153s0§;
         if(Math.random() * 2 < 1)
         {
            if(§1t1559s0§().§1t6283s0§())
            {
               §1t1559s0§().§1t5492s0§();
            }
            else
            {
               §1t1559s0§().§1t5493s0§();
            }
         }
         if(!§1t1523s0§.§1t9471s0§ && this.fatal)
         {
            if(this.§1t1071s0§)
            {
               §1t1557s0§(§1t10413s0§);
               _loc3_ = mcs.§1t6258s0§(§1t75s0§.§1t12393s0§);
               _loc1_ = Math.random() * 3;
               if(_loc1_ == 0)
               {
                  this.§1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12389s0§),§1t1525s0§.§1t9942s0§(),130);
               }
               else if(_loc1_ == 1)
               {
                  this.§1t3249s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,_loc3_,§1t1525s0§.§1t9942s0§(),180);
               }
               else
               {
                  this.§1t3249s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,_loc3_,§1t1525s0§.§1t9942s0§(),180);
                  this.§1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12389s0§),§1t1525s0§.§1t9942s0§(),130);
               }
               if(this.§1t3249s0§ != null)
               {
                  this.§1t3249s0§.§1t2251s0§(4);
                  this.§1t3249s0§.§1t2250s0§(10);
               }
            }
            else
            {
               _loc1_ = Math.random() * 7;
               if(_loc1_ <= 1)
               {
                  §1t1557s0§(§1t10409s0§);
                  this.§1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12392s0§),§1t1525s0§.§1t9942s0§(),80);
                  this.§1t3248s0§.§1t2253s0§(15);
               }
               else if(_loc1_ == 2)
               {
                  §1t1557s0§(§1t10291s0§);
                  this.§1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12389s0§),§1t1525s0§.§1t9942s0§(),-90,0,5);
               }
               else if(_loc1_ == 3 && !§1t1525s0§.§1t9952s0§())
               {
                  §1t1557s0§(§1t10289s0§);
                  if(int(Math.random() * 2) == 0)
                  {
                     this.§1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12389s0§),§1t1525s0§.§1t9942s0§(),-90,0,5);
                  }
                  else
                  {
                     this.§1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12390s0§),§1t1525s0§.§1t9942s0§(),-90,0,-10);
                  }
               }
               else if(_loc1_ == 4)
               {
                  §1t1557s0§(§1t10411s0§);
                  _loc1_ = Math.random() * 3;
                  if(_loc1_ == 0)
                  {
                     this.§1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12389s0§),§1t1525s0§.§1t9942s0§(),60);
                  }
                  else if(_loc1_ == 1)
                  {
                     this.§1t3249s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12378s0§),§1t1525s0§.§1t9942s0§(),180);
                  }
                  else
                  {
                     this.§1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12389s0§),§1t1525s0§.§1t9942s0§(),60);
                     this.§1t3249s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12378s0§),§1t1525s0§.§1t9942s0§(),180);
                  }
                  if(this.§1t3249s0§ != null)
                  {
                     this.§1t3249s0§.§1t2251s0§(5);
                  }
               }
               else if(_loc1_ == 5)
               {
                  §1t1557s0§(§1t10419s0§);
                  _loc1_ = Math.random() * 3;
                  if(_loc1_ == 0)
                  {
                     this.§1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12390s0§),§1t1525s0§.§1t9942s0§(),180);
                  }
                  else if(_loc1_ == 1)
                  {
                     this.§1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12391s0§),§1t1525s0§.§1t9942s0§(),120);
                  }
                  else
                  {
                     this.§1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12390s0§),§1t1525s0§.§1t9942s0§(),180);
                     this.§1t3249s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12391s0§),§1t1525s0§.§1t9942s0§(),120);
                  }
               }
               else
               {
                  §1t1557s0§(§1t10409s0§);
                  this.§1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12390s0§),§1t1525s0§.§1t9942s0§(),80);
                  this.§1t3248s0§.§1t2253s0§(15);
                  if(!mcs.§1t3312s0§)
                  {
                     mcs.hair.visible = true;
                     mcs.§1t6235s0§.visible = false;
                     mcs.§1t6278s0§();
                     mcs.§1t6276s0§();
                  }
               }
            }
         }
         else if(this.§1t1071s0§)
         {
            §1t1557s0§(§1t10409s0§);
            if(!mcs.§1t3312s0§)
            {
               mcs.hair.visible = true;
               mcs.§1t6235s0§.visible = false;
               mcs.§1t6276s0§();
            }
         }
         else
         {
            _loc1_ = Math.random() * 5;
            if(_loc1_ <= 1)
            {
               §1t1557s0§(§1t10409s0§);
            }
            else if(_loc1_ == 2)
            {
               §1t1557s0§(§1t10291s0§);
            }
            else if(_loc1_ == 3 && !§1t1525s0§.§1t9952s0§())
            {
               §1t1557s0§(§1t10289s0§);
            }
            else
            {
               §1t1557s0§(§1t10409s0§);
               mcs.§1t6278s0§();
            }
         }
         this.§1t3258s0§ = true;
         mcs.§1t6280s0§();
      }
      
      internal function §1t3299s0§() : *
      {
         if(this.§1t3248s0§ != null)
         {
            this.§1t3248s0§.destroy();
         }
         if(this.§1t3249s0§ != null)
         {
            this.§1t3249s0§.destroy();
         }
         if(§1t1525s0§.§1t9952s0§())
         {
            return;
         }
         --this.ttl;
         if(this.ttl < 12)
         {
            mcs.alpha = this.ttl / 12;
         }
         if(this.ttl <= 0)
         {
            mcs.visible = false;
            mcs.§1t3305s0§();
            mcs = null;
         }
      }
      
      internal function §1t3300s0§() : *
      {
         if(§1t1525s0§.§1t9952s0§())
         {
            return;
         }
         --this.ttl;
         if(this.ttl < 12)
         {
            mcs.alpha = this.ttl / 12;
         }
         if(this.ttl <= 0)
         {
            mcs.visible = false;
            mcs.§1t3305s0§();
            mcs = null;
         }
      }
      
      internal function §1t3301s0§() : *
      {
         if(this.§1t3309s0§() <= 0)
         {
            mcs.§1t6280s0§();
         }
         else
         {
            mcs.§1t6279s0§();
         }
         mcs.§1t3301s0§(this.§1t3309s0§() / this.§1t3257s0§);
      }
      
      internal function §1t3302s0§() : §1t249s0§
      {
         return mcs.§1t3302s0§();
      }
      
      public function §1t3303s0§(param1:§1t68s0§) : *
      {
         if(!param1.§1t3258s0§)
         {
            this.target = param1;
         }
      }
      
      public function §1t3304s0§() : *
      {
         if(this.target.§1t1559s0§().x < §1t1559s0§().x)
         {
            mcs.§1t5492s0§();
         }
         else
         {
            mcs.§1t5493s0§();
         }
      }
      
      public function §1t3305s0§() : *
      {
         if(mcs != null)
         {
            mcs.§1t3305s0§();
            mcs = null;
         }
      }
      
      public function §1t3306s0§() : String
      {
         return this.nid;
      }
      
      public function §1t3307s0§(param1:Number) : *
      {
         mcs.scaleX = param1;
         mcs.scaleY = param1;
      }
      
      public function §1t3308s0§(param1:int) : *
      {
         this.hp = param1 * §1t1523s0§.§1t9383s0§;
      }
      
      public function §1t3309s0§() : int
      {
         return this.hp / §1t1523s0§.§1t9383s0§;
      }
      
      public function §1t2364s0§() : Boolean
      {
         return this.§1t3258s0§;
      }
      
      public function §1t2292s0§() : *
      {
         mcs.§1t6280s0§();
         if(mcs.alpha < 1)
         {
            mcs.visible = false;
         }
         else
         {
            §1t1643s0§.§1t11216s0§(mcs,-255);
         }
         if(this.actionState != §1t11147s0§ && this.actionState != §1t11153s0§ && this.actionState != §1t11173s0§)
         {
            this.§1t3260s0§ = true;
         }
      }
      
      public function §1t3310s0§() : *
      {
         this.§1t3260s0§ = false;
      }
      
      public function §1t3311s0§() : *
      {
         if(mcs != null)
         {
            §1t1643s0§.§1t3311s0§(mcs);
         }
      }
      
      public function §1t3312s0§() : Boolean
      {
         return this.controlledBy == 0;
      }
      
      public function §1t3313s0§() : Boolean
      {
         return this.controlledBy == 1;
      }
      
      public function §1t3314s0§() : Boolean
      {
         return this.controlledBy == 2;
      }
      
      public function §1t3315s0§() : Boolean
      {
         return this.controlledBy == 3;
      }
      
      public function §1t3316s0§() : Boolean
      {
         return this.controlledBy == 4;
      }
   }
}

