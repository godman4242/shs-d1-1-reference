package
{
   public class §1t4542s0§ extends §1t68s0§
   {
      
      internal var §1t4408s0§:int;
      
      public function §1t4542s0§(param1:§1t75s0§ = null)
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
            target = §1t1543s0§.§1t10231s0§(§1t1555s0§(),!§1t3255s0§);
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
               case §1t10451s0§:
                  this.§1t4408s0§ = Math.random() * §1t1525s0§.§1t8124s0§();
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
               case §1t10521s0§:
                  §1t1557s0§(§1t10523s0§);
                  break;
               case §1t10523s0§:
                  this.§1t3269s0§(§1t11156s0§);
                  break;
               case §1t10525s0§:
                  this.§1t3269s0§(§1t11157s0§);
                  break;
               case §1t10515s0§:
                  target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12380s0§],new §1t67s0§(damage,level));
                  this.§1t3269s0§(§1t11143s0§);
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
               mcs.§1t1557s0§(§1t10527s0§);
               break;
            case §1t11143s0§:
               this.§1t4408s0§ = 20 + Math.random() * (§1t1525s0§.§1t8124s0§() - 40);
               §1t3243s0§ = Math.random() * 2 + 5;
               §1t1557s0§(§1t10513s0§);
               break;
            case §1t11156s0§:
               §1t1557s0§(§1t10523s0§);
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
            case §1t11157s0§:
               if(target.mcs.x < mcs.x)
               {
                  mcs.§1t5492s0§();
               }
               else
               {
                  mcs.§1t5493s0§();
               }
               §1t1557s0§(§1t10521s0§);
               break;
            case §1t11151s0§:
               §1t1557s0§(§1t10515s0§);
         }
      }
      
      override internal function §1t3270s0§() : *
      {
         var _loc1_:* = target.mcs.x;
         switch(actionState)
         {
            case §1t11141s0§:
               this.§1t3269s0§(§1t11143s0§);
               break;
            case §1t11143s0§:
               if(Math.abs(this.§1t4408s0§ - posX) < 10)
               {
                  this.§1t3269s0§(§1t11157s0§);
                  return;
               }
               if(this.§1t4408s0§ > posX)
               {
                  mcs.§1t5493s0§();
                  §1t1553s0§(§1t3243s0§);
               }
               else
               {
                  mcs.§1t5492s0§();
                  §1t1553s0§(-§1t3243s0§);
               }
               if(Math.abs(target.mcs.x - mcs.x) < 100)
               {
                  this.§1t3269s0§(§1t11151s0§);
               }
               else if(posX > 20 && posX < §1t1525s0§.§1t8124s0§() - 20 && int(Math.random() * 10) == 0)
               {
                  this.§1t3269s0§(§1t11157s0§);
               }
               break;
            case §1t11156s0§:
               if(§1t3271s0§())
               {
                  target = §1t1543s0§.§1t10231s0§(§1t1555s0§(),!§1t3255s0§);
                  if(target == null)
                  {
                     return;
                  }
                  if(Math.abs(target.mcs.x - mcs.x) < 100)
                  {
                     this.§1t3269s0§(§1t11151s0§);
                  }
                  else
                  {
                     if(mcs.x < target.mcs.x)
                     {
                        mcs.§1t5493s0§();
                     }
                     else
                     {
                        mcs.§1t5492s0§();
                     }
                     if(§1t3255s0§)
                     {
                        this.§1t4543s0§();
                     }
                     else if(int(Math.random() * 2) == 0)
                     {
                        this.§1t4543s0§();
                     }
                  }
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
         }
      }
      
      internal function §1t4543s0§() : *
      {
         var _loc1_:Boolean = false;
         if(level > 50)
         {
            _loc1_ = int(Math.random() * 2) > 0;
         }
         else if(level > 20)
         {
            _loc1_ = int(Math.random() * 3) == 0;
         }
         else if(level > 10)
         {
            _loc1_ = int(Math.random() * 4) == 0;
         }
         var _loc2_:int = mcs.x;
         var _loc3_:int = mcs.y - 60;
         var _loc4_:int = target.mcs.x;
         var _loc5_:int = target.mcs.y - 60;
         var _loc6_:Number = §1t128s0§.§1t12543s0§;
         if(_loc1_)
         {
            _loc6_ = 1.5;
         }
         var _loc7_:Number = _loc6_ * Math.abs(_loc4_ - _loc2_) / 0.866;
         _loc7_ = Math.sqrt(_loc7_);
         var _loc8_:Number = _loc7_ * 0.866;
         var _loc9_:Number = Math.abs(_loc4_ - _loc2_) / _loc8_;
         var _loc10_:Number = (_loc5_ - _loc3_ - 0.5 * _loc6_ * _loc9_ * _loc9_) / _loc9_;
         if(_loc2_ > _loc4_)
         {
            _loc8_ = -_loc8_;
         }
         _loc10_ += Math.random() * 8 - 4;
         §1t1712s0§.§1t11327s0§(_loc2_,_loc3_,_loc8_,_loc10_,damage,_loc1_,this);
         §1t1557s0§(§1t10525s0§);
      }
      
      override public function §1t3298s0§() : *
      {
         super.§1t3298s0§();
         mcs.§1t6266s0§(13000);
      }
   }
}

