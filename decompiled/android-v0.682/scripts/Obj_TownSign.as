package
{
   import flash.geom.Point;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2155")]
   public class Obj_TownSign extends InteractiveStageObject
   {
      
      internal var destName:String;
      
      internal var apuse:int = 1;
      
      internal var townSide:int;
      
      internal var underAttack:int;
      
      public function Obj_TownSign(props:String, objname:String = "")
      {
         var territory:Point = null;
         super();
         this.props = props;
         if(objname == "")
         {
            objectName = "townsign";
         }
         else
         {
            objectName = objname;
         }
         var strArray:Array = props.split(",");
         this.townSide = int(strArray[0]);
         this.underAttack = int(strArray[1]);
         this.destName = StageManager.getRoomName(1,-1);
         iconID = NodeUI.ACTION_TRAVEL;
         if(StatsManager.isCustomClan(this.townSide))
         {
            territory = NodeGenerator.instance.getTerritory(StageManager.getCurrentNode());
            QueryManagerPIO.instance.getCustomClanTownOwnerName(territory.x,territory.y);
         }
      }
      
      override public function interact() : *
      {
         if(!GameEngine.isPvPRoomMode() && StatsManager.findWeight() > StatsManager.getCarryingWeight())
         {
            OverworldHUD.instance.showDialogBig(LangManager.getString(138),LangManager.getString(5));
            return;
         }
         if(!StatsManager.checkAP(this.apuse))
         {
            OverworldHUD.instance.showDialogAP(LangManager.getString(100),LangManager.getString(5));
            return;
         }
         OverworldHUD.instance.showInteractUI(InteractUI.UIMODE_TOWNTOLL,this.underAttack);
      }
      
      override public function getDisplayText() : String
      {
         return this.destName;
      }
      
      override public function getAPUse() : int
      {
         return this.apuse;
      }
   }
}

