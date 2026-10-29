package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol996")]
   public class LeafParticle2 extends MovieClip
   {
      
      internal var ttl:int = -1;
      
      internal var maxttl:int = 0;
      
      internal var velX:Number = 0;
      
      internal var gravity:Number = 0;
      
      internal var velY:Number = 0;
      
      internal var rotateSpeed:int;
      
      internal var manager:LeafParticleSystem;
      
      internal var owner:MovieClip;
      
      internal var clockwise:Boolean = true;
      
      public function LeafParticle2(param1:MovieClip, param2:LeafParticleSystem)
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
         maxttl = param7;
         velX = manager.windSpeed / 2;
         velY = 0;
         this.ttl = param7;
         this.visible = true;
         this.scaleX = 0.6 + Math.random() * 4 / 10;
         this.scaleY = 0.6 + Math.random() * 4 / 10;
         clockwise = Math.random() * 2 < 1;
         rotateSpeed = Math.random() * 10;
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
         if(ttl == 0 || this.y > 400)
         {
            this.visible = false;
            manager.decreaseCount();
         }
         --ttl;
         this.x += velX;
         this.y += velY;
         if(clockwise)
         {
            this.rotation += rotateSpeed;
         }
         else
         {
            this.rotation -= rotateSpeed;
         }
         velY += gravity;
      }
      
      public function changeLeafSpeed(param1:int) : *
      {
         velX += param1 / 2;
      }
   }
}

