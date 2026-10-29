package shunpo_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol26")]
   public dynamic class enemycatapultoperator_300 extends MovieClip
   {
      
      public var head:MovieClip;
      
      public function enemycatapultoperator_300()
      {
         super();
         addFrameScript(0,frame1,20,frame21,39,frame40);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame21() : *
      {
         gotoAndPlay(1);
      }
      
      internal function frame40() : *
      {
         stop();
      }
   }
}

