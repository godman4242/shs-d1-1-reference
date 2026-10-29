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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol841")]
   public dynamic class overworldGUI_125 extends MovieClip
   {
      
      public var bossdialog:MovieClip;
      
      public var turnnumber:TextField;
      
      public var endturnbutton:SimpleButton;
      
      public var infoicon:SimpleButton;
      
      public var stratinstructionbtn:SimpleButton;
      
      public var hexdialog:MovieClip;
      
      public var itemfounddialog:MovieClip;
      
      public var playerdialog:MovieClip;
      
      public var bowfounddialog:MovieClip;
      
      public var missionstart:MovieClip;
      
      public var introanim:MovieClip;
      
      public var catapultdialog:MovieClip;
      
      public var mutebutton:MovieClip;
      
      public var strategymode:MovieClip;
      
      public var stats:MovieClip;
      
      public var words:TextField;
      
      public var maptextbox:MovieClip;
      
      public var missionaccomplished:MovieClip;
      
      public var mission:MovieClip;
      
      public var enemydialog:MovieClip;
      
      public function overworldGUI_125()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function statsClickEvent(param1:Event) : void
      {
         if(!StatsManager.instance.bossDefeated)
         {
            stats.visible = false;
         }
      }
      
      public function mute2ClickEvent(param1:Event) : void
      {
         if(mutebutton.currentFrame == 2)
         {
            mutebutton.gotoAndStop(3);
         }
         else if(mutebutton.currentFrame == 3)
         {
            mutebutton.gotoAndStop(4);
         }
         else if(mutebutton.currentFrame == 4)
         {
            mutebutton.gotoAndStop(2);
         }
      }
      
      public function hexdialogClickEvent(param1:Event) : void
      {
         StatsManager.instance.map.gui.hexdialog.gotoAndStop(1);
         StatsManager.instance.map.gui.hexdialog.visible = true;
      }
      
      internal function frame1() : *
      {
         infoicon.addEventListener(MouseEvent.CLICK,infoClickEvent);
         stats.buttonMode = true;
         stats.addEventListener(MouseEvent.CLICK,statsClickEvent);
         endturnbutton.addEventListener(MouseEvent.CLICK,endturnClickEvent);
         stratinstructionbtn.addEventListener(MouseEvent.CLICK,hexdialogClickEvent);
         if(Boolean(SoundManager.instance.isPlaying) && Boolean(SoundManager.instance.playSounds))
         {
            mutebutton.gotoAndStop(2);
         }
         else if(!SoundManager.instance.isPlaying && Boolean(SoundManager.instance.playSounds))
         {
            mutebutton.gotoAndStop(3);
         }
         else if(!SoundManager.instance.isPlaying && !SoundManager.instance.playSounds)
         {
            mutebutton.gotoAndStop(4);
         }
         mutebutton.buttonMode = true;
         mutebutton.addEventListener(MouseEvent.CLICK,mute2ClickEvent);
      }
      
      public function infoClickEvent(param1:Event) : void
      {
         StatsManager.instance.displayStats();
      }
      
      public function endturnClickEvent(param1:Event) : void
      {
         HexManager.endPlayerTurn();
      }
   }
}

