package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2566")]
   public class Marker_RumbleTrigger extends InteractiveStageObject
   {
      
      internal var shakeDuration:int = 24;
      
      internal var shakeAmt:int = 30;
      
      public function Marker_RumbleTrigger(props:String, objname:String = "")
      {
         super();
         var strArray:Array = props.split(",");
         if(strArray.length > 0)
         {
            this.shakeDuration = strArray[0];
         }
         if(strArray.length > 1)
         {
            this.shakeAmt = strArray[1];
         }
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
         StageManager.startShake(this.shakeDuration,this.shakeAmt);
         StageManager.addToDeadList(objectName);
      }
      
      override public function showInteractButton(flag:Boolean) : *
      {
         if(flag && !shown && canInteract)
         {
            shown = true;
            this.interact();
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

