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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1606")]
   public dynamic class boss4_shell_inside_8grenade_250 extends MovieClip
   {
      
      public var flame:MovieClip;
      
      public function boss4_shell_inside_8grenade_250()
      {
         super();
         addFrameScript(64,frame65,69,frame70);
      }
      
      internal function frame65() : *
      {
         MovieClip(parent.parent.parent).closeLid();
         MovieClip(parent.parent.parent).createGrenade(8);
      }
      
      internal function frame70() : *
      {
         MovieClip(parent).gotoAndStop(1);
      }
   }
}

