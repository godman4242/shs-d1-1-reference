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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1170")]
   public dynamic class boss3_death_381 extends MovieClip
   {
      
      public var enemy:MovieClip;
      
      public var explosion2:MovieClip;
      
      public var explosion1:MovieClip;
      
      public function boss3_death_381()
      {
         super();
         addFrameScript(0,frame1,69,frame70,70,frame71,83,frame84);
      }
      
      internal function frame70() : *
      {
         MovieClip(parent.parent).playerMoveOn();
         SoundManager.instance.playBoom();
      }
      
      internal function frame71() : *
      {
         SoundManager.instance.playBoom();
      }
      
      internal function frame84() : *
      {
         MovieClip(parent.parent).deathAnimDone = true;
         stop();
      }
      
      internal function frame1() : *
      {
         enemy.gotoAndStop(3);
      }
   }
}

