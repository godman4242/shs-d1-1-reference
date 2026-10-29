package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1233")]
   public class AssignBox extends MovieClip
   {
      
      public function AssignBox()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2);
         gotoAndStop("uncheck");
      }
      
      public function setCheck(flag:Boolean) : *
      {
         if(flag)
         {
            gotoAndStop("checked");
         }
         else
         {
            gotoAndStop("uncheck");
         }
      }
      
      public function toggleCheck() : Boolean
      {
         var currentfame:String = this.currentLabel;
         if(currentfame == "uncheck")
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

