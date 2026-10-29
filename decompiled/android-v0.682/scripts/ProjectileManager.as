package
{
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class ProjectileManager
   {
      
      internal static var projectileList:* = new Vector.<Projectile>();
      
      internal static var lootList:* = new Vector.<LootProjectile>();
      
      public static var PROJ_KUNAI:int = 0;
      
      public static var PROJ_FIREBALL:int = 1;
      
      public static var PROJ_SLASHWAVE:int = 2;
      
      public static var PROJ_NINJASMOKE:int = 3;
      
      public static var PROJ_LOGSMOKE:int = 4;
      
      public static var PROJ_NINJASMOKE2:int = 5;
      
      public static var PROJ_FIREBREATH:int = 6;
      
      public static var PROJ_TRAP:int = 7;
      
      public static var PROJ_TRAPEXPLOSION:int = 8;
      
      public static var PROJ_TRAPFIRE:int = 9;
      
      public static var PROJ_TRAPWATER:int = 10;
      
      public static var PROJ_TRAPWIND:int = 11;
      
      public static var PROJ_TRAPEARTH:int = 12;
      
      public static var PROJ_KUNAIFIRE:int = 13;
      
      public static var PROJ_KUNAIWATER:int = 14;
      
      public static var PROJ_KUNAIWIND:int = 15;
      
      public static var PROJ_KUNAIEARTH:int = 16;
      
      public static var PROJ_GROUNDPUNCH:int = 17;
      
      public static var PROJ_WINDKICK:int = 18;
      
      public static var PROJ_WATERSPLASH:int = 19;
      
      public static var PROJ_BLADESLASHFX:int = 20;
      
      public static var PROJ_CHIPUNCH:int = 21;
      
      public static var PROJ_CHIKICK:int = 22;
      
      public static var PROJ_CHIBURST:int = 23;
      
      public static var PROJ_HEAVENLYSWORD:int = 24;
      
      public static var PROJ_YINYANG:int = 25;
      
      public static var PROJ_CHARGEDSHOT:int = 26;
      
      public static var PROJ_CHARGINGSHOTFX:int = 27;
      
      public static var PROJ_CHARGINGFX:int = 28;
      
      public static var PROJ_SHUNPOHIT:int = 29;
      
      public static var PROJ_CLEAVEHIT:int = 30;
      
      public static var PROJ_DASHFX:int = 31;
      
      public static var PROJ_WINDMILL:int = 32;
      
      public static var PROJ_FLASHBANG:int = 33;
      
      public static var PROJ_WHITEOUTFX:int = 34;
      
      public static var PROJ_NINJASMOKE3:int = 35;
      
      public static var PROJ_BOULDER:int = 36;
      
      public static var PROJ_VOIDSKULL:int = 37;
      
      public static var PROJ_VOIDFIRECOLUMN:int = 38;
      
      public static var PROJ_BIGROCK:int = 39;
      
      public static var PROJ_ARROW:int = 40;
      
      public static var PROJ_ARROWDUD:int = 41;
      
      public static var PROJ_PURPLEEXPLOSION:int = 42;
      
      public static var PROJ_INFERNO:int = 43;
      
      public static var PROJ_TORNADO:int = 44;
      
      public static var PROJ_TSUNAMI:int = 45;
      
      public static var PROJ_EARTHQUAKE:int = 46;
      
      public function ProjectileManager()
      {
         super();
      }
      
      public static function init() : *
      {
         projectileList.fixed = false;
         projectileList.length = 0;
         projectileList.fixed = true;
         lootList.fixed = false;
         lootList.length = 0;
         lootList.fixed = true;
      }
      
      public static function destroy() : *
      {
         projectileList.fixed = false;
         projectileList.length = 0;
         lootList.fixed = false;
         lootList.length = 0;
      }
      
      public static function createProjectile(type:int, x:int, y:int, velX:Number, velY:Number, damage:int, skilllevel:int, owner:NPC) : Projectile
      {
         var newprojectile:Projectile = null;
         switch(type)
         {
            case PROJ_KUNAI:
               newprojectile = new KunaiProjectile(0);
               break;
            case PROJ_FIREBALL:
               newprojectile = new FireballProjectile();
               break;
            case PROJ_SLASHWAVE:
               newprojectile = new SlashWaveProjectile();
               break;
            case PROJ_NINJASMOKE:
               createSmoke(x,y);
               return null;
            case PROJ_LOGSMOKE:
               newprojectile = new LogSmokeProjectile();
               break;
            case PROJ_NINJASMOKE2:
               createSmoke2(x,y);
               return null;
            case PROJ_NINJASMOKE3:
               createSmoke3(x,y);
               return null;
            case PROJ_FIREBREATH:
               newprojectile = new FireBreathProjectile();
               break;
            case PROJ_TRAP:
               newprojectile = new TrapProjectile(0);
               break;
            case PROJ_TRAPEXPLOSION:
               createTrapExplosion(x,y);
               return null;
            case PROJ_TRAPFIRE:
               newprojectile = new TrapProjectile(1);
               break;
            case PROJ_TRAPWATER:
               newprojectile = new TrapProjectile(2);
               break;
            case PROJ_TRAPWIND:
               newprojectile = new TrapProjectile(3);
               break;
            case PROJ_TRAPEARTH:
               newprojectile = new TrapProjectile(4);
               break;
            case PROJ_KUNAIFIRE:
               newprojectile = new KunaiProjectile(1);
               break;
            case PROJ_KUNAIWATER:
               newprojectile = new KunaiProjectile(2);
               break;
            case PROJ_KUNAIWIND:
               newprojectile = new KunaiProjectile(3);
               break;
            case PROJ_KUNAIEARTH:
               newprojectile = new KunaiProjectile(4);
               break;
            case PROJ_GROUNDPUNCH:
               newprojectile = new GroundPunchProjectile();
               break;
            case PROJ_WINDKICK:
               newprojectile = new WindKickProjectile();
               break;
            case PROJ_WATERSPLASH:
               newprojectile = new WaterSplashProjectile();
               break;
            case PROJ_BLADESLASHFX:
               createBladeSlashFx(x,y);
               return null;
            case PROJ_CHIPUNCH:
               newprojectile = new ChiPunchProjectile();
               break;
            case PROJ_CHIKICK:
               newprojectile = new ChiKickProjectile();
               break;
            case PROJ_CHIBURST:
               newprojectile = new ChiBurstProjectile();
               break;
            case PROJ_HEAVENLYSWORD:
               newprojectile = new HeavenlySwordProjectile();
               break;
            case PROJ_YINYANG:
               newprojectile = new YinYangDownFX();
               newprojectile.init(velX,velY,damage,skilllevel,owner);
               StageManager.getGameStageCanvas().parent.addChild(newprojectile);
               var stagepos:int = StageManager.getStagePosition();
               newprojectile.x = x - stagepos;
               newprojectile.y = y - 10;
               register(newprojectile);
               newprojectile = new YinYangUpFX();
               newprojectile.init(velX,velY,damage,skilllevel,owner);
               StageManager.getGameStageCanvas().addChild(newprojectile);
               StageManager.getGameStageCanvas().setChildIndex(newprojectile,0);
               newprojectile.x = x - stagepos;
               newprojectile.y = y - 10;
               register(newprojectile);
               return newprojectile;
            case PROJ_CHARGEDSHOT:
               newprojectile = new ChargedShotProjectile();
               break;
            case PROJ_CHARGINGFX:
               newprojectile = new ChargingFX();
               break;
            case PROJ_CHARGINGSHOTFX:
               newprojectile = new ChargingShotFX();
               break;
            case PROJ_SHUNPOHIT:
               newprojectile = new ShunpoHitProjectile();
               break;
            case PROJ_CLEAVEHIT:
               newprojectile = new CleaveHitProjectile();
               break;
            case PROJ_DASHFX:
               newprojectile = new DashFX();
               break;
            case PROJ_WINDMILL:
               newprojectile = new WindmillProjectile();
               break;
            case PROJ_FLASHBANG:
               newprojectile = new FlashbangProjectile();
               break;
            case PROJ_WHITEOUTFX:
               newprojectile = new WhiteOutFX();
               newprojectile.init(velX,velY,damage,skilllevel,owner);
               StageManager.getGameStage().addChild(newprojectile);
               register(newprojectile);
               return newprojectile;
            case PROJ_BOULDER:
               newprojectile = new BoulderProjectile();
               break;
            case PROJ_VOIDSKULL:
               newprojectile = new VoidSkullProjectile();
               break;
            case PROJ_VOIDFIRECOLUMN:
               newprojectile = new VoidFireColumnProjectile();
               break;
            case PROJ_BIGROCK:
               newprojectile = new BigRockProjectile();
               break;
            case PROJ_ARROW:
               return createArrow(x - StageManager.getStagePosition(),y,velX,velY,damage,skilllevel == 2,owner);
            case PROJ_ARROWDUD:
               newprojectile = new ArrowDudProjectile();
               break;
            case PROJ_PURPLEEXPLOSION:
               newprojectile = new PurpleExplosionProjectile();
               break;
            case PROJ_INFERNO:
               newprojectile = new BigFireBreathProjectile();
               break;
            case PROJ_TORNADO:
               newprojectile = new BigTornadoProjectile();
               break;
            case PROJ_TSUNAMI:
               newprojectile = new BigWaveProjectile();
               break;
            case PROJ_EARTHQUAKE:
               newprojectile = new BigEarthquakeProjectile();
         }
         newprojectile.init(velX,velY,damage,skilllevel,owner);
         StageManager.getGameStageCanvas().addChild(newprojectile);
         stagepos = StageManager.getStagePosition();
         newprojectile.x = x - stagepos;
         newprojectile.y = y;
         register(newprojectile);
         return newprojectile;
      }
      
      public static function register(projectile:Projectile) : *
      {
         projectileList.fixed = false;
         projectileList.push(projectile);
         projectileList.fixed = true;
      }
      
      public static function unregister(projectile:Projectile) : *
      {
         var max:int = int(projectileList.length);
         for(var i:int = 0; i < max; i++)
         {
            if(projectileList[i] == projectile)
            {
               projectileList.fixed = false;
               projectileList.splice(i,1);
               projectileList.fixed = true;
               return;
            }
         }
      }
      
      public static function registerLoot(projectile:LootProjectile) : *
      {
         lootList.fixed = false;
         lootList.push(projectile);
         lootList.fixed = true;
      }
      
      public static function unregisterLoot(projectile:LootProjectile) : *
      {
         var max:int = int(lootList.length);
         for(var i:int = 0; i < max; i++)
         {
            if(lootList[i] == projectile)
            {
               lootList.fixed = false;
               lootList.splice(i,1);
               lootList.fixed = true;
               return;
            }
         }
      }
      
      public static function hideLoot() : *
      {
         var max:int = int(lootList.length);
         for(var i:int = 0; i < max; i++)
         {
            lootList[i].visible = false;
         }
      }
      
      public static function redFreeze() : *
      {
         var max:int = int(projectileList.length);
         for(var i:int = 0; i < max; i++)
         {
            projectileList[i].redFreeze();
         }
         hideLoot();
      }
      
      public static function gotLootClicked(mousex:int, mousey:int) : Boolean
      {
         var max:int = int(lootList.length);
         for(var i:int = 0; i < max; i++)
         {
            if(lootList[i].hitTestPoint(mousex,mousey))
            {
               lootList[i].gotClicked();
               return true;
            }
         }
         return false;
      }
      
      public static function createFlyingPart(part:MovieClip, movtx:int, movty:int, rot:int) : *
      {
         var pt:Point = new Point(part.x,part.y);
         pt.x += MovieClip(part.parent).x;
         pt.y += MovieClip(part.parent).y;
         var projectile:PartProjectile = ProjectilePool.getPart();
         if(projectile == null)
         {
            return;
         }
         StageManager.getGameStageCanvas().addChild(projectile);
         projectile.x = pt.x;
         projectile.y = pt.y;
         projectile.initPart(movtx,movty,rot);
         var thing:DisplayObject = part.getChildAt(0);
         projectile.addChild(thing);
         thing.x = part.width / 2;
         thing.y = part.height / 2;
         thing.rotation = 0;
         register(projectile);
         if(StageManager.isRedFreeze())
         {
            ColorCode.makeDark(projectile,-255);
         }
      }
      
      public static function createFlyingHead(part:MovieClip, movtx:int, movty:int, rot:int) : PartProjectile
      {
         var pt:Point = new Point(part.x,part.y);
         pt.x += MovieClip(part.parent).x;
         pt.y += MovieClip(part.parent).y;
         var projectile:PartProjectile = ProjectilePool.getPart();
         if(projectile == null)
         {
            return null;
         }
         StageManager.getGameStageCanvas().addChild(projectile);
         projectile.x = pt.x;
         projectile.y = pt.y;
         projectile.initPart(movtx,movty,rot);
         part.x = 0;
         part.y = 0;
         projectile.addChild(part);
         register(projectile);
         if(StageManager.isRedFreeze())
         {
            ColorCode.makeDark(projectile,-255);
         }
         return projectile;
      }
      
      public static function createLootProjectile(x:int, y:int, movtx:int, movty:int, rot:int, lootType:int) : *
      {
         var projectile:LootProjectile = ProjectilePool.getLoot();
         if(projectile == null)
         {
            return;
         }
         StageManager.getGameStageCanvas().addChild(projectile);
         projectile.x = x;
         projectile.y = y;
         projectile.initLoot(movtx,movty,rot,lootType);
         register(projectile);
         registerLoot(projectile);
      }
      
      public static function createArrow(posx:int, posy:int, movtx:int, movty:int, damage:int, canLaunch:Boolean = false, owner:NPC = null) : *
      {
         var projectile:ArrowProjectile = ProjectilePool.getArrow();
         if(projectile == null)
         {
            return;
         }
         StageManager.getGameStageCanvas().addChild(projectile);
         projectile.x = posx;
         projectile.y = posy;
         projectile.initArrow(movtx,movty,damage,canLaunch,owner);
         register(projectile);
      }
      
      public static function createRock(posx:int, posy:int, movtx:int, movty:int, damage:int, owner:NPC = null) : *
      {
         var projectile:RockProjectile = new RockProjectile();
         StageManager.getGameStageCanvas().addChild(projectile);
         projectile.x = posx;
         projectile.y = posy;
         projectile.initRock(movtx,movty,damage,owner);
         register(projectile);
      }
      
      public static function createFloatingText(posx:int, posy:int, str:String, color:int = 10027008) : *
      {
         var projectile:TextProjectile = ProjectilePool.getFloatingText();
         if(projectile == null || StageManager.isRedFreeze())
         {
            return;
         }
         StageManager.getGameStageCanvas().addChild(projectile);
         projectile.x = posx;
         projectile.y = posy;
         projectile.initText(str,color);
         register(projectile);
      }
      
      public static function createVegetableProjectile(posx:int, posy:int, movtx:int, movty:int, type:int, mc:VegetableProjectile = null) : *
      {
         var projectile:VegetableProjectile = null;
         if(mc == null)
         {
            projectile = new VegetableProjectile();
         }
         else
         {
            projectile = mc;
            type = mc.currentFrame;
         }
         StageManager.getGameStageCanvas().addChild(projectile);
         projectile.x = posx;
         projectile.y = posy;
         projectile.initVegetable(movtx,movty,type);
         register(projectile);
      }
      
      internal static function createBladeSlashFx(x:int, y:int) : *
      {
         var bladeslash:bladeslashfx = new bladeslashfx();
         bladeslash.x = x;
         bladeslash.y = y;
         StageManager.getGameStageCanvas().addChild(bladeslash);
      }
      
      public static function createSmoke(x:int, y:int) : *
      {
         var ninjaSmoke:NinjaSmoke = new NinjaSmoke();
         var stagepos:int = StageManager.getStagePosition();
         ninjaSmoke.x = x - stagepos;
         ninjaSmoke.y = y;
         StageManager.getGameStageCanvas().addChild(ninjaSmoke);
      }
      
      public static function createSmoke2(x:int, y:int) : *
      {
         var ninjaSmoke:NinjaSmoke2 = new NinjaSmoke2();
         var stagepos:int = StageManager.getStagePosition();
         ninjaSmoke.x = x - stagepos;
         ninjaSmoke.y = y;
         StageManager.getGameStageCanvas().addChild(ninjaSmoke);
      }
      
      public static function createSmoke3(x:int, y:int) : *
      {
         var ninjaSmoke:NinjaSmoke3 = new NinjaSmoke3();
         var stagepos:int = StageManager.getStagePosition();
         ninjaSmoke.x = x - stagepos;
         ninjaSmoke.y = y;
         StageManager.getGameStageCanvas().addChild(ninjaSmoke);
      }
      
      public static function createTrapExplosion(x:int, y:int) : *
      {
         var trapExplode:TrapExplode = new TrapExplode();
         var stagepos:int = StageManager.getStagePosition();
         trapExplode.x = x - stagepos;
         trapExplode.y = y;
         StageManager.getGameStageCanvas().addChild(trapExplode);
      }
      
      public static function createLogSmoke(x:int, y:int) : *
      {
         var logSmoke:LogSmokeProjectile = null;
         logSmoke = new LogSmokeProjectile();
         var stagepos:int = StageManager.getStagePosition();
         logSmoke.x = x - stagepos;
         logSmoke.y = y;
         StageManager.getGameStageCanvas().addChild(logSmoke);
      }
      
      public static function update() : *
      {
         var max:int = int(projectileList.length);
         for(var i:* = 0; i < projectileList.length; i++)
         {
            projectileList[i].update();
         }
      }
      
      public static function doScroll(dist:int) : *
      {
         var max:int = int(projectileList.length);
         for(var i:* = 0; i < max; i++)
         {
            if(projectileList[i].visible)
            {
               projectileList[i].doScroll(dist);
            }
         }
      }
      
      public static function refreshRoom() : *
      {
         var max:int = int(projectileList.length);
         for(var i:* = max - 1; i >= 0; i--)
         {
            projectileList[i].removeProjectile();
         }
         destroy();
      }
   }
}

