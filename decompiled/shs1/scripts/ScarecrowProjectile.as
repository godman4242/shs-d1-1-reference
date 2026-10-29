package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol486")]
   public class ScarecrowProjectile extends Projectile
   {
      
      public static var gravity:Number = 2;
      
      public static var typeCode:int = 100;
      
      public var bp:*;
      
      public var rot:int = 5;
      
      public function ScarecrowProjectile(param1:int, param2:int, param3:Number, param4:Number)
      {
         super();
         addFrameScript(0,frame1);
         this.x = param1;
         this.y = param2;
         this.velX = param3;
         this.velY = param4;
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
         if(this.y > Player.groundY - 10)
         {
            flying = false;
         }
      }
   }
}

