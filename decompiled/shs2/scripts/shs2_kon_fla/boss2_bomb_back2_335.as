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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1377")]
   public dynamic class boss2_bomb_back2_335 extends MovieClip
   {
      
      public var jetpack:MovieClip;
      
      public function boss2_bomb_back2_335()
      {
         super();
         addFrameScript(7,frame8,10,frame11);
      }
      
      internal function frame8() : *
      {
         MovieClip(parent.parent).fireHomingRocketFromBack();
      }
      
      internal function frame11() : *
      {
         MovieClip(parent.parent).moveAgain();
      }
   }
}

