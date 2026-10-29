package
{
   public class §1t4545s0§ extends §1t68s0§
   {
      
      internal var §1t4408s0§:int;
      
      internal var §1t4514s0§:int;
      
      internal var charname:String;
      
      internal var §1t4546s0§:int = 0;
      
      internal var §1t4547s0§:int = 0;
      
      public function §1t4545s0§(param1:§1t75s0§ = null)
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
         §1t3261s0§ = false;
         §1t3262s0§ = false;
         §1t3263s0§ = false;
         §1t3264s0§ = false;
         §1t3265s0§ = false;
      }
      
      override public function init(param1:§1t76s0§) : *
      {
         §1t1550s0§(param1.mcs);
         damage = param1.attack;
         defense = param1.defense;
         §1t3257s0§ = param1.hp;
         level = param1.lvl;
         xp = level * 5 + 45;
         reset();
         this.§1t3269s0§(§1t11143s0§);
         reward = param1.§1t992s0§();
         this.charname = param1.§1t509s0§();
      }
      
      override public function setLevel(param1:int) : *
      {
         var _loc2_:Number = NaN;
         _loc2_ = param1 / level;
         level = param1;
         damage *= _loc2_;
         defense *= _loc2_;
         §1t3257s0§ *= _loc2_;
         §1t3308s0§(§1t3257s0§);
         §1t3301s0§();
         xp = param1 * 5 + 45;
         mcs.§1t6287s0§(this.charname + " (" + param1 + ")",16777215);
         var _loc3_:int = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9403s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t9403s0§);
         var _loc4_:int = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9409s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t9409s0§);
         var _loc5_:int = §1t1523s0§.§1t1088s0§() + §1t1523s0§.§1t9591s0§() / 2;
         var _loc6_:int = §1t1523s0§.getLevel();
         var _loc7_:int = param1 - _loc6_;
         var _loc8_:int = 5 + 8 + _loc7_;
         var _loc9_:int = 16 - _loc7_;
         if(_loc8_ <= 5)
         {
            _loc8_ = 5;
         }
         if(_loc9_ <= 0)
         {
            _loc9_ = 1;
         }
         var _loc10_:int = _loc5_ - defense;
         if(_loc6_ <= 10 && _loc10_ < 1)
         {
            _loc10_ = 1;
         }
         else if(_loc6_ <= 20 && _loc10_ < _loc6_ / 8)
         {
            _loc10_ = _loc6_ / 8;
         }
         else if(_loc6_ <= 30 && _loc10_ < _loc6_ / 6)
         {
            _loc10_ = _loc6_ / 6;
         }
         else if(_loc10_ < _loc6_ / 4)
         {
            _loc10_ = _loc6_ / 4;
         }
         var _loc11_:int = _loc10_ * _loc8_;
         if(_loc11_ > §1t3257s0§)
         {
            §1t3257s0§ = _loc11_;
            §1t3308s0§(§1t3257s0§);
            §1t3301s0§();
         }
         var _loc12_:int = _loc3_ / _loc9_;
         if(_loc12_ > damage)
         {
            damage = _loc12_;
         }
      }
      
      override public function update() : *
      {
         if(mcs == null || §1t3260s0§)
         {
            return;
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
               case §1t10705s0§:
                  §1t3299s0§();
                  break;
               case §1t10707s0§:
                  §1t1557s0§(§1t10709s0§);
                  break;
               case §1t10713s0§:
                  §1t1557s0§(§1t10715s0§);
                  break;
               case §1t10719s0§:
                  §1t1557s0§(§1t10721s0§);
                  break;
               case §1t10721s0§:
                  §1t1557s0§(§1t10723s0§);
                  break;
               case §1t10723s0§:
                  §1t1557s0§(§1t10725s0§);
                  break;
               case §1t10715s0§:
                  if(§1t1525s0§.§1t9952s0§())
                  {
                     §1t3260s0§ = true;
                     return;
                  }
                  §1t1557s0§(§1t10717s0§);
                  break;
               case §1t10709s0§:
                  §1t1557s0§(§1t10711s0§);
                  break;
               case §1t10451s0§:
               case §1t10711s0§:
               case §1t10725s0§:
               case §1t10717s0§:
               case §1t10315s0§:
                  this.§1t3269s0§(§1t11143s0§);
                  break;
               case §1t10727s0§:
                  §1t1557s0§(§1t10729s0§);
                  this.§1t4540s0§();
                  break;
               case §1t10729s0§:
                  this.§1t3269s0§(§1t11143s0§);
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
                     if(§1t3309s0§() > 0)
                     {
                        mcs.§1t6279s0§();
                     }
                     mcs.§1t6281s0§(-100);
                     §1t1557s0§(§1t10297s0§);
                  }
                  break;
               case §1t10297s0§:
                  §1t1557s0§(§1t10299s0§);
                  break;
               case §1t10299s0§:
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
            }
         }
         if(target == null || target.§1t2364s0§())
         {
            target = §1t1543s0§.§1t10231s0§(§1t1555s0§(),true);
            if(target == null)
            {
               return;
            }
         }
         this.§1t3270s0§();
         if(§1t3246s0§ > 0)
         {
            --§1t3246s0§;
         }
         if(this.§1t4546s0§ > 0)
         {
            --this.§1t4546s0§;
         }
         if(this.§1t4547s0§ > 0)
         {
            --this.§1t4547s0§;
         }
         if(§1t3271s0§())
         {
            target = §1t1543s0§.§1t10231s0§(§1t1555s0§(),true);
         }
      }
      
      override public function §1t3269s0§(param1:int) : *
      {
         this.actionState = param1;
         switch(param1)
         {
            case §1t11141s0§:
               §1t1557s0§(§1t10697s0§);
               break;
            case §1t11143s0§:
               §1t1557s0§(§1t10701s0§);
               this.§1t4408s0§ = target.posX;
               if(this.§1t4408s0§ < posX)
               {
                  §1t3243s0§ = -Math.random() * 2 - 4;
                  mcs.§1t5492s0§();
               }
               else
               {
                  §1t3243s0§ = Math.random() * 2 + 4;
                  mcs.§1t5493s0§();
               }
               break;
            case §1t11142s0§:
               §1t1557s0§(§1t10703s0§);
               if(§1t3243s0§ < 0)
               {
                  §1t3243s0§ = -12;
               }
               else
               {
                  §1t3243s0§ = 12;
               }
               break;
            case §1t11151s0§:
               §1t1557s0§(§1t10707s0§);
               break;
            case §1t11149s0§:
               §1t1557s0§(§1t10713s0§);
               break;
            case §1t11166s0§:
               §1t1557s0§(§1t10719s0§);
               break;
            case §1t11158s0§:
               §1t1557s0§(§1t10727s0§);
               this.§1t4547s0§ = 240;
               break;
            case §1t11147s0§:
               §1t1557s0§(§1t10403s0§);
               break;
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
            case §1t11154s0§:
               §1t3260s0§ = true;
         }
      }
      
      override internal function §1t3270s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         switch(actionState)
         {
            case §1t11141s0§:
               if(this.§1t4546s0§ == 0)
               {
                  this.§1t3269s0§(§1t11143s0§);
               }
               break;
            case §1t11143s0§:
               §1t1553s0§(§1t3243s0§);
               _loc2_ = Math.abs(target.posX - posX);
               if(_loc2_ < 100)
               {
                  if(this.§1t4546s0§ == 0)
                  {
                     this.§1t4546s0§ = 48;
                     if(_loc2_ < 40)
                     {
                        this.§1t3269s0§(§1t11166s0§);
                     }
                     else
                     {
                        _loc1_ = Math.random() * 2;
                        if(_loc1_ == 0)
                        {
                           this.§1t3269s0§(§1t11151s0§);
                        }
                        else if(_loc1_ == 1)
                        {
                           this.§1t3269s0§(§1t11149s0§);
                        }
                     }
                  }
                  else
                  {
                     this.§1t3269s0§(§1t11141s0§);
                  }
               }
               else if(_loc2_ > 400)
               {
                  if(this.§1t4547s0§ == 0)
                  {
                     this.§1t3269s0§(§1t11158s0§);
                  }
                  else
                  {
                     this.§1t3269s0§(§1t11142s0§);
                  }
               }
               else if(Math.abs(this.§1t4408s0§ - posX) < 10)
               {
                  this.§1t3269s0§(§1t11143s0§);
               }
               break;
            case §1t11142s0§:
               §1t1553s0§(§1t3243s0§);
               _loc2_ = Math.abs(target.posX - posX);
               if(_loc2_ < 100)
               {
                  if(this.§1t4546s0§ == 0)
                  {
                     this.§1t4546s0§ = 48;
                     if(_loc2_ < 40)
                     {
                        this.§1t3269s0§(§1t11166s0§);
                     }
                     else
                     {
                        _loc1_ = Math.random() * 2;
                        if(_loc1_ == 0)
                        {
                           this.§1t3269s0§(§1t11151s0§);
                        }
                        else if(_loc1_ == 1)
                        {
                           this.§1t3269s0§(§1t11149s0§);
                        }
                     }
                  }
                  else
                  {
                     this.§1t3269s0§(§1t11141s0§);
                  }
               }
               else if(_loc2_ > 400)
               {
                  this.§1t3269s0§(§1t11142s0§);
               }
               else if(Math.abs(this.§1t4408s0§ - posX) < 10)
               {
                  this.§1t3269s0§(§1t11143s0§);
               }
               break;
            case §1t11151s0§:
               if(mcs.animation == §1t10709s0§)
               {
                  target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12380s0§],new §1t67s0§(damage,0));
               }
               break;
            case §1t11149s0§:
               if(mcs.animation == §1t10715s0§)
               {
                  target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12380s0§],new §1t67s0§(damage,0,§1t67s0§.§1t9117s0§));
               }
               break;
            case §1t11166s0§:
               if(mcs.animation == §1t10721s0§)
               {
                  target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12386s0§],new §1t67s0§(damage,0,§1t67s0§.§1t9118s0§));
               }
               break;
            case §1t11147s0§:
               §1t3288s0§();
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
         }
      }
      
      override public function §1t3298s0§() : *
      {
         §1t88s0§.instance.§1t1507s0§();
         if(!§1t1540s0§.§1t10015s0§())
         {
            §1t3294s0§();
            §1t3295s0§();
         }
         actionState = §1t11153s0§;
         §1t1557s0§(§1t10705s0§);
         §1t3258s0§ = true;
         mcs.§1t6280s0§();
      }
      
      override public function §1t2292s0§() : *
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
         if(actionState != §1t11147s0§ && actionState != §1t11153s0§ && actionState != §1t11173s0§ && mcs.animation != §1t10715s0§)
         {
            §1t3260s0§ = true;
         }
      }
      
      internal function §1t4540s0§() : *
      {
         var _loc1_:int = mcs.x;
         var _loc2_:int = mcs.y - 100;
         var _loc3_:int = target.§1t1559s0§().x;
         var _loc4_:int = target.§1t1559s0§().y - 60;
         var _loc5_:Number = §1t128s0§.§1t12543s0§ * Math.abs(_loc3_ - _loc1_) / (0.866 / 3);
         _loc5_ = Math.sqrt(_loc5_);
         var _loc6_:Number = _loc5_ * (0.866 / 3);
         var _loc7_:Number = Math.abs(_loc3_ - _loc1_) / _loc6_;
         var _loc8_:Number = (_loc4_ - _loc2_ - 0.5 * §1t128s0§.§1t12543s0§ * _loc7_ * _loc7_) / _loc7_;
         if(_loc1_ > _loc3_)
         {
            _loc6_ = -_loc6_;
         }
         _loc8_ += Math.random() * 8 - 4;
         §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11311s0§,§1t1555s0§(),_loc2_,_loc6_,_loc8_,20,1,this);
      }
   }
}

