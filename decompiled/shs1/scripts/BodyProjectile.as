package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol490")]
   public class BodyProjectile extends Projectile
   {
      
      public static var gravity:Number = 0.8;
      
      public static var typeCode:int = 8;
      
      public var bp:*;
      
      public var rot:int = 20;
      
      public function BodyProjectile(param1:int, param2:int, param3:Number, param4:Number)
      {
         super();
         this.x = param1;
         this.y = param2;
         this.velX = param3;
         this.velY = param4;
         rot = 5;
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
         this.rotation = Math.atan(-velY / velX) * (180 / Math.PI);
         this.scaleX -= 0.01;
         this.scaleY -= 0.01;
         this.alpha -= 0.01;
         velY -= gravity;
         if(this.y > Player.groundY - 5 && velY < 0)
         {
            flying = false;
            visible = false;
         }
      }
   }
}

