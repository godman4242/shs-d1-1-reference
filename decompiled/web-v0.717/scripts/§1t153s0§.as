package
{
   import flash.display.Bitmap;
   
   public class §1t153s0§
   {
      
      internal var velX:Number = 0;
      
      internal var velY:Number = 0;
      
      internal var ttl:int = -1;
      
      internal var maxttl:int = 0;
      
      internal var gravity:Number = 0;
      
      internal var bitmap:Bitmap;
      
      internal var §1t2184s0§:int;
      
      public function §1t153s0§()
      {
         super();
      }
      
      public function init(param1:int, param2:int, param3:Number, param4:int, param5:Number, param6:int, param7:int, param8:Number) : *
      {
         this.bitmap.x = param1;
         this.bitmap.y = param2;
         this.gravity = param8;
         param3 = param3 + Math.random() * 2 * param4 - param4;
         param5 = param5 + Math.random() * 2 * param6 - param6;
         this.maxttl = param7;
         this.velX = Math.sin(param3 * (Math.PI / 180)) * param5;
         this.velY = Math.cos(param3 * (Math.PI / 180)) * param5 * -1;
         this.ttl = param7;
         this.bitmap.visible = true;
         this.bitmap.scaleX = 0.6 + Math.random() * 4 / 10;
         this.bitmap.scaleY = 0.6 + Math.random() * 4 / 10;
         this.§1t2184s0§ = §1t1525s0§.§1t4467s0§() + 8;
      }
      
      public function getBitmap() : Bitmap
      {
         return this.bitmap;
      }
      
      public function §1t2289s0§(param1:int) : *
      {
         this.bitmap.x -= param1;
      }
      
      public function §1t2364s0§() : Boolean
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
         if(this.ttl == 0 || this.bitmap.y > this.§1t2184s0§)
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

