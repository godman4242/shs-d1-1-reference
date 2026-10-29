package
{
   public class §1t4553s0§ extends §1t68s0§
   {
      
      internal var §1t4408s0§:int;
      
      internal var §1t4514s0§:int;
      
      public function §1t4553s0§(param1:§1t75s0§ = null)
      {
         super();
         if(param1 == null)
         {
            this.mcs = new §1t8562s0§();
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
         if(int(Math.random() * 2) == 0)
         {
            §1t1559s0§().§1t5492s0§();
         }
         this.§1t3269s0§(§1t11141s0§);
         reward = param1.§1t992s0§();
         mcs.y = §1t1525s0§.§1t4467s0§();
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
               case §1t10603s0§:
                  §1t3299s0§();
                  break;
               case §1t10601s0§:
               case §1t10595s0§:
                  this.§1t3269s0§(§1t11141s0§);
                  break;
               case §1t10607s0§:
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
               _loc2_ = Math.random() * 4;
               this.§1t4514s0§ = 48;
               if(_loc2_ == 0)
               {
                  §1t1557s0§(§1t10593s0§);
               }
               else if(_loc2_ == 1)
               {
                  §1t1557s0§(§1t10601s0§);
                  this.§1t4514s0§ = 120;
               }
               else if(_loc2_ == 2)
               {
                  §1t1557s0§(§1t10595s0§);
               }
               else if(_loc2_ == 3)
               {
                  §1t1557s0§(§1t10605s0§);
                  this.§1t4514s0§ = 120;
               }
               break;
            case §1t11143s0§:
               §1t1557s0§(§1t10597s0§);
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
               §1t1557s0§(§1t10599s0§);
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
            case §1t11153s0§:
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
                  if(!§1t126s0§.§1t9190s0§().§1t1700s0§())
                  {
                     if(§1t1558s0§() == §1t10605s0§)
                     {
                        §1t1557s0§(§1t10607s0§);
                     }
                     else if(int(Math.random() * 3) == 1)
                     {
                        this.§1t3269s0§(§1t11143s0§);
                     }
                     else
                     {
                        this.§1t3269s0§(§1t11141s0§);
                     }
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
                  if(§1t1540s0§.§1t9550s0§() && (posX <= -50 || posX > §1t1525s0§.§1t8124s0§() + 50))
                  {
                     this.§1t3269s0§(§1t11154s0§);
                     §1t1557s0§(§1t10593s0§);
                  }
               }
               break;
            case §1t11151s0§:
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
         if(_loc1_ < mcs.x)
         {
            if(mcs.x - _loc1_ < 200 && !mcs.§1t6283s0§() || mcs.x - _loc1_ < 50 && mcs.§1t6283s0§())
            {
               if(§1t1540s0§.§1t9550s0§())
               {
                  this.§1t4408s0§ = §1t1525s0§.§1t8124s0§() + 100;
               }
               else
               {
                  this.§1t4408s0§ = Math.random() * §1t1525s0§.§1t8124s0§();
               }
               this.§1t3269s0§(§1t11142s0§);
            }
         }
         else if(_loc1_ > mcs.x)
         {
            if(_loc1_ - mcs.x < 200 && mcs.§1t6283s0§() || _loc1_ - mcs.x < 50 && !mcs.§1t6283s0§())
            {
               if(§1t1540s0§.§1t9550s0§())
               {
                  this.§1t4408s0§ = -100;
               }
               else
               {
                  this.§1t4408s0§ = Math.random() * §1t1525s0§.§1t8124s0§();
               }
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
         §1t1557s0§(§1t10603s0§);
         §1t3258s0§ = true;
         mcs.§1t6280s0§();
      }
   }
}

