package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol74")]
   public class Arrow_fire extends Projectile
   {
      
      public static var gravity:Number = 1;
      
      public static var typeCode:int = 7;
      
      public var flame:MovieClip;
      
      internal var burning:Boolean = false;
      
      public function Arrow_fire(param1:int, param2:int, param3:Number, param4:Number)
      {
         super();
         addFrameScript(0,frame1,1,frame2);
         this.x = param1;
         this.y = param2;
         this.velX = param3;
         this.velY = param4;
         ttl = 0;
      }
      
      override public function breakarrow() : *
      {
         var _loc1_:Projectile = null;
         flying = false;
         visible = false;
         _loc1_ = ProjectileManager.instance.createProjectile(Arrow_broken.typeCode,this.x,this.y,velX / 2,-5 + Math.random() * 10);
         _loc1_.rotation = this.rotation;
         _loc1_.scaleX = this.scaleX;
         SoundManager.instance.playDeflect();
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      override public function scrollRight(param1:int) : *
      {
         if(!flying)
         {
            x -= param1;
         }
      }
      
      override public function continueAnimation() : *
      {
         if(flame != null)
         {
            flame.play();
         }
         if(flame.flame != null)
         {
            flame.flame.play();
         }
      }
      
      override public function stopAnimation() : *
      {
         if(flame != null)
         {
            flame.stop();
         }
         if(flame.flame != null)
         {
            flame.flame.stop();
         }
      }
      
      internal function frame2() : *
      {
         stop();
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
            if(flame.currentFrame == 120)
            {
               burning = false;
            }
         }
         else
         {
            this.x += velX;
            this.y -= velY;
            this.rotation = Math.atan(-velY / velX) * (180 / Math.PI);
            velY -= gravity;
            if(this.hitTestObject(Player.instance))
            {
               if(!Player.instance.gotArrowHit(this))
               {
               }
            }
            if(this.y >= GameStage.groundY || Boolean(MovieClip(parent.parent).ground.hitTestPoint(x,y,true)))
            {
               flying = false;
               this.gotoAndStop(2);
               rotation = 0;
               burning = true;
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

