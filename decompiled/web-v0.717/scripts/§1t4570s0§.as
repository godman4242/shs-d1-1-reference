package
{
   import flash.display.MovieClip;
   
   public class §1t4570s0§ extends §1t68s0§
   {
      
      internal var §1t4557s0§:int;
      
      internal var §1t4514s0§:int;
      
      public function §1t4570s0§(param1:§1t75s0§ = null)
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
         this.§1t4557s0§ = Math.random() * 4;
         §1t3265s0§ = false;
      }
      
      override public function init(param1:§1t76s0§) : *
      {
         §1t1550s0§(param1.mcs);
         damage = param1.attack;
         defense = param1.defense;
         §1t3257s0§ = param1.hp;
         level = param1.lvl;
         xp = level * 2 + 20;
         reset();
         if(mcs.y == §1t1525s0§.§1t4467s0§())
         {
            this.§1t3269s0§(§1t11143s0§);
         }
         else
         {
            this.§1t3269s0§(§1t11191s0§);
            mcs.y = §1t1525s0§.§1t4467s0§();
            §1t1559s0§().§1t6280s0§();
         }
         reward = param1.§1t992s0§();
         §1t1235s0§ = param1.§1t1235s0§;
         §1t1236s0§ = param1.§1t1236s0§;
         §1t1237s0§ = param1.§1t1237s0§;
         §1t1238s0§ = param1.§1t1238s0§;
         §1t1239s0§ = param1.§1t1239s0§;
         §1t1240s0§ = param1.§1t1240s0§;
         §1t1241s0§ = param1.§1t1241s0§;
         §1t1242s0§ = param1.§1t1242s0§;
      }
      
      override public function update() : *
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
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
               case §1t10413s0§:
               case §1t10411s0§:
               case §1t10417s0§:
               case §1t10419s0§:
               case §1t10809s0§:
                  §1t3299s0§();
                  break;
               case §1t10451s0§:
               case §1t10795s0§:
                  §1t1559s0§().§1t6279s0§();
                  this.§1t3269s0§(§1t11143s0§);
                  break;
               case §1t10787s0§:
               case §1t10789s0§:
               case §1t10791s0§:
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
                        _loc3_ = Math.random() * 3;
                        if(_loc3_ > 0)
                        {
                           §1t1557s0§(§1t10793s0§);
                        }
                        else
                        {
                           §1t1557s0§(§1t10811s0§);
                           if(mcs.scaleX == 1)
                           {
                              §1t1553s0§(-10);
                           }
                           else
                           {
                              §1t1553s0§(10);
                           }
                        }
                     }
                     else
                     {
                        §1t1557s0§(§1t10297s0§);
                     }
                  }
                  break;
               case §1t10297s0§:
                  _loc2_ = Math.random() * 3;
                  if(_loc2_ > 0)
                  {
                     §1t1557s0§(§1t10793s0§);
                  }
                  else
                  {
                     §1t1557s0§(§1t10811s0§);
                     if(mcs.scaleX == 1)
                     {
                        §1t1553s0§(-10);
                     }
                     else
                     {
                        §1t1553s0§(10);
                     }
                  }
                  break;
               case §1t10793s0§:
                  mcs.§1t6281s0§(0);
                  if(mcs.scaleX == 1)
                  {
                     §1t1553s0§(-50);
                  }
                  else
                  {
                     §1t1553s0§(50);
                  }
                  this.§1t3269s0§(§1t11141s0§);
                  break;
               case §1t10811s0§:
                  mcs.§1t6281s0§(0);
                  this.§1t3269s0§(§1t11167s0§);
                  break;
               case §1t10805s0§:
                  §1t1557s0§(§1t10807s0§);
                  break;
               case §1t10785s0§:
               case §1t10797s0§:
               case §1t10799s0§:
                  if(mcs.§1t6283s0§())
                  {
                     §1t1553s0§(33);
                  }
                  else
                  {
                     §1t1553s0§(-33);
                  }
                  mcs.§1t6274s0§();
                  break;
               case §1t10813s0§:
                  this.§1t3269s0§(§1t11141s0§);
                  §1t1559s0§().§1t6279s0§();
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
               §1t1557s0§(§1t10783s0§);
               this.§1t4514s0§ = 12;
               break;
            case §1t11143s0§:
               if(this.§1t4557s0§ == 0)
               {
                  §1t1557s0§(§1t10785s0§);
               }
               else if(this.§1t4557s0§ == 1)
               {
                  §1t1557s0§(§1t10797s0§);
               }
               else if(this.§1t4557s0§ == 2)
               {
                  §1t1557s0§(§1t10799s0§);
               }
               else if(this.§1t4557s0§ == 3)
               {
                  this.§1t3269s0§(§1t11142s0§);
               }
               this.§1t4514s0§ = 24;
               break;
            case §1t11142s0§:
               §1t1557s0§(§1t10801s0§);
               §1t3243s0§ = 6 + Math.random() * 3;
               break;
            case §1t11151s0§:
               _loc2_ = Math.random() * 3;
               if(_loc2_ == 0)
               {
                  §1t1557s0§(§1t10787s0§);
               }
               else if(_loc2_ == 1)
               {
                  §1t1557s0§(§1t10789s0§);
               }
               else if(_loc2_ == 2)
               {
                  §1t1557s0§(§1t10791s0§);
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
            case §1t11169s0§:
               §1t1557s0§(§1t10795s0§);
               break;
            case §1t11167s0§:
               §1t1557s0§(§1t10803s0§);
               §1t3243s0§ = 1 + Math.random() * 2;
               break;
            case §1t11168s0§:
               §1t1557s0§(§1t10805s0§);
               break;
            case §1t11191s0§:
               §1t1557s0§(§1t10813s0§);
         }
      }
      
      override internal function §1t3270s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         switch(actionState)
         {
            case §1t11141s0§:
               --this.§1t4514s0§;
               if(this.§1t4514s0§ <= 0)
               {
                  this.§1t3269s0§(§1t11143s0§);
               }
               break;
            case §1t11143s0§:
               _loc1_ = target.mcs.x;
               _loc2_ = target.mcs.y;
               --this.§1t4514s0§;
               if(_loc1_ < mcs.x)
               {
                  mcs.§1t5492s0§();
                  if(mcs.x - _loc1_ < 80 && mcs.y - _loc2_ < 80)
                  {
                     this.§1t3269s0§(§1t11151s0§);
                  }
                  else if(this.§1t4514s0§ <= 0)
                  {
                     if(int(Math.random() * 5) == 0)
                     {
                        this.§1t3269s0§(§1t11141s0§);
                     }
                     else
                     {
                        this.§1t4514s0§ = 24;
                     }
                  }
               }
               else
               {
                  mcs.§1t5493s0§();
                  if(_loc1_ - mcs.x < 80 && mcs.y - _loc2_ < 80)
                  {
                     this.§1t3269s0§(§1t11151s0§);
                  }
                  else if(this.§1t4514s0§ <= 0)
                  {
                     if(int(Math.random() * 5) == 0)
                     {
                        this.§1t3269s0§(§1t11141s0§);
                     }
                     else
                     {
                        this.§1t4514s0§ = 24;
                     }
                  }
               }
               break;
            case §1t11142s0§:
               _loc1_ = target.mcs.x;
               _loc2_ = target.mcs.y;
               if(_loc1_ < mcs.x)
               {
                  mcs.§1t5492s0§();
                  if(mcs.x - _loc1_ < 80 && mcs.y - _loc2_ < 80)
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
                  if(_loc1_ - mcs.x < 80 && mcs.y - _loc2_ < 80)
                  {
                     this.§1t3269s0§(§1t11151s0§);
                  }
                  else
                  {
                     §1t1553s0§(§1t3243s0§);
                  }
               }
               break;
            case §1t11151s0§:
               target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12395s0§],new §1t67s0§(damage,level));
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
                  this.§1t3269s0§(§1t11146s0§);
               }
               break;
            case §1t11146s0§:
               break;
            case §1t11153s0§:
               §1t3300s0§();
               break;
            case §1t11167s0§:
               _loc1_ = target.mcs.x;
               _loc2_ = target.mcs.y;
               if(_loc1_ < mcs.x)
               {
                  mcs.§1t5492s0§();
                  if(mcs.x - _loc1_ < 50 && mcs.y - _loc2_ < 50)
                  {
                     this.§1t3269s0§(§1t11168s0§);
                  }
                  else
                  {
                     §1t1553s0§(-§1t3243s0§);
                  }
               }
               else
               {
                  mcs.§1t5493s0§();
                  if(_loc1_ - mcs.x < 50 && mcs.y - _loc2_ < 50)
                  {
                     this.§1t3269s0§(§1t11168s0§);
                  }
                  else
                  {
                     §1t1553s0§(§1t3243s0§);
                  }
               }
               break;
            case §1t11168s0§:
               if(Math.abs(target.mcs.x - mcs.x) > 50)
               {
                  this.§1t3269s0§(§1t11167s0§);
               }
               else if(§1t1558s0§() == §1t10807s0§)
               {
                  target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12393s0§],new §1t67s0§(damage,level));
               }
         }
      }
      
      override public function §1t3277s0§(param1:MovieClip, param2:§1t67s0§) : Boolean
      {
         if(§1t3246s0§ > 0)
         {
            return false;
         }
         var _loc3_:int = param2.damage;
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
         _loc4_ *= 2;
         _loc5_ *= 2;
         _loc6_ *= 2;
         _loc7_ *= 2;
         switch(param1)
         {
            case mcs.§1t6231s0§[§1t75s0§.§1t12394s0§]:
            case mcs.§1t6231s0§[§1t75s0§.§1t12393s0§]:
            case mcs.§1t6231s0§[§1t75s0§.§1t12389s0§]:
               _loc3_ *= 3;
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
            if(!§1t1071s0§)
            {
               _loc3_ *= 0.6;
            }
            if(_loc3_ < param2.§1t1088s0§())
            {
               _loc3_ = param2.§1t1088s0§();
            }
            §1t3308s0§(§1t3309s0§() - (_loc3_ + _loc4_ + _loc6_ + _loc5_ + _loc7_));
            §1t3301s0§();
            §1t3246s0§ = 12;
            if(§1t3309s0§() > 0)
            {
               §1t1071s0§ = false;
               if((param2.§1t1073s0§() || actionState == §1t11147s0§ || actionState == §1t11145s0§ || actionState == §1t11144s0§) && !this.§1t3292s0§())
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
               else if(!this.§1t3292s0§() && !§1t3293s0§())
               {
                  this.§1t3269s0§(§1t11169s0§);
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
      
      override public function §1t3298s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:MovieClip = null;
         §1t88s0§.instance.§1t1507s0§();
         if(!§1t1540s0§.§1t10015s0§())
         {
            §1t3294s0§();
            §1t3295s0§();
         }
         if(actionState == §1t11167s0§ || actionState == §1t11168s0§)
         {
            §1t1557s0§(§1t10809s0§);
            actionState = §1t11153s0§;
            §1t3258s0§ = true;
            mcs.§1t6280s0§();
            return;
         }
         if(actionState == §1t11147s0§)
         {
            §1t3258s0§ = true;
            return;
         }
         if(this.§1t3292s0§())
         {
            actionState = §1t11153s0§;
            §1t1557s0§(§1t10417s0§);
            if(!§1t1523s0§.§1t9471s0§)
            {
               §1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12392s0§),§1t1525s0§.§1t9942s0§(),90);
               §1t3248s0§.§1t2253s0§(15);
            }
            §1t3258s0§ = true;
            return;
         }
         mcs.y = §1t1525s0§.§1t4467s0§();
         actionState = §1t11153s0§;
         if(Math.random() * 2 < 1)
         {
            mcs.scaleX = -mcs.scaleX;
         }
         if(!§1t1523s0§.§1t9471s0§ && fatal)
         {
            if(§1t1071s0§)
            {
               §1t1557s0§(§1t10413s0§);
               _loc2_ = mcs.§1t6258s0§(§1t75s0§.§1t12393s0§);
               _loc1_ = Math.random() * 3;
               if(_loc1_ == 0)
               {
                  §1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12389s0§),§1t1525s0§.§1t9942s0§(),130);
               }
               else if(_loc1_ == 1)
               {
                  §1t3249s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,_loc2_,§1t1525s0§.§1t9942s0§(),180);
               }
               else
               {
                  §1t3249s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,_loc2_,§1t1525s0§.§1t9942s0§(),180);
                  §1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12389s0§),§1t1525s0§.§1t9942s0§(),130);
               }
               if(§1t3249s0§ != null)
               {
                  §1t3249s0§.§1t2251s0§(4);
                  §1t3249s0§.§1t2250s0§(10);
               }
            }
            else
            {
               _loc1_ = Math.random() * 6;
               if(_loc1_ <= 1)
               {
                  §1t1557s0§(§1t10409s0§);
                  §1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12392s0§),§1t1525s0§.§1t9942s0§(),80);
                  §1t3248s0§.§1t2253s0§(15);
               }
               else if(_loc1_ == 2)
               {
                  §1t1557s0§(§1t10291s0§);
                  §1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12389s0§),§1t1525s0§.§1t9942s0§(),-90,0,5);
               }
               else if(_loc1_ == 3)
               {
                  §1t1557s0§(§1t10411s0§);
                  _loc1_ = Math.random() * 3;
                  if(_loc1_ == 0)
                  {
                     §1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12389s0§),§1t1525s0§.§1t9942s0§(),60);
                  }
                  else if(_loc1_ == 1)
                  {
                     §1t3249s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12378s0§),§1t1525s0§.§1t9942s0§(),180);
                  }
                  else
                  {
                     §1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12389s0§),§1t1525s0§.§1t9942s0§(),60);
                     §1t3249s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12378s0§),§1t1525s0§.§1t9942s0§(),180);
                  }
                  if(§1t3249s0§ != null)
                  {
                     §1t3249s0§.§1t2251s0§(5);
                  }
               }
               else if(_loc1_ == 4)
               {
                  §1t1557s0§(§1t10419s0§);
                  _loc1_ = Math.random() * 3;
                  if(_loc1_ == 0)
                  {
                     §1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12390s0§),§1t1525s0§.§1t9942s0§(),180);
                  }
                  else if(_loc1_ == 1)
                  {
                     §1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12391s0§),§1t1525s0§.§1t9942s0§(),120);
                  }
                  else
                  {
                     §1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12390s0§),§1t1525s0§.§1t9942s0§(),180);
                     §1t3249s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12391s0§),§1t1525s0§.§1t9942s0§(),120);
                  }
               }
               else
               {
                  §1t1557s0§(§1t10409s0§);
                  §1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12390s0§),§1t1525s0§.§1t9942s0§(),80);
                  §1t3248s0§.§1t2253s0§(15);
                  mcs.hair.visible = true;
                  mcs.§1t6235s0§.visible = false;
                  mcs.§1t6278s0§();
                  mcs.§1t6276s0§();
               }
            }
         }
         else if(§1t1071s0§)
         {
            §1t1557s0§(§1t10409s0§);
            mcs.hair.visible = true;
            mcs.§1t6235s0§.visible = false;
            mcs.§1t6276s0§();
         }
         else
         {
            _loc1_ = Math.random() * 4;
            if(_loc1_ <= 1)
            {
               §1t1557s0§(§1t10409s0§);
            }
            else if(_loc1_ == 2)
            {
               §1t1557s0§(§1t10291s0§);
            }
            else
            {
               §1t1557s0§(§1t10409s0§);
               mcs.§1t6278s0§();
            }
         }
         §1t3258s0§ = true;
         mcs.§1t6280s0§();
      }
      
      override public function §1t3292s0§() : Boolean
      {
         return actionState == §1t11152s0§ || actionState == §1t11172s0§ || actionState == §1t11173s0§ || actionState == §1t11190s0§ || actionState == §1t11167s0§ || actionState == §1t11168s0§;
      }
   }
}

