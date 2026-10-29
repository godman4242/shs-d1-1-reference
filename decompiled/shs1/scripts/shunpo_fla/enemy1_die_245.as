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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol96")]
   public dynamic class enemy1_die_245 extends MovieClip
   {
      
      public var bp:*;
      
      public var bloodspurt:MovieClip;
      
      public var marker:MovieClip;
      
      public function enemy1_die_245()
      {
         super();
         addFrameScript(1,frame2,18,frame19,29,frame30);
      }
      
      internal function frame19() : *
      {
         if(bp != null)
         {
            bp.setActive(false);
         }
      }
      
      internal function frame30() : *
      {
         stop();
         MovieClip(parent.parent).deathAnimDone = true;
      }
      
      internal function frame2() : *
      {
         if(Player.stageMode == 1 || ParticleSystemManager.isAbleToSupport())
         {
            bp = ParticleSystemManager.instance.createParticleSystem(BloodParticleSystem.typeCode,0,0,this);
            bp.setMarker(marker);
            bloodspurt.visible = false;
         }
         marker.visible = false;
      }
   }
}

