package shs2_kon_fla
{
   import adobe.utils.*;
   import flash.accessibility.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2187")]
   public dynamic class gui_pausemessage_52 extends MovieClip
   {
      
      public var quitgamebutton:SimpleButton;
      
      public var resumegamebutton:SimpleButton;
      
      public var travelmeter:MovieClip;
      
      public function gui_pausemessage_52()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         quitgamebutton.addEventListener(MouseEvent.CLICK,quitClickEvent);
         resumegamebutton.addEventListener(MouseEvent.CLICK,resumeClickEvent);
      }
      
      public function quitClickEvent(param1:Event) : void
      {
         SoundManager.instance.stopMusic();
         MovieClip(parent).gotoAndPlay(1,"mainmenu");
      }
      
      public function resumeClickEvent(param1:Event) : void
      {
         Player.instance.pauseGame();
      }
   }
}

