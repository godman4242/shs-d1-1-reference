package
{
   import flash.display.MovieClip;
   
   public class GameStage
   {
      
      public static var stageWidth:int = 720;
      
      public static var groundY:int = 350;
      
      public static var currentStage:int = 0;
      
      public var bossNext:Boolean = false;
      
      public var spawnDelay:int = 0;
      
      public var area:int = 0;
      
      public var playerGotoLeft:Boolean = false;
      
      internal var spawnArray:Array;
      
      public var totalAreas:int = 0;
      
      public var maxEnemies:int = 0;
      
      public var scrollCounter:int = 0;
      
      public var enemiesInWaiting:int = -100;
      
      public function GameStage()
      {
         super();
      }
      
      public static function setStage(param1:int) : *
      {
         currentStage = param1;
      }
      
      public static function getStage() : GameStage
      {
         if(currentStage == 1)
         {
            return ForestStage.instance;
         }
         if(currentStage == 2)
         {
            return MountainStage.instance;
         }
         if(currentStage == 3)
         {
            return BattlefieldStage.instance;
         }
         if(currentStage == 4)
         {
            return FortWallsStage.instance;
         }
         return null;
      }
      
      public function clearFilterAll() : *
      {
      }
      
      public function update() : *
      {
      }
      
      public function getRandomPlatform() : MovieClip
      {
         return null;
      }
      
      public function autoScrollPress() : *
      {
      }
      
      public function scrollRight(param1:int) : *
      {
         EnemyManager.instance.scrollRight(param1);
         ProjectileManager.instance.scrollRight(param1);
      }
      
      public function desaturateAll() : *
      {
      }
      
      public function redFreeze() : *
      {
      }
      
      public function nextArea() : *
      {
      }
      
      public function winBossFight() : *
      {
         trace("GameStage.winBossFight()");
      }
      
      public function unRedFreeze() : *
      {
      }
      
      public function doScroll(param1:int) : *
      {
      }
      
      public function getClosestPlatform() : MovieClip
      {
         return null;
      }
   }
}

