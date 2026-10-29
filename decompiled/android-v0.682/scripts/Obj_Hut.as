package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2121")]
   public class Obj_Hut extends InteractiveStageObject
   {
      
      public var door:MovieClip;
      
      internal var destroom:int = 1;
      
      internal var destxpos:int = 400;
      
      public var flipped:Boolean = false;
      
      public function Obj_Hut(props:String = "")
      {
         super();
         var strArray:Array = props.split(",");
         if(strArray.length > 0 && strArray[0] == "1")
         {
            this.door.visible = false;
            canInteract = true;
         }
         else
         {
            canInteract = false;
         }
         if(strArray.length > 1)
         {
            this.destroom = strArray[1];
         }
         if(strArray.length > 2)
         {
            this.destxpos = strArray[2];
         }
         iconID = NodeUI.ACTION_TRAVEL;
      }
      
      override public function doScroll(dist:int) : *
      {
         x += dist / 2;
      }
      
      override public function needTransition() : Boolean
      {
         if(StatsManager.findWeight() > StatsManager.getCarryingWeight() || StatsManager.getStat(StatsManager.STAT_AP) <= 0)
         {
            return false;
         }
         return true;
      }
      
      override public function interactClick() : *
      {
         if(this.needTransition())
         {
            OverworldHUD.getInstance().screenTransition.setParam(this);
            OverworldHUD.getInstance().screenTransition.startClose(ScreenTransition.ACTION_INTERACT);
         }
         else
         {
            this.interact();
         }
      }
      
      override public function interact() : *
      {
         if(StatsManager.findWeight() > StatsManager.getCarryingWeight())
         {
            OverworldHUD.instance.showDialogBig(LangManager.getString(138),LangManager.getString(5));
            return;
         }
         if(!StatsManager.checkAP(1))
         {
            OverworldHUD.instance.showDialogAP(LangManager.getString(100),LangManager.getString(5));
            return;
         }
         StageManager.gotoRoom(this.destroom,this.destxpos);
      }
      
      override public function getAPUse() : int
      {
         return 1;
      }
      
      override public function isMouseOver(mouseX:int, mouseY:int) : Boolean
      {
         return this.door.hitTestPoint(mouseX,mouseY);
      }
      
      override public function hasHotSpot() : Boolean
      {
         return true;
      }
      
      override public function getDisplayText() : String
      {
         return "Enter Hut";
      }
   }
}

