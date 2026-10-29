package
{
   import flash.geom.Point;
   
   public class §1t122s0§ extends §1t99s0§
   {
      
      internal var charname:String;
      
      internal var equipmentStr:String;
      
      internal var statStr:String;
      
      internal var skillStr:String;
      
      internal var tauntStr:String;
      
      internal var §1t4876s0§:Boolean = false;
      
      internal var §1t4528s0§:Boolean = false;
      
      internal var §1t4877s0§:Array;
      
      internal var side:int;
      
      internal var §1t4527s0§:Boolean = false;
      
      internal var spectator:int = 0;
      
      internal var §1t4887s0§:Array = [§1t120s0§.§1t10148s0§,§1t120s0§.§1t10155s0§,§1t120s0§.§1t10151s0§,§1t120s0§.§1t10129s0§,§1t120s0§.§1t10133s0§,§1t120s0§.§1t10143s0§,§1t120s0§.§1t10145s0§,§1t120s0§.§1t10144s0§,§1t120s0§.§1t10146s0§,§1t120s0§.§1t10147s0§,§1t120s0§.§1t10149s0§,§1t120s0§.§1t10150s0§,§1t120s0§.§1t10152s0§,§1t120s0§.§1t10154s0§,§1t120s0§.§1t10159s0§,§1t120s0§.§1t10163s0§];
      
      internal var §1t4888s0§:Array = [§1t120s0§.§1t10129s0§,§1t120s0§.§1t10133s0§,§1t120s0§.§1t10143s0§,§1t120s0§.§1t10145s0§,§1t120s0§.§1t10144s0§,§1t120s0§.§1t10146s0§,§1t120s0§.§1t10148s0§,§1t120s0§.§1t10152s0§,§1t120s0§.§1t10154s0§,§1t120s0§.§1t10159s0§,§1t120s0§.§1t10158s0§,§1t120s0§.§1t10165s0§,§1t120s0§.§1t10166s0§];
      
      internal var §1t4889s0§:Array = [§1t120s0§.§1t10158s0§,§1t120s0§.§1t10157s0§,§1t120s0§.§1t10156s0§,§1t120s0§.§1t10147s0§,§1t120s0§.§1t10146s0§,§1t120s0§.§1t10130s0§,§1t120s0§.§1t10134s0§,§1t120s0§.§1t10135s0§,§1t120s0§.§1t10136s0§,§1t120s0§.§1t10137s0§,§1t120s0§.§1t10138s0§,§1t120s0§.§1t10139s0§,§1t120s0§.§1t10140s0§,§1t120s0§.§1t10141s0§,§1t120s0§.§1t10142s0§,§1t120s0§.§1t10153s0§,§1t120s0§.§1t10154s0§,§1t120s0§.§1t10160s0§,§1t120s0§.§1t10162s0§,§1t120s0§.§1t10132s0§,§1t120s0§.§1t10165s0§,§1t120s0§.§1t10166s0§];
      
      internal var §1t4890s0§:Array = [§1t120s0§.§1t10130s0§,§1t120s0§.§1t10134s0§,§1t120s0§.§1t10135s0§,§1t120s0§.§1t10136s0§,§1t120s0§.§1t10137s0§,§1t120s0§.§1t10138s0§,§1t120s0§.§1t10139s0§,§1t120s0§.§1t10140s0§,§1t120s0§.§1t10141s0§,§1t120s0§.§1t10142s0§,§1t120s0§.§1t10153s0§,§1t120s0§.§1t10154s0§,§1t120s0§.§1t10160s0§,§1t120s0§.§1t10162s0§,§1t120s0§.§1t10132s0§,§1t120s0§.§1t10165s0§];
      
      internal var §1t4892s0§:Array = new Array();
      
      public function §1t122s0§(param1:§1t75s0§ = null, param2:Boolean = false, param3:Boolean = false)
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
         §1t3269s0§(§1t11145s0§);
         §1t3244s0§ = 12;
         this.§1t4876s0§ = param2;
         this.§1t4528s0§ = param3;
      }
      
      override public function setLevel(param1:int) : *
      {
         var _loc2_:Number = NaN;
         var _loc4_:§1t105s0§ = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         _loc2_ = param1 / level;
         level = param1;
         minDamage = damage * _loc2_;
         defense *= _loc2_;
         §1t3257s0§ *= _loc2_;
         §1t3308s0§(§1t3257s0§);
         §1t4413s0§ = 10 * param1;
         §1t4442s0§(§1t4413s0§);
         §1t3301s0§();
         if(this.§1t4528s0§ || this.§1t4876s0§)
         {
            xp = param1 * 5 + 45;
            _loc6_ = 16777215;
            if(this.§1t4896s0§())
            {
               _loc6_ = 39423;
            }
            else if(this.§1t4895s0§())
            {
               _loc6_ = 0;
            }
            if(param1 > 0 && !this.§1t4895s0§())
            {
               mcs.§1t6287s0§(this.charname + " (" + param1 + ")",_loc6_);
            }
            else
            {
               mcs.§1t6287s0§(this.charname,_loc6_);
            }
         }
         else
         {
            xp = param1 * 2 + 20;
         }
         if(this.§1t4528s0§)
         {
            _loc7_ = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9403s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t9403s0§);
            _loc8_ = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9409s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t9409s0§);
            _loc9_ = §1t1523s0§.§1t1088s0§() + §1t1523s0§.§1t9591s0§() / 2;
            _loc10_ = §1t1523s0§.getLevel();
            _loc11_ = param1 - _loc10_;
            _loc12_ = 8 + _loc11_;
            _loc13_ = 16 - _loc11_;
            if(_loc12_ <= 0)
            {
               _loc12_ = 1;
            }
            if(_loc13_ <= 3)
            {
               _loc13_ = 3;
            }
            _loc14_ = _loc9_ - defense;
            if(_loc10_ <= 10 && _loc14_ < 1)
            {
               _loc14_ = 1;
            }
            else if(_loc10_ <= 20 && _loc14_ < _loc10_ / 8)
            {
               _loc14_ = _loc10_ / 8;
            }
            else if(_loc10_ <= 30 && _loc14_ < _loc10_ / 6)
            {
               _loc14_ = _loc10_ / 6;
            }
            else if(_loc14_ < _loc10_ / 4)
            {
               _loc14_ = _loc10_ / 4;
            }
            _loc15_ = _loc14_ * _loc12_;
            if(_loc15_ > §1t3257s0§)
            {
               §1t3257s0§ = _loc15_;
               §1t3308s0§(§1t3257s0§);
               §1t3301s0§();
            }
            minDamage = 1;
            §1t1244s0§ = _loc7_ / _loc13_;
         }
         if(param1 <= 5)
         {
            minDamage = 1;
            §1t1244s0§ = minDamage;
            defense = 1;
         }
         this.§1t4879s0§();
         var _loc3_:int = int(§1t1222s0§.length);
         this.§1t4877s0§ = new Array();
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_ = §1t1524s0§.§1t9863s0§(§1t1222s0§[_loc5_].§1t760s0§());
            if(_loc4_ != null)
            {
               this.§1t4877s0§[§1t1222s0§[_loc5_].§1t760s0§()] = _loc4_.§1t1465s0§(§1t1222s0§[_loc5_].§1t761s0§());
            }
            _loc5_++;
         }
         §1t3489s0§(stance);
      }
      
      internal function §1t4879s0§() : *
      {
         §1t1222s0§ = new Vector.<§1t57s0§>();
         var _loc1_:§1t58s0§ = §1t58s0§.§1t8804s0§(§1t1525s0§.§1t9935s0§() * §1t3317s0§.instance.§1t1848s0§() + §1t1525s0§.§1t7341s0§() * 3);
         if(level >= 6)
         {
            if(_loc1_.rand(2) == 0)
            {
               §1t1222s0§.push(new §1t57s0§(1014,1));
            }
         }
         if(level >= 20)
         {
            if(_loc1_.rand(2) == 0)
            {
               §1t1222s0§.push(new §1t57s0§(1015,1));
            }
         }
         if(level >= 12)
         {
            if(_loc1_.rand(2) == 0)
            {
               §1t1222s0§.push(new §1t57s0§(1036,1));
            }
         }
         if(level >= 70)
         {
            if(_loc1_.rand(2) == 0)
            {
               §1t1222s0§.push(new §1t57s0§(1039,1));
            }
         }
         if(level >= 6)
         {
            if(_loc1_.rand(2) == 0)
            {
               §1t1222s0§.push(new §1t57s0§(1016,1));
            }
         }
         if(level >= 20)
         {
            if(_loc1_.rand(2) == 0)
            {
               §1t1222s0§.push(new §1t57s0§(1017,1));
            }
         }
         if(level >= 12)
         {
            if(_loc1_.rand(2) == 0)
            {
               §1t1222s0§.push(new §1t57s0§(1037,1));
            }
         }
         if(level >= 70)
         {
            if(_loc1_.rand(2) == 0)
            {
               §1t1222s0§.push(new §1t57s0§(1040,1));
            }
         }
         if(level >= 6)
         {
            if(_loc1_.rand(2) == 0)
            {
               §1t1222s0§.push(new §1t57s0§(1018,1));
            }
         }
         if(level >= 20)
         {
            if(_loc1_.rand(2) == 0)
            {
               §1t1222s0§.push(new §1t57s0§(1019,1));
            }
         }
         if(level >= 12)
         {
            if(_loc1_.rand(2) == 0)
            {
               §1t1222s0§.push(new §1t57s0§(1038,1));
            }
         }
         if(level >= 70)
         {
            if(_loc1_.rand(2) == 0)
            {
               §1t1222s0§.push(new §1t57s0§(1041,1));
            }
         }
         if(level >= 10)
         {
            if(_loc1_.rand(3) == 0)
            {
               §1t1222s0§.push(new §1t57s0§(1005,3));
            }
            else if(level >= 7)
            {
               if(_loc1_.rand(3) == 0)
               {
                  §1t1222s0§.push(new §1t57s0§(1005,2));
               }
               else if(level >= 5)
               {
                  if(_loc1_.rand(3) == 0)
                  {
                     §1t1222s0§.push(new §1t57s0§(1005,1));
                  }
               }
            }
         }
         if(level >= 20)
         {
            if(_loc1_.rand(3) == 0)
            {
               §1t1222s0§.push(new §1t57s0§(1006,3));
            }
            else if(level >= 17)
            {
               if(_loc1_.rand(3) == 0)
               {
                  §1t1222s0§.push(new §1t57s0§(1006,2));
               }
               else if(level >= 15)
               {
                  if(_loc1_.rand(3) == 0)
                  {
                     §1t1222s0§.push(new §1t57s0§(1006,1));
                  }
               }
            }
         }
         if(level >= 5)
         {
            if(_loc1_.rand(3) == 0)
            {
               §1t1222s0§.push(new §1t57s0§(1042,3));
            }
            else if(level >= 2)
            {
               if(_loc1_.rand(3) == 0)
               {
                  §1t1222s0§.push(new §1t57s0§(1042,2));
               }
               else if(level >= 0)
               {
                  if(_loc1_.rand(3) == 0)
                  {
                     §1t1222s0§.push(new §1t57s0§(1042,1));
                  }
               }
            }
         }
         if(level >= 30)
         {
            if(_loc1_.rand(3) == 0)
            {
               §1t1222s0§.push(new §1t57s0§(1043,3));
            }
            else if(level >= 27)
            {
               if(_loc1_.rand(3) == 0)
               {
                  §1t1222s0§.push(new §1t57s0§(1043,2));
               }
               else if(level >= 25)
               {
                  if(_loc1_.rand(3) == 0)
                  {
                     §1t1222s0§.push(new §1t57s0§(1043,1));
                  }
               }
            }
         }
         if(level >= 40)
         {
            if(_loc1_.rand(3) == 0)
            {
               §1t1222s0§.push(new §1t57s0§(1044,3));
            }
            else if(level >= 37)
            {
               if(_loc1_.rand(3) == 0)
               {
                  §1t1222s0§.push(new §1t57s0§(1044,2));
               }
               else if(level >= 35)
               {
                  if(_loc1_.rand(3) == 0)
                  {
                     §1t1222s0§.push(new §1t57s0§(1044,1));
                  }
               }
            }
         }
         if(level >= 50)
         {
            if(_loc1_.rand(3) == 0)
            {
               §1t1222s0§.push(new §1t57s0§(1045,3));
            }
            else if(level >= 47)
            {
               if(_loc1_.rand(3) == 0)
               {
                  §1t1222s0§.push(new §1t57s0§(1045,2));
               }
               else if(level >= 45)
               {
                  if(_loc1_.rand(3) == 0)
                  {
                     §1t1222s0§.push(new §1t57s0§(1045,1));
                  }
               }
            }
         }
         if(level >= 60)
         {
            if(_loc1_.rand(3) == 0)
            {
               §1t1222s0§.push(new §1t57s0§(1046,3));
            }
            else if(level >= 57)
            {
               if(_loc1_.rand(3) == 0)
               {
                  §1t1222s0§.push(new §1t57s0§(1046,2));
               }
               else if(level >= 55)
               {
                  if(_loc1_.rand(3) == 0)
                  {
                     §1t1222s0§.push(new §1t57s0§(1046,1));
                  }
               }
            }
         }
         if(level >= 70)
         {
            if(_loc1_.rand(3) == 0)
            {
               §1t1222s0§.push(new §1t57s0§(1047,3));
            }
            else if(level >= 67)
            {
               if(_loc1_.rand(3) == 0)
               {
                  §1t1222s0§.push(new §1t57s0§(1047,2));
               }
               else if(level >= 65)
               {
                  if(_loc1_.rand(3) == 0)
                  {
                     §1t1222s0§.push(new §1t57s0§(1047,1));
                  }
               }
            }
         }
         if(level >= 75)
         {
            if(_loc1_.rand(3) == 0)
            {
               §1t1222s0§.push(new §1t57s0§(1048,1));
            }
         }
         §1t1222s0§.push(new §1t57s0§(1003,1));
         §1t1222s0§.push(new §1t57s0§(1049,1));
         §1t1222s0§.push(new §1t57s0§(1050,1));
         if(level >= 8)
         {
            §1t1222s0§.push(new §1t57s0§(1004,3));
         }
         else if(level >= 5)
         {
            §1t1222s0§.push(new §1t57s0§(1004,2));
         }
         else if(level >= 3)
         {
            §1t1222s0§.push(new §1t57s0§(1004,1));
         }
         if(level >= 30)
         {
            if(_loc1_.rand(3) == 0)
            {
               §1t1222s0§.push(new §1t57s0§(1007,3));
            }
            else if(level >= 20)
            {
               if(_loc1_.rand(3) == 0)
               {
                  §1t1222s0§.push(new §1t57s0§(1007,2));
               }
               else if(level >= 10)
               {
                  if(_loc1_.rand(3) == 0)
                  {
                     §1t1222s0§.push(new §1t57s0§(1007,1));
                  }
               }
            }
         }
         if(level >= 25)
         {
            if(_loc1_.rand(2) == 0)
            {
               §1t1222s0§.push(new §1t57s0§(1010,3));
            }
            else if(level >= 22)
            {
               if(_loc1_.rand(2) == 0)
               {
                  §1t1222s0§.push(new §1t57s0§(1010,2));
               }
               else if(level >= 20)
               {
                  if(_loc1_.rand(2) == 0)
                  {
                     §1t1222s0§.push(new §1t57s0§(1010,1));
                  }
               }
            }
         }
         if(level >= 75)
         {
            if(_loc1_.rand(3) == 0)
            {
               §1t1222s0§.push(new §1t57s0§(1012,3));
            }
            else if(level >= 72)
            {
               if(_loc1_.rand(3) == 0)
               {
                  §1t1222s0§.push(new §1t57s0§(1012,2));
               }
               else if(level >= 70)
               {
                  if(_loc1_.rand(3) == 0)
                  {
                     §1t1222s0§.push(new §1t57s0§(1012,1));
                  }
               }
            }
         }
         if(level >= 20)
         {
            if(_loc1_.rand(3) == 0)
            {
               §1t1222s0§.push(new §1t57s0§(1024,3));
            }
            else if(level >= 17)
            {
               if(_loc1_.rand(3) == 0)
               {
                  §1t1222s0§.push(new §1t57s0§(1024,2));
               }
               else if(level >= 15)
               {
                  if(_loc1_.rand(3) == 0)
                  {
                     §1t1222s0§.push(new §1t57s0§(1024,1));
                  }
               }
            }
         }
         if(level >= 35)
         {
            if(_loc1_.rand(3) == 0)
            {
               §1t1222s0§.push(new §1t57s0§(1051,3));
            }
            else if(level >= 32)
            {
               if(_loc1_.rand(3) == 0)
               {
                  §1t1222s0§.push(new §1t57s0§(1051,2));
               }
               else if(level >= 30)
               {
                  if(_loc1_.rand(3) == 0)
                  {
                     §1t1222s0§.push(new §1t57s0§(1051,1));
                  }
               }
            }
         }
         if(level >= 45)
         {
            if(_loc1_.rand(4) == 0)
            {
               §1t1222s0§.push(new §1t57s0§(1052,3));
            }
            else if(level >= 42)
            {
               if(_loc1_.rand(4) == 0)
               {
                  §1t1222s0§.push(new §1t57s0§(1052,2));
               }
               else if(level >= 40)
               {
                  if(_loc1_.rand(4) == 0)
                  {
                     §1t1222s0§.push(new §1t57s0§(1052,1));
                  }
               }
            }
         }
         if(level >= 55)
         {
            if(_loc1_.rand(3) == 0)
            {
               §1t1222s0§.push(new §1t57s0§(1053,3));
            }
            else if(level >= 52)
            {
               if(_loc1_.rand(3) == 0)
               {
                  §1t1222s0§.push(new §1t57s0§(1053,2));
               }
               else if(level >= 50)
               {
                  if(_loc1_.rand(3) == 0)
                  {
                     §1t1222s0§.push(new §1t57s0§(1053,1));
                  }
               }
            }
         }
         if(level >= 65)
         {
            if(_loc1_.rand(3) == 0)
            {
               §1t1222s0§.push(new §1t57s0§(1054,3));
            }
            else if(level >= 62)
            {
               if(_loc1_.rand(3) == 0)
               {
                  §1t1222s0§.push(new §1t57s0§(1054,2));
               }
               else if(level >= 60)
               {
                  if(_loc1_.rand(3) == 0)
                  {
                     §1t1222s0§.push(new §1t57s0§(1054,1));
                  }
               }
            }
         }
         if(level >= 80)
         {
            if(_loc1_.rand(3) == 0)
            {
               §1t1222s0§.push(new §1t57s0§(1055,1));
            }
         }
         if(§1t1235s0§ == 0)
         {
            if(_loc1_.rand(3) == 0)
            {
               §1t1235s0§ = _loc1_.rand(level * 1.5);
            }
         }
         if(§1t1235s0§ > 0)
         {
            if(level >= 20)
            {
               if(_loc1_.rand(2) == 0)
               {
                  §1t1222s0§.push(new §1t57s0§(1013,1));
               }
            }
            if(level >= 20)
            {
               if(_loc1_.rand(2) == 0)
               {
                  §1t1222s0§.push(new §1t57s0§(1025,1));
               }
            }
            if(level >= 20)
            {
               if(_loc1_.rand(2) == 0)
               {
                  §1t1222s0§.push(new §1t57s0§(1029,1));
               }
            }
         }
         if(§1t1237s0§ == 0)
         {
            if(_loc1_.rand(3) == 0)
            {
               §1t1237s0§ = _loc1_.rand(level * 1.5);
            }
         }
         if(§1t1237s0§ > 0)
         {
            if(level >= 20)
            {
               if(_loc1_.rand(2) == 0)
               {
                  §1t1222s0§.push(new §1t57s0§(1026,1));
               }
            }
            if(level >= 20)
            {
               if(_loc1_.rand(2) == 0)
               {
                  §1t1222s0§.push(new §1t57s0§(1030,1));
               }
            }
            if(level >= 20)
            {
               if(_loc1_.rand(2) == 0)
               {
                  §1t1222s0§.push(new §1t57s0§(1035,1));
               }
            }
         }
         if(§1t1236s0§ == 0)
         {
            if(_loc1_.rand(3) == 0)
            {
               §1t1236s0§ = _loc1_.rand(level * 1.5);
            }
         }
         if(§1t1236s0§ > 0)
         {
            if(level >= 20)
            {
               if(_loc1_.rand(2) == 0)
               {
                  §1t1222s0§.push(new §1t57s0§(1027,1));
               }
            }
            if(level >= 20)
            {
               if(_loc1_.rand(2) == 0)
               {
                  §1t1222s0§.push(new §1t57s0§(1031,1));
               }
            }
            if(level >= 20)
            {
               if(_loc1_.rand(2) == 0)
               {
                  §1t1222s0§.push(new §1t57s0§(1034,1));
               }
            }
         }
         if(§1t1238s0§ == 0)
         {
            if(_loc1_.rand(3) == 0)
            {
               §1t1238s0§ = _loc1_.rand(level * 1.5);
            }
         }
         if(§1t1238s0§ > 0)
         {
            if(level >= 20)
            {
               if(_loc1_.rand(2) == 0)
               {
                  §1t1222s0§.push(new §1t57s0§(1028,1));
               }
            }
            if(level >= 20)
            {
               if(_loc1_.rand(2) == 0)
               {
                  §1t1222s0§.push(new §1t57s0§(1032,1));
               }
            }
            if(level >= 20)
            {
               if(_loc1_.rand(2) == 0)
               {
                  §1t1222s0§.push(new §1t57s0§(1033,1));
               }
            }
         }
         _loc1_.destroy();
      }
      
      override public function init(param1:§1t76s0§) : *
      {
         reset();
         §1t1550s0§(param1.mcs);
         this.§1t4880s0§(param1);
      }
      
      internal function §1t4880s0§(param1:§1t76s0§) : *
      {
         var _loc8_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:§1t105s0§ = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc2_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1.mcs.weapon);
         if(_loc2_ == null)
         {
            _loc2_ = §1t1524s0§.§1t9862s0§(13002);
         }
         var _loc3_:int = 48 + param1.speed * 6;
         var _loc4_:int = param1.speed;
         var _loc5_:int = 90;
         var _loc6_:int = 120 + Math.floor(_loc5_ * _loc4_ / (20 + _loc4_));
         var _loc7_:int = param1.§1t1255s0§(1000);
         _loc8_ = param1.§1t1255s0§(1001);
         var _loc9_:int = param1.§1t1255s0§(1002);
         §1t4443s0§(param1.controlledBy,param1.currenthp,param1.hp,param1.currentchi,param1.chi,param1.defense,_loc3_,param1.minDamage,param1.damageRange,_loc6_,param1.slashUsage,_loc7_,_loc8_,_loc9_,param1.lvl);
         §1t4445s0§(param1.attack,param1.§1t1235s0§,param1.§1t1236s0§,param1.§1t1237s0§,param1.§1t1238s0§);
         §1t4446s0§(param1.§1t1239s0§,param1.§1t1240s0§,param1.§1t1241s0§,param1.§1t1242s0§);
         if(controlledBy == 1)
         {
            §1t3308s0§(param1.hp);
         }
         nid = param1.nid;
         this.charname = param1.§1t509s0§();
         if(this.§1t4876s0§ || this.§1t4528s0§)
         {
            _loc10_ = 16777215;
            if(this.§1t4896s0§())
            {
               _loc10_ = 39423;
            }
            else if(this.§1t4895s0§())
            {
               _loc10_ = 0;
            }
            if(this.side != 0 && this.side != §1t1523s0§.§1t7746s0§())
            {
               _loc10_ = 10027008;
            }
            if(level > 0 && !this.§1t4895s0§())
            {
               mcs.§1t6287s0§(param1.§1t509s0§() + " (" + level + ")",_loc10_);
            }
            else
            {
               mcs.§1t6287s0§(param1.§1t509s0§(),_loc10_);
            }
            if(controlledBy == 1)
            {
               if(level > 30 && level < 80)
               {
                  minDamage *= 1.1;
                  §1t3257s0§ *= 1.1;
                  §1t3308s0§(§1t3257s0§);
               }
               else if(level < 10)
               {
                  minDamage *= 0.9;
                  §1t3257s0§ *= 0.9;
                  §1t3308s0§(§1t3257s0§);
               }
            }
         }
         else
         {
            mcs.§1t6287s0§("");
            minDamage = param1.attack;
            damageRange = 0;
         }
         mcs.§1t6288s0§("");
         reward = param1.§1t992s0§();
         mcs.§1t6279s0§();
         §1t3301s0§();
         xp = level * 5 + 45;
         §1t4428s0§ = true;
         if(!this.§1t4528s0§)
         {
            §1t1222s0§ = param1.§1t1222s0§;
            _loc11_ = int(§1t1222s0§.length);
            this.§1t4877s0§ = new Array();
            _loc13_ = 0;
            while(_loc13_ < _loc11_)
            {
               _loc12_ = §1t1524s0§.§1t9863s0§(§1t1222s0§[_loc13_].§1t760s0§());
               if(_loc12_ != null)
               {
                  this.§1t4877s0§[§1t1222s0§[_loc13_].§1t760s0§()] = _loc12_.§1t1465s0§(§1t1222s0§[_loc13_].§1t761s0§());
               }
               _loc13_++;
            }
         }
         else
         {
            §1t1222s0§ = new Vector.<§1t57s0§>();
         }
         if(param1.stance != -1)
         {
            §1t3489s0§(param1.stance);
         }
         else if(param1.§1t1255s0§(1500) > 0)
         {
            §1t3489s0§(§1t12224s0§);
         }
         else if(param1.§1t1255s0§(1501) > 0)
         {
            §1t3489s0§(§1t12223s0§);
         }
         else if(_loc7_ == _loc8_ && _loc8_ == _loc9_)
         {
            §1t3489s0§(Math.random() * 3);
         }
         else
         {
            _loc14_ = 1;
            if(_loc7_ > _loc8_ && _loc7_ >= _loc9_)
            {
               _loc14_ = 0;
            }
            if(_loc9_ > _loc8_ && _loc9_ >= _loc7_)
            {
               _loc14_ = 2;
            }
            §1t3489s0§(_loc14_);
         }
         if(mcs.y == §1t1525s0§.§1t4467s0§())
         {
            §1t3269s0§(§1t11141s0§);
         }
         else
         {
            §1t3269s0§(§1t11145s0§);
         }
      }
      
      public function §1t4881s0§(param1:String, param2:String, param3:int, param4:String, param5:String, param6:String, param7:String, param8:int, param9:int, param10:Boolean) : *
      {
         var _loc12_:§1t76s0§ = null;
         controlledBy = 2;
         reset();
         mcs.§1t5491s0§(param4);
         this.equipmentStr = param4;
         this.charname = param2;
         this.side = param9;
         var _loc11_:int = 16777215;
         if(this.§1t4896s0§())
         {
            _loc11_ = 39423;
         }
         else if(this.§1t4895s0§())
         {
            _loc11_ = 0;
         }
         if(param3 > 0 && !this.§1t4895s0§())
         {
            mcs.§1t6287s0§(this.charname + " (" + param3 + ")",_loc11_);
         }
         else
         {
            mcs.§1t6287s0§(this.charname,_loc11_);
         }
         level = param3;
         this.nid = param1;
         §1t3258s0§ = false;
         §1t3260s0§ = false;
         §1t4405s0§ = false;
         §1t4406s0§ = false;
         §1t4407s0§ = false;
         §1t4403s0§.length = 0;
         §1t4404s0§.length = 0;
         §1t3243s0§ = 4;
         if(param5 != null && param5 != "")
         {
            this.statStr = param5;
            this.skillStr = param6;
            this.tauntStr = param7;
            _loc12_ = new §1t76s0§(null);
            if(this.equipmentStr == null)
            {
               §1t3318s0§.instance.client.§1t731s0§.§1t4655s0§("EnemyPlayer.initNetworkPlayer: eqString null " + §1t1523s0§.charname + " " + param2,"","",null);
            }
            _loc12_.§1t1248s0§(this.charname,param3,this.statStr,this.equipmentStr,this.skillStr,2,param1,true,param8);
            this.§1t4880s0§(_loc12_);
         }
         if(param10)
         {
            if(§1t1540s0§.§1t10047s0§() && !§1t251s0§.instance.§1t3612s0§() || §1t1540s0§.§1t10048s0§())
            {
               §1t4440s0§ = §1t12234s0§;
               §1t1560s0§();
            }
         }
      }
      
      override public function update() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(!§1t3258s0§ && !§1t3260s0§ && (target == null || target.§1t2364s0§()))
         {
            target = §1t1543s0§.§1t10231s0§(§1t1555s0§(),!§1t3255s0§);
            if(target == null)
            {
               §1t3269s0§(§1t11141s0§);
            }
         }
         super.update();
         if(§1t1222s0§ != null)
         {
            _loc1_ = int(§1t1222s0§.length);
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               if(this.§1t4877s0§[§1t1222s0§[_loc2_].§1t760s0§()] > 0)
               {
                  --this.§1t4877s0§[§1t1222s0§[_loc2_].§1t760s0§()];
               }
               _loc2_++;
            }
         }
      }
      
      override public function §1t2292s0§() : *
      {
         §1t4482s0§();
         mcs.§1t6280s0§();
         mcs.§1t6288s0§("");
         if(mcs.alpha < 1)
         {
            mcs.visible = false;
         }
         else
         {
            §1t1643s0§.§1t11216s0§(mcs,-255);
         }
         if(actionState != §1t11147s0§ && actionState != §1t11153s0§)
         {
            §1t3260s0§ = true;
         }
      }
      
      internal function interpolatePosition(param1:int, param2:int) : *
      {
         var _loc3_:int = param2 / (1000 / 24);
      }
      
      override public function §1t4450s0§(param1:Vector.<Point>, param2:Boolean, param3:int = -1) : *
      {
         if(§1t3309s0§() <= 0 || §1t3258s0§ || mcs == null)
         {
            return;
         }
         if(§1t1525s0§.§1t9947s0§())
         {
            param2 = false;
         }
         if(§1t4405s0§ || actionState == §1t11145s0§ && stance != §1t12220s0§ || actionState == §1t11147s0§ || §1t3292s0§() || actionState == §1t11144s0§ || actionState == §1t11161s0§)
         {
            if(param2)
            {
               §1t4404s0§ = §1t4449s0§(param1);
               §1t4407s0§ = true;
            }
         }
         else if(!§1t4405s0§)
         {
            if(param2)
            {
               §1t4403s0§ = §1t4449s0§(param1);
               §1t4457s0§(§1t4403s0§[0]);
            }
            else if(actionState != §1t11145s0§ && actionState != §1t11147s0§ && actionState != §1t11152s0§ && actionState != §1t11144s0§ && actionState != §1t11161s0§)
            {
               §1t4451s0§(param1[0]);
            }
         }
      }
      
      override internal function §1t4501s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc5_:Point = null;
         var _loc6_:int = 0;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         if(§1t3260s0§ || §1t4455s0§() || actionState == §1t11169s0§ || actionState == §1t11174s0§ || actionState == §1t11197s0§)
         {
            return;
         }
         if(§1t3292s0§() || actionState == §1t11147s0§)
         {
            if(!(this.§1t4886s0§(§1t120s0§.§1t10131s0§) && this.§1t4491s0§(§1t120s0§.§1t10131s0§) > 1))
            {
               return;
            }
            this.§1t4893s0§(§1t120s0§.§1t10131s0§);
         }
         if(level <= 3 && Math.random() * 5 < 1)
         {
            return;
         }
         if(target == null || target.§1t2364s0§())
         {
            target = §1t1543s0§.§1t10231s0§(§1t1555s0§(),!§1t3255s0§);
            if(target == null)
            {
               if(§1t1555s0§() < 100 || §1t1555s0§() > §1t1525s0§.§1t8124s0§() - 100)
               {
                  moveTo(Math.random() * (§1t1525s0§.§1t8124s0§() - 300) + 150,§1t1525s0§.§1t4467s0§());
               }
               return;
            }
         }
         if(§1t1525s0§.§1t9947s0§())
         {
            if(!this.§1t4527s0§ && §1t1540s0§.§1t10046s0§())
            {
               this.§1t4527s0§ = true;
               §1t3269s0§(§1t11141s0§);
               §1t1557s0§(§1t1544s0§.§1t10373s0§);
            }
            if(actionState == §1t11141s0§ && Math.abs(target.§1t1555s0§() - §1t1555s0§()) < 100)
            {
               moveTo(Math.random() * §1t1525s0§.§1t8124s0§(),§1t1525s0§.§1t4467s0§());
            }
            return;
         }
         if(target != null && target.§1t1559s0§().alpha < 1 || !target.§1t1559s0§().visible)
         {
            if(int(Math.random() * 3) == 0)
            {
               moveTo(Math.random() * §1t1525s0§.§1t8124s0§(),§1t1525s0§.§1t4467s0§());
            }
            return;
         }
         if(!§1t3255s0§ && §1t4428s0§ && level > 3 && §1t1525s0§.§1t9586s0§().§1t4464s0§() && int(Math.random() * 3) <= 1 && this.§1t4541s0§())
         {
            this.§1t4883s0§();
         }
         else if(!(actionState == §1t11149s0§ || actionState == §1t11148s0§ || actionState == §1t11145s0§))
         {
            if(§1t4406s0§ || mcs.animation == §1t10313s0§ || mcs.animation == §1t10315s0§)
            {
               _loc2_ = int(§1t4499s0§.length);
               _loc3_ = false;
               _loc4_ = 0;
               while(_loc4_ < _loc2_ && !_loc3_)
               {
                  _loc5_ = §1t4499s0§[_loc4_];
                  if(target.mcs.hitTestPoint(_loc5_.x,_loc5_.y,true))
                  {
                     _loc3_ = true;
                  }
                  _loc4_++;
               }
               if(!_loc3_)
               {
                  §1t4508s0§();
               }
            }
            else if(target.§1t3292s0§())
            {
               this.§1t4893s0§(§1t120s0§.§1t10154s0§,target.§1t1555s0§());
               _loc6_ = Math.abs(target.§1t1555s0§() - §1t1555s0§());
               if(this.§1t4886s0§(§1t120s0§.§1t10164s0§) && _loc6_ > 50 && _loc6_ < 200)
               {
                  §1t3304s0§();
                  this.§1t4893s0§(§1t120s0§.§1t10164s0§);
               }
               else if(§1t4426s0§)
               {
                  §1t4507s0§();
               }
               else if(int(Math.random() * 2) == 0)
               {
                  §1t4509s0§();
               }
               else
               {
                  moveTo(Math.random() * §1t1525s0§.§1t8124s0§(),§1t1525s0§.§1t4467s0§());
               }
            }
            else if(§1t4429s0§ && target.§1t3293s0§())
            {
               if(Math.abs(target.§1t1555s0§() - §1t1555s0§()) < 120)
               {
                  if(stance == §1t12220s0§ || stance == §1t12221s0§)
                  {
                     if(target.§1t1555s0§() < mcs.x)
                     {
                        §1t4505s0§();
                     }
                     else
                     {
                        §1t4506s0§();
                     }
                  }
               }
            }
            else
            {
               _loc1_ = Math.random() * 4;
               if(_loc1_ == 0)
               {
                  §1t3304s0§();
                  _loc7_ = this.§1t4891s0§(target.§1t1555s0§() - §1t1555s0§());
                  if(_loc7_.length > 0)
                  {
                     _loc8_ = int(_loc7_[int(Math.random() * _loc7_.length)]);
                     if(_loc8_ == §1t120s0§.§1t10153s0§ && this.§1t4886s0§(_loc8_))
                     {
                        §1t4432s0§ = 48;
                     }
                     else if(_loc8_ == §1t120s0§.§1t10146s0§ && this.§1t4886s0§(_loc8_))
                     {
                        actionState = §1t11179s0§;
                        §1t4432s0§ = 96;
                     }
                     else if(_loc8_ == §1t120s0§.§1t10147s0§ && this.§1t4886s0§(_loc8_))
                     {
                        actionState = §1t11180s0§;
                        §1t4432s0§ = 96;
                     }
                     else if(_loc8_ == §1t120s0§.§1t10148s0§ && this.§1t4886s0§(_loc8_))
                     {
                        actionState = §1t11180s0§;
                        §1t4432s0§ = 120;
                     }
                     if(this.§1t4893s0§(_loc8_))
                     {
                        return;
                     }
                  }
               }
               if(§1t4414s0§ < §1t4500s0§)
               {
                  if(this.§1t4893s0§(§1t120s0§.§1t10128s0§))
                  {
                     return;
                  }
                  if(actionState == §1t11141s0§ || actionState == §1t11150s0§)
                  {
                     moveTo(Math.random() * §1t1525s0§.§1t8124s0§(),§1t1525s0§.§1t4467s0§());
                  }
               }
               else if(§1t4414s0§ < 24)
               {
                  §1t4500s0§ = 24 + Math.random() * (§1t4415s0§ - 24);
                  if(this.§1t4886s0§(§1t120s0§.§1t10161s0§))
                  {
                     this.§1t4893s0§(§1t120s0§.§1t10161s0§);
                     return;
                  }
                  moveTo(Math.random() * §1t1525s0§.§1t8124s0§(),§1t1525s0§.§1t4467s0§());
               }
               else
               {
                  _loc1_ = Math.random() * 3;
                  if(_loc1_ == 0)
                  {
                     if(§1t4425s0§ && !§1t3293s0§())
                     {
                        §1t4504s0§();
                     }
                     else
                     {
                        §1t4508s0§();
                     }
                  }
                  else
                  {
                     §1t4508s0§();
                  }
                  §1t4500s0§ = 0;
               }
            }
         }
      }
      
      override internal function §1t4503s0§() : int
      {
         return target.§1t1555s0§();
      }
      
      override internal function §1t4475s0§() : int
      {
         if(this.§1t4528s0§)
         {
            return minDamage;
         }
         return super.§1t4475s0§();
      }
      
      override public function §1t4476s0§() : int
      {
         if(this.§1t4528s0§)
         {
            return minDamage;
         }
         return super.§1t4476s0§();
      }
      
      internal function §1t4541s0§() : Boolean
      {
         var _loc3_:Point = null;
         var _loc1_:Vector.<Point> = §1t1525s0§.§1t9586s0§().§1t4463s0§();
         var _loc2_:int = §1t1525s0§.§1t8131s0§();
         var _loc4_:int = int(_loc1_.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = _loc1_[_loc5_];
            if(mcs.hitTestPoint(_loc3_.x - _loc2_,_loc3_.y))
            {
               return true;
            }
            _loc5_++;
         }
         return false;
      }
      
      internal function §1t4883s0§() : *
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this.§1t4893s0§(§1t120s0§.§1t10127s0§))
         {
            return;
         }
         if(this.§1t4893s0§(§1t120s0§.§1t10126s0§))
         {
            return;
         }
         if(this.§1t4893s0§(§1t120s0§.§1t10157s0§))
         {
            return;
         }
         if(this.§1t4893s0§(§1t120s0§.§1t10156s0§))
         {
            return;
         }
         if(this.§1t4893s0§(§1t120s0§.§1t10131s0§))
         {
            return;
         }
         var _loc1_:int = §1t1555s0§();
         var _loc5_:Number = 1.047;
         var _loc6_:* = §1t4417s0§;
         switch(int(Math.random() * 4))
         {
            case 0:
               _loc2_ = mcs.y - Math.random() * 100 - 80;
               _loc4_ = -20 * Math.sin(1.047);
               _loc3_ = 20 * Math.cos(1.047);
               break;
            case 1:
               _loc2_ = mcs.y - Math.random() * 100 - 80;
               _loc4_ = -20 * Math.sin(1.047);
               _loc3_ = -20 * Math.cos(1.047);
               break;
            case 2:
            case 3:
               _loc2_ = mcs.y - 50;
               if(mcs.x > target.mcs.x)
               {
                  _loc3_ = 20;
               }
               else
               {
                  _loc3_ = -20;
               }
               _loc4_ = 0;
         }
         §1t4510s0§(_loc1_,_loc2_,_loc3_,_loc4_);
      }
      
      override internal function §1t3294s0§() : *
      {
         if(§1t3250s0§ && controlledBy == 2)
         {
            return;
         }
         if(§1t3255s0§)
         {
            return;
         }
         if(§1t1540s0§.§1t10048s0§() && this.§1t4876s0§ && §1t3313s0§())
         {
            §1t406s0§.instance.§1t6482s0§.§1t8003s0§.§1t7862s0§(nid);
            §1t3317s0§.instance.§1t1909s0§(§1t406s0§.instance.§1t6482s0§.§1t8003s0§.mapid,0,0,"[d]",§1t406s0§.instance.§1t6482s0§.§1t8003s0§.§1t7860s0§(this.charname,level));
            return;
         }
         if(this.§1t4876s0§)
         {
            §1t406s0§.instance.§1t6488s0§.§1t6194s0§(level);
            if(level <= 10 || int(Math.random() * 3) == 0)
            {
               §1t406s0§.instance.§1t6488s0§.§1t5846s0§(Math.random() * level);
            }
         }
         else
         {
            super.§1t3294s0§();
         }
      }
      
      override internal function §1t3295s0§() : *
      {
         if(§1t3250s0§ && controlledBy == 2)
         {
            return;
         }
         var _loc1_:int = §1t1523s0§.getLevel();
         if(this.§1t4876s0§)
         {
            if(_loc1_ < 10)
            {
               §1t406s0§.instance.§1t6488s0§.§1t6201s0§(§1t12070s0§(§1t1523s0§.getLevel(),level,xp,false) * 3);
            }
            else
            {
               §1t406s0§.instance.§1t6488s0§.§1t6201s0§(§1t12070s0§(§1t1523s0§.getLevel(),level,xp,true));
            }
         }
         else
         {
            §1t406s0§.instance.§1t6488s0§.§1t6201s0§(§1t12070s0§(§1t1523s0§.getLevel(),level,xp,this.§1t4528s0§));
         }
      }
      
      public function §1t4884s0§(param1:Boolean) : *
      {
         if(mcs == null)
         {
            return;
         }
         var _loc2_:int = 16777215;
         if(this.§1t4896s0§())
         {
            _loc2_ = 39423;
         }
         else if(this.§1t4895s0§())
         {
            _loc2_ = 0;
         }
         if(param1)
         {
            mcs.§1t6287s0§(this.charname + " (" + §1t1521s0§.getString(203) + ")",_loc2_);
            §1t4453s0§(false);
         }
         else if(level > 0 && !this.§1t4895s0§())
         {
            mcs.§1t6287s0§(this.charname + " (" + level + ")",_loc2_);
         }
         else
         {
            mcs.§1t6287s0§(this.charname,_loc2_);
         }
      }
      
      override internal function §1t4491s0§(param1:int) : int
      {
         if(§1t1222s0§ == null)
         {
            return 0;
         }
         var _loc2_:int = int(§1t1222s0§.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(§1t1222s0§[_loc3_].§1t760s0§() == param1)
            {
               return §1t1222s0§[_loc3_].§1t761s0§();
            }
            _loc3_++;
         }
         return 0;
      }
      
      internal function §1t4885s0§(param1:int) : Boolean
      {
         var _loc2_:int = int(§1t1222s0§.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(§1t1222s0§[_loc3_].§1t760s0§() == param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      internal function §1t4886s0§(param1:int) : Boolean
      {
         var _loc2_:§1t105s0§ = null;
         if(this.§1t4885s0§(param1) && this.§1t4877s0§[param1] == 0)
         {
            _loc2_ = §1t1524s0§.§1t9863s0§(param1);
            if(_loc2_.§1t1463s0§(this.§1t4491s0§(param1)) > 0 && §1t4441s0§() == 0)
            {
               return false;
            }
            return true;
         }
         return false;
      }
      
      internal function §1t4891s0§(param1:int) : Array
      {
         var _loc3_:Array = null;
         var _loc2_:Array = new Array();
         var _loc4_:int = param1 * param1;
         if(_loc4_ < 40000)
         {
            _loc3_ = this.§1t4887s0§;
         }
         if(_loc4_ < 90000)
         {
            _loc3_ = this.§1t4888s0§;
         }
         else if(_loc4_ < 160000)
         {
            _loc3_ = this.§1t4889s0§;
         }
         else
         {
            _loc3_ = this.§1t4890s0§;
         }
         var _loc5_:int = int(_loc3_.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            if(this.§1t4886s0§(_loc3_[_loc6_]))
            {
               _loc2_.push(_loc3_[_loc6_]);
            }
            _loc6_++;
         }
         return _loc2_;
      }
      
      internal function §1t4893s0§(param1:int, param2:int = -1, param3:int = -1) : Boolean
      {
         var _loc4_:§1t105s0§ = null;
         var _loc5_:int = 0;
         if(this.§1t4886s0§(param1))
         {
            _loc4_ = this.§1t4892s0§[param1];
            if(_loc4_ == null)
            {
               _loc4_ = §1t1524s0§.§1t9863s0§(param1);
               this.§1t4892s0§[param1] = _loc4_;
            }
            _loc5_ = this.§1t4491s0§(param1);
            if(§1t120s0§.§1t9190s0§().§1t1542s0§(param1,_loc5_,this,null,_loc4_,param2,param3))
            {
               this.§1t4877s0§[param1] = _loc4_.§1t1465s0§(_loc5_);
               return true;
            }
         }
         return false;
      }
      
      override public function §1t4483s0§(param1:int, param2:String, param3:Boolean, param4:String, param5:int) : *
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc10_:int = 0;
         var _loc12_:Array = null;
         if(param1 > §1t3309s0§())
         {
            return;
         }
         if(§1t1559s0§() == null)
         {
            return;
         }
         if(param1 <= 0 && §1t1540s0§.§1t10047s0§())
         {
            §1t3250s0§ = true;
         }
         if(!§1t1540s0§.§1t10013s0§() || §1t1525s0§.§1t9952s0§())
         {
            if(!§1t3258s0§ && param3 && param1 <= 0 && §1t1525s0§.§1t9953s0§())
            {
               §1t113s0§.instance.§1t5221s0§();
               §1t1557s0§(§1t10291s0§);
            }
            return;
         }
         var _loc9_:int = -1;
         if(param2 == "")
         {
            _loc6_ = §1t67s0§.§1t9116s0§;
         }
         else
         {
            _loc12_ = param2.split(",");
            _loc6_ = int(_loc12_[0]);
            if(_loc6_ == §1t67s0§.§1t9117s0§ || _loc6_ == §1t67s0§.§1t9118s0§)
            {
               _loc7_ = int(_loc12_[1]);
               if(_loc12_.length >= 3)
               {
                  _loc9_ = int(_loc12_[2]);
               }
            }
            else if(_loc6_ == §1t67s0§.§1t9119s0§ || _loc6_ == §1t67s0§.§1t9120s0§ || _loc6_ == §1t67s0§.§1t9122s0§ || _loc6_ == §1t67s0§.§1t9123s0§)
            {
               _loc7_ = int(_loc12_[1]);
               _loc8_ = int(_loc12_[2]);
               if(_loc12_.length >= 4)
               {
                  _loc9_ = int(_loc12_[3]);
               }
            }
            else if(_loc6_ == §1t67s0§.§1t9121s0§)
            {
               _loc7_ = int(_loc12_[1]);
               _loc8_ = int(_loc12_[2]);
               _loc10_ = int(_loc12_[3]);
            }
            else if(_loc6_ == §1t67s0§.§1t9125s0§)
            {
               _loc7_ = int(_loc12_[1]);
               _loc8_ = int(_loc12_[2]);
            }
         }
         var _loc11_:int = §1t3309s0§() - param1;
         §1t3308s0§(param1);
         §1t3254s0§ = 0;
         §1t1559s0§().§1t3301s0§(§1t3309s0§() / §1t3257s0§);
         §1t88s0§.instance.§1t1508s0§();
         if(_loc11_ > 0)
         {
            §1t4494s0§();
         }
         if(§1t4433s0§ != null)
         {
            if(_loc11_ > 0 || _loc6_ != §1t67s0§.§1t9116s0§)
            {
               if(!(actionState == §1t11198s0§ && _loc6_ == §1t67s0§.§1t9116s0§))
               {
                  §1t4433s0§.§1t8113s0§();
                  §1t4433s0§ = null;
               }
            }
         }
         if(§1t3309s0§() <= 0)
         {
            if(§1t1540s0§.§1t10049s0§())
            {
               §1t1541s0§.§1t10111s0§();
               §1t1525s0§.§1t2292s0§();
            }
            else
            {
               §1t3298s0§();
               §1t1543s0§.§1t10236s0§();
            }
         }
         else
         {
            if((_loc6_ == §1t67s0§.§1t9117s0§ || §1t4438s0§ < 3 && (actionState == §1t11147s0§ || actionState == §1t11145s0§ || actionState == §1t11144s0§)) && !§1t3292s0§())
            {
               if(_loc7_ == 1)
               {
                  §1t1559s0§().§1t5493s0§();
               }
               else
               {
                  §1t1559s0§().§1t5492s0§();
               }
               §1t3280s0§();
               _loc6_ = §1t67s0§.§1t9117s0§;
            }
            else if(_loc6_ == §1t67s0§.§1t9118s0§)
            {
               if(_loc7_ == 1)
               {
                  §1t1559s0§().§1t5493s0§();
               }
               else
               {
                  §1t1559s0§().§1t5492s0§();
               }
               §1t3281s0§();
            }
            else if(_loc6_ == §1t67s0§.§1t9119s0§)
            {
               §1t3282s0§(_loc7_,_loc8_);
            }
            else if(_loc6_ == §1t67s0§.§1t9120s0§)
            {
               §1t3283s0§(_loc7_,_loc8_);
            }
            else if(_loc6_ == §1t67s0§.§1t9121s0§)
            {
               §1t3284s0§(_loc7_,_loc8_,_loc10_);
            }
            else if(_loc6_ == §1t67s0§.§1t9125s0§)
            {
               §1t3285s0§(_loc7_,_loc8_);
            }
            else if(_loc6_ == §1t67s0§.§1t9122s0§)
            {
               §1t3286s0§(_loc7_,_loc8_);
            }
            else if(_loc6_ == §1t67s0§.§1t9124s0§)
            {
               §1t4489s0§();
            }
            else if(!§1t3292s0§() && actionState != §1t11147s0§ && actionState != §1t11145s0§ && actionState != §1t11144s0§)
            {
               §1t3290s0§();
            }
            if(_loc6_ == §1t67s0§.§1t9123s0§)
            {
               this.§1t4488s0§(_loc7_,_loc8_);
            }
            if(_loc11_ > 0)
            {
               if(param5 != 0)
               {
                  _loc11_ = param5;
               }
               §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc11_.toString(),0);
            }
         }
      }
      
      override internal function §1t3299s0§() : *
      {
         if(§1t3248s0§ != null)
         {
            §1t3248s0§.destroy();
         }
         if(§1t3249s0§ != null)
         {
            §1t3249s0§.destroy();
         }
         if(§1t1525s0§.§1t9952s0§())
         {
            return;
         }
         --ttl;
         if(ttl < 12)
         {
            mcs.alpha = ttl / 12;
         }
         if(ttl <= 0)
         {
            mcs.visible = false;
            if(!(controlledBy == 2 && §1t1540s0§.§1t10047s0§()))
            {
               mcs.§1t3305s0§();
               mcs = null;
            }
         }
      }
      
      override internal function §1t4488s0§(param1:int, param2:int) : *
      {
         var _loc3_:int = 500;
         if(controlledBy == 2)
         {
            _loc3_ = 0;
         }
         §1t3246s0§ = 0;
         §1t3277s0§(§1t1559s0§(),new §1t67s0§(_loc3_,0,0));
         if(param1 != 0)
         {
            §1t3282s0§(param1,param2);
         }
         §1t4442s0§(0);
      }
      
      public function §1t4894s0§(param1:int) : *
      {
         this.spectator = param1;
         if(this.spectator == §1t251s0§.§1t12141s0§)
         {
            §1t3261s0§ = false;
            §1t3262s0§ = false;
            §1t3263s0§ = false;
            §1t3264s0§ = false;
            §1t3265s0§ = false;
         }
         else if(this.spectator == §1t251s0§.§1t12142s0§)
         {
            mcs.§1t6289s0§(3);
         }
      }
      
      public function §1t4895s0§() : Boolean
      {
         return this.spectator == §1t251s0§.§1t12139s0§ || this.spectator == §1t251s0§.§1t12140s0§ || this.spectator == §1t251s0§.§1t12141s0§ || this.spectator == §1t251s0§.§1t12142s0§;
      }
      
      public function §1t4896s0§() : Boolean
      {
         return this.spectator == §1t251s0§.§1t12142s0§;
      }
      
      public function §1t4897s0§() : *
      {
         return §1t1523s0§.§1t9479s0§ == §1t251s0§.§1t12136s0§ && (this.spectator == §1t251s0§.§1t12139s0§ || this.spectator == §1t251s0§.§1t12141s0§ || this.spectator == §1t251s0§.§1t12142s0§);
      }
      
      override public function §1t3272s0§() : Boolean
      {
         return §1t3246s0§ == 0 && §1t4440s0§ <= 0;
      }
      
      override public function §1t1561s0§() : *
      {
         §1t1547s0§ = false;
         mcs.§1t5659s0§.visible = true;
      }
      
      override public function §1t1562s0§() : *
      {
         --§1t1548s0§;
         if(§1t1548s0§ <= 0)
         {
            §1t1548s0§ = 6;
            mcs.§1t5659s0§.visible = !mcs.§1t5659s0§.visible;
         }
      }
   }
}

