package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol27")]
   public class Projectile_rocket_homing extends Projectile
   {
      
      public static var gravity:Number = 0;
      
      public static var typeCode:int = 12;
      
      internal var trackcounter:int = 2;
      
      internal var strafingRange:int = 100;
      
      internal var turningAngle:int = 10;
      
      internal var speed:int = 5;
      
      internal var lastMovt:int = 0;
      
      internal var explode:Boolean = false;
      
      internal var modecounter:int = 0;
      
      public function Projectile_rocket_homing(param1:int, param2:int, param3:Number, param4:Number)
      {
         super();
         addFrameScript(4,frame5,9,frame10,12,frame13,16,frame17);
         this.x = param1;
         this.y = param2;
         this.velX = 0;
         this.velY = param4;
         ttl = 0;
         rotation = Math.atan2(param4,param3) * 180 / Math.PI + 90;
      }
      
      internal function smallAngle(param1:Number) : *
      {
         if(param1 < 0)
         {
            while(param1 < 0)
            {
               param1 += 360;
            }
         }
         else if(param1 > 360)
         {
            while(param1 > 360)
            {
               param1 -= 360;
            }
         }
         return param1;
      }
      
      internal function turnLeft() : *
      {
         rotation = smallAngle(rotation - turningAngle);
         lastMovt = 1;
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
      
      internal function turnToFace() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         _loc1_ = Player.instance.x - 50 - x;
         _loc2_ = Player.instance.y - y;
         _loc3_ = Math.atan2(_loc2_,_loc1_) * 180 / Math.PI + 90;
         _loc4_ = _loc1_ * _loc1_ + _loc2_ * _loc2_;
         _loc5_ = smallAngle(rotation);
         if(Math.abs(_loc3_ - _loc5_) > turningAngle && _loc4_ > strafingRange * strafingRange)
         {
            if(_loc3_ > _loc5_)
            {
               if(lastMovt == 0 || lastMovt == 2)
               {
                  turnRight();
               }
               else
               {
                  turnLeft();
               }
            }
            else if(_loc3_ < _loc5_)
            {
               if(lastMovt == 0 || lastMovt == 1)
               {
                  turnLeft();
               }
               else
               {
                  turnRight();
               }
            }
            else
            {
               lastMovt = 0;
            }
         }
         else if(Math.abs(_loc3_ - _loc5_) < turningAngle)
         {
            rotation = _loc3_;
         }
      }
      
      override public function scrollRight(param1:int) : *
      {
      }
      
      internal function frame5() : *
      {
         gotoAndPlay(1);
      }
      
      override public function continueAnimation() : *
      {
         this.play();
      }
      
      internal function turnRight() : *
      {
         rotation = smallAngle(rotation + turningAngle);
         lastMovt = 2;
      }
      
      override public function stopAnimation() : *
      {
         this.stop();
      }
      
      internal function moveForward() : *
      {
         x += Math.sin(smallAngle(rotation) * (Math.PI / 180)) * speed;
         y += Math.cos(smallAngle(rotation) * (Math.PI / 180)) * speed * -1;
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
         ++modecounter;
         if(modecounter > 12 && modecounter < 12 + 10 * 24)
         {
            if(trackcounter > 0)
            {
               --trackcounter;
            }
            else
            {
               turnToFace();
               trackcounter = 2;
            }
         }
         if(flying)
         {
            moveForward();
            if(this.hitTestObject(Player.instance) && Boolean(Player.instance.gotHit()))
            {
               gotoAndPlay(10);
               this.flying = false;
               SoundManager.instance.playBoom();
            }
            if(modecounter > 12 + 10 * 24 && (Boolean(this.y >= GameStage.groundY) || Boolean(MovieClip(parent.parent).ground.hitTestPoint(x,y,true))))
            {
               gotoAndPlay(10);
               this.flying = false;
               SoundManager.instance.playBoom();
            }
            if(modecounter > 12 + 10 * 24 && (this.x < -100 || GameStage.currentStage != 4 && this.x > GameStage.stageWidth + 100 || GameStage.currentStage == 4 && this.x > GameStage.stageWidth + 400 || this.y < -100 || this.y > 500))
            {
               flying = false;
               visible = false;
            }
         }
      }
      
      internal function frame13() : *
      {
         stop();
         visible = false;
      }
   }
}

