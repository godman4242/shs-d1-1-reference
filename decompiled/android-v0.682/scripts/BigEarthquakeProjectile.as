package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1944")]
   public class BigEarthquakeProjectile extends Projectile
   {
      
      internal var rot:int;
      
      public function BigEarthquakeProjectile()
      {
         super();
         addFrameScript(12,this.frame13);
      }
      
      override public function init(velX:int, velY:int, damage:int, skilllevel:int, owner:NPC = null) : *
      {
         visible = true;
         flying = true;
         if(velX < 0)
         {
            scaleX = -scaleX;
         }
         this.velY = velY;
         this.owner = owner;
         damageObj = new Damage(0,0,Damage.LAUNCH_KNOCKDOWN,-1,0,0,0,damage * 1.5);
         gotoAndStop(int(Math.random() * 2) + 1);
         if(int(Math.random() * 2) == 0)
         {
            this.rot = -30;
         }
         else
         {
            this.rot = 30;
         }
         ttl = 0;
      }
      
      public function setDelay(num:int) : *
      {
         ttl = num;
         if(ttl > 0)
         {
            visible = false;
         }
      }
      
      override public function update() : *
      {
         if(ttl > 0)
         {
            --ttl;
            if(ttl == 0)
            {
               visible = true;
            }
            return;
         }
         if(flying)
         {
            x += velX;
            y += velY;
            velY += GRAVITY;
            rotation += this.rot;
            if(isFriendly())
            {
               NPCManager.checkHitObject(this,damageObj,50);
            }
            else
            {
               NPCManager.checkPlayerHitObject(this,damageObj,50);
            }
            if(this.y > StageManager.getGroundY() && velY > 0)
            {
               flying = false;
               gotoAndPlay("break");
               return;
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
      
      internal function frame13() : *
      {
         stop();
         this.removeProjectile();
      }
   }
}

