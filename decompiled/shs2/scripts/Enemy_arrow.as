package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol560")]
   public class Enemy_arrow extends Enemy
   {
      
      public static var typeCode:int = 2;
      
      internal var lastVelY:int = 0;
      
      internal var lastVelX:int = 0;
      
      internal var reloadCounter:int;
      
      internal var maxReloadCounter:int = 4 * 24;
      
      public var lastAimAngle:int = 0;
      
      public var enemy:MovieClip;
      
      public function Enemy_arrow()
      {
         reloadCounter = maxReloadCounter;
         super();
         addFrameScript(0,frame1,1,frame2);
         speed = 2;
         AIcounterMax = 2 * 24;
         hp = 1;
         actionState = MOVE_STATE;
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
         var _loc9_:* = undefined;
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
         if(lastAimAngle < -50 && Player.instance.y - y > 40 && actionState != LAUNCHED_STATE && actionState != DOWNED_STATE)
         {
            _loc9_ = this.y + 2;
            while(MovieClip(root).ground.hitTestPoint(this.x,_loc9_,true))
            {
               _loc9_ += 2;
            }
            y = _loc9_;
            velY = 0;
            if(currentFrame == 1)
            {
               velX = 1;
            }
            else
            {
               velX = -1;
            }
            actionState = JUMP_STATE;
            readyToJump = true;
         }
         return lastAimAngle;
      }
      
      internal function AI() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         if(actionState == IDLE_STATE || actionState == MOVE_STATE || actionState == ATTACK_STATE)
         {
            _loc1_ = Player.instance.x;
            if(MovieClip(root).ground.hitTestPoint(x,y + 5,true))
            {
               actionState = ATTACK_STATE;
               if(enemy.currentFrame != 3)
               {
                  enemy.gotoAndStop(3);
               }
            }
            else if(Math.random() * 25 < 1 || this.x < 30 || this.x > GameStage.stageWidth - 30 || Math.abs(_loc1_ - x) < 50)
            {
               actionState = MOVE_STATE;
               if(Math.abs(this.x - _loc1_) < 50)
               {
                  if(this.x - _loc1_ > 0)
                  {
                     destinationX = this.x + Math.random() * 100;
                  }
                  else
                  {
                     destinationX = this.x - Math.random() * 100;
                  }
               }
               if(destinationX < 0)
               {
                  destinationX = Math.random() * 150;
               }
               else if(destinationX > GameStage.stageWidth)
               {
                  destinationX = GameStage.stageWidth - Math.random() * 150;
               }
               faceDestination();
            }
            else
            {
               actionState = ATTACK_STATE;
               if(enemy.currentFrame != 3)
               {
                  enemy.gotoAndStop(3);
               }
            }
         }
         if(actionState != LAUNCHED_STATE && y < GameStage.groundY - 10 && !MovieClip(root).ground.hitTestPoint(x,y + 3,true))
         {
            _loc2_ = this.y + 3;
            while(MovieClip(root).ground.hitTestPoint(this.x,_loc2_,true))
            {
               _loc2_ += 2;
            }
            y = _loc2_;
            velY = 0;
            if(currentFrame == 1)
            {
               velX = 1;
            }
            else
            {
               velX = -1;
            }
            actionState = JUMP_STATE;
            readyToJump = true;
         }
         checkFallBottom();
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         stop();
      }
      
      override public function die() : *
      {
         if(dead)
         {
            return;
         }
         SoundManager.instance.playDie();
         dead = true;
         if(actionState == LAUNCHED_STATE || !downSlashDeath && actionState == DOWNED_STATE)
         {
            return;
         }
         if(downSlashDeath)
         {
            enemy.gotoAndStop(14);
         }
         else if(headshot)
         {
            enemy.gotoAndStop(6);
         }
         else
         {
            if(Math.random() * 2 < 1)
            {
               gotoAndStop(1);
            }
            else
            {
               gotoAndStop(2);
            }
            randomDeathAnim();
         }
      }
      
      override public function freeze() : *
      {
         this.enemy.enemy.stop();
         frozen = true;
      }
      
      internal function doAttack() : *
      {
         if(!Player.instance.isRedFreeze)
         {
            facePlayer();
            if(enemy.currentFrame != 3)
            {
               enemy.gotoAndStop(3);
            }
         }
      }
      
      override public function update() : *
      {
         if(isDead() && actionState != LAUNCHED_STATE && actionState != DOWNED_STATE)
         {
            doDisappear();
            return;
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
               break;
            case MOVE_STATE:
               doMove();
               break;
            case ATTACK_STATE:
               facePlayer();
               --reloadCounter;
               if(reloadCounter <= 0)
               {
                  reloadCounter = maxReloadCounter;
                  doAttack();
               }
               break;
            case DIE_STATE:
               break;
            case LAUNCHED_STATE:
               doLaunched();
               break;
            case DOWNED_STATE:
               doDowned();
               break;
            case JUMP_STATE:
               doJump();
         }
      }
      
      internal function doMove() : *
      {
         var _loc1_:* = undefined;
         if(!Player.instance.isRedFreeze)
         {
            if(enemy.currentFrame != 2)
            {
               enemy.gotoAndStop(2);
            }
            if(this.x - destinationX >= speed)
            {
               this.x -= speed;
            }
            else if(this.x - destinationX <= -speed)
            {
               this.x += speed;
            }
            else
            {
               actionState = ATTACK_STATE;
               if(enemy.currentFrame != 1)
               {
                  enemy.gotoAndStop(1);
               }
            }
         }
         if(y < GameStage.groundY - 10 && !MovieClip(root).ground.hitTestPoint(x,y + 3,true))
         {
            _loc1_ = this.y + 3;
            while(MovieClip(root).ground.hitTestPoint(this.x,_loc1_,true))
            {
               _loc1_ += 2;
            }
            y = _loc1_;
            velY = 0;
            if(currentFrame == 1)
            {
               velX = 1;
            }
            else
            {
               velX = -1;
            }
            actionState = JUMP_STATE;
            readyToJump = true;
         }
      }
      
      public function doIdle() : *
      {
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
         var _loc6_:* = undefined;
         _loc2_ = this.x;
         _loc3_ = this.y - 80;
         _loc4_ = lastVelX;
         _loc5_ = lastVelY - 2;
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
         _loc6_ = ProjectileManager.instance.createProjectile(Arrow.typeCode,_loc2_,_loc3_,_loc4_,_loc5_);
         if(_loc4_ < 0)
         {
            _loc6_.scaleX = -1;
         }
      }
      
      override public function doDowned() : *
      {
         if(dead)
         {
            return;
         }
         --downedCounter;
         if(hp > 0)
         {
            if(downedCounter == 6)
            {
               enemy.enemy.gotoAndStop(14);
            }
            else if(downedCounter <= 0)
            {
               enemy.gotoAndStop(1);
               actionState = IDLE_STATE;
            }
         }
         else if(Boolean(Player.instance.isRedFreeze) || headshot)
         {
            if(downedCounter == 18)
            {
               if(Math.random() * 3 < 2 && !headshot)
               {
                  die();
                  if(Player.instance.isRedFreeze)
                  {
                     Player.instance.redFreezeCounter = 37;
                     enemy.enemy.gotoAndStop(13);
                  }
               }
               else
               {
                  enemy.enemy.gotoAndStop(14);
                  if(Player.instance.isRedFreeze)
                  {
                     Player.instance.redFreezeCounter = 36 + 18 + 24;
                  }
               }
            }
            else if(downedCounter == 10)
            {
               enemy.gotoAndStop(1);
            }
            else if(downedCounter <= 4)
            {
               actionState = IDLE_STATE;
               die();
            }
         }
      }
      
      internal function doLaunched() : *
      {
         var _loc1_:* = undefined;
         if(y >= GameStage.groundY && velY > 0)
         {
            y = GameStage.groundY;
            velY = 0;
            actionState = DOWNED_STATE;
            if(hp > 0 || headshot || Boolean(Player.instance.isRedFreeze))
            {
               enemy.gotoAndStop(12);
               downedCounter = 36 + Math.random() * 10;
            }
            else
            {
               if(enemy.enemy.bp != null)
               {
                  enemy.enemy.bp.setActive(false);
               }
               enemy.gotoAndStop(13);
               downedCounter = 24 + Math.random() * 10;
            }
         }
         else if(Boolean(hp > 0) && Boolean(MovieClip(root).ground.hitTestPoint(x,y,true)) && velY > 0)
         {
            _loc1_ = this.y;
            while(MovieClip(root).ground.hitTestPoint(this.x,_loc1_,true))
            {
               _loc1_--;
            }
            y = _loc1_;
            velY = 0;
            actionState = DOWNED_STATE;
            if(hp <= 0 && !headshot && enemy.currentFrame != 13)
            {
               enemy.gotoAndStop(13);
            }
            else if(enemy.currentFrame != 12)
            {
               enemy.gotoAndStop(12);
               if(headshot || Boolean(Player.instance.isRedFreeze))
               {
                  downedCounter = 48 + Math.random() * 5;
               }
               else
               {
                  downedCounter = 36 + Math.random() * 10;
               }
            }
         }
         else
         {
            y += velY;
            velY += gravity;
            if(currentFrame == 1)
            {
               --x;
            }
            else
            {
               ++x;
            }
            if(velY > 0 && enemy.currentFrame != 11)
            {
               enemy.gotoAndStop(11);
            }
         }
      }
      
      internal function doJump() : *
      {
         var _loc1_:* = undefined;
         if(velY < 0 && enemy.currentFrame != 20)
         {
            enemy.gotoAndStop(20);
         }
         else if(velY > 0 && enemy.currentFrame != 21)
         {
            enemy.gotoAndStop(21);
         }
         if(!readyToJump)
         {
            return;
         }
         if(y >= GameStage.groundY)
         {
            y = GameStage.groundY;
            velY = 0;
            actionState = ATTACK_STATE;
            if(enemy.currentFrame != 3)
            {
               enemy.gotoAndStop(3);
            }
         }
         else if(Boolean(MovieClip(root).ground.hitTestPoint(x,y,true)) && velY > 0)
         {
            _loc1_ = this.y;
            while(MovieClip(root).ground.hitTestPoint(this.x,_loc1_,true))
            {
               _loc1_ -= 2;
            }
            y = _loc1_;
            velY = 0;
            actionState = ATTACK_STATE;
            if(enemy.currentFrame != 3)
            {
               enemy.gotoAndStop(3);
            }
         }
         else
         {
            y += velY;
            x += velX;
            velY += gravity;
            if(velY > terminalVelY)
            {
               velY = terminalVelY;
            }
         }
         checkFallBottom();
      }
      
      override public function hit(param1:int, param2:Array, param3:Array) : *
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = undefined;
         _loc4_ = int(param2[param1]);
         _loc5_ = int(param3[param1]);
         if(hp > 0)
         {
            --hp;
            if(actionState == DOWNED_STATE)
            {
               if(param3[0] < param3[param1])
               {
                  downedCounter = 10;
                  Player.instance.downSlashVictim = this;
               }
            }
            else
            {
               if(actionState == LAUNCHED_STATE || actionState == JUMP_STATE)
               {
                  if(actionState == JUMP_STATE)
                  {
                     actionState = LAUNCHED_STATE;
                  }
                  if(param3[0] < param3[param1])
                  {
                     velY += 20;
                     hp -= 2;
                  }
                  else
                  {
                     velY = -10;
                     if(currentFrame == 1)
                     {
                        gotoAndStop(2);
                     }
                     else
                     {
                        gotoAndStop(1);
                     }
                     if(enemy.currentFrame != 10)
                     {
                        enemy.gotoAndStop(10);
                     }
                  }
               }
               else if(param1 > 0 && param3[param1 - 1] > y)
               {
                  if(Math.random() * 2 < 1)
                  {
                     gotoAndStop(1);
                  }
                  else
                  {
                     gotoAndStop(2);
                  }
                  enemy.gotoAndStop(10);
                  actionState = LAUNCHED_STATE;
                  velY = -15 - Math.random() * 5;
                  Player.instance.shunpoLaunchVictim = this;
               }
               _loc6_ = new Point(_loc4_,_loc5_);
               if(actionState != LAUNCHED_STATE && actionState != JUMP_STATE)
               {
                  if(MovieClip(this).enemy.enemy.aimtop != null && Boolean(MovieClip(this).enemy.enemy.aimtop.head.hitTestPoint(_loc6_.x,_loc6_.y)))
                  {
                     headshot = true;
                     hp = 0;
                  }
                  if(MovieClip(this).enemy.enemy.head != null && Boolean(MovieClip(this).enemy.enemy.head.hitTestPoint(_loc6_.x,_loc6_.y)))
                  {
                     headshot = true;
                     hp = 0;
                  }
               }
               if(hp <= 0)
               {
                  if(this.y < GameStage.groundY - 10)
                  {
                     if(Math.random() * 2 < 1)
                     {
                        gotoAndStop(1);
                     }
                     else
                     {
                        gotoAndStop(2);
                     }
                     enemy.gotoAndStop(10);
                     actionState = LAUNCHED_STATE;
                  }
               }
            }
         }
      }
   }
}

