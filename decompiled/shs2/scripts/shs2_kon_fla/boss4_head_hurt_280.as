package shs2_kon_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1824")]
   public dynamic class boss4_head_hurt_280 extends MovieClip
   {
      
      public var head:MovieClip;
      
      public function boss4_head_hurt_280()
      {
         super();
         addFrameScript(3,frame4);
      }
      
      internal function frame4() : *
      {
         MovieClip(parent).gotoAndStop(1);
      }
   }
}

