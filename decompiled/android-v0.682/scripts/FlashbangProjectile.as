package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1733")]
   public class FlashbangProjectile extends Projectile
   {
      
      internal var skilllvl:int;
      
      public function FlashbangProjectile()
      {
         super();
         addFrameScript(1,this.frame2);
      }
      
      override public function init(velX:int, velY:int, damage:int, skilllevel:int, owner:NPC = null) : *
      {
         visible = true;
         flying = true;
         if(velX < 0)
         {
            scaleX = -scaleX;
         }
         this.owner = owner;
         damageObj = new Damage(0,0,Damage.STUN);
         damageObj.setStunTime(24 * 2);
         this.skilllvl = skilllevel;
      }
      
      override public function update() : *
      {
         if(isFriendly())
         {
            NPCManager.checkHitObject(this,damageObj,200);
         }
         else if(NPCManager.checkPlayerHitObject(this,damageObj,200))
         {
            ProjectileManager.createProjectile(ProjectileManager.PROJ_WHITEOUTFX,0,0,0,0,0,this.skilllvl,owner);
         }
      }
      
      override internal function removeProjectile() : *
      {
         stop();
         flying = false;
         visible = false;
         MovieClip(parent).removeChild(this);
         ProjectileManager.unregister(this);
      }
      
      internal function frame2() : *
      {
         this.removeProjectile();
      }
   }
}

