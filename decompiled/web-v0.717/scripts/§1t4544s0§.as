package
{
   public class §1t4544s0§ extends §1t68s0§
   {
      
      internal var §1t4408s0§:int;
      
      internal var §1t4514s0§:int;
      
      internal var §1t4519s0§:Boolean = false;
      
      internal var §1t4520s0§:Boolean = false;
      
      public function §1t4544s0§(param1:§1t75s0§ = null, param2:Boolean = false)
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
         this.§1t4519s0§ = param2;
         this.mcs.§1t5659s0§.y = -200;
         this.mcs.displayName.y = -200;
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
               case §1t10451s0§:
               case §1t10667s0§:
               case §1t10315s0§:
                  this.§1t3269s0§(§1t11143s0§);
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
                     §1t1557s0§(§1t10297s0§);
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
               case §1t10659s0§:
                  §1t1557s0§(§1t10657s0§);
                  break;
               case §1t10691s0§:
               case §1t10695s0§:
                  this.§1t3269s0§(§1t11143s0§);
                  break;
               case §1t10687s0§:
                  §1t1557s0§(§1t10689s0§);
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
               §1t1557s0§(§1t10657s0§);
               this.§1t4514s0§ = 48;
               break;
            case §1t11143s0§:
               §1t1557s0§(§1t10661s0§);
               this.§1t4408s0§ = Math.random() * §1t1525s0§.§1t8124s0§();
               if(this.§1t4408s0§ < posX)
               {
                  §1t3243s0§ = -Math.random() * 2 - 4;
                  mcs.§1t5492s0§();
               }
               else
               {
                  §1t3243s0§ = Math.random() * 2 + 4;
                  mcs.§1t5493s0§();
               }
               break;
            case §1t11142s0§:
               §1t1557s0§(§1t10661s0§);
               break;
            case §1t11151s0§:
               §1t1557s0§(§1t10667s0§);
               break;
            case §1t11147s0§:
               §1t1557s0§(§1t10403s0§);
               break;
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
            case §1t11170s0§:
               if(int(Math.random() * 2) == 0)
               {
                  §1t1557s0§(§1t10687s0§);
               }
               else
               {
                  §1t1557s0§(§1t10693s0§);
               }
               this.§1t4514s0§ = (5 + Math.random() * 10) * 24;
         }
      }
      
      override internal function §1t3270s0§() : *
      {
         var _loc1_:Boolean = false;
         switch(actionState)
         {
            case §1t11141s0§:
               --this.§1t4514s0§;
               if(this.§1t4514s0§ <= 0)
               {
                  this.§1t4514s0§ = 48;
                  if(!§1t126s0§.§1t9190s0§().§1t1700s0§() && int(Math.random() * 3) == 1)
                  {
                     this.§1t3269s0§(§1t11143s0§);
                  }
                  else
                  {
                     this.§1t3269s0§(§1t11170s0§);
                  }
               }
               if(!this.§1t4520s0§ && this.§1t4519s0§)
               {
                  this.§1t4522s0§();
               }
               break;
            case §1t11143s0§:
               §1t1553s0§(§1t3243s0§);
               _loc1_ = mcs.§1t6283s0§();
               if(§1t1525s0§.§1t9940s0§().§1t8145s0§(mcs.x,_loc1_))
               {
                  §1t1553s0§(-§1t3243s0§);
                  if(!_loc1_)
                  {
                     this.§1t4408s0§ = posX + Math.random() * (§1t1525s0§.§1t8124s0§() - posX);
                  }
                  else
                  {
                     this.§1t4408s0§ = Math.random() * posX;
                  }
                  if(this.§1t4408s0§ < posX)
                  {
                     §1t3243s0§ = -Math.random() * 2 - 4;
                     mcs.§1t5492s0§();
                  }
                  else
                  {
                     §1t3243s0§ = Math.random() * 2 + 4;
                     mcs.§1t5493s0§();
                  }
               }
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
               if(this.§1t4519s0§)
               {
                  this.§1t4522s0§();
               }
               break;
            case §1t11142s0§:
               §1t1553s0§(§1t3243s0§);
               if(posX < 0 || posX > §1t1525s0§.§1t8124s0§())
               {
                  this.§1t3269s0§(§1t11141s0§);
               }
               if(Math.abs(mcs.x - target.§1t1559s0§().x) < 50)
               {
                  this.§1t3269s0§(§1t11151s0§);
               }
               _loc1_ = mcs.§1t6283s0§();
               if(§1t1525s0§.§1t9940s0§().§1t8145s0§(mcs.x,_loc1_))
               {
                  §1t1553s0§(-§1t3243s0§);
                  if(!_loc1_)
                  {
                     this.§1t4408s0§ = posX + Math.random() * (§1t1525s0§.§1t8124s0§() - posX);
                  }
                  else
                  {
                     this.§1t4408s0§ = Math.random() * posX;
                  }
                  if(this.§1t4408s0§ < posX)
                  {
                     §1t3243s0§ = -Math.random() * 2 - 4;
                     mcs.§1t5492s0§();
                  }
                  else
                  {
                     §1t3243s0§ = Math.random() * 2 + 4;
                     mcs.§1t5493s0§();
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
            case §1t11153s0§:
               break;
            case §1t11170s0§:
               --this.§1t4514s0§;
               if(this.§1t4514s0§ <= 0)
               {
                  if(§1t1558s0§() == §1t10693s0§)
                  {
                     §1t1557s0§(§1t10695s0§);
                  }
                  else if(§1t1558s0§() == §1t10689s0§)
                  {
                     §1t1557s0§(§1t10691s0§);
                  }
               }
         }
      }
      
      internal function §1t4522s0§() : *
      {
         var _loc1_:§1t6497s0§ = §1t406s0§.§1t9190s0§().§1t6496s0§;
         if(_loc1_.§1t6853s0§() || §1t407s0§.instance.§1t6377s0§ || §1t126s0§.instance != null && §1t126s0§.instance.showing)
         {
            return;
         }
         var _loc2_:Boolean = mcs.§1t6283s0§();
         var _loc3_:int = target.§1t1559s0§().x - §1t1559s0§().x;
         if(_loc2_ && _loc3_ > 0 && _loc3_ < 200)
         {
            §1t3243s0§ = Math.random() * 3 + 5;
            this.§1t4520s0§ = true;
         }
         else if(!_loc2_ && _loc3_ < 0 && _loc3_ > -200)
         {
            §1t3243s0§ = -(Math.random() * 3 + 5);
            this.§1t4520s0§ = true;
         }
         if(this.§1t4520s0§)
         {
            if(§1t406s0§.§1t9190s0§().§1t6496s0§.§1t6853s0§())
            {
               return;
            }
            this.§1t3269s0§(§1t11142s0§);
         }
      }
   }
}

