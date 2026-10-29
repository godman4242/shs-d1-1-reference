package
{
   import flash.display.MovieClip;
   
   public class ProjectileManager
   {
      
      public static var instance:ProjectileManager;
      
      internal var cleanUpCounter:int;
      
      internal var projectileList:* = new Array();
      
      internal var cleanUpCounterMax:int = 60 * 24;
      
      internal var gameStage:MovieClip;
      
      public function ProjectileManager()
      {
         cleanUpCounter = cleanUpCounterMax;
         super();
         instance = this;
      }
      
      public function cleanUp() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         _loc1_ = new Array();
         _loc2_ = 0;
         while(_loc2_ < projectileList.length)
         {
            if(!projectileList[_loc2_].removeMe)
            {
               _loc1_.push(projectileList[_loc2_]);
            }
            else
            {
               projectileList[_loc2_].remove();
            }
            _loc2_++;
         }
         projectileList = _loc1_;
      }
      
      public function createProjectile(param1:int, param2:int, param3:int, param4:Number, param5:Number) : Projectile
      {
         var _loc6_:Projectile = null;
         switch(param1)
         {
            case Arrow.typeCode:
               _loc6_ = new Arrow(param2,param3,param4,param5);
               break;
            case Arrow_broken.typeCode:
               _loc6_ = new Arrow_broken(param2,param3,param4,param5);
               break;
            case HeadProjectile.typeCode:
               _loc6_ = new HeadProjectile(param2,param3,param4,param5);
               break;
            case ArmProjectile.typeCode:
               _loc6_ = new ArmProjectile(param2,param3,param4,param5);
               break;
            case HatProjectile.typeCode:
               _loc6_ = new HatProjectile(param2,param3,param4,param5);
               break;
            case Arrow_fire.typeCode:
               _loc6_ = new Arrow_fire(param2,param3,param4,param5);
               break;
            case Projectile_wave.typeCode:
               _loc6_ = new Projectile_wave(param2,param3,param4,param5);
               break;
            case Projectile_knife.typeCode:
               _loc6_ = new Projectile_knife(param2,param3,param4,param5);
               break;
            case Projectile_firebomb.typeCode:
               _loc6_ = new Projectile_firebomb(param2,param3,param4,param5);
               break;
            case Projectile_rocket_down.typeCode:
               _loc6_ = new Projectile_rocket_down(param2,param3,param4,param5);
               break;
            case Projectile_rocket_homing.typeCode:
               _loc6_ = new Projectile_rocket_homing(param2,param3,param4,param5);
         }
         gameStage.addChild(_loc6_);
         projectileList.push(_loc6_);
         if(Player.instance.isRedFreeze)
         {
            ColorCode.makeDark(_loc6_,-255);
         }
         return _loc6_;
      }
      
      public function scrollUp(param1:int) : *
      {
         var _loc2_:* = undefined;
         _loc2_ = 0;
         while(_loc2_ < projectileList.length)
         {
            if(projectileList[_loc2_].visible)
            {
               projectileList[_loc2_].y += param1;
            }
            _loc2_++;
         }
      }
      
      public function update() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = 0;
         while(_loc1_ < projectileList.length)
         {
            projectileList[_loc1_].update();
            _loc1_++;
         }
         --cleanUpCounter;
         if(cleanUpCounter <= 0 || projectileList.length > 50)
         {
            cleanUpCounter = cleanUpCounterMax;
            cleanUp();
         }
      }
      
      public function makeInvis() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = 0;
         while(_loc1_ < projectileList.length)
         {
            projectileList[_loc1_].visible = false;
            _loc1_++;
         }
      }
      
      public function init(param1:MovieClip) : *
      {
         this.gameStage = param1;
         projectileList = new Array();
         cleanUpCounter = cleanUpCounterMax;
      }
      
      public function desaturateAll() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = 0;
         while(_loc1_ < projectileList.length)
         {
            if(projectileList[_loc1_].visible)
            {
               ColorCode.desaturate(projectileList[_loc1_]);
            }
            _loc1_++;
         }
      }
      
      public function scrollRight(param1:int) : *
      {
         var _loc2_:* = undefined;
         _loc2_ = 0;
         while(_loc2_ < projectileList.length)
         {
            if(projectileList[_loc2_].visible)
            {
               projectileList[_loc2_].scrollRight(param1);
            }
            _loc2_++;
         }
      }
      
      public function continueAnimation() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = 0;
         while(_loc1_ < projectileList.length)
         {
            if(projectileList[_loc1_].visible)
            {
               projectileList[_loc1_].continueAnimation();
            }
            _loc1_++;
         }
      }
      
      public function stopAnimation() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = 0;
         while(_loc1_ < projectileList.length)
         {
            if(projectileList[_loc1_].visible)
            {
               projectileList[_loc1_].stopAnimation();
            }
            _loc1_++;
         }
      }
      
      public function checkHit(param1:Array, param2:Array) : *
      {
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         _loc3_ = 0;
         while(_loc3_ < projectileList.length)
         {
            if(projectileList[_loc3_].isFlying())
            {
               _loc4_ = 0;
               while(_loc4_ < param1.length)
               {
                  if(!projectileList[_loc3_].gotHit && Math.abs(projectileList[_loc3_].x - param1[_loc4_]) < 100 && MovieClip(projectileList[_loc3_]).hitTestPoint(param1[_loc4_],param2[_loc4_],true))
                  {
                     projectileList[_loc3_].breakarrow();
                     projectileList[_loc3_].gotHit = true;
                     Player.instance.increasePowerMeter(1);
                  }
                  _loc4_++;
               }
            }
            _loc3_++;
         }
      }
      
      public function getGameStage() : MovieClip
      {
         return gameStage;
      }
      
      public function clearFilterAll() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = 0;
         while(_loc1_ < projectileList.length)
         {
            if(projectileList[_loc1_].visible)
            {
               ColorCode.clearFilter(projectileList[_loc1_]);
            }
            _loc1_++;
         }
      }
      
      public function makeDarkAll(param1:int) : *
      {
         var _loc2_:* = undefined;
         _loc2_ = 0;
         while(_loc2_ < projectileList.length)
         {
            if(projectileList[_loc2_].visible)
            {
               ColorCode.makeDark(projectileList[_loc2_],param1);
            }
            _loc2_++;
         }
      }
   }
}

