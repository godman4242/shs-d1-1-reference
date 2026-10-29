package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol2384")]
   public class Obj_LowCeiling extends StageObject
   {
      
      public function Obj_LowCeiling(props:String)
      {
         super();
         addFrameScript(0,this.frame1);
         if(props != "")
         {
            gotoAndStop(int(props));
         }
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

