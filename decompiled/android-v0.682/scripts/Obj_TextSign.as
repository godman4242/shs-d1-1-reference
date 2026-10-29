package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol2287")]
   public class Obj_TextSign extends InteractiveStageObject
   {
      
      public function Obj_TextSign(props:String, objname:String = "")
      {
         super();
         this.props = props;
         iconID = NodeUI.ACTION_LOOK;
      }
      
      override public function interact() : *
      {
         OverworldHUD.instance.showDialogBig(LangManager.getString(int(props)),LangManager.getString(5));
      }
      
      override public function getDisplayText() : String
      {
         return LangManager.getString(148);
      }
   }
}

