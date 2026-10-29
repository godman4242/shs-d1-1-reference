package
{
   public class §1t4898s0§ extends §1t4518s0§
   {
      
      public function §1t4898s0§(param1:§1t75s0§ = null, param2:Boolean = false)
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
      }
      
      override public function §1t3269s0§(param1:int) : *
      {
         var _loc2_:int = 0;
         this.actionState = param1;
         switch(param1)
         {
            case §1t11141s0§:
               §1t1557s0§(§1t10267s0§);
               §1t4514s0§ = 48;
               break;
            case §1t11143s0§:
               §1t1557s0§(§1t10549s0§);
               §1t4408s0§ = Math.random() * §1t1525s0§.§1t8124s0§();
               if(§1t4408s0§ < posX)
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
               _loc2_ = Math.random() * 6;
               if(_loc2_ == 0)
               {
                  §1t1557s0§(§1t10513s0§);
               }
               else if(_loc2_ == 1)
               {
                  §1t1557s0§(§1t10445s0§);
               }
               else if(_loc2_ == 2)
               {
                  §1t1557s0§(§1t10949s0§);
               }
               else if(_loc2_ == 3)
               {
                  §1t1557s0§(§1t10991s0§);
               }
               else if(_loc2_ == 4)
               {
                  §1t1557s0§(§1t11033s0§);
               }
               else if(_loc2_ == 5)
               {
                  §1t1557s0§(§1t10427s0§);
               }
               if(_loc2_ >= 2)
               {
                  if(§1t3243s0§ < 0)
                  {
                     §1t3243s0§ = -10;
                  }
                  else
                  {
                     §1t3243s0§ = 10;
                  }
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
                     §1t3243s0§ = -3;
                     mcs.§1t5492s0§();
                  }
                  else
                  {
                     §1t3243s0§ = 3;
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

