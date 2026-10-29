package
{
   public class §1t4574s0§ extends §1t68s0§
   {
      
      internal var §1t4575s0§:int = 0;
      
      internal var §1t4576s0§:int = 360;
      
      internal var §1t4577s0§:int = 0;
      
      internal var §1t4578s0§:int = 480;
      
      internal var §1t4579s0§:int = 0;
      
      internal var §1t4580s0§:int = 360;
      
      public function §1t4574s0§(param1:§1t75s0§ = null)
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
         §1t1525s0§.§1t9940s0§().§1t3537s0§(55,650,§1t1525s0§.§1t9940s0§().§1t4467s0§(),"2");
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
            this.§1t3269s0§(§1t11141s0§);
         }
         else
         {
            this.§1t3269s0§(§1t11145s0§);
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
               case §1t10313s0§:
                  if(target.§1t3292s0§())
                  {
                     target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12380s0§],new §1t67s0§(damage * 2,level));
                  }
                  §1t1557s0§(§1t10315s0§);
                  break;
               case §1t10851s0§:
                  if(actionState == §1t11178s0§)
                  {
                     if(§1t1559s0§().§1t6283s0§())
                     {
                        §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11295s0§,§1t1555s0§() + 40,§1t1559s0§().y,0,0,0,-1,this);
                     }
                     else
                     {
                        §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11295s0§,§1t1555s0§() - 40,§1t1559s0§().y,0,0,0,11,this);
                     }
                  }
                  §1t1557s0§(§1t10853s0§);
                  break;
               case §1t10853s0§:
                  this.§1t3269s0§(§1t11143s0§);
                  break;
               case §1t10823s0§:
                  §1t1557s0§(§1t10825s0§);
                  if(actionState == §1t11192s0§)
                  {
                     §1t1543s0§.§1t10214s0§(87,Math.random() * §1t1525s0§.§1t9940s0§().§1t8124s0§(),0,true,level - 2);
                     §1t1543s0§.§1t10214s0§(87,Math.random() * §1t1525s0§.§1t9940s0§().§1t8124s0§(),0,true,level - 2);
                     §1t1543s0§.§1t10214s0§(87,Math.random() * §1t1525s0§.§1t9940s0§().§1t8124s0§(),0,true,level - 2);
                     §1t1543s0§.§1t10214s0§(87,Math.random() * §1t1525s0§.§1t9940s0§().§1t8124s0§(),0,true,level - 2);
                  }
                  break;
               case §1t10825s0§:
                  this.§1t3269s0§(§1t11143s0§);
                  break;
               case §1t10849s0§:
                  this.§1t3269s0§(§1t11143s0§);
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
         if(this.§1t4575s0§ > 0)
         {
            --this.§1t4575s0§;
         }
         if(this.§1t4577s0§ > 0)
         {
            --this.§1t4577s0§;
         }
         if(this.§1t4579s0§ > 0)
         {
            --this.§1t4579s0§;
         }
      }
      
      override public function §1t3269s0§(param1:int) : *
      {
         this.actionState = param1;
         switch(param1)
         {
            case §1t11141s0§:
               §1t3304s0§();
               mcs.§1t1557s0§(§1t10349s0§);
               break;
            case §1t11143s0§:
               if(§1t1555s0§() > 625 && §1t1555s0§() < 675)
               {
                  this.§1t3269s0§(§1t11141s0§);
               }
               else
               {
                  if(§1t1555s0§() < 650)
                  {
                     §1t3243s0§ = 6;
                     mcs.§1t5493s0§();
                  }
                  else
                  {
                     §1t3243s0§ = -6;
                     mcs.§1t5492s0§();
                  }
                  §1t1557s0§(§1t10529s0§);
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
            case §1t11178s0§:
               §1t1557s0§(§1t10851s0§);
               this.§1t4575s0§ = this.§1t4576s0§;
               break;
            case §1t11192s0§:
               §1t1557s0§(§1t10823s0§);
               this.§1t4577s0§ = this.§1t4578s0§;
               break;
            case §1t11158s0§:
               §1t3304s0§();
               §1t1557s0§(§1t10849s0§);
               this.§1t4579s0§ = this.§1t4580s0§;
               if(§1t1559s0§().§1t6283s0§())
               {
                  §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11309s0§,§1t1555s0§() + 100,§1t1559s0§().y - 50,5,0,0,1,this);
               }
               else
               {
                  §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11309s0§,§1t1555s0§() - 100,§1t1559s0§().y - 50,-5,0,0,1,this);
               }
         }
      }
      
      override internal function §1t3270s0§() : *
      {
         if(§1t3271s0§())
         {
            this.§1t4501s0§();
         }
         switch(actionState)
         {
            case §1t11141s0§:
               break;
            case §1t11143s0§:
               §1t1553s0§(§1t3243s0§);
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
      
      internal function §1t4501s0§() : *
      {
         var _loc3_:int = 0;
         if(§1t3260s0§ || §1t3258s0§ || §1t3292s0§() || §1t3293s0§() || actionState == §1t11147s0§)
         {
            return;
         }
         var _loc1_:int = target.mcs.x;
         var _loc2_:int = target.mcs.y;
         switch(actionState)
         {
            case §1t11141s0§:
               if(§1t3309s0§() < §1t3257s0§)
               {
                  §1t3308s0§(§1t3309s0§() + 10);
                  §1t3301s0§();
               }
               _loc3_ = Math.random() * 2;
               if(this.§1t4575s0§ == 0 && Math.abs(mcs.x - _loc1_) < 50 && mcs.y - _loc2_ < 50)
               {
                  this.§1t3269s0§(§1t11178s0§);
               }
               else if(_loc3_ == 1)
               {
                  if(this.§1t4577s0§ == 0 && §1t1543s0§.§1t10213s0§() < 8)
                  {
                     this.§1t3269s0§(§1t11192s0§);
                  }
                  else if(this.§1t4579s0§ == 0)
                  {
                     this.§1t3269s0§(§1t11158s0§);
                  }
               }
               break;
            case §1t11143s0§:
               _loc3_ = Math.random() * 2;
               if(this.§1t4575s0§ == 0 && Math.abs(mcs.x - _loc1_) < 50 && mcs.y - _loc2_ < 50)
               {
                  this.§1t3269s0§(§1t11178s0§);
               }
               else if(_loc3_ == 1)
               {
                  if(this.§1t4577s0§ == 0 && §1t1543s0§.§1t10213s0§() < 8)
                  {
                     this.§1t3269s0§(§1t11192s0§);
                  }
                  else if(this.§1t4579s0§ == 0)
                  {
                     this.§1t3269s0§(§1t11158s0§);
                  }
               }
               if(§1t1555s0§() > 625 && §1t1555s0§() < 675)
               {
                  this.§1t3269s0§(§1t11141s0§);
               }
         }
      }
   }
}

