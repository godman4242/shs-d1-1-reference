package
{
   import flash.display.MovieClip;
   
   public class Enemy extends MovieClip
   {
      
      internal var destinationX:Number = 0;
      
      internal var destinationY:Number = 0;
      
      public var actionState:int = 1;
      
      internal var downedCounter:int = 0;
      
      internal const IDLE_STATE:* = 0;
      
      internal var velX:int = 0;
      
      internal var velY:int = 0;
      
      internal var gravity:int = 1;
      
      internal var speed:int = 5;
      
      internal var dead:Boolean = false;
      
      internal const MOVE_STATE:* = 1;
      
      internal var frozen:Boolean = false;
      
      public var readyToJump:Boolean = false;
      
      internal var AIcounter:int = 0;
      
      internal var disappearCounter:int;
      
      public var headshot:Boolean = false;
      
      public var enemyType:int = 0;
      
      internal var terminalVelY:int = 20;
      
      public var hp:int = 1;
      
      internal const JUMP_STATE:* = 6;
      
      public var downSlashDeath:Boolean = false;
      
      public var removeMe:Boolean = false;
      
      public var gotHit:Boolean = false;
      
      internal const DOWNED_STATE:* = 5;
      
      internal const LAUNCHED_STATE:* = 4;
      
      internal var maxhp:int = 1;
      
      internal const ATTACK_STATE:* = 2;
      
      public var deathAnimDone:Boolean = false;
      
      internal const DIE_STATE:* = 3;
      
      internal var disappearCounterMax:int = 10 * 24;
      
      internal var AIcounterMax:int = 30;
      
      public function Enemy()
      {
         actionState = MOVE_STATE;
         disappearCounter = disappearCounterMax;
         super();
      }
      
      public function moveAgain() : *
      {
         if(this.currentFrame == 1)
         {
            destinationX += 100;
         }
         else
         {
            destinationX -= 100;
         }
         faceDestination();
         actionState = MOVE_STATE;
         speed = Math.random() * 2 + 2;
      }
      
      public function checkEnemyWeaponHitPlayer(param1:MovieClip) : Boolean
      {
         if(!isNearPlayer())
         {
            return false;
         }
         return Player.instance.checkEnemyWeaponHitPlayer(param1);
      }
      
      public function verticalMovement() : *
      {
         var _loc1_:* = undefined;
         y += velY;
         velY += gravity;
         if(y >= GameStage.groundY)
         {
            y = GameStage.groundY;
            velY = 0;
            actionState = MOVE_STATE;
         }
         else if(Boolean(MovieClip(root).ground.hitTestPoint(x,y,true)) && velY > 0)
         {
            _loc1_ = this.y;
            while(_loc1_ > GameStage.groundY || Boolean(MovieClip(root).ground.hitTestPoint(this.x,_loc1_,true)))
            {
               _loc1_--;
            }
            y = _loc1_;
            velY = 0;
            actionState = MOVE_STATE;
         }
      }
      
      public function die() : *
      {
      }
      
      public function checkDownedDrop() : *
      {
         var _loc1_:int = 0;
         _loc1_ = -25;
         if(currentFrame == 2)
         {
            _loc1_ = 25;
         }
         if(y < GameStage.groundY && !MovieClip(root).ground.hitTestPoint(this.x + _loc1_,y + 2,true))
         {
            x += _loc1_;
            MovieClip(this).enemy.gotoAndStop(10);
            actionState = LAUNCHED_STATE;
         }
      }
      
      public function freeze() : *
      {
         stopAnimation();
         frozen = true;
      }
      
      public function continueAnimation() : *
      {
         if(disappearCounter > 0 && !deathAnimDone)
         {
            if(!(MovieClip(this).enemy.currentFrame == 11 && MovieClip(this).enemy.enemy.currentFrame == 3))
            {
               if(!(MovieClip(this).enemy.currentFrame == 12 && (MovieClip(this).enemy.enemy.currentFrame == 13 || MovieClip(this).enemy.enemy.currentFrame == 14)))
               {
                  if(!(MovieClip(this).enemy.currentFrame == 20 && MovieClip(this).enemy.enemy.currentFrame == 5))
                  {
                     MovieClip(this).enemy.enemy.play();
                  }
               }
            }
            if(MovieClip(this).enemy.enemy.bloodspurt != null)
            {
               MovieClip(this).enemy.enemy.bloodspurt.play();
            }
            if(MovieClip(this).enemy.enemy.bloodspurt2 != null)
            {
               MovieClip(this).enemy.enemy.bloodspurt2.play();
            }
         }
      }
      
      public function isDead() : Boolean
      {
         return dead;
      }
      
      public function checkFallBottom() : *
      {
         var _loc1_:MovieClip = null;
         var _loc2_:* = undefined;
         if(y > 600 && hp > 0)
         {
            if(actionState == LAUNCHED_STATE || actionState == DOWNED_STATE)
            {
               hp = 0;
               die();
               if(Player.instance.hp > 0 && GameStage.currentStage == 2)
               {
                  MountainStage.instance.notifyNoEnemiesLeft();
               }
            }
            else
            {
               y = -10;
               _loc1_ = GameStage.getStage().getClosestPlatform();
               if(_loc1_ != null)
               {
                  x = _loc1_.x;
               }
               velY = 1;
               velX = 0;
            }
         }
         else if(y < 10 && hp > 0 && actionState != JUMP_STATE && actionState != LAUNCHED_STATE)
         {
            _loc2_ = this.y + 2;
            while(MovieClip(root).ground.hitTestPoint(this.x,_loc2_,true))
            {
               _loc2_ += 2;
            }
            y = _loc2_;
            velY = 0;
            velX = 0;
            actionState = JUMP_STATE;
            readyToJump = true;
         }
      }
      
      public function updateHPBar() : *
      {
         if(MovieClip(this).enemy != null && MovieClip(this).enemy.hpbar != null)
         {
            MovieClip(this).enemy.hpbar.green.scaleX = hp / maxhp;
            if(hp <= 0)
            {
               MovieClip(this).enemy.hpbar.visible = false;
            }
         }
      }
      
      public function update() : *
      {
      }
      
      public function getHP() : int
      {
         return hp;
      }
      
      public function showHPBar() : *
      {
         if(MovieClip(this).enemy != null && MovieClip(this).enemy.hpbar != null)
         {
            if(hp > 0)
            {
               MovieClip(this).enemy.hpbar.visible = true;
            }
         }
      }
      
      internal function randomDeathAnim() : *
      {
         var _loc1_:int = 0;
         if(Player.instance.isRedFreeze)
         {
            _loc1_ = Math.random() * 5;
            if(_loc1_ == 0)
            {
               MovieClip(this).enemy.gotoAndStop(7);
            }
            else if(_loc1_ == 1)
            {
               MovieClip(this).enemy.gotoAndStop(5);
            }
            else
            {
               MovieClip(this).enemy.gotoAndStop(4);
            }
         }
         else if(Math.random() * 8 > 1)
         {
            MovieClip(this).enemy.gotoAndStop(4);
         }
         else if(Math.random() * 2 > 1)
         {
            MovieClip(this).enemy.gotoAndStop(5);
         }
         else
         {
            MovieClip(this).enemy.gotoAndStop(7);
         }
      }
      
      public function doDowned() : *
      {
      }
      
      public function scrollRight(param1:int) : *
      {
         x -= param1;
      }
      
      public function doDisappear() : *
      {
         if(removeMe || disappearCounter < 0 || !deathAnimDone)
         {
            return;
         }
         --disappearCounter;
         if(disappearCounter < 24)
         {
            this.alpha = disappearCounter / 24;
         }
         if(disappearCounter == 0)
         {
            EnemyManager.instance.getGameStage().removeChild(this);
            disappearCounter = -1;
            removeMe = true;
         }
      }
      
      public function faceDestination() : *
      {
         if(destinationX < this.x)
         {
            if(this.currentFrame != 2)
            {
               this.gotoAndStop(2);
            }
         }
         else if(this.currentFrame != 1)
         {
            this.gotoAndStop(1);
         }
      }
      
      public function hit(param1:int, param2:Array, param3:Array) : *
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc4_ = int(param2[param1]);
         _loc5_ = int(param3[param1]);
         if(hp > 0)
         {
            --hp;
         }
      }
      
      public function facePlayer() : *
      {
         if(Player.instance.x < this.x)
         {
            if(this.currentFrame != 2)
            {
               this.gotoAndStop(2);
            }
         }
         else if(this.currentFrame != 1)
         {
            this.gotoAndStop(1);
         }
      }
      
      public function downSlashHit() : *
      {
         hp -= 4;
         if(hp <= 0)
         {
            downSlashDeath = true;
         }
      }
      
      public function stopAnimation() : *
      {
         if(MovieClip(this).enemy.enemy == null)
         {
            trace("enemy.enemy null");
            return;
         }
         if(Boolean(Player.instance.isRedFreeze) && (MovieClip(this).enemy.currentFrame == 4 || MovieClip(this).enemy.currentFrame == 5 || MovieClip(this).enemy.currentFrame == 6 || MovieClip(this).enemy.currentFrame == 13 || MovieClip(this).enemy.currentFrame == 14))
         {
            return;
         }
         MovieClip(this).enemy.enemy.stop();
         if(!Player.instance.isRedFreeze && MovieClip(this).enemy.enemy.bloodspurt != null)
         {
            MovieClip(this).enemy.enemy.bloodspurt.stop();
         }
         if(!Player.instance.isRedFreeze && MovieClip(this).enemy.enemy.bloodspurt2 != null)
         {
            MovieClip(this).enemy.enemy.bloodspurt2.stop();
         }
      }
      
      public function setPosition(param1:int, param2:int) : *
      {
         this.x = param1;
         this.y = param2;
         destinationX = param1;
      }
      
      public function setDead(param1:Boolean) : *
      {
         dead = param1;
      }
      
      public function hideHPBar() : *
      {
         if(MovieClip(this).enemy != null && MovieClip(this).enemy.hpbar != null)
         {
            MovieClip(this).enemy.hpbar.visible = false;
         }
      }
      
      public function isNearPlayer() : Boolean
      {
         return Math.abs(Player.instance.x - this.x) < 100;
      }
   }
}

