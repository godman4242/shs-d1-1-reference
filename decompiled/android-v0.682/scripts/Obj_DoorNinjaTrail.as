package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol2436")]
   public class Obj_DoorNinjaTrail extends InteractiveStageObject
   {
      
      internal var dest:int;
      
      public function Obj_DoorNinjaTrail(props:String, objname:String = "")
      {
         super();
         if(objname == "")
         {
            objectName = "Ninja Trail";
         }
         else
         {
            objectName = objname;
         }
         iconID = NodeUI.ACTION_TRAVEL;
         this.dest = parseInt(props);
         canInteract = true;
         buttonMode = canInteract;
         gotoAndStop(1);
      }
      
      override public function interactClick() : *
      {
         OverworldHUD.getInstance().screenTransition.setParam(this);
         OverworldHUD.getInstance().screenTransition.startClose(ScreenTransition.ACTION_INTERACT);
         gotoAndStop(2);
      }
      
      override public function interact() : *
      {
         StageManager.gotoRoom(this.dest);
      }
      
      override public function getDisplayText() : String
      {
         return "Enter ninja trail";
      }
      
      override public function doScroll(dist:int) : *
      {
         x += dist / 2;
      }
   }
}

