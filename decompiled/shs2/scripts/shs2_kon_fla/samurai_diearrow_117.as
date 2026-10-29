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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1923")]
   public dynamic class samurai_diearrow_117 extends MovieClip
   {
      
      public var pt:*;
      
      public var xpos:*;
      
      public var xvel:*;
      
      public var bp:*;
      
      public var marker:MovieClip;
      
      public var hat:*;
      
      public var rot:*;
      
      public function samurai_diearrow_117()
      {
         super();
         addFrameScript(0,frame1,18,frame19,49,frame50);
      }
      
      internal function frame1() : *
      {
         if(Player.instance.hp <= 0)
         {
            bp = ParticleSystemManager.instance.createParticleSystem(BloodParticleSystem.typeCode,0,0,this);
            bp.setMarker(marker);
            bp.setNumber(10);
            bp.setVel(6);
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
            hat = ProjectileManager.instance.createProjectile(HatProjectile.typeCode,pt.x,pt.y,xvel,15);
            hat.rot = rot;
            stage.frameRate = 12;
         }
      }
      
      internal function frame19() : *
      {
         if(bp != null)
         {
            bp.setActive(false);
         }
      }
      
      internal function frame50() : *
      {
         stop();
      }
   }
}

