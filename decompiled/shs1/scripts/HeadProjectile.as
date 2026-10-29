package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol482")]
   public class HeadProjectile extends Projectile
   {
      
      public static var gravity:Number = 1;
      
      public static var typeCode:int = 3;
      
      public var bp:*;
      
      public var rot:int = 20;
      
      public function HeadProjectile(param1:int, param2:int, param3:Number, param4:Number)
      {
         super();
         addFrameScript(0,frame1);
         this.x = param1;
         this.y = param2;
         this.velX = param3;
         this.velY = param4;
         ++StatsManager.instance.headshotCount;
      }
      
      internal function frame1() : *
      {
         stop();
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

