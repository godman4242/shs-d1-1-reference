package
{
   public class §1t4903s0§ extends §1t4573s0§
   {
      
      public function §1t4903s0§()
      {
         super();
         this.mcs = new §1t8322s0§();
         §1t4408s0§ = Math.random() * §1t1525s0§.§1t8124s0§();
         §1t3269s0§(§1t11142s0§);
      }
      
      override internal function §1t3270s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         switch(actionState)
         {
            case §1t11141s0§:
               --§1t4514s0§;
               if(§1t4514s0§ <= 0)
               {
                  §1t4514s0§ = 12;
                  §1t3304s0§();
                  if(!§1t126s0§.§1t9190s0§().§1t1700s0§() && int(Math.random() * 3) < 2)
                  {
                     §1t4408s0§ = Math.random() * §1t1525s0§.§1t8124s0§();
                     §1t3269s0§(§1t11142s0§);
                  }
               }
               break;
            case §1t11143s0§:
               §1t4408s0§ = Math.random() * §1t1525s0§.§1t8124s0§();
               §1t3269s0§(§1t11142s0§);
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
                  else
                  {
                     §1t4408s0§ = Math.random() * §1t1525s0§.§1t8124s0§();
                     §1t3269s0§(§1t11142s0§);
                  }
               }
               _loc2_ = Math.abs(mcs.x - target.mcs.x);
               if(_loc2_ >= 100 && _loc2_ < 250 && int(Math.random() * 3) == 0)
               {
                  §1t3269s0§(§1t11155s0§);
               }
               break;
            case §1t11151s0§:
               target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12380s0§],new §1t67s0§(damage,level));
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
                  target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12393s0§],new §1t67s0§(damage,level));
                  target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12395s0§],new §1t67s0§(damage,level));
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
   }
}

