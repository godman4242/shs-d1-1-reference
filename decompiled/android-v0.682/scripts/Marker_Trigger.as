package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2565")]
   public class Marker_Trigger extends InteractiveStageObject
   {
      
      public function Marker_Trigger(props:String, objname:String = "")
      {
         super();
         this.props = props;
         objectName = objname;
         visible = false;
      }
      
      override public function isInInteractRange(mc:MovieClip) : Boolean
      {
         return abs(x - mc.x) < 50;
      }
      
      override public function interact() : *
      {
         if(questAction != null)
         {
            if(props == "")
            {
               OverworldHUD.instance.lootDialog.notifyDontRefreshAfter();
            }
            Overworld.startQuestStepIntro(questAction.id,questAction.stepNo);
         }
         StageManager.addToDeadList(objectName);
      }
      
      override public function showInteractButton(flag:Boolean) : *
      {
         if(flag && !shown && canInteract)
         {
            shown = true;
            if(questAction != null)
            {
               this.interact();
            }
         }
         else if(!flag && shown)
         {
            shown = false;
         }
      }
      
      override public function canClickInteract() : *
      {
         return false;
      }
      
      override public function getDisplayText() : String
      {
         return "";
      }
   }
}

