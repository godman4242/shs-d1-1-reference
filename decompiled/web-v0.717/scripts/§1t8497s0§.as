package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3226")]
   public class §1t8497s0§ extends StageObject
   {
      
      public var color:MovieClip;
      
      public var logo:MovieClip;
      
      public function §1t8497s0§(param1:String = "")
      {
         super();
         addFrameScript(0,this.frame1);
         if(param1 == "")
         {
            gotoAndStop(1);
         }
         else
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

