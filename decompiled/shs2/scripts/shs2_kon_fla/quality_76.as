package shs2_kon_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.StageQuality;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2276")]
   public dynamic class quality_76 extends MovieClip
   {
      
      public var clicky:SimpleButton;
      
      public function quality_76()
      {
         super();
         addFrameScript(0,frame1,1,frame2,2,frame3,3,frame4);
      }
      
      internal function frame3() : *
      {
         stop();
         stage.quality = StageQuality.LOW;
         ParticleSystemManager.quality = "LOW";
      }
      
      internal function frame1() : *
      {
         stop();
         clicky.addEventListener(MouseEvent.CLICK,qualiyclickyClickEvent);
         stage.quality = StageQuality.HIGH;
         ParticleSystemManager.quality = "HIGH";
      }
      
      internal function frame4() : *
      {
         gotoAndStop(1);
      }
      
      internal function frame2() : *
      {
         stop();
         stage.quality = StageQuality.MEDIUM;
         ParticleSystemManager.quality = "MEDIUM";
      }
      
      public function qualiyclickyClickEvent(param1:Event) : void
      {
         this.nextFrame();
      }
   }
}

