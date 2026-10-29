package
{
   public class §1t4561s0§ extends §1t68s0§
   {
      
      internal var §1t4408s0§:int;
      
      internal var §1t4514s0§:int;
      
      internal var §1t4519s0§:Boolean = false;
      
      internal var §1t4562s0§:Boolean = false;
      
      public function §1t4561s0§(param1:§1t75s0§ = null, param2:Boolean = false)
      {
         super();
         if(param1 == null)
         {
            this.mcs = new §1t8564s0§();
         }
         else
         {
            this.mcs = param1;
         }
         this.§1t4519s0§ = param2;
         §1t3261s0§ = true;
         §1t3262s0§ = true;
         §1t3263s0§ = true;
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
         this.§1t3269s0§(§1t11141s0§);
         reward = param1.§1t992s0§();
         if(!§1t1540s0§.§1t9550s0§())
         {
            this.§1t4519s0§ = true;
         }
         mcs.y = §1t1525s0§.§1t4467s0§();
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
               case §1t10587s0§:
                  §1t3299s0§();
                  break;
               case §1t10579s0§:
               case §1t10589s0§:
                  this.§1t3269s0§(§1t11141s0§);
                  break;
               case §1t10585s0§:
                  this.§1t4408s0§ = Math.random() * §1t1525s0§.§1t8124s0§();
                  this.§1t3269s0§(§1t11142s0§);
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
         var _loc2_:int = 0;
         this.actionState = param1;
         switch(param1)
         {
            case §1t11141s0§:
               if(posX < 0 || posX > §1t1525s0§.§1t8124s0§())
               {
                  this.§1t3269s0§(§1t11143s0§);
                  return;
               }
               _loc2_ = Math.random() * 3;
               if(_loc2_ == 0)
               {
                  §1t1557s0§(§1t10577s0§);
               }
               else if(_loc2_ == 1)
               {
                  §1t1557s0§(§1t10579s0§);
               }
               else if(_loc2_ == 2)
               {
                  §1t1557s0§(§1t10589s0§);
               }
               this.§1t4514s0§ = 48;
               break;
            case §1t11143s0§:
               §1t1557s0§(§1t10581s0§);
               this.§1t4408s0§ = Math.random() * §1t1525s0§.§1t8124s0§();
               if(this.§1t4408s0§ < posX)
               {
                  §1t3243s0§ = -3;
                  mcs.§1t5492s0§();
               }
               else
               {
                  §1t3243s0§ = 3;
                  mcs.§1t5493s0§();
               }
               break;
            case §1t11142s0§:
               §1t1557s0§(§1t10583s0§);
               if(this.§1t4408s0§ < posX)
               {
                  §1t3243s0§ = -10;
                  mcs.§1t5492s0§();
               }
               else
               {
                  §1t3243s0§ = 10;
                  mcs.§1t5493s0§();
               }
               this.§1t4562s0§ = int(Math.random() * 4) == 0;
               break;
            case §1t11151s0§:
               if(mcs.x < target.mcs.x)
               {
                  mcs.§1t5493s0§();
               }
               else
               {
                  mcs.§1t5492s0§();
               }
               §1t1557s0§(§1t10585s0§);
               break;
            case §1t11153s0§:
               break;
            case §1t11147s0§:
               §1t1557s0§(§1t10591s0§);
         }
      }
      
      override internal function §1t3270s0§() : *
      {
         switch(actionState)
         {
            case §1t11141s0§:
               --this.§1t4514s0§;
               if(this.§1t4514s0§ <= 0)
               {
                  this.§1t4514s0§ = 24;
                  if(!§1t126s0§.§1t9190s0§().§1t1700s0§() && int(Math.random() * 3) == 1)
                  {
                     this.§1t3269s0§(§1t11143s0§);
                  }
               }
               this.§1t4530s0§();
               break;
            case §1t11143s0§:
               §1t1553s0§(§1t3243s0§);
               if(Math.abs(this.§1t4408s0§ - posX) < 10)
               {
                  if(int(Math.random() * 2) == 0)
                  {
                     this.§1t3269s0§(§1t11141s0§);
                  }
                  else
                  {
                     this.§1t3269s0§(§1t11143s0§);
                  }
               }
               this.§1t4530s0§();
               break;
            case §1t11142s0§:
               §1t1553s0§(§1t3243s0§);
               if(!target.§1t3293s0§())
               {
                  if(this.§1t4562s0§)
                  {
                     target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12393s0§],new §1t67s0§(damage,level,§1t67s0§.§1t9118s0§));
                  }
                  else
                  {
                     target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12393s0§],new §1t67s0§(damage,level));
                  }
               }
               if((this.§1t4519s0§ || !§1t1540s0§.§1t9550s0§()) && Math.abs(mcs.x - target.mcs.x) < 50)
               {
                  this.§1t3269s0§(§1t11151s0§);
               }
               else if(Math.abs(this.§1t4408s0§ - posX) < 10)
               {
                  if(§1t1540s0§.§1t9550s0§() && int(Math.random() * 2) == 0)
                  {
                     this.§1t3269s0§(§1t11141s0§);
                  }
                  else
                  {
                     this.§1t3269s0§(§1t11143s0§);
                  }
                  if(§1t1540s0§.§1t9550s0§() && (posX <= -50 || posX > §1t1525s0§.§1t8124s0§() + 50))
                  {
                     this.§1t3269s0§(§1t11154s0§);
                     §1t1557s0§(§1t10577s0§);
                  }
               }
               break;
            case §1t11151s0§:
               break;
            case §1t11147s0§:
               this.§1t3288s0§();
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
      
      internal function §1t4530s0§() : *
      {
         var _loc1_:int = target.mcs.x;
         if(_loc1_ < mcs.x && !mcs.§1t6283s0§())
         {
            if(!this.§1t4519s0§ && mcs.x - _loc1_ < 200)
            {
               this.§1t4408s0§ = §1t1525s0§.§1t8124s0§() + 100;
               this.§1t3269s0§(§1t11142s0§);
            }
            else if(this.§1t4519s0§ && mcs.x - _loc1_ < 400)
            {
               this.§1t4408s0§ = -100;
               this.§1t3269s0§(§1t11142s0§);
            }
         }
         else if(_loc1_ > mcs.x && mcs.§1t6283s0§())
         {
            if(!this.§1t4519s0§ && _loc1_ - mcs.x < 200)
            {
               this.§1t4408s0§ = -100;
               this.§1t3269s0§(§1t11142s0§);
            }
            else if(this.§1t4519s0§ && _loc1_ - mcs.x < 400)
            {
               this.§1t4408s0§ = §1t1525s0§.§1t8124s0§() + 100;
               this.§1t3269s0§(§1t11142s0§);
            }
         }
      }
      
      override public function §1t3298s0§() : *
      {
         if(actionState == §1t11147s0§)
         {
            §1t3258s0§ = true;
            return;
         }
         §1t3294s0§();
         §1t3295s0§();
         mcs.y = §1t1525s0§.§1t4467s0§();
         actionState = §1t11153s0§;
         §1t1557s0§(§1t10587s0§);
         §1t3258s0§ = true;
         mcs.§1t6280s0§();
      }
      
      override internal function §1t3280s0§() : *
      {
         if(actionState == §1t11152s0§ || actionState == §1t11153s0§)
         {
            return;
         }
         if(actionState == §1t11147s0§ || actionState == §1t11145s0§ || actionState == §1t11144s0§)
         {
            velY = -20;
            if(§1t1559s0§().§1t6283s0§())
            {
               mcs.§1t5492s0§();
            }
            else
            {
               §1t1559s0§().§1t5493s0§();
            }
            this.§1t3269s0§(§1t11147s0§);
         }
         else
         {
            this.§1t3269s0§(§1t11147s0§);
            velY = -25;
         }
         if(§1t1559s0§().§1t6283s0§())
         {
            velX = -3;
         }
         else
         {
            velX = 3;
         }
      }
      
      override internal function §1t3288s0§() : *
      {
         mcs.y += velY;
         §1t1553s0§(velX);
         velY += 3;
         var _loc1_:int = §1t1525s0§.§1t4467s0§();
         if(mcs.y >= _loc1_)
         {
            mcs.y = _loc1_;
            if(§1t3258s0§)
            {
               actionState = §1t11153s0§;
               this.§1t3298s0§();
            }
            else
            {
               this.§1t3269s0§(§1t11143s0§);
            }
         }
         else if(velX < 0 && §1t1555s0§() < 20 || velX > 0 && §1t1555s0§() > §1t1525s0§.§1t8124s0§() - 20)
         {
            this.§1t3280s0§();
            velX *= 2;
         }
      }
      
      override internal function §1t3281s0§() : *
      {
         this.§1t3280s0§();
      }
      
      override internal function §1t3282s0§(param1:int, param2:int) : *
      {
         this.§1t3280s0§();
      }
   }
}

