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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2319")]
   public dynamic class gui_transition_80 extends MovieClip
   {
      
      public var timeTaken:TextField;
      
      public var slashes:TextField;
      
      public var enemiesLaunched:TextField;
      
      public var hitsTaken:TextField;
      
      public var deaths:TextField;
      
      public var maxCombo:TextField;
      
      public var score:TextField;
      
      public var continuebutton:SimpleButton;
      
      public var kills:TextField;
      
      public var headshots:TextField;
      
      public var enemiesStabbed:TextField;
      
      public function gui_transition_80()
      {
         super();
         addFrameScript(24,frame25,25,frame26,95,frame96,102,frame103,169,frame170);
      }
      
      public function continueClickEvent(param1:Event) : void
      {
         MovieClip(parent).goNextStage();
      }
      
      internal function frame170() : *
      {
         stop();
         MovieClip(parent).goNextStage();
      }
      
      internal function frame25() : *
      {
         stop();
      }
      
      internal function frame26() : *
      {
         MovieClip(parent).playerhp.visible = false;
         SoundManager.instance.playMusic(9);
      }
      
      internal function frame96() : *
      {
         Player.instance.winPause();
      }
      
      internal function frame103() : *
      {
         stop();
         StatsManager.stageComplete();
         continuebutton.addEventListener(MouseEvent.CLICK,continueClickEvent);
         score.text = StatsManager.score.toString();
         timeTaken.text = StatsManager.getTimeTaken();
         hitsTaken.text = StatsManager.hitsTaken.toString();
         slashes.text = StatsManager.slashes.toString();
         kills.text = StatsManager.kills.toString();
         headshots.text = StatsManager.headshots.toString();
         deaths.text = StatsManager.deaths.toString();
         maxCombo.text = StatsManager.maxCombo.toString();
         enemiesLaunched.text = StatsManager.enemiesLaunched.toString();
         enemiesStabbed.text = StatsManager.enemiesStabbed.toString();
      }
   }
}

