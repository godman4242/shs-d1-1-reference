package
{
   import flash.display.MovieClip;
   
   public class §1t4909s0§ extends §1t122s0§
   {
      
      public function §1t4909s0§(param1:§1t75s0§ = null)
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
         §1t3269s0§(§1t11141s0§);
         §1t3244s0§ = 12;
      }
      
      override public function §1t3306s0§() : String
      {
         return nid;
      }
      
      override public function §1t3277s0§(param1:MovieClip, param2:§1t67s0§) : Boolean
      {
         var _loc3_:* = undefined;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = undefined;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         if(controlledBy == 0 && §1t1540s0§.§1t10049s0§())
         {
            return false;
         }
         if(§1t3246s0§ > 0)
         {
            return false;
         }
         if(actionState == §1t11197s0§)
         {
            return false;
         }
         if(actionState == §1t11161s0§)
         {
            _loc3_ = §1t4491s0§(§1t120s0§.§1t10127s0§);
            if(_loc3_ == 1)
            {
               _loc4_ = 75;
            }
            else if(_loc3_ == 2)
            {
               _loc4_ = 85;
            }
            else if(_loc3_ >= 3)
            {
               _loc4_ = 95;
            }
            if(int(Math.random() * 100) < _loc4_)
            {
               §1t3246s0§ = 12;
               return true;
            }
         }
         if(§1t4465s0§() && §1t4414s0§ == §1t4415s0§ && (stance == §1t12220s0§ && §1t4491s0§(§1t120s0§.§1t10173s0§) > 0 || stance == §1t12221s0§ && §1t4491s0§(§1t120s0§.§1t10174s0§) > 0 || stance == §1t12222s0§ && §1t4491s0§(§1t120s0§.§1t10175s0§) > 0))
         {
            §1t3246s0§ = 12;
            return true;
         }
         if(§1t4435s0§ > 0)
         {
            if(controlledBy == 2)
            {
               §1t4495s0§();
            }
            else
            {
               §1t4489s0§();
            }
            param2.§1t1087s0§();
         }
         §1t3254s0§ = 0;
         if(§1t4433s0§ != null)
         {
            if(!(actionState == §1t11198s0§ && param2.§1t1066s0§ == §1t67s0§.§1t9116s0§))
            {
               §1t4433s0§.§1t8113s0§();
               §1t4433s0§ = null;
               §1t4432s0§ = 0;
            }
         }
         if(§1t3309s0§() > 0)
         {
            switch(param1)
            {
               case mcs.§1t6231s0§[§1t75s0§.§1t12394s0§]:
               case mcs.§1t6231s0§[§1t75s0§.§1t12393s0§]:
               case mcs.§1t6231s0§[§1t75s0§.§1t12389s0§]:
                  §1t1071s0§ = true;
                  §1t3256s0§ = true;
                  break;
               default:
                  §1t1071s0§ = false;
                  §1t3256s0§ = true;
            }
            _loc5_ = param2.damage;
            _loc6_ = param2.§1t1066s0§;
            _loc7_ = param2.§1t1062s0§ - §1t1239s0§;
            _loc8_ = param2.§1t1063s0§ - §1t1241s0§;
            _loc9_ = param2.§1t1064s0§ - §1t1240s0§;
            _loc10_ = param2.§1t1065s0§ - §1t1242s0§;
            _loc11_ = param2.stance;
            if(param2.§1t1062s0§ > 0 && _loc7_ < 1)
            {
               _loc7_ = 1;
            }
            else if(_loc7_ < 0)
            {
               _loc7_ = 0;
            }
            if(param2.§1t1063s0§ > 0 && _loc8_ < 1)
            {
               _loc8_ = 1;
            }
            else if(_loc8_ < 0)
            {
               _loc8_ = 0;
            }
            if(param2.§1t1064s0§ > 0 && _loc9_ < 1)
            {
               _loc9_ = 1;
            }
            else if(_loc9_ < 0)
            {
               _loc9_ = 0;
            }
            if(param2.§1t1065s0§ > 0 && _loc10_ < 1)
            {
               _loc10_ = 1;
            }
            else if(_loc10_ < 0)
            {
               _loc10_ = 0;
            }
            _loc12_ = 0;
            if(stance == §1t12220s0§ && _loc11_ == §1t12221s0§ || stance == §1t12221s0§ && _loc11_ == §1t12222s0§ || stance == §1t12222s0§ && _loc11_ == §1t12220s0§)
            {
               _loc5_ *= 1.2;
               if(controlledBy != 0)
               {
                  _loc12_ = 16777215;
               }
            }
            else if(stance == §1t12220s0§ && _loc11_ == §1t12222s0§ || stance == §1t12221s0§ && _loc11_ == §1t12220s0§ || stance == §1t12222s0§ && _loc11_ == §1t12221s0§)
            {
               _loc5_ *= 0.9;
            }
            _loc5_ -= §1t4477s0§();
            if(_loc5_ < param2.§1t1088s0§())
            {
               _loc5_ = param2.§1t1088s0§();
            }
            if(§1t1071s0§)
            {
               _loc5_ *= 1.3;
            }
            _loc13_ = _loc5_ + _loc7_ + _loc9_ + _loc8_ + _loc10_;
            §1t3308s0§(§1t3309s0§() - _loc13_);
            §1t3246s0§ = 12;
            §1t4494s0§();
            mcs.§1t3301s0§(§1t3309s0§() / §1t3257s0§);
            §1t88s0§.instance.§1t1508s0§();
            if(§1t3309s0§() <= 0)
            {
               §1t3308s0§(0);
            }
            else
            {
               §1t1071s0§ = false;
               param2.§1t1099s0§(§1t1555s0§());
               if((param2.§1t1073s0§() || actionState == §1t11147s0§ || actionState == §1t11145s0§ || actionState == §1t11144s0§) && !§1t3292s0§() && !param2.§1t1082s0§())
               {
                  if(!(param2.stance != §1t12220s0§ && §1t4438s0§ >= 3))
                  {
                     if(!(param2.stance == §1t12220s0§ && §1t4438s0§ >= 5))
                     {
                        _loc6_ = §1t67s0§.§1t9117s0§;
                        param2.§1t1083s0§(§1t1559s0§().§1t6283s0§());
                        §1t3280s0§();
                     }
                  }
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
                     §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc5_.toString(),_loc12_);
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
            §1t251s0§.instance.§1t3481s0§(nid,§1t3309s0§(),param2,true,param2.§1t1091s0§(),_loc13_);
            if(§1t3309s0§() == 0)
            {
               §1t3308s0§(1);
            }
            return true;
         }
         return false;
      }
      
      override public function §1t3274s0§(param1:MovieClip, param2:§1t67s0§, param3:Boolean = false, param4:Boolean = false) : Boolean
      {
         var _loc12_:MovieClip = null;
         var _loc15_:* = undefined;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:§1t128s0§ = null;
         if(§1t3246s0§ > 0)
         {
            return false;
         }
         if(§1t406s0§.instance != null && §1t406s0§.instance.§1t6496s0§.§1t6853s0§())
         {
            return false;
         }
         if(actionState == §1t11197s0§)
         {
            return false;
         }
         if(param2.§1t1090s0§() == this)
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
               §1t88s0§.instance.§1t1516s0§("Snd_jump");
               return true;
            }
         }
         if(§1t4465s0§() && §1t4414s0§ == §1t4415s0§ && (stance == §1t12220s0§ && §1t4491s0§(§1t120s0§.§1t10173s0§) > 0 || stance == §1t12221s0§ && §1t4491s0§(§1t120s0§.§1t10174s0§) > 0 || stance == §1t12222s0§ && §1t4491s0§(§1t120s0§.§1t10175s0§) > 0))
         {
            §1t3246s0§ = 12;
            §1t88s0§.instance.§1t1516s0§("Snd_jump");
            return true;
         }
         var _loc5_:int = param2.damage;
         var _loc6_:* = param2.§1t1066s0§;
         var _loc7_:int = param2.§1t1062s0§ - §1t1239s0§;
         var _loc8_:int = param2.§1t1063s0§ - §1t1241s0§;
         var _loc9_:int = param2.§1t1064s0§ - §1t1240s0§;
         var _loc10_:int = param2.§1t1065s0§ - §1t1242s0§;
         if(param2.§1t1062s0§ > 0 && _loc7_ < 1)
         {
            _loc7_ = 1;
         }
         else if(_loc7_ < 0)
         {
            _loc7_ = 0;
         }
         if(param2.§1t1063s0§ > 0 && _loc8_ < 1)
         {
            _loc8_ = 1;
         }
         else if(_loc8_ < 0)
         {
            _loc8_ = 0;
         }
         if(param2.§1t1064s0§ > 0 && _loc9_ < 1)
         {
            _loc9_ = 1;
         }
         else if(_loc9_ < 0)
         {
            _loc9_ = 0;
         }
         if(param2.§1t1065s0§ > 0 && _loc10_ < 1)
         {
            _loc10_ = 1;
         }
         else if(_loc10_ < 0)
         {
            _loc10_ = 0;
         }
         var _loc11_:int = 22;
         var _loc13_:Vector.<MovieClip> = mcs.§1t6231s0§;
         var _loc14_:* = int(_loc11_ - 1);
         while(_loc14_ >= 0)
         {
            _loc12_ = _loc13_[_loc14_];
            if(_loc12_.hitTestObject(param1) && (!param4 || param4 && (_loc14_ == 14 || _loc14_ == 15 || _loc12_.hitTestPoint(param1.x,param1.y,true))))
            {
               if(§1t4430s0§ && §1t4465s0§() && param1 is §1t128s0§)
               {
                  _loc18_ = §1t128s0§(param1);
                  if(_loc18_.§1t8110s0§())
                  {
                     §1t128s0§(param1).§1t8109s0§();
                     §1t88s0§.instance.§1t1511s0§();
                     return false;
                  }
               }
               if(§1t4435s0§ > 0)
               {
                  if(param3 && controlledBy != 0)
                  {
                     §1t4495s0§();
                  }
                  else if(!param3 && controlledBy == 0)
                  {
                     §1t4489s0§();
                  }
                  else
                  {
                     §1t4495s0§();
                  }
                  param2.§1t1087s0§();
                  _loc5_ = 0;
                  _loc7_ = 0;
                  _loc9_ = 0;
                  _loc8_ = 0;
                  _loc10_ = 0;
               }
               §1t3254s0§ = 0;
               if(§1t4433s0§ != null)
               {
                  if(!(actionState == §1t11198s0§ && param2.§1t1066s0§ == §1t67s0§.§1t9116s0§))
                  {
                     §1t4433s0§.§1t8113s0§();
                     §1t4433s0§ = null;
                     §1t4432s0§ = 0;
                  }
               }
               _loc5_ -= §1t4477s0§();
               if(_loc5_ < param2.§1t1088s0§())
               {
                  _loc5_ = param2.§1t1088s0§();
               }
               _loc17_ = _loc5_ + _loc7_ + _loc9_ + _loc8_ + _loc10_;
               §1t3308s0§(§1t3309s0§() - _loc17_);
               §1t3246s0§ = 12;
               §1t4494s0§();
               mcs.§1t3301s0§(§1t3309s0§() / §1t3257s0§);
               §1t88s0§.instance.§1t1508s0§();
               if(§1t3309s0§() <= 0)
               {
                  §1t3308s0§(0);
               }
               else
               {
                  param2.§1t1099s0§(§1t1555s0§());
                  if(param2.§1t1078s0§())
                  {
                     §1t3284s0§(param2.§1t1067s0§,param2.§1t1068s0§,param2.attackerlvl);
                  }
                  else if(param2.§1t1079s0§())
                  {
                     §1t3285s0§(param2.§1t1067s0§,param2.§1t1068s0§);
                  }
                  else if((param2.§1t1073s0§() || actionState == §1t11147s0§ || actionState == §1t11145s0§ || actionState == §1t11144s0§) && !§1t3292s0§() && !param2.§1t1082s0§())
                  {
                     if(!(param2.stance != §1t12220s0§ && §1t4438s0§ >= 3))
                     {
                        if(!(param2.stance == §1t12220s0§ && §1t4438s0§ >= 5))
                        {
                           _loc6_ = §1t67s0§.§1t9117s0§;
                           param2.§1t1083s0§(§1t1559s0§().§1t6283s0§());
                           §1t3280s0§();
                        }
                     }
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
               if(param2.§1t1090s0§().§1t3312s0§() || param2.§1t1090s0§().§1t3313s0§())
               {
                  §1t251s0§.instance.§1t3481s0§(nid,§1t3309s0§(),param2,false,param2.§1t1091s0§(),_loc17_);
               }
               if(§1t3309s0§() == 0)
               {
                  §1t3308s0§(1);
               }
               return true;
            }
            _loc14_--;
         }
         return false;
      }
      
      override public function §1t4484s0§(param1:String) : *
      {
         if(§1t1523s0§.§1t9586s0§().§1t3258s0§ && (!§1t1540s0§.§1t10013s0§() || §1t1525s0§.§1t9952s0§()))
         {
            if(!§1t3258s0§ && §1t1525s0§.§1t9953s0§())
            {
               §1t113s0§.instance.§1t5221s0§();
               §1t1557s0§(§1t10291s0§);
            }
            return;
         }
         §1t3308s0§(0);
         target = null;
         if(param1 == §1t251s0§.instance.nid)
         {
            §1t113s0§.instance.§1t5239s0§("[PVE] " + §1t1521s0§.getString(11494,[charname]));
            if(!§1t3250s0§)
            {
               §1t3294s0§();
               §1t3295s0§();
            }
         }
         §1t3250s0§ = true;
         §1t3298s0§();
      }
      
      override public function §1t4485s0§(param1:int, param2:String, param3:String) : *
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc8_:int = 0;
         var _loc10_:Array = null;
         if(!§1t1540s0§.§1t10013s0§() || §1t1525s0§.§1t9952s0§())
         {
            if(!§1t3258s0§ && param1 <= 0 && §1t1525s0§.§1t9953s0§())
            {
               §1t113s0§.instance.§1t5221s0§();
               §1t1557s0§(§1t10291s0§);
            }
            return;
         }
         var _loc7_:int = -1;
         if(param2 == "")
         {
            _loc4_ = §1t67s0§.§1t9116s0§;
         }
         else
         {
            _loc10_ = param2.split(",");
            _loc4_ = int(_loc10_[0]);
            if(_loc4_ == §1t67s0§.§1t9117s0§ || _loc4_ == §1t67s0§.§1t9118s0§)
            {
               _loc5_ = int(_loc10_[1]);
               if(_loc10_.length >= 3)
               {
                  _loc7_ = int(_loc10_[2]);
               }
            }
            else if(_loc4_ == §1t67s0§.§1t9119s0§ || _loc4_ == §1t67s0§.§1t9120s0§ || _loc4_ == §1t67s0§.§1t9122s0§ || _loc4_ == §1t67s0§.§1t9123s0§)
            {
               _loc5_ = int(_loc10_[1]);
               _loc6_ = int(_loc10_[2]);
               if(_loc10_.length >= 4)
               {
                  _loc7_ = int(_loc10_[3]);
               }
            }
            else if(_loc4_ == §1t67s0§.§1t9121s0§)
            {
               _loc5_ = int(_loc10_[1]);
               _loc6_ = int(_loc10_[2]);
               _loc8_ = int(_loc10_[3]);
            }
            else if(_loc4_ == §1t67s0§.§1t9125s0§)
            {
               _loc5_ = int(_loc10_[1]);
               _loc6_ = int(_loc10_[2]);
            }
         }
         var _loc9_:int = §1t3309s0§() - param1;
         §1t3308s0§(param1);
         mcs.§1t3301s0§(§1t3309s0§() / §1t3257s0§);
         §1t3246s0§ = 12;
         §1t3254s0§ = 0;
         §1t4494s0§();
         if(§1t4433s0§ != null)
         {
            if(_loc9_ > 0 || _loc4_ != §1t67s0§.§1t9116s0§)
            {
               if(!(actionState == §1t11198s0§ && _loc4_ == §1t67s0§.§1t9116s0§))
               {
                  §1t4433s0§.§1t8113s0§();
                  §1t4433s0§ = null;
                  §1t4432s0§ = 0;
               }
            }
         }
         if(§1t3309s0§() <= 0)
         {
            §1t3298s0§();
            §1t1543s0§.§1t10236s0§();
         }
         else
         {
            if(_loc4_ == §1t67s0§.§1t9117s0§ && §1t1523s0§.§1t9586s0§().nid != param3)
            {
               if(_loc7_ != -1)
               {
                  setPosition(_loc7_,§1t1559s0§().y);
               }
               if(_loc5_ == 1)
               {
                  §1t1559s0§().§1t5493s0§();
               }
               else
               {
                  §1t1559s0§().§1t5492s0§();
               }
               §1t3280s0§();
            }
            else if(_loc4_ == §1t67s0§.§1t9118s0§)
            {
               if(_loc5_ == 1)
               {
                  §1t1559s0§().§1t5493s0§();
               }
               else
               {
                  §1t1559s0§().§1t5492s0§();
               }
               §1t3281s0§();
            }
            else if(_loc4_ == §1t67s0§.§1t9119s0§)
            {
               §1t3282s0§(_loc5_,_loc6_);
            }
            else if(_loc4_ == §1t67s0§.§1t9120s0§)
            {
               §1t3283s0§(_loc5_,_loc6_);
            }
            else if(_loc4_ == §1t67s0§.§1t9121s0§)
            {
               §1t3284s0§(_loc5_,_loc6_,_loc8_);
            }
            else if(_loc4_ == §1t67s0§.§1t9125s0§)
            {
               §1t3285s0§(_loc5_,_loc6_);
            }
            else if(_loc4_ == §1t67s0§.§1t9122s0§)
            {
               §1t3286s0§(_loc5_,_loc6_);
            }
            else if(_loc4_ == §1t67s0§.§1t9124s0§)
            {
               §1t4489s0§();
            }
            else if(!§1t3292s0§() && actionState != §1t11147s0§ && actionState != §1t11145s0§ && actionState != §1t11144s0§)
            {
               §1t3290s0§();
            }
            if(_loc4_ == §1t67s0§.§1t9123s0§)
            {
               §1t4488s0§(_loc5_,_loc6_);
            }
            if(_loc9_ > 0)
            {
               §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc9_.toString(),0);
               if(§1t1523s0§.§1t9586s0§().nid != param3)
               {
                  §1t88s0§.instance.§1t1508s0§();
               }
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
            mcs.§1t3305s0§();
            mcs = null;
            §1t1543s0§.§1t10224s0§(nid);
         }
      }
      
      override internal function §1t4461s0§() : *
      {
         var _loc1_:int = §1t1525s0§.§1t8131s0§();
         §1t4478s0§();
         §1t4406s0§ = false;
         var _loc2_:int = §1t67s0§.§1t9116s0§;
         if(§1t4412s0§ == §1t12228s0§ && §1t4425s0§)
         {
            _loc2_ = §1t67s0§.§1t9117s0§;
         }
         var _loc3_:* = §1t4403s0§[§1t4403s0§.length - 1].y;
         var _loc4_:int = §1t4467s0§();
         var _loc5_:§1t67s0§ = new §1t67s0§(§1t4410s0§,level,_loc2_,stance);
         _loc5_.§1t1072s0§(§1t1244s0§);
         _loc5_.§1t1089s0§(this);
         if(_loc4_ - _loc3_ > jumpThreshhold)
         {
            mcs.y = _loc3_ + 90;
            velY = 0;
            §1t3269s0§(§1t11145s0§);
         }
         else
         {
            mcs.y = _loc4_;
            velY = 0;
            §1t3269s0§(§1t11150s0§);
         }
         var _loc6_:int = int(§1t4403s0§.length);
         var _loc7_:int = _loc6_ - §1t1541s0§.§1t10088s0§ + 1;
         if(_loc7_ < 0)
         {
            _loc7_ = 0;
         }
         if(mcs != null)
         {
            if(§1t4403s0§[_loc6_ - 1].x > §1t4403s0§[_loc7_].x)
            {
               velX = 5;
               mcs.§1t5493s0§();
            }
            else
            {
               velX = -5;
               mcs.§1t5492s0§();
            }
         }
         if(§1t4407s0§)
         {
            §1t4403s0§ = §1t4404s0§;
            §1t4406s0§ = true;
         }
         §1t4407s0§ = false;
         §1t4405s0§ = false;
         if(§1t4411s0§)
         {
            §1t4411s0§ = false;
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
         mcs.y = §1t1525s0§.§1t4467s0§();
      }
   }
}

