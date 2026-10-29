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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol173")]
   public dynamic class enemy6_downedbleeding_458 extends MovieClip
   {
      
      public var bp:*;
      
      public var bloodspurt:MovieClip;
      
      public var marker:MovieClip;
      
      public function enemy6_downedbleeding_458()
      {
         super();
         addFrameScript(1,frame2,12,frame13);
      }
      
      internal function frame13() : *
      {
         if(bp != null)
         {
            bp.setActive(false);
         }
         MovieClip(parent.parent).deathAnimDone = true;
         stop();
      }
      
      internal function frame2() : *
      {
         bloodspurt.visible = true;
         marker.visible = false;
      }
   }
}

