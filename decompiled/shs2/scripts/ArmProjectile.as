package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol566")]
   public class ArmProjectile extends Projectile
   {
      
      public static var gravity:Number = 1;
      
      public static var typeCode:int = 4;
      
      public var bp:*;
      
      public var rot:int = 20;
      
      public function ArmProjectile(param1:int, param2:int, param3:Number, param4:Number)
      {
         super();
         this.x = param1;
         this.y = param2;
         this.velX = param3;
         this.velY = param4;
         ttlMax = 10 * 24;
         ttl = ttlMax;
      }
      
      override public function update() : *
      {
         if(!flying)
         {
            doDissappear();
            return;
         }
         this.x += velX;
         this.y -= velY;
         this.rotation += rot;
         velY -= gravity;
         if(this.y > GameStage.groundY && velY < 0)
         {
            if(velY > -5)
            {
               flying = false;
            }
            velY = -velY / 3;
            velX = velX * 3 / 4;
            rot /= 2;
         }
      }
   }
}

