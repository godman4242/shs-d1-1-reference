package
{
   public class §1t4529s0§ extends §1t68s0§
   {
      
      internal var §1t4408s0§:int;
      
      internal var §1t4514s0§:int;
      
      internal var §1t4519s0§:Boolean = false;
      
      public function §1t4529s0§(param1:§1t75s0§ = null, param2:Boolean = false)
      {
         super();
         if(param1 == null)
         {
            this.mcs = new §1t8560s0§();
         }
         else
         {
            this.mcs = param1;
         }
         this.§1t4519s0§ = param2;
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
               case §1t10573s0§:
                  §1t3299s0§();
                  break;
               case §1t10565s0§:
                  this.§1t3269s0§(§1t11141s0§);
                  break;
               case §1t10571s0§:
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
                  §1t1557s0§(§1t10563s0§);
               }
               else if(_loc2_ == 1)
               {
                  §1t1557s0§(§1t10575s0§);
               }
               else
               {
                  §1t1557s0§(§1t10565s0§);
               }
               if(_loc2_ == 1)
               {
                  this.§1t4514s0§ = 72;
               }
               else
               {
                  this.§1t4514s0§ = 48;
               }
               break;
            case §1t11143s0§:
               §1t1557s0§(§1t10567s0§);
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
               §1t1557s0§(§1t10569s0§);
               if(this.§1t4408s0§ < posX)
               {
                  §1t3243s0§ = -12;
                  mcs.§1t5492s0§();
               }
               else
               {
                  §1t3243s0§ = 12;
                  mcs.§1t5493s0§();
               }
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
               §1t1557s0§(§1t10571s0§);
               break;
            case §1t11153s0§:
         }
      }
      
      override internal function §1t3270s0§() : *
      {
         if(this.§1t4514s0§ > 0)
         {
            --this.§1t4514s0§;
         }
         switch(actionState)
         {
            case §1t11141s0§:
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
               if(this.§1t4514s0§ <= 0 && Math.abs(mcs.x - target.mcs.x) < 100)
               {
                  this.§1t3269s0§(§1t11151s0§);
                  this.§1t4514s0§ = 5 * 24;
               }
               else if(Math.abs(this.§1t4408s0§ - posX) < 10)
               {
                  this.§1t3269s0§(§1t11143s0§);
                  if(§1t1540s0§.§1t9550s0§() && (posX <= -50 || posX > §1t1525s0§.§1t8124s0§() + 50))
                  {
                     this.§1t3269s0§(§1t11154s0§);
                     §1t1557s0§(§1t10563s0§);
                  }
               }
               break;
            case §1t11151s0§:
               target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12395s0§],new §1t67s0§(damage,level));
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
         §1t3294s0§();
         §1t3295s0§();
         mcs.y = §1t1525s0§.§1t4467s0§();
         actionState = §1t11153s0§;
         §1t1557s0§(§1t10573s0§);
         §1t3258s0§ = true;
         mcs.§1t6280s0§();
      }
   }
}

