package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol562")]
   public class HatProjectile extends Projectile
   {
      
      public static var gravity:Number = 1;
      
      public static var typeCode:int = 5;
      
      internal var counter:* = 10;
      
      public var bp:*;
      
      public var rot:int = 20;
      
      public function HatProjectile(param1:int, param2:int, param3:Number, param4:Number)
      {
         super();
         this.x = param1;
         this.y = param2;
         this.velX = param3;
         this.velY = param4;
      }
      
      override public function update() : *
      {
         if(!flying)
         {
            return;
         }
         this.x += velX;
         this.y -= velY;
         this.rotation += rot;
         velY -= gravity;
         if(this.y > GameStage.groundY - 5 && velY < 0)
         {
            if(velY > -5)
            {
               flying = false;
               if(Player.instance.hp <= 0)
               {
                  Player.instance.player.player.bp.setActive(false);
               }
            }
            velY = -velY / 3;
            velX = velX * 3 / 4;
            rot /= 2;
            if(Player.instance.hp <= 0)
            {
               MovieClip(EnemyManager.instance.getGameStage().parent).stage.frameRate = 24;
            }
         }
      }
   }
}

