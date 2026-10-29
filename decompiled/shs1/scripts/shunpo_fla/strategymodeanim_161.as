package shunpo_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol823")]
   public dynamic class strategymodeanim_161 extends MovieClip
   {
      
      public function strategymodeanim_161()
      {
         super();
         addFrameScript(0,frame1,54,frame55);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame55() : *
      {
         stop();
         StatsManager.instance.showPlayerDialog("Use the troops to clear a path to the enemy commander\'s tent");
      }
   }
}

