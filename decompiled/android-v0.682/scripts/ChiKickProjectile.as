package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1778")]
   public class ChiKickProjectile extends Projectile
   {
      
      internal var ownerIsNetworkPlayer:Boolean = false;
      
      public function ChiKickProjectile()
      {
         super();
         addFrameScript(8,this.frame9);
      }
      
      override public function init(velX:int, velY:int, damage:int, skilllevel:int, owner:NPC = null) : *
      {
         var mcsplayer:MCSPlayer = null;
         if(skilllevel == 1)
         {
            damage = 50;
         }
         else if(skilllevel == 2)
         {
            damage = 75;
         }
         else if(skilllevel == 3)
         {
            damage = 100;
         }
         visible = true;
         flying = true;
         if(velX < 0)
         {
            scaleX = -scaleX;
         }
         this.owner = owner;
         damageObj = new Damage(damage,0,Damage.LAUNCH_FLY);
         if(velX < 0)
         {
            damageObj.setFlyVel(-25,-10);
         }
         else
         {
            damageObj.setFlyVel(25,-10);
         }
         if(owner != null && owner is MCSPlayer)
         {
            mcsplayer = MCSPlayer(owner);
            this.ownerIsNetworkPlayer = mcsplayer.isNetworkPlayer();
         }
      }
      
      override public function update() : *
      {
         if(currentFrame <= 2)
         {
            return;
         }
         if(isFriendly())
         {
            NPCManager.checkHitObject(this,damageObj,200,true);
         }
         else if(!this.ownerIsNetworkPlayer)
         {
            NPCManager.checkPlayerHitObject(this,damageObj,200);
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
      
      internal function frame9() : *
      {
         this.removeProjectile();
      }
   }
}

