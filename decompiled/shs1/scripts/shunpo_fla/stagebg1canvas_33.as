package shunpo_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol953")]
   public dynamic class stagebg1canvas_33 extends MovieClip
   {
      
      public var tuticon2:MovieClip;
      
      public var tuticon3:MovieClip;
      
      public var tuticon1:SimpleButton;
      
      public var newbanner:MovieClip;
      
      public var stagebg1:MovieClip;
      
      public function stagebg1canvas_33()
      {
         super();
         addFrameScript(0,frame1,1,frame2,2,frame3);
      }
      
      internal function frame3() : *
      {
         stop();
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         stop();
         tuticon2.visible = false;
         tuticon3.visible = false;
         newbanner.visible = false;
         tuticon1.addEventListener(MouseEvent.CLICK,tut1Event);
      }
      
      public function tut1Event(param1:Event) : void
      {
         tuticon1.visible = false;
         newbanner.visible = true;
         if(tuticon3.visible)
         {
            return;
         }
         tuticon2.visible = true;
         StageManager.instance.showHint("Draw a line along the dotted line to slash with your sword.\rMove mouse to the edge of the screen to scroll.\rYou may also use A-D or arrow keys to scroll.\rPress spacebar to pause.");
         StatsManager.instance.gotBanner();
      }
   }
}

