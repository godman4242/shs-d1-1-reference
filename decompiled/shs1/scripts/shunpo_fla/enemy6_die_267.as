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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol239")]
   public dynamic class enemy6_die_267 extends MovieClip
   {
      
      public var bp:*;
      
      public var bloodspurt:MovieClip;
      
      public var marker:MovieClip;
      
      public function enemy6_die_267()
      {
         super();
         addFrameScript(0,frame1,58,frame59,59,frame60);
      }
      
      internal function frame1() : *
      {
         if(Player.stageMode == 1 || ParticleSystemManager.isAbleToSupport())
         {
            bp = ParticleSystemManager.instance.createParticleSystem(BloodParticleSystem.typeCode,0,0,this);
            bp.setMarker(marker);
            bp.setVel(10);
            bloodspurt.visible = false;
         }
         marker.visible = false;
      }
      
      internal function frame59() : *
      {
         if(bp != null)
         {
            bp.setActive(false);
         }
      }
      
      internal function frame60() : *
      {
         stop();
         MovieClip(parent.parent).deathAnimDone = true;
      }
   }
}

