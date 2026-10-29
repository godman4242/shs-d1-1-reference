package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2567")]
   public class Marker_Blocking extends InteractiveStageObject
   {
      
      public function Marker_Blocking(props:String, objname:String = "")
      {
         super();
         if(props == "")
         {
            props = "0";
         }
         blocking = props != "1";
         this.props = props;
         objectName = objname;
         visible = false;
      }
      
      override public function isInInteractRange(mc:MovieClip) : Boolean
      {
         return abs(x - mc.x) < 50;
      }
      
      override public function showInteractButton(flag:Boolean) : *
      {
         this.interact();
      }
      
      override public function isNPCBlocking() : Boolean
      {
         return true;
      }
      
      override public function canClickInteract() : *
      {
         return false;
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
      }
   }
}

