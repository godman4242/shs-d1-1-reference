package
{
   public class §1t4899s0§ extends §1t4518s0§
   {
      
      public function §1t4899s0§(param1:§1t75s0§ = null)
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
         §1t4519s0§ = false;
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
               §1t1557s0§(§1t10535s0§);
               §1t4514s0§ = 48;
               break;
            case §1t11143s0§:
               §1t1557s0§(§1t10537s0§);
               §1t4408s0§ = Math.random() * §1t1525s0§.§1t8124s0§();
               if(§1t4408s0§ < posX)
               {
                  §1t3243s0§ = -1;
                  mcs.§1t5492s0§();
               }
               else
               {
                  §1t3243s0§ = 1;
                  mcs.§1t5493s0§();
               }
               break;
            case §1t11142s0§:
               §1t1557s0§(§1t10537s0§);
               if(§1t3243s0§ < 0)
               {
                  §1t3243s0§ = -1;
               }
               else
               {
                  §1t3243s0§ = 1;
               }
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
            case §1t11154s0§:
               §1t3260s0§ = true;
         }
      }
      
      override internal function §1t3270s0§() : *
      {
         var _loc1_:Boolean = false;
         switch(actionState)
         {
            case §1t11141s0§:
               --§1t4514s0§;
               if(§1t4514s0§ <= 0)
               {
                  §1t4514s0§ = 24;
                  if(!§1t126s0§.§1t9190s0§().§1t1700s0§() && int(Math.random() * 3) == 1)
                  {
                     this.§1t3269s0§(§1t11143s0§);
                  }
               }
               if(!§1t4520s0§ && §1t4519s0§)
               {
                  §1t4522s0§();
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
                     §1t4408s0§ = posX + Math.random() * (§1t1525s0§.§1t8124s0§() - posX);
                  }
                  else
                  {
                     §1t4408s0§ = Math.random() * posX;
                  }
                  if(§1t4408s0§ < posX)
                  {
                     §1t3243s0§ = -1;
                     mcs.§1t5492s0§();
                  }
                  else
                  {
                     §1t3243s0§ = 1;
                     mcs.§1t5493s0§();
                  }
               }
               if(Math.abs(§1t4408s0§ - posX) < 10)
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
               if(§1t4519s0§)
               {
                  §1t4522s0§();
               }
               break;
            case §1t11142s0§:
               §1t1553s0§(§1t3243s0§);
               if(posX < 0 || posX > §1t1525s0§.§1t8124s0§())
               {
                  this.§1t3269s0§(§1t11141s0§);
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
         }
      }
   }
}

