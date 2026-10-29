package shunpo_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol613")]
   public dynamic class hexplayericon_121 extends MovieClip
   {
      
      public var selected:MovieClip;
      
      public var highlight:MovieClip;
      
      public var hexplayer:MovieClip;
      
      public function hexplayericon_121()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         highlight.visible = false;
         selected.visible = false;
         this.buttonMode = true;
         this.addEventListener(MouseEvent.CLICK,phexClickEvent);
         this.addEventListener(MouseEvent.MOUSE_OVER,phexOverEvent);
         this.addEventListener(MouseEvent.MOUSE_OUT,phexOutEvent);
      }
      
      public function phexOutEvent(param1:Event) : void
      {
         highlight.visible = false;
      }
      
      public function phexOverEvent(param1:Event) : void
      {
         if(HexManager.heroLocation.side == 2)
         {
            highlight.visible = true;
         }
      }
      
      public function phexClickEvent(param1:Event) : void
      {
         HexManager.playerHexClick(this);
      }
   }
}

