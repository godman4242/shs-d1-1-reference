package shs2_kon_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2382")]
   public dynamic class mute_151 extends MovieClip
   {
      
      public function mute_151()
      {
         super();
         addFrameScript(0,frame1,1,frame2,2,frame3,3,frame4);
      }
      
      internal function frame3() : *
      {
         stop();
         SoundManager.instance.muteMusic();
         SoundManager.instance.canPlayMusic = false;
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame4() : *
      {
         stop();
         SoundManager.instance.canPlaySounds = false;
      }
      
      internal function frame2() : *
      {
         stop();
         SoundManager.instance.canPlaySounds = true;
         SoundManager.instance.canPlayMusic = true;
         SoundManager.instance.continueMusic();
      }
   }
}

