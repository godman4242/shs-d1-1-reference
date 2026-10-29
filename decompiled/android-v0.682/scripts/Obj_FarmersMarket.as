package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol2413")]
   public class Obj_FarmersMarket extends InteractiveStageObject
   {
      
      public function Obj_FarmersMarket(props:String, objname:String = "")
      {
         super();
         this.props = props;
         if(objname == "")
         {
            objectName = "Farmers\' Market";
         }
         else
         {
            objectName = objname;
         }
         iconID = NodeUI.ACTION_SHOP;
      }
      
      override public function interact() : *
      {
         OverworldHUD.instance.interactUI.show(InteractUI.UIMODE_MARKET);
      }
      
      override public function getDisplayText() : String
      {
         return LangManager.getString(268);
      }
   }
}

