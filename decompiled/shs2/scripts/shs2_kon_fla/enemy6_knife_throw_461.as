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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol971")]
   public dynamic class enemy6_knife_throw_461 extends MovieClip
   {
      
      public var head:MovieClip;
      
      public function enemy6_knife_throw_461()
      {
         super();
         addFrameScript(5,frame6,11,frame12);
      }
      
      internal function frame12() : *
      {
         MovieClip(parent.parent).doIdle();
      }
      
      internal function frame6() : *
      {
         MovieClip(parent.parent).throwKnife();
      }
   }
}

