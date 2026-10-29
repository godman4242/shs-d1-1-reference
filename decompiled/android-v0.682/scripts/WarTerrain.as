package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol698")]
   public class WarTerrain extends MovieClip
   {
      
      public static var TERRAIN_FIELD:int = 0;
      
      public static var TERRAIN_FOREST:int = 1;
      
      public static var TERRAIN_MOUNTAIN:int = 2;
      
      public var road:MovieClip;
      
      internal var terrainType:int = 0;
      
      internal var exitArrayNum:int;
      
      internal var locationType:int;
      
      public function WarTerrain()
      {
         super();
         stop();
      }
      
      public function setTerrain(roomtype:int, locationType:int, exitArrayNum:int) : *
      {
         if(roomtype == GameStage.BG_BAMBOOFOREST || roomtype == GameStage.BG_FOREST)
         {
            this.terrainType = TERRAIN_FOREST;
         }
         else if(roomtype == GameStage.BG_BATTLEFIELD || roomtype == GameStage.BG_PADIFIELD)
         {
            this.terrainType = TERRAIN_FIELD;
         }
         else if(roomtype == GameStage.BG_MOUNTAIN || roomtype == GameStage.BG_CAVE)
         {
            this.terrainType = TERRAIN_MOUNTAIN;
         }
         this.locationType = locationType;
         this.exitArrayNum = exitArrayNum;
         gotoAndStop(this.terrainType * 16 + exitArrayNum);
         if(exitArrayNum == 0)
         {
            this.road.gotoAndStop(16);
         }
         else
         {
            this.road.gotoAndStop(exitArrayNum);
         }
      }
      
      public function getTerrainType() : int
      {
         return this.terrainType;
      }
      
      public function getTerrainValue() : int
      {
         return this.terrainType;
      }
      
      public function isTown() : Boolean
      {
         return this.locationType == NodeGenerator.ICON_TOWN;
      }
      
      public function isControlPoint() : Boolean
      {
         return this.locationType == NodeGenerator.ICON_CONTROL;
      }
      
      public function isExit() : Boolean
      {
         return this.locationType == NodeGenerator.ICON_EXIT;
      }
      
      public function getExitArray() : Array
      {
         return [this.exitArrayNum & 1,this.exitArrayNum >> 1 & 1,this.exitArrayNum >> 2 & 1,this.exitArrayNum >> 3 & 1];
      }
      
      public function getExitArrayNum() : int
      {
         return this.exitArrayNum;
      }
   }
}

