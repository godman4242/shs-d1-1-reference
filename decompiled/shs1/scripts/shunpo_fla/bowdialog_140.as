package shunpo_fla
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol698")]
   public dynamic class bowdialog_140 extends MovieClip
   {
      
      public var btn2:SimpleButton;
      
      public var btn1:SimpleButton;
      
      public function bowdialog_140()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function btn1ClickEvent(param1:Event) : void
      {
         this.visible = false;
         StatsManager.instance.location = 37;
         MovieClip(parent.parent).transition.gotoAndPlay(25);
      }
      
      internal function frame1() : *
      {
         btn1.addEventListener(MouseEvent.CLICK,btn1ClickEvent);
         btn2.addEventListener(MouseEvent.CLICK,btn2ClickEvent);
      }
      
      public function btn2ClickEvent(param1:Event) : void
      {
         this.visible = false;
      }
   }
}

