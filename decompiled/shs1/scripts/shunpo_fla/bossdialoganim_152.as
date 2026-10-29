package shunpo_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol726")]
   public dynamic class bossdialoganim_152 extends MovieClip
   {
      
      public var enemydialog:MovieClip;
      
      public function bossdialoganim_152()
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
         enemydialog.visible = false;
         stop();
      }
      
      internal function frame24() : *
      {
         stop();
         enemydialog.visible = false;
      }
      
      internal function frame2() : *
      {
         enemydialog.visible = true;
         enemydialog.buttonMode = true;
         enemydialog.addEventListener(MouseEvent.CLICK,enemydialogEvent);
      }
      
      public function enemydialogEvent(param1:Event) : void
      {
         this.play();
         StatsManager.instance.bossDialogClick();
      }
   }
}

