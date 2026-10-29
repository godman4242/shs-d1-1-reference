package
{
   import flash.display.MovieClip;
   
   public class §1t4523s0§ extends §1t68s0§
   {
      
      internal var §1t4524s0§:int = 0;
      
      internal var §1t4525s0§:int = 0;
      
      internal var §1t4526s0§:int = 0;
      
      internal var §1t4527s0§:Boolean = false;
      
      internal var §1t4528s0§:Boolean = false;
      
      public function §1t4523s0§(param1:§1t75s0§ = null, param2:Boolean = false)
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
         this.§1t4528s0§ = param2;
      }
      
      override public function setLevel(param1:int) : *
      {
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         if(!this.§1t4528s0§)
         {
            super.setLevel(param1);
         }
         else
         {
            _loc2_ = param1 / level;
            level = param1;
            damage *= _loc2_;
            defense *= _loc2_;
            §1t3257s0§ *= _loc2_;
            §1t3308s0§(§1t3257s0§);
            §1t3301s0§();
            if(this.§1t4528s0§)
            {
               xp = param1 * 5 + 45;
               _loc3_ = 16777215;
            }
            else
            {
               xp = param1 * 2 + 20;
            }
            if(this.§1t4528s0§)
            {
               _loc2_ = param1 / level;
               level = param1;
               damage *= _loc2_;
               defense *= _loc2_;
               §1t3257s0§ *= _loc2_;
               §1t3308s0§(§1t3257s0§);
               §1t3301s0§();
               xp = param1 * 5 + 45;
               _loc4_ = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9403s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t9403s0§);
               _loc5_ = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9409s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t9409s0§);
               _loc6_ = §1t1523s0§.§1t1088s0§() + §1t1523s0§.§1t9591s0§() / 2;
               _loc7_ = §1t1523s0§.getLevel();
               _loc8_ = param1 - _loc7_;
               _loc9_ = 10 + _loc8_;
               _loc10_ = 18 - _loc8_;
               if(_loc9_ <= 3)
               {
                  _loc9_ = 3;
               }
               if(_loc10_ <= 0)
               {
                  _loc10_ = 1;
               }
               _loc11_ = _loc6_ - defense;
               if(_loc7_ <= 10 && _loc11_ < 1)
               {
                  _loc11_ = 1;
               }
               else if(_loc7_ <= 20 && _loc11_ < _loc7_ / 8)
               {
                  _loc11_ = _loc7_ / 8;
               }
               else if(_loc7_ <= 30 && _loc11_ < _loc7_ / 6)
               {
                  _loc11_ = _loc7_ / 6;
               }
               else if(_loc11_ < _loc7_ / 4)
               {
                  _loc11_ = _loc7_ / 4;
               }
               _loc12_ = _loc11_ * _loc9_;
               if(_loc12_ > §1t3257s0§)
               {
                  §1t3257s0§ = _loc12_;
                  §1t3308s0§(§1t3257s0§);
                  §1t3301s0§();
               }
               _loc13_ = _loc4_ / _loc10_;
               if(_loc13_ > damage)
               {
                  damage = _loc13_;
               }
               if(param1 <= 5)
               {
                  damage = 1;
                  defense = 1;
               }
            }
         }
      }
      
      override public function update() : *
      {
         var _loc2_:int = 0;
         if(mcs == null || §1t3260s0§)
         {
            return;
         }
         if(!§1t3258s0§ && (target == null || target.§1t2364s0§()))
         {
            target = §1t1543s0§.§1t10231s0§(§1t1555s0§(),!§1t3255s0§);
         }
         var _loc1_:String = mcs.§1t3268s0§();
         if(_loc1_ != "")
         {
            switch(_loc1_)
            {
               case §1t10409s0§:
               case §1t10291s0§:
               case §1t10289s0§:
               case §1t10413s0§:
               case §1t10411s0§:
               case §1t10417s0§:
               case §1t10419s0§:
                  §1t3299s0§();
                  break;
               case §1t10479s0§:
               case §1t10451s0§:
               case §1t10485s0§:
               case §1t10315s0§:
               case §1t10467s0§:
               case §1t10469s0§:
               case §1t10477s0§:
               case §1t10481s0§:
               case §1t10459s0§:
                  this.§1t3269s0§(§1t11143s0§);
                  this.§1t4501s0§();
                  break;
               case §1t10307s0§:
                  this.§1t3269s0§(§1t11152s0§);
                  break;
               case §1t10896s0§:
                  §1t1557s0§(§1t10309s0§);
                  break;
               case §1t10309s0§:
                  if(§1t1559s0§().§1t6283s0§())
                  {
                     §1t1553s0§(-40);
                  }
                  else
                  {
                     §1t1553s0§(40);
                  }
                  this.§1t3269s0§(§1t11141s0§);
                  break;
               case §1t10405s0§:
                  §1t1557s0§(§1t10407s0§);
                  break;
               case §1t10295s0§:
                  if(§1t3258s0§)
                  {
                     §1t3299s0§();
                  }
                  else
                  {
                     if(§1t3309s0§() > 0 && !§1t1525s0§.§1t9952s0§())
                     {
                        mcs.§1t6279s0§();
                     }
                     mcs.§1t6281s0§(-100);
                     if(actionState == §1t11172s0§)
                     {
                        §1t1557s0§(§1t10301s0§);
                     }
                     else
                     {
                        §1t1557s0§(§1t10297s0§);
                     }
                  }
                  break;
               case §1t10297s0§:
                  §1t1557s0§(§1t10301s0§);
                  break;
               case §1t10299s0§:
               case §1t10301s0§:
                  mcs.§1t6281s0§(0);
                  if(mcs.scaleX == 1)
                  {
                     §1t1553s0§(-100);
                  }
                  else
                  {
                     §1t1553s0§(100);
                  }
                  this.§1t3269s0§(§1t11143s0§);
                  break;
               case §1t10483s0§:
                  if(target != null)
                  {
                     _loc2_ = level;
                     if(this.§1t4528s0§)
                     {
                        _loc2_ = 0;
                     }
                     if(target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12380s0§],new §1t67s0§(damage,_loc2_)) && §1t3255s0§)
                     {
                        §1t1543s0§.§1t10236s0§();
                     }
                  }
                  §1t1557s0§(§1t10485s0§);
                  break;
               case §1t10313s0§:
                  if(target != null && target.§1t3292s0§())
                  {
                     _loc2_ = level;
                     if(this.§1t4528s0§)
                     {
                        _loc2_ = 0;
                     }
                     if(target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12380s0§],new §1t67s0§(damage * 2,_loc2_)) && §1t3255s0§)
                     {
                        §1t1543s0§.§1t10236s0§();
                     }
                  }
                  §1t1557s0§(§1t10315s0§);
                  break;
               case §1t10463s0§:
                  §1t1557s0§(§1t10465s0§);
                  break;
               case §1t10465s0§:
                  §1t1557s0§(§1t10467s0§);
                  break;
               case §1t10471s0§:
                  §1t1557s0§(§1t10473s0§);
                  break;
               case §1t10473s0§:
                  §1t1557s0§(§1t10475s0§);
                  break;
               case §1t10475s0§:
                  §1t1557s0§(§1t10477s0§);
                  break;
               case §1t10455s0§:
                  §1t1557s0§(§1t10457s0§);
                  break;
               case §1t10457s0§:
                  §1t1557s0§(§1t10459s0§);
            }
         }
         this.§1t3270s0§();
         if(§1t3246s0§ > 0)
         {
            --§1t3246s0§;
         }
         if(this.§1t4524s0§ > 0)
         {
            --this.§1t4524s0§;
         }
         if(this.§1t4525s0§ > 0)
         {
            --this.§1t4525s0§;
         }
         if(this.§1t4526s0§ > 0)
         {
            --this.§1t4526s0§;
         }
      }
      
      override public function §1t3269s0§(param1:int) : *
      {
         this.actionState = param1;
         switch(param1)
         {
            case §1t11141s0§:
               §1t1557s0§(§1t10453s0§);
               break;
            case §1t11143s0§:
               §1t3243s0§ = Math.random() * 2 + 3;
               §1t1557s0§(§1t10497s0§);
               break;
            case §1t11151s0§:
            case §1t11162s0§:
               §1t3304s0§();
               break;
            case §1t11142s0§:
               §1t1557s0§(§1t10493s0§);
               break;
            case §1t11147s0§:
               §1t1557s0§(§1t10403s0§);
               break;
            case §1t11172s0§:
            case §1t11152s0§:
               §1t1557s0§(§1t10295s0§);
               break;
            case §1t11145s0§:
               §1t1557s0§(§1t10449s0§);
               break;
            case §1t11146s0§:
               §1t1557s0§(§1t10451s0§);
               break;
            case §1t11153s0§:
               break;
            case §1t11163s0§:
               §1t3304s0§();
               §1t1557s0§(§1t10313s0§);
         }
      }
      
      override internal function §1t3270s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(target == null || §1t3271s0§())
         {
            this.§1t4501s0§();
         }
         switch(actionState)
         {
            case §1t11141s0§:
               if(target != null && !target.§1t3293s0§())
               {
                  this.§1t3269s0§(§1t11143s0§);
               }
               break;
            case §1t11143s0§:
               if(target == null || target.§1t3293s0§())
               {
                  this.§1t3269s0§(§1t11141s0§);
                  return;
               }
               _loc1_ = target.mcs.x;
               _loc2_ = target.mcs.y;
               if(_loc1_ < mcs.x)
               {
                  mcs.§1t5492s0§();
                  §1t1553s0§(-§1t3243s0§);
               }
               else
               {
                  mcs.§1t5493s0§();
                  §1t1553s0§(§1t3243s0§);
               }
               break;
            case §1t11147s0§:
               §1t3288s0§();
               break;
            case §1t11173s0§:
               §1t3289s0§();
               break;
            case §1t11174s0§:
               §1t3287s0§();
               break;
            case §1t11152s0§:
               break;
            case §1t11145s0§:
               mcs.y += velY;
               velY += 3;
               if(mcs.y >= §1t1525s0§.§1t4467s0§())
               {
                  mcs.y = §1t1525s0§.§1t4467s0§();
                  this.§1t3269s0§(§1t11146s0§);
               }
               break;
            case §1t11146s0§:
               break;
            case §1t11153s0§:
               §1t3300s0§();
               break;
            case §1t11151s0§:
               _loc3_ = level;
               if(this.§1t4528s0§)
               {
                  _loc3_ = 0;
               }
               if(§1t1558s0§() == §1t10479s0§)
               {
                  if(target != null && target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12380s0§],new §1t67s0§(damage,_loc3_,§1t67s0§.§1t9117s0§)) && §1t3255s0§)
                  {
                     §1t1543s0§.§1t10236s0§();
                  }
               }
               else if(§1t1558s0§() == §1t10457s0§)
               {
                  if(target != null && target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12380s0§],new §1t67s0§(damage,_loc3_,§1t67s0§.§1t9118s0§)) && §1t3255s0§)
                  {
                     §1t1543s0§.§1t10236s0§();
                  }
               }
               else if(§1t1558s0§() == §1t10465s0§)
               {
                  if(mcs.§1t6283s0§())
                  {
                     §1t1553s0§(20);
                  }
                  else
                  {
                     §1t1553s0§(-20);
                  }
                  if(target != null && target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12380s0§],new §1t67s0§(damage,_loc3_)) && §1t3255s0§)
                  {
                     §1t1543s0§.§1t10236s0§();
                  }
               }
               else if(§1t1558s0§() == §1t10469s0§ || §1t1558s0§() == §1t10481s0§)
               {
                  if(target != null && target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12380s0§],new §1t67s0§(damage,_loc3_)) && §1t3255s0§)
                  {
                     §1t1543s0§.§1t10236s0§();
                  }
               }
               break;
            case §1t11162s0§:
               if(§1t1558s0§() == §1t10473s0§)
               {
                  if(mcs.§1t6283s0§())
                  {
                     §1t1553s0§(20);
                  }
                  else
                  {
                     §1t1553s0§(-20);
                  }
                  _loc3_ = level;
                  if(this.§1t4528s0§)
                  {
                     _loc3_ = 0;
                  }
                  if(target != null && target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12382s0§],new §1t67s0§(damage,_loc3_,§1t67s0§.§1t9118s0§)) && §1t3255s0§)
                  {
                     §1t1543s0§.§1t10236s0§();
                  }
               }
               else if(§1t1558s0§() == §1t10475s0§)
               {
                  if(mcs.§1t6283s0§())
                  {
                     §1t1553s0§(10);
                  }
                  else
                  {
                     §1t1553s0§(-10);
                  }
               }
         }
      }
      
      override public function §1t3274s0§(param1:MovieClip, param2:§1t67s0§, param3:Boolean = false, param4:Boolean = false) : Boolean
      {
         var _loc6_:MovieClip = null;
         var _loc9_:§1t128s0§ = null;
         var _loc5_:int = mcs.§1t6260s0§();
         var _loc7_:Vector.<MovieClip> = mcs.§1t6231s0§;
         var _loc8_:* = int(_loc5_ - 1);
         while(_loc8_ >= 0 && !§1t3256s0§)
         {
            _loc6_ = _loc7_[_loc8_];
            if(_loc6_.hitTestObject(param1))
            {
               if(_loc6_ == mcs.§1t6231s0§[§1t75s0§.§1t12380s0§] && param1 is §1t128s0§)
               {
                  _loc9_ = §1t128s0§(param1);
                  if(_loc9_.§1t8110s0§())
                  {
                     §1t128s0§(param1).§1t8109s0§();
                     return false;
                  }
               }
               if(§1t3277s0§(_loc6_,param2))
               {
                  if(§1t3279s0§())
                  {
                     §1t1543s0§.§1t10236s0§();
                  }
                  return true;
               }
               return false;
            }
            _loc8_--;
         }
         §1t3256s0§ = false;
         return false;
      }
      
      internal function §1t4501s0§() : *
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(§1t3260s0§ || §1t3258s0§ || §1t3292s0§() || §1t3293s0§() || actionState == §1t11147s0§)
         {
            return;
         }
         var _loc1_:§1t68s0§ = §1t1543s0§.§1t10231s0§(§1t1555s0§(),!§1t3255s0§);
         if(_loc1_ != null)
         {
            target = _loc1_;
         }
         if(target == null)
         {
            return;
         }
         if(§1t1525s0§.§1t9947s0§())
         {
            if(!this.§1t4527s0§ && §1t1540s0§.§1t10046s0§())
            {
               this.§1t4527s0§ = true;
               this.§1t3269s0§(§1t11150s0§);
               §1t1557s0§(§1t1544s0§.§1t10373s0§);
            }
            if(actionState == §1t11150s0§ && Math.abs(target.§1t1555s0§() - §1t1555s0§()) < 100)
            {
               this.§1t3269s0§(§1t11143s0§);
            }
            return;
         }
         if(actionState == §1t11150s0§)
         {
            this.§1t3269s0§(§1t11143s0§);
         }
         if(actionState == §1t11143s0§)
         {
            _loc3_ = Math.abs(mcs.x - target.mcs.x);
            if(_loc3_ < 50 && target.§1t3292s0§())
            {
               this.§1t3269s0§(§1t11163s0§);
            }
            else if(_loc3_ < 100)
            {
               _loc2_ = Math.random() * 4;
               if(_loc2_ == 1 && this.§1t4524s0§ == 0)
               {
                  this.§1t3269s0§(§1t11151s0§);
                  §1t1557s0§(§1t10455s0§);
                  this.§1t4524s0§ = 5 * 24;
               }
               else if(_loc2_ == 2 && this.§1t4525s0§ == 0)
               {
                  this.§1t3269s0§(§1t11151s0§);
                  §1t1557s0§(§1t10469s0§);
                  this.§1t4524s0§ = 5 * 24;
               }
               else if(_loc2_ == 3 && this.§1t4526s0§ == 0)
               {
                  this.§1t3269s0§(§1t11151s0§);
                  §1t1557s0§(§1t10479s0§);
                  this.§1t4524s0§ = 5 * 24;
               }
               else
               {
                  this.§1t3269s0§(§1t11151s0§);
                  §1t1557s0§(§1t10483s0§);
               }
            }
            else if(_loc3_ < 200)
            {
               _loc2_ = Math.random() * 5;
               if(_loc2_ == 0)
               {
                  this.§1t3269s0§(§1t11151s0§);
                  §1t1557s0§(§1t10463s0§);
               }
               else if(_loc2_ == 1)
               {
                  this.§1t3269s0§(§1t11151s0§);
                  §1t1557s0§(§1t10481s0§);
               }
               else if(_loc2_ == 2)
               {
                  this.§1t3269s0§(§1t11162s0§);
                  §1t1557s0§(§1t10471s0§);
               }
            }
         }
      }
   }
}

