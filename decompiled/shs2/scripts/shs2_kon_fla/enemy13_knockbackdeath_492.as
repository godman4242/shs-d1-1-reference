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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol678")]
   public dynamic class enemy13_knockbackdeath_492 extends MovieClip
   {
      
      public function enemy13_knockbackdeath_492()
      {
         super();
         addFrameScript(14,frame15);
      }
      
      internal function frame15() : *
      {
         stop();
         MovieClip(parent.parent).deathAnimDone = true;
      }
   }
}

