package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol2021")]
   public class VegetableProjectile extends Projectile
   {
      
      internal var rotationValue:int;
      
      public function VegetableProjectile()
      {
         super();
      }
      
      public function VegetationProjectile() : *
      {
      }
      
      public function initVegetable(velX:int, velY:int, type:int) : *
      {
         visible = true;
         flying = true;
         this.velX = velX;
         this.velY = velY;
         this.rotationValue = Math.random() * 30 + 10;
         if(velX < 0)
         {
            this.rotationValue = -this.rotationValue;
         }
         ttl = ttlMax;
         gotoAndStop(type);
      }
      
      override public function update() : *
      {
         if(!flying)
         {
            return;
         }
         x += velX;
         y += velY;
         rotation += this.rotationValue;
         velY += GRAVITY;
         if(this.y > StageManager.getGroundY() && velY > 0)
         {
            if(velY < 5)
            {
               this.removeProjectile();
            }
            else
            {
               velY = -velY / 3;
               velX = velX * 3 / 4;
               this.rotationValue /= 2;
            }
         }
      }
      
      override internal function removeProjectile() : *
      {
         flying = false;
         visible = false;
         var childmax:* = numChildren;
         for(var i:int = 0; i < childmax; i++)
         {
            removeChildAt(0);
         }
         ProjectileManager.unregister(this);
         StageManager.getGameStageCanvas().removeChild(this);
      }
   }
}

