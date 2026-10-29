package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class §1t4539s0§ extends §1t68s0§
   {
      
      internal var §1t4408s0§:int;
      
      public function §1t4539s0§(param1:§1t75s0§ = null)
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
         this.mcs.§1t5659s0§.y = -80;
         this.mcs.displayName.y = -80;
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
               case §1t10413s0§:
               case §1t10411s0§:
               case §1t10417s0§:
               case §1t10419s0§:
               case §1t10759s0§:
                  §1t3299s0§();
                  break;
               case §1t10451s0§:
               case §1t10761s0§:
               case §1t10315s0§:
               case §1t10781s0§:
               case §1t10775s0§:
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
               case §1t10313s0§:
                  if(target.§1t3292s0§())
                  {
                     target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12380s0§],new §1t67s0§(damage * 2,level));
                  }
                  §1t1557s0§(§1t10315s0§);
                  break;
               case §1t10753s0§:
                  §1t1557s0§(§1t10751s0§);
                  break;
               case §1t10763s0§:
                  §1t1557s0§(§1t10765s0§);
                  break;
               case §1t10765s0§:
                  §1t1557s0§(§1t10767s0§);
                  break;
               case §1t10767s0§:
                  target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12395s0§],new §1t67s0§(damage,level));
                  this.§1t4408s0§ = Math.random() * §1t1525s0§.§1t8124s0§();
                  if(actionState != §1t11142s0§)
                  {
                     this.§1t3269s0§(§1t11142s0§);
                  }
                  break;
               case §1t10769s0§:
                  this.§1t4408s0§ = Math.random() * §1t1525s0§.§1t8124s0§();
                  if(actionState != §1t11142s0§)
                  {
                     this.§1t3269s0§(§1t11142s0§);
                  }
                  §1t3245s0§ = 48;
                  break;
               case §1t10777s0§:
                  §1t1557s0§(§1t10779s0§);
                  break;
               case §1t10771s0§:
                  §1t1557s0§(§1t10773s0§);
                  break;
               case §1t10773s0§:
                  §1t1557s0§(§1t10775s0§);
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
               §1t1557s0§(§1t10751s0§);
               break;
            case §1t11143s0§:
               §1t3243s0§ = Math.random() * 2 + 4;
               §1t1557s0§(§1t10755s0§);
               break;
            case §1t11142s0§:
               §1t1557s0§(§1t10757s0§);
               §1t3243s0§ = 10;
               break;
            case §1t11151s0§:
               §1t1557s0§(§1t10761s0§);
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
               §1t1557s0§(§1t10313s0§);
               break;
            case §1t11155s0§:
               §1t1557s0§(§1t10763s0§);
               break;
            case §1t11158s0§:
               §1t1557s0§(§1t10769s0§);
               this.§1t4540s0§();
               break;
            case §1t11144s0§:
               §1t1557s0§(§1t10777s0§);
               velY = -30 - Math.random() * 5;
               break;
            case §1t11171s0§:
               §1t1557s0§(§1t10771s0§);
         }
      }
      
      override internal function §1t3270s0§() : *
      {
         if(§1t3271s0§())
         {
            this.§1t4501s0§();
         }
         switch(actionState)
         {
            case §1t11141s0§:
               this.§1t3269s0§(§1t11143s0§);
               break;
            case §1t11143s0§:
            case §1t11142s0§:
               if(this.§1t4408s0§ < posX)
               {
                  mcs.§1t5492s0§();
                  if(posX - this.§1t4408s0§ < §1t3243s0§)
                  {
                     this.§1t4501s0§();
                  }
                  else
                  {
                     §1t1553s0§(-§1t3243s0§);
                  }
               }
               else
               {
                  mcs.§1t5493s0§();
                  if(this.§1t4408s0§ - posX < §1t3243s0§)
                  {
                     this.§1t4501s0§();
                  }
                  else
                  {
                     §1t1553s0§(§1t3243s0§);
                  }
               }
               break;
            case §1t11151s0§:
               target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12395s0§],new §1t67s0§(damage,level));
               break;
            case §1t11173s0§:
               §1t3289s0§();
               break;
            case §1t11174s0§:
               §1t3287s0§();
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
            case §1t11155s0§:
               if(mcs.§1t1558s0§() == §1t10765s0§)
               {
                  if(mcs.§1t6283s0§())
                  {
                     §1t1553s0§(20);
                  }
                  else
                  {
                     §1t1553s0§(-20);
                  }
                  target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12395s0§],new §1t67s0§(damage,level));
               }
               break;
            case §1t11158s0§:
               break;
            case §1t11153s0§:
               §1t3300s0§();
               break;
            case §1t11144s0§:
               if(§1t1558s0§() == §1t10779s0§)
               {
                  mcs.y += velY;
                  velY += 4;
                  if(mcs.§1t6283s0§())
                  {
                     §1t1553s0§(8);
                  }
                  else
                  {
                     §1t1553s0§(-8);
                  }
                  if(mcs.y >= §1t1525s0§.§1t4467s0§())
                  {
                     mcs.y = §1t1525s0§.§1t4467s0§();
                     this.§1t3269s0§(§1t11146s0§);
                  }
               }
               break;
            case §1t11171s0§:
               if(§1t1558s0§() == §1t10773s0§)
               {
                  if(mcs.§1t6283s0§())
                  {
                     §1t1553s0§(-40);
                  }
                  else
                  {
                     §1t1553s0§(40);
                  }
               }
         }
      }
      
      override public function §1t3298s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         §1t88s0§.instance.§1t1507s0§();
         if(!§1t1540s0§.§1t10015s0§())
         {
            §1t3294s0§();
            §1t3295s0§();
         }
         if(actionState == §1t11147s0§)
         {
            §1t3258s0§ = true;
            return;
         }
         if(§1t3292s0§())
         {
            actionState = §1t11153s0§;
            §1t1557s0§(§1t10417s0§);
            if(!§1t1523s0§.§1t9471s0§)
            {
               §1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12392s0§),§1t1525s0§.§1t9942s0§(),90);
               §1t3248s0§.§1t2253s0§(15);
            }
            §1t3258s0§ = true;
            return;
         }
         mcs.y = §1t1525s0§.§1t4467s0§();
         actionState = §1t11153s0§;
         if(Math.random() * 2 < 1)
         {
            mcs.scaleX = -mcs.scaleX;
         }
         if(!§1t1523s0§.§1t9471s0§ && fatal)
         {
            if(§1t1071s0§)
            {
               §1t1557s0§(§1t10413s0§);
               _loc2_ = mcs.§1t6258s0§(§1t75s0§.§1t12393s0§);
               _loc1_ = Math.random() * 3;
               if(_loc1_ == 0)
               {
                  §1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12389s0§),§1t1525s0§.§1t9942s0§(),130);
               }
               else if(_loc1_ == 1)
               {
                  §1t3249s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,_loc2_,§1t1525s0§.§1t9942s0§(),180);
               }
               else
               {
                  §1t3249s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,_loc2_,§1t1525s0§.§1t9942s0§(),180);
                  §1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12389s0§),§1t1525s0§.§1t9942s0§(),130);
               }
               if(§1t3249s0§ != null)
               {
                  §1t3249s0§.§1t2251s0§(4);
                  §1t3249s0§.§1t2250s0§(10);
               }
            }
            else
            {
               _loc1_ = Math.random() * 5;
               if(_loc1_ <= 1)
               {
                  §1t1557s0§(§1t10759s0§);
                  §1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12392s0§),§1t1525s0§.§1t9942s0§(),80);
                  §1t3248s0§.§1t2253s0§(15);
               }
               else if(_loc1_ == 2)
               {
                  §1t1557s0§(§1t10409s0§);
                  §1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12392s0§),§1t1525s0§.§1t9942s0§(),80);
                  §1t3248s0§.§1t2253s0§(15);
               }
               else if(_loc1_ == 3)
               {
                  §1t1557s0§(§1t10411s0§);
                  _loc1_ = Math.random() * 3;
                  if(_loc1_ == 0)
                  {
                     §1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12389s0§),§1t1525s0§.§1t9942s0§(),60);
                  }
                  else if(_loc1_ == 1)
                  {
                     §1t3249s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12378s0§),§1t1525s0§.§1t9942s0§(),180);
                  }
                  else
                  {
                     §1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12389s0§),§1t1525s0§.§1t9942s0§(),60);
                     §1t3249s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12378s0§),§1t1525s0§.§1t9942s0§(),180);
                  }
                  if(§1t3249s0§ != null)
                  {
                     §1t3249s0§.§1t2251s0§(5);
                  }
               }
               else if(_loc1_ == 4)
               {
                  §1t1557s0§(§1t10419s0§);
                  _loc1_ = Math.random() * 3;
                  if(_loc1_ == 0)
                  {
                     §1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12390s0§),§1t1525s0§.§1t9942s0§(),180);
                  }
                  else if(_loc1_ == 1)
                  {
                     §1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12391s0§),§1t1525s0§.§1t9942s0§(),120);
                  }
                  else
                  {
                     §1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12390s0§),§1t1525s0§.§1t9942s0§(),180);
                     §1t3249s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12391s0§),§1t1525s0§.§1t9942s0§(),120);
                  }
               }
            }
         }
         else
         {
            _loc1_ = Math.random() * 3;
            if(_loc1_ <= 1)
            {
               §1t1557s0§(§1t10759s0§);
            }
            else if(_loc1_ == 2)
            {
               §1t1557s0§(§1t10409s0§);
            }
         }
         §1t3258s0§ = true;
         mcs.§1t6280s0§();
      }
      
      internal function §1t4501s0§() : *
      {
         var _loc2_:int = 0;
         if(§1t3260s0§ || §1t3258s0§ || §1t3292s0§() || §1t3293s0§() || actionState == §1t11147s0§ || actionState == §1t11144s0§ || actionState == §1t11171s0§)
         {
            return;
         }
         if(this.§1t4541s0§())
         {
            if(int(Math.random() * 2) == 0)
            {
               this.§1t3269s0§(§1t11144s0§);
            }
            else
            {
               this.§1t3269s0§(§1t11171s0§);
            }
            return;
         }
         target = §1t1543s0§.§1t10231s0§(§1t1555s0§(),true);
         var _loc1_:int = target.posX;
         if(_loc1_ < posX)
         {
            _loc2_ = posX - _loc1_;
            if(_loc2_ <= 50)
            {
               mcs.§1t5492s0§();
               if(actionState != §1t11151s0§)
               {
                  this.§1t3269s0§(§1t11151s0§);
               }
            }
            else if(_loc2_ <= 200 || int(Math.random() * 3) > 0)
            {
               mcs.§1t5492s0§();
               this.§1t4408s0§ = Math.random() * §1t1525s0§.§1t8124s0§();
               if(actionState != §1t11142s0§)
               {
                  this.§1t3269s0§(§1t11142s0§);
               }
            }
            else
            {
               mcs.§1t5492s0§();
               if(actionState != §1t11158s0§)
               {
                  this.§1t3269s0§(§1t11158s0§);
               }
            }
         }
         else
         {
            _loc2_ = _loc1_ - posX;
            if(_loc2_ <= 50)
            {
               mcs.§1t5493s0§();
               if(actionState != §1t11151s0§)
               {
                  this.§1t3269s0§(§1t11151s0§);
               }
            }
            else if(_loc2_ <= 200 || int(Math.random() * 3) > 0)
            {
               mcs.§1t5493s0§();
               this.§1t4408s0§ = Math.random() * §1t1525s0§.§1t8124s0§();
               if(actionState != §1t11142s0§)
               {
                  this.§1t3269s0§(§1t11142s0§);
               }
            }
            else
            {
               mcs.§1t5493s0§();
               if(actionState != §1t11158s0§)
               {
                  this.§1t3269s0§(§1t11158s0§);
               }
            }
         }
      }
      
      internal function §1t4540s0§() : *
      {
         var _loc1_:int = mcs.x;
         var _loc2_:int = mcs.y - 60;
         var _loc3_:int = target.§1t1559s0§().x;
         var _loc4_:int = target.§1t1559s0§().y - 60;
         var _loc5_:Number = §1t128s0§.§1t12543s0§ * Math.abs(_loc3_ - _loc1_) / 0.866;
         _loc5_ = Math.sqrt(_loc5_);
         var _loc6_:Number = _loc5_ * 0.866;
         var _loc7_:Number = Math.abs(_loc3_ - _loc1_) / _loc6_;
         var _loc8_:Number = (_loc4_ - _loc2_ - 0.5 * §1t128s0§.§1t12543s0§ * _loc7_ * _loc7_) / _loc7_;
         if(_loc1_ > _loc3_)
         {
            _loc6_ = -_loc6_;
         }
         _loc8_ += Math.random() * 8 - 4;
         §1t1712s0§.§1t11328s0§(_loc1_,_loc2_,_loc6_,_loc8_,damage,this);
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
   }
}

