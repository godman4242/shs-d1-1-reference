package
{
   import flash.display.MovieClip;
   
   public class Projectile extends MovieClip
   {
      
      internal static var GRAVITY:Number = 3;
      
      internal static var ID_PART:int = 0;
      
      internal static var ID_ARROW:int = 1;
      
      internal var id:int;
      
      internal var velX:Number = 0;
      
      internal var velY:Number = 0;
      
      internal var flying:Boolean = false;
      
      internal var ttlMax:int = 48;
      
      internal var ttl:int = this.ttlMax;
      
      internal var gotHit:Boolean = false;
      
      internal var owner:NPC;
      
      internal var isDuel:Boolean = false;
      
      internal var damageObj:Damage;
      
      internal var breakable:Boolean = false;
      
      public function Projectile()
      {
         super();
      }
      
      public function init(velX:int, velY:int, damage:int, skilllevel:int, owner:NPC = null) : *
      {
      }
      
      public function update() : *
      {
      }
      
      public function isFlying() : Boolean
      {
         return this.flying;
      }
      
      public function setFlying(flag:Boolean) : *
      {
         this.flying = flag;
      }
      
      public function doDisappear() : *
      {
         if(this.ttl >= 0)
         {
            --this.ttl;
            if(this.ttl < 24)
            {
               this.alpha = this.ttl / 24;
            }
            if(this.ttl <= 0)
            {
               this.alpha = 1;
               this.removeProjectile();
            }
         }
      }
      
      public function getVelX() : Number
      {
         return this.velX;
      }
      
      public function doScroll(dist:int) : *
      {
         x -= dist;
      }
      
      public function doBreak() : *
      {
      }
      
      public function canBreak() : Boolean
      {
         return this.breakable;
      }
      
      public function stopAnimation() : *
      {
      }
      
      public function continueAnimation() : *
      {
      }
      
      public function isFriendly() : Boolean
      {
         if(this.owner == null)
         {
            return false;
         }
         return this.owner.isFriendly;
      }
      
      internal function removeProjectile() : *
      {
      }
      
      public function redFreeze() : *
      {
         ColorCode.makeDark(this,-255);
      }
   }
}

