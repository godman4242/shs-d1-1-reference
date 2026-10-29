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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol446")]
   public dynamic class enemy11_outofcontrol_542 extends MovieClip
   {
      
      public var pt:*;
      
      public var xpos:*;
      
      public var xvel:*;
      
      public var jetpack:MovieClip;
      
      public var flame:MovieClip;
      
      public var bp:*;
      
      public var bloodspurt:MovieClip;
      
      public var enemy:MovieClip;
      
      public var marker:MovieClip;
      
      public var headdrop:*;
      
      public var rot:*;
      
      public var head:MovieClip;
      
      public function enemy11_outofcontrol_542()
      {
         super();
         addFrameScript(0,frame1,35,frame36,47,frame48,48,frame49,49,frame50,50,frame51,52,frame53,54,frame55);
      }
      
      internal function frame50() : *
      {
         if(MovieClip(parent.parent).headshot)
         {
            enemy.head.visible = false;
         }
      }
      
      internal function frame1() : *
      {
         marker.visible = false;
         bloodspurt.visible = false;
         if(MovieClip(parent.parent).headshot)
         {
            head.visible = false;
            if(Boolean(Player.instance.isRedFreeze) || ParticleSystemManager.isAbleToSupport())
            {
               bp = ParticleSystemManager.instance.createParticleSystem(BloodParticleSystem.typeCode,0,0,this);
               bp.setMarker(marker);
               bp.setNumber(10);
               bp.setVel(6);
               bloodspurt.visible = false;
            }
            else
            {
               bloodspurt.visible = true;
            }
            xvel = Math.random() * 3 + 3;
            xpos = 0;
            rot = -(Math.random() * 10 + 10);
            if(Math.random() * 2 < 1)
            {
               xvel = -xvel;
               xpos = 50;
               rot = -rot;
            }
            pt = new Point(xpos,-80 - Math.random() * 20);
            pt = this.localToGlobal(pt);
            headdrop = ProjectileManager.instance.createProjectile(3,pt.x,pt.y,xvel,Math.random() * 3 + 3);
            headdrop.rot = rot;
         }
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
         MovieClip(parent.parent).explode();
         if(MovieClip(parent.parent).headshot)
         {
            enemy.head.visible = false;
         }
         MovieClip(parent.parent).checkEnemyWeaponHitPlayer(this);
      }
      
      internal function frame49() : *
      {
         if(MovieClip(parent.parent).headshot)
         {
            enemy.head.visible = false;
         }
      }
      
      internal function frame51() : *
      {
         MovieClip(parent.parent).checkEnemyWeaponHitPlayer(this);
      }
      
      internal function frame55() : *
      {
         stop();
         MovieClip(parent.parent).dieEnd();
      }
      
      internal function frame53() : *
      {
         MovieClip(parent.parent).checkEnemyWeaponHitPlayer(this);
      }
   }
}

