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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol168")]
   public dynamic class enemy6_falling_455 extends MovieClip
   {
      
      public var bp:*;
      
      public var bloodspurt:MovieClip;
      
      public var marker:MovieClip;
      
      public function enemy6_falling_455()
      {
         super();
         addFrameScript(2,frame3);
      }
      
      internal function frame3() : *
      {
         stop();
         bloodspurt.visible = false;
         marker.visible = false;
         if(MovieClip(parent.parent).hp <= 0)
         {
            bloodspurt.visible = true;
            if(Boolean(Player.instance.isRedFreeze) || ParticleSystemManager.isAbleToSupport())
            {
               bp = ParticleSystemManager.instance.createParticleSystem(BloodParticleSystem.typeCode,0,0,this);
               bp.setMarker(marker);
               bp.setTTL(10);
               bp.setNumber(15);
               bloodspurt.visible = false;
            }
         }
      }
   }
}

