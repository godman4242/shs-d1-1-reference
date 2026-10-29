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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2559")]
   public dynamic class boss4_entrance_209 extends MovieClip
   {
      
      public function boss4_entrance_209()
      {
         super();
         addFrameScript(167,frame168,382,frame383);
      }
      
      internal function frame168() : *
      {
         SoundManager.instance.playMusic(5);
      }
      
      internal function frame383() : *
      {
         stop();
         MovieClip(parent).goFortWalls();
      }
   }
}

