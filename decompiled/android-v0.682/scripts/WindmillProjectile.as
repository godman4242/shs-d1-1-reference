package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1595")]
   public class WindmillProjectile extends Projectile
   {
      
      internal var friction:Number = -1;
      
      internal var positiveVelX:Boolean = true;
      
      public function WindmillProjectile()
      {
         super();
         addFrameScript(34,this.frame35);
      }
      
      override public function init(velX:int, velY:int, damage:int, skilllevel:int, owner:NPC = null) : *
      {
         if(skilllevel == 1)
         {
            damage = 40;
         }
         else if(skilllevel == 2)
         {
            damage = 80;
         }
         else if(skilllevel == 3)
         {
            damage = 120;
         }
         visible = true;
         flying = true;
         this.velX = velX;
         this.velY = velY;
         this.owner = owner;
         if(velX < 0)
         {
            scaleX = -scaleX;
            this.friction = 1;
            this.positiveVelX = false;
         }
         damageObj = new Damage(damage,0,Damage.LAUNCH_KNOCKDOWN);
      }
      
      override public function update() : *
      {
         if(this.positiveVelX && velX < 0 && x < -10 || !this.positiveVelX && velX > 0 && x > StatsManager.stageWidth + 10)
         {
            this.removeProjectile();
            return;
         }
         x += velX;
         velX += this.friction;
         if(isFriendly())
         {
            NPCManager.checkHitObject(this,damageObj);
         }
         else
         {
            NPCManager.checkPlayerHitObject(this,damageObj);
         }
         if((this.positiveVelX && velX < 0 || !this.positiveVelX && velX > 0) && (owner.mcs.x - x) * (owner.mcs.x - x) < 2500 && owner.testHit(this))
         {
            this.removeProjectile();
         }
      }
      
      override internal function removeProjectile() : *
      {
         flying = false;
         visible = false;
         MovieClip(parent).removeChild(this);
         ProjectileManager.unregister(this);
      }
      
      internal function frame35() : *
      {
         gotoAndPlay(15);
      }
   }
}

