package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1889")]
   public class BigWaveProjectile extends Projectile
   {
      
      public function BigWaveProjectile()
      {
         super();
         addFrameScript(25,this.frame26);
      }
      
      override public function init(velX:int, velY:int, damage:int, skilllevel:int, owner:NPC = null) : *
      {
         visible = true;
         if(velX < 0)
         {
            scaleX = -scaleX;
         }
         this.velX = velX;
         this.owner = owner;
         damageObj = new Damage(0,0,Damage.LAUNCH_KNOCKDOWN,-1,0,damage * 1.5);
      }
      
      override public function update() : *
      {
         if(visible)
         {
            x += velX;
            if(isFriendly())
            {
               NPCManager.checkHitObject(this,damageObj,400);
            }
            else
            {
               NPCManager.checkPlayerHitObject(this,damageObj,400);
            }
         }
      }
      
      override internal function removeProjectile() : *
      {
         stop();
         visible = false;
         MovieClip(parent).removeChild(this);
         ProjectileManager.unregister(this);
      }
      
      internal function frame26() : *
      {
         stop();
         this.removeProjectile();
      }
   }
}

