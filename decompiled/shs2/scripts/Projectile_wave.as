package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol66")]
   public class Projectile_wave extends Projectile
   {
      
      public static var gravity:Number = 0;
      
      public static var typeCode:int = 8;
      
      public var grass:MovieClip;
      
      public var wave:MovieClip;
      
      public function Projectile_wave(param1:int, param2:int, param3:Number, param4:Number)
      {
         super();
         this.x = param1;
         this.y = param2;
         this.velX = param3;
         this.velY = param4;
         ttl = 0;
      }
      
      override public function continueAnimation() : *
      {
         this.play();
         grass.play();
         wave.play();
      }
      
      override public function stopAnimation() : *
      {
         this.stop();
         grass.stop();
         wave.stop();
      }
      
      override public function update() : *
      {
         if(!flying)
         {
            doDissappear();
            return;
         }
         this.x += velX;
         if(this.hitTestObject(Player.instance))
         {
            if(Player.instance.gotHit())
            {
               Player.instance.gotLaunched();
            }
         }
         if(x < -50 || x > GameStage.stageWidth + 50)
         {
            flying = false;
            this.visible = false;
         }
      }
   }
}

