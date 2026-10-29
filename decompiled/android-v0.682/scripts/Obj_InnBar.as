package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol2399")]
   public class Obj_InnBar extends InteractiveStageObject
   {
      
      public function Obj_InnBar()
      {
         super();
         iconID = NodeUI.ACTION_TALK;
      }
      
      override public function interact() : *
      {
         var npc:Obj_NPC = StageManager.getGameStage().getRoomInteractiveObject("innkeeper") as Obj_NPC;
         QuestEngine.putInNPCHolder(148,npc.mcs.getMCSString());
         OverworldHUD.instance.interactUI.show(InteractUI.UIMODE_INN);
      }
      
      override public function getDisplayText() : String
      {
         return "Talk to Inn Keeper";
      }
   }
}

