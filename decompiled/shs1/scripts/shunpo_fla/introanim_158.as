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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol818")]
   public dynamic class introanim_158 extends MovieClip
   {
      
      public var closebutton:SimpleButton;
      
      public var clicky2:SimpleButton;
      
      public var clicky:SimpleButton;
      
      public function introanim_158()
      {
         super();
         addFrameScript(0,frame1,1,frame2,2,frame3,3,frame4,4,frame5,5,frame6,6,frame7,7,frame8,8,frame9,9,frame10,10,frame11);
      }
      
      public function clicky2ClickEvent(param1:Event) : void
      {
         this.visible = false;
         StatsManager.instance.map.gui.missionstart.gotoAndPlay(2);
      }
      
      internal function frame10() : *
      {
         stop();
      }
      
      internal function frame3() : *
      {
         stop();
      }
      
      internal function frame6() : *
      {
         stop();
      }
      
      internal function frame7() : *
      {
         stop();
      }
      
      internal function frame1() : *
      {
         closebutton.addEventListener(MouseEvent.CLICK,closebuttonClickEvent);
         clicky.addEventListener(MouseEvent.CLICK,clickyClickEvent);
         stop();
      }
      
      internal function frame4() : *
      {
         stop();
      }
      
      internal function frame5() : *
      {
         stop();
      }
      
      internal function frame9() : *
      {
         stop();
      }
      
      internal function frame8() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         stop();
      }
      
      internal function frame11() : *
      {
         stop();
         clicky2.addEventListener(MouseEvent.CLICK,clicky2ClickEvent);
      }
      
      public function closebuttonClickEvent(param1:Event) : void
      {
         this.visible = false;
         StatsManager.instance.map.gui.missionstart.gotoAndPlay(2);
      }
      
      public function clickyClickEvent(param1:Event) : void
      {
         this.nextFrame();
      }
   }
}

