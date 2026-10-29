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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2569")]
   public dynamic class gui_transition_fortwalls_292 extends MovieClip
   {
      
      public function gui_transition_fortwalls_292()
      {
         super();
         addFrameScript(24,frame25,25,frame26,46,frame47,59,frame60);
      }
      
      internal function frame25() : *
      {
         stop();
      }
      
      internal function frame26() : *
      {
         SoundManager.instance.stopMusic();
      }
      
      internal function frame47() : *
      {
         MovieClip(parent).initMode = true;
      }
      
      internal function frame60() : *
      {
         MovieClip(parent).goNextStage();
      }
   }
}

