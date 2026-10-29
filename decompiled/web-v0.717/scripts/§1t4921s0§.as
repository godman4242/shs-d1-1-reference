package
{
   public class §1t4921s0§ extends §1t4909s0§
   {
      
      public function §1t4921s0§(param1:§1t75s0§ = null)
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
         target = §1t1523s0§.§1t9586s0§();
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
                  §1t3299s0§();
                  break;
               case §1t10437s0§:
                  this.§1t3269s0§(§1t11141s0§);
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
                  this.§1t3269s0§(§1t11141s0§);
                  break;
               case §1t10429s0§:
               case §1t10345s0§:
                  this.§1t3269s0§(§1t11141s0§);
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
                  this.§1t3269s0§(§1t11141s0§);
                  break;
               case §1t10431s0§:
                  §1t1557s0§(§1t10433s0§);
                  break;
               case §1t10443s0§:
                  §1t1557s0§(§1t10427s0§);
                  break;
               default:
                  §1t4448s0§(_loc1_);
            }
         }
         this.§1t3270s0§();
         if(§1t3246s0§ > 0)
         {
            --§1t3246s0§;
         }
         if(§1t4435s0§ > 0)
         {
            --§1t4435s0§;
            if(§1t4435s0§ == 0)
            {
               §1t4495s0§();
            }
         }
      }
      
      override public function §1t3269s0§(param1:int) : *
      {
         this.actionState = param1;
         switch(param1)
         {
            case §1t11141s0§:
               §1t1557s0§(§1t10259s0§);
               break;
            case §1t11143s0§:
               §1t1557s0§(§1t10425s0§);
               break;
            case §1t11142s0§:
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
               velY = -40;
               §1t1557s0§(§1t10431s0§);
               break;
            case §1t11160s0§:
               §1t1557s0§(§1t10441s0§);
               break;
            case §1t11162s0§:
               break;
            case §1t11189s0§:
               §1t4435s0§ = 24 * 15;
               §1t1557s0§(§1t10925s0§);
               break;
            case §1t11176s0§:
               §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11276s0§,§1t1555s0§(),§1t1559s0§().y,0,0,0,0,this);
               if(§1t1559s0§().y < §1t1525s0§.§1t4467s0§() - 100)
               {
                  if(§1t1559s0§().§1t6283s0§())
                  {
                     §1t4468s0§(100);
                  }
                  else
                  {
                     §1t4468s0§(-100);
                  }
                  §1t1559s0§().y = §1t1525s0§.§1t4467s0§();
                  this.§1t3269s0§(§1t11146s0§);
                  §1t1712s0§.§1t11332s0§(§1t1555s0§(),§1t1559s0§().y);
               }
               else
               {
                  §1t1559s0§().y = §1t1525s0§.§1t4467s0§();
                  if(§1t1559s0§().§1t6283s0§())
                  {
                     §1t4468s0§(400);
                  }
                  else
                  {
                     §1t4468s0§(-400);
                  }
                  this.§1t3269s0§(§1t11146s0§);
                  §1t1712s0§.§1t11332s0§(§1t1555s0§(),§1t1559s0§().y);
               }
         }
      }
      
      override internal function §1t3270s0§() : *
      {
         var _loc1_:int = 0;
         switch(actionState)
         {
            case §1t11141s0§:
               break;
            case §1t11142s0§:
               if(!movement(runSpeed))
               {
                  velX = 0;
                  if(§1t4406s0§)
                  {
                     this.§1t3269s0§(§1t11149s0§);
                  }
                  else
                  {
                     this.§1t3269s0§(§1t11141s0§);
                  }
               }
               break;
            case §1t11143s0§:
               if(!movement(§1t3243s0§))
               {
                  velX = 0;
                  if(§1t4406s0§)
                  {
                     this.§1t3269s0§(§1t11149s0§);
                  }
                  else
                  {
                     this.§1t3269s0§(§1t11141s0§);
                  }
               }
               break;
            case §1t11151s0§:
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
                  _loc1_ = Math.random() * 3;
                  if(_loc1_ == 0)
                  {
                     this.§1t4923s0§();
                  }
                  else if(_loc1_ == 1)
                  {
                     this.§1t4537s0§();
                  }
                  else
                  {
                     this.§1t4922s0§();
                  }
               }
               if(mcs.y >= §1t1525s0§.§1t4467s0§())
               {
                  mcs.y = §1t1525s0§.§1t4467s0§();
                  this.§1t3269s0§(§1t11146s0§);
               }
               break;
            case §1t11162s0§:
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
         var _loc1_:int = §1t1712s0§.§1t11272s0§;
         var _loc2_:int = damage;
         var _loc3_:int = Math.random() * 6;
         if(_loc3_ == 0)
         {
            _loc1_ = §1t1712s0§.§1t11285s0§;
            _loc2_ = §1t1235s0§;
         }
         else if(_loc3_ == 1)
         {
            _loc1_ = §1t1712s0§.§1t11286s0§;
            _loc2_ = §1t1237s0§;
         }
         else if(_loc3_ == 2)
         {
            _loc1_ = §1t1712s0§.§1t11287s0§;
            _loc2_ = §1t1236s0§;
         }
         else if(_loc3_ == 3)
         {
            _loc1_ = §1t1712s0§.§1t11288s0§;
            _loc2_ = §1t1238s0§;
         }
         §1t3304s0§();
         this.§1t4538s0§(60,_loc1_,_loc2_);
      }
      
      internal function §1t4537s0§() : *
      {
         var _loc1_:int = §1t1712s0§.§1t11272s0§;
         var _loc2_:int = damage;
         var _loc3_:int = Math.random() * 6;
         if(_loc3_ == 0)
         {
            _loc1_ = §1t1712s0§.§1t11285s0§;
            _loc2_ = §1t1235s0§;
         }
         else if(_loc3_ == 1)
         {
            _loc1_ = §1t1712s0§.§1t11286s0§;
            _loc2_ = §1t1237s0§;
         }
         else if(_loc3_ == 2)
         {
            _loc1_ = §1t1712s0§.§1t11287s0§;
            _loc2_ = §1t1236s0§;
         }
         else if(_loc3_ == 3)
         {
            _loc1_ = §1t1712s0§.§1t11288s0§;
            _loc2_ = §1t1238s0§;
         }
         this.§1t4538s0§(-100,_loc1_,_loc2_);
         this.§1t4538s0§(0,_loc1_,_loc2_);
         this.§1t4538s0§(100,_loc1_,_loc2_);
      }
      
      internal function §1t4922s0§() : *
      {
         var _loc1_:int = §1t1712s0§.§1t11272s0§;
         var _loc2_:int = damage;
         var _loc3_:int = Math.random() * 6;
         if(_loc3_ == 0)
         {
            _loc1_ = §1t1712s0§.§1t11285s0§;
            _loc2_ = §1t1235s0§;
         }
         else if(_loc3_ == 1)
         {
            _loc1_ = §1t1712s0§.§1t11286s0§;
            _loc2_ = §1t1237s0§;
         }
         else if(_loc3_ == 2)
         {
            _loc1_ = §1t1712s0§.§1t11287s0§;
            _loc2_ = §1t1236s0§;
         }
         else if(_loc3_ == 3)
         {
            _loc1_ = §1t1712s0§.§1t11288s0§;
            _loc2_ = §1t1238s0§;
         }
         this.§1t4538s0§(-200,_loc1_,_loc2_);
         this.§1t4538s0§(-100,_loc1_,_loc2_);
         this.§1t4538s0§(0,_loc1_,_loc2_);
         this.§1t4538s0§(100,_loc1_,_loc2_);
         this.§1t4538s0§(200,_loc1_,_loc2_);
      }
      
      internal function §1t4923s0§() : *
      {
         var _loc8_:int = 0;
         var _loc1_:Number = 0 * 0.01746;
         var _loc2_:Number = 30 * 0.01746;
         var _loc3_:int = 7;
         var _loc4_:int = 10;
         var _loc5_:Number = _loc4_ * Math.cos(_loc1_);
         var _loc6_:Number = _loc4_ * Math.sin(_loc1_);
         var _loc7_:int = 3;
         _loc8_ = §1t1712s0§.§1t11272s0§;
         var _loc9_:int = damage;
         var _loc10_:int = Math.random() * 6;
         if(_loc10_ == 0)
         {
            _loc8_ = §1t1712s0§.§1t11285s0§;
            _loc9_ = §1t1235s0§;
         }
         else if(_loc10_ == 1)
         {
            _loc8_ = §1t1712s0§.§1t11286s0§;
            _loc9_ = §1t1237s0§;
         }
         else if(_loc10_ == 2)
         {
            _loc8_ = §1t1712s0§.§1t11287s0§;
            _loc9_ = §1t1236s0§;
         }
         else if(_loc10_ == 3)
         {
            _loc8_ = §1t1712s0§.§1t11288s0§;
            _loc9_ = §1t1238s0§;
         }
         var _loc11_:int = 0;
         while(_loc11_ < _loc3_)
         {
            §1t1712s0§.§1t4568s0§(_loc8_,mcs.x + §1t1525s0§.§1t8131s0§(),mcs.y,_loc4_ * Math.cos(_loc1_ + _loc2_ * _loc11_),_loc4_ * Math.sin(_loc1_ + _loc2_ * _loc11_),_loc9_,_loc7_,null);
            _loc11_++;
         }
      }
      
      internal function §1t4538s0§(param1:int, param2:int, param3:int) : *
      {
         var _loc4_:int = mcs.x;
         var _loc5_:int = mcs.y - 60;
         var _loc6_:int = target.mcs.x;
         var _loc7_:int = target.mcs.y - param1;
         var _loc8_:int = _loc6_ - _loc4_;
         var _loc9_:int = _loc7_ - _loc5_;
         var _loc10_:int = Math.sqrt(_loc8_ * _loc8_ + _loc9_ * _loc9_);
         if(_loc10_ == 0)
         {
            _loc10_ = 1;
         }
         var _loc11_:int = _loc8_ * 20 / _loc10_;
         var _loc12_:int = _loc9_ * 20 / _loc10_;
         §1t1712s0§.§1t4568s0§(param2,_loc4_ + §1t1525s0§.§1t8131s0§(),_loc5_,_loc11_,_loc12_,param3,3,this);
      }
   }
}

