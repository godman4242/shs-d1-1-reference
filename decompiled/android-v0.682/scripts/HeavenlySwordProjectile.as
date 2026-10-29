package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1731")]
   public class HeavenlySwordProjectile extends Projectile
   {
      
      public var hitarea:MovieClip;
      
      internal var ownerIsNetworkPlayer:Boolean = false;
      
      public function HeavenlySwordProjectile()
      {
         super();
         addFrameScript(0,this.frame1,40,this.frame41);
      }
      
      override public function init(velX:int, velY:int, damage:int, skilllevel:int, owner:NPC = null) : *
      {
         var mcsplayer:MCSPlayer = null;
         damage = 500;
         stop();
         if(skilllevel == 1)
         {
            ttl = 5 * 24;
         }
         else if(skilllevel == 2)
         {
            ttl = 4 * 24;
         }
         else if(skilllevel == 3)
         {
            ttl = 3 * 24;
         }
         visible = true;
         flying = true;
         if(velX < 0)
         {
            scaleX = -scaleX;
         }
         this.owner = owner;
         damageObj = new Damage(damage,0,Damage.LAUNCH_KNOCKDOWN);
         this.hitarea.visible = false;
         if(owner != StatsManager.getPlayer())
         {
            visible = false;
         }
         if(owner != null && owner is MCSPlayer)
         {
            mcsplayer = MCSPlayer(owner);
            this.ownerIsNetworkPlayer = mcsplayer.isNetworkPlayer();
         }
      }
      
      override public function update() : *
      {
         --ttl;
         if(ttl == 0)
         {
            gotoAndPlay(2);
            visible = true;
         }
         if(currentFrame >= 16 && currentFrame < 26 && !StageManager.isRedFreeze())
         {
            if(isFriendly())
            {
               NPCManager.checkHitObject(this.hitarea,damageObj,120,false,this);
            }
            else
            {
               NPCManager.checkPlayerHitObject(this.hitarea,damageObj,120,false,this);
            }
            if(currentFrame == 16)
            {
               StageManager.startShake(12);
            }
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
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame41() : *
      {
         this.removeProjectile();
      }
   }
}

