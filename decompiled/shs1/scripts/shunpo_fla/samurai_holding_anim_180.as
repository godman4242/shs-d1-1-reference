package shunpo_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol375")]
   public dynamic class samurai_holding_anim_180 extends MovieClip
   {
      
      public function samurai_holding_anim_180()
      {
         super();
         addFrameScript(8,frame9,9,frame10);
      }
      
      internal function frame10() : *
      {
         MovieClip(parent).gotoAndStop(1);
      }
      
      internal function frame9() : *
      {
         if(Player.stageMode == 1)
         {
            this.stop();
         }
         else if(Math.random() * 3 >= 1)
         {
            this.gotoAndPlay(1);
         }
      }
   }
}

