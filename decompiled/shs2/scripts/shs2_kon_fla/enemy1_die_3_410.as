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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol233")]
   public dynamic class enemy1_die_3_410 extends MovieClip
   {
      
      public var pt:*;
      
      public var xpos:*;
      
      public var xvel:*;
      
      public var bp:*;
      
      public var arm:*;
      
      public var bloodspurt:MovieClip;
      
      public var marker:MovieClip;
      
      public var xscale:*;
      
      public var rot:*;
      
      public function enemy1_die_3_410()
      {
         super();
         addFrameScript(1,frame2,18,frame19,29,frame30);
      }
      
      internal function frame30() : *
      {
         stop();
         MovieClip(parent.parent).deathAnimDone = true;
      }
      
      internal function frame19() : *
      {
         if(bp != null)
         {
            bp.setActive(false);
         }
      }
      
      internal function frame2() : *
      {
         if(Boolean(Player.instance.isRedFreeze) || ParticleSystemManager.isAbleToSupport())
         {
            bp = ParticleSystemManager.instance.createParticleSystem(BloodParticleSystem.typeCode,0,0,this);
            bp.setMarker(marker);
            bp.setNumber(10);
            bloodspurt.visible = false;
         }
         marker.visible = false;
         xvel = Math.random() * 3 + 5;
         xpos = 0;
         rot = Math.random() * 10 + 15;
         xscale = -1;
         if(MovieClip(parent.parent).currentFrame == 1)
         {
            xvel = -xvel;
            xpos = 30;
            rot = -rot;
            xscale = 1;
         }
         pt = new Point(xpos,-30);
         pt = this.localToGlobal(pt);
         arm = ProjectileManager.instance.createProjectile(4,pt.x,pt.y,xvel,Math.random() * 3 + 3);
         arm.rot = rot;
         arm.scaleX = xscale;
      }
   }
}

