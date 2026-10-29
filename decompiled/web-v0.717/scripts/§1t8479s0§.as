package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol3084")]
   public class §1t8479s0§ extends StageObject
   {
      
      public function §1t8479s0§(param1:String)
      {
         super();
         addFrameScript(0,this.frame1);
         if(param1 != "")
         {
            gotoAndStop(int(param1));
         }
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

