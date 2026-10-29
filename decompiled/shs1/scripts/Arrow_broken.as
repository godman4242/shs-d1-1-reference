package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol325")]
   public class Arrow_broken extends Projectile
   {
      
      public static var gravity:Number = 1;
      
      public static var typeCode:int = 6;
      
      public function Arrow_broken(param1:int, param2:int, param3:Number, param4:Number)
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
         this.rotation += 20;
         velY -= gravity;
         if(this.y > Player.groundY - 15)
         {
            if(Math.random() * 3 > 1)
            {
               flying = false;
               this.visible = false;
            }
         }
      }
   }
}

