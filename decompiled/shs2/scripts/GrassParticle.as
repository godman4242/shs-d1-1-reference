package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1431")]
   public class GrassParticle extends MovieClip
   {
      
      internal var ttl:int = -1;
      
      internal var maxttl:int = 0;
      
      internal var changeCounter:int = 6;
      
      internal var velX:Number = 0;
      
      internal var gravity:Number = 0;
      
      internal var velY:Number = 0;
      
      internal var rotateSpeed:int;
      
      internal var manager:GrassParticleSystem;
      
      internal var owner:MovieClip;
      
      internal var clockwise:Boolean = true;
      
      public function GrassParticle(param1:MovieClip, param2:GrassParticleSystem)
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
         maxttl = param7;
         velX = manager.windSpeed;
         velY = 0;
         this.ttl = param7;
         this.visible = true;
         this.scaleX = 0.6 + Math.random() * 4 / 10;
         this.scaleY = 0.6 + Math.random() * 4 / 10;
         clockwise = false;
         rotateSpeed = 2 + Math.random() * 10;
      }
      
      public function isDead() : *
      {
         return ttl < 0;
      }
      
      public function update() : *
      {
         var _loc1_:int = 0;
         if(ttl < 0)
         {
            return;
         }
         if(ttl == 0 || this.x < -50)
         {
            ttl = -1;
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
         --changeCounter;
         if(changeCounter == 0)
         {
            changeCounter = 6;
            _loc1_ = Math.random() * 3;
            if(_loc1_ == 0)
            {
               velY = 1;
            }
            else
            {
               velY = -1;
            }
         }
      }
      
      public function changeLeafSpeed(param1:int) : *
      {
         velX += param1;
      }
   }
}

