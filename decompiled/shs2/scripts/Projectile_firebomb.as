package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol13")]
   public class Projectile_firebomb extends Projectile
   {
      
      public static var gravity:Number = 1;
      
      public static var typeCode:int = 10;
      
      public var flame:MovieClip;
      
      internal var burning:Boolean = false;
      
      public var rot:int = 20;
      
      public function Projectile_firebomb(param1:int, param2:int, param3:Number, param4:Number)
      {
         super();
         addFrameScript(2,frame3,9,frame10);
         this.x = param1;
         this.y = param2;
         this.velX = param3;
         if(this.velX < 0)
         {
            rot = -20;
         }
         this.velY = param4;
         ttl = 0;
      }
      
      internal function frame10() : *
      {
         stop();
      }
      
      override public function breakarrow() : *
      {
         if(velX > 0)
         {
            velX += 7;
         }
         else
         {
            velX -= 7;
         }
      }
      
      override public function continueAnimation() : *
      {
         if(currentFrame != 10)
         {
            play();
         }
         else if(flame != null)
         {
            flame.play();
            if(flame.flame != null)
            {
               flame.flame.play();
            }
         }
      }
      
      internal function frame3() : *
      {
         gotoAndPlay(1);
      }
      
      override public function stopAnimation() : *
      {
         if(currentFrame != 10)
         {
            gotoAndStop(1);
         }
         else if(flame != null)
         {
            flame.stop();
            if(flame.flame != null)
            {
               flame.flame.stop();
            }
         }
      }
      
      override public function update() : *
      {
         if(!flying && !burning)
         {
            doDissappear();
            return;
         }
         if(burning)
         {
            if(this.hitTestObject(Player.instance))
            {
               Player.instance.gotHit();
            }
            if(flame != null && flame.currentFrame == 120)
            {
               burning = false;
               visible = false;
            }
         }
         else
         {
            this.x += velX;
            this.y -= velY;
            this.rotation += rot;
            velY -= gravity;
            if(velY > 15)
            {
               velY = 15;
            }
            if(this.y > GameStage.groundY - 5 && velY < 0 || Boolean(velY < -2) && Boolean(MovieClip(parent.parent).ground.hitTestPoint(x,y,true)))
            {
               if(velY > -5)
               {
                  flying = false;
                  gotoAndStop(10);
                  rotation = 0;
                  burning = true;
               }
               velY = -velY / 3;
               velX = velX * 3 / 4;
               rot /= 4;
            }
         }
         if(this.x < -100 || GameStage.currentStage != 4 && this.x > GameStage.stageWidth + 100 || this.y < -100 || this.y > 500)
         {
            flying = false;
            visible = false;
         }
      }
   }
}

