package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol478")]
   public class BloodParticle extends MovieClip
   {
      
      internal var ttl:int = -1;
      
      internal var maxttl:int = 0;
      
      internal var velX:Number = 0;
      
      internal var gravity:Number = 0;
      
      internal var velY:Number = 0;
      
      internal var manager:BloodParticleSystem;
      
      internal var owner:MovieClip;
      
      public function BloodParticle(param1:MovieClip, param2:BloodParticleSystem)
      {
         super();
         this.owner = param1;
         this.manager = param2;
         this.visible = false;
      }
      
      public function init(param1:int, param2:int, param3:Number, param4:int, param5:Number, param6:int, param7:int, param8:Number) : *
      {
         this.x = param1;
         this.y = param2;
         this.gravity = param8;
         param3 = param3 + Math.random() * 2 * param4 - param4;
         param5 = param5 + Math.random() * 2 * param6 - param6;
         maxttl = param7;
         velX = Math.sin(param3 * (Math.PI / 180)) * param5;
         velY = Math.cos(param3 * (Math.PI / 180)) * param5 * -1;
         this.ttl = param7;
         this.visible = true;
         this.scaleX = 0.6 + Math.random() * 4 / 10;
         this.scaleY = 0.6 + Math.random() * 4 / 10;
      }
      
      public function isDead() : *
      {
         return ttl < 0;
      }
      
      public function update() : *
      {
         if(ttl < 0)
         {
            return;
         }
         if(ttl == 0)
         {
            this.visible = false;
            manager.decreaseCount();
         }
         --ttl;
         this.x += velX;
         this.y += velY;
         velY += gravity;
         this.alpha = ttl / maxttl + 0.1;
      }
   }
}

