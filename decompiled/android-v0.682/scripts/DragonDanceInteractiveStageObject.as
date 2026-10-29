package
{
   public class DragonDanceInteractiveStageObject extends InteractiveStageObject
   {
      
      internal var sequence:String = "";
      
      public function DragonDanceInteractiveStageObject()
      {
         super();
      }
      
      public function getSequence() : String
      {
         return this.sequence;
      }
      
      public function validSequence() : *
      {
         trace("validsequence");
      }
      
      public function invalidSequence() : *
      {
         trace("invalidsequence");
      }
      
      public function nodeTaught() : int
      {
         return -1;
      }
      
      public function setPose(pose:String) : *
      {
      }
      
      override public function showInteractButton(flag:Boolean) : *
      {
         if(flag && !shown && canInteract)
         {
            if(questAction != null)
            {
               OverworldHUD.instance.getNodeUI().addInteractiveObjectQuestButton(this,questAction.title,questAction.stepShortTitle,questAction.type,questAction.id,questAction.stepNo,questAction.ap,true);
            }
            else
            {
               OverworldHUD.instance.getNodeUI().addInteractiveObjectButton(this,iconID);
            }
            shown = true;
         }
         else if(!flag && shown)
         {
            shown = false;
         }
      }
   }
}

