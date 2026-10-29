package shs2_kon_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol123")]
   public dynamic class bloodspurt_112 extends MovieClip
   {
      
      public function bloodspurt_112()
      {
         super();
         addFrameScript(24,frame25);
      }
      
      internal function frame25() : *
      {
         stop();
         this.visible = false;
      }
   }
}

