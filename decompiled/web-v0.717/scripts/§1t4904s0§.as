package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class §1t4904s0§ extends §1t122s0§
   {
      
      public function §1t4904s0§(param1:§1t75s0§)
      {
         super(param1,false,false);
      }
      
      public function §1t4905s0§(param1:§1t99s0§, param2:Boolean) : *
      {
         var _loc4_:int = 0;
         if(param1.§1t3312s0§())
         {
            controlledBy = 3;
         }
         else if(param1.§1t3313s0§())
         {
            controlledBy = 1;
         }
         else if(param1.§1t3314s0§())
         {
            controlledBy = 2;
         }
         else if(param1.§1t3315s0§())
         {
            controlledBy = 3;
         }
         reset();
         var _loc3_:String = param1.§1t1559s0§().§1t1251s0§();
         §1t1559s0§().§1t5491s0§(_loc3_);
         if(param1.§1t1559s0§().§1t6283s0§())
         {
            §1t1559s0§().§1t5493s0§();
         }
         else
         {
            §1t1559s0§().§1t5492s0§();
         }
         §1t3308s0§(param1.§1t3309s0§());
         this.§1t3257s0§ = param1.§1t3257s0§;
         §1t4442s0§(param1.§1t4441s0§());
         this.§1t4413s0§ = param1.§1t4413s0§;
         this.defense = param1.defense;
         this.§1t4419s0§ = param1.§1t4419s0§;
         this.minDamage = param1.minDamage;
         this.damageRange = param1.damageRange;
         this.§1t4420s0§ = param1.§1t4420s0§;
         this.slashUsage = param1.slashUsage;
         this.§1t4421s0§ = param1.§1t4421s0§;
         this.§1t4422s0§ = param1.§1t4422s0§;
         this.§1t4423s0§ = param1.§1t4423s0§;
         this.level = param1.level;
         §1t3258s0§ = false;
         §1t3260s0§ = false;
         §1t4431s0§ = false;
         §1t4405s0§ = false;
         §1t4406s0§ = false;
         §1t4407s0§ = false;
         §1t4403s0§.length = 0;
         §1t4404s0§.length = 0;
         §1t3243s0§ = 4;
         if(param2)
         {
            §1t3489s0§(param1.§1t4436s0§ % 3);
         }
         else
         {
            §1t3489s0§(param1.stance);
         }
         this.nid = param1.nid + "_clone" + param1.§1t4436s0§++;
         §1t3269s0§(§1t11141s0§);
         §1t4415s0§ = 8 * 24;
         §1t4414s0§ = 0;
         if(controlledBy == 3)
         {
            mcs.§1t6287s0§("Clone",16777215);
         }
         else
         {
            mcs.§1t6287s0§(param1.§1t1559s0§().displayName.nametext.text,16777215);
         }
         this.§1t4424s0§ = param1.§1t4424s0§ / 2;
         this.§1t1235s0§ = param1.§1t1235s0§;
         this.§1t1236s0§ = param1.§1t1236s0§;
         this.§1t1237s0§ = param1.§1t1237s0§;
         this.§1t1238s0§ = param1.§1t1238s0§;
         xp = 0;
         mcs.§1t6288s0§("");
         §1t4428s0§ = true;
         §1t3301s0§();
         ttl = 24 * 60;
         if(param2)
         {
            §1t3257s0§ = 1;
         }
         else
         {
            _loc4_ = param1.§1t4491s0§(§1t120s0§.§1t10160s0§);
            if(_loc4_ == 3)
            {
               §1t3257s0§ = 2;
            }
            else
            {
               §1t3257s0§ = 1;
            }
            if(_loc4_ == 1)
            {
               minDamage = 0;
               damageRange = 0;
               level = 0;
            }
         }
         §1t3308s0§(§1t3257s0§);
         mcs.§1t6279s0§();
      }
      
      override public function §1t3274s0§(param1:MovieClip, param2:§1t67s0§, param3:Boolean = false, param4:Boolean = false) : Boolean
      {
         var _loc12_:MovieClip = null;
         var _loc15_:* = undefined;
         var _loc16_:int = 0;
         var _loc17_:§1t128s0§ = null;
         if(controlledBy == 0 && §1t1540s0§.§1t10049s0§())
         {
            return false;
         }
         if(§1t3246s0§ > 0)
         {
            return false;
         }
         if(actionState == §1t11161s0§)
         {
            _loc15_ = §1t4491s0§(§1t120s0§.§1t10127s0§);
            if(_loc15_ == 1)
            {
               _loc16_ = 75;
            }
            else if(_loc15_ == 2)
            {
               _loc16_ = 85;
            }
            else if(_loc15_ >= 3)
            {
               _loc16_ = 95;
            }
            if(int(Math.random() * 100) < _loc16_)
            {
               §1t3246s0§ = 12;
               return true;
            }
         }
         var _loc5_:int = param2.damage;
         var _loc6_:* = param2.§1t1066s0§;
         var _loc7_:int = param2.§1t1062s0§ - §1t1239s0§;
         var _loc8_:int = param2.§1t1063s0§ - §1t1241s0§;
         var _loc9_:int = param2.§1t1064s0§ - §1t1240s0§;
         var _loc10_:int = param2.§1t1065s0§ - §1t1242s0§;
         if(_loc7_ < 0)
         {
            _loc7_ = 0;
         }
         if(_loc8_ < 0)
         {
            _loc8_ = 0;
         }
         if(_loc9_ < 0)
         {
            _loc9_ = 0;
         }
         if(_loc10_ < 0)
         {
            _loc10_ = 0;
         }
         var _loc11_:int = 22;
         var _loc13_:Vector.<MovieClip> = mcs.§1t6231s0§;
         var _loc14_:* = int(_loc11_ - 1);
         while(_loc14_ >= 0)
         {
            _loc12_ = _loc13_[_loc14_];
            if(_loc12_.hitTestObject(param1))
            {
               if(§1t4430s0§ && §1t4465s0§() && param1 is §1t128s0§)
               {
                  _loc17_ = §1t128s0§(param1);
                  if(_loc17_.§1t8110s0§())
                  {
                     §1t128s0§(param1).§1t8109s0§();
                     §1t88s0§.instance.§1t1511s0§();
                     return false;
                  }
               }
               if(!param3 && controlledBy == 2 && §1t251s0§.instance.§1t3476s0§() && !§1t1540s0§.§1t10015s0§())
               {
                  §1t3246s0§ = 12;
                  §1t4494s0§();
                  return true;
               }
               if(§1t4433s0§ != null)
               {
                  §1t4433s0§.§1t8113s0§();
                  §1t4433s0§ = null;
                  §1t4432s0§ = 0;
                  if(controlledBy == 0)
                  {
                     §1t113s0§.instance.§1t5232s0§();
                  }
               }
               _loc5_ -= §1t4477s0§();
               if(_loc5_ < param2.§1t1088s0§())
               {
                  _loc5_ = param2.§1t1088s0§();
               }
               if(_loc5_ != 0)
               {
                  §1t3308s0§(§1t3309s0§() - 1);
               }
               §1t3246s0§ = 12;
               §1t4494s0§();
               if(controlledBy == 0)
               {
                  if(_loc5_ + _loc7_ + _loc9_ + _loc8_ + _loc10_ > 0)
                  {
                     §1t1525s0§.§1t9941s0§().§1t5201s0§(§1t3309s0§(),§1t3257s0§);
                     §1t1523s0§.§1t9724s0§();
                     §1t113s0§.instance.§1t5214s0§();
                     §1t88s0§.instance.§1t1509s0§();
                  }
               }
               else
               {
                  §1t88s0§.instance.§1t1508s0§();
               }
               if(§1t3309s0§() <= 0)
               {
                  §1t3308s0§(0);
                  if(controlledBy == 0)
                  {
                     this.§1t3298s0§();
                  }
                  else if(controlledBy == 3)
                  {
                     this.§1t3298s0§();
                  }
                  target = null;
               }
               else
               {
                  if(param2.§1t1078s0§())
                  {
                     this.§1t3284s0§(param2.§1t1067s0§,param2.§1t1068s0§,param2.attackerlvl);
                  }
                  else if(param2.§1t1079s0§())
                  {
                     §1t3285s0§(param2.§1t1067s0§,param2.§1t1068s0§);
                  }
                  else if((param2.§1t1073s0§() || actionState == §1t11147s0§ || actionState == §1t11145s0§ || actionState == §1t11144s0§) && !§1t3292s0§())
                  {
                     _loc6_ = §1t67s0§.§1t9117s0§;
                     param2.§1t1083s0§(§1t1559s0§().§1t6283s0§());
                     §1t3280s0§();
                  }
                  else if(param2.§1t1075s0§())
                  {
                     param2.§1t1083s0§(§1t1559s0§().§1t6283s0§());
                     §1t3281s0§();
                  }
                  else if(param2.§1t1076s0§())
                  {
                     §1t3282s0§(param2.§1t1067s0§,param2.§1t1068s0§);
                  }
                  else if(param2.§1t1077s0§())
                  {
                     §1t3283s0§(param1.x,param1.y);
                     param2.§1t1085s0§(velX,velY);
                  }
                  else if(param2.§1t1080s0§())
                  {
                     §1t3286s0§(param2.§1t1067s0§,param2.§1t1068s0§);
                  }
                  else if(!§1t3292s0§())
                  {
                     §1t3290s0§();
                  }
                  if(param2.§1t1081s0§())
                  {
                     §1t4488s0§(param2.§1t1067s0§,param2.§1t1068s0§);
                  }
                  if(_loc5_ > 0)
                  {
                     if(controlledBy == 0)
                     {
                        §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc5_.toString(),0);
                     }
                     else
                     {
                        §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc5_.toString(),10027008);
                     }
                  }
                  if(_loc7_ > 0)
                  {
                     §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc7_.toString(),16737792);
                  }
                  if(_loc9_ > 0)
                  {
                     §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc9_.toString(),13421772);
                  }
                  if(_loc8_ > 0)
                  {
                     §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc8_.toString(),26367);
                  }
                  if(_loc10_ > 0)
                  {
                     §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc10_.toString(),6697728);
                  }
               }
               if(param3 && controlledBy == 2)
               {
                  §1t251s0§.instance.§1t3481s0§(nid,§1t3309s0§(),param2);
               }
               else if(!param3 && (controlledBy == 0 || controlledBy == 3))
               {
                  §1t251s0§.instance.§1t3481s0§(nid,§1t3309s0§(),param2);
               }
               return true;
            }
            _loc14_--;
         }
         return false;
      }
      
      override public function §1t3277s0§(param1:MovieClip, param2:§1t67s0§) : Boolean
      {
         var _loc10_:* = undefined;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         if(controlledBy == 0 && §1t1540s0§.§1t10049s0§())
         {
            return false;
         }
         if(§1t3246s0§ > 0)
         {
            return false;
         }
         if(§1t4433s0§ != null)
         {
            §1t4433s0§.§1t8113s0§();
            §1t4433s0§ = null;
            §1t4432s0§ = 0;
            if(controlledBy == 0)
            {
               §1t113s0§.instance.§1t5232s0§();
            }
         }
         if(actionState == §1t11161s0§)
         {
            _loc10_ = §1t4491s0§(§1t120s0§.§1t10127s0§);
            if(_loc10_ == 1)
            {
               _loc11_ = 75;
            }
            else if(_loc10_ == 2)
            {
               _loc11_ = 85;
            }
            else if(_loc10_ >= 3)
            {
               _loc11_ = 95;
            }
            if(int(Math.random() * 100) < _loc11_)
            {
               §1t3246s0§ = 12;
               return true;
            }
         }
         var _loc3_:int = param2.damage;
         var _loc4_:* = param2.§1t1066s0§;
         var _loc5_:int = param2.§1t1062s0§ - §1t1239s0§;
         var _loc6_:int = param2.§1t1063s0§ - §1t1241s0§;
         var _loc7_:int = param2.§1t1064s0§ - §1t1240s0§;
         var _loc8_:int = param2.§1t1065s0§ - §1t1242s0§;
         var _loc9_:int = param2.stance;
         if(_loc5_ < 0)
         {
            _loc5_ = 0;
         }
         if(_loc6_ < 0)
         {
            _loc6_ = 0;
         }
         if(_loc7_ < 0)
         {
            _loc7_ = 0;
         }
         if(_loc8_ < 0)
         {
            _loc8_ = 0;
         }
         switch(param1)
         {
            case mcs.§1t6231s0§[§1t75s0§.§1t12394s0§]:
            case mcs.§1t6231s0§[§1t75s0§.§1t12393s0§]:
            case mcs.§1t6231s0§[§1t75s0§.§1t12389s0§]:
               _loc3_ *= 1.3;
               §1t1071s0§ = true;
               §1t3256s0§ = true;
               break;
            default:
               §1t3256s0§ = true;
         }
         if(§1t3309s0§() > 0)
         {
            _loc12_ = 0;
            if(stance == §1t12220s0§ && _loc9_ == §1t12221s0§ || stance == §1t12221s0§ && _loc9_ == §1t12222s0§ || stance == §1t12222s0§ && _loc9_ == §1t12220s0§)
            {
               _loc3_ *= 1.2;
               if(controlledBy != 0)
               {
                  _loc12_ = 16777215;
               }
            }
            else if(stance == §1t12220s0§ && _loc9_ == §1t12222s0§ || stance == §1t12221s0§ && _loc9_ == §1t12220s0§ || stance == §1t12222s0§ && _loc9_ == §1t12221s0§)
            {
               _loc3_ *= 0.9;
            }
            _loc3_ -= §1t4477s0§();
            if(_loc3_ < param2.§1t1088s0§())
            {
               _loc3_ = param2.§1t1088s0§();
            }
            §1t3308s0§(§1t3309s0§() - 1);
            §1t3246s0§ = 12;
            §1t4494s0§();
            if(controlledBy == 0)
            {
               if(_loc3_ > 0)
               {
                  §1t1525s0§.§1t9941s0§().§1t5201s0§(§1t3309s0§(),§1t3257s0§);
                  §1t1523s0§.§1t9724s0§();
                  §1t113s0§.instance.§1t5214s0§();
                  §1t88s0§.instance.§1t1509s0§();
               }
            }
            else
            {
               §1t88s0§.instance.§1t1508s0§();
            }
            if(§1t3309s0§() <= 0)
            {
               §1t3308s0§(0);
               if(controlledBy == 0 || controlledBy == 3)
               {
                  this.§1t3298s0§();
               }
               param1 = null;
            }
            else
            {
               §1t1071s0§ = false;
               if((param2.§1t1073s0§() || actionState == §1t11147s0§ || actionState == §1t11145s0§ || actionState == §1t11144s0§) && !§1t3292s0§())
               {
                  _loc4_ = §1t67s0§.§1t9117s0§;
                  param2.§1t1083s0§(§1t1559s0§().§1t6283s0§());
                  §1t3280s0§();
               }
               else if(param2.§1t1075s0§())
               {
                  param2.§1t1083s0§(§1t1559s0§().§1t6283s0§());
                  §1t3281s0§();
               }
               else if(param2.§1t1076s0§())
               {
                  §1t3282s0§(param2.§1t1067s0§,param2.§1t1068s0§);
               }
               else if(param2.§1t1077s0§())
               {
                  §1t3283s0§(param1.x,param1.y);
                  param2.§1t1085s0§(velX,velY);
               }
               else if(param2.§1t1080s0§())
               {
                  §1t3286s0§(param2.§1t1067s0§,param2.§1t1068s0§);
               }
               else if(!§1t3292s0§())
               {
                  §1t3290s0§();
               }
               if(param2.§1t1081s0§())
               {
                  §1t4488s0§(param2.§1t1067s0§,param2.§1t1068s0§);
               }
               if(_loc3_ > 0)
               {
                  if(controlledBy == 0)
                  {
                     §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc3_.toString(),_loc12_);
                  }
                  else
                  {
                     §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc3_.toString(),10027008);
                  }
               }
               if(_loc5_ > 0)
               {
                  §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc5_.toString(),16737792);
               }
               if(_loc7_ > 0)
               {
                  §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc7_.toString(),13421772);
               }
               if(_loc6_ > 0)
               {
                  §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc6_.toString(),26367);
               }
               if(_loc8_ > 0)
               {
                  §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc8_.toString(),6697728);
               }
            }
            if(controlledBy == 2)
            {
               §1t251s0§.instance.§1t3481s0§(nid,§1t3309s0§(),param2);
            }
            return true;
         }
         return false;
      }
      
      override internal function §1t4501s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc5_:Point = null;
         if(§1t3260s0§ || §1t3292s0§() || §1t4455s0§() || §1t1525s0§.§1t9952s0§() || actionState == §1t11169s0§ || actionState == §1t11174s0§ || actionState == §1t11173s0§)
         {
            return;
         }
         if(target == null || target.§1t2364s0§() || target.actionState == §1t11197s0§)
         {
            target = §1t1543s0§.§1t10231s0§(§1t1555s0§(),controlledBy == 1);
            if(target == null)
            {
               return;
            }
         }
         if(§1t1525s0§.§1t9947s0§())
         {
            if(actionState == §1t11141s0§ && Math.abs(§1t4503s0§() - §1t1555s0§()) < 100)
            {
               moveTo(Math.random() * §1t1525s0§.§1t8124s0§(),§1t1525s0§.§1t4467s0§());
            }
            return;
         }
         if(target.§1t1559s0§().alpha < 1 || !target.§1t1559s0§().visible)
         {
            if(int(Math.random() * 3) == 0)
            {
               moveTo(Math.random() * §1t1525s0§.§1t8124s0§(),§1t1525s0§.§1t4467s0§());
            }
            return;
         }
         if(!(actionState == §1t11149s0§ || actionState == §1t11148s0§ || actionState == §1t11145s0§))
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
               if(§1t4426s0§)
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
               if(Math.abs(§1t4503s0§() - §1t1555s0§()) < 120)
               {
                  if(stance == §1t12220s0§ || stance == §1t12221s0§)
                  {
                     if(§1t4503s0§() < mcs.x)
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
               if(§1t4414s0§ < §1t4500s0§ && _loc1_ == 0)
               {
                  if(actionState == §1t11141s0§ || actionState == §1t11150s0§)
                  {
                     moveTo(Math.random() * §1t1525s0§.§1t8124s0§(),§1t1525s0§.§1t4467s0§());
                  }
               }
               else if(§1t4414s0§ < 24 && _loc1_ == 0)
               {
                  §1t4500s0§ = 24 + Math.random() * (§1t4415s0§ - 24);
                  moveTo(Math.random() * §1t1525s0§.§1t8124s0§(),§1t1525s0§.§1t4467s0§());
               }
               else
               {
                  target = §1t1543s0§.§1t10231s0§(§1t1555s0§(),controlledBy == 1);
                  if(target != null)
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
                  }
                  §1t4500s0§ = 0;
               }
            }
         }
      }
      
      override public function §1t4450s0§(param1:Vector.<Point>, param2:Boolean, param3:int = -1) : *
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc8_:int = 0;
         if(§1t3309s0§() <= 0 || §1t3258s0§ || actionState == §1t11147s0§ || §1t4455s0§() || actionState == §1t11174s0§ || actionState == §1t11173s0§)
         {
            §1t1541s0§.§1t10111s0§();
            return;
         }
         var _loc6_:int = 0;
         var _loc7_:Vector.<Point> = §1t4449s0§(param1);
         if(§1t1525s0§.§1t9947s0§())
         {
            §1t1541s0§.§1t10111s0§();
            if(param2)
            {
               param2 = false;
               param1[param1.length - 1].x += _loc6_;
               §1t4451s0§(param1[param1.length - 1]);
               if((controlledBy == 0 || controlledBy == 3) && §1t251s0§.instance.§1t3476s0§())
               {
                  §1t251s0§.instance.§1t3479s0§(_loc7_,_loc6_,§1t1555s0§());
               }
               return;
            }
         }
         if(param2 && (§1t4405s0§ || actionState == §1t11145s0§ && stance != §1t12220s0§ || actionState == §1t11147s0§ || §1t3292s0§() || actionState == §1t11144s0§ || actionState == §1t11161s0§))
         {
            §1t4404s0§ = §1t4449s0§(param1,_loc6_);
            §1t4407s0§ = true;
            if((controlledBy == 0 || controlledBy == 3) && §1t251s0§.instance.§1t3476s0§())
            {
               §1t251s0§.instance.§1t3479s0§(_loc7_,_loc6_,§1t1555s0§(),nid);
            }
         }
         else if(!§1t4405s0§)
         {
            if(param2)
            {
               §1t4403s0§ = §1t4449s0§(param1,_loc6_);
               §1t4457s0§(§1t4403s0§[0]);
               if((controlledBy == 0 || controlledBy == 3) && §1t251s0§.instance.§1t3476s0§())
               {
                  §1t251s0§.instance.§1t3479s0§(_loc7_,_loc6_,§1t1555s0§(),nid);
               }
            }
            else
            {
               _loc8_ = param1[0].x - §1t1559s0§().x;
               if(_loc8_ * _loc8_ < 100)
               {
                  return;
               }
               if(actionState != §1t11145s0§ && actionState != §1t11147s0§ && actionState != §1t11152s0§ && actionState != §1t11144s0§ && actionState != §1t11161s0§ && actionState != §1t11149s0§)
               {
                  param1[0].x += _loc6_;
                  §1t4451s0§(param1[0]);
                  if((controlledBy == 0 || controlledBy == 3) && §1t251s0§.instance.§1t3476s0§())
                  {
                     §1t251s0§.instance.§1t3479s0§(_loc7_,_loc6_,§1t1555s0§(),nid);
                  }
               }
            }
         }
      }
      
      override public function §1t3298s0§() : *
      {
         §1t3258s0§ = true;
         §1t1557s0§(§1t10409s0§);
         actionState = §1t11153s0§;
         §1t1712s0§.§1t11333s0§(§1t1555s0§(),mcs.y);
         ttl = 12;
         mcs.visible = false;
      }
      
      override internal function §1t3300s0§() : *
      {
         --ttl;
         if(ttl <= 0)
         {
            mcs.§1t3305s0§();
            mcs = null;
         }
      }
      
      override public function §1t2292s0§() : *
      {
         super.§1t2292s0§();
         this.§1t3298s0§();
         if(controlledBy == 3)
         {
            §1t251s0§.instance.§1t3481s0§(nid,0,new §1t67s0§());
         }
      }
      
      override public function update() : *
      {
         super.update();
         --ttl;
         if(ttl == 0 && !§1t3258s0§)
         {
            this.§1t3298s0§();
         }
      }
      
      override public function §1t4483s0§(param1:int, param2:String, param3:Boolean, param4:String, param5:int) : *
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc10_:int = 0;
         var _loc12_:Array = null;
         if(§1t1559s0§() == null)
         {
            return;
         }
         if(param1 <= 0 && §1t1540s0§.§1t10047s0§())
         {
            §1t3250s0§ = true;
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
         if(_loc11_ > 0 && §1t4433s0§ != null)
         {
            §1t4433s0§.§1t8113s0§();
         }
         if(§1t3309s0§() <= 0)
         {
            this.§1t3298s0§();
            §1t1543s0§.§1t10236s0§();
         }
         else
         {
            if(_loc9_ != -1)
            {
               setPosition(_loc9_,§1t1559s0§().y);
            }
            if((_loc6_ == §1t67s0§.§1t9117s0§ || actionState == §1t11147s0§ || actionState == §1t11145s0§ || actionState == §1t11144s0§) && !§1t3292s0§())
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
               this.§1t3284s0§(_loc7_,_loc8_,_loc10_);
            }
            else if(_loc6_ == §1t67s0§.§1t9122s0§)
            {
               §1t3286s0§(_loc7_,_loc8_);
            }
            else if(!§1t3292s0§() && actionState != §1t11147s0§ && actionState != §1t11145s0§ && actionState != §1t11144s0§)
            {
               §1t3290s0§();
            }
            if(_loc6_ == §1t67s0§.§1t9123s0§)
            {
               §1t4488s0§(_loc7_,_loc8_);
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
      
      override internal function §1t3284s0§(param1:int, param2:int, param3:int) : *
      {
         if(!§1t3264s0§ || §1t3292s0§() || actionState == §1t11153s0§)
         {
            return;
         }
         this.§1t3298s0§();
      }
   }
}

