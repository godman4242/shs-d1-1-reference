package shunpo_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol582")]
   public dynamic class reinforceanim_57 extends MovieClip
   {
      
      public function reinforceanim_57()
      {
         super();
         addFrameScript(0,frame1,2,frame3);
      }
      
      internal function frame3() : *
      {
         gotoAndStop(1);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

