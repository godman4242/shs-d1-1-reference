package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol853")]
   public class BallProjectile extends Projectile
   {
      
      public static var gravity:Number = 1;
      
      public static var typeCode:int = 9;
      
      public var bp:*;
      
      public var rot:int = 20;
      
      public function BallProjectile(param1:int, param2:int, param3:Number, param4:Number)
      {
         super();
         this.x = param1;
         this.y = param2;
         this.velX = param3;
         this.velY = param4;
         ttl = 24;
      }
      
      override public function breakarrow() : *
      {
         velX = -velX;
         velY = -velY;
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
         this.rotation -= rot;
         velY -= gravity;
         if(this.y <= 0 && velY > 5)
         {
            Enemy_catapult.instance.destroy();
            flying = false;
            visible = false;
         }
         if(this.hitTestObject(MovieClip(parent.parent).player))
         {
            if(!MovieClip(parent.parent).player.gotBallHit(this))
            {
            }
         }
         if(this.y > Player.groundY - 5 && velY < 0)
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

