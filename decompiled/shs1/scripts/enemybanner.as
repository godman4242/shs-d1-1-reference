package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol851")]
   public dynamic class enemybanner extends MovieClip
   {
      
      public var oldbanner:SimpleButton;
      
      public var newbanner:MovieClip;
      
      public function enemybanner()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         stop();
         newbanner.visible = false;
         oldbanner.addEventListener(MouseEvent.CLICK,bannerEvent);
      }
      
      public function bannerEvent(param1:Event) : void
      {
         if(!newbanner.visible)
         {
            StatsManager.instance.gotBanner();
            newbanner.visible = true;
         }
      }
   }
}

