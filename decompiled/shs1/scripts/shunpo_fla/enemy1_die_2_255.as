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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol120")]
   public dynamic class enemy1_die_2_255 extends MovieClip
   {
      
      public var pt:*;
      
      public var xpos:*;
      
      public var xvel:*;
      
      public var bp:*;
      
      public var bloodspurt:MovieClip;
      
      public var marker:MovieClip;
      
      public var rot:*;
      
      public var head:*;
      
      public function enemy1_die_2_255()
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
         if(Player.stageMode == 1 || ParticleSystemManager.isAbleToSupport())
         {
            bp = ParticleSystemManager.instance.createParticleSystem(BloodParticleSystem.typeCode,0,0,this);
            bp.setMarker(marker);
            bp.setNumber(10);
            bp.setVel(6);
            bloodspurt.visible = false;
         }
         marker.visible = false;
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
         pt = EnemyManager.instance.getGameStage().globalToLocal(pt);
         head = ProjectileManager.instance.createProjectile(3,pt.x,pt.y,xvel,Math.random() * 3 + 3);
         head.rot = rot;
      }
   }
}

