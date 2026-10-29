package shs2_kon_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol892")]
   public dynamic class boss1_kneel_stab_479 extends MovieClip
   {
      
      public function boss1_kneel_stab_479()
      {
         super();
         addFrameScript(5,frame6,44,frame45);
      }
      
      internal function frame6() : *
      {
         SoundManager.instance.playToBeContinued();
      }
      
      internal function frame45() : *
      {
         stop();
      }
   }
}

