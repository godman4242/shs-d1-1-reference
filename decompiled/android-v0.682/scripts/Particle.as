package
{
   import flash.display.Bitmap;
   
   public class Particle
   {
      
      internal var velX:Number = 0;
      
      internal var velY:Number = 0;
      
      internal var ttl:int = -1;
      
      internal var maxttl:int = 0;
      
      internal var gravity:Number = 0;
      
      internal var bitmap:Bitmap;
      
      internal var groundY:int;
      
      public function Particle()
      {
         super();
      }
      
      public function init(x:int, y:int, angle:Number, anglevariance:int, vel:Number, velvariance:int, ttl:int, gravity:Number) : *
      {
         this.bitmap.x = x;
         this.bitmap.y = y;
         this.gravity = gravity;
         angle = angle + Math.random() * 2 * anglevariance - anglevariance;
         vel = vel + Math.random() * 2 * velvariance - velvariance;
         this.maxttl = ttl;
         this.velX = Math.sin(angle * (Math.PI / 180)) * vel;
         this.velY = Math.cos(angle * (Math.PI / 180)) * vel * -1;
         this.ttl = ttl;
         this.bitmap.visible = true;
         this.bitmap.scaleX = 0.6 + Math.random() * 4 / 10;
         this.bitmap.scaleY = 0.6 + Math.random() * 4 / 10;
         this.groundY = StageManager.getGroundY() + 8;
      }
      
      public function getBitmap() : Bitmap
      {
         return this.bitmap;
      }
      
      public function doScroll(dist:int) : *
      {
         this.bitmap.x -= dist;
      }
      
      public function isDead() : Boolean
      {
         return this.ttl < 0;
      }
      
      public function destroy() : *
      {
      }
      
      public function update() : *
      {
         if(this.ttl < 0 || !this.bitmap.visible)
         {
            return;
         }
         if(this.ttl == 0 || this.bitmap.y > this.groundY)
         {
            this.destroy();
         }
         --this.ttl;
         this.bitmap.x += this.velX;
         this.bitmap.y += this.velY;
         this.velY += this.gravity;
         this.bitmap.alpha = this.ttl / this.maxttl + 0.1;
      }
   }
}

