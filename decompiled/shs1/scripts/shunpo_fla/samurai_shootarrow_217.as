package shunpo_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol469")]
   public dynamic class samurai_shootarrow_217 extends MovieClip
   {
      
      public var aimtop:MovieClip;
      
      public function samurai_shootarrow_217()
      {
         super();
         addFrameScript(0,frame1,19,frame20);
      }
      
      internal function frame1() : *
      {
         if(Player.stageMode == 1)
         {
            stop();
         }
      }
      
      internal function frame20() : *
      {
         MovieClip(parent).gotoAndStop(21);
      }
   }
}

