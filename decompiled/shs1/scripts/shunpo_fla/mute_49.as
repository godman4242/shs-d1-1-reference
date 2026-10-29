package shunpo_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol836")]
   public dynamic class mute_49 extends MovieClip
   {
      
      public function mute_49()
      {
         super();
         addFrameScript(0,frame1,1,frame2,2,frame3,3,frame4);
      }
      
      internal function frame3() : *
      {
         stop();
         SoundManager.instance.stopMusic();
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame4() : *
      {
         stop();
         SoundManager.instance.playSounds = false;
      }
      
      internal function frame2() : *
      {
         stop();
         SoundManager.instance.playMusic();
         SoundManager.instance.playSounds = true;
      }
   }
}

