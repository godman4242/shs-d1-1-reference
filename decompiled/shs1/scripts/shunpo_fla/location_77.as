package shunpo_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol534")]
   public dynamic class location_77 extends MovieClip
   {
      
      public var chest:MovieClip;
      
      public function location_77()
      {
         super();
         addFrameScript(0,frame1,1,frame2);
      }
      
      public function locationMouseOutEvent(param1:Event) : void
      {
         gotoAndStop(1);
      }
      
      public function locationMouseOverEvent(param1:Event) : void
      {
         gotoAndStop(2);
      }
      
      internal function frame1() : *
      {
         stop();
         this.buttonMode = true;
         this.addEventListener(MouseEvent.MOUSE_OVER,locationMouseOverEvent);
         this.addEventListener(MouseEvent.MOUSE_OUT,locationMouseOutEvent);
         this.addEventListener(MouseEvent.MOUSE_UP,locationMouseUpEvent);
      }
      
      internal function frame2() : *
      {
         stop();
      }
      
      public function locationMouseUpEvent(param1:Event) : void
      {
         var _loc2_:* = undefined;
         _loc2_ = this.name.substr(6);
         StatsManager.instance.gotoLevel(_loc2_);
      }
   }
}

