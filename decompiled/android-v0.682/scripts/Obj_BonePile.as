package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol2560")]
   public class Obj_BonePile extends StageObject
   {
      
      public function Obj_BonePile(prop:String)
      {
         super();
         addFrameScript(0,this.frame1);
         if(prop != "")
         {
            gotoAndStop(int(prop));
         }
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

