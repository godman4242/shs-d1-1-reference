package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol2334")]
   public class Obj_RitualSpike extends InteractiveStageObject
   {
      
      public function Obj_RitualSpike(props:String, objName:String = "")
      {
         super();
         addFrameScript(0,this.frame1);
         if(props != "")
         {
            gotoAndStop(int(props));
         }
         if(objName == "")
         {
            objectName = "RitualSpike";
         }
         else
         {
            objectName = objName;
         }
      }
      
      override public function isInteractive() : Boolean
      {
         return false;
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

