package shs2_kon_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2410")]
   public dynamic class tut1_152 extends MovieClip
   {
      
      public var countdown:MovieClip;
      
      public var platform:MovieClip;
      
      public function tut1_152()
      {
         super();
         addFrameScript(0,frame1,1,frame2,2,frame3,3,frame4,4,frame5,5,frame6,6,frame7,7,frame8);
      }
      
      internal function frame3() : *
      {
         stop();
         countdown.gotoAndPlay(1);
      }
      
      internal function frame7() : *
      {
         stop();
      }
      
      internal function frame1() : *
      {
         stop();
         countdown.gotoAndPlay(1);
      }
      
      internal function frame6() : *
      {
         stop();
         countdown.gotoAndPlay(1);
      }
      
      internal function frame4() : *
      {
         stop();
         countdown.gotoAndPlay(1);
      }
      
      internal function frame5() : *
      {
         stop();
         countdown.gotoAndPlay(1);
      }
      
      internal function frame8() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         stop();
         countdown.gotoAndPlay(1);
      }
   }
}

