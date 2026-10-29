package shunpo_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol560")]
   public dynamic class friendlyicon_104 extends MovieClip
   {
      
      public var friendly:MovieClip;
      
      public function friendlyicon_104()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         stop();
         friendly.buttonMode = true;
         friendly.addEventListener(MouseEvent.CLICK,friendlyEvent);
      }
      
      public function friendlyEvent(param1:Event) : void
      {
         StatsManager.instance.gotoLevel(StatsManager.instance.getFriendlyLocation(this));
      }
   }
}

