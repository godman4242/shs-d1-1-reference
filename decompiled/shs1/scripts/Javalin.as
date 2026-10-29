package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol332")]
   public class Javalin extends Projectile
   {
      
      public static var gravity:Number = 1;
      
      public static var typeCode:int = 2;
      
      public var tip:MovieClip;
      
      public function Javalin(param1:int, param2:int, param3:Number, param4:Number)
      {
         super();
         addFrameScript(0,frame1,1,frame2);
         this.x = param1;
         this.y = param2;
         this.velX = param3;
         this.velY = param4;
         ttlMax = 2 * 24;
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
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
         this.rotation = Math.atan(-velY / velX) * (180 / Math.PI);
         velY -= gravity;
         if(this.hitTestObject(MovieClip(parent.parent).player))
         {
            MovieClip(parent.parent).player.gotHit();
         }
         if(this.y > Player.groundY - 30)
         {
            if(Math.random() * 3 > 1)
            {
               flying = false;
               this.gotoAndStop(2);
            }
         }
      }
   }
}

