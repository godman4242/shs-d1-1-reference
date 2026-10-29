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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2201")]
   public dynamic class gui_dieddialog_57 extends MovieClip
   {
      
      public var diedcontinuebutton:SimpleButton;
      
      public var diedrestartbutton:SimpleButton;
      
      public var mainmenubutton:SimpleButton;
      
      public function gui_dieddialog_57()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         diedcontinuebutton.addEventListener(MouseEvent.CLICK,diedcontinueClickEvent);
         diedrestartbutton.addEventListener(MouseEvent.CLICK,diedrestartClickEvent);
         mainmenubutton.addEventListener(MouseEvent.CLICK,diedmainmenuClickEvent);
      }
      
      public function diedmainmenuClickEvent(param1:Event) : void
      {
         MovieClip(parent).goMainMenu();
      }
      
      public function diedcontinueClickEvent(param1:Event) : void
      {
         Player.instance.dieContinue();
         Player.instance.updateScore(-5000);
      }
      
      public function diedrestartClickEvent(param1:Event) : void
      {
         StatsManager.deaths = 0;
         MovieClip(parent).resetStage();
      }
   }
}

