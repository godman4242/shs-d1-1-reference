package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol454")]
   public class Enemy_jetpackKatana extends Enemy
   {
      
      public static var typeCode:int = 12;
      
      internal var lastVelY:int = 0;
      
      internal var lastVelX:int = 0;
      
      internal var reloadCounter:int;
      
      internal const HURT_STATE:* = 8;
      
      internal var inVulCounter:int = -1;
      
      internal var maxReloadCounter:int = 2 * 24;
      
      public var lastAimAngle:int = 0;
      
      internal var flyspeedy:int = 0;
      
      internal var flyspeedx:int = 0;
      
      internal const OUTOFCONTROL_STATE:* = 7;
      
      public var enemy:MovieClip;
      
      public var exploded:Boolean = false;
      
      public var hasFire:Boolean = false;
      
      public function Enemy_jetpackKatana()
      {
         reloadCounter = maxReloadCounter;
         super();
         addFrameScript(0,frame1,1,frame2);
         speed = 2;
         AIcounterMax = 1 * 24;
         hp = 5;
         maxhp = 5;
         updateHPBar();
         moveAgain();
      }
      
      internal function doOutOfControl() : *
      {
         var _loc1_:int = 0;
         if(Boolean(Player.instance.isRedFreeze) && !exploded)
         {
            enemy.gotoAndStop(12);
            return;
         }
         if(Boolean(Player.instance.isRedFreeze) && exploded)
         {
            return;
         }
         _loc1_ = Math.random() * 4;
         if(_loc1_ == 0)
         {
            y = y - 1;
         }
         else if(_loc1_ == 1)
         {
            y += 1;
         }
         _loc1_ = Math.random() * 4;
         if(_loc1_ == 0)
         {
            x = x - 1;
         }
         else if(_loc1_ == 1)
         {
            x += 1;
         }
         x += velX;
         if(velX > 0)
         {
            rotation += 10;
         }
         else if(velX < 0)
         {
            rotation -= 10;
         }
         if(x < -50 || x > GameStage.stageWidth + 50)
         {
            if(enemy.currentFrame != 12)
            {
               enemy.gotoAndStop(12);
            }
            velX = 0;
            velY = 0;
         }
         if(Boss4.instance != null && this.x < Boss4.instance.x)
         {
            if(enemy.currentFrame != 12)
            {
               enemy.gotoAndStop(12);
            }
            velX = 0;
            velY = 0;
            Boss4.instance.hitByJetpack();
         }
      }
      
      public function getAimAngle(param1:MovieClip) : int
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         if(Boolean(Player.instance.isRedFreeze) || Boolean(Player.instance.powerOn))
         {
            return param1.rotation;
         }
         _loc2_ = this.x;
         _loc3_ = this.y;
         _loc4_ = Player.instance.x;
         _loc5_ = Player.instance.y;
         _loc6_ = 20;
         if(_loc2_ > _loc4_)
         {
            _loc6_ = -_loc6_;
         }
         _loc7_ = (_loc4_ - _loc2_) / _loc6_;
         _loc8_ = (_loc5_ - _loc3_ - 0.5 * Arrow.gravity * _loc7_ * _loc7_) / _loc7_;
         lastAimAngle = -Math.atan2(_loc8_,_loc6_) * 180 / Math.PI;
         if(_loc6_ < 0)
         {
            lastAimAngle = Math.atan2(_loc8_,_loc6_) * 180 / Math.PI - 180;
         }
         lastVelX = _loc6_;
         lastVelY = -_loc8_;
         if(lastAimAngle < -75 && actionState != OUTOFCONTROL_STATE && actionState != HURT_STATE)
         {
            moveAgain();
         }
         return lastAimAngle;
      }
      
      override public function moveAgain() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         destinationX = Math.random() * GameStage.stageWidth;
         destinationY = Math.random() * 200 + 50;
         _loc1_ = Math.abs(x - destinationX);
         _loc2_ = Math.abs(destinationY - y);
         _loc3_ = Math.sqrt(_loc1_ * _loc1_ + _loc2_ * _loc2_);
         if(_loc3_ == 0)
         {
            _loc3_ = 1;
         }
         flyspeedx = _loc1_ * 10 / _loc3_;
         flyspeedy = _loc2_ * 10 / _loc3_;
         if(flyspeedx == 0 && destinationX != x)
         {
            flyspeedx = 1;
         }
         if(flyspeedy == 0 && destinationY != y)
         {
            flyspeedy = 1;
         }
         faceDestination();
         actionState = MOVE_STATE;
      }
      
      internal function AI() : *
      {
         if(isDead())
         {
            return;
         }
         if(x < 0 || x > GameStage.stageWidth || y < 0 || y > 400)
         {
            moveAgain();
         }
         else if(actionState == IDLE_STATE && Math.random() * 2 < 1)
         {
            moveAgain();
         }
      }
      
      public function checkHitPlayer() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = Math.abs(x - Player.instance.x);
         _loc2_ = Player.instance.y - y;
         if(_loc2_ < 0)
         {
            return;
         }
         if(_loc2_ < 100 && _loc1_ < 100)
         {
            Player.instance.gotHit();
         }
         else if(_loc2_ >= 100 && _loc1_ < 150 && _loc1_ > 50)
         {
            Player.instance.gotHit();
         }
      }
      
      public function dieEnd() : *
      {
         dead = true;
         visible = false;
         actionState = DIE_STATE;
         deathAnimDone = true;
      }
      
      internal function hurtEnd() : *
      {
         if(hp <= 0)
         {
            actionState = OUTOFCONTROL_STATE;
            enemy.gotoAndStop(10);
            velX = 0;
            velY = 0;
         }
         else if(Math.random() * 3 < 2 && !dead)
         {
            moveAgain();
         }
         else if(!dead)
         {
            moveAgain();
         }
      }
      
      internal function frame1() : *
      {
         enemy.hpbar.scaleX = -1;
         stop();
      }
      
      internal function frame2() : *
      {
         enemy.hpbar.scaleX = 1;
         stop();
      }
      
      override public function die() : *
      {
         if(dead)
         {
            return;
         }
         if(GameStage.currentStage == 4 && x < -50)
         {
            dieEnd();
         }
         if(Player.instance.isRedFreeze)
         {
            dead = true;
            velX = 0;
            if(!headshot && enemy.currentFrame != 12)
            {
               enemy.gotoAndStop(12);
            }
            else if(headshot && enemy.currentFrame != 12)
            {
               enemy.gotoAndStop(12);
            }
         }
      }
      
      override public function continueAnimation() : *
      {
         if(disappearCounter > 0 && !deathAnimDone)
         {
            enemy.enemy.play();
            if(enemy.enemy.bloodspurt != null)
            {
               enemy.enemy.bloodspurt.play();
            }
            if(enemy.enemy.jetpack != null && enemy.enemy.jetpack.flame != null)
            {
               enemy.enemy.jetpack.flame.play();
               if(enemy.enemy.jetpack.flame.flame1 != null)
               {
                  enemy.enemy.jetpack.flame.flame1.play();
               }
               if(enemy.enemy.jetpack.flame.flame2 != null)
               {
                  enemy.enemy.jetpack.flame.flame2.play();
               }
            }
            if(enemy.enemy.aimtop != null && enemy.enemy.aimtop.flame != null)
            {
               enemy.enemy.aimtop.flame.play();
            }
            if(enemy.enemy.flame != null)
            {
               enemy.enemy.flame.play();
            }
         }
      }
      
      override public function update() : *
      {
         var _loc1_:int = 0;
         if(isDead() && actionState != OUTOFCONTROL_STATE)
         {
            doDisappear();
            return;
         }
         if(!Player.instance.isRedFreeze && !isDead())
         {
            _loc1_ = Math.random() * 4;
            if(_loc1_ == 0)
            {
               --y;
            }
            else if(_loc1_ == 1)
            {
               ++y;
            }
         }
         if(inVulCounter > 0)
         {
            --inVulCounter;
         }
         else if(inVulCounter == 0)
         {
            hurtEnd();
            inVulCounter = -1;
         }
         if(reloadCounter > 0)
         {
            --reloadCounter;
         }
         --AIcounter;
         if(!Player.instance.isRedFreeze && AIcounter <= 0 && hp > 0)
         {
            AIcounter = AIcounterMax;
            AI();
         }
         switch(actionState)
         {
            case IDLE_STATE:
               doIdle();
               immediateAI();
               break;
            case MOVE_STATE:
               doMove();
               immediateAI();
               break;
            case ATTACK_STATE:
            case DIE_STATE:
               break;
            case HURT_STATE:
               doHurt();
               break;
            case OUTOFCONTROL_STATE:
               doOutOfControl();
         }
      }
      
      public function explode() : *
      {
         dead = true;
         exploded = true;
         SoundManager.instance.playBoom();
      }
      
      internal function doMove() : *
      {
         var _loc1_:Boolean = false;
         if(!Player.instance.isRedFreeze)
         {
            facePlayer();
            if(currentFrame == 1 && x > destinationX && enemy.currentFrame != 3)
            {
               enemy.gotoAndStop(3);
            }
            else if(currentFrame == 1 && x <= destinationX && enemy.currentFrame != 2)
            {
               enemy.gotoAndStop(2);
            }
            else if(currentFrame == 2 && x > destinationX && enemy.currentFrame != 2)
            {
               enemy.gotoAndStop(2);
            }
            else if(currentFrame == 2 && x <= destinationX && enemy.currentFrame != 3)
            {
               enemy.gotoAndStop(3);
            }
            _loc1_ = false;
            if(this.x - destinationX >= flyspeedx * 2)
            {
               this.x -= flyspeedx;
               _loc1_ = true;
            }
            else if(this.x - destinationX <= -flyspeedx * 2)
            {
               this.x += flyspeedx;
               _loc1_ = true;
            }
            if(this.y - destinationY >= flyspeedy * 2)
            {
               this.y -= flyspeedy;
               _loc1_ = true;
            }
            else if(this.y - destinationY <= -flyspeedy * 2)
            {
               this.y += flyspeedy;
               _loc1_ = true;
            }
            if(!_loc1_)
            {
               moveAgain();
            }
         }
      }
      
      public function doIdle() : *
      {
         actionState = IDLE_STATE;
         facePlayer();
         if(enemy.currentFrame != 1)
         {
            enemy.gotoAndStop(1);
         }
      }
      
      public function shootArrow(param1:MovieClip) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:Projectile = null;
         _loc2_ = this.x;
         _loc3_ = this.y - 70;
         _loc4_ = lastVelX;
         if(hasFire)
         {
            _loc5_ = lastVelY - 5;
         }
         else
         {
            _loc5_ = lastVelY - 3;
         }
         if(Boolean(Player.instance.isFacingLeft()) && Player.instance.x < x)
         {
            _loc5_ += 1;
         }
         else if(!Player.instance.isFacingLeft() && Player.instance.x < x)
         {
            _loc5_--;
         }
         else if(Boolean(Player.instance.isFacingLeft()) && Player.instance.x > x)
         {
            _loc5_--;
         }
         else if(!Player.instance.isFacingLeft() && Player.instance.x > x)
         {
            _loc5_ += 1;
         }
         _loc5_ += Math.random() * 6 - 3;
         if(!hasFire)
         {
            _loc6_ = ProjectileManager.instance.createProjectile(Arrow.typeCode,_loc2_,_loc3_,_loc4_,_loc5_);
         }
         else
         {
            _loc6_ = ProjectileManager.instance.createProjectile(Arrow_fire.typeCode,_loc2_,_loc3_,_loc4_,_loc5_);
         }
         if(_loc4_ < 0)
         {
            _loc6_.scaleX = -1;
         }
      }
      
      internal function doHurt() : *
      {
         if(enemy.currentFrame != 5)
         {
            facePlayer();
            enemy.gotoAndStop(5);
         }
      }
      
      override public function scrollRight(param1:int) : *
      {
         if(GameStage.currentStage != 4)
         {
            x -= param1;
         }
      }
      
      internal function startAttack() : *
      {
         if(!Player.instance.isRedFreeze)
         {
            reloadCounter = maxReloadCounter;
            facePlayer();
            actionState = ATTACK_STATE;
            if(enemy.currentFrame != 4)
            {
               enemy.gotoAndStop(4);
            }
         }
      }
      
      override public function hit(param1:int, param2:Array, param3:Array) : *
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = undefined;
         _loc4_ = int(param2[param1]);
         _loc5_ = int(param3[param1]);
         if(actionState == OUTOFCONTROL_STATE && !exploded)
         {
            if(param2[param1] < x)
            {
               velX = 20;
               if(currentFrame != 1)
               {
                  gotoAndStop(1);
               }
               if(enemy.currentFrame != 11)
               {
                  enemy.gotoAndStop(11);
               }
            }
            else
            {
               velX = -20;
               if(currentFrame != 2)
               {
                  gotoAndStop(2);
               }
               if(enemy.currentFrame != 11)
               {
                  enemy.gotoAndStop(11);
               }
            }
         }
         else if(hp > 0 && (Boolean(actionState != HURT_STATE) || Boolean(Player.instance.powerOn)))
         {
            --hp;
            actionState = HURT_STATE;
            inVulCounter = 10;
            _loc6_ = new Point(_loc4_,_loc5_);
            if(enemy.enemy.head != null && Boolean(enemy.enemy.head.hitTestPoint(_loc6_.x,_loc6_.y)))
            {
               headshot = true;
               hp = 0;
               inVulCounter = 0;
               SoundManager.instance.playDie();
               return;
            }
         }
         SoundManager.instance.playHit();
      }
      
      internal function immediateAI() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(reloadCounter != 0)
         {
            return;
         }
         _loc1_ = Math.abs(x - Player.instance.x);
         _loc2_ = Player.instance.y - y;
         if(_loc2_ < 0)
         {
            return;
         }
         if(_loc2_ < 100 && _loc1_ < 100)
         {
            startAttack();
         }
         else if(_loc2_ >= 100 && _loc1_ < 150 && _loc1_ > 50)
         {
            startAttack();
         }
      }
      
      override public function stopAnimation() : *
      {
         if(enemy.enemy == null)
         {
            trace("enemy.enemy null");
            return;
         }
         if(enemy.currentFrame == 4 && (enemy.enemy.currentFrame == 15 || enemy.enemy.currentFrame == 16))
         {
            enemy.enemy.gotoAndStop(17);
         }
         if(Boolean(Player.instance.isRedFreeze) && (MovieClip(this).enemy.currentFrame == 10 || MovieClip(this).enemy.currentFrame == 11 || MovieClip(this).enemy.currentFrame == 12))
         {
            return;
         }
         if(!(Player.instance.isRedFreeze && exploded))
         {
            enemy.enemy.stop();
         }
         if(!Player.instance.isRedFreeze && enemy.enemy.bloodspurt != null)
         {
            enemy.enemy.bloodspurt.stop();
         }
         if(enemy.enemy.jetpack != null && enemy.enemy.jetpack.flame != null)
         {
            enemy.enemy.jetpack.flame.stop();
            if(enemy.enemy.jetpack.flame.flame1 != null)
            {
               enemy.enemy.jetpack.flame.flame1.stop();
            }
            if(enemy.enemy.jetpack.flame.flame2 != null)
            {
               enemy.enemy.jetpack.flame.flame2.stop();
            }
         }
         if(enemy.enemy.aimtop != null && enemy.enemy.aimtop.flame != null)
         {
            enemy.enemy.aimtop.flame.stop();
         }
         if(enemy.enemy.flame != null)
         {
            enemy.enemy.flame.stop();
         }
      }
   }
}

