package shunpo_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol474")]
   public dynamic class samurai_sheathing_anim_220 extends MovieClip
   {
      
      public function samurai_sheathing_anim_220()
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
         if(Math.random() * 3 >= 1)
         {
            this.gotoAndPlay(1);
         }
      }
   }
}

