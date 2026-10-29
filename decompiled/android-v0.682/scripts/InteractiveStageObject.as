package
{
   import flash.display.MovieClip;
   
   public class InteractiveStageObject extends StageObject
   {
      
      internal var objectName:String;
      
      internal var props:String;
      
      internal var shown:Boolean = false;
      
      internal var canInteract:Boolean = true;
      
      internal var questAction:QuestAction;
      
      internal var iconID:int = -1;
      
      internal var blocking:Boolean = false;
      
      internal var blockingRange:int = 50;
      
      public function InteractiveStageObject()
      {
         super();
         if(Boolean(this.canClickInteract()) && !this.hasHotSpot())
         {
            buttonMode = true;
         }
      }
      
      override public function isInteractive() : Boolean
      {
         return this.canInteract;
      }
      
      public function needTransition() : Boolean
      {
         return false;
      }
      
      public function setQuestAction(action:QuestAction) : *
      {
         this.questAction = action;
      }
      
      public function hasQuestAction() : Boolean
      {
         return this.questAction != null;
      }
      
      public function showInteractButton(flag:Boolean) : *
      {
         if(flag && !this.shown && this.canInteract)
         {
            if(this.questAction != null)
            {
               OverworldHUD.instance.getNodeUI().addInteractiveObjectQuestButton(this,this.questAction.title,this.questAction.stepShortTitle,this.questAction.type,this.questAction.id,this.questAction.stepNo,this.questAction.ap);
            }
            else
            {
               OverworldHUD.instance.getNodeUI().addInteractiveObjectButton(this,this.iconID);
            }
            this.shown = true;
         }
         else if(!flag && this.shown)
         {
            this.shown = false;
         }
      }
      
      public function interact() : *
      {
      }
      
      public function interact2() : *
      {
      }
      
      public function canClickInteract() : *
      {
         return true;
      }
      
      public function getMovieClip() : MovieClip
      {
         return this;
      }
      
      public function getObjectName() : String
      {
         return this.objectName;
      }
      
      public function setShown(flag:Boolean) : *
      {
         this.shown = flag;
      }
      
      public function setInteractive(flag:Boolean) : *
      {
         this.canInteract = flag;
      }
      
      public function getDisplayText() : String
      {
         if(this.objectName == "")
         {
            return LangManager.getString(145);
         }
         return LangManager.getString(144) + this.objectName;
      }
      
      public function getAPUse() : int
      {
         return 0;
      }
      
      internal function abs(value:Number) : Number
      {
         return value < 0 ? -value : value;
      }
      
      public function isInInteractRange(mc:MovieClip) : Boolean
      {
         return this.canInteract && this.abs(x - mc.x) < 50;
      }
      
      public function setObjectEnabled(flag:Boolean) : *
      {
      }
      
      public function switchObjectEnabled(flag:Boolean) : *
      {
      }
      
      public function isBlocking() : Boolean
      {
         return this.blocking;
      }
      
      public function isNPCBlocking() : Boolean
      {
         return this.blocking;
      }
      
      public function interactClick() : *
      {
         this.interact();
      }
      
      public function onMouseOver() : *
      {
      }
      
      public function isMouseOver(mouseX:int, mouseY:int) : Boolean
      {
         return this.getMovieClip().hitTestPoint(mouseX,mouseY,true);
      }
      
      public function hasHotSpot() : Boolean
      {
         return false;
      }
      
      public function getBlockingRange() : int
      {
         return this.blockingRange;
      }
   }
}

