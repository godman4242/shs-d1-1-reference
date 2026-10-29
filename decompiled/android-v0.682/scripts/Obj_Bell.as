package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol2562")]
   public class Obj_Bell extends InteractiveStageObject
   {
      
      public function Obj_Bell(props:String, objName:String = "")
      {
         super();
         if(objName == "")
         {
            objectName = "Bell";
         }
         else
         {
            objectName = objName;
         }
         iconID = NodeUI.ACTION_USE;
      }
      
      override public function interactClick() : *
      {
         this.interact();
      }
      
      override public function showInteractButton(flag:Boolean) : *
      {
         if(flag && !shown && canInteract)
         {
            OverworldHUD.instance.getNodeUI().addInteractiveObjectButton(this,iconID);
            shown = true;
         }
         else if(!flag && shown)
         {
            shown = false;
         }
      }
      
      override public function interact() : *
      {
         var data:XMLQuestStep = null;
         if(questAction != null)
         {
            data = QuestEngine.getQuestStepDetails(questAction.id,questAction.stepNo);
            Overworld.startQuestStepIntro(questAction.id,questAction.stepNo);
         }
         else
         {
            OverworldHUD.instance.showDialog(LangManager.getString(724),LangManager.getString(5));
         }
      }
      
      override public function getDisplayText() : String
      {
         return LangManager.getString(725);
      }
      
      override public function getAPUse() : int
      {
         return 1;
      }
   }
}

