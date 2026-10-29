package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol39")]
   public class Projectile_rocket_down extends Projectile
   {
      
      public static var gravity:Number = 0;
      
      public static var typeCode:int = 11;
      
      internal var explode:Boolean = false;
      
      public function Projectile_rocket_down(param1:int, param2:int, param3:Number, param4:Number)
      {
         super();
         addFrameScript(4,frame5,9,frame10,16,frame17);
         this.x = param1;
         this.y = param2;
         this.velX = 0;
         this.velY = param4;
         ttl = 0;
      }
      
      internal function frame10() : *
      {
         rotation = 0;
      }
      
      override public function breakarrow() : *
      {
         flying = false;
         explode = true;
         SoundManager.instance.playBoom();
      }
      
      internal function frame17() : *
      {
         stop();
         visible = false;
      }
      
      internal function frame5() : *
      {
         gotoAndPlay(1);
      }
      
      override public function scrollRight(param1:int) : *
      {
      }
      
      override public function continueAnimation() : *
      {
         this.play();
      }
      
      override public function stopAnimation() : *
      {
         this.stop();
      }
      
      override public function update() : *
      {
         if(!flying && !visible)
         {
            doDissappear();
            return;
         }
         if(explode)
         {
            gotoAndPlay(10);
            explode = false;
         }
         if(flying)
         {
            this.x += velX;
            this.y += velY;
            if(this.hitTestObject(Player.instance))
            {
               if(Player.instance.gotHit())
               {
                  this.flying = false;
                  gotoAndPlay(10);
                  SoundManager.instance.playBoom();
               }
            }
            if(y > 500)
            {
               flying = false;
               this.visible = false;
            }
         }
      }
   }
}

