package
{
   import flash.display.MovieClip;
   
   public class ProjectileManager
   {
      
      public static var instance:ProjectileManager;
      
      internal var cleanUpCounterMax:int = 60 * 24;
      
      internal var projectileList:* = new Array();
      
      internal var cleanUpCounter:int = cleanUpCounterMax;
      
      internal var gameStage:MovieClip;
      
      public function ProjectileManager(param1:MovieClip)
      {
         super();
         this.gameStage = param1;
         instance = this;
      }
      
      public function reinit(param1:MovieClip) : *
      {
         this.gameStage = param1;
         projectileList = new Array();
         cleanUpCounter = cleanUpCounterMax;
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
            case Javalin.typeCode:
               _loc6_ = new Javalin(param2,param3,param4,param5);
               break;
            case HeadProjectile.typeCode:
               _loc6_ = new HeadProjectile(param2,param3,param4,param5);
               break;
            case ArmProjectile.typeCode:
               _loc6_ = new ArmProjectile(param2,param3,param4,param5);
               break;
            case Arrow_player.typeCode:
               _loc6_ = new Arrow_player(param2,param3,param4,param5);
               break;
            case Arrow_broken.typeCode:
               _loc6_ = new Arrow_broken(param2,param3,param4,param5);
               break;
            case HatProjectile.typeCode:
               _loc6_ = new HatProjectile(param2,param3,param4,param5);
               break;
            case BodyProjectile.typeCode:
               _loc6_ = new BodyProjectile(param2,param3,param4,param5);
               break;
            case BallProjectile.typeCode:
               _loc6_ = new BallProjectile(param2,param3,param4,param5);
               break;
            case ScarecrowProjectile.typeCode:
               _loc6_ = new ScarecrowProjectile(param2,param3,param4,param5);
               break;
            case ScarecrowProjectileBlack.typeCode:
               _loc6_ = new ScarecrowProjectileBlack(param2,param3,param4,param5);
         }
         if(param1 == Arrow.typeCode || param1 == BallProjectile.typeCode)
         {
            MovieClip(gameStage.parent).stagebg1.addChild(_loc6_);
         }
         else
         {
            gameStage.addChild(_loc6_);
         }
         projectileList.push(_loc6_);
         return _loc6_;
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
      
      public function checkHit(param1:Array, param2:Array) : *
      {
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         var _loc10_:* = undefined;
         _loc3_ = new Array();
         _loc4_ = new Array();
         _loc3_.push(param1[0]);
         _loc4_.push(param2[0]);
         _loc5_ = 1;
         while(_loc5_ < param1.length)
         {
            _loc8_ = (param1[_loc5_] - param1[_loc5_ - 1]) / 4;
            _loc9_ = (param2[_loc5_] - param2[_loc5_ - 1]) / 4;
            _loc3_.push(param1[_loc5_ - 1] + _loc8_);
            _loc4_.push(param2[_loc5_ - 1] + _loc9_);
            _loc3_.push(param1[_loc5_ - 1] + 2 * _loc8_);
            _loc4_.push(param2[_loc5_ - 1] + 2 * _loc9_);
            _loc3_.push(param1[_loc5_ - 1] + 3 * _loc8_);
            _loc4_.push(param2[_loc5_ - 1] + 3 * _loc9_);
            _loc3_.push(param1[_loc5_]);
            _loc4_.push(param2[_loc5_]);
            _loc5_++;
         }
         _loc6_ = gameStage.x;
         _loc7_ = 0;
         while(_loc7_ < projectileList.length)
         {
            _loc10_ = 0;
            while(_loc10_ < _loc3_.length)
            {
               if(Boolean(projectileList[_loc7_].isFlying()) && MovieClip(projectileList[_loc7_]).hitTestPoint(_loc3_[_loc10_],_loc4_[_loc10_],true))
               {
                  projectileList[_loc7_].breakarrow();
               }
               _loc10_++;
            }
            _loc7_++;
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
      
      public function getGameStage() : MovieClip
      {
         return gameStage;
      }
   }
}

