package shs2_kon_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1809")]
   public dynamic class boss4_openlid_shell_240 extends MovieClip
   {
      
      public var inside:MovieClip;
      
      public var lid:MovieClip;
      
      public function boss4_openlid_shell_240()
      {
         super();
         addFrameScript(0,frame1,9,frame10,35,frame36);
      }
      
      internal function frame10() : *
      {
         stop();
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame36() : *
      {
         if(!Boss4.instance.bossGuyNext)
         {
            lid.gotoAndStop(1);
         }
      }
   }
}

