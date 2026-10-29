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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol417")]
   public dynamic class samurai_die_191 extends MovieClip
   {
      
      public var pt:*;
      
      public var xpos:*;
      
      public var xvel:*;
      
      public var bp:*;
      
      public var bloodspurt:MovieClip;
      
      public var marker:MovieClip;
      
      public var hat:*;
      
      public var rot:*;
      
      public function samurai_die_191()
      {
         super();
         addFrameScript(0,frame1,22,frame23,24,frame25,30,frame31,32,frame33,39,frame40,41,frame42,46,frame47,48,frame49,59,frame60);
      }
      
      internal function frame1() : *
      {
         bp = ParticleSystemManager.instance.createParticleSystem(BloodParticleSystem.typeCode,0,0,this);
         bp.setMarker(marker);
         bp.setNumber(15);
         bp.setVel(7);
         bloodspurt.visible = false;
         marker.visible = false;
         xvel = 3;
         xpos = 0;
         rot = 30;
         if(Math.random() * 2 < 1)
         {
            xvel = -xvel;
            xpos = 50;
            rot = -rot;
         }
         pt = new Point(xpos,-85);
         pt = this.localToGlobal(pt);
         pt = EnemyManager.instance.getGameStage().globalToLocal(pt);
         hat = ProjectileManager.instance.createProjectile(7,pt.x,pt.y,xvel,15);
         hat.rot = rot;
         stage.frameRate = 12;
      }
      
      internal function frame25() : *
      {
         if(bp != null)
         {
            bp.setActive(true);
         }
      }
      
      internal function frame23() : *
      {
         if(bp != null)
         {
            bp.setActive(false);
         }
         bp.setVel(9);
         bp.setNumber(15);
      }
      
      internal function frame31() : *
      {
         if(bp != null)
         {
            bp.setActive(false);
         }
      }
      
      internal function frame40() : *
      {
         if(bp != null)
         {
            bp.setActive(false);
         }
         bp.setNumber(10);
      }
      
      internal function frame33() : *
      {
         if(bp != null)
         {
            bp.setActive(true);
         }
      }
      
      internal function frame47() : *
      {
         if(bp != null)
         {
            bp.setActive(false);
         }
      }
      
      internal function frame49() : *
      {
         if(bp != null)
         {
            bp.setActive(true);
         }
      }
      
      internal function frame42() : *
      {
         if(bp != null)
         {
            bp.setActive(true);
         }
      }
      
      internal function frame60() : *
      {
         stop();
         if(bp != null)
         {
            bp.setActive(false);
         }
      }
   }
}

