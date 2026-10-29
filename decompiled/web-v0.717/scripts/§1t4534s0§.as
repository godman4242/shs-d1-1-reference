package
{
   public class §1t4534s0§ extends §1t68s0§
   {
      
      public function §1t4534s0§(param1:§1t75s0§ = null)
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
      }
      
      override public function update() : *
      {
         if(mcs == null || §1t3260s0§)
         {
            return;
         }
         if(target == null || target.§1t2364s0§())
         {
            target = §1t1543s0§.§1t10231s0§(§1t1555s0§(),true);
            if(target == null)
            {
               return;
            }
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
               case §1t10437s0§:
                  this.§1t3269s0§(§1t11143s0§);
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
                     if(§1t3309s0§() > 0)
                     {
                        mcs.§1t6279s0§();
                     }
                     mcs.§1t6281s0§(-100);
                     if(actionState == §1t11172s0§)
                     {
                        §1t1557s0§(§1t10299s0§);
                     }
                     else
                     {
                        §1t1557s0§(§1t10297s0§);
                     }
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
                  break;
               case §1t10429s0§:
                  this.§1t3269s0§(§1t11143s0§);
                  break;
               case §1t10439s0§:
                  if(velY < 0)
                  {
                     §1t1557s0§(§1t10433s0§);
                  }
                  else
                  {
                     §1t1557s0§(§1t10435s0§);
                  }
                  break;
               case §1t10441s0§:
                  §1t88s0§.instance.§1t1516s0§("Snd_smokebomb");
                  this.§1t4535s0§();
                  setPosition(Math.random() * §1t1525s0§.§1t8124s0§(),mcs.y);
                  this.§1t4535s0§();
                  this.§1t3269s0§(§1t11143s0§);
                  break;
               case §1t10431s0§:
                  §1t1557s0§(§1t10433s0§);
                  break;
               case §1t10443s0§:
                  §1t1557s0§(§1t10427s0§);
            }
         }
         this.§1t3270s0§();
         if(§1t3246s0§ > 0)
         {
            --§1t3246s0§;
         }
      }
      
      override public function §1t3269s0§(param1:int) : *
      {
         this.actionState = param1;
         switch(param1)
         {
            case §1t11141s0§:
               mcs.§1t6246s0§(§1t10425s0§,0);
               break;
            case §1t11143s0§:
               §1t1557s0§(§1t10425s0§);
               break;
            case §1t11151s0§:
               §1t1557s0§(§1t10427s0§);
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
               §1t1557s0§(§1t10437s0§);
               break;
            case §1t11153s0§:
               break;
            case §1t11158s0§:
               this.§1t4536s0§();
               §1t1557s0§(§1t10429s0§);
               break;
            case §1t11159s0§:
               velY = -(Math.random() * 15 + 30);
               §1t1557s0§(§1t10431s0§);
               break;
            case §1t11160s0§:
               §1t1557s0§(§1t10441s0§);
         }
      }
      
      override internal function §1t3270s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         switch(actionState)
         {
            case §1t11141s0§:
               this.§1t3269s0§(§1t11143s0§);
               break;
            case §1t11143s0§:
               _loc1_ = target.mcs.x;
               _loc2_ = target.mcs.y;
               if(_loc1_ < mcs.x)
               {
                  mcs.§1t5492s0§();
                  if(mcs.x - _loc1_ < 200 && mcs.y - _loc2_ < 10 && int(Math.random() * 2) == 0)
                  {
                     this.§1t3269s0§(§1t11151s0§);
                  }
                  else
                  {
                     §1t1553s0§(-2);
                  }
               }
               else
               {
                  mcs.§1t5493s0§();
                  if(_loc1_ - mcs.x < 200 && mcs.y - _loc2_ < 50 && int(Math.random() * 2) == 0)
                  {
                     this.§1t3269s0§(§1t11151s0§);
                  }
                  else
                  {
                     §1t1553s0§(2);
                  }
               }
               if(§1t3271s0§())
               {
                  target = §1t1543s0§.§1t10231s0§(§1t1555s0§(),true);
                  _loc5_ = Math.random() * 20;
                  if(_loc5_ == 0)
                  {
                     this.§1t3269s0§(§1t11160s0§);
                  }
                  else if(_loc5_ == 1)
                  {
                     this.§1t3269s0§(§1t11158s0§);
                  }
                  else if(_loc5_ == 2)
                  {
                     this.§1t3269s0§(§1t11159s0§);
                  }
                  else if(_loc5_ == 3)
                  {
                     this.§1t3269s0§(§1t11151s0§);
                  }
               }
               break;
            case §1t11151s0§:
               if(mcs.scaleX == 1)
               {
                  §1t1553s0§(12);
               }
               else
               {
                  §1t1553s0§(-12);
               }
               _loc3_ = mcs.x - target.mcs.x;
               _loc4_ = Math.abs(_loc3_);
               if(_loc4_ < 200)
               {
                  if(mcs.scaleX == 1 && _loc3_ < 0 || mcs.scaleX == -1 && _loc3_ > 0)
                  {
                     §1t1557s0§(§1t10443s0§);
                  }
                  target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12380s0§],new §1t67s0§(damage,level));
               }
               else if(_loc4_ > 500)
               {
                  this.§1t3269s0§(§1t11143s0§);
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
            case §1t11159s0§:
               if(mcs.animation == §1t10431s0§)
               {
                  return;
               }
               mcs.y += velY;
               velY += 3;
               if(velY > 0 && mcs.animation != §1t10435s0§ && mcs.animation != §1t10439s0§)
               {
                  §1t1557s0§(§1t10439s0§);
                  if(int(Math.random() * 10) == 0)
                  {
                     this.§1t4537s0§();
                  }
                  else
                  {
                     this.§1t4536s0§();
                  }
               }
               if(mcs.y >= §1t1525s0§.§1t4467s0§())
               {
                  mcs.y = §1t1525s0§.§1t4467s0§();
                  this.§1t3269s0§(§1t11146s0§);
               }
         }
      }
      
      internal function §1t4535s0§() : *
      {
         var _loc1_:§1t6365s0§ = null;
         _loc1_ = new §1t6365s0§();
         _loc1_.x = mcs.x;
         _loc1_.y = mcs.y;
         §1t1525s0§.§1t9942s0§().addChild(_loc1_);
      }
      
      internal function §1t4536s0§() : *
      {
         this.§1t4538s0§(60);
      }
      
      internal function §1t4537s0§() : *
      {
         this.§1t4538s0§(-100);
         this.§1t4538s0§(0);
         this.§1t4538s0§(100);
      }
      
      internal function §1t4538s0§(param1:*) : *
      {
         var _loc2_:int = mcs.x;
         var _loc3_:int = mcs.y - 60;
         var _loc4_:int = target.mcs.x;
         var _loc5_:int = target.mcs.y - param1;
         var _loc6_:int = _loc4_ - _loc2_;
         var _loc7_:int = _loc5_ - _loc3_;
         var _loc8_:int = Math.sqrt(_loc6_ * _loc6_ + _loc7_ * _loc7_);
         if(_loc8_ == 0)
         {
            _loc8_ = 1;
         }
         var _loc9_:int = _loc6_ * 20 / _loc8_;
         var _loc10_:int = _loc7_ * 20 / _loc8_;
         §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11272s0§,_loc2_ + §1t1525s0§.§1t8131s0§(),_loc3_,_loc9_,_loc10_,damage,1,this);
      }
   }
}

