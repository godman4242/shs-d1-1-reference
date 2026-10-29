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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol276")]
   public dynamic class enemy5_jumpdown_603 extends MovieClip
   {
      
      public var shield:MovieClip;
      
      public var head:MovieClip;
      
      public function enemy5_jumpdown_603()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         MovieClip(parent.parent).readyToJump = true;
      }
   }
}

