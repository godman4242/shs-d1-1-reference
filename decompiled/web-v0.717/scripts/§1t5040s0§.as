package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1460")]
   public class §1t5040s0§ extends MovieClip
   {
      
      public function §1t5040s0§()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2);
         gotoAndStop("uncheck");
      }
      
      public function §1t5041s0§(param1:Boolean) : *
      {
         if(param1)
         {
            gotoAndStop("checked");
         }
         else
         {
            gotoAndStop("uncheck");
         }
      }
      
      public function §1t5042s0§() : Boolean
      {
         var _loc1_:String = this.currentLabel;
         if(_loc1_ == "uncheck")
         {
            gotoAndStop("checked");
            return true;
         }
         gotoAndStop("uncheck");
         return false;
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         stop();
      }
   }
}

