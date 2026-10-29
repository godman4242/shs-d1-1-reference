package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1774")]
   public class ChiPunchProjectile extends Projectile
   {
      
      internal var ownerIsNetworkPlayer:Boolean = false;
      
      public function ChiPunchProjectile()
      {
         super();
         addFrameScript(3,this.frame4);
      }
      
      override public function init(velX:int, velY:int, damage:int, skilllevel:int, owner:NPC = null) : *
      {
         var mcsplayer:MCSPlayer = null;
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
         if(velX < 0)
         {
            scaleX = -scaleX;
         }
         this.owner = owner;
         damageObj = new Damage(damage,0,Damage.LAUNCH_KNOCKDOWN);
         if(owner != null && owner is MCSPlayer)
         {
            mcsplayer = MCSPlayer(owner);
            this.ownerIsNetworkPlayer = mcsplayer.isNetworkPlayer();
         }
      }
      
      override public function update() : *
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
      
      override internal function removeProjectile() : *
      {
         stop();
         flying = false;
         visible = false;
         MovieClip(parent).removeChild(this);
         ProjectileManager.unregister(this);
      }
      
      internal function frame4() : *
      {
         this.removeProjectile();
      }
   }
}

