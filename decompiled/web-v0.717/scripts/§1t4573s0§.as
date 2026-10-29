package
{
   import flash.display.MovieClip;
   
   public class §1t4573s0§ extends §1t68s0§
   {
      
      internal var §1t4408s0§:int;
      
      internal var §1t4514s0§:int;
      
      public function §1t4573s0§()
      {
         super();
         this.mcs = new §1t8322s0§();
         this.§1t3269s0§(§1t11141s0§);
         §1t3261s0§ = true;
         §1t3262s0§ = true;
         §1t3263s0§ = false;
         §1t3264s0§ = false;
         §1t3265s0§ = false;
      }
      
      override public function init(param1:§1t76s0§) : *
      {
         §1t1550s0§(param1.mcs);
         mcs.§1t6284s0§(1.2,1.2);
         damage = param1.attack;
         defense = param1.defense;
         §1t3257s0§ = param1.hp;
         level = param1.lvl;
         xp = level * 5 + 45;
         reset();
         if(mcs.y == §1t1525s0§.§1t4467s0§())
         {
            this.§1t3269s0§(§1t11143s0§);
         }
         else
         {
            this.§1t3269s0§(§1t11145s0§);
         }
         reward = param1.§1t992s0§();
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
               case §1t10655s0§:
                  §1t3299s0§();
                  break;
               case §1t10649s0§:
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
                     §1t1557s0§(§1t10645s0§);
                  }
                  break;
               case §1t10639s0§:
                  if(§1t3309s0§() <= 0)
                  {
                     this.§1t3298s0§();
                  }
                  else
                  {
                     this.§1t3269s0§(§1t11143s0§);
                  }
                  break;
               case §1t10651s0§:
               case §1t10641s0§:
               case §1t10653s0§:
               case §1t10651s0§:
                  this.§1t3269s0§(§1t11143s0§);
                  break;
               case §1t10633s0§:
                  if(int(Math.random() * 2) == 0)
                  {
                     §1t1557s0§(§1t10637s0§);
                  }
                  else
                  {
                     §1t1557s0§(§1t10635s0§);
                  }
                  break;
               case §1t10635s0§:
               case §1t10637s0§:
                  if(actionState != §1t11145s0§)
                  {
                     §1t1557s0§(§1t10639s0§);
                  }
                  break;
               case §1t10649s0§:
                  §1t1557s0§(§1t10645s0§);
            }
         }
         this.§1t3270s0§();
         if(§1t3246s0§ > 0)
         {
            --§1t3246s0§;
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
               if(posX < 0 || posX > §1t1525s0§.§1t8124s0§())
               {
                  this.§1t3269s0§(§1t11143s0§);
                  return;
               }
               §1t3304s0§();
               §1t1557s0§(§1t10643s0§);
               this.§1t4514s0§ = 24;
               break;
            case §1t11143s0§:
               this.§1t4408s0§ = Math.random() * §1t1525s0§.§1t8124s0§();
               §1t3304s0§();
               if(this.§1t4408s0§ < posX)
               {
                  §1t3243s0§ = -Math.random() * 2 - 4;
               }
               else
               {
                  §1t3243s0§ = Math.random() * 2 + 4;
               }
               if((target.mcs.x - mcs.x) * §1t3243s0§ < 0)
               {
                  §1t1557s0§(§1t10629s0§);
                  §1t3243s0§ /= 2;
               }
               else
               {
                  §1t1557s0§(§1t10627s0§);
               }
               break;
            case §1t11142s0§:
               §1t1557s0§(§1t10631s0§);
               if(this.§1t4408s0§ < posX)
               {
                  if(!§1t1540s0§.§1t9550s0§())
                  {
                     §1t3243s0§ = -15;
                  }
                  else
                  {
                     §1t3243s0§ = -12;
                  }
                  mcs.§1t5492s0§();
               }
               else
               {
                  if(!§1t1540s0§.§1t9550s0§())
                  {
                     §1t3243s0§ = 15;
                  }
                  else
                  {
                     §1t3243s0§ = 12;
                  }
                  mcs.§1t5493s0§();
               }
               break;
            case §1t11151s0§:
               §1t3304s0§();
               §1t1557s0§(§1t10641s0§);
               break;
            case §1t11155s0§:
               §1t3304s0§();
               §1t1557s0§(§1t10633s0§);
               break;
            case §1t11147s0§:
               §1t1557s0§(§1t10647s0§);
               break;
            case §1t11172s0§:
               param1 = §1t11152s0§;
               §1t1557s0§(§1t10649s0§);
               this.§1t4514s0§ = 6;
               break;
            case §1t11152s0§:
               §1t1557s0§(§1t10649s0§);
               this.§1t4514s0§ = 48;
               break;
            case §1t11145s0§:
               §1t1557s0§(§1t10637s0§);
               break;
            case §1t11146s0§:
               §1t1557s0§(§1t10639s0§);
               break;
            case §1t11153s0§:
         }
      }
      
      override internal function §1t3270s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         switch(actionState)
         {
            case §1t11141s0§:
               --this.§1t4514s0§;
               if(this.§1t4514s0§ <= 0)
               {
                  this.§1t4514s0§ = 12;
                  §1t3304s0§();
                  if(int(Math.random() * 3) < 2)
                  {
                     this.§1t3269s0§(§1t11143s0§);
                  }
               }
               break;
            case §1t11143s0§:
               §1t1553s0§(§1t3243s0§);
               if(Math.abs(this.§1t4408s0§ - posX) < 10)
               {
                  _loc1_ = Math.random() * 3;
                  if(_loc1_ == 0)
                  {
                     this.§1t3269s0§(§1t11141s0§);
                  }
                  else if(_loc1_ == 1)
                  {
                     this.§1t3269s0§(§1t11143s0§);
                  }
                  else
                  {
                     this.§1t4408s0§ = Math.random() * §1t1525s0§.§1t8124s0§();
                     this.§1t3269s0§(§1t11142s0§);
                  }
               }
               _loc2_ = Math.abs(mcs.x - target.mcs.x);
               if(_loc2_ < 100 && _loc2_ > 50)
               {
                  this.§1t3269s0§(§1t11151s0§);
               }
               else if(_loc2_ >= 100 && _loc2_ < 250 && int(Math.random() * 3) == 0)
               {
                  this.§1t3269s0§(§1t11155s0§);
               }
               break;
            case §1t11142s0§:
               §1t1553s0§(§1t3243s0§);
               if(Math.abs(this.§1t4408s0§ - posX) < 10)
               {
                  _loc1_ = Math.random() * 3;
                  if(_loc1_ == 0)
                  {
                     this.§1t3269s0§(§1t11141s0§);
                  }
                  else if(_loc1_ == 1)
                  {
                     this.§1t3269s0§(§1t11143s0§);
                  }
                  else
                  {
                     this.§1t4408s0§ = Math.random() * §1t1525s0§.§1t8124s0§();
                     this.§1t3269s0§(§1t11142s0§);
                  }
               }
               _loc2_ = Math.abs(mcs.x - target.mcs.x);
               if(_loc2_ < 100 && _loc2_ > 50)
               {
                  this.§1t3269s0§(§1t11151s0§);
               }
               else if(_loc2_ >= 100 && _loc2_ < 250 && int(Math.random() * 3) == 0)
               {
                  this.§1t3269s0§(§1t11155s0§);
               }
               break;
            case §1t11151s0§:
               if(!§1t1540s0§.§1t9550s0§())
               {
                  target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12380s0§],new §1t67s0§(damage,level));
               }
               break;
            case §1t11155s0§:
               if(mcs.§1t1558s0§() == §1t10635s0§ || mcs.§1t1558s0§() == §1t10637s0§)
               {
                  if(mcs.§1t6283s0§())
                  {
                     §1t1553s0§(15);
                  }
                  else
                  {
                     §1t1553s0§(-15);
                  }
                  if(!§1t1540s0§.§1t9550s0§())
                  {
                     target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12393s0§],new §1t67s0§(damage,level));
                     target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12395s0§],new §1t67s0§(damage,level));
                  }
               }
               break;
            case §1t11147s0§:
               this.§1t3288s0§();
               break;
            case §1t11152s0§:
               --this.§1t4514s0§;
               if(this.§1t4514s0§ <= 0)
               {
                  §1t1557s0§(§1t10651s0§);
               }
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
      
      override public function §1t3277s0§(param1:MovieClip, param2:§1t67s0§) : Boolean
      {
         var _loc3_:int = 0;
         var _loc7_:int = 0;
         if(§1t3246s0§ > 0)
         {
            return false;
         }
         _loc3_ = param2.damage;
         var _loc4_:int = param2.§1t1062s0§;
         var _loc5_:int = param2.§1t1063s0§;
         var _loc6_:int = param2.§1t1064s0§;
         _loc7_ = param2.§1t1065s0§;
         var _loc8_:Boolean = param2.§1t1073s0§();
         if(_loc4_ < 0)
         {
            _loc4_ = 0;
         }
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
         switch(param1)
         {
            case mcs.§1t6231s0§[§1t75s0§.§1t12393s0§]:
            case mcs.§1t6231s0§[§1t75s0§.§1t12389s0§]:
            case mcs.§1t6231s0§[§1t75s0§.§1t12380s0§]:
               _loc3_ *= 1.3;
               §1t1071s0§ = true;
               §1t3256s0§ = true;
               break;
            default:
               §1t3256s0§ = true;
         }
         _loc3_ -= defense;
         if(_loc3_ < param2.§1t1088s0§())
         {
            _loc3_ = param2.§1t1088s0§();
         }
         if(§1t3309s0§() > 0)
         {
            §1t3308s0§(§1t3309s0§() - (_loc3_ + _loc4_ + _loc6_ + _loc5_ + _loc7_));
            §1t3301s0§();
            §1t3246s0§ = 12;
            if(§1t3309s0§() > 0)
            {
               if((param2.§1t1073s0§() || actionState == §1t11147s0§ || actionState == §1t11145s0§ || actionState == §1t11144s0§) && !§1t3292s0§())
               {
                  §1t3280s0§();
               }
               else if(param2.§1t1075s0§())
               {
                  §1t3281s0§();
               }
               if(_loc3_ > 0)
               {
                  §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc3_.toString(),10027008);
               }
               if(_loc4_ > 0)
               {
                  §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc4_.toString(),16737792);
               }
               if(_loc6_ > 0)
               {
                  §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc6_.toString(),13421772);
               }
               if(_loc5_ > 0)
               {
                  §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc5_.toString(),26367);
               }
               if(_loc7_ > 0)
               {
                  §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc7_.toString(),6697728);
               }
            }
            §1t88s0§.instance.§1t1508s0§();
         }
         return true;
      }
      
      override internal function §1t3288s0§() : *
      {
         mcs.y += velY;
         §1t1553s0§(velX);
         velY += 3;
         var _loc1_:* = §1t1525s0§.§1t4467s0§();
         if(mcs.y >= _loc1_)
         {
            mcs.y = _loc1_;
            this.§1t3269s0§(§1t11152s0§);
         }
         else if(velX < 0 && §1t1555s0§() < 20 || velX > 0 && §1t1555s0§() > §1t1525s0§.§1t8124s0§() - 20)
         {
            §1t3280s0§();
            velX *= 2;
         }
      }
      
      override public function §1t3298s0§() : *
      {
         §1t88s0§.instance.§1t1507s0§();
         §1t3294s0§();
         §1t3295s0§();
         if(actionState == §1t11147s0§)
         {
            §1t3258s0§ = true;
            return;
         }
         if(§1t3292s0§())
         {
            actionState = §1t11153s0§;
            §1t1557s0§(§1t10655s0§);
            §1t3258s0§ = true;
            return;
         }
         mcs.y = §1t1525s0§.§1t4467s0§();
         actionState = §1t11153s0§;
         §1t1557s0§(§1t10655s0§);
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
         if(actionState != §1t11147s0§ && actionState != §1t11153s0§ && actionState != §1t11155s0§)
         {
            §1t3260s0§ = true;
         }
      }
   }
}

