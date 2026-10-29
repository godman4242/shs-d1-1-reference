package shs2_kon_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1015")]
   public dynamic class boss3_hat_354 extends MovieClip
   {
      
      public function boss3_hat_354()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         if(Boss3.instance != null && !Boss3.instance.hasHat)
         {
            this.visible = false;
         }
      }
   }
}

