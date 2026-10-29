package shunpo_fla
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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol263")]
   public dynamic class enemy6_throwspear_270 extends MovieClip
   {
      
      public var weapon:MovieClip;
      
      public function enemy6_throwspear_270()
      {
         super();
         addFrameScript(7,frame8);
      }
      
      internal function frame8() : *
      {
         MovieClip(parent.parent).throwSpear();
      }
   }
}

