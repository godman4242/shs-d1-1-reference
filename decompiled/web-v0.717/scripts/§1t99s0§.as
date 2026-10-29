package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class §1t99s0§ extends §1t68s0§
   {
      
      internal static var standingRange:int = 50;
      
      internal static var jumpThreshhold:int = 100;
      
      internal static var runSpeed:int = 12;
      
      internal static var lightSlashSpeed:int = 50;
      
      internal static var balancedSlashSpeed:int = 40;
      
      internal static var heavySlashSpeed:int = 30;
      
      public static var playerScrollMin:int = 350;
      
      public static var playerScrollMax:int = 450;
      
      internal static var gravity:int = 3;
      
      internal static var §1t12220s0§:int = 0;
      
      internal static var §1t12221s0§:int = 1;
      
      internal static var §1t12222s0§:int = 2;
      
      internal static var §1t12223s0§:int = 3;
      
      internal static var §1t12224s0§:int = 4;
      
      internal static var §1t12225s0§:int = 0;
      
      internal static var §1t12226s0§:int = 1;
      
      internal static var §1t12227s0§:int = 2;
      
      internal static var §1t12228s0§:int = 3;
      
      internal static var §1t12229s0§:int = 4;
      
      internal static var §1t12230s0§:int = 5;
      
      internal static var §1t12231s0§:int = 6;
      
      internal static var §1t12232s0§:int = 7;
      
      internal static var §1t12233s0§:int = 8;
      
      internal static var §1t12234s0§:int = 5 * 24;
      
      internal var §1t4403s0§:Vector.<Point> = new Vector.<Point>();
      
      internal var §1t4404s0§:Vector.<Point> = new Vector.<Point>();
      
      internal var §1t4405s0§:Boolean = false;
      
      internal var §1t4406s0§:Boolean = false;
      
      internal var §1t4407s0§:Boolean = false;
      
      internal var §1t4408s0§:int;
      
      internal var §1t4409s0§:int;
      
      internal var minDamage:int;
      
      internal var damageRange:int;
      
      internal var slashUsage:int;
      
      internal var §1t4410s0§:int;
      
      internal var §1t4411s0§:Boolean = false;
      
      internal var stance:int = -1;
      
      internal var §1t1243s0§:int;
      
      internal var §1t1244s0§:int;
      
      internal var §1t4412s0§:int;
      
      internal var §1t4413s0§:int;
      
      internal var chi:int;
      
      internal var §1t4414s0§:int;
      
      internal var §1t4415s0§:int;
      
      internal var §1t4416s0§:int;
      
      internal var §1t4417s0§:int = 0;
      
      internal var §1t4418s0§:int = -1;
      
      internal var §1t4419s0§:int = 48;
      
      internal var §1t4420s0§:int = 10;
      
      internal var §1t4421s0§:int = 0;
      
      internal var §1t4422s0§:int = 0;
      
      internal var §1t4423s0§:int = 0;
      
      internal var §1t4424s0§:int = 0;
      
      internal var §1t4425s0§:Boolean = false;
      
      internal var §1t4426s0§:Boolean = false;
      
      internal var §1t4427s0§:Boolean = false;
      
      internal var §1t4428s0§:Boolean = false;
      
      internal var §1t4429s0§:Boolean = false;
      
      internal var §1t4430s0§:Boolean = false;
      
      internal var §1t1222s0§:Vector.<§1t57s0§>;
      
      internal var §1t4431s0§:Boolean = false;
      
      internal var §1t4432s0§:int;
      
      internal var §1t4433s0§:§1t128s0§ = null;
      
      internal var §1t4434s0§:int;
      
      internal var §1t4435s0§:int;
      
      internal var §1t4436s0§:int = 0;
      
      internal var §1t4437s0§:MovieClip = null;
      
      internal var §1t4438s0§:int = 0;
      
      internal var §1t4439s0§:int;
      
      internal var §1t4440s0§:int = 0;
      
      internal var §1t4499s0§:Vector.<Point> = new Vector.<Point>();
      
      internal var §1t4500s0§:int = -1;
      
      public function §1t99s0§(param1:§1t75s0§ = null)
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
         controlledBy = 0;
         this.§1t3269s0§(§1t11141s0§);
         §1t3244s0§ = 12;
      }
      
      public function §1t4441s0§() : int
      {
         return this.chi / §1t1523s0§.§1t9383s0§;
      }
      
      public function §1t4442s0§(param1:int) : *
      {
         this.chi = param1 * §1t1523s0§.§1t9383s0§;
         if(controlledBy == 0)
         {
            §1t113s0§.instance.§1t5198s0§();
         }
      }
      
      public function §1t4443s0§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:int, param13:int, param14:int, param15:int) : *
      {
         this.controlledBy = param1;
         §1t3308s0§(param2);
         this.§1t3257s0§ = param3;
         this.§1t4442s0§(param4);
         this.§1t4413s0§ = param5;
         this.defense = param6;
         this.§1t4419s0§ = param7;
         this.minDamage = param8;
         this.damageRange = param9;
         this.§1t4420s0§ = param10;
         this.slashUsage = param11;
         this.§1t4421s0§ = param12;
         this.§1t4422s0§ = param13;
         this.§1t4423s0§ = param14;
         this.level = param15;
         §1t3258s0§ = false;
         §1t3260s0§ = false;
         this.§1t4431s0§ = false;
         this.§1t4405s0§ = false;
         this.§1t4406s0§ = false;
         this.§1t4407s0§ = false;
         this.§1t4403s0§.length = 0;
         this.§1t4404s0§.length = 0;
         §1t3243s0§ = 4;
         if(param1 == 0)
         {
            if(§1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9453s0§))
            {
               this.minDamage *= 1.5;
            }
            else if(§1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9454s0§))
            {
               this.defense *= 1.5;
            }
            else if(§1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9463s0§))
            {
               this.minDamage *= 0.5;
               this.defense *= 0.5;
               this.§1t4420s0§ *= 0.5;
            }
            §1t1525s0§.§1t9941s0§().§1t5199s0§(param3,param5);
            §1t1525s0§.§1t9941s0§().§1t5201s0§(§1t3309s0§(),param3);
            §1t1525s0§.§1t9941s0§().§1t5202s0§(this.§1t4441s0§(),param5);
            this.§1t3489s0§(§1t1523s0§.stance);
            this.§1t4431s0§ = §1t1523s0§.§1t4431s0§;
            this.nid = §1t251s0§.instance.nid;
            if(§1t1523s0§.§1t9479s0§ == §1t251s0§.§1t12141s0§)
            {
               §1t3261s0§ = false;
               §1t3262s0§ = false;
               §1t3263s0§ = false;
               §1t3264s0§ = false;
               §1t3265s0§ = false;
            }
            else
            {
               §1t3261s0§ = true;
               §1t3262s0§ = true;
               §1t3263s0§ = true;
               §1t3264s0§ = true;
               §1t3265s0§ = true;
            }
         }
         this.§1t3269s0§(§1t11141s0§);
         this.§1t4415s0§ = 8 * 24;
         this.§1t4414s0§ = 0;
         this.§1t4436s0§ = 0;
         §1t3246s0§ = 0;
         this.§1t4438s0§ = 0;
         if(param1 == 0)
         {
            §1t1525s0§.§1t9941s0§().§1t5205s0§(this.§1t4414s0§,this.§1t4415s0§);
         }
         mcs.§1t6287s0§(§1t1523s0§.charname,16763904);
         this.§1t4482s0§();
      }
      
      public function §1t4444s0§() : *
      {
         if(§1t1540s0§.§1t10047s0§() && !§1t251s0§.instance.§1t3612s0§() || §1t1540s0§.§1t10048s0§())
         {
            this.§1t4440s0§ = §1t12234s0§;
            §1t1560s0§();
         }
      }
      
      public function §1t4445s0§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int = 0, param7:int = 0) : *
      {
         this.§1t4424s0§ = param1;
         this.§1t1235s0§ = param2;
         this.§1t1236s0§ = param3;
         this.§1t1237s0§ = param4;
         this.§1t1238s0§ = param5;
         this.§1t1243s0§ = param6;
         this.§1t1244s0§ = param7;
      }
      
      public function §1t4446s0§(param1:int, param2:int, param3:int, param4:int) : *
      {
         this.§1t1239s0§ = param1;
         this.§1t1240s0§ = param2;
         this.§1t1241s0§ = param3;
         this.§1t1242s0§ = param4;
      }
      
      override public function §1t3267s0§() : *
      {
         §1t3255s0§ = true;
         target = §1t1543s0§.§1t10231s0§(§1t1555s0§(),!§1t3255s0§);
         controlledBy = 3;
      }
      
      public function §1t4447s0§(param1:Boolean) : *
      {
         if(controlledBy == 2)
         {
            §1t3255s0§ = param1;
         }
      }
      
      internal function §1t4448s0§(param1:String) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:§1t67s0§ = null;
         var _loc6_:§1t67s0§ = null;
         var _loc7_:int = 0;
         var _loc8_:§1t8334s0§ = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         switch(param1)
         {
            case §1t10263s0§:
            case §1t10261s0§:
               if(!§1t1525s0§.§1t9952s0§())
               {
                  if(controlledBy == 0)
                  {
                     §1t1557s0§(§1t10265s0§);
                  }
                  else
                  {
                     this.§1t3269s0§(§1t11141s0§);
                  }
               }
               break;
            case §1t10265s0§:
               this.§1t3269s0§(§1t11141s0§);
               break;
            case §1t10951s0§:
               §1t1557s0§(§1t10953s0§);
               break;
            case §1t10959s0§:
               §1t1557s0§(§1t10961s0§);
               break;
            case §1t10967s0§:
               §1t1557s0§(§1t10969s0§);
               break;
            case §1t10993s0§:
               §1t1557s0§(§1t10995s0§);
               break;
            case §1t11001s0§:
               §1t1557s0§(§1t11003s0§);
               break;
            case §1t11009s0§:
               §1t1557s0§(§1t11011s0§);
               break;
            case §1t11035s0§:
               §1t1557s0§(§1t11037s0§);
               break;
            case §1t11043s0§:
               §1t1557s0§(§1t11045s0§);
               break;
            case §1t11051s0§:
               §1t1557s0§(§1t11053s0§);
               break;
            case §1t11077s0§:
               §1t1557s0§(§1t11079s0§);
               break;
            case §1t11085s0§:
               §1t1557s0§(§1t11087s0§);
               break;
            case §1t11093s0§:
               §1t1557s0§(§1t11095s0§);
               break;
            case §1t11119s0§:
               §1t1557s0§(§1t11121s0§);
               break;
            case §1t10981s0§:
               if(this.§1t4412s0§ == §1t12226s0§)
               {
                  §1t1557s0§(§1t10977s0§);
                  mcs.y = this.§1t4403s0§[0].y + 90;
               }
               else if(this.§1t4412s0§ == §1t12228s0§)
               {
                  §1t1557s0§(§1t10983s0§);
               }
               break;
            case §1t11023s0§:
               if(this.§1t4412s0§ == §1t12226s0§)
               {
                  §1t1557s0§(§1t11017s0§);
                  mcs.y = this.§1t4403s0§[0].y + 90;
               }
               else if(this.§1t4412s0§ == §1t12228s0§)
               {
                  §1t1557s0§(§1t11025s0§);
               }
               break;
            case §1t11065s0§:
               if(this.§1t4412s0§ == §1t12226s0§)
               {
                  §1t1557s0§(§1t11059s0§);
                  mcs.y = this.§1t4403s0§[0].y + 90;
               }
               else if(this.§1t4412s0§ == §1t12228s0§)
               {
                  §1t1557s0§(§1t11067s0§);
               }
               break;
            case §1t11107s0§:
               if(this.§1t4412s0§ == §1t12226s0§)
               {
                  §1t1557s0§(§1t11101s0§);
                  mcs.y = this.§1t4403s0§[0].y + 90;
               }
               else if(this.§1t4412s0§ == §1t12228s0§)
               {
                  §1t1557s0§(§1t11109s0§);
               }
               break;
            case §1t11133s0§:
               if(this.§1t4412s0§ == §1t12226s0§)
               {
                  §1t1557s0§(§1t11127s0§);
                  mcs.y = this.§1t4403s0§[0].y + 90;
               }
               else if(this.§1t4412s0§ == §1t12228s0§)
               {
                  §1t1557s0§(§1t11135s0§);
               }
               break;
            case §1t10975s0§:
               §1t1557s0§(§1t10977s0§);
               break;
            case §1t11017s0§:
               §1t1557s0§(§1t11019s0§);
               break;
            case §1t11059s0§:
               §1t1557s0§(§1t11061s0§);
               break;
            case §1t11101s0§:
               §1t1557s0§(§1t11103s0§);
               break;
            case §1t11127s0§:
               §1t1557s0§(§1t11129s0§);
               break;
            case §1t10955s0§:
               §1t1557s0§(§1t10957s0§);
               break;
            case §1t10963s0§:
               §1t1557s0§(§1t10965s0§);
               break;
            case §1t10971s0§:
               §1t1557s0§(§1t10973s0§);
               break;
            case §1t10997s0§:
               §1t1557s0§(§1t10999s0§);
               break;
            case §1t11005s0§:
               §1t1557s0§(§1t11007s0§);
               break;
            case §1t11013s0§:
               §1t1557s0§(§1t11015s0§);
               break;
            case §1t11039s0§:
               §1t1557s0§(§1t11041s0§);
               break;
            case §1t11047s0§:
               §1t1557s0§(§1t11049s0§);
               break;
            case §1t11055s0§:
               §1t1557s0§(§1t11057s0§);
               break;
            case §1t11081s0§:
               §1t1557s0§(§1t11083s0§);
               break;
            case §1t11089s0§:
               §1t1557s0§(§1t11091s0§);
               break;
            case §1t11097s0§:
               §1t1557s0§(§1t11099s0§);
               break;
            case §1t11123s0§:
               §1t1557s0§(§1t11125s0§);
               break;
            case §1t10957s0§:
            case §1t10965s0§:
            case §1t10973s0§:
            case §1t10999s0§:
            case §1t11007s0§:
            case §1t11015s0§:
            case §1t11041s0§:
            case §1t11049s0§:
            case §1t11057s0§:
            case §1t11083s0§:
            case §1t11091s0§:
            case §1t11099s0§:
            case §1t11125s0§:
            case §1t10987s0§:
            case §1t11029s0§:
            case §1t11071s0§:
            case §1t11113s0§:
            case §1t11139s0§:
            case §1t10979s0§:
            case §1t11021s0§:
            case §1t11063s0§:
            case §1t11105s0§:
            case §1t11131s0§:
               if(actionState != §1t11154s0§ && §1t1525s0§.§1t9952s0§())
               {
                  this.§1t3269s0§(§1t11154s0§);
               }
               else if(actionState != §1t11154s0§)
               {
                  §1t1557s0§(§1t10261s0§);
               }
               break;
            case §1t10313s0§:
               if(actionState != §1t11154s0§)
               {
                  _loc6_ = new §1t67s0§(this.§1t4476s0§() * 2,level);
                  _loc6_.§1t1089s0§(this);
                  _loc6_.§1t1072s0§(this.§1t1244s0§);
                  if(controlledBy == 0)
                  {
                     §1t1543s0§.§1t10234s0§(mcs.§1t6231s0§[§1t75s0§.§1t12380s0§],_loc6_);
                  }
                  else if(controlledBy == 1 || controlledBy == 3)
                  {
                     target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12380s0§],_loc6_);
                  }
                  this.§1t4478s0§();
                  if(§1t1525s0§.§1t9952s0§())
                  {
                     this.§1t3269s0§(§1t11154s0§);
                  }
                  else
                  {
                     §1t1557s0§(§1t10315s0§);
                  }
               }
               break;
            case §1t10315s0§:
               this.§1t4462s0§();
               break;
            case §1t10287s0§:
            case §1t10409s0§:
            case §1t10291s0§:
            case §1t10289s0§:
            case §1t10413s0§:
            case §1t10411s0§:
            case §1t10417s0§:
            case §1t10419s0§:
            case §1t10361s0§:
            case §1t10363s0§:
               if(controlledBy == 0)
               {
                  §1t3260s0§ = true;
                  break;
               }
               §1t3299s0§();
               return true;
               break;
            case §1t10307s0§:
               this.§1t3269s0§(§1t11152s0§);
               break;
            case §1t10896s0§:
               §1t1557s0§(§1t10309s0§);
               break;
            case §1t10899s0§:
               actionState = §1t11152s0§;
               if(this.§1t4427s0§ && !§1t1540s0§.§1t9550s0§())
               {
                  §1t1557s0§(§1t10317s0§);
               }
               else
               {
                  §1t1557s0§(§1t10297s0§);
               }
               if(§1t1559s0§().§1t6283s0§())
               {
                  this.§1t4468s0§(410);
               }
               else
               {
                  this.§1t4468s0§(-410);
               }
               break;
            case §1t10309s0§:
               if(§1t1559s0§().§1t6283s0§())
               {
                  this.§1t4468s0§(-40);
               }
               else
               {
                  this.§1t4468s0§(40);
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
                  if(controlledBy != 0)
                  {
                     return true;
                  }
               }
               else
               {
                  if(controlledBy != 0)
                  {
                     if(§1t3309s0§() > 0 && !§1t1525s0§.§1t9952s0§())
                     {
                        mcs.§1t6279s0§();
                     }
                     mcs.§1t6281s0§(-100);
                  }
                  if(this.§1t4427s0§ && !§1t1540s0§.§1t9550s0§())
                  {
                     §1t1557s0§(§1t10317s0§);
                     if(controlledBy != 0)
                     {
                        mcs.§1t6280s0§();
                     }
                  }
                  else if(actionState == §1t11172s0§)
                  {
                     §1t1557s0§(§1t10301s0§);
                  }
                  else
                  {
                     §1t1557s0§(§1t10297s0§);
                  }
               }
               break;
            case §1t10297s0§:
               §1t1557s0§(§1t10301s0§);
               break;
            case §1t10299s0§:
            case §1t10301s0§:
               if(controlledBy != 0)
               {
                  mcs.§1t6281s0§(0);
                  mcs.§1t6279s0§();
               }
               else if(!§1t1525s0§.§1t9952s0§())
               {
                  mcs.§1t6286s0§(true);
               }
               if(§1t1559s0§().§1t6283s0§())
               {
                  this.§1t4468s0§(-120);
               }
               else
               {
                  this.§1t4468s0§(120);
               }
               this.§1t3269s0§(§1t11141s0§);
               break;
            case §1t9125s0§:
               if(§1t1559s0§().§1t6283s0§())
               {
                  this.§1t4468s0§(-110);
               }
               else
               {
                  this.§1t4468s0§(110);
               }
               if(posX < 0)
               {
                  this.§1t4468s0§(posX + 50);
               }
               else if(posX > §1t1525s0§.§1t8124s0§())
               {
                  this.§1t4468s0§(posX - §1t1525s0§.§1t8124s0§() - 50);
               }
               if(controlledBy != 0)
               {
                  if(!§1t1525s0§.§1t9952s0§())
                  {
                     mcs.§1t6279s0§();
                  }
               }
               else if(!§1t1525s0§.§1t9952s0§())
               {
                  mcs.§1t6286s0§(true);
               }
               this.§1t3269s0§(§1t11141s0§);
               break;
            case §1t10317s0§:
               if(controlledBy != 0)
               {
                  if(!§1t1525s0§.§1t9952s0§())
                  {
                     mcs.§1t6279s0§();
                  }
                  mcs.§1t6281s0§(0);
               }
               this.§1t3269s0§(§1t11141s0§);
               break;
            case §1t10339s0§:
            case §1t10343s0§:
            case §1t10345s0§:
            case §1t10447s0§:
            case §1t10329s0§:
            case §1t10335s0§:
            case §1t10893s0§:
            case §1t10923s0§:
            case §1t9121s0§:
            case §1t10371s0§:
            case §1t10373s0§:
            case §1t10333s0§:
            case §1t10825s0§:
            case §1t10857s0§:
            case §1t10943s0§:
               this.§1t3269s0§(§1t11141s0§);
               break;
            case §1t10357s0§:
               _loc2_ = §1t3309s0§() - 1;
               if(§1t1540s0§.§1t9550s0§())
               {
                  §1t1557s0§(§1t10359s0§);
                  if(controlledBy == 0)
                  {
                     §1t1523s0§.§1t9712s0§(0,1);
                     §1t406s0§.instance.§1t6578s0§();
                     §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc2_.toString(),0);
                  }
                  else if(_loc2_ > 0)
                  {
                     §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc2_.toString(),10027008);
                     mcs.§1t3301s0§(§1t3309s0§() / §1t3257s0§);
                  }
               }
               else
               {
                  §1t3308s0§(1);
                  mcs.§1t3301s0§(§1t3309s0§() / §1t3257s0§);
                  if(controlledBy == 0)
                  {
                     §1t1525s0§.§1t9941s0§().§1t5201s0§(§1t3309s0§(),§1t3257s0§);
                     §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc2_.toString(),0);
                  }
                  else if(_loc2_ > 0)
                  {
                     §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc2_.toString(),10027008);
                     mcs.§1t3301s0§(§1t3309s0§() / §1t3257s0§);
                  }
               }
               break;
            case §1t10359s0§:
               if(!§1t1540s0§.§1t9550s0§())
               {
                  §1t1557s0§(§1t10361s0§);
               }
               break;
            case §1t10421s0§:
            case §1t10423s0§:
               this.§1t3291s0§();
               break;
            case §1t10337s0§:
               §1t1557s0§(§1t10339s0§);
               break;
            case §1t10441s0§:
               if(actionState == §1t11160s0§ || actionState == §1t11164s0§)
               {
                  §1t88s0§.instance.§1t1516s0§("Snd_smokebomb");
                  §1t1712s0§.§1t4535s0§(§1t1555s0§(),§1t1559s0§().y);
                  if(§1t1559s0§().§1t6283s0§())
                  {
                     this.§1t4468s0§(400);
                  }
                  else
                  {
                     this.§1t4468s0§(-400);
                  }
                  if(controlledBy == 0)
                  {
                     §1t1525s0§.§1t9951s0§();
                  }
                  §1t1712s0§.§1t4535s0§(§1t1555s0§(),§1t1559s0§().y);
                  this.§1t3269s0§(§1t11146s0§);
                  this.§1t4438s0§ = 0;
               }
               else if(actionState == §1t11185s0§)
               {
                  §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11305s0§,§1t1555s0§(),§1t1559s0§().y,0,0,0,this.§1t4491s0§(§1t120s0§.§1t10159s0§),this);
                  this.§1t3269s0§(§1t11141s0§);
               }
               break;
            case §1t10831s0§:
               §1t1557s0§(§1t10833s0§);
               if(§1t1235s0§ == 0)
               {
                  §1t88s0§.instance.§1t1512s0§();
               }
               else if(actionState == §1t11199s0§)
               {
                  if(§1t1559s0§().§1t6283s0§())
                  {
                     §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11278s0§,§1t1555s0§() + 25,§1t1559s0§().y - 65,1,0,§1t1235s0§,this.§1t4491s0§(§1t120s0§.§1t10133s0§),this);
                  }
                  else
                  {
                     §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11278s0§,§1t1555s0§() - 25,§1t1559s0§().y - 65,-1,0,§1t1235s0§,this.§1t4491s0§(§1t120s0§.§1t10133s0§),this);
                  }
               }
               else if(actionState == §1t11201s0§)
               {
                  if(§1t1559s0§().§1t6283s0§())
                  {
                     §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11315s0§,§1t1555s0§() + 25,§1t1559s0§().y - 65,1,0,§1t1235s0§,this.§1t4491s0§(§1t120s0§.§1t10169s0§),this);
                  }
                  else
                  {
                     §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11315s0§,§1t1555s0§() - 25,§1t1559s0§().y - 65,-1,0,§1t1235s0§,this.§1t4491s0§(§1t120s0§.§1t10169s0§),this);
                  }
               }
               break;
            case §1t10833s0§:
               this.§1t3269s0§(§1t11141s0§);
               break;
            case §1t10851s0§:
               if(actionState == §1t11177s0§)
               {
                  if(§1t1238s0§ == 0)
                  {
                     §1t88s0§.instance.§1t1512s0§();
                  }
                  else if(§1t1559s0§().§1t6283s0§())
                  {
                     §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11289s0§,§1t1555s0§() + 40,§1t1559s0§().y,0,0,§1t1238s0§,this.§1t4491s0§(§1t120s0§.§1t10143s0§),this);
                  }
                  else
                  {
                     §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11289s0§,§1t1555s0§() - 40,§1t1559s0§().y,0,0,§1t1238s0§,this.§1t4491s0§(§1t120s0§.§1t10143s0§),this);
                  }
               }
               else if(actionState == §1t11178s0§)
               {
                  if(§1t1559s0§().§1t6283s0§())
                  {
                     §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11295s0§,§1t1555s0§() + 40,§1t1559s0§().y,0,0,0,this.§1t4491s0§(§1t120s0§.§1t10152s0§),this);
                  }
                  else
                  {
                     §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11295s0§,§1t1555s0§() - 40,§1t1559s0§().y,0,0,0,this.§1t4491s0§(§1t120s0§.§1t10152s0§),this);
                  }
               }
               §1t1557s0§(§1t10853s0§);
               break;
            case §1t10853s0§:
               this.§1t3269s0§(§1t11141s0§);
               break;
            case §1t10835s0§:
               if(§1t1237s0§ == 0)
               {
                  §1t88s0§.instance.§1t1512s0§();
               }
               else if(§1t1559s0§().§1t6283s0§())
               {
                  §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11291s0§,§1t1555s0§() + 50,§1t1559s0§().y,1,0,§1t1237s0§,this.§1t4491s0§(§1t120s0§.§1t10145s0§),this);
               }
               else
               {
                  §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11291s0§,§1t1555s0§() - 50,§1t1559s0§().y,-1,0,§1t1237s0§,this.§1t4491s0§(§1t120s0§.§1t10145s0§),this);
               }
               §1t1557s0§(§1t10837s0§);
               break;
            case §1t10837s0§:
               this.§1t3269s0§(§1t11141s0§);
               break;
            case §1t10839s0§:
               if(§1t1236s0§ == 0)
               {
                  §1t88s0§.instance.§1t1512s0§();
               }
               else if(§1t1559s0§().§1t6283s0§())
               {
                  §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11290s0§,§1t1555s0§() + 20,§1t1559s0§().y - 60,1,0,§1t1236s0§,this.§1t4491s0§(§1t120s0§.§1t10144s0§),this);
               }
               else
               {
                  §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11290s0§,§1t1555s0§() - 20,§1t1559s0§().y - 60,-1,0,§1t1236s0§,this.§1t4491s0§(§1t120s0§.§1t10144s0§),this);
               }
               §1t1557s0§(§1t10841s0§);
               break;
            case §1t10841s0§:
               if(§1t1236s0§ > 0)
               {
                  if(§1t1559s0§().§1t6283s0§())
                  {
                     §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11290s0§,§1t1555s0§() + 20,§1t1559s0§().y - 60,1,0,§1t1236s0§,this.§1t4491s0§(§1t120s0§.§1t10144s0§),this);
                  }
                  else
                  {
                     §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11290s0§,§1t1555s0§() - 20,§1t1559s0§().y - 60,-1,0,§1t1236s0§,this.§1t4491s0§(§1t120s0§.§1t10144s0§),this);
                  }
               }
               §1t1557s0§(§1t10843s0§);
               break;
            case §1t10843s0§:
               if(§1t1236s0§ > 0)
               {
                  if(§1t1559s0§().§1t6283s0§())
                  {
                     §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11290s0§,§1t1555s0§() + 30,§1t1559s0§().y - 50,1,0,§1t1236s0§,this.§1t4491s0§(§1t120s0§.§1t10144s0§),this);
                  }
                  else
                  {
                     §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11290s0§,§1t1555s0§() - 30,§1t1559s0§().y - 50,-1,0,§1t1236s0§,this.§1t4491s0§(§1t120s0§.§1t10144s0§),this);
                  }
               }
               §1t1557s0§(§1t10845s0§);
               break;
            case §1t10845s0§:
               this.§1t3269s0§(§1t11141s0§);
               break;
            case §1t10903s0§:
               if(§1t1559s0§().§1t6283s0§())
               {
                  §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11302s0§,§1t1555s0§() + 50,§1t1559s0§().y,0,0,this.§1t4476s0§() * this.§1t4492s0§() / 2,level,this);
               }
               else
               {
                  §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11302s0§,§1t1555s0§() - 50,§1t1559s0§().y,-1,0,this.§1t4476s0§() * this.§1t4492s0§() / 2,level,this);
               }
               §1t1557s0§(§1t10905s0§);
               actionState = §1t11150s0§;
               this.§1t4432s0§ = 0;
               §1t1525s0§.§1t9960s0§(12);
               break;
            case §1t10905s0§:
               §1t1557s0§(§1t10263s0§);
               break;
            case §1t10861s0§:
               §1t1557s0§(§1t10863s0§);
               this.§1t4433s0§ = new §1t8358s0§();
               §1t1559s0§().addChild(this.§1t4433s0§);
               break;
            case §1t10863s0§:
               §1t1557s0§(§1t10865s0§);
               if(this.§1t4433s0§ != null)
               {
                  this.§1t4433s0§.§1t8113s0§();
                  this.§1t4433s0§ = null;
               }
               break;
            case §1t10865s0§:
               §1t1557s0§(§1t10869s0§);
               actionState = §1t11150s0§;
               this.§1t4432s0§ = 0;
               break;
            case §1t10869s0§:
               §1t1557s0§(§1t10263s0§);
               break;
            case §1t10891s0§:
               §1t1557s0§(§1t10893s0§);
               break;
            case §1t10921s0§:
               §1t1557s0§(§1t10923s0§);
               break;
            case §1t10823s0§:
               if(actionState == §1t11204s0§)
               {
                  §1t1525s0§.§1t9960s0§(24);
                  _loc7_ = 100;
                  if(!mcs.§1t6283s0§())
                  {
                     _loc7_ = -_loc7_;
                  }
                  _loc3_ = §1t1555s0§() + _loc7_;
                  _loc10_ = 1;
                  while(_loc10_ < 6)
                  {
                     _loc9_ = -30 - _loc10_;
                     _loc8_ = §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11318s0§,§1t1555s0§() + _loc7_ * _loc10_,§1t1559s0§().y,0,_loc9_,§1t1238s0§,1,this) as §1t8334s0§;
                     _loc8_.setDelay((_loc10_ - 1) * 3);
                     _loc10_++;
                  }
               }
               else if(actionState == §1t11202s0§)
               {
                  if(§1t1559s0§().§1t6283s0§())
                  {
                     _loc3_ = §1t1555s0§() + 20;
                     _loc4_ = 1;
                  }
                  else
                  {
                     _loc3_ = §1t1555s0§() - 20;
                     _loc4_ = -1;
                  }
                  §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11317s0§,_loc3_,§1t1559s0§().y,_loc4_,0,§1t1237s0§,1,this);
               }
               else if(actionState == §1t11203s0§)
               {
                  if(§1t1559s0§().§1t6283s0§())
                  {
                     _loc3_ = §1t1555s0§() + 50;
                     _loc4_ = 15;
                  }
                  else
                  {
                     _loc3_ = §1t1555s0§() - 50;
                     _loc4_ = -15;
                  }
                  §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11316s0§,_loc3_,§1t1559s0§().y,_loc4_,0,§1t1236s0§,1,this);
               }
               §1t1557s0§(§1t10825s0§);
               break;
            case §1t10883s0§:
               §1t1557s0§(§1t10885s0§);
               break;
            case §1t10885s0§:
               §1t1557s0§(§1t10887s0§);
               break;
            case §1t10887s0§:
               §1t1557s0§(§1t10889s0§);
               _loc5_ = new §1t67s0§(0,0,§1t67s0§.§1t9123s0§);
               _loc5_.§1t1089s0§(this);
               if(§1t1559s0§().§1t6283s0§())
               {
                  _loc5_.§1t1084s0§(25,-10);
               }
               else
               {
                  _loc5_.§1t1084s0§(-25,-10);
               }
               if(controlledBy == 0)
               {
                  §1t1543s0§.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12395s0§],_loc5_,100,true,mcs);
               }
               else if(controlledBy == 1)
               {
                  target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12395s0§],_loc5_);
               }
               break;
            case §1t10889s0§:
               this.§1t3269s0§(§1t11141s0§);
               break;
            case §1t10909s0§:
               actionState = §1t11150s0§;
               break;
            case §1t10323s0§:
               §1t1557s0§(§1t10325s0§);
               actionState = §1t11150s0§;
               if(this.§1t4433s0§ != null)
               {
                  this.§1t4433s0§.§1t8113s0§();
                  this.§1t4433s0§ = null;
               }
               break;
            case §1t10319s0§:
               §1t1557s0§(§1t10321s0§);
               actionState = §1t11150s0§;
               if(this.§1t4433s0§ != null)
               {
                  this.§1t4433s0§.§1t8113s0§();
                  this.§1t4433s0§ = null;
               }
               break;
            case §1t10325s0§:
            case §1t10321s0§:
               this.§1t3269s0§(§1t11141s0§);
               break;
            case §1t10925s0§:
               if(actionState == §1t11186s0§)
               {
                  if(controlledBy == 0 || controlledBy == 3)
                  {
                     §1t1559s0§().alpha = 0.5;
                  }
                  else
                  {
                     §1t1559s0§().visible = false;
                  }
                  _loc11_ = this.§1t4491s0§(§1t120s0§.§1t10161s0§);
                  if(_loc11_ == 1)
                  {
                     this.§1t4434s0§ = 24 * 10;
                  }
                  else if(_loc11_ == 2)
                  {
                     this.§1t4434s0§ = 24 * 15;
                  }
                  else if(_loc11_ == 3)
                  {
                     this.§1t4434s0§ = 24 * 20;
                  }
                  §1t1712s0§.§1t11333s0§(§1t1555s0§(),§1t1559s0§().y);
               }
               §1t1557s0§(§1t10927s0§);
               break;
            case §1t10927s0§:
               this.§1t3269s0§(§1t11141s0§);
               break;
            case §1t10929s0§:
               §1t1557s0§(§1t10931s0§);
               break;
            case §1t10931s0§:
               §1t1557s0§(§1t10933s0§);
               if(§1t1559s0§().§1t6283s0§())
               {
                  §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11289s0§,§1t1555s0§() + 30,§1t1559s0§().y + 15,0,0,0,1,this);
               }
               else
               {
                  §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11289s0§,§1t1555s0§() - 30,§1t1559s0§().y + 15,0,0,0,1,this);
               }
               _loc6_ = new §1t67s0§(this.§1t4476s0§() * 2,level);
               _loc6_.§1t1089s0§(this);
               _loc6_.§1t1072s0§(this.§1t1244s0§);
               if(controlledBy == 0)
               {
                  §1t1543s0§.§1t10234s0§(mcs.§1t6231s0§[§1t75s0§.§1t12380s0§],_loc6_);
               }
               else if(controlledBy == 1)
               {
                  target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12380s0§],_loc6_);
               }
               break;
            case §1t10933s0§:
               §1t1557s0§(§1t10935s0§);
               break;
            case §1t10935s0§:
               this.§1t3269s0§(§1t11150s0§);
               §1t1557s0§(§1t10263s0§);
               break;
            case §1t10937s0§:
               §1t1557s0§(§1t10939s0§);
               this.§1t4433s0§ = new §1t8346s0§();
               §1t1559s0§().addChild(this.§1t4433s0§);
               break;
            case §1t10871s0§:
               §1t1557s0§(§1t10873s0§);
               this.§1t4433s0§ = new §1t8346s0§();
               §1t1559s0§().addChild(this.§1t4433s0§);
               break;
            case §1t10873s0§:
               §1t1557s0§(§1t10875s0§);
               if(this.§1t4433s0§ != null)
               {
                  this.§1t4433s0§.§1t8113s0§();
                  this.§1t4433s0§ = null;
               }
               break;
            case §1t10875s0§:
               this.§1t3269s0§(§1t11141s0§);
               break;
            case §1t10793s0§:
               §1t1559s0§().§1t6281s0§(0);
               §1t1559s0§().§1t6279s0§();
               if(mcs.§1t6283s0§())
               {
                  §1t1553s0§(-50);
               }
               else
               {
                  §1t1553s0§(50);
               }
               this.§1t3269s0§(§1t11141s0§);
               break;
            case §1t10941s0§:
               if(this.§1t4433s0§ == null)
               {
                  this.§1t4433s0§ = new §1t8352s0§();
                  §1t1559s0§().addChild(this.§1t4433s0§);
               }
               break;
            default:
               return false;
         }
         return true;
      }
      
      override public function update() : *
      {
         if(mcs == null)
         {
            return;
         }
         if(controlledBy != 0 && §1t3260s0§ && §1t3309s0§() <= 0)
         {
            return;
         }
         var _loc1_:String = mcs.§1t3268s0§();
         if(_loc1_ != "")
         {
            this.§1t4448s0§(_loc1_);
         }
         if((controlledBy == 1 || controlledBy == 3 || this.§1t4431s0§) && !§1t3258s0§ && §1t3271s0§() && !§1t1540s0§.§1t9550s0§() && !§1t251s0§.instance.§1t3515s0§)
         {
            this.§1t4501s0§();
         }
         else if(controlledBy == 0 && (§1t1540s0§.§1t10062s0§() || §1t251s0§.instance.§1t3515s0§))
         {
            this.§1t4498s0§();
         }
         this.§1t3270s0§();
         if(this.§1t4414s0§ < this.§1t4415s0§)
         {
            ++this.§1t4414s0§;
            if(controlledBy == 0)
            {
               §1t1525s0§.§1t9941s0§().§1t5205s0§(this.§1t4414s0§,this.§1t4415s0§);
            }
         }
         if(§1t3246s0§ > 0)
         {
            --§1t3246s0§;
         }
         if(this.§1t4418s0§ > 0)
         {
            --this.§1t4418s0§;
         }
         else if(this.§1t4418s0§ == 0)
         {
            this.§1t4418s0§ = -1;
            mcs.§1t6288s0§("");
         }
         if(controlledBy == 0)
         {
            mcs.§1t3302s0§().update();
         }
         if(this.§1t4434s0§ > 0)
         {
            --this.§1t4434s0§;
            if(this.§1t4434s0§ == 0)
            {
               this.§1t4494s0§();
            }
         }
         if(this.§1t4435s0§ > 0)
         {
            --this.§1t4435s0§;
            if(this.§1t4435s0§ == 0)
            {
               this.§1t4495s0§();
            }
         }
         if(this.§1t4440s0§ > 0)
         {
            --this.§1t4440s0§;
            if(this.§1t4440s0§ == 0)
            {
               this.§1t1561s0§();
            }
            else
            {
               this.§1t1562s0§();
            }
         }
      }
      
      override public function §1t3269s0§(param1:int) : *
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:§1t67s0§ = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Array = null;
         var _loc10_:§1t68s0§ = null;
         var _loc11_:§1t99s0§ = null;
         var _loc12_:String = null;
         var _loc13_:int = 0;
         _loc2_ = this.actionState;
         this.actionState = param1;
         if(param1 != _loc2_ && this.§1t4433s0§ != null)
         {
            this.§1t4433s0§.§1t8113s0§();
            this.§1t4433s0§ = null;
         }
         switch(param1)
         {
            case §1t11141s0§:
               if(!§1t1540s0§.§1t9550s0§() && !§1t1525s0§.§1t9952s0§() && §1t3309s0§() <= §1t3257s0§ / 4 || §1t1540s0§.§1t9550s0§() && controlledBy == 0 && §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9414s0§) == 0)
               {
                  §1t1557s0§(§1t10367s0§);
               }
               else
               {
                  §1t1557s0§(§1t10259s0§);
               }
               this.§1t4458s0§();
               break;
            case §1t11142s0§:
               if(this.§1t4406s0§)
               {
                  if(this.stance == §1t12220s0§)
                  {
                     §1t1557s0§(§1t10949s0§);
                  }
                  else if(this.stance == §1t12221s0§)
                  {
                     §1t1557s0§(§1t10991s0§);
                  }
                  else if(this.stance == §1t12222s0§)
                  {
                     §1t1557s0§(§1t11033s0§);
                  }
                  else if(this.stance == §1t12223s0§)
                  {
                     §1t1557s0§(§1t11075s0§);
                  }
                  else if(this.stance == §1t12224s0§)
                  {
                     §1t1557s0§(§1t11117s0§);
                  }
               }
               else
               {
                  §1t1557s0§(§1t10271s0§);
               }
               if(§1t1559s0§().y < §1t1525s0§.§1t4467s0§())
               {
                  this.§1t3269s0§(§1t11145s0§);
               }
               break;
            case §1t11143s0§:
               §1t1557s0§(§1t10269s0§);
               if(§1t1559s0§().y < §1t1525s0§.§1t4467s0§())
               {
                  this.§1t3269s0§(§1t11145s0§);
               }
               break;
            case §1t11145s0§:
               if(this.stance == §1t12220s0§)
               {
                  if(this.§1t4412s0§ == §1t12228s0§)
                  {
                     §1t1557s0§(§1t10985s0§);
                  }
                  else
                  {
                     §1t1557s0§(§1t11019s0§);
                  }
               }
               else if(this.stance == §1t12221s0§)
               {
                  if(this.§1t4412s0§ == §1t12228s0§)
                  {
                     §1t1557s0§(§1t11027s0§);
                  }
                  else
                  {
                     §1t1557s0§(§1t11019s0§);
                  }
               }
               else if(this.stance == §1t12222s0§)
               {
                  if(this.§1t4412s0§ == §1t12228s0§)
                  {
                     §1t1557s0§(§1t11069s0§);
                  }
                  else
                  {
                     §1t1557s0§(§1t11061s0§);
                  }
               }
               else if(this.stance == §1t12223s0§)
               {
                  if(this.§1t4412s0§ == §1t12228s0§)
                  {
                     §1t1557s0§(§1t11111s0§);
                  }
                  else
                  {
                     §1t1557s0§(§1t11103s0§);
                  }
               }
               else if(this.stance == §1t12224s0§)
               {
                  if(this.§1t4412s0§ == §1t12228s0§)
                  {
                     §1t1557s0§(§1t11137s0§);
                  }
                  else
                  {
                     §1t1557s0§(§1t11129s0§);
                  }
               }
               break;
            case §1t11149s0§:
               this.§1t4459s0§();
               break;
            case §1t11150s0§:
               if(this.§1t4412s0§ == §1t12231s0§)
               {
                  §1t1557s0§(§1t10261s0§);
               }
               else if(this.stance == §1t12220s0§)
               {
                  if(this.§1t4412s0§ == §1t12226s0§ || this.§1t4412s0§ == §1t12227s0§)
                  {
                     §1t1557s0§(§1t10979s0§);
                  }
                  else if(this.§1t4412s0§ == §1t12228s0§)
                  {
                     §1t1557s0§(§1t10987s0§);
                  }
                  else if(this.§1t4412s0§ == §1t12232s0§)
                  {
                     §1t1557s0§(§1t10963s0§);
                  }
                  else if(this.§1t4412s0§ == §1t12233s0§)
                  {
                     §1t1557s0§(§1t10971s0§);
                  }
                  else
                  {
                     §1t1557s0§(§1t10955s0§);
                  }
               }
               else if(this.stance == §1t12221s0§)
               {
                  if(this.§1t4412s0§ == §1t12226s0§ || this.§1t4412s0§ == §1t12227s0§)
                  {
                     §1t1557s0§(§1t11021s0§);
                  }
                  else if(this.§1t4412s0§ == §1t12228s0§)
                  {
                     §1t1557s0§(§1t11029s0§);
                  }
                  else if(this.§1t4412s0§ == §1t12232s0§)
                  {
                     §1t1557s0§(§1t11005s0§);
                  }
                  else if(this.§1t4412s0§ == §1t12233s0§)
                  {
                     §1t1557s0§(§1t11013s0§);
                  }
                  else
                  {
                     §1t1557s0§(§1t10997s0§);
                  }
               }
               else if(this.stance == §1t12222s0§)
               {
                  if(this.§1t4412s0§ == §1t12226s0§ || this.§1t4412s0§ == §1t12227s0§)
                  {
                     §1t1557s0§(§1t11063s0§);
                  }
                  else if(this.§1t4412s0§ == §1t12228s0§)
                  {
                     §1t1557s0§(§1t11071s0§);
                  }
                  else if(this.§1t4412s0§ == §1t12232s0§)
                  {
                     §1t1557s0§(§1t11047s0§);
                  }
                  else if(this.§1t4412s0§ == §1t12233s0§)
                  {
                     §1t1557s0§(§1t11055s0§);
                  }
                  else
                  {
                     §1t1557s0§(§1t11039s0§);
                  }
               }
               else if(this.stance == §1t12223s0§)
               {
                  if(this.§1t4412s0§ == §1t12226s0§ || this.§1t4412s0§ == §1t12227s0§)
                  {
                     §1t1557s0§(§1t11105s0§);
                  }
                  else if(this.§1t4412s0§ == §1t12228s0§)
                  {
                     §1t1557s0§(§1t11113s0§);
                  }
                  else if(this.§1t4412s0§ == §1t12232s0§)
                  {
                     §1t1557s0§(§1t11089s0§);
                  }
                  else if(this.§1t4412s0§ == §1t12233s0§)
                  {
                     §1t1557s0§(§1t11097s0§);
                  }
                  else
                  {
                     §1t1557s0§(§1t11081s0§);
                  }
               }
               else if(this.stance == §1t12224s0§)
               {
                  if(this.§1t4412s0§ == §1t12226s0§ || this.§1t4412s0§ == §1t12227s0§)
                  {
                     §1t1557s0§(§1t11131s0§);
                  }
                  else if(this.§1t4412s0§ == §1t12228s0§)
                  {
                     §1t1557s0§(§1t11139s0§);
                  }
                  else
                  {
                     §1t1557s0§(§1t11123s0§);
                  }
               }
               this.§1t4458s0§();
               break;
            case §1t11154s0§:
               if(mcs.animation == §1t10313s0§)
               {
                  §1t3246s0§ = 24;
               }
               else if(controlledBy == 0)
               {
                  §1t3246s0§ = 84;
               }
               else
               {
                  §1t3246s0§ = 12;
               }
               break;
            case §1t11147s0§:
               §1t1557s0§(§1t10403s0§);
               break;
            case §1t11172s0§:
            case §1t11152s0§:
               §1t1557s0§(§1t10295s0§);
               break;
            case §1t11161s0§:
               §1t1557s0§(§1t10337s0§);
               break;
            case §1t11144s0§:
               §1t1557s0§(§1t10341s0§);
               velY = -30;
               break;
            case §1t11146s0§:
               §1t1557s0§(§1t10343s0§);
               velY = 0;
               break;
            case §1t11160s0§:
               §1t1557s0§(§1t10441s0§);
               break;
            case §1t11164s0§:
               if(_loc2_ == §1t11152s0§ || _loc2_ == §1t11172s0§ || _loc2_ == §1t11147s0§ || _loc2_ == §1t11173s0§ || _loc2_ == §1t11145s0§ || _loc2_ == §1t11147s0§ || _loc2_ == §1t11144s0§ || _loc2_ == §1t11190s0§)
               {
                  §1t1712s0§.§1t11333s0§(§1t1555s0§(),§1t1559s0§().y);
                  if(§1t1559s0§().y < §1t1525s0§.§1t4467s0§() - 100)
                  {
                     if(§1t1559s0§().§1t6283s0§())
                     {
                        this.§1t4468s0§(100);
                     }
                     else
                     {
                        this.§1t4468s0§(-100);
                     }
                     §1t1559s0§().y = §1t1525s0§.§1t4467s0§();
                     this.§1t3269s0§(§1t11146s0§);
                     §1t1525s0§.§1t9951s0§();
                     §1t1712s0§.§1t11332s0§(§1t1555s0§(),§1t1559s0§().y);
                     this.§1t4438s0§ = 0;
                  }
                  else
                  {
                     if(§1t1559s0§().§1t6283s0§())
                     {
                        this.§1t4468s0§(100);
                     }
                     else
                     {
                        this.§1t4468s0§(-100);
                     }
                     if(§1t1559s0§().§1t6283s0§())
                     {
                        velX = 3;
                     }
                     velX = -3;
                     §1t1559s0§().y = §1t1559s0§().y - 250;
                     velY = 0;
                     this.§1t3269s0§(§1t11145s0§);
                     §1t1525s0§.§1t9951s0§();
                     §1t1712s0§.§1t11332s0§(§1t1555s0§(),§1t1559s0§().y);
                     this.§1t4438s0§ = 5;
                  }
                  if((_loc2_ == §1t11152s0§ || _loc2_ == §1t11172s0§ || _loc2_ == §1t11173s0§) && controlledBy != 0)
                  {
                     if(!§1t1525s0§.§1t9952s0§())
                     {
                        mcs.§1t6279s0§();
                     }
                     mcs.§1t6281s0§(0);
                  }
               }
               else
               {
                  §1t1557s0§(§1t10441s0§);
                  this.§1t4438s0§ = 0;
               }
               break;
            case §1t11176s0§:
               §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11276s0§,§1t1555s0§(),§1t1559s0§().y,0,0,0,0,this);
               if(§1t1559s0§().y < §1t1525s0§.§1t4467s0§() - 100)
               {
                  if(§1t1559s0§().§1t6283s0§())
                  {
                     this.§1t4468s0§(100);
                  }
                  else
                  {
                     this.§1t4468s0§(-100);
                  }
                  §1t1559s0§().y = §1t1525s0§.§1t4467s0§();
                  this.§1t3269s0§(§1t11146s0§);
                  §1t1525s0§.§1t9951s0§();
                  §1t1712s0§.§1t11332s0§(§1t1555s0§(),§1t1559s0§().y);
                  this.§1t4438s0§ = 0;
               }
               else
               {
                  §1t1559s0§().y = §1t1525s0§.§1t4467s0§();
                  if(§1t1559s0§().§1t6283s0§())
                  {
                     this.§1t4468s0§(400);
                  }
                  else
                  {
                     this.§1t4468s0§(-400);
                  }
                  this.§1t3269s0§(§1t11146s0§);
                  §1t1525s0§.§1t9951s0§();
                  §1t1712s0§.§1t11332s0§(§1t1555s0§(),§1t1559s0§().y);
                  this.§1t4438s0§ = 0;
               }
               break;
            case §1t11166s0§:
               if(§1t1559s0§().§1t6283s0§())
               {
                  velX = 2;
               }
               else
               {
                  velX = -2;
               }
               break;
            case §1t11183s0§:
               _loc5_ = this.§1t4491s0§(§1t120s0§.§1t10151s0§);
               if(_loc5_ == 1)
               {
                  _loc4_ = 20;
               }
               else if(_loc5_ == 2)
               {
                  _loc4_ = 35;
               }
               else if(_loc5_ == 3)
               {
                  _loc4_ = 50;
               }
               _loc6_ = new §1t67s0§(0,_loc4_,§1t67s0§.§1t9121s0§);
               _loc6_.§1t1089s0§(this);
               _loc6_.§1t1084s0§(§1t1555s0§(),§1t1559s0§().y);
               if(controlledBy == 0)
               {
                  _loc9_ = §1t1543s0§.§1t10233s0§(§1t1559s0§(),true);
                  if(_loc9_.length > 0)
                  {
                     _loc10_ = _loc9_[0];
                     if(_loc10_.§1t1555s0§() > §1t1555s0§())
                     {
                        §1t1559s0§().§1t5493s0§();
                     }
                     else
                     {
                        §1t1559s0§().§1t5492s0§();
                     }
                     if(_loc10_.§1t3264s0§ && _loc10_ is §1t99s0§ && !_loc10_.§1t3292s0§())
                     {
                        _loc11_ = §1t99s0§(_loc10_);
                        if(!_loc11_.§1t4512s0§())
                        {
                           if(_loc11_.§1t4441s0§() < _loc4_)
                           {
                              _loc4_ = _loc11_.§1t4441s0§();
                           }
                           this.§1t4442s0§(this.§1t4441s0§() + _loc4_);
                           if(this.§1t4441s0§() > this.§1t4413s0§)
                           {
                              this.§1t4442s0§(this.§1t4413s0§);
                           }
                           §1t1525s0§.§1t9941s0§().§1t5202s0§(this.§1t4441s0§(),this.§1t4413s0§);
                           if(_loc4_ > 0)
                           {
                              §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc4_.toString(),3394815);
                           }
                        }
                        _loc10_.§1t3274s0§(§1t1559s0§(),_loc6_,true);
                     }
                  }
               }
               else if(controlledBy == 1 || controlledBy == 3)
               {
                  §1t3304s0§();
                  target.§1t3274s0§(§1t1559s0§(),_loc6_,true);
               }
               break;
            case §1t11194s0§:
               if(controlledBy != 0)
               {
                  mcs.§1t6280s0§();
               }
               else
               {
                  mcs.§1t6286s0§(false);
               }
               _loc6_ = new §1t67s0§(0,0,§1t67s0§.§1t9125s0§);
               _loc6_.§1t1089s0§(this);
               _loc6_.§1t1084s0§(§1t1555s0§(),§1t1559s0§().y);
               if(controlledBy == 0)
               {
                  _loc9_ = §1t1543s0§.§1t10233s0§(§1t1559s0§(),true);
                  if(_loc9_.length > 0)
                  {
                     _loc10_ = _loc9_[0];
                     if(_loc10_.§1t1555s0§() > §1t1555s0§())
                     {
                        §1t1559s0§().§1t5493s0§();
                     }
                     else
                     {
                        §1t1559s0§().§1t5492s0§();
                     }
                     _loc10_.§1t3274s0§(§1t1559s0§(),_loc6_,true);
                  }
               }
               else if(controlledBy == 1 || controlledBy == 3)
               {
                  §1t3304s0§();
                  target.§1t3274s0§(§1t1559s0§(),_loc6_,true);
               }
               break;
            case §1t11184s0§:
               if(§1t1559s0§().§1t6283s0§())
               {
                  velX = 1;
                  _loc7_ = §1t1555s0§() + 65;
               }
               else
               {
                  velX = -1;
                  _loc7_ = §1t1555s0§() - 65;
               }
               §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11297s0§,§1t1555s0§(),§1t1559s0§().y,_loc7_,0,0,1,this);
               break;
            case §1t11155s0§:
               this.§1t4432s0§ = 24;
               if(§1t1559s0§().§1t6283s0§())
               {
                  _loc3_ = §1t1555s0§() + 25;
               }
               else
               {
                  _loc3_ = §1t1555s0§() - 25;
               }
               this.§1t4433s0§ = §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11299s0§,_loc3_,§1t1559s0§().y - 40,0,0,0,0,this);
               break;
            case §1t11179s0§:
               this.§1t4432s0§ = 3 * 24;
               if(§1t1559s0§().§1t6283s0§())
               {
                  _loc3_ = §1t1555s0§() + 27;
               }
               else
               {
                  _loc3_ = §1t1555s0§() - 27;
               }
               this.§1t4433s0§ = §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11300s0§,_loc3_,§1t1559s0§().y - 27,0,0,0,0,this);
               break;
            case §1t11180s0§:
               this.§1t4432s0§ = 3 * 24;
               if(§1t1559s0§().§1t6283s0§())
               {
                  _loc3_ = §1t1555s0§() - 8;
               }
               else
               {
                  _loc3_ = §1t1555s0§() + 8;
               }
               this.§1t4433s0§ = §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11300s0§,_loc3_,§1t1559s0§().y - 76,0,0,0,0,this);
               break;
            case §1t11181s0§:
               this.§1t4432s0§ = 4 * 24;
               if(§1t1559s0§().§1t6283s0§())
               {
                  _loc3_ = §1t1555s0§() - 31;
               }
               else
               {
                  _loc3_ = §1t1555s0§() + 31;
               }
               this.§1t4433s0§ = §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11300s0§,_loc3_,§1t1559s0§().y - 30,0,0,0,0,this);
               break;
            case §1t11162s0§:
               if((_loc2_ == §1t11155s0§ || _loc2_ == §1t11179s0§ || _loc2_ == §1t11180s0§ || _loc2_ == §1t11181s0§) && this.§1t4433s0§ != null)
               {
                  this.§1t4433s0§.§1t8113s0§();
                  this.§1t4433s0§ = null;
               }
               if(_loc2_ == §1t11179s0§)
               {
                  if(§1t1559s0§().§1t6283s0§())
                  {
                     this.§1t4468s0§(250);
                     §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11301s0§,§1t1555s0§(),§1t1559s0§().y - 44,0,0,this.§1t4476s0§() * this.§1t4492s0§() / 2,level,this);
                  }
                  else
                  {
                     this.§1t4468s0§(-250);
                     §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11301s0§,§1t1555s0§(),§1t1559s0§().y - 44,-1,0,this.§1t4476s0§() * this.§1t4492s0§() / 2,level,this);
                  }
                  §1t1525s0§.§1t9951s0§();
                  this.§1t4432s0§ = 0;
               }
               else if(_loc2_ == §1t11180s0§)
               {
                  §1t3246s0§ = 26;
               }
               else if(_loc2_ == §1t11181s0§)
               {
                  §1t3246s0§ = 16;
               }
               else
               {
                  _loc12_ = §1t1558s0§();
                  if(_loc12_ == §1t10921s0§)
                  {
                     if(§1t1559s0§().§1t6283s0§())
                     {
                        _loc13_ = 1;
                     }
                     else
                     {
                        _loc13_ = -1;
                     }
                     §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11293s0§,§1t1555s0§(),§1t1559s0§().y,_loc13_,0,0,§1t1523s0§.§1t9714s0§(§1t120s0§.§1t10149s0§),this);
                  }
                  else if(_loc12_ == §1t10891s0§)
                  {
                     if(§1t1559s0§().§1t6283s0§())
                     {
                        _loc13_ = 1;
                     }
                     else
                     {
                        _loc13_ = -1;
                     }
                     §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11294s0§,§1t1555s0§(),§1t1559s0§().y,_loc13_,0,0,§1t1523s0§.§1t9714s0§(§1t120s0§.§1t10150s0§),this);
                  }
               }
               break;
            case §1t11171s0§:
               §1t1557s0§(§1t10323s0§);
               if(§1t1559s0§().§1t6283s0§())
               {
                  velX = 50;
               }
               else
               {
                  velX = -50;
               }
               this.§1t4433s0§ = new §1t8358s0§();
               §1t1559s0§().addChild(this.§1t4433s0§);
               break;
            case §1t11175s0§:
               §1t1557s0§(§1t10319s0§);
               if(§1t1559s0§().§1t6283s0§())
               {
                  velX = -50;
               }
               else
               {
                  velX = 50;
               }
               this.§1t4433s0§ = new §1t8358s0§();
               §1t1559s0§().addChild(this.§1t4433s0§);
               this.§1t4433s0§.scaleX = -1;
               break;
            case §1t11185s0§:
               §1t1557s0§(§1t10441s0§);
               break;
            case §1t11186s0§:
               §1t1557s0§(§1t10925s0§);
               break;
            case §1t11187s0§:
               §1t1543s0§.§1t10205s0§(this);
               §1t1557s0§(§1t10925s0§);
               break;
            case §1t11188s0§:
               §1t1543s0§.§1t10206s0§(this);
               §1t1557s0§(§1t10925s0§);
               break;
            case §1t11189s0§:
               _loc8_ = this.§1t4491s0§(§1t120s0§.§1t10132s0§);
               if(_loc8_ == 1)
               {
                  this.§1t4435s0§ = 24 * 5;
               }
               else if(_loc8_ == 2)
               {
                  this.§1t4435s0§ = 24 * 10;
               }
               else if(_loc8_ == 3)
               {
                  this.§1t4435s0§ = 24 * 15;
               }
               if(controlledBy == 0 && this.§1t4437s0§ == null)
               {
                  this.§1t4437s0§ = new §1t6134s0§();
                  this.§1t4437s0§.alpha = 0.5;
                  mcs.§1t6231s0§[§1t75s0§.§1t12392s0§].addChild(this.§1t4437s0§);
               }
               §1t1557s0§(§1t10925s0§);
               break;
            case §1t11195s0§:
               §1t1557s0§(§1t10937s0§);
               this.§1t4439s0§ = 0;
               break;
            case §1t11197s0§:
               §1t3308s0§(1);
               mcs.y = §1t1525s0§.§1t4467s0§();
               §1t1557s0§(§1t10409s0§);
               mcs.§1t6281s0§(-180);
               break;
            case §1t11198s0§:
               this.§1t4432s0§ = 0;
         }
      }
      
      override internal function §1t3270s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:§1t67s0§ = null;
         var _loc3_:Number = NaN;
         var _loc4_:§1t67s0§ = null;
         var _loc5_:§1t67s0§ = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         switch(actionState)
         {
            case §1t11141s0§:
               break;
            case §1t11142s0§:
               if(!this.movement(runSpeed))
               {
                  velX = 0;
                  if(this.§1t4406s0§)
                  {
                     this.§1t3269s0§(§1t11149s0§);
                  }
                  else
                  {
                     this.§1t3269s0§(§1t11141s0§);
                  }
               }
               break;
            case §1t11143s0§:
               if(!this.movement(§1t3243s0§))
               {
                  velX = 0;
                  if(this.§1t4406s0§)
                  {
                     this.§1t3269s0§(§1t11149s0§);
                  }
                  else
                  {
                     this.§1t3269s0§(§1t11141s0§);
                  }
               }
               break;
            case §1t11145s0§:
               velY += gravity;
               mcs.y += velY;
               this.§1t4468s0§(velX);
               _loc1_ = this.§1t4467s0§();
               if(this.stance == §1t12220s0§ && this.§1t4406s0§ && Math.abs(this.§1t4403s0§[0].x - posX) < 50)
               {
                  this.§1t3269s0§(§1t11149s0§);
               }
               else if(mcs.y >= _loc1_)
               {
                  mcs.y = _loc1_;
                  this.§1t3269s0§(§1t11150s0§);
                  _loc4_ = new §1t67s0§(this.§1t4410s0§,level,0,this.stance);
                  _loc4_.§1t1089s0§(this);
                  _loc4_.§1t1072s0§(this.§1t1244s0§);
                  if(controlledBy == 0)
                  {
                     §1t1543s0§.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12380s0§],_loc4_,100,true,mcs);
                  }
                  else if(controlledBy == 1)
                  {
                     target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12380s0§],_loc4_);
                  }
                  this.§1t4438s0§ = 0;
               }
               break;
            case §1t11147s0§:
               this.§1t3288s0§();
               break;
            case §1t11173s0§:
               this.§1t3289s0§();
               break;
            case §1t11174s0§:
               §1t3287s0§();
               break;
            case §1t11152s0§:
               break;
            case §1t11149s0§:
               this.§1t4460s0§();
               break;
            case §1t11154s0§:
               if(§1t3246s0§ == 0)
               {
                  §1t3246s0§ = -1;
                  if(mcs.animation == §1t10313s0§)
                  {
                     §1t1557s0§(§1t10315s0§);
                  }
                  else
                  {
                     §1t1557s0§(§1t10263s0§);
                  }
               }
               break;
            case §1t11161s0§:
               if(mcs.animation == §1t10339s0§)
               {
                  if(mcs.§1t6283s0§())
                  {
                     this.§1t4468s0§(10);
                  }
                  else
                  {
                     this.§1t4468s0§(-10);
                  }
               }
               break;
            case §1t11144s0§:
               mcs.y += velY;
               velY += 4;
               if(mcs.§1t6283s0§())
               {
                  this.§1t4468s0§(8);
               }
               else
               {
                  this.§1t4468s0§(-8);
               }
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
            case §1t11166s0§:
               this.§1t4468s0§(velX);
               break;
            case §1t11184s0§:
               if(mcs.animation == §1t10885s0§)
               {
                  this.§1t4468s0§(velX);
               }
               break;
            case §1t11155s0§:
            case §1t11179s0§:
            case §1t11180s0§:
            case §1t11181s0§:
               ++this.§1t4432s0§;
               break;
            case §1t11162s0§:
               if(mcs.animation == §1t10863s0§)
               {
                  if(mcs.§1t6283s0§())
                  {
                     this.§1t4468s0§(15);
                  }
                  else
                  {
                     this.§1t4468s0§(-15);
                  }
                  _loc2_ = new §1t67s0§(this.§1t4476s0§() * this.§1t4492s0§() / 2,level,§1t67s0§.§1t9118s0§,§1t12221s0§);
                  _loc2_.§1t1089s0§(this);
                  if(controlledBy == 0)
                  {
                     §1t1543s0§.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12380s0§],_loc2_,100,true,mcs);
                  }
                  else if(controlledBy == 1)
                  {
                     target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12380s0§],_loc2_);
                  }
               }
               else if(mcs.animation == §1t10865s0§)
               {
                  _loc2_ = new §1t67s0§(this.§1t4476s0§() * this.§1t4492s0§() / 2,level,§1t67s0§.§1t9118s0§,§1t12221s0§);
                  _loc2_.§1t1089s0§(this);
                  if(controlledBy == 0)
                  {
                     §1t1543s0§.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12380s0§],_loc2_,100,true,mcs);
                  }
                  else if(controlledBy == 1)
                  {
                     target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12380s0§],_loc2_);
                  }
               }
               else if(mcs.animation == §1t10931s0§)
               {
                  if(mcs.§1t6283s0§())
                  {
                     this.§1t4468s0§(10);
                  }
                  else
                  {
                     this.§1t4468s0§(-10);
                  }
               }
               else if(mcs.animation == §1t10873s0§)
               {
                  _loc2_ = new §1t67s0§(this.§1t4476s0§(),level,§1t67s0§.§1t9119s0§);
                  _loc2_.§1t1089s0§(this);
                  if(mcs.§1t6283s0§())
                  {
                     this.§1t4468s0§(30);
                     _loc2_.§1t1084s0§(35,-6);
                  }
                  else
                  {
                     this.§1t4468s0§(-30);
                     _loc2_.§1t1084s0§(-35,-6);
                  }
                  if(controlledBy == 0)
                  {
                     §1t1543s0§.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12395s0§],_loc2_,100,true,mcs);
                  }
                  else if(controlledBy == 1)
                  {
                     target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12395s0§],_loc2_);
                  }
               }
               else if(mcs.animation == §1t10875s0§ && mcs.§1t6269s0§ <= 3)
               {
                  if(mcs.§1t6283s0§())
                  {
                     this.§1t4468s0§(4);
                  }
                  else
                  {
                     this.§1t4468s0§(-4);
                  }
               }
               break;
            case §1t11171s0§:
            case §1t11175s0§:
               this.§1t4468s0§(velX);
               break;
            case §1t11150s0§:
               switch(mcs.animation)
               {
                  case §1t10955s0§:
                  case §1t10963s0§:
                  case §1t10971s0§:
                  case §1t10997s0§:
                  case §1t11005s0§:
                  case §1t11013s0§:
                  case §1t11039s0§:
                  case §1t11047s0§:
                  case §1t11055s0§:
                  case §1t11081s0§:
                  case §1t11089s0§:
                  case §1t11097s0§:
                  case §1t11123s0§:
                     _loc4_ = new §1t67s0§(this.§1t4410s0§,level,0,this.stance);
                     _loc4_.§1t1089s0§(this);
                     _loc4_.§1t1072s0§(this.§1t1244s0§);
                     if(controlledBy == 0)
                     {
                        §1t1543s0§.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12380s0§],_loc4_,100,true,mcs);
                     }
                     if(controlledBy == 1)
                     {
                        target.§1t3274s0§(mcs.§1t6231s0§[§1t75s0§.§1t12380s0§],_loc4_);
                     }
               }
               break;
            case §1t11195s0§:
               if(mcs.animation == §1t10939s0§)
               {
                  if(this.§1t4439s0§ < 30)
                  {
                     ++this.§1t4439s0§;
                  }
                  if(mcs.§1t6283s0§())
                  {
                     this.§1t4468s0§(10 + this.§1t4439s0§);
                  }
                  else
                  {
                     this.§1t4468s0§(-10 - this.§1t4439s0§);
                  }
                  _loc5_ = new §1t67s0§(this.§1t4476s0§(),level,§1t67s0§.§1t9117s0§);
                  _loc5_.§1t1089s0§(this);
                  if(controlledBy == 0)
                  {
                     §1t1543s0§.§1t3274s0§(mcs,_loc5_,100,true,mcs);
                  }
                  else if(controlledBy == 1)
                  {
                     target.§1t3274s0§(mcs,_loc5_);
                  }
                  if(posX <= 50)
                  {
                     this.§1t3269s0§(§1t11141s0§);
                  }
                  else if(posX >= §1t1525s0§.§1t8124s0§() - 50)
                  {
                     this.§1t3269s0§(§1t11141s0§);
                  }
               }
               break;
            case §1t11197s0§:
               _loc3_ = 1;
               if(this.§1t4491s0§(§1t120s0§.§1t10167s0§) == 2)
               {
                  _loc3_ = §1t3257s0§ / (24 * 10);
               }
               else
               {
                  _loc3_ = §1t3257s0§ / (24 * 20);
               }
               if(_loc3_ < 1)
               {
                  _loc3_ = 1;
               }
               §1t3308s0§(§1t3309s0§() + _loc3_);
               §1t1559s0§().§1t3301s0§(§1t3309s0§() / §1t3257s0§);
               if(§1t3309s0§() >= §1t3257s0§ && §1t1558s0§() != §1t10793s0§)
               {
                  §1t1557s0§(§1t10793s0§);
                  §1t1559s0§().§1t6280s0§();
                  if(mcs.§1t6283s0§())
                  {
                     §1t1553s0§(-100);
                  }
                  else
                  {
                     §1t1553s0§(100);
                  }
                  this.minDamage *= 0.8;
                  §1t3308s0§(§1t3257s0§);
               }
               break;
            case §1t11198s0§:
               ++this.§1t4432s0§;
               if(this.§1t4432s0§ >= 24)
               {
                  this.§1t4432s0§ = 0;
                  _loc6_ = this.§1t4491s0§(§1t120s0§.§1t10168s0§);
                  if(_loc6_ == 1)
                  {
                     _loc7_ = this.§1t4441s0§() + 1;
                  }
                  else if(_loc6_ == 2)
                  {
                     _loc7_ = this.§1t4441s0§() + 2;
                  }
                  else if(_loc6_ == 3)
                  {
                     _loc7_ = this.§1t4441s0§() + 3;
                  }
                  if(_loc7_ > this.§1t4413s0§)
                  {
                     _loc7_ = this.§1t4413s0§;
                     if(controlledBy != 2)
                     {
                        if(mcs.§1t6283s0§())
                        {
                           §1t1553s0§(16);
                        }
                        else
                        {
                           §1t1553s0§(-16);
                        }
                        if(this.§1t4433s0§ != null)
                        {
                           this.§1t4433s0§.§1t8113s0§();
                           this.§1t4433s0§ = null;
                        }
                        §1t1557s0§(§1t10943s0§);
                     }
                  }
                  this.§1t4442s0§(_loc7_);
                  if(controlledBy == 0)
                  {
                     §1t1525s0§.§1t9941s0§().§1t5202s0§(this.§1t4441s0§(),this.§1t4413s0§);
                  }
               }
         }
      }
      
      internal function §1t4449s0§(param1:Vector.<Point>, param2:int = 0) : Vector.<Point>
      {
         var _loc3_:int = int(param1.length);
         var _loc4_:Vector.<Point> = new Vector.<Point>();
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_.push(new Point(param1[_loc5_].x + param2,param1[_loc5_].y));
            _loc5_++;
         }
         return _loc4_;
      }
      
      public function §1t4450s0§(param1:Vector.<Point>, param2:Boolean, param3:int = -1) : *
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc8_:int = 0;
         if(§1t3309s0§() <= 0 || §1t3258s0§ || actionState == §1t11147s0§ || this.§1t4455s0§() || actionState == §1t11174s0§ || actionState == §1t11173s0§)
         {
            §1t1541s0§.§1t10111s0§();
            return;
         }
         var _loc6_:int = §1t1525s0§.§1t8131s0§();
         var _loc7_:Vector.<Point> = this.§1t4449s0§(param1);
         if(§1t1525s0§.§1t9947s0§() || §1t1523s0§.§1t9479s0§ == §1t251s0§.§1t12137s0§ || §1t1523s0§.§1t9479s0§ == §1t251s0§.§1t12138s0§)
         {
            §1t1541s0§.§1t10111s0§();
            if(param2)
            {
               param2 = false;
               param1[param1.length - 1].x += _loc6_;
               this.§1t4451s0§(param1[param1.length - 1]);
               if((controlledBy == 0 || controlledBy == 3) && §1t251s0§.instance.§1t3476s0§())
               {
                  §1t251s0§.instance.§1t3479s0§(_loc7_,_loc6_,§1t1555s0§());
               }
               return;
            }
         }
         if(this.§1t4405s0§ || actionState == §1t11145s0§ && this.stance != §1t12220s0§ || actionState == §1t11147s0§ || §1t3292s0§() || actionState == §1t11144s0§ || actionState == §1t11161s0§)
         {
            if(param2)
            {
               this.§1t4404s0§ = this.§1t4449s0§(param1,_loc6_);
               this.§1t4407s0§ = true;
               if((controlledBy == 0 || controlledBy == 3) && §1t251s0§.instance.§1t3476s0§())
               {
                  §1t251s0§.instance.§1t3479s0§(_loc7_,_loc6_,§1t1555s0§());
               }
            }
         }
         else if(!this.§1t4405s0§)
         {
            if(param2)
            {
               this.§1t4403s0§ = this.§1t4449s0§(param1,_loc6_);
               this.§1t4457s0§(this.§1t4403s0§[0]);
               if((controlledBy == 0 || controlledBy == 3) && §1t251s0§.instance.§1t3476s0§())
               {
                  §1t251s0§.instance.§1t3479s0§(_loc7_,_loc6_,§1t1555s0§());
               }
            }
            else
            {
               _loc8_ = param1[0].x - §1t1559s0§().x;
               if(_loc8_ * _loc8_ < 625)
               {
                  return;
               }
               if(actionState != §1t11145s0§ && actionState != §1t11147s0§ && actionState != §1t11152s0§ && actionState != §1t11144s0§ && actionState != §1t11161s0§ && actionState != §1t11149s0§)
               {
                  param1[0].x += _loc6_;
                  this.§1t4451s0§(param1[0]);
                  if((controlledBy == 0 || controlledBy == 3) && §1t251s0§.instance.§1t3476s0§())
                  {
                     §1t251s0§.instance.§1t3479s0§(_loc7_,_loc6_,§1t1555s0§());
                  }
               }
            }
         }
      }
      
      internal function §1t4451s0§(param1:Point) : *
      {
         var _loc2_:int = posX - param1.x;
         if(§1t1540s0§.§1t9550s0§() && (_loc2_ * _loc2_ < 625 || actionState == §1t11144s0§ || actionState == §1t11145s0§ || §1t3292s0§() || §1t3293s0§() || actionState == §1t11147s0§))
         {
            return;
         }
         this.§1t4408s0§ = param1.x;
         if(this.§1t4408s0§ < 0)
         {
            this.§1t4408s0§ = 0;
         }
         else if(this.§1t4408s0§ > §1t1525s0§.§1t8124s0§())
         {
            this.§1t4408s0§ = §1t1525s0§.§1t8124s0§();
         }
         this.§1t4409s0§ = param1.y;
         this.§1t4406s0§ = false;
         this.§1t4407s0§ = false;
         if(_loc2_ * _loc2_ <= 10000)
         {
            this.§1t3269s0§(§1t11143s0§);
         }
         else
         {
            this.§1t3269s0§(§1t11142s0§);
         }
      }
      
      public function §1t4452s0§(param1:int) : *
      {
         this.§1t4408s0§ = param1;
         if(this.§1t4408s0§ < 0)
         {
            this.§1t4408s0§ = 0;
         }
         else if(this.§1t4408s0§ > §1t1525s0§.§1t8124s0§())
         {
            this.§1t4408s0§ = §1t1525s0§.§1t8124s0§();
         }
         this.§1t4406s0§ = false;
         this.§1t4407s0§ = false;
         this.§1t3269s0§(§1t11143s0§);
      }
      
      public function §1t4453s0§(param1:Boolean = true) : *
      {
         var _loc2_:Vector.<Point> = null;
         if(actionState == §1t11141s0§ || !this.§1t4469s0§())
         {
            return;
         }
         this.§1t4408s0§ = posX;
         this.§1t4409s0§ = §1t1525s0§.§1t4467s0§();
         this.§1t4406s0§ = false;
         this.§1t4407s0§ = false;
         this.§1t3269s0§(§1t11141s0§);
         §1t1525s0§.§1t8142s0§();
         if(controlledBy == 0 && param1 && §1t251s0§.instance.§1t3476s0§())
         {
            _loc2_ = new Vector.<Point>();
            _loc2_.push(new Point(posX,this.§1t4409s0§));
            §1t251s0§.instance.§1t3479s0§(_loc2_,0,§1t1555s0§());
         }
      }
      
      public function §1t4454s0§() : Boolean
      {
         return actionState == §1t11141s0§;
      }
      
      public function §1t4455s0§() : Boolean
      {
         return actionState == §1t11162s0§ || actionState == §1t11177s0§ || actionState == §1t11178s0§ || actionState == §1t11166s0§ || actionState == §1t11199s0§ || actionState == §1t11177s0§ || actionState == §1t11200s0§ || actionState == §1t11180s0§ || actionState == §1t11184s0§ || actionState == §1t11183s0§ || actionState == §1t11171s0§ || actionState == §1t11175s0§ || this.§1t4456s0§() || actionState == §1t11185s0§ || actionState == §1t11186s0§ || actionState == §1t11187s0§ || actionState == §1t11188s0§ || actionState == §1t11189s0§ || actionState == §1t11194s0§ || actionState == §1t11195s0§ || actionState == §1t11201s0§ || actionState == §1t11202s0§ || actionState == §1t11204s0§ || actionState == §1t11203s0§ || actionState == §1t11160s0§ || actionState == §1t11164s0§;
      }
      
      public function §1t4456s0§() : Boolean
      {
         return actionState == §1t11179s0§ || actionState == §1t11180s0§ || actionState == §1t11181s0§ || actionState == §1t11155s0§;
      }
      
      internal function §1t4457s0§(param1:Point) : *
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         this.§1t4494s0§();
         this.§1t4408s0§ = param1.x;
         this.§1t4409s0§ = param1.y;
         if(this.§1t4408s0§ < 0)
         {
            this.§1t4408s0§ = 0;
         }
         else if(this.§1t4408s0§ > §1t1525s0§.§1t8124s0§())
         {
            this.§1t4408s0§ = §1t1525s0§.§1t8124s0§();
         }
         this.§1t4406s0§ = true;
         this.§1t4407s0§ = false;
         this.§1t4412s0§ = §1t12225s0§;
         var _loc2_:Point = this.§1t4403s0§[this.§1t4403s0§.length - 1];
         if(this.stance == §1t12220s0§ && actionState == §1t11145s0§)
         {
            if(this.§1t4409s0§ - mcs.y > 100)
            {
               this.§1t4412s0§ = §1t12227s0§;
            }
            else
            {
               this.§1t4412s0§ = §1t12229s0§;
            }
         }
         else if(mcs.y - this.§1t4409s0§ > jumpThreshhold)
         {
            this.§1t4412s0§ = §1t12226s0§;
         }
         else if(this.§1t4426s0§ && this.§1t4409s0§ < _loc2_.y && Math.abs(this.§1t4408s0§ - _loc2_.x) < 50)
         {
            this.§1t4412s0§ = §1t12231s0§;
         }
         else if(this.§1t4409s0§ - _loc2_.y > jumpThreshhold && !§1t3293s0§())
         {
            this.§1t4412s0§ = §1t12228s0§;
         }
         else
         {
            _loc3_ = this.§1t4409s0§ - _loc2_.y;
            if(_loc3_ > 25)
            {
               this.§1t4412s0§ = §1t12233s0§;
            }
            else if(_loc3_ < -25)
            {
               this.§1t4412s0§ = §1t12232s0§;
            }
         }
         if(this.§1t4412s0§ == §1t12231s0§)
         {
            if(posX < this.§1t4408s0§)
            {
               this.§1t4408s0§ -= 55;
            }
            else
            {
               this.§1t4408s0§ += 55;
            }
            if(this.§1t4408s0§ < 0)
            {
               this.§1t4408s0§ = 0;
            }
            else if(this.§1t4408s0§ > §1t1525s0§.§1t8124s0§())
            {
               this.§1t4408s0§ = §1t1525s0§.§1t8124s0§();
            }
         }
         if(actionState != §1t11147s0§ && Math.abs(this.§1t4408s0§ - posX) < standingRange)
         {
            _loc4_ = §1t1541s0§.§1t10088s0§ - 1;
            if(_loc4_ < 0)
            {
               _loc4_ = 0;
            }
            else if(_loc4_ >= this.§1t4403s0§.length)
            {
               _loc4_ = this.§1t4403s0§.length - 1;
            }
            if(posX < this.§1t4403s0§[_loc4_].x)
            {
               mcs.§1t5493s0§();
            }
            else
            {
               mcs.§1t5492s0§();
            }
            this.§1t3269s0§(§1t11149s0§);
         }
         else if(actionState != §1t11145s0§)
         {
            this.§1t3269s0§(§1t11142s0§);
         }
      }
      
      internal function §1t4458s0§() : *
      {
         if(this.§1t4406s0§)
         {
            this.§1t4457s0§(this.§1t4403s0§[0]);
         }
         else if(this.§1t4407s0§)
         {
            this.§1t4403s0§ = this.§1t4404s0§;
            this.§1t4457s0§(this.§1t4403s0§[0]);
         }
      }
      
      internal function §1t4459s0§() : *
      {
         var _loc1_:int = 0;
         this.§1t4405s0§ = true;
         if(this.§1t4412s0§ != §1t12231s0§)
         {
            if(this.§1t4403s0§[0].x < this.§1t4403s0§[this.§1t4403s0§.length - 1].x)
            {
               mcs.§1t5493s0§();
            }
            else
            {
               mcs.§1t5492s0§();
            }
         }
         if(this.§1t4412s0§ == §1t12231s0§)
         {
            if(controlledBy == 0)
            {
               §1t1541s0§.§1t10111s0§();
            }
            mcs.y = this.§1t4467s0§();
            §1t1557s0§(§1t10313s0§);
         }
         else if(this.stance == §1t12220s0§)
         {
            if(this.§1t4412s0§ == §1t12225s0§)
            {
               §1t1557s0§(§1t10951s0§);
            }
            else if(this.§1t4412s0§ == §1t12232s0§)
            {
               §1t1557s0§(§1t10959s0§);
            }
            else if(this.§1t4412s0§ == §1t12233s0§)
            {
               §1t1557s0§(§1t10967s0§);
            }
            else if(this.§1t4412s0§ == §1t12226s0§)
            {
               §1t1557s0§(§1t10981s0§);
            }
            else if(this.§1t4412s0§ == §1t12227s0§)
            {
               §1t1557s0§(§1t10975s0§);
            }
            else if(this.§1t4412s0§ == §1t12228s0§)
            {
               §1t1557s0§(§1t10981s0§);
            }
            else if(this.§1t4412s0§ == §1t12229s0§)
            {
               §1t1557s0§(§1t10983s0§);
            }
            _loc1_ = lightSlashSpeed;
         }
         else if(this.stance == §1t12221s0§)
         {
            if(this.§1t4412s0§ == §1t12225s0§)
            {
               §1t1557s0§(§1t10993s0§);
            }
            else if(this.§1t4412s0§ == §1t12232s0§)
            {
               §1t1557s0§(§1t11001s0§);
            }
            else if(this.§1t4412s0§ == §1t12233s0§)
            {
               §1t1557s0§(§1t11009s0§);
            }
            else if(this.§1t4412s0§ == §1t12226s0§)
            {
               §1t1557s0§(§1t11023s0§);
            }
            else if(this.§1t4412s0§ == §1t12227s0§)
            {
               §1t1557s0§(§1t11017s0§);
            }
            else if(this.§1t4412s0§ == §1t12228s0§)
            {
               §1t1557s0§(§1t11023s0§);
            }
            _loc1_ = balancedSlashSpeed;
         }
         else if(this.stance == §1t12222s0§)
         {
            if(this.§1t4412s0§ == §1t12225s0§)
            {
               §1t1557s0§(§1t11035s0§);
            }
            else if(this.§1t4412s0§ == §1t12232s0§)
            {
               §1t1557s0§(§1t11043s0§);
            }
            else if(this.§1t4412s0§ == §1t12233s0§)
            {
               §1t1557s0§(§1t11051s0§);
            }
            else if(this.§1t4412s0§ == §1t12226s0§)
            {
               §1t1557s0§(§1t11065s0§);
            }
            else if(this.§1t4412s0§ == §1t12227s0§)
            {
               §1t1557s0§(§1t11059s0§);
            }
            else if(this.§1t4412s0§ == §1t12228s0§)
            {
               §1t1557s0§(§1t11065s0§);
            }
            _loc1_ = heavySlashSpeed;
         }
         else if(this.stance == §1t12223s0§)
         {
            if(this.§1t4412s0§ == §1t12225s0§)
            {
               §1t1557s0§(§1t11077s0§);
            }
            else if(this.§1t4412s0§ == §1t12232s0§)
            {
               §1t1557s0§(§1t11085s0§);
            }
            else if(this.§1t4412s0§ == §1t12233s0§)
            {
               §1t1557s0§(§1t11093s0§);
            }
            else if(this.§1t4412s0§ == §1t12226s0§)
            {
               §1t1557s0§(§1t11107s0§);
            }
            else if(this.§1t4412s0§ == §1t12227s0§)
            {
               §1t1557s0§(§1t11101s0§);
            }
            else if(this.§1t4412s0§ == §1t12228s0§)
            {
               §1t1557s0§(§1t11107s0§);
            }
            _loc1_ = heavySlashSpeed;
         }
         else if(this.stance == §1t12224s0§)
         {
            if(this.§1t4412s0§ == §1t12225s0§ || this.§1t4412s0§ == §1t12232s0§ || this.§1t4412s0§ == §1t12233s0§)
            {
               §1t1557s0§(§1t11119s0§);
            }
            else if(this.§1t4412s0§ == §1t12226s0§)
            {
               §1t1557s0§(§1t11133s0§);
            }
            else if(this.§1t4412s0§ == §1t12227s0§)
            {
               §1t1557s0§(§1t11127s0§);
            }
            else if(this.§1t4412s0§ == §1t12228s0§)
            {
               §1t1557s0§(§1t11133s0§);
            }
            _loc1_ = balancedSlashSpeed;
         }
         this.§1t4408s0§ = this.§1t4403s0§[this.§1t4403s0§.length - 1].x;
         if(this.§1t4408s0§ < 0)
         {
            this.§1t4408s0§ = 0;
         }
         else if(this.§1t4408s0§ > §1t1525s0§.§1t8124s0§())
         {
            this.§1t4408s0§ = §1t1525s0§.§1t8124s0§();
         }
         if(this.§1t4403s0§[this.§1t4403s0§.length - 1].y > this.§1t4467s0§() - jumpThreshhold)
         {
            this.§1t4409s0§ = this.§1t4467s0§();
         }
         else
         {
            this.§1t4409s0§ = this.§1t4403s0§[this.§1t4403s0§.length - 1].y;
         }
         var _loc2_:int = this.§1t4408s0§ - posX;
         var _loc3_:int = this.§1t4409s0§ - this.§1t4403s0§[0].y;
         var _loc4_:Number = Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_);
         var _loc5_:Number = _loc4_ / _loc1_;
         velX = _loc2_ / _loc5_;
         velY = _loc3_ / _loc5_;
         this.§1t4410s0§ = this.§1t4475s0§();
         if(this.§1t4411s0§)
         {
            setPosition(this.§1t4408s0§,this.§1t4409s0§);
            this.§1t4410s0§ *= 2;
            this.§1t4461s0§();
         }
      }
      
      internal function §1t4460s0§() : *
      {
         if(this.stance == §1t12220s0§ && (mcs.animation == §1t10951s0§ || mcs.animation == §1t10953s0§ || mcs.animation == §1t10959s0§ || mcs.animation == §1t10961s0§ || mcs.animation == §1t10967s0§ || mcs.animation == §1t10969s0§ || mcs.animation == §1t10977s0§ || mcs.animation == §1t10983s0§))
         {
            if(!this.movement(lightSlashSpeed))
            {
               this.§1t4461s0§();
            }
            if(this.§1t4412s0§ != §1t12225s0§ && this.§1t4412s0§ != §1t12232s0§ && this.§1t4412s0§ != §1t12233s0§ && mcs.y < §1t1525s0§.§1t4467s0§())
            {
               mcs.y += velY;
            }
         }
         else if(this.stance == §1t12221s0§ && (mcs.animation == §1t10993s0§ || mcs.animation == §1t10995s0§ || mcs.animation == §1t11001s0§ || mcs.animation == §1t11003s0§ || mcs.animation == §1t11009s0§ || mcs.animation == §1t11011s0§ || mcs.animation == §1t11019s0§ || mcs.animation == §1t11025s0§))
         {
            if(!this.movement(balancedSlashSpeed))
            {
               this.§1t4461s0§();
            }
            if(this.§1t4412s0§ != §1t12225s0§ && this.§1t4412s0§ != §1t12232s0§ && this.§1t4412s0§ != §1t12233s0§ && mcs.y < §1t1525s0§.§1t4467s0§())
            {
               mcs.y += velY;
            }
         }
         else if(this.stance == §1t12222s0§ && (mcs.animation == §1t11035s0§ || mcs.animation == §1t11037s0§ || mcs.animation == §1t11043s0§ || mcs.animation == §1t11045s0§ || mcs.animation == §1t11051s0§ || mcs.animation == §1t11053s0§ || mcs.animation == §1t11061s0§ || mcs.animation == §1t11067s0§))
         {
            if(!this.movement(heavySlashSpeed))
            {
               this.§1t4461s0§();
            }
            if(this.§1t4412s0§ != §1t12225s0§ && this.§1t4412s0§ != §1t12232s0§ && this.§1t4412s0§ != §1t12233s0§ && mcs.y < §1t1525s0§.§1t4467s0§())
            {
               mcs.y += velY;
            }
         }
         else if(this.stance == §1t12223s0§ && (mcs.animation == §1t11077s0§ || mcs.animation == §1t11079s0§ || mcs.animation == §1t11085s0§ || mcs.animation == §1t11087s0§ || mcs.animation == §1t11093s0§ || mcs.animation == §1t11095s0§ || mcs.animation == §1t11103s0§ || mcs.animation == §1t11109s0§))
         {
            if(!this.movement(heavySlashSpeed))
            {
               this.§1t4461s0§();
            }
            if(this.§1t4412s0§ != §1t12225s0§ && this.§1t4412s0§ != §1t12232s0§ && this.§1t4412s0§ != §1t12233s0§ && mcs.y < §1t1525s0§.§1t4467s0§())
            {
               mcs.y += velY;
            }
         }
         else if(this.stance == §1t12224s0§ && (mcs.animation == §1t11119s0§ || mcs.animation == §1t11121s0§ || mcs.animation == §1t11129s0§ || mcs.animation == §1t11135s0§))
         {
            if(!this.movement(balancedSlashSpeed))
            {
               this.§1t4461s0§();
            }
            if(this.§1t4412s0§ != §1t12225s0§ && this.§1t4412s0§ != §1t12232s0§ && this.§1t4412s0§ != §1t12233s0§ && mcs.y < §1t1525s0§.§1t4467s0§())
            {
               mcs.y += velY;
            }
         }
      }
      
      internal function §1t4461s0§() : *
      {
         var _loc1_:int = §1t1525s0§.§1t8131s0§();
         if(controlledBy == 0)
         {
            §1t1541s0§.§1t10116s0§(this.§1t4403s0§,_loc1_);
         }
         else if((§1t1523s0§.§1t9586s0§().§1t4428s0§ || §1t1540s0§.§1t10049s0§() && §1t1540s0§.§1t10063s0§()) && !§1t1525s0§.§1t9952s0§())
         {
            §1t1541s0§.§1t10117s0§(this.§1t4403s0§,_loc1_,this.§1t4417s0§);
         }
         this.§1t4478s0§();
         this.§1t4406s0§ = false;
         var _loc2_:int = §1t67s0§.§1t9116s0§;
         if(this.§1t4412s0§ == §1t12228s0§ && this.§1t4425s0§)
         {
            _loc2_ = §1t67s0§.§1t9117s0§;
         }
         var _loc3_:* = this.§1t4403s0§[this.§1t4403s0§.length - 1].y;
         var _loc4_:int = this.§1t4467s0§();
         var _loc5_:§1t67s0§ = new §1t67s0§(this.§1t4410s0§,level,_loc2_,this.stance);
         _loc5_.§1t1072s0§(this.§1t1244s0§);
         _loc5_.§1t1089s0§(this);
         if(_loc4_ - _loc3_ > jumpThreshhold)
         {
            mcs.y = _loc3_ + 90;
            velY = 0;
            this.§1t3269s0§(§1t11145s0§);
            if(controlledBy == 0 || controlledBy == 3)
            {
               §1t1543s0§.§1t3273s0§(this.§1t4403s0§,_loc1_,_loc5_);
            }
            else if(controlledBy == 1)
            {
               §1t1543s0§.§1t10229s0§(this.§1t4403s0§,_loc1_,_loc5_);
            }
         }
         else
         {
            mcs.y = _loc4_;
            velY = 0;
            if(controlledBy == 0 || controlledBy == 3)
            {
               §1t1543s0§.§1t3273s0§(this.§1t4403s0§,_loc1_,_loc5_);
            }
            else if(controlledBy == 1)
            {
               §1t1543s0§.§1t10229s0§(this.§1t4403s0§,_loc1_,_loc5_);
            }
            this.§1t3269s0§(§1t11150s0§);
         }
         var _loc6_:int = int(this.§1t4403s0§.length);
         var _loc7_:int = _loc6_ - §1t1541s0§.§1t10088s0§ + 1;
         if(_loc7_ < 0)
         {
            _loc7_ = 0;
         }
         if(mcs != null)
         {
            if(this.§1t4403s0§[_loc6_ - 1].x > this.§1t4403s0§[_loc7_].x)
            {
               velX = 5;
               mcs.§1t5493s0§();
            }
            else
            {
               velX = -5;
               mcs.§1t5492s0§();
            }
         }
         if(this.§1t4407s0§)
         {
            this.§1t4403s0§ = this.§1t4404s0§;
            this.§1t4406s0§ = true;
         }
         this.§1t4407s0§ = false;
         this.§1t4405s0§ = false;
         if(controlledBy == 0)
         {
            §1t88s0§.instance.§1t1506s0§();
            §1t1541s0§.§1t10111s0§();
            if(this.§1t4406s0§)
            {
               §1t1541s0§.§1t10116s0§(this.§1t4403s0§,§1t1525s0§.§1t8131s0§());
            }
            else if(this.§1t4407s0§)
            {
               §1t1541s0§.§1t10116s0§(this.§1t4404s0§,§1t1525s0§.§1t8131s0§());
            }
         }
         if(this.§1t4411s0§)
         {
            this.§1t4411s0§ = false;
         }
         if(this.§1t4440s0§ > 0)
         {
            this.§1t4440s0§ = 0;
            this.§1t1561s0§();
         }
      }
      
      internal function §1t4462s0§() : *
      {
         this.§1t4406s0§ = false;
         this.§1t3269s0§(§1t11150s0§);
         if(this.§1t4407s0§)
         {
            this.§1t4403s0§ = this.§1t4404s0§;
            this.§1t4406s0§ = true;
         }
         this.§1t4407s0§ = false;
         this.§1t4405s0§ = false;
      }
      
      public function §1t4463s0§() : Vector.<Point>
      {
         return this.§1t4403s0§;
      }
      
      public function §1t4464s0§() : Boolean
      {
         return this.§1t4406s0§;
      }
      
      internal function §1t4465s0§() : Boolean
      {
         return actionState == §1t11149s0§;
      }
      
      internal function movement(param1:int) : *
      {
         if(posX - this.§1t4408s0§ < -param1)
         {
            mcs.§1t5493s0§();
            velX = param1;
         }
         else
         {
            if(posX - this.§1t4408s0§ <= param1)
            {
               this.§1t4468s0§(this.§1t4408s0§ - posX);
               return false;
            }
            mcs.§1t5492s0§();
            velX = -param1;
         }
         this.§1t4468s0§(velX);
         return true;
      }
      
      internal function §1t4467s0§() : int
      {
         return §1t1525s0§.§1t4467s0§();
      }
      
      public function §1t2289s0§(param1:int) : *
      {
         posX += param1;
      }
      
      public function §1t4468s0§(param1:int) : *
      {
         if(posX + param1 < 0)
         {
            param1 -= posX + param1;
         }
         else if(posX + param1 > §1t1525s0§.§1t8124s0§())
         {
            param1 -= posX + param1 - §1t1525s0§.§1t8124s0§();
         }
         if(controlledBy != 0)
         {
            §1t1553s0§(param1);
            return;
         }
         var _loc2_:Boolean = true;
         if(!§1t1525s0§.§1t9940s0§().§1t8133s0§(param1) || mcs.x < playerScrollMax && param1 > 0 || mcs.x > playerScrollMin && param1 < 0 || mcs.x > playerScrollMin && mcs.x < playerScrollMax || §1t1525s0§.§1t9952s0§())
         {
            _loc2_ = false;
         }
         if(_loc2_)
         {
            §1t1525s0§.§1t8127s0§(-param1);
            §1t1541s0§.§1t10112s0§().x = §1t1541s0§.§1t10112s0§().x - param1;
            posX += param1;
         }
         else
         {
            mcs.x += param1;
            posX += param1;
         }
         if(controlledBy == 0 && (§1t1540s0§.§1t9550s0§() || §1t1540s0§.§1t10047s0§()))
         {
            if(§1t402s0§.§1t9190s0§().visible)
            {
               §1t402s0§.§1t9190s0§().§1t6347s0§(posX,§1t1559s0§().§1t6283s0§());
            }
            else
            {
               §1t406s0§.instance.§1t6456s0§.§1t6347s0§(posX,§1t1559s0§().§1t6283s0§());
            }
         }
      }
      
      public function §1t4469s0§() : Boolean
      {
         return actionState == §1t11141s0§ || actionState == §1t11150s0§ || actionState == §1t11142s0§ || actionState == §1t11143s0§ || actionState == §1t11198s0§ || actionState == §1t11169s0§ && (§1t3251s0§ == §1t11141s0§ || §1t3251s0§ == §1t11150s0§ || §1t3251s0§ == §1t11142s0§ || §1t3251s0§ == §1t11143s0§);
      }
      
      public function §1t4470s0§() : Boolean
      {
         return this.§1t4469s0§() && this.§1t4414s0§ >= 48;
      }
      
      public function §1t4471s0§() : Boolean
      {
         return this.§1t4469s0§() || §1t3292s0§() || actionState == §1t11147s0§ || actionState == §1t11145s0§ || actionState == §1t11147s0§ || actionState == §1t11144s0§;
      }
      
      public function §1t4472s0§() : *
      {
         if(this.§1t4414s0§ < 48)
         {
            return;
         }
         if(this.stance == -1)
         {
            this.§1t3489s0§(§1t12220s0§);
         }
         else if(this.stance == §1t12220s0§)
         {
            this.§1t3489s0§(§1t12221s0§);
         }
         else if(this.stance == §1t12221s0§)
         {
            this.§1t3489s0§(§1t12222s0§);
         }
         else if(this.stance == §1t12222s0§)
         {
            this.§1t3489s0§(§1t12220s0§);
         }
         §1t251s0§.§1t9190s0§().§1t3489s0§(this.stance);
      }
      
      public function §1t3489s0§(param1:int) : *
      {
         this.stance = param1;
         if(§1t1525s0§.§1t9948s0§())
         {
            this.§1t4453s0§(false);
         }
         this.§1t4405s0§ = false;
         switch(this.stance)
         {
            case §1t12220s0§:
               this.§1t4417s0§ = this.§1t4420s0§ * 1.4;
               if(§1t1525s0§.§1t9948s0§())
               {
                  §1t1557s0§(§1t10947s0§);
               }
               if(controlledBy == 0)
               {
                  §1t113s0§.instance.§1t5208s0§(1);
               }
               break;
            case §1t12221s0§:
               this.§1t4417s0§ = this.§1t4420s0§ * (1 + 0.2 * this.§1t4422s0§ * 0.1);
               if(§1t1525s0§.§1t9948s0§())
               {
                  §1t1557s0§(§1t10989s0§);
               }
               if(controlledBy == 0)
               {
                  §1t113s0§.instance.§1t5208s0§(2);
               }
               break;
            case §1t12222s0§:
               this.§1t4417s0§ = this.§1t4420s0§ * (0.5 + 0.4 * this.§1t4423s0§ * 0.1);
               if(this.§1t4417s0§ < 100)
               {
                  this.§1t4417s0§ = 100;
               }
               if(§1t1525s0§.§1t9948s0§())
               {
                  §1t1557s0§(§1t11031s0§);
               }
               if(controlledBy == 0)
               {
                  §1t113s0§.instance.§1t5208s0§(3);
               }
               break;
            case §1t12224s0§:
               this.§1t4417s0§ = this.§1t4420s0§ * 1.4;
               if(§1t1525s0§.§1t9948s0§())
               {
                  §1t1557s0§(§1t11115s0§);
               }
               if(controlledBy == 0)
               {
                  §1t113s0§.instance.§1t5208s0§(2);
               }
               break;
            case §1t12223s0§:
               this.§1t4417s0§ = this.§1t4420s0§;
               if(this.§1t4417s0§ < 100)
               {
                  this.§1t4417s0§ = 100;
               }
               if(§1t1525s0§.§1t9948s0§())
               {
                  §1t1557s0§(§1t11073s0§);
               }
               if(controlledBy == 0)
               {
                  §1t113s0§.instance.§1t5208s0§(3);
               }
         }
         if(controlledBy == 0)
         {
            §1t1541s0§.§1t10094s0§(this.§1t4417s0§);
         }
         if(§1t1525s0§.§1t9948s0§())
         {
            this.§1t4414s0§ -= 48;
            if(this.§1t4414s0§ < 0)
            {
               this.§1t4414s0§ = 0;
            }
            if(controlledBy == 0)
            {
               §1t1525s0§.§1t9941s0§().§1t5205s0§(this.§1t4414s0§,this.§1t4415s0§);
            }
         }
         this.§1t4474s0§();
         if(controlledBy == 0)
         {
            §1t113s0§.instance.§1t5198s0§();
         }
      }
      
      public function §1t4473s0§() : int
      {
         return this.stance;
      }
      
      internal function §1t4474s0§() : *
      {
         if(controlledBy == 0 || controlledBy == 2)
         {
            if(this.stance == §1t12220s0§)
            {
               this.§1t4425s0§ = this.§1t4491s0§(1014) > 0;
               this.§1t4430s0§ = this.§1t4491s0§(1036) > 0;
               this.§1t4429s0§ = this.§1t4491s0§(1015) > 0;
               this.§1t4427s0§ = false;
               this.§1t4426s0§ = false;
            }
            else if(this.stance == §1t12221s0§)
            {
               this.§1t4427s0§ = this.§1t4491s0§(1016) > 0;
               this.§1t4430s0§ = this.§1t4491s0§(1037) > 0;
               this.§1t4425s0§ = this.§1t4491s0§(1017) > 0;
               this.§1t4426s0§ = false;
               this.§1t4429s0§ = false;
            }
            else if(this.stance == §1t12222s0§)
            {
               this.§1t4426s0§ = this.§1t4491s0§(1018) > 0;
               this.§1t4430s0§ = this.§1t4491s0§(1038) > 0;
               this.§1t4425s0§ = this.§1t4491s0§(1019) > 0;
               this.§1t4427s0§ = false;
               this.§1t4429s0§ = false;
            }
            else if(this.stance == §1t12224s0§ || this.stance == §1t12223s0§)
            {
               this.§1t4426s0§ = true;
               this.§1t4430s0§ = true;
               this.§1t4425s0§ = true;
               this.§1t4427s0§ = true;
               this.§1t4429s0§ = true;
            }
         }
         else if(this.stance == §1t12220s0§)
         {
            this.§1t4425s0§ = this.§1t4421s0§ >= 3;
            this.§1t4430s0§ = this.§1t4421s0§ >= 4;
            this.§1t4429s0§ = this.§1t4421s0§ >= 5;
            this.§1t4427s0§ = false;
            this.§1t4426s0§ = false;
         }
         else if(this.stance == §1t12221s0§)
         {
            this.§1t4427s0§ = this.§1t4422s0§ >= 3;
            this.§1t4430s0§ = this.§1t4422s0§ >= 4;
            this.§1t4425s0§ = this.§1t4422s0§ >= 5;
            this.§1t4426s0§ = false;
            this.§1t4429s0§ = false;
         }
         else if(this.stance == §1t12222s0§)
         {
            this.§1t4425s0§ = this.§1t4423s0§ >= 3;
            this.§1t4430s0§ = this.§1t4423s0§ >= 4;
            this.§1t4426s0§ = this.§1t4423s0§ >= 5;
            this.§1t4427s0§ = false;
            this.§1t4429s0§ = false;
         }
         else if(this.stance == §1t12224s0§ || this.stance == §1t12223s0§)
         {
            this.§1t4426s0§ = true;
            this.§1t4430s0§ = true;
            this.§1t4425s0§ = true;
            this.§1t4427s0§ = true;
            this.§1t4429s0§ = true;
         }
      }
      
      internal function §1t4475s0§() : int
      {
         var _loc2_:int = 0;
         var _loc1_:int = this.minDamage + Math.random() * this.damageRange;
         switch(this.stance)
         {
            case §1t12220s0§:
               _loc2_ = _loc1_ * (0.5 + 0.4 * this.§1t4421s0§ * 0.1);
               break;
            case §1t12221s0§:
               _loc2_ = _loc1_ * (1 + 0.2 * this.§1t4422s0§ * 0.1);
               break;
            case §1t12222s0§:
            case §1t12223s0§:
            case §1t12224s0§:
               _loc2_ = _loc1_ * 1.4;
         }
         if(this.§1t4414s0§ == this.§1t4415s0§)
         {
            return _loc2_ * 1.3 + this.§1t1243s0§;
         }
         return _loc2_;
      }
      
      public function §1t4476s0§() : int
      {
         return this.minDamage + Math.random() * this.damageRange;
      }
      
      internal function §1t4477s0§() : int
      {
         if(this.stance == §1t12222s0§)
         {
            return defense * 0.8;
         }
         return defense;
      }
      
      public function §1t4478s0§() : *
      {
         if(this.§1t4414s0§ == this.§1t4415s0§)
         {
            this.§1t4414s0§ = 0;
         }
         switch(this.stance)
         {
            case §1t12220s0§:
               this.§1t4414s0§ -= this.slashUsage / 2;
               break;
            case §1t12221s0§:
            case §1t12224s0§:
               this.§1t4414s0§ -= this.slashUsage;
               break;
            case §1t12222s0§:
            case §1t12223s0§:
               this.§1t4414s0§ -= this.slashUsage * 1.5;
         }
         if(this.§1t4414s0§ < 0)
         {
            this.§1t4414s0§ = 0;
         }
      }
      
      public function §1t4479s0§() : *
      {
         this.§1t4414s0§ += 6;
         if(this.§1t4414s0§ > this.§1t4415s0§)
         {
            this.§1t4414s0§ = this.§1t4415s0§;
         }
         §1t1525s0§.§1t9941s0§().§1t5205s0§(this.§1t4414s0§,this.§1t4415s0§);
      }
      
      override public function §1t3274s0§(param1:MovieClip, param2:§1t67s0§, param3:Boolean = false, param4:Boolean = false) : Boolean
      {
         var _loc12_:MovieClip = null;
         var _loc15_:* = undefined;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:§1t128s0§ = null;
         var _loc19_:§1t68s0§ = null;
         var _loc20_:§1t122s0§ = null;
         if(controlledBy == 0 && §1t1540s0§.§1t10049s0§())
         {
            return false;
         }
         if(controlledBy == 0 && (§1t1523s0§.§1t9479s0§ == §1t251s0§.§1t12137s0§ || §1t1523s0§.§1t9479s0§ == §1t251s0§.§1t12138s0§))
         {
            return false;
         }
         if(§1t3246s0§ > 0)
         {
            return false;
         }
         if(§1t406s0§.instance != null && §1t406s0§.instance.§1t6496s0§.§1t6853s0§())
         {
            return false;
         }
         if(actionState == §1t11197s0§)
         {
            return false;
         }
         if(param2.§1t1090s0§() == this)
         {
            return false;
         }
         if(actionState == §1t11161s0§)
         {
            _loc15_ = this.§1t4491s0§(§1t120s0§.§1t10127s0§);
            if(_loc15_ == 1)
            {
               _loc16_ = 75;
            }
            else if(_loc15_ == 2)
            {
               _loc16_ = 85;
            }
            else if(_loc15_ >= 3)
            {
               _loc16_ = 95;
            }
            if(int(Math.random() * 100) < _loc16_)
            {
               §1t3246s0§ = 12;
               §1t88s0§.instance.§1t1516s0§("Snd_jump");
               return true;
            }
         }
         if(this.§1t4465s0§() && this.§1t4414s0§ == this.§1t4415s0§ && (this.stance == §1t12220s0§ && this.§1t4491s0§(§1t120s0§.§1t10173s0§) > 0 || this.stance == §1t12221s0§ && this.§1t4491s0§(§1t120s0§.§1t10174s0§) > 0 || this.stance == §1t12222s0§ && this.§1t4491s0§(§1t120s0§.§1t10175s0§) > 0))
         {
            §1t3246s0§ = 12;
            §1t88s0§.instance.§1t1516s0§("Snd_jump");
            return true;
         }
         var _loc5_:int = param2.damage;
         var _loc6_:* = param2.§1t1066s0§;
         var _loc7_:int = param2.§1t1062s0§ - §1t1239s0§;
         var _loc8_:int = param2.§1t1063s0§ - §1t1241s0§;
         var _loc9_:int = param2.§1t1064s0§ - §1t1240s0§;
         var _loc10_:int = param2.§1t1065s0§ - §1t1242s0§;
         if(param2.§1t1062s0§ > 0 && _loc7_ < 1)
         {
            _loc7_ = 1;
         }
         else if(_loc7_ < 0)
         {
            _loc7_ = 0;
         }
         if(param2.§1t1063s0§ > 0 && _loc8_ < 1)
         {
            _loc8_ = 1;
         }
         else if(_loc8_ < 0)
         {
            _loc8_ = 0;
         }
         if(param2.§1t1064s0§ > 0 && _loc9_ < 1)
         {
            _loc9_ = 1;
         }
         else if(_loc9_ < 0)
         {
            _loc9_ = 0;
         }
         if(param2.§1t1065s0§ > 0 && _loc10_ < 1)
         {
            _loc10_ = 1;
         }
         else if(_loc10_ < 0)
         {
            _loc10_ = 0;
         }
         var _loc11_:int = 22;
         var _loc13_:Vector.<MovieClip> = mcs.§1t6231s0§;
         var _loc14_:* = int(_loc11_ - 1);
         while(_loc14_ >= 0)
         {
            _loc12_ = _loc13_[_loc14_];
            if(_loc12_.hitTestObject(param1) && (!param4 || param4 && (_loc14_ == 14 || _loc14_ == 15 || _loc12_.hitTestPoint(param1.x,param1.y,true))))
            {
               if(this.§1t4430s0§ && this.§1t4465s0§() && param1 is §1t128s0§)
               {
                  _loc18_ = §1t128s0§(param1);
                  if(_loc18_.§1t8110s0§())
                  {
                     _loc18_.§1t8109s0§();
                     §1t88s0§.instance.§1t1511s0§();
                     return false;
                  }
               }
               if(!(_loc14_ == 3 || _loc14_ == 4))
               {
                  if(this.§1t4435s0§ > 0)
                  {
                     if(param3 && controlledBy != 0)
                     {
                        this.§1t4495s0§();
                     }
                     else if(!param3 && controlledBy == 0)
                     {
                        this.§1t4489s0§();
                     }
                     else
                     {
                        this.§1t4495s0§();
                     }
                     param2.§1t1087s0§();
                     _loc5_ = 0;
                     _loc7_ = 0;
                     _loc9_ = 0;
                     _loc8_ = 0;
                     _loc10_ = 0;
                  }
                  §1t3254s0§ = 0;
                  if(!param3 && controlledBy == 2 && §1t251s0§.instance.§1t3476s0§() && !§1t1540s0§.§1t10015s0§())
                  {
                     §1t3246s0§ = 12;
                     this.§1t4494s0§();
                     return true;
                  }
                  if(this.§1t4433s0§ != null)
                  {
                     if(!(actionState == §1t11198s0§ && param2.§1t1066s0§ == §1t67s0§.§1t9116s0§))
                     {
                        this.§1t4433s0§.§1t8113s0§();
                        this.§1t4433s0§ = null;
                        this.§1t4432s0§ = 0;
                     }
                  }
                  _loc5_ -= this.§1t4477s0§();
                  if(_loc5_ < param2.§1t1088s0§())
                  {
                     _loc5_ = param2.§1t1088s0§();
                  }
                  _loc17_ = _loc5_ + _loc7_ + _loc9_ + _loc8_ + _loc10_;
                  §1t3308s0§(§1t3309s0§() - _loc17_);
                  §1t3246s0§ = 12;
                  this.§1t4494s0§();
                  if(controlledBy == 0)
                  {
                     if(_loc5_ + _loc7_ + _loc9_ + _loc8_ + _loc10_ > 0)
                     {
                        if(§1t1540s0§.§1t9550s0§())
                        {
                           if(§1t3309s0§() > 0)
                           {
                              §1t1523s0§.§1t9712s0§(0,§1t3309s0§());
                              §1t406s0§.instance.§1t6578s0§();
                              §1t406s0§.instance.§1t6535s0§();
                           }
                        }
                        else if(§1t1540s0§.§1t10013s0§())
                        {
                           §1t1525s0§.§1t9941s0§().§1t5201s0§(§1t3309s0§(),§1t3257s0§);
                           §1t1523s0§.§1t9724s0§();
                           §1t113s0§.instance.§1t5214s0§();
                           §1t113s0§.instance.§1t5232s0§();
                           if(_loc5_ > §1t3257s0§ / 5)
                           {
                              §1t1525s0§.§1t9960s0§(6,20);
                           }
                        }
                        §1t88s0§.instance.§1t1509s0§();
                     }
                  }
                  else
                  {
                     mcs.§1t3301s0§(§1t3309s0§() / §1t3257s0§);
                     §1t88s0§.instance.§1t1508s0§();
                  }
                  if(§1t3309s0§() <= 0)
                  {
                     if(§1t1523s0§.§1t9508s0§ && controlledBy == 2)
                     {
                        §1t3308s0§(1);
                     }
                     else
                     {
                        §1t3308s0§(0);
                        if(controlledBy == 0)
                        {
                           if(§1t1540s0§.§1t10047s0§() || §1t1540s0§.§1t10048s0§())
                           {
                              if(param1 is §1t128s0§)
                              {
                                 _loc19_ = §1t128s0§(param1).owner;
                                 if(_loc19_ is §1t122s0§ && !_loc19_.§1t3316s0§())
                                 {
                                    _loc20_ = §1t122s0§(_loc19_);
                                    §1t251s0§.instance.§1t3524s0§("[PvP]   ",806,[§1t251s0§.instance.§1t3624s0§(_loc20_.charname),§1t1523s0§.§1t9765s0§()]);
                                    §1t251s0§.instance.§1t3498s0§(_loc20_.charname,level);
                                    §1t5565s0§.instance.§1t5609s0§(_loc20_.tauntStr);
                                    §1t1524s0§.§1t9878s0§(§1t76s0§.§1t9196s0§,_loc20_.equipmentStr,_loc20_.level,_loc20_.charname);
                                 }
                              }
                           }
                           if(!§1t1540s0§.§1t10013s0§() || §1t1525s0§.§1t9952s0§())
                           {
                              if(§1t1525s0§.§1t9953s0§())
                              {
                                 §1t113s0§.instance.§1t5221s0§();
                                 §1t1557s0§(§1t10291s0§);
                              }
                           }
                           this.§1t3298s0§();
                        }
                        else if(controlledBy == 3)
                        {
                           this.§1t3298s0§();
                        }
                        target = null;
                     }
                  }
                  else
                  {
                     param2.§1t1099s0§(§1t1555s0§());
                     if(param2.§1t1078s0§())
                     {
                        this.§1t3284s0§(param2.§1t1067s0§,param2.§1t1068s0§,param2.attackerlvl);
                     }
                     else if(param2.§1t1079s0§())
                     {
                        this.§1t3285s0§(param2.§1t1067s0§,param2.§1t1068s0§);
                     }
                     else if((param2.§1t1073s0§() || actionState == §1t11147s0§ || actionState == §1t11145s0§ || actionState == §1t11144s0§) && !§1t3292s0§() && !param2.§1t1082s0§())
                     {
                        if(!(param2.stance != §1t12220s0§ && this.§1t4438s0§ >= 3))
                        {
                           if(!(param2.stance == §1t12220s0§ && this.§1t4438s0§ >= 5))
                           {
                              _loc6_ = §1t67s0§.§1t9117s0§;
                              param2.§1t1083s0§(§1t1559s0§().§1t6283s0§());
                              this.§1t3280s0§();
                           }
                        }
                     }
                     else if(param2.§1t1075s0§())
                     {
                        param2.§1t1083s0§(§1t1559s0§().§1t6283s0§());
                        this.§1t3281s0§();
                     }
                     else if(param2.§1t1076s0§())
                     {
                        this.§1t3282s0§(param2.§1t1067s0§,param2.§1t1068s0§);
                     }
                     else if(param2.§1t1077s0§())
                     {
                        this.§1t3283s0§(param1.x,param1.y);
                        param2.§1t1085s0§(velX,velY);
                     }
                     else if(param2.§1t1080s0§())
                     {
                        §1t3286s0§(param2.§1t1067s0§,param2.§1t1068s0§);
                     }
                     else if(!§1t3292s0§())
                     {
                        this.§1t3290s0§();
                     }
                     if(param2.§1t1081s0§())
                     {
                        this.§1t4488s0§(param2.§1t1067s0§,param2.§1t1068s0§);
                     }
                     if(_loc5_ > 0)
                     {
                        if(controlledBy == 0)
                        {
                           §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc5_.toString(),0);
                        }
                        else
                        {
                           §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc5_.toString(),10027008);
                        }
                     }
                     if(_loc7_ > 0)
                     {
                        §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc7_.toString(),16737792);
                     }
                     if(_loc9_ > 0)
                     {
                        §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc9_.toString(),13421772);
                     }
                     if(_loc8_ > 0)
                     {
                        §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc8_.toString(),26367);
                     }
                     if(_loc10_ > 0)
                     {
                        §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc10_.toString(),6697728);
                     }
                  }
                  if(param3 && controlledBy == 2 && (param2.§1t1090s0§().§1t3312s0§() || param2.§1t1090s0§().§1t3313s0§()))
                  {
                     §1t251s0§.instance.§1t3481s0§(nid,§1t3309s0§(),param2,false,param2.§1t1091s0§(),_loc17_);
                  }
                  else if(!param3 && (controlledBy == 0 || controlledBy == 3))
                  {
                     §1t251s0§.instance.§1t3481s0§(nid,§1t3309s0§(),param2,false,param2.§1t1091s0§(),_loc17_);
                  }
                  return true;
               }
            }
            _loc14_--;
         }
         return false;
      }
      
      override public function §1t3277s0§(param1:MovieClip, param2:§1t67s0§) : Boolean
      {
         var _loc3_:* = undefined;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = undefined;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         if(controlledBy == 0 && §1t1540s0§.§1t10049s0§())
         {
            return false;
         }
         if(§1t3246s0§ > 0)
         {
            return false;
         }
         if(actionState == §1t11197s0§)
         {
            return false;
         }
         if(actionState == §1t11161s0§)
         {
            _loc3_ = this.§1t4491s0§(§1t120s0§.§1t10127s0§);
            if(_loc3_ == 1)
            {
               _loc4_ = 75;
            }
            else if(_loc3_ == 2)
            {
               _loc4_ = 85;
            }
            else if(_loc3_ >= 3)
            {
               _loc4_ = 95;
            }
            if(int(Math.random() * 100) < _loc4_)
            {
               §1t3246s0§ = 12;
               return true;
            }
         }
         if(this.§1t4465s0§() && this.§1t4414s0§ == this.§1t4415s0§ && (this.stance == §1t12220s0§ && this.§1t4491s0§(§1t120s0§.§1t10173s0§) > 0 || this.stance == §1t12221s0§ && this.§1t4491s0§(§1t120s0§.§1t10174s0§) > 0 || this.stance == §1t12222s0§ && this.§1t4491s0§(§1t120s0§.§1t10175s0§) > 0))
         {
            §1t3246s0§ = 12;
            return true;
         }
         if(this.§1t4435s0§ > 0)
         {
            if(controlledBy == 2)
            {
               this.§1t4495s0§();
            }
            else
            {
               this.§1t4489s0§();
            }
            param2.§1t1087s0§();
         }
         §1t3254s0§ = 0;
         if(this.§1t4433s0§ != null)
         {
            if(!(actionState == §1t11198s0§ && param2.§1t1066s0§ == §1t67s0§.§1t9116s0§))
            {
               this.§1t4433s0§.§1t8113s0§();
               this.§1t4433s0§ = null;
               this.§1t4432s0§ = 0;
            }
         }
         if(§1t3309s0§() > 0)
         {
            switch(param1)
            {
               case mcs.§1t6231s0§[§1t75s0§.§1t12394s0§]:
               case mcs.§1t6231s0§[§1t75s0§.§1t12393s0§]:
               case mcs.§1t6231s0§[§1t75s0§.§1t12389s0§]:
                  §1t1071s0§ = true;
                  §1t3256s0§ = true;
                  break;
               default:
                  §1t1071s0§ = false;
                  §1t3256s0§ = true;
            }
            _loc5_ = param2.damage;
            _loc6_ = param2.§1t1066s0§;
            _loc7_ = param2.§1t1062s0§ - §1t1239s0§;
            _loc8_ = param2.§1t1063s0§ - §1t1241s0§;
            _loc9_ = param2.§1t1064s0§ - §1t1240s0§;
            _loc10_ = param2.§1t1065s0§ - §1t1242s0§;
            _loc11_ = param2.stance;
            if(param2.§1t1062s0§ > 0 && _loc7_ < 1)
            {
               _loc7_ = 1;
            }
            else if(_loc7_ < 0)
            {
               _loc7_ = 0;
            }
            if(param2.§1t1063s0§ > 0 && _loc8_ < 1)
            {
               _loc8_ = 1;
            }
            else if(_loc8_ < 0)
            {
               _loc8_ = 0;
            }
            if(param2.§1t1064s0§ > 0 && _loc9_ < 1)
            {
               _loc9_ = 1;
            }
            else if(_loc9_ < 0)
            {
               _loc9_ = 0;
            }
            if(param2.§1t1065s0§ > 0 && _loc10_ < 1)
            {
               _loc10_ = 1;
            }
            else if(_loc10_ < 0)
            {
               _loc10_ = 0;
            }
            _loc12_ = 0;
            if(this.stance == §1t12220s0§ && _loc11_ == §1t12221s0§ || this.stance == §1t12221s0§ && _loc11_ == §1t12222s0§ || this.stance == §1t12222s0§ && _loc11_ == §1t12220s0§)
            {
               _loc5_ *= 1.2;
               if(controlledBy != 0)
               {
                  _loc12_ = 16777215;
               }
            }
            else if(this.stance == §1t12220s0§ && _loc11_ == §1t12222s0§ || this.stance == §1t12221s0§ && _loc11_ == §1t12220s0§ || this.stance == §1t12222s0§ && _loc11_ == §1t12221s0§)
            {
               _loc5_ *= 0.9;
            }
            _loc5_ -= this.§1t4477s0§();
            if(_loc5_ < param2.§1t1088s0§())
            {
               _loc5_ = param2.§1t1088s0§();
            }
            if(§1t1071s0§)
            {
               _loc5_ *= 1.3;
            }
            _loc13_ = _loc5_ + _loc7_ + _loc9_ + _loc8_ + _loc10_;
            §1t3308s0§(§1t3309s0§() - _loc13_);
            §1t3246s0§ = 12;
            this.§1t4494s0§();
            if(controlledBy == 0)
            {
               if(_loc5_ > 0)
               {
                  if(§1t1540s0§.§1t10013s0§())
                  {
                     §1t1525s0§.§1t9941s0§().§1t5201s0§(§1t3309s0§(),§1t3257s0§);
                     §1t1523s0§.§1t9724s0§();
                     §1t113s0§.instance.§1t5232s0§();
                     §1t113s0§.instance.§1t5214s0§();
                     if(_loc5_ > §1t3257s0§ / 5)
                     {
                        §1t1525s0§.§1t9960s0§(6,20);
                     }
                  }
                  else
                  {
                     §1t1523s0§.§1t9712s0§(0,§1t3309s0§());
                     §1t406s0§.instance.§1t6578s0§();
                  }
                  §1t88s0§.instance.§1t1509s0§();
               }
            }
            else
            {
               mcs.§1t3301s0§(§1t3309s0§() / §1t3257s0§);
               §1t88s0§.instance.§1t1508s0§();
            }
            if(§1t3309s0§() <= 0)
            {
               §1t3308s0§(0);
               if(controlledBy == 0 || controlledBy == 3)
               {
                  this.§1t3298s0§();
               }
               param1 = null;
            }
            else
            {
               §1t1071s0§ = false;
               param2.§1t1099s0§(§1t1555s0§());
               if(§1t3292s0§())
               {
                  param2.§1t1074s0§();
               }
               if((param2.§1t1073s0§() || actionState == §1t11147s0§ || actionState == §1t11145s0§ || actionState == §1t11144s0§) && !§1t3292s0§() && !param2.§1t1082s0§())
               {
                  if(param2.stance != §1t12220s0§ && this.§1t4438s0§ >= 3)
                  {
                     param2.§1t1074s0§();
                  }
                  else if(param2.stance == §1t12220s0§ && this.§1t4438s0§ >= 5)
                  {
                     param2.§1t1074s0§();
                  }
                  else
                  {
                     _loc6_ = §1t67s0§.§1t9117s0§;
                     param2.§1t1083s0§(§1t1559s0§().§1t6283s0§());
                     this.§1t3280s0§();
                  }
               }
               else if(param2.§1t1075s0§())
               {
                  param2.§1t1083s0§(§1t1559s0§().§1t6283s0§());
                  this.§1t3281s0§();
               }
               else if(param2.§1t1076s0§())
               {
                  this.§1t3282s0§(param2.§1t1067s0§,param2.§1t1068s0§);
               }
               else if(param2.§1t1077s0§())
               {
                  this.§1t3283s0§(param1.x,param1.y);
                  param2.§1t1085s0§(velX,velY);
               }
               else if(param2.§1t1080s0§())
               {
                  §1t3286s0§(param2.§1t1067s0§,param2.§1t1068s0§);
               }
               else if(!§1t3292s0§())
               {
                  this.§1t3290s0§();
               }
               if(param2.§1t1081s0§())
               {
                  this.§1t4488s0§(param2.§1t1067s0§,param2.§1t1068s0§);
               }
               if(_loc5_ > 0)
               {
                  if(controlledBy == 0)
                  {
                     §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc5_.toString(),_loc12_);
                  }
                  else
                  {
                     §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc5_.toString(),10027008);
                  }
               }
               if(_loc7_ > 0)
               {
                  §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc7_.toString(),16737792);
               }
               if(_loc9_ > 0)
               {
                  §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc9_.toString(),13421772);
               }
               if(_loc8_ > 0)
               {
                  §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc8_.toString(),26367);
               }
               if(_loc10_ > 0)
               {
                  §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc10_.toString(),6697728);
               }
            }
            if(controlledBy == 2)
            {
               §1t251s0§.instance.§1t3481s0§(nid,§1t3309s0§(),param2,true,param2.§1t1091s0§(),_loc13_);
               if(§1t3309s0§() == 0)
               {
                  §1t3308s0§(1);
               }
            }
            return true;
         }
         return false;
      }
      
      public function §1t4480s0§(param1:int) : *
      {
         if(actionState == §1t11141s0§ || actionState == §1t11150s0§)
         {
            switch(param1)
            {
               case 0:
                  §1t1557s0§(§1t1544s0§.§1t10383s0§);
                  §1t251s0§.§1t9190s0§().§1t1557s0§(§1t1544s0§.§1t10383s0§);
                  break;
               case 1:
                  §1t1557s0§(§1t1544s0§.§1t10385s0§);
                  §1t251s0§.§1t9190s0§().§1t1557s0§(§1t1544s0§.§1t10385s0§);
                  break;
               case 2:
                  §1t1557s0§(§1t1544s0§.§1t10387s0§);
                  §1t251s0§.§1t9190s0§().§1t1557s0§(§1t1544s0§.§1t10387s0§);
                  break;
               case 3:
                  §1t1557s0§(§1t1544s0§.§1t10389s0§);
                  §1t251s0§.§1t9190s0§().§1t1557s0§(§1t1544s0§.§1t10389s0§);
                  break;
               case 4:
                  §1t1557s0§(§1t1544s0§.§1t10391s0§);
                  §1t251s0§.§1t9190s0§().§1t1557s0§(§1t1544s0§.§1t10391s0§);
                  break;
               case 5:
                  §1t1557s0§(§1t1544s0§.§1t10393s0§);
                  §1t251s0§.§1t9190s0§().§1t1557s0§(§1t1544s0§.§1t10393s0§);
                  break;
               case 6:
                  §1t1557s0§(§1t1544s0§.§1t10395s0§);
                  §1t251s0§.§1t9190s0§().§1t1557s0§(§1t1544s0§.§1t10395s0§);
                  break;
               case 7:
                  §1t1557s0§(§1t1544s0§.§1t10397s0§);
                  §1t251s0§.§1t9190s0§().§1t1557s0§(§1t1544s0§.§1t10397s0§);
                  break;
               case 8:
                  §1t1557s0§(§1t1544s0§.§1t10399s0§);
                  §1t251s0§.§1t9190s0§().§1t1557s0§(§1t1544s0§.§1t10399s0§);
                  break;
               case 9:
                  §1t1557s0§(§1t1544s0§.§1t10401s0§);
                  §1t251s0§.§1t9190s0§().§1t1557s0§(§1t1544s0§.§1t10401s0§);
            }
         }
      }
      
      override internal function §1t3288s0§() : *
      {
         mcs.y += velY;
         if(controlledBy == 0)
         {
            this.§1t4468s0§(velX);
         }
         else
         {
            §1t1553s0§(velX);
         }
         velY += 3;
         if(velY < 0 && velY > -4)
         {
            §1t1557s0§(§1t10405s0§);
         }
         var _loc1_:* = §1t1525s0§.§1t4467s0§();
         if(mcs.y >= _loc1_)
         {
            mcs.y = _loc1_;
            this.§1t3269s0§(§1t11152s0§);
            mcs.§1t6280s0§();
            if(controlledBy == 2)
            {
               this.§1t4408s0§ = posX;
            }
            this.§1t4438s0§ = 0;
         }
      }
      
      public function §1t4481s0§() : *
      {
         if(mcs.x < §1t1523s0§.stageWidth / 2)
         {
            mcs.§1t5493s0§();
         }
         else
         {
            mcs.§1t5492s0§();
         }
      }
      
      internal function §1t4482s0§() : *
      {
         if(this.§1t4437s0§ != null)
         {
            mcs.§1t6231s0§[§1t75s0§.§1t12392s0§].removeChild(this.§1t4437s0§);
         }
         this.§1t4437s0§ = null;
         this.§1t4435s0§ = 0;
         this.§1t4438s0§ = 0;
         mcs.alpha = 1;
         this.§1t4434s0§ = 0;
         this.§1t4407s0§ = false;
         this.§1t4405s0§ = false;
         this.§1t4406s0§ = false;
      }
      
      override public function §1t2292s0§() : *
      {
         this.§1t4482s0§();
         §1t1643s0§.§1t11216s0§(mcs,-255);
         mcs.§1t6287s0§("");
         mcs.§1t6288s0§("");
      }
      
      override public function §1t3298s0§() : *
      {
         if(this.§1t4433s0§ != null)
         {
            this.§1t4433s0§.§1t8113s0§();
            this.§1t4433s0§ = null;
         }
         if(controlledBy == 0)
         {
            §1t3258s0§ = true;
            mcs.y = this.§1t4467s0§();
            §1t1541s0§.§1t10111s0§();
            §1t1525s0§.§1t2292s0§();
            §1t3250s0§ = true;
            §1t1559s0§().§1t3312s0§ = true;
         }
         super.§1t3298s0§();
      }
      
      public function §1t4483s0§(param1:int, param2:String, param3:Boolean, param4:String, param5:int) : *
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc10_:int = 0;
         var _loc12_:Array = null;
         var _loc13_:§1t122s0§ = null;
         if(param1 > §1t3309s0§())
         {
            return;
         }
         if(§1t1540s0§.§1t10047s0§() && §1t406s0§.instance.§1t6496s0§.§1t6853s0§())
         {
            return;
         }
         if(§1t1525s0§.§1t9947s0§())
         {
            return;
         }
         if(controlledBy == 0 && (§1t1523s0§.§1t9479s0§ == §1t251s0§.§1t12137s0§ || §1t1523s0§.§1t9479s0§ == §1t251s0§.§1t12138s0§))
         {
            return;
         }
         if(!§1t1540s0§.§1t10013s0§() || §1t1525s0§.§1t9952s0§())
         {
            if(!§1t3258s0§ && param1 <= 0 && !param3 && §1t1525s0§.§1t9953s0§())
            {
               §1t113s0§.instance.§1t5221s0§();
               §1t1557s0§(§1t10291s0§);
            }
            return;
         }
         var _loc9_:int = -1;
         if(param2 == "")
         {
            _loc6_ = §1t67s0§.§1t9116s0§;
         }
         else
         {
            _loc12_ = param2.split(",");
            _loc6_ = int(_loc12_[0]);
            if(_loc6_ == §1t67s0§.§1t9117s0§ || _loc6_ == §1t67s0§.§1t9118s0§)
            {
               _loc7_ = int(_loc12_[1]);
               if(_loc12_.length >= 3)
               {
                  _loc9_ = int(_loc12_[2]);
               }
            }
            else if(_loc6_ == §1t67s0§.§1t9119s0§ || _loc6_ == §1t67s0§.§1t9120s0§ || _loc6_ == §1t67s0§.§1t9122s0§ || _loc6_ == §1t67s0§.§1t9123s0§)
            {
               _loc7_ = int(_loc12_[1]);
               _loc8_ = int(_loc12_[2]);
               if(_loc12_.length >= 4)
               {
                  _loc9_ = int(_loc12_[3]);
               }
            }
            else if(_loc6_ == §1t67s0§.§1t9121s0§)
            {
               _loc7_ = int(_loc12_[1]);
               _loc8_ = int(_loc12_[2]);
               _loc10_ = int(_loc12_[3]);
            }
            else if(_loc6_ == §1t67s0§.§1t9125s0§)
            {
               _loc7_ = int(_loc12_[1]);
               _loc8_ = int(_loc12_[2]);
            }
         }
         var _loc11_:int = §1t3309s0§() - param1;
         if(param3 && controlledBy == 0)
         {
            _loc13_ = §1t1543s0§.§1t10225s0§(param4);
            if(_loc13_ == null || _loc13_.§1t2364s0§() || _loc13_.§1t3292s0§() || _loc13_.actionState == §1t11147s0§)
            {
               return;
            }
         }
         if(_loc6_ != §1t67s0§.§1t9123s0§ && _loc11_ > 0)
         {
            §1t3308s0§(param1);
         }
         §1t1525s0§.§1t9941s0§().§1t5201s0§(§1t3309s0§(),§1t3257s0§);
         §1t1523s0§.§1t9724s0§();
         §1t3246s0§ = 12;
         §1t3254s0§ = 0;
         this.§1t4494s0§();
         if(this.§1t4433s0§ != null)
         {
            if(_loc11_ > 0 || _loc6_ != §1t67s0§.§1t9116s0§)
            {
               if(!(actionState == §1t11198s0§ && _loc6_ == §1t67s0§.§1t9116s0§))
               {
                  this.§1t4433s0§.§1t8113s0§();
                  this.§1t4433s0§ = null;
                  this.§1t4432s0§ = 0;
               }
            }
         }
         if(§1t3309s0§() <= 0)
         {
            if(param3)
            {
               if(controlledBy == 2)
               {
                  §1t3308s0§(1);
               }
               else if(controlledBy == 0)
               {
                  §1t251s0§.instance.§1t3487s0§(nid,param4);
                  this.§1t3298s0§();
               }
            }
            else
            {
               this.§1t3298s0§();
            }
         }
         else
         {
            if((_loc6_ == §1t67s0§.§1t9117s0§ || this.§1t4438s0§ < 3 && (actionState == §1t11147s0§ || actionState == §1t11145s0§ || actionState == §1t11144s0§)) && !§1t3292s0§())
            {
               if(_loc7_ == 1)
               {
                  §1t1559s0§().§1t5493s0§();
               }
               else
               {
                  §1t1559s0§().§1t5492s0§();
               }
               this.§1t3280s0§();
               _loc6_ = §1t67s0§.§1t9117s0§;
            }
            else if(_loc6_ == §1t67s0§.§1t9118s0§)
            {
               if(_loc7_ == 1)
               {
                  §1t1559s0§().§1t5493s0§();
               }
               else
               {
                  §1t1559s0§().§1t5492s0§();
               }
               this.§1t3281s0§();
            }
            else if(_loc6_ == §1t67s0§.§1t9119s0§)
            {
               this.§1t3282s0§(_loc7_,_loc8_);
            }
            else if(_loc6_ == §1t67s0§.§1t9120s0§)
            {
               this.§1t3283s0§(_loc7_,_loc8_);
            }
            else if(_loc6_ == §1t67s0§.§1t9121s0§)
            {
               this.§1t3284s0§(_loc7_,_loc8_,_loc10_);
            }
            else if(_loc6_ == §1t67s0§.§1t9125s0§)
            {
               this.§1t3285s0§(_loc7_,_loc8_);
            }
            else if(_loc6_ == §1t67s0§.§1t9122s0§)
            {
               §1t3286s0§(_loc7_,_loc8_);
            }
            else if(_loc6_ == §1t67s0§.§1t9124s0§)
            {
               this.§1t4489s0§();
            }
            else if(!§1t3292s0§() && actionState != §1t11147s0§ && actionState != §1t11145s0§ && actionState != §1t11144s0§)
            {
               this.§1t3290s0§();
            }
            if(_loc6_ == §1t67s0§.§1t9123s0§)
            {
               this.§1t4488s0§(_loc7_,_loc8_);
            }
            if(_loc11_ > 0 && controlledBy == 0)
            {
               if(param5 != 0)
               {
                  _loc11_ = param5;
               }
               §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc11_.toString(),0);
               §1t113s0§.instance.§1t5214s0§();
               §1t113s0§.instance.§1t5232s0§();
               §1t88s0§.instance.§1t1509s0§();
               if(_loc11_ > §1t3257s0§ / 5)
               {
                  §1t1525s0§.§1t9960s0§(6,20);
               }
            }
         }
      }
      
      public function §1t4484s0§(param1:String) : *
      {
         if(controlledBy != 0 && controlledBy != 2 || §1t3258s0§)
         {
            return;
         }
         if(§1t1540s0§.§1t10047s0§() && §1t406s0§.instance.§1t6496s0§.§1t6853s0§())
         {
            return;
         }
         if(controlledBy != 0 && §1t1523s0§.§1t9586s0§().§1t3258s0§ && (!§1t1540s0§.§1t10013s0§() || §1t1525s0§.§1t9952s0§()))
         {
            if(!§1t3258s0§ && §1t1525s0§.§1t9953s0§())
            {
               §1t113s0§.instance.§1t5221s0§();
               §1t1557s0§(§1t10291s0§);
            }
            return;
         }
         if(param1 != §1t251s0§.instance.nid)
         {
            §1t3250s0§ = true;
         }
         §1t3308s0§(0);
         this.§1t3298s0§();
         §1t1543s0§.§1t10236s0§();
      }
      
      public function §1t4485s0§(param1:int, param2:String, param3:String) : *
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc8_:int = 0;
         var _loc10_:Array = null;
      }
      
      public function §1t4486s0§(param1:String, param2:String) : *
      {
         var _loc3_:§1t67s0§ = null;
         var _loc4_:§1t122s0§ = null;
         var _loc5_:int = 0;
         var _loc6_:* = undefined;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         if(§1t3309s0§() > 0 && (controlledBy == 0 || controlledBy == 3))
         {
            if(§1t1525s0§.§1t9947s0§())
            {
               return;
            }
            _loc3_ = §1t67s0§.§1t9126s0§(param1);
            _loc4_ = §1t1543s0§.§1t10225s0§(param2);
            if(_loc4_ == null || _loc4_.§1t3292s0§() || _loc4_.actionState == §1t11147s0§)
            {
               return;
            }
            _loc5_ = _loc3_.damage;
            _loc6_ = _loc3_.§1t1066s0§;
            _loc7_ = _loc3_.§1t1062s0§ - §1t1239s0§;
            _loc8_ = _loc3_.§1t1063s0§ - §1t1241s0§;
            _loc9_ = _loc3_.§1t1064s0§ - §1t1240s0§;
            _loc10_ = _loc3_.§1t1065s0§ - §1t1242s0§;
            _loc11_ = _loc3_.stance;
            §1t1071s0§ = _loc3_.§1t1071s0§;
            if(_loc3_.§1t1069s0§ != -1)
            {
               setPosition(_loc3_.§1t1069s0§,§1t1559s0§().y);
            }
            if(_loc3_.§1t1062s0§ > 0 && _loc7_ < 1)
            {
               _loc7_ = 1;
            }
            else if(_loc7_ < 0)
            {
               _loc7_ = 0;
            }
            if(_loc3_.§1t1063s0§ > 0 && _loc8_ < 1)
            {
               _loc8_ = 1;
            }
            else if(_loc8_ < 0)
            {
               _loc8_ = 0;
            }
            if(_loc3_.§1t1064s0§ > 0 && _loc9_ < 1)
            {
               _loc9_ = 1;
            }
            else if(_loc9_ < 0)
            {
               _loc9_ = 0;
            }
            if(_loc3_.§1t1065s0§ > 0 && _loc10_ < 1)
            {
               _loc10_ = 1;
            }
            else if(_loc10_ < 0)
            {
               _loc10_ = 0;
            }
            _loc12_ = 0;
            if(this.stance == §1t12220s0§ && _loc11_ == §1t12221s0§ || this.stance == §1t12221s0§ && _loc11_ == §1t12222s0§ || this.stance == §1t12222s0§ && _loc11_ == §1t12220s0§)
            {
               _loc5_ *= 1.2;
               if(controlledBy != 0)
               {
                  _loc12_ = 16777215;
               }
            }
            else if(this.stance == §1t12220s0§ && _loc11_ == §1t12222s0§ || this.stance == §1t12221s0§ && _loc11_ == §1t12220s0§ || this.stance == §1t12222s0§ && _loc11_ == §1t12221s0§)
            {
               _loc5_ *= 0.9;
            }
            _loc5_ -= this.§1t4477s0§();
            if(_loc5_ < _loc3_.§1t1088s0§())
            {
               _loc5_ = _loc3_.§1t1088s0§();
            }
            if(§1t1071s0§)
            {
               _loc5_ *= 1.3;
            }
            §1t3308s0§(§1t3309s0§() - (_loc5_ + _loc7_ + _loc9_ + _loc8_ + _loc10_));
            §1t3246s0§ = 12;
            this.§1t4494s0§();
            if(controlledBy == 0)
            {
               if(_loc5_ > 0)
               {
                  if(§1t1540s0§.§1t10013s0§())
                  {
                     §1t1525s0§.§1t9941s0§().§1t5201s0§(§1t3309s0§(),§1t3257s0§);
                     §1t1523s0§.§1t9724s0§();
                     §1t113s0§.instance.§1t5232s0§();
                     §1t113s0§.instance.§1t5214s0§();
                  }
                  else
                  {
                     §1t1523s0§.§1t9712s0§(0,§1t3309s0§());
                     §1t406s0§.instance.§1t6578s0§();
                  }
                  §1t88s0§.instance.§1t1509s0§();
               }
            }
            else
            {
               mcs.§1t3301s0§(§1t3309s0§() / §1t3257s0§);
               §1t88s0§.instance.§1t1508s0§();
            }
            if(§1t3309s0§() <= 0)
            {
               §1t3308s0§(0);
               this.§1t3298s0§();
               target = null;
            }
            else
            {
               §1t1071s0§ = false;
               if(_loc3_.§1t1073s0§())
               {
                  if(_loc3_.§1t1067s0§ == 1)
                  {
                     §1t1559s0§().§1t5493s0§();
                  }
                  else
                  {
                     §1t1559s0§().§1t5492s0§();
                  }
                  this.§1t3280s0§();
               }
               else if(_loc6_ == §1t67s0§.§1t9124s0§)
               {
                  this.§1t4489s0§();
               }
               else if(!§1t3292s0§() && actionState != §1t11147s0§ && actionState != §1t11145s0§ && actionState != §1t11144s0§)
               {
                  this.§1t3290s0§();
               }
               if(_loc5_ > 0)
               {
                  if(controlledBy == 0)
                  {
                     §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc5_.toString(),_loc12_);
                  }
                  else
                  {
                     §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc5_.toString(),10027008);
                  }
               }
               if(_loc7_ > 0)
               {
                  §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc7_.toString(),16737792);
               }
               if(_loc9_ > 0)
               {
                  §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc9_.toString(),13421772);
               }
               if(_loc8_ > 0)
               {
                  §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc8_.toString(),26367);
               }
               if(_loc10_ > 0)
               {
                  §1t1712s0§.§1t11329s0§(mcs.x,mcs.y - 100,_loc10_.toString(),6697728);
               }
            }
            §1t251s0§.instance.§1t3485s0§(nid,§1t3309s0§(),_loc3_.§1t1100s0§(),param2);
         }
      }
      
      public function say(param1:String) : *
      {
         this.§1t4418s0§ = 240;
         if(mcs != null)
         {
            mcs.§1t6288s0§(param1);
         }
      }
      
      override internal function §1t3280s0§() : *
      {
         ++this.§1t4438s0§;
         if(controlledBy == 0)
         {
            this.§1t4406s0§ = false;
            this.§1t4407s0§ = false;
            this.§1t4405s0§ = false;
            §1t1541s0§.§1t10111s0§();
         }
         super.§1t3280s0§();
      }
      
      override internal function §1t3281s0§() : *
      {
         if(controlledBy == 0)
         {
            this.§1t4406s0§ = false;
            this.§1t4407s0§ = false;
            this.§1t4405s0§ = false;
            §1t1541s0§.§1t10111s0§();
         }
         super.§1t3281s0§();
      }
      
      internal function §1t4488s0§(param1:int, param2:int) : *
      {
         var _loc3_:int = 0;
         if(controlledBy == 0 || controlledBy == 3)
         {
            if(§1t1523s0§.§1t9766s0§)
            {
               _loc3_ = 500;
            }
            else
            {
               _loc3_ = this.§1t4441s0§() * 10;
               this.§1t4442s0§(0);
               if(controlledBy == 0)
               {
                  §1t1525s0§.§1t9941s0§().§1t5202s0§(this.§1t4441s0§(),this.§1t4413s0§);
               }
            }
         }
         §1t3246s0§ = 0;
         this.§1t3277s0§(§1t1559s0§(),new §1t67s0§(_loc3_,0,0));
         if(param1 != 0 && §1t3309s0§() > 0)
         {
            this.§1t3282s0§(param1,param2);
         }
         var _loc4_:§1t67s0§ = new §1t67s0§(_loc3_,0,§1t67s0§.§1t9119s0§);
         _loc4_.§1t1089s0§(this);
         _loc4_.§1t1084s0§(param1,param2);
         if(controlledBy == 0)
         {
            this.§1t4406s0§ = false;
            this.§1t4407s0§ = false;
            this.§1t4405s0§ = false;
            §1t251s0§.instance.§1t3481s0§(nid,§1t3309s0§(),_loc4_);
            §1t1525s0§.§1t9960s0§(12);
            §1t1541s0§.§1t10111s0§();
         }
      }
      
      internal function §1t4489s0§() : *
      {
         if(controlledBy == 0 || controlledBy == 3)
         {
            §1t251s0§.instance.§1t3269s0§(§1t1544s0§.§1t11176s0§,§1t1555s0§(),§1t1559s0§().y,§1t1559s0§().§1t6283s0§());
         }
         this.§1t3269s0§(§1t11176s0§);
         this.§1t4495s0§();
         this.§1t4406s0§ = false;
         this.§1t4407s0§ = false;
         this.§1t4405s0§ = false;
      }
      
      override internal function §1t3284s0§(param1:int, param2:int, param3:int) : *
      {
         if(!§1t3264s0§ || §1t3292s0§() || actionState == §1t11153s0§)
         {
            return;
         }
         super.§1t3284s0§(param1,param2,param3);
         this.§1t4442s0§(this.§1t4441s0§() - param3);
         if(this.§1t4441s0§() < 0)
         {
            this.§1t4442s0§(0);
         }
         if(controlledBy == 0)
         {
            §1t1525s0§.§1t9941s0§().§1t5202s0§(this.§1t4441s0§(),this.§1t4413s0§);
            this.§1t4406s0§ = false;
            this.§1t4407s0§ = false;
            this.§1t4405s0§ = false;
            §1t1541s0§.§1t10111s0§();
         }
      }
      
      override internal function §1t3285s0§(param1:int, param2:int) : *
      {
         if(!§1t3264s0§ || §1t3292s0§() || actionState == §1t11153s0§)
         {
            return;
         }
         super.§1t3285s0§(param1,param2);
         if(controlledBy == 0)
         {
            this.§1t4406s0§ = false;
            this.§1t4407s0§ = false;
            this.§1t4405s0§ = false;
            mcs.§1t6286s0§(false);
            §1t1541s0§.§1t10111s0§();
         }
      }
      
      override internal function §1t3282s0§(param1:int, param2:int) : *
      {
         super.§1t3282s0§(param1,param2);
         if(controlledBy == 0)
         {
            this.§1t4406s0§ = false;
            this.§1t4407s0§ = false;
            this.§1t4405s0§ = false;
            §1t1541s0§.§1t10111s0§();
         }
      }
      
      override internal function §1t3283s0§(param1:int, param2:int) : *
      {
         super.§1t3283s0§(param1,param2);
         if(controlledBy == 0)
         {
            this.§1t4406s0§ = false;
            this.§1t4407s0§ = false;
            this.§1t4405s0§ = false;
            §1t1541s0§.§1t10111s0§();
         }
      }
      
      override internal function §1t3289s0§() : *
      {
         super.§1t3289s0§();
         if(controlledBy == 0)
         {
            §1t1525s0§.§1t9951s0§();
         }
      }
      
      public function §1t4490s0§(param1:int) : Boolean
      {
         if(param1 == 0 || this.§1t4456s0§())
         {
            return true;
         }
         if(param1 > this.§1t4441s0§())
         {
            return false;
         }
         this.§1t4442s0§(this.§1t4441s0§() - param1);
         if(controlledBy == 0)
         {
            §1t1525s0§.§1t9941s0§().§1t5202s0§(this.§1t4441s0§(),this.§1t4413s0§);
         }
         return true;
      }
      
      override public function §1t3306s0§() : String
      {
         if(controlledBy == 2 || controlledBy == 3)
         {
            return nid;
         }
         return "";
      }
      
      internal function §1t4491s0§(param1:int) : int
      {
         return §1t1523s0§.§1t9714s0§(param1);
      }
      
      override public function §1t3290s0§() : *
      {
         if(actionState == §1t11198s0§ || actionState == §1t11169s0§ || actionState == §1t11149s0§)
         {
            return;
         }
         §1t3251s0§ = actionState;
         §1t3252s0§ = mcs.animation;
         §1t3253s0§ = mcs.§1t6269s0§;
         actionState = §1t11169s0§;
         if(§1t3252s0§ == §1t10259s0§ || §1t3252s0§ == §1t10269s0§ || §1t3252s0§ == §1t10271s0§ || §1t3252s0§ == §1t10367s0§)
         {
            §1t1557s0§(§1t10423s0§);
         }
         else
         {
            §1t1557s0§(§1t10421s0§);
         }
      }
      
      override public function §1t3291s0§() : *
      {
         actionState = §1t3251s0§;
         §1t1557s0§(§1t3252s0§);
         mcs.§1t6269s0§ = §1t3253s0§;
         if(this.§1t4455s0§() || actionState == §1t11150s0§)
         {
            this.§1t3269s0§(§1t11141s0§);
         }
         if(controlledBy == 1 || this.§1t4431s0§)
         {
            this.§1t4501s0§();
         }
      }
      
      public function §1t4492s0§() : int
      {
         var _loc1_:int = this.§1t4432s0§ / 24;
         if(_loc1_ > 10)
         {
            _loc1_ = 10;
         }
         return _loc1_;
      }
      
      public function §1t4493s0§() : *
      {
         this.§1t4432s0§ = 0;
      }
      
      public function §1t4494s0§() : *
      {
         if(!§1t1559s0§().visible || §1t1559s0§().alpha < 1)
         {
            §1t1712s0§.§1t11333s0§(§1t1555s0§(),§1t1559s0§().y);
         }
         §1t1559s0§().visible = true;
         §1t1559s0§().alpha = 1;
      }
      
      public function §1t4495s0§() : *
      {
         this.§1t4435s0§ = 0;
         §1t3246s0§ = 12;
         if(this.§1t4437s0§ != null)
         {
            mcs.§1t6231s0§[§1t75s0§.§1t12392s0§].removeChild(this.§1t4437s0§);
         }
         this.§1t4437s0§ = null;
      }
      
      override public function §1t3305s0§() : *
      {
         if(this.§1t4433s0§ != null)
         {
            this.§1t4433s0§.§1t8113s0§();
            this.§1t4433s0§ = null;
         }
         if(mcs != null)
         {
            mcs.§1t3305s0§();
            mcs = null;
         }
      }
      
      public function §1t4496s0§() : Boolean
      {
         return this.§1t4431s0§;
      }
      
      public function §1t4497s0§(param1:Boolean) : *
      {
         if(§1t1540s0§.§1t10062s0§())
         {
            this.§1t4431s0§ = false;
            return;
         }
         if(param1)
         {
            target = §1t1543s0§.§1t10231s0§(§1t1555s0§());
         }
         this.§1t4431s0§ = param1;
      }
      
      internal function §1t4498s0§() : *
      {
         if(target == null)
         {
            target = §1t1543s0§.§1t10231s0§(§1t1555s0§());
            if(target == null)
            {
               return;
            }
         }
         this.moveTo(target.§1t1555s0§(),§1t1559s0§().y);
      }
      
      internal function §1t4501s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc5_:Point = null;
         if(§1t3260s0§ || §1t3292s0§() || this.§1t4455s0§() || §1t1525s0§.§1t9952s0§() || actionState == §1t11169s0§ || actionState == §1t11174s0§ || actionState == §1t11173s0§ || actionState == §1t11198s0§)
         {
            return;
         }
         if(target == null || target.§1t2364s0§() || target.actionState == §1t11197s0§)
         {
            target = §1t1543s0§.§1t10231s0§(§1t1555s0§());
            if(target == null)
            {
               if(§1t1555s0§() < 100 || §1t1555s0§() > §1t1525s0§.§1t8124s0§() - 100)
               {
                  this.moveTo(Math.random() * (§1t1525s0§.§1t8124s0§() - 300) + 150,§1t1525s0§.§1t4467s0§());
               }
               return;
            }
         }
         if(§1t1525s0§.§1t9947s0§())
         {
            if(actionState == §1t11141s0§ && Math.abs(this.§1t4503s0§() - §1t1555s0§()) < 100)
            {
               this.moveTo(Math.random() * §1t1525s0§.§1t8124s0§(),§1t1525s0§.§1t4467s0§());
            }
            return;
         }
         if(target.§1t1559s0§().alpha < 1 || !target.§1t1559s0§().visible)
         {
            if(int(Math.random() * 3) == 0)
            {
               this.moveTo(Math.random() * §1t1525s0§.§1t8124s0§(),§1t1525s0§.§1t4467s0§());
            }
            return;
         }
         if(!(actionState == §1t11149s0§ || actionState == §1t11148s0§ || actionState == §1t11145s0§))
         {
            if(this.§1t4406s0§ || mcs.animation == §1t10313s0§ || mcs.animation == §1t10315s0§)
            {
               _loc2_ = int(this.§1t4499s0§.length);
               _loc3_ = false;
               _loc4_ = 0;
               while(_loc4_ < _loc2_ && !_loc3_)
               {
                  _loc5_ = this.§1t4499s0§[_loc4_];
                  if(target.mcs.hitTestPoint(_loc5_.x,_loc5_.y,true))
                  {
                     _loc3_ = true;
                  }
                  _loc4_++;
               }
               if(!_loc3_)
               {
                  this.§1t4508s0§();
               }
            }
            else if(target.§1t3292s0§())
            {
               if(this.§1t4426s0§)
               {
                  this.§1t4507s0§();
               }
               else if(int(Math.random() * 2) == 0)
               {
                  this.§1t4509s0§();
               }
               else
               {
                  this.moveTo(Math.random() * §1t1525s0§.§1t8124s0§(),§1t1525s0§.§1t4467s0§());
               }
            }
            else if(this.§1t4429s0§ && target.§1t3293s0§())
            {
               if(Math.abs(this.§1t4503s0§() - §1t1555s0§()) < 120)
               {
                  if(this.stance == §1t12220s0§ || this.stance == §1t12221s0§)
                  {
                     if(this.§1t4503s0§() < mcs.x)
                     {
                        this.§1t4505s0§();
                     }
                     else
                     {
                        this.§1t4506s0§();
                     }
                  }
               }
            }
            else
            {
               _loc1_ = Math.random() * 4;
               if(this.§1t4414s0§ < this.§1t4500s0§ && _loc1_ == 0)
               {
                  if(actionState == §1t11141s0§ || actionState == §1t11150s0§)
                  {
                     this.moveTo(Math.random() * §1t1525s0§.§1t8124s0§(),§1t1525s0§.§1t4467s0§());
                  }
               }
               else if(this.§1t4414s0§ < 24 && _loc1_ == 0)
               {
                  this.§1t4500s0§ = 24 + Math.random() * (this.§1t4415s0§ - 24);
                  this.moveTo(Math.random() * §1t1525s0§.§1t8124s0§(),§1t1525s0§.§1t4467s0§());
               }
               else
               {
                  target = §1t1543s0§.§1t10231s0§(§1t1555s0§());
                  if(target != null)
                  {
                     _loc1_ = Math.random() * 3;
                     if(_loc1_ == 0)
                     {
                        if(this.§1t4425s0§ && !§1t3293s0§())
                        {
                           this.§1t4504s0§();
                        }
                        else
                        {
                           this.§1t4508s0§();
                        }
                     }
                     else
                     {
                        this.§1t4508s0§();
                     }
                     this.§1t4500s0§ = 0;
                  }
                  else if(§1t1555s0§() < 50 || §1t1555s0§() > §1t1525s0§.§1t8124s0§() - 50)
                  {
                     this.moveTo(Math.random() * (§1t1525s0§.§1t8124s0§() - 100) + 50,§1t1525s0§.§1t4467s0§());
                  }
               }
            }
         }
      }
      
      internal function moveTo(param1:int, param2:int) : *
      {
         this.§1t4499s0§.length = 0;
         this.§1t4499s0§.push(new Point(param1,param2));
         this.§1t4450s0§(this.§1t4499s0§,false);
      }
      
      internal function §1t4503s0§() : int
      {
         return target.§1t1555s0§() - §1t1525s0§.§1t8131s0§();
      }
      
      internal function §1t4504s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc1_ = this.§1t4503s0§();
         _loc2_ = target.mcs.y;
         _loc4_ = -20;
         _loc3_ = 0;
         this.§1t4510s0§(_loc1_,_loc2_,_loc3_,_loc4_);
      }
      
      internal function §1t4505s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Number = Math.atan(Math.abs(mcs.y - target.mcs.y) / Math.abs(§1t1555s0§() - this.§1t4503s0§()));
         _loc5_ = _loc5_ - 0.1745;
         var _loc6_:* = this.§1t4417s0§ / 2;
         _loc1_ = §1t1555s0§();
         _loc2_ = mcs.y - 80;
         _loc4_ = -20 * Math.sin(_loc5_);
         _loc3_ = -20 * Math.sin(_loc5_);
         this.§1t4510s0§(_loc1_,_loc2_,_loc3_,_loc4_);
      }
      
      internal function §1t4506s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Number = Math.atan(Math.abs(mcs.y - target.mcs.y) / Math.abs(§1t1555s0§() - this.§1t4503s0§()));
         _loc5_ = _loc5_ - 0.1745;
         var _loc6_:* = this.§1t4417s0§ / 2;
         _loc1_ = §1t1555s0§();
         _loc2_ = mcs.y - 80;
         _loc4_ = -20 * Math.sin(_loc5_);
         _loc3_ = 20 * Math.cos(_loc5_);
         this.§1t4510s0§(_loc1_,_loc2_,_loc3_,_loc4_);
      }
      
      internal function §1t4507s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(target.§1t1559s0§().§1t6283s0§())
         {
            _loc1_ = this.§1t4503s0§() - 100;
         }
         else
         {
            _loc1_ = this.§1t4503s0§() + 100;
         }
         _loc3_ = target.mcs.y + 50;
         _loc2_ = _loc3_ - this.§1t4417s0§ / 2;
         _loc5_ = 20;
         _loc4_ = 0;
         this.§1t4510s0§(_loc1_,_loc2_,_loc4_,_loc5_);
      }
      
      internal function §1t4508s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(target == null || target.mcs == null)
         {
            return;
         }
         if(target.mcs.x < mcs.x)
         {
            _loc2_ = target.mcs.y - 40;
            _loc5_ = -20;
            _loc6_ = -2;
            if(target.§1t1559s0§().§1t6283s0§())
            {
               _loc1_ = this.§1t4503s0§() + this.§1t4417s0§ * 2 / 3;
            }
            else
            {
               _loc1_ = this.§1t4503s0§() + this.§1t4417s0§ / 3;
            }
         }
         else
         {
            _loc2_ = target.mcs.y - 40;
            _loc5_ = 20;
            _loc6_ = -2;
            if(target.§1t1559s0§().§1t6283s0§())
            {
               _loc1_ = this.§1t4503s0§() - this.§1t4417s0§ / 3;
            }
            else
            {
               _loc1_ = this.§1t4503s0§() - this.§1t4417s0§ * 2 / 3;
            }
         }
         this.§1t4510s0§(_loc1_,_loc2_,_loc5_,_loc6_);
      }
      
      internal function §1t4509s0§() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(target.§1t1559s0§().§1t6283s0§())
         {
            _loc5_ = this.§1t4503s0§() - 100;
         }
         else
         {
            _loc5_ = this.§1t4503s0§() + 100;
         }
         if(_loc5_ < posX)
         {
            _loc2_ = target.mcs.y - 10;
            _loc3_ = -20;
            _loc4_ = 0;
            _loc1_ = _loc5_ + this.§1t4417s0§ / 2;
         }
         else
         {
            _loc2_ = target.mcs.y - 10;
            _loc3_ = 20;
            _loc4_ = 0;
            _loc1_ = _loc5_ - this.§1t4417s0§ / 2;
         }
         this.§1t4510s0§(_loc1_,_loc2_,_loc3_,_loc4_);
      }
      
      internal function §1t4510s0§(param1:int, param2:int, param3:int, param4:int) : *
      {
         this.§1t4499s0§.length = 0;
         var _loc5_:int = this.§1t4417s0§ / 20;
         this.§1t4499s0§.push(new Point(param1,param2));
         var _loc6_:int = 1;
         while(_loc6_ < _loc5_)
         {
            this.§1t4499s0§.push(new Point(param1 + _loc6_ * param3,param2 + _loc6_ * param4));
            _loc6_++;
         }
         this.§1t4450s0§(this.§1t4499s0§,true);
         if(controlledBy == 0)
         {
            §1t1541s0§.§1t10116s0§(this.§1t4499s0§,0);
         }
      }
      
      public function §1t4511s0§(param1:String, param2:String) : *
      {
         var _loc3_:Array = null;
         switch(param1)
         {
            case "anim":
               §1t1557s0§(param2);
               break;
            case "1t15242s0":
               _loc3_ = param2.split(",");
               §1t1559s0§().§1t6246s0§(_loc3_[0],_loc3_[1]);
               break;
            case "face":
               if(param2 == "right")
               {
                  §1t1559s0§().§1t5493s0§();
               }
               else
               {
                  §1t1559s0§().§1t5492s0§();
               }
               break;
            case "walk":
               this.moveTo(int(param2),§1t1525s0§.§1t4467s0§());
               break;
            case "say":
               §1t1559s0§().§1t6288s0§(§1t1521s0§.getString(int(param2)));
               break;
            case "setposition":
               _loc3_ = param2.split(",");
               setPosition(int(_loc3_[0]),int(_loc3_[1]));
         }
      }
      
      public function §1t4512s0§() : Boolean
      {
         return this.§1t4435s0§ > 0;
      }
      
      override public function §1t1561s0§() : *
      {
         §1t1547s0§ = false;
         mcs.displayName.visible = true;
      }
      
      override public function §1t1562s0§() : *
      {
         --§1t1548s0§;
         if(§1t1548s0§ <= 0)
         {
            §1t1548s0§ = 6;
            mcs.displayName.visible = !mcs.displayName.visible;
         }
      }
   }
}

