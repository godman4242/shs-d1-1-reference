package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1769")]
   public class CleaveHitProjectile extends Projectile
   {
      
      internal var ownerIsNetworkPlayer:Boolean = false;
      
      public function CleaveHitProjectile()
      {
         super();
      }
      
      override public function init(velX:int, velY:int, damage:int, skilllevel:int, owner:NPC = null) : *
      {
         var mcsplayer:MCSPlayer = null;
         flying = true;
         ttl = 10;
         this.owner = owner;
         if(velX < 0)
         {
            scaleX = -scaleX;
         }
         damageObj = new Damage(damage,skilllevel,Damage.LAUNCH_AIR,MCSPlayer.HEAVY_STANCE);
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
         else if(ttl >= 9)
         {
            if(isFriendly())
            {
               NPCManager.checkHitObject(this,damageObj,200,true);
            }
            else if(!this.ownerIsNetworkPlayer)
            {
               NPCManager.checkPlayerHitObject(this,damageObj,200);
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
   }
}

