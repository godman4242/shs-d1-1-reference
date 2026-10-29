package
{
   import flash.display.MovieClip;
   
   public class Marker_TriggerAuto extends InteractiveStageObject
   {
      
      public function Marker_TriggerAuto(props:String, objname:String = "")
      {
         super();
         this.props = props;
         objectName = objname;
         visible = false;
      }
      
      override public function isInInteractRange(mc:MovieClip) : Boolean
      {
         return true;
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

