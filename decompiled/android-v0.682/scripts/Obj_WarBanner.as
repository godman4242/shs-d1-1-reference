package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol2533")]
   public class Obj_WarBanner extends StageObject
   {
      
      public function Obj_WarBanner(props:String = "")
      {
         super();
         addFrameScript(0,this.frame1);
         if(props == "")
         {
            gotoAndStop(1);
         }
         else
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

