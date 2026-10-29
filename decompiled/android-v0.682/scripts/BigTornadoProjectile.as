package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1912")]
   public class BigTornadoProjectile extends Projectile
   {
      
      public function BigTornadoProjectile()
      {
         super();
         addFrameScript(22,this.frame23);
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
         damageObj = new Damage(0,0,Damage.LAUNCH_AIR,-1,0,0,damage * 1.5);
      }
      
      override public function update() : *
      {
         if(visible)
         {
            if(isFriendly())
            {
               NPCManager.checkHitObject(this,damageObj,200);
            }
            else
            {
               NPCManager.checkPlayerHitObject(this,damageObj,200);
            }
            this.x += velX;
         }
      }
      
      override internal function removeProjectile() : *
      {
         stop();
         visible = false;
         MovieClip(parent).removeChild(this);
         ProjectileManager.unregister(this);
      }
      
      internal function frame23() : *
      {
         stop();
         this.removeProjectile();
      }
   }
}

