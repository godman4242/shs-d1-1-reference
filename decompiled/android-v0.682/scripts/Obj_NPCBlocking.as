package
{
   import flash.display.MovieClip;
   
   public class Obj_NPCBlocking extends Obj_NPC
   {
      
      public function Obj_NPCBlocking(props:String, objname:String = "")
      {
         super(props,objname);
         blocking = true;
      }
      
      override public function isInInteractRange(mc:MovieClip) : Boolean
      {
         return abs(x - mc.x) < 100;
      }
      
      override public function showInteractButton(flag:Boolean) : *
      {
         if(flag && !shown && canInteract)
         {
            if(questAction != null)
            {
               OverworldHUD.instance.getNodeUI().addInteractiveObjectQuestButton(this,questAction.title,questAction.stepShortTitle,questAction.type,questAction.id,questAction.stepNo,questAction.ap);
            }
            else
            {
               OverworldHUD.instance.getNodeUI().addInteractiveObjectButton(this,NodeUI.ACTION_TALK);
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

