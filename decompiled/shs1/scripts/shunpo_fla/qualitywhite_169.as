package shunpo_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.StageQuality;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol840")]
   public dynamic class qualitywhite_169 extends MovieClip
   {
      
      public var clicky:SimpleButton;
      
      public function qualitywhite_169()
      {
         super();
         addFrameScript(0,frame1,1,frame2,2,frame3,3,frame4,4,frame5);
      }
      
      internal function frame3() : *
      {
         stop();
         stage.quality = StageQuality.MEDIUM;
         ParticleSystemManager.quality = "MEDIUM";
      }
      
      internal function frame1() : *
      {
         clicky.addEventListener(MouseEvent.CLICK,qualiyclickyClickEvent);
         if(stage.quality == "HIGH")
         {
            gotoAndStop(2);
         }
         else if(stage.quality == "MEDIUM")
         {
            gotoAndStop(3);
         }
         else if(stage.quality == "LOW")
         {
            gotoAndStop(4);
         }
      }
      
      internal function frame4() : *
      {
         stop();
         stage.quality = StageQuality.LOW;
         ParticleSystemManager.quality = "LOW";
      }
      
      internal function frame5() : *
      {
         gotoAndStop(2);
      }
      
      internal function frame2() : *
      {
         stop();
         stage.quality = StageQuality.HIGH;
         ParticleSystemManager.quality = "HIGH";
      }
      
      public function qualiyclickyClickEvent(param1:Event) : void
      {
         this.nextFrame();
      }
   }
}

