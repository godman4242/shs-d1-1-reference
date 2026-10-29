package
{
   import flash.display.MovieClip;
   
   public class TriggeredStageObject extends InteractiveStageObject
   {
      
      internal var active:Boolean = true;
      
      public function TriggeredStageObject()
      {
         super();
      }
      
      public function triggerObject(flag:Boolean, isFloorSwitch:Boolean) : *
      {
         if(flag)
         {
            this.doAction();
         }
      }
      
      override public function isInInteractRange(mc:MovieClip) : Boolean
      {
         return false;
      }
      
      internal function doAction() : *
      {
      }
      
      override public function canClickInteract() : *
      {
         return false;
      }
      
      override public function getDisplayText() : String
      {
         return "";
      }
      
      override public function showInteractButton(flag:Boolean) : *
      {
      }
   }
}

