package shunpo_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol688")]
   public dynamic class hexdialog_133 extends MovieClip
   {
      
      public var next:SimpleButton;
      
      public var btn1:SimpleButton;
      
      public var selected:MovieClip;
      
      public var back:SimpleButton;
      
      public function hexdialog_133()
      {
         super();
         addFrameScript(0,frame1,1,frame2,2,frame3,3,frame4,4,frame5,5,frame6);
      }
      
      public function btn1ClickEvent(param1:Event) : void
      {
         this.visible = false;
      }
      
      public function back3ClickEvent(param1:Event) : void
      {
         this.gotoAndPlay(3);
      }
      
      public function nextClickEvent(param1:Event) : void
      {
         nextFrame();
      }
      
      internal function frame3() : *
      {
         btn1.addEventListener(MouseEvent.CLICK,btn1ClickEvent);
         next.addEventListener(MouseEvent.CLICK,nextClickEvent);
         back.addEventListener(MouseEvent.CLICK,back2ClickEvent);
         stop();
      }
      
      internal function frame6() : *
      {
         btn1.addEventListener(MouseEvent.CLICK,btn1ClickEvent);
         back.addEventListener(MouseEvent.CLICK,back5ClickEvent);
         stop();
      }
      
      internal function frame1() : *
      {
         btn1.addEventListener(MouseEvent.CLICK,btn1ClickEvent);
         next.addEventListener(MouseEvent.CLICK,nextClickEvent);
         stop();
      }
      
      internal function frame4() : *
      {
         btn1.addEventListener(MouseEvent.CLICK,btn1ClickEvent);
         next.addEventListener(MouseEvent.CLICK,nextClickEvent);
         back.addEventListener(MouseEvent.CLICK,back3ClickEvent);
         stop();
      }
      
      internal function frame5() : *
      {
         btn1.addEventListener(MouseEvent.CLICK,btn1ClickEvent);
         next.addEventListener(MouseEvent.CLICK,nextClickEvent);
         back.addEventListener(MouseEvent.CLICK,back4ClickEvent);
         stop();
      }
      
      public function back2ClickEvent(param1:Event) : void
      {
         this.gotoAndPlay(2);
      }
      
      internal function frame2() : *
      {
         btn1.addEventListener(MouseEvent.CLICK,btn1ClickEvent);
         next.addEventListener(MouseEvent.CLICK,nextClickEvent);
         back.addEventListener(MouseEvent.CLICK,back1ClickEvent);
         stop();
      }
      
      public function back1ClickEvent(param1:Event) : void
      {
         this.gotoAndPlay(1);
      }
      
      public function back5ClickEvent(param1:Event) : void
      {
         this.gotoAndPlay(5);
      }
      
      public function back4ClickEvent(param1:Event) : void
      {
         this.gotoAndPlay(4);
      }
   }
}

