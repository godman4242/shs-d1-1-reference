package
{
   import flash.display.MovieClip;
   
   public class §1t4554s0§ extends §1t68s0§
   {
      
      internal var §1t4408s0§:int;
      
      internal var §1t4514s0§:int;
      
      internal var §1t4519s0§:Boolean = false;
      
      internal var §1t4520s0§:Boolean = false;
      
      public function §1t4554s0§(param1:§1t75s0§ = null, param2:Boolean = false)
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
         this.§1t4519s0§ = true;
         this.mcs.§1t5659s0§.y = -200;
         this.mcs.displayName.y = -200;
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
         this.§1t3269s0§(§1t11143s0§);
         reward = param1.§1t992s0§();
      }
      
      override public function setLevel(param1:int) : *
      {
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
               case §1t10665s0§:
                  §1t3299s0§();
                  break;
               case §1t10667s0§:
                  §1t1557s0§(§1t10669s0§);
                  break;
               case §1t10673s0§:
                  §1t1557s0§(§1t10675s0§);
                  break;
               case §1t10679s0§:
                  §1t1557s0§(§1t10681s0§);
                  break;
               case §1t10675s0§:
                  if(§1t1525s0§.§1t9952s0§())
                  {
                     §1t3260s0§ = true;
                     return;
                  }
                  §1t1557s0§(§1t10677s0§);
                  break;
               case §1t10669s0§:
                  §1t1557s0§(§1t10671s0§);
                  break;
               case §1t10681s0§:
                  §1t1557s0§(§1t10683s0§);
                  break;
               case §1t10671s0§:
               case §1t10683s0§:
               case §1t10451s0§:
               case §1t10677s0§:
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
            }
         }
         if(target == null || target.§1t2364s0§())
         {
            target = §1t1543s0§.§1t10231s0§(§1t1555s0§(),true);
            if(target == null)
            {
               return;
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
               §1t1557s0§(§1t10657s0§);
               this.§1t4514s0§ = 48;
               break;
            case §1t11143s0§:
               §1t1557s0§(§1t10661s0§);
               this.§1t4408s0§ = target.posX;
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
               §1t1557s0§(§1t10663s0§);
               if(§1t3243s0§ < 0)
               {
                  §1t3243s0§ = -12;
               }
               else
               {
                  §1t3243s0§ = 12;
               }
               break;
            case §1t11151s0§:
               §1t1557s0§(§1t10667s0§);
               break;
            case §1t11149s0§:
               §1t1557s0§(§1t10673s0§);
               break;
            case §1t11166s0§:
               §1t1557s0§(§1t10679s0§);
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
            case §1t11154s0§:
               §1t3260s0§ = true;
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
                  this.§1t4514s0§ = 24;
                  if(!§1t126s0§.§1t9190s0§().§1t1700s0§() && int(Math.random() * 3) == 1)
                  {
                     this.§1t3269s0§(§1t11143s0§);
                  }
                  else
                  {
                     §1t1557s0§(§1t10659s0§);
                  }
               }
               break;
            case §1t11143s0§:
               §1t1553s0§(§1t3243s0§);
               _loc2_ = Math.abs(target.posX - posX);
               if(_loc2_ < 100)
               {
                  if(_loc2_ < 40)
                  {
                     this.§1t3269s0§(§1t11166s0§);
                  }
                  else
                  {
                     _loc1_ = Math.random() * 2;
                     if(_loc1_ == 0)
                     {
                        this.§1t3269s0§(§1t11151s0§);
                     }
                     else if(_loc1_ == 1)
                     {
                        this.§1t3269s0§(§1t11149s0§);
                     }
                  }
               }
               else if(Math.abs(this.§1t4408s0§ - posX) < 10)
               {
                  this.§1t3269s0§(§1t11143s0§);
               }
               break;
            case §1t11142s0§:
               §1t1553s0§(§1t3243s0§);
               _loc2_ = Math.abs(target.posX - posX);
               if(_loc2_ < 100)
               {
                  if(_loc2_ < 50)
                  {
                     this.§1t3269s0§(§1t11166s0§);
                  }
                  else
                  {
                     _loc1_ = Math.random() * 2;
                     if(_loc1_ == 0)
                     {
                        this.§1t3269s0§(§1t11151s0§);
                     }
                     else if(_loc1_ == 1)
                     {
                        this.§1t3269s0§(§1t11149s0§);
                     }
                  }
               }
               break;
            case §1t11151s0§:
               if(mcs.animation == §1t10669s0§)
               {
                  target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12380s0§],new §1t67s0§(damage,0));
               }
               break;
            case §1t11149s0§:
               if(mcs.animation == §1t10675s0§)
               {
                  target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12380s0§],new §1t67s0§(damage,0,§1t67s0§.§1t9117s0§));
               }
               break;
            case §1t11166s0§:
               if(mcs.animation == §1t10681s0§)
               {
                  target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12386s0§],new §1t67s0§(damage,0,§1t67s0§.§1t9118s0§));
               }
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
      
      override public function §1t3277s0§(param1:MovieClip, param2:§1t67s0§) : Boolean
      {
         if(§1t3246s0§ > 0)
         {
            return false;
         }
         switch(param1)
         {
            case mcs.§1t6231s0§[§1t75s0§.§1t12380s0§]:
               §1t3256s0§ = false;
               param2.damage = 0;
               return false;
            default:
               §1t3256s0§ = true;
               if(§1t3309s0§() > 0)
               {
                  §1t3308s0§(§1t3309s0§() - 1);
                  §1t3301s0§();
                  §1t3246s0§ = 12;
                  §1t88s0§.instance.§1t1508s0§();
                  §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,"1",10027008);
               }
               return true;
         }
      }
      
      override public function §1t3298s0§() : *
      {
         §1t88s0§.instance.§1t1507s0§();
         if(!§1t1540s0§.§1t10015s0§())
         {
            if(§1t1523s0§.§1t9514s0§ == §1t1523s0§.§1t9465s0§ && §1t3317s0§.instance.§1t1847s0§() < §1t1523s0§.§1t9515s0§)
            {
               if(int(Math.random() * 2) == 0)
               {
                  §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2182,1);
               }
            }
            else
            {
               §1t3294s0§();
            }
            §1t3295s0§();
         }
         actionState = §1t11153s0§;
         §1t1557s0§(§1t10665s0§);
         §1t3248s0§ = §1t157s0§.§1t9190s0§().§1t2287s0§(0,mcs.§1t6258s0§(§1t75s0§.§1t12392s0§),§1t1525s0§.§1t9942s0§(),80);
         §1t3248s0§.§1t2253s0§(15);
         §1t3258s0§ = true;
         mcs.§1t6280s0§();
         §1t1523s0§.§1t1684s0§(60019,1);
      }
      
      override public function §1t2292s0§() : *
      {
         mcs.§1t6280s0§();
         if(mcs.alpha < 1)
         {
            mcs.visible = false;
         }
         else
         {
            §1t1643s0§.§1t11216s0§(mcs,-255);
         }
         if(actionState != §1t11147s0§ && actionState != §1t11153s0§ && actionState != §1t11173s0§ && mcs.animation != §1t10675s0§)
         {
            §1t3260s0§ = true;
         }
      }
   }
}

