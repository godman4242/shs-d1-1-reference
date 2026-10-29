package
{
   import flash.display.MovieClip;
   
   public class §1t4581s0§ extends §1t68s0§
   {
      
      internal var §1t4582s0§:Boolean = true;
      
      internal var §1t4583s0§:int;
      
      public function §1t4581s0§(param1:§1t75s0§ = null)
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
                  this.§1t3269s0§(§1t11143s0§);
                  break;
               case §1t10511s0§:
                  target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12380s0§],new §1t67s0§(damage,level));
                  this.§1t3269s0§(§1t11143s0§);
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
                  break;
               case §1t10421s0§:
               case §1t10423s0§:
                  §1t3291s0§();
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
               §1t1557s0§(§1t10503s0§);
               break;
            case §1t11143s0§:
               §1t3243s0§ = Math.random() * 2 + 3;
               §1t1557s0§(§1t10509s0§);
               break;
            case §1t11151s0§:
               §1t1557s0§(§1t10511s0§);
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
            case §1t11155s0§:
               §1t1557s0§(§1t10507s0§);
         }
      }
      
      override internal function §1t3270s0§() : *
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc1_:int = -1;
         if(§1t3271s0§())
         {
            target = §1t1543s0§.§1t10231s0§(§1t1555s0§(),true);
            _loc1_ = Math.random() * 4;
         }
         switch(actionState)
         {
            case §1t11141s0§:
               if(_loc1_ == 0)
               {
                  this.§1t3269s0§(§1t11143s0§);
               }
               else if(_loc1_ == 1 && this.§1t4582s0§)
               {
                  this.§1t3269s0§(§1t11155s0§);
               }
               break;
            case §1t11143s0§:
               if(_loc1_ == 0 && posX > 50 && posX < §1t1525s0§.§1t8124s0§() - 50)
               {
                  this.§1t3269s0§(§1t11141s0§);
               }
               else if(_loc1_ == 1 && this.§1t4582s0§)
               {
                  this.§1t3269s0§(§1t11155s0§);
               }
               else
               {
                  _loc4_ = target.mcs.x;
                  _loc5_ = target.mcs.y;
                  if(_loc4_ < mcs.x)
                  {
                     mcs.§1t5492s0§();
                     if(mcs.x - _loc4_ < 50 && mcs.y - _loc5_ < 50)
                     {
                        this.§1t3269s0§(§1t11151s0§);
                     }
                     else
                     {
                        §1t1553s0§(-§1t3243s0§);
                     }
                  }
                  else
                  {
                     mcs.§1t5493s0§();
                     if(_loc4_ - mcs.x < 50 && mcs.y - _loc5_ < 50)
                     {
                        this.§1t3269s0§(§1t11151s0§);
                     }
                     else
                     {
                        §1t1553s0§(§1t3243s0§);
                     }
                  }
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
               break;
            case §1t11155s0§:
               if(mcs.scaleX > 0)
               {
                  §1t1553s0§(8);
               }
               else
               {
                  §1t1553s0§(-8);
               }
               _loc2_ = mcs.x - target.mcs.x;
               _loc3_ = Math.abs(_loc2_);
               if(_loc3_ < 100 && !target.§1t3293s0§())
               {
                  if(§1t1559s0§().§1t6283s0§() && _loc2_ <= 0 || !§1t1559s0§().§1t6283s0§() && _loc2_ >= 0)
                  {
                     target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12381s0§],new §1t67s0§(damage,level));
                  }
               }
               else if(_loc3_ > 500)
               {
                  this.§1t3269s0§(§1t11143s0§);
               }
         }
      }
      
      override public function §1t3277s0§(param1:MovieClip, param2:§1t67s0§) : Boolean
      {
         var _loc3_:int = 0;
         if(§1t3246s0§ > 0)
         {
            return false;
         }
         _loc3_ = param2.damage;
         var _loc4_:int = param2.§1t1062s0§ - §1t1239s0§;
         var _loc5_:int = param2.§1t1063s0§ - §1t1241s0§;
         var _loc6_:int = param2.§1t1064s0§ - §1t1240s0§;
         var _loc7_:int = param2.§1t1065s0§ - §1t1242s0§;
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
            case mcs.§1t6231s0§[§1t75s0§.§1t12381s0§]:
               §1t3256s0§ = true;
               _loc3_ = 0;
               §1t3246s0§ = 24;
               §1t88s0§.instance.§1t1510s0§();
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
            if(param2.§1t1081s0§())
            {
               _loc3_ = 500;
               param2.§1t1066s0§ = §1t67s0§.§1t9119s0§;
            }
            §1t3308s0§(§1t3309s0§() - (_loc3_ + _loc4_ + _loc6_ + _loc5_ + _loc7_));
            §1t3301s0§();
            §1t3246s0§ = 12;
            if(§1t3309s0§() > 0)
            {
               §1t1071s0§ = false;
               if((param2.§1t1073s0§() || actionState == §1t11147s0§ || actionState == §1t11145s0§ || actionState == §1t11144s0§) && !§1t3292s0§())
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
               else if(param2.§1t1080s0§())
               {
                  §1t3286s0§(param2.§1t1067s0§,param2.§1t1068s0§);
               }
               else if(!§1t3292s0§() && !param2.§1t1081s0§())
               {
                  §1t3290s0§();
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

