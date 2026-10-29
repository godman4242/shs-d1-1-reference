package shs2_kon_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2356")]
   public dynamic class introanim_140 extends MovieClip
   {
      
      public var closebutton:SimpleButton;
      
      public var clicky2:SimpleButton;
      
      public var clicky:SimpleButton;
      
      public function introanim_140()
      {
         super();
         addFrameScript(0,frame1,1,frame2,2,frame3,3,frame4,4,frame5,5,frame6,6,frame7,7,frame8,8,frame9);
      }
      
      public function clicky2ClickEvent(param1:Event) : void
      {
         MovieClip(parent).gotoAndPlay(1,"beforeforest");
      }
      
      internal function frame3() : *
      {
         stop();
      }
      
      internal function frame6() : *
      {
         stop();
      }
      
      internal function frame7() : *
      {
         stop();
      }
      
      internal function frame1() : *
      {
         closebutton.addEventListener(MouseEvent.CLICK,closebuttonClickEvent);
         clicky.addEventListener(MouseEvent.CLICK,clickyClickEvent);
         stop();
      }
      
      internal function frame4() : *
      {
         stop();
      }
      
      internal function frame5() : *
      {
         stop();
      }
      
      internal function frame9() : *
      {
         stop();
         clicky2.addEventListener(MouseEvent.CLICK,clicky2ClickEvent);
      }
      
      internal function frame8() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         stop();
      }
      
      public function closebuttonClickEvent(param1:Event) : void
      {
         MovieClip(parent).gotoAndPlay(1,"beforeforest");
      }
      
      public function clickyClickEvent(param1:Event) : void
      {
         this.nextFrame();
      }
   }
}

