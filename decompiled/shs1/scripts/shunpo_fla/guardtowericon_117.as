package shunpo_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol590")]
   public dynamic class guardtowericon_117 extends MovieClip
   {
      
      public function guardtowericon_117()
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
         stop();
         this.buttonMode = true;
         this.addEventListener(MouseEvent.CLICK,clickEvent);
      }
      
      internal function frame2() : *
      {
         stop();
      }
      
      public function clickEvent(param1:Event) : void
      {
         StatsManager.instance.gotoLevel(13);
      }
   }
}

