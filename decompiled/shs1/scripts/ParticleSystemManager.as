package
{
   import flash.display.MovieClip;
   
   public class ParticleSystemManager
   {
      
      public static var instance:ParticleSystemManager;
      
      internal static var particleSystemList:* = new Array();
      
      public static var quality:* = "HIGH";
      
      internal var gameStage:MovieClip;
      
      internal var cleanUpCounter:int;
      
      internal var cleanUpCounterMax:int = 30 * 24;
      
      public function ParticleSystemManager(param1:MovieClip)
      {
         cleanUpCounter = cleanUpCounterMax;
         super();
         this.gameStage = param1;
         instance = this;
      }
      
      public static function isAbleToSupport() : Boolean
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         _loc1_ = 2;
         if(quality == "HIGH")
         {
            _loc1_ = 2;
         }
         else if(quality == "MEDIUM")
         {
            _loc1_ = 1;
         }
         else if(quality == "LOW")
         {
            _loc1_ = 1;
         }
         _loc2_ = 0;
         _loc3_ = 0;
         while(_loc3_ < particleSystemList.length)
         {
            if(particleSystemList[_loc3_].isActive())
            {
               _loc2_++;
            }
            _loc3_++;
         }
         return _loc2_ < _loc1_;
      }
      
      public function reinit(param1:MovieClip) : *
      {
         this.gameStage = param1;
         particleSystemList = new Array();
         cleanUpCounter = cleanUpCounterMax;
      }
      
      public function cleanUp() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         _loc1_ = new Array();
         _loc2_ = 0;
         while(_loc2_ < particleSystemList.length)
         {
            if(!particleSystemList[_loc2_].removeMe)
            {
               _loc1_.push(particleSystemList[_loc2_]);
            }
            _loc2_++;
         }
         particleSystemList = _loc1_;
      }
      
      public function update() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = 0;
         while(_loc1_ < particleSystemList.length)
         {
            particleSystemList[_loc1_].update();
            _loc1_++;
         }
         --cleanUpCounter;
         if(cleanUpCounter <= 0 || particleSystemList.length > 50)
         {
            cleanUpCounter = cleanUpCounterMax;
            cleanUp();
         }
      }
      
      public function createParticleSystem(param1:int, param2:int, param3:int, param4:MovieClip) : ParticleSystem
      {
         var _loc5_:ParticleSystem = null;
         switch(param1)
         {
            case BloodParticleSystem.typeCode:
               _loc5_ = new BloodParticleSystem(param2,param3,param4);
         }
         particleSystemList.push(_loc5_);
         return _loc5_;
      }
      
      public function getGameStage() : MovieClip
      {
         return gameStage;
      }
   }
}

