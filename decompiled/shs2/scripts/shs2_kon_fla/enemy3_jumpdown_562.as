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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol374")]
   public dynamic class enemy3_jumpdown_562 extends MovieClip
   {
      
      public var weapon:MovieClip;
      
      public var head:MovieClip;
      
      public function enemy3_jumpdown_562()
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

