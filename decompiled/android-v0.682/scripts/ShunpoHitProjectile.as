package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1659")]
   public class ShunpoHitProjectile extends Projectile
   {
      
      internal var ownerIsNetworkPlayer:Boolean = false;
      
      public function ShunpoHitProjectile()
      {
         super();
      }
      
      override public function init(velX:int, velY:int, damage:int, skilllevel:int, owner:NPC = null) : *
      {
         var mcsplayer:MCSPlayer = null;
         flying = true;
         ttl = 3;
         this.owner = owner;
         if(velX < 0)
         {
            scaleX = -scaleX;
         }
         damageObj = new Damage(damage,skilllevel,Damage.LAUNCH_AIR,MCSPlayer.LIGHT_STANCE);
         if(owner != null && owner is MCSPlayer)
         {
            mcsplayer = MCSPlayer(owner);
            this.ownerIsNetworkPlayer = mcsplayer.isNetworkPlayer();
         }
      }
      
      override public function update() : *
      {
         --ttl;
         if(ttl <= 0)
         {
            this.removeProjectile();
         }
         else if(isFriendly())
         {
            NPCManager.checkHitObject(this,damageObj,250,true);
         }
         else if(!this.ownerIsNetworkPlayer)
         {
            NPCManager.checkPlayerHitObject(this,damageObj,250);
         }
      }
      
      override internal function removeProjectile() : *
      {
         flying = false;
         visible = false;
         MovieClip(parent).removeChild(this);
         ProjectileManager.unregister(this);
      }
   }
}

