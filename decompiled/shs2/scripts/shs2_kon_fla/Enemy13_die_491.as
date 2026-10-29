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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol658")]
   public dynamic class Enemy13_die_491 extends MovieClip
   {
      
      public var bp:*;
      
      public var bloodspurt:MovieClip;
      
      public var marker:MovieClip;
      
      public function Enemy13_die_491()
      {
         super();
         addFrameScript(0,frame1,35,frame36,47,frame48);
      }
      
      internal function frame1() : *
      {
         if(Boolean(Player.instance.isRedFreeze) || ParticleSystemManager.isAbleToSupport())
         {
            bp = ParticleSystemManager.instance.createParticleSystem(BloodParticleSystem.typeCode,0,0,this);
            bp.setMarker(marker);
            bloodspurt.visible = false;
         }
         marker.visible = false;
      }
      
      internal function frame36() : *
      {
         if(bp != null)
         {
            bp.setActive(false);
         }
      }
      
      internal function frame48() : *
      {
         stop();
         MovieClip(parent.parent).deathAnimDone = true;
      }
   }
}

