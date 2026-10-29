package shunpo_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol704")]
   public dynamic class playerdialoganim_143 extends MovieClip
   {
      
      public var playerdialog:MovieClip;
      
      public function playerdialoganim_143()
      {
         super();
         addFrameScript(0,frame1,1,frame2,11,frame12,23,frame24);
      }
      
      internal function frame12() : *
      {
         stop();
      }
      
      internal function frame1() : *
      {
         playerdialog.visible = false;
         stop();
      }
      
      internal function frame24() : *
      {
         stop();
         playerdialog.visible = false;
      }
      
      internal function frame2() : *
      {
         playerdialog.visible = true;
         playerdialog.buttonMode = true;
         playerdialog.addEventListener(MouseEvent.CLICK,playerdialogEvent);
      }
      
      public function playerdialogEvent(param1:Event) : void
      {
         this.play();
         StatsManager.instance.playerDialogClick();
      }
   }
}

