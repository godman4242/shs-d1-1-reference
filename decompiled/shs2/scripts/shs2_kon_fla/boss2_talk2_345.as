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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1426")]
   public dynamic class boss2_talk2_345 extends MovieClip
   {
      
      public var enemy:MovieClip;
      
      public function boss2_talk2_345()
      {
         super();
         addFrameScript(89,frame90);
      }
      
      internal function frame90() : *
      {
         stop();
         MovieClip(parent.parent).fleeDone();
      }
   }
}

