package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol3270")]
   public class §1t8467s0§ extends StageObject
   {
      
      public function §1t8467s0§(param1:String)
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

