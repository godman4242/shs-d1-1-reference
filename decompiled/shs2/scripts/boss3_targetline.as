package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1435")]
   public dynamic class boss3_targetline extends MovieClip
   {
      
      public function boss3_targetline()
      {
         super();
         addFrameScript(0,frame1,9,frame10);
      }
      
      internal function frame10() : *
      {
         stop();
         this.visible = false;
         stop();
         this.visible = false;
      }
      
      internal function frame1() : *
      {
         stop();
         stop();
      }
   }
}

