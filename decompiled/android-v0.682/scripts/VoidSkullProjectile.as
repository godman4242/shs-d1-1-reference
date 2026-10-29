package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1636")]
   public class VoidSkullProjectile extends Projectile
   {
      
      public var fire:MovieClip;
      
      public var skull:MovieClip;
      
      internal var hasRotation:Boolean = true;
      
      public function VoidSkullProjectile()
      {
         super();
      }
      
      override public function init(velX:int, velY:int, damage:int, skilllevel:int, owner:NPC = null) : *
      {
         if(skilllevel == 1)
         {
            damage = 10;
         }
         else if(skilllevel == 2)
         {
            damage = 20;
         }
         else if(skilllevel == 3)
         {
            damage = 30;
         }
         visible = true;
         flying = true;
         this.velX = velX;
         this.velY = velY;
         if(velX == 0 || velY == 0)
         {
            this.hasRotation = false;
         }
         this.owner = owner;
         if(velX < 0)
         {
            scaleX = -scaleX;
         }
         damageObj = new Damage(damage,0,Damage.LAUNCH_AIR);
      }
      
      override public function update() : *
      {
         x += velX;
         y += velY;
         if(flying)
         {
            if(y < -10 || velX < 0 && x < -10 || velX > 0 && x > StatsManager.stageWidth + 10)
            {
               this.removeProjectile();
               return;
            }
            if(this.hasRotation)
            {
               velY += GRAVITY;
               rotation = Math.atan(velY / velX) * 57.2727 + 180;
            }
            if(isFriendly())
            {
               if(NPCManager.checkHitObject(this,damageObj))
               {
                  ttl = 6;
                  flying = false;
                  this.fire.visible = false;
                  if(!StageManager.isRedFreeze())
                  {
                     ProjectileManager.createProjectile(ProjectileManager.PROJ_VOIDFIRECOLUMN,StageManager.getStagePosition() + x,StageManager.getGameStage().getGroundY(),0,0,0,1,owner);
                  }
               }
            }
            else if(NPCManager.checkPlayerHitObject(this,damageObj))
            {
               ttl = 6;
               flying = false;
               this.fire.visible = false;
               if(!StageManager.isRedFreeze())
               {
                  ProjectileManager.createProjectile(ProjectileManager.PROJ_VOIDFIRECOLUMN,StageManager.getStagePosition() + x,StageManager.getGameStage().getGroundY(),0,0,0,1,owner);
               }
            }
         }
         else
         {
            this.doDisappear();
         }
      }
      
      override public function doDisappear() : *
      {
         if(ttl >= 0)
         {
            --ttl;
            if(ttl < 6)
            {
               flying = false;
               this.alpha = ttl / 6;
               if(scaleX > 0)
               {
                  scaleX += 0.4;
               }
               else
               {
                  scaleX -= 0.4;
               }
               this.scaleY += 0.4;
            }
            if(ttl <= 0)
            {
               this.alpha = 1;
               this.removeProjectile();
            }
         }
      }
      
      override internal function removeProjectile() : *
      {
         flying = false;
         visible = false;
         MovieClip(parent).removeChild(this);
         ProjectileManager.unregister(this);
      }
      
      override public function redFreeze() : *
      {
         ColorCode.makeDark(this,-255);
         this.fire.stop();
      }
   }
}

