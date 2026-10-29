package
{
   import flash.display.MovieClip;
   
   public class Projectile extends MovieClip
   {
      
      public static var gravity:Number = 1;
      
      internal var ttl:int;
      
      internal var ttlMax:int = 30 * 24;
      
      internal var removeMe:Boolean = false;
      
      internal var velX:Number = 0;
      
      internal var velY:Number = 0;
      
      public var gotHit:Boolean = false;
      
      internal var flying:Boolean = true;
      
      public function Projectile()
      {
         ttl = ttlMax;
         super();
      }
      
      public function stopMotion() : *
      {
         velX = 0;
         velY = 0;
      }
      
      public function breakarrow() : *
      {
      }
      
      public function isFlying() : Boolean
      {
         return flying;
      }
      
      public function scrollRight(param1:int) : *
      {
         x -= param1;
      }
      
      public function remove() : *
      {
         MovieClip(this.parent).removeChild(this);
      }
      
      public function doDissappear() : *
      {
         if(ttl >= 0)
         {
            --ttl;
            if(ttl < 24)
            {
               this.alpha = ttl / 24;
            }
            if(ttl <= 0)
            {
               removeMe = true;
            }
         }
      }
      
      public function setFlying(param1:Boolean) : *
      {
         flying = param1;
      }
      
      public function continueAnimation() : *
      {
      }
      
      public function stopAnimation() : *
      {
      }
      
      public function update() : *
      {
      }
      
      public function getVelX() : Number
      {
         return velX;
      }
   }
}

