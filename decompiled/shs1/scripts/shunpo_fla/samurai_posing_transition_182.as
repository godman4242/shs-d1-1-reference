package shunpo_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol382")]
   public dynamic class samurai_posing_transition_182 extends MovieClip
   {
      
      public function samurai_posing_transition_182()
      {
         super();
         addFrameScript(8,frame9,9,frame10);
      }
      
      internal function frame10() : *
      {
         MovieClip(parent).gotoAndStop(3);
      }
      
      internal function frame9() : *
      {
         if(Player.stageMode == 1)
         {
            this.stop();
         }
      }
   }
}

