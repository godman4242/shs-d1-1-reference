package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol2564")]
   public class Obj_Bed extends InteractiveStageObject
   {
      
      public function Obj_Bed(props:String, objname:String = "")
      {
         super();
         this.props = props;
         if(objname == "")
         {
            objectName = "Bed";
         }
         else
         {
            objectName = objname;
         }
         iconID = NodeUI.ACTION_REST;
      }
      
      override public function interact() : *
      {
      }
      
      override public function getDisplayText() : String
      {
         return "";
      }
   }
}

