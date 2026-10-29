package
{
   import flash.geom.Point;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2229")]
   public class Obj_TownMarker extends InteractiveStageObject
   {
      
      public function Obj_TownMarker(props:String, objname:String = "")
      {
         super();
         addFrameScript(0,this.frame1);
         this.props = props;
         var townlevel:int = int(props);
         if(townlevel <= 2)
         {
            gotoAndStop(1);
         }
         else
         {
            gotoAndStop(2);
         }
         iconID = NodeUI.ACTION_LOOK;
      }
      
      override public function interact() : *
      {
         var territory:Point = NodeGenerator.instance.getTerritory(StageManager.getCurrentNode());
         var territoryData:TerritoryData = NodeGenerator.instance.getTerritoryData(territory.x,territory.y,false);
         territoryData.showTownData();
      }
      
      override public function getDisplayText() : String
      {
         return LangManager.getString(148);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

