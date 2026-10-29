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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1567")]
   public dynamic class boss4_shell_inside_4grenade_249 extends MovieClip
   {
      
      public var flame:MovieClip;
      
      public function boss4_shell_inside_4grenade_249()
      {
         super();
         addFrameScript(37,frame38,42,frame43);
      }
      
      internal function frame38() : *
      {
         MovieClip(parent.parent.parent).closeLid();
         MovieClip(parent.parent.parent).createGrenade(4);
      }
      
      internal function frame43() : *
      {
         MovieClip(parent).gotoAndStop(1);
      }
   }
}

