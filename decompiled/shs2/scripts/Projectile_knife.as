package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol41")]
   public class Projectile_knife extends Projectile
   {
      
      public static var gravity:Number = 1;
      
      public static var typeCode:int = 9;
      
      internal var rot:int;
      
      public function Projectile_knife(param1:int, param2:int, param3:Number, param4:Number)
      {
         super();
         this.x = param1;
         this.y = param2;
         this.velX = param3;
         this.velY = param4;
         if(param3 < 0)
         {
            rot = -40;
         }
         else
         {
            rot = 40;
         }
      }
      
      override public function breakarrow() : *
      {
         velY += 20;
         rot *= 2;
         SoundManager.instance.playDeflect();
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
         if(this.hitTestObject(Player.instance))
         {
            if(Player.instance.gotHit())
            {
               this.visible = false;
               this.flying = false;
            }
         }
         if(this.x < -100 || this.x > GameStage.stageWidth + 100 || this.y < -100 || this.y > 500)
         {
            flying = false;
            visible = false;
         }
      }
   }
}

