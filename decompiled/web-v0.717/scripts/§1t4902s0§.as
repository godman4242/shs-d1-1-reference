package
{
   public class §1t4902s0§ extends §1t4573s0§
   {
      
      public function §1t4902s0§(param1:§1t75s0§ = null)
      {
         super();
         if(param1 == null)
         {
            this.mcs = new §1t8322s0§();
         }
         else
         {
            this.mcs = param1;
         }
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
         if(mcs.y == §1t1525s0§.§1t4467s0§())
         {
            §1t3269s0§(§1t11143s0§);
         }
         else
         {
            §1t3269s0§(§1t11145s0§);
         }
         reward = param1.§1t992s0§();
      }
      
      override internal function §1t3270s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:String = null;
         switch(actionState)
         {
            case §1t11141s0§:
               --§1t4514s0§;
               if(§1t4514s0§ <= 0)
               {
                  §1t4514s0§ = 12;
                  §1t3304s0§();
                  if(int(Math.random() * 3) < 2)
                  {
                     §1t3269s0§(§1t11143s0§);
                     mcs.§1t6288s0§("");
                  }
                  if(§1t1540s0§.§1t9550s0§() && int(Math.random() * 5) == 0)
                  {
                     _loc1_ = Math.random() * 9;
                     if(_loc1_ == 0)
                     {
                        _loc3_ = "Gering-ding-ding-ding-dingeringeding!";
                     }
                     else if(_loc1_ == 1)
                     {
                        _loc3_ = "Wa-pa-pa-pa-pa-pa-pow!";
                     }
                     else if(_loc1_ == 2)
                     {
                        _loc3_ = "Hatee-hatee-hatee-ho!";
                     }
                     else if(_loc1_ == 3)
                     {
                        _loc3_ = "Joff-tchoff-tchoffo-tchoffo-tchoff!";
                     }
                     else if(_loc1_ == 4)
                     {
                        _loc3_ = "Jacha-chacha-chacha-chow!";
                     }
                     else if(_loc1_ == 5)
                     {
                        _loc3_ = "Fraka-kaka-kaka-kaka-kow!";
                     }
                     else if(_loc1_ == 6)
                     {
                        _loc3_ = "A-hee-ahee ha-hee!";
                     }
                     else if(_loc1_ == 7)
                     {
                        _loc3_ = "A-oo-oo-oo-ooo!";
                     }
                     else if(_loc1_ == 8)
                     {
                        _loc3_ = ".... --- .-. ... .";
                     }
                     mcs.§1t6288s0§(_loc3_);
                  }
               }
               this.§1t4530s0§();
               break;
            case §1t11143s0§:
               §1t1553s0§(§1t3243s0§);
               if(Math.abs(§1t4408s0§ - posX) < 10)
               {
                  _loc1_ = Math.random() * 2;
                  if(_loc1_ == 0)
                  {
                     §1t3269s0§(§1t11141s0§);
                  }
                  else
                  {
                     §1t3269s0§(§1t11143s0§);
                  }
               }
               this.§1t4530s0§();
               if(!§1t1540s0§.§1t9550s0§())
               {
                  _loc2_ = Math.abs(mcs.x - target.mcs.x);
                  if(_loc2_ < 100 && _loc2_ > 50)
                  {
                     §1t3269s0§(§1t11151s0§);
                  }
                  else if(_loc2_ >= 100 && _loc2_ < 250 && int(Math.random() * 3) == 0)
                  {
                     §1t3269s0§(§1t11155s0§);
                  }
               }
               break;
            case §1t11142s0§:
               §1t1553s0§(§1t3243s0§);
               if(Math.abs(§1t4408s0§ - posX) < 10)
               {
                  _loc1_ = Math.random() * 3;
                  if(_loc1_ == 0)
                  {
                     §1t3269s0§(§1t11141s0§);
                  }
                  else if(_loc1_ == 1)
                  {
                     §1t3269s0§(§1t11143s0§);
                  }
                  else
                  {
                     §1t4408s0§ = Math.random() * §1t1525s0§.§1t8124s0§();
                     §1t3269s0§(§1t11142s0§);
                  }
                  if(§1t1540s0§.§1t9550s0§() && (posX <= -50 || posX > §1t1525s0§.§1t8124s0§() + 50))
                  {
                     §1t3269s0§(§1t11154s0§);
                     §1t1557s0§(§1t10625s0§);
                  }
               }
               if(!§1t1540s0§.§1t9550s0§())
               {
                  _loc2_ = Math.abs(mcs.x - target.mcs.x);
                  if(_loc2_ < 100 && _loc2_ > 50)
                  {
                     §1t3269s0§(§1t11151s0§);
                  }
                  else if(_loc2_ >= 100 && _loc2_ < 250 && int(Math.random() * 3) == 0)
                  {
                     §1t3269s0§(§1t11155s0§);
                  }
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
               §1t3288s0§();
               break;
            case §1t11152s0§:
               --§1t4514s0§;
               if(§1t4514s0§ <= 0)
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
                  §1t3269s0§(§1t11146s0§);
               }
               break;
            case §1t11146s0§:
               break;
            case §1t11153s0§:
               §1t3300s0§();
         }
      }
      
      internal function §1t4530s0§() : *
      {
         var _loc1_:int = target.mcs.x;
         if(_loc1_ < mcs.x && !mcs.§1t6283s0§())
         {
            if(mcs.x - _loc1_ < 200)
            {
               §1t4408s0§ = §1t1525s0§.§1t8124s0§() + 100;
               §1t3269s0§(§1t11142s0§);
               mcs.§1t6288s0§("");
            }
         }
         else if(_loc1_ > mcs.x && mcs.§1t6283s0§())
         {
            if(_loc1_ - mcs.x < 200)
            {
               §1t4408s0§ = -100;
               §1t3269s0§(§1t11142s0§);
               mcs.§1t6288s0§("");
            }
         }
      }
   }
}

