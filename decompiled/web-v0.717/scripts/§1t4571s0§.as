package
{
   import flash.display.MovieClip;
   
   public class §1t4571s0§ extends §1t68s0§
   {
      
      public function §1t4571s0§(param1:§1t75s0§ = null)
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
      }
      
      override public function init(param1:§1t76s0§) : *
      {
         super.init(param1);
         if(mcs.y == §1t1525s0§.§1t4467s0§())
         {
            this.§1t3269s0§(§1t11141s0§);
         }
         else
         {
            this.§1t3269s0§(§1t11145s0§);
         }
         §1t3265s0§ = false;
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
                  this.§1t3269s0§(§1t11151s0§);
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
                        §1t1557s0§(§1t10821s0§);
                     }
                     else
                     {
                        §1t1557s0§(§1t10297s0§);
                     }
                  }
                  break;
               case §1t10297s0§:
                  §1t1557s0§(§1t10821s0§);
                  break;
               case §1t10821s0§:
                  mcs.§1t6281s0§(0);
                  if(mcs.scaleX == 1)
                  {
                     §1t1553s0§(-30);
                  }
                  else
                  {
                     §1t1553s0§(30);
                  }
                  this.§1t3269s0§(§1t11151s0§);
                  break;
               case §1t10817s0§:
                  this.§1t3269s0§(§1t11151s0§);
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
               §1t1557s0§(§1t10815s0§);
               break;
            case §1t11151s0§:
               if(§1t1558s0§() == §1t10819s0§)
               {
                  mcs.§1t6274s0§();
               }
               else
               {
                  §1t1557s0§(§1t10819s0§);
               }
               if(target.mcs.x < mcs.x)
               {
                  velX = -10 - Math.random() * 5;
                  mcs.§1t5492s0§();
               }
               else
               {
                  velX = 10 + Math.random() * 5;
                  mcs.§1t5493s0§();
               }
               velY = -10 - Math.random() * 10;
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
               §1t3245s0§ = 24;
               break;
            case §1t11153s0§:
               break;
            case §1t11150s0§:
               §1t1557s0§(§1t10817s0§);
         }
      }
      
      override internal function §1t3270s0§() : *
      {
         switch(actionState)
         {
            case §1t11141s0§:
               if(Math.abs(target.mcs.x - mcs.x) < 50)
               {
                  this.§1t3269s0§(§1t11150s0§);
               }
               break;
            case §1t11151s0§:
               §1t1553s0§(velX);
               mcs.y += velY;
               velY += 1;
               if(mcs.y >= §1t1525s0§.§1t4467s0§())
               {
                  mcs.y = §1t1525s0§.§1t4467s0§() + 5;
                  this.§1t3269s0§(§1t11146s0§);
               }
               target.§1t3274s0§(mcs,new §1t67s0§(damage,level));
               break;
            case §1t11147s0§:
               §1t3288s0§();
               break;
            case §1t11173s0§:
               §1t3289s0§();
               break;
            case §1t11152s0§:
               break;
            case §1t11145s0§:
               mcs.y += velY;
               velY += 3;
               if(mcs.y >= §1t1525s0§.§1t4467s0§())
               {
                  mcs.y = §1t1525s0§.§1t4467s0§();
                  this.§1t3269s0§(§1t11151s0§);
               }
               break;
            case §1t11146s0§:
               --§1t3245s0§;
               if(§1t3245s0§ <= 0)
               {
                  this.§1t3269s0§(§1t11151s0§);
               }
               break;
            case §1t11153s0§:
               §1t3300s0§();
         }
      }
      
      override public function §1t3277s0§(param1:MovieClip, param2:§1t67s0§) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         if(§1t3246s0§ > 0)
         {
            return false;
         }
         if(actionState == §1t11141s0§)
         {
            this.§1t3269s0§(§1t11150s0§);
            return false;
         }
         _loc3_ = param2.damage;
         _loc4_ = param2.§1t1062s0§ - §1t1239s0§;
         _loc5_ = param2.§1t1063s0§ - §1t1241s0§;
         var _loc6_:int = param2.§1t1064s0§ - §1t1240s0§;
         _loc7_ = param2.§1t1065s0§ - §1t1242s0§;
         if(param2.§1t1062s0§ > 0 && _loc4_ < 1)
         {
            _loc4_ = 1;
         }
         else if(_loc4_ < 0)
         {
            _loc4_ = 0;
         }
         if(param2.§1t1063s0§ > 0 && _loc5_ < 1)
         {
            _loc5_ = 1;
         }
         else if(_loc5_ < 0)
         {
            _loc5_ = 0;
         }
         if(param2.§1t1064s0§ > 0 && _loc6_ < 1)
         {
            _loc6_ = 1;
         }
         else if(_loc6_ < 0)
         {
            _loc6_ = 0;
         }
         if(param2.§1t1065s0§ > 0 && _loc7_ < 1)
         {
            _loc7_ = 1;
         }
         else if(_loc7_ < 0)
         {
            _loc7_ = 0;
         }
         _loc4_ *= 2;
         _loc5_ *= 2;
         _loc6_ *= 2;
         _loc7_ *= 2;
         switch(param1)
         {
            case mcs.§1t6231s0§[§1t75s0§.§1t12394s0§]:
            case mcs.§1t6231s0§[§1t75s0§.§1t12393s0§]:
            case mcs.§1t6231s0§[§1t75s0§.§1t12389s0§]:
               §1t1071s0§ = true;
               §1t3256s0§ = true;
               break;
            case mcs.§1t6231s0§[§1t75s0§.§1t12380s0§]:
               §1t3256s0§ = false;
               _loc3_ = 0;
               return false;
            default:
               §1t3256s0§ = true;
         }
         if(§1t3309s0§() > 0)
         {
            _loc3_ -= defense;
            if(_loc3_ < param2.§1t1088s0§())
            {
               _loc3_ = param2.§1t1088s0§();
            }
            if(§1t1071s0§)
            {
               _loc3_ *= 1.3;
            }
            §1t3308s0§(§1t3309s0§() - (_loc3_ + _loc4_ + _loc6_ + _loc5_ + _loc7_));
            §1t3301s0§();
            §1t3246s0§ = 12;
            if(§1t3309s0§() > 0)
            {
               §1t1071s0§ = false;
               if((param2.§1t1073s0§() || actionState == §1t11147s0§ || actionState == §1t11145s0§ || actionState == §1t11144s0§ || actionState == §1t11151s0§) && !§1t3292s0§())
               {
                  §1t3280s0§();
               }
               else if(param2.§1t1075s0§())
               {
                  §1t3281s0§();
               }
               else if(param2.§1t1076s0§())
               {
                  §1t3282s0§(param2.§1t1067s0§,param2.§1t1068s0§);
               }
               else if(param2.§1t1077s0§())
               {
                  §1t3283s0§(param2.§1t1067s0§,param2.§1t1068s0§);
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
   }
}

