package shunpo_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol717")]
   public dynamic class catapultdialog_146 extends MovieClip
   {
      
      public var btn2:SimpleButton;
      
      public var btn1:SimpleButton;
      
      public function catapultdialog_146()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function cbtn2ClickEvent(param1:Event) : void
      {
         this.visible = false;
         StatsManager.instance.fireAtCamp();
      }
      
      internal function frame1() : *
      {
         btn1.addEventListener(MouseEvent.CLICK,cbtn1ClickEvent);
         btn2.addEventListener(MouseEvent.CLICK,cbtn2ClickEvent);
      }
      
      public function cbtn1ClickEvent(param1:Event) : void
      {
         this.visible = false;
         StatsManager.instance.fireAtGate();
      }
   }
}

