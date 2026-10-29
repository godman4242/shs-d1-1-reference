package shunpo_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol650")]
   public dynamic class founddialog_130 extends MovieClip
   {
      
      public var btn2:SimpleButton;
      
      public var btn1:SimpleButton;
      
      public function founddialog_130()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function btn1ClickEvent(param1:Event) : void
      {
         this.visible = false;
         StatsManager.instance.hp += 10;
         ++StatsManager.instance.totalItems;
      }
      
      internal function frame1() : *
      {
         btn1.addEventListener(MouseEvent.CLICK,btn1ClickEvent);
         btn2.addEventListener(MouseEvent.CLICK,btn2ClickEvent);
      }
      
      public function btn2ClickEvent(param1:Event) : void
      {
         this.visible = false;
         ++StatsManager.instance.armor;
         ++StatsManager.instance.totalItems;
      }
   }
}

