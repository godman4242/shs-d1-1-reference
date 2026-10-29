package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol2409")]
   public class Obj_GamblingTable extends InteractiveStageObject
   {
      
      public function Obj_GamblingTable()
      {
         super();
         iconID = NodeUI.ACTION_USE;
      }
      
      override public function interact() : *
      {
         OverworldHUD.instance.interactUI.show(InteractUI.UIMODE_GAMBLINGDEN);
      }
      
      override public function getDisplayText() : String
      {
         return "Play Cho-han";
      }
   }
}

