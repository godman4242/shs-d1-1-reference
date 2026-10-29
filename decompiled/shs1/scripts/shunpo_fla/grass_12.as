package shunpo_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol878")]
   public dynamic class grass_12 extends MovieClip
   {
      
      public function grass_12()
      {
         super();
         addFrameScript(28,frame29);
      }
      
      internal function frame29() : *
      {
         if(Math.random() * 5 > 3)
         {
            this.gotoAndPlay(21);
         }
      }
   }
}

