package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol973")]
   public class Enemy_knifeArmored extends Enemy
   {
      
      public static var typeCode:int = 6;
      
      public var enemy:MovieClip;
      
      internal const THROW_STATE:* = 7;
      
      public function Enemy_knifeArmored()
      {
         super();
         addFrameScript(0,frame1,1,frame2);
         speed = 2;
         AIcounterMax = 48;
         hp = 5;
         maxhp = 5;
         updateHPBar();
      }
      
      internal function AI() : *
      {
         if(actionState == IDLE_STATE || actionState == MOVE_STATE)
         {
            if(x > 0 && x < GameStage.stageWidth && Math.random() * 5 < 1)
            {
               facePlayer();
               enemy.gotoAndStop(25);
               actionState = THROW_STATE;
            }
            else if(Math.abs(Player.instance.x - this.x) > 50)
            {
               destinationX = Player.instance.x;
               faceDestination();
               actionState = MOVE_STATE;
               speed = Math.random() * 2 + 2;
            }
         }
         checkFallBottom();
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
         SoundManager.instance.playDie();
         dead = true;
         if(actionState == LAUNCHED_STATE)
         {
            return;
         }
         if(actionState == DOWNED_STATE || downSlashDeath)
         {
            enemy.gotoAndStop(14);
            actionState = DIE_STATE;
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
         facePlayer();
         if(enemy.currentFrame != 3)
         {
            enemy.gotoAndStop(3);
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
         if(!Player.instance.isRedFreeze && AIcounter <= 0)
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
               immediateAI();
               if(actionState == MOVE_STATE)
               {
                  doMove();
               }
               break;
            case ATTACK_STATE:
               doAttack();
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
               break;
            case THROW_STATE:
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
               moveAgain();
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
         actionState = IDLE_STATE;
         if(enemy.currentFrame != 1)
         {
            enemy.gotoAndStop(1);
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
            if(downedCounter == 6 && enemy.enemy != null)
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
                     if(enemy.enemy != null)
                     {
                        enemy.enemy.gotoAndStop(13);
                     }
                  }
               }
               else
               {
                  if(enemy.enemy != null)
                  {
                     enemy.enemy.gotoAndStop(14);
                  }
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
               if(enemy.enemy != null && enemy.enemy.bp != null)
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
      
      public function throwKnife() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:MovieClip = null;
         _loc1_ = this.x;
         _loc2_ = this.y - 70;
         _loc3_ = Player.instance.x - this.x;
         _loc4_ = this.y - Player.instance.y;
         _loc5_ = Math.sqrt(_loc3_ * _loc3_ + _loc4_ * _loc4_);
         if(_loc5_ == 0)
         {
            _loc5_ = 1;
         }
         _loc6_ = _loc3_ * 15 / _loc5_;
         _loc7_ = _loc4_ * 15 / _loc5_;
         _loc8_ = ProjectileManager.instance.createProjectile(Projectile_knife.typeCode,_loc1_,_loc2_,_loc6_,_loc7_);
         if(_loc6_ < 0)
         {
            _loc8_.scaleX = -1;
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
            moveAgain();
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
            moveAgain();
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
               if(param3[0] < param3[param1] && param3[param1] - param3[0] > 40)
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
                  if(param3[0] < param3[param1] && param3[param1] - param3[0] > 40)
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
               if(actionState != LAUNCHED_STATE && actionState != JUMP_STATE && Boolean(MovieClip(this).enemy.enemy.head.hitTestPoint(_loc6_.x,_loc6_.y)))
               {
                  headshot = true;
                  hp = 0;
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
            SoundManager.instance.playHit();
         }
      }
      
      internal function immediateAI() : *
      {
         var _loc1_:* = undefined;
         if(Player.instance.isRedFreeze)
         {
            return;
         }
         if(hp > 0 && Math.abs(Player.instance.x - this.x) <= 50)
         {
            if(Boolean(Player.instance.isGrounded()) && Math.abs(Player.instance.y - y) < 30)
            {
               actionState = ATTACK_STATE;
               y = Player.instance.y;
            }
            else if(Boolean(Player.instance.isGrounded()) && y > Player.instance.y)
            {
               y -= 10;
               velY = -Math.sqrt(2 * gravity * (y - Player.instance.y));
               if(currentFrame == 1)
               {
                  velX = 1;
               }
               else
               {
                  velX = -1;
               }
               actionState = JUMP_STATE;
               readyToJump = false;
            }
            else if(Boolean(Player.instance.isGrounded()) && Player.instance.y > y)
            {
               _loc1_ = this.y + 2;
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
      }
   }
}

