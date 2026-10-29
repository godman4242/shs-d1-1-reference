package
{
   public class §1t4914s0§ extends §1t4909s0§
   {
      
      internal static var §1t12328s0§:* = §1t11205s0§;
      
      internal static var §1t12329s0§:* = §1t11206s0§;
      
      internal static var §1t12330s0§:* = §1t11207s0§;
      
      internal static var §1t12331s0§:* = §1t11208s0§;
      
      internal static var §1t12332s0§:* = §1t11209s0§;
      
      public function §1t4914s0§(param1:§1t75s0§ = null)
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
         §1t3261s0§ = false;
         §1t3262s0§ = false;
         §1t3263s0§ = false;
         §1t3264s0§ = false;
         §1t3265s0§ = false;
         runSpeed = 15;
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
               case §1t10823s0§:
                  this.§1t4915s0§();
                  §1t1557s0§(§1t10825s0§);
                  break;
               case §1t10825s0§:
                  actionState = §1t11141s0§;
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
               §1t1557s0§(§1t10269s0§);
               break;
            case §1t11142s0§:
               §1t1557s0§(§1t10271s0§);
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
            case §1t11162s0§:
               break;
            case §1t12328s0§:
            case §1t12329s0§:
            case §1t12330s0§:
            case §1t12331s0§:
            case §1t12332s0§:
               §1t1557s0§(§1t10823s0§);
         }
      }
      
      override internal function §1t3270s0§() : *
      {
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
            case §1t11162s0§:
         }
      }
      
      internal function §1t4915s0§() : *
      {
         if(actionState == §1t12328s0§)
         {
            this.§1t4916s0§();
         }
         else if(actionState == §1t12329s0§)
         {
            this.§1t4917s0§();
         }
         else if(actionState == §1t12330s0§)
         {
            this.§1t4918s0§();
         }
         else if(actionState == §1t12331s0§)
         {
            this.§1t4919s0§();
         }
         else if(actionState == §1t12332s0§)
         {
            this.§1t4920s0§();
         }
      }
      
      internal function §1t4916s0§() : *
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc1_:int = 12;
         var _loc2_:int = 12;
         if(§1t1559s0§().§1t6283s0§())
         {
            _loc3_ = §1t1555s0§() + 25;
            _loc4_ = 100;
         }
         else
         {
            _loc3_ = §1t1555s0§() - 25;
            _loc4_ = -100;
         }
         var _loc7_:int = 0;
         while(_loc7_ < 5)
         {
            _loc5_ = _loc3_ + _loc7_ * _loc4_;
            _loc6_ = _loc1_ + _loc7_ * _loc2_;
            §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11319s0§,_loc5_,§1t1559s0§().y,0,0,500,_loc6_,this);
            _loc7_++;
         }
      }
      
      internal function §1t4917s0§() : *
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc1_:int = 24;
         var _loc2_:int = 12;
         var _loc3_:int = 100;
         var _loc4_:int = 100;
         var _loc7_:int = §1t1525s0§.§1t8124s0§() / 100 - 3;
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_)
         {
            _loc5_ = _loc3_ + _loc8_ * _loc4_;
            _loc6_ = _loc1_ + _loc8_ * _loc2_;
            §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11319s0§,_loc5_,§1t1559s0§().y,0,0,500,_loc6_,this);
            _loc8_++;
         }
      }
      
      internal function §1t4918s0§() : *
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc1_:int = 24;
         var _loc2_:int = 12;
         var _loc3_:int = §1t1525s0§.§1t8124s0§() - 100;
         var _loc4_:int = -100;
         var _loc7_:int = §1t1525s0§.§1t8124s0§() / 100 - 3;
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_)
         {
            _loc5_ = _loc3_ + _loc8_ * _loc4_;
            _loc6_ = _loc1_ + _loc8_ * _loc2_;
            §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11319s0§,_loc5_,§1t1559s0§().y,0,0,500,_loc6_,this);
            _loc8_++;
         }
      }
      
      internal function §1t4919s0§() : *
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc1_:int = 5 * 24;
         var _loc2_:int = 0;
         var _loc3_:int = 100;
         var _loc4_:int = 100;
         var _loc7_:int = §1t1525s0§.§1t8124s0§() / 100 - 1;
         var _loc8_:int = _loc7_ / 2;
         var _loc9_:int = 0;
         while(_loc9_ < _loc7_)
         {
            if(_loc9_ != _loc8_ && _loc9_ != _loc8_ + 1)
            {
               _loc5_ = _loc3_ + _loc9_ * _loc4_;
               _loc6_ = _loc1_ + _loc9_ * _loc2_;
               §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11319s0§,_loc5_,§1t1559s0§().y,0,0,500,_loc6_,this);
            }
            _loc9_++;
         }
      }
      
      internal function §1t4920s0§() : *
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc1_:int = 2 * 24;
         var _loc2_:int = 0;
         var _loc3_:int = 250;
         var _loc4_:int = 250;
         var _loc7_:int = §1t1525s0§.§1t8124s0§() / 250 - 1;
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_)
         {
            _loc5_ = _loc3_ + _loc8_ * _loc4_;
            _loc6_ = _loc1_ + _loc8_ * _loc2_;
            §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11319s0§,_loc5_,§1t1559s0§().y,0,0,500,_loc6_,this);
            _loc8_++;
         }
      }
   }
}

