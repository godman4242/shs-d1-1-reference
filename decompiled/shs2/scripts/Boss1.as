package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol944")]
   public class Boss1 extends Enemy
   {
      
      public static var instance:Boss1;
      
      public static var typeCode:int = 21;
      
      internal var isVul:Boolean = false;
      
      internal var walkspeed:int = 50;
      
      internal var formMode:int = 1;
      
      internal var inVulCounter:int = 0;
      
      internal const JUMPATTACK_STATE:* = 8;
      
      internal const FLEE_STATE:* = 9;
      
      internal const DASH_STATE:* = 7;
      
      public var enemy:MovieClip;
      
      internal var canHit:Boolean = false;
      
      public var canMove:Boolean = false;
      
      public function Boss1()
      {
         super();
         addFrameScript(0,frame1,1,frame2);
         instance = this;
         speed = walkspeed;
         AIcounterMax = 24;
         maxhp = 50;
         hp = maxhp;
         if(StatsManager.bossNoLife)
         {
            hp = 1;
         }
      }
      
      override public function moveAgain() : *
      {
         destinationX = Player.instance.x;
         faceDestination();
         actionState = MOVE_STATE;
         speed = walkspeed;
      }
      
      internal function startJumpAttack() : *
      {
         facePlayer();
         actionState = JUMPATTACK_STATE;
         enemy.gotoAndStop(4);
      }
      
      internal function AI() : *
      {
         if(actionState == IDLE_STATE || actionState == MOVE_STATE || actionState == ATTACK_STATE)
         {
            isVul = false;
            if(formMode >= 4 && Math.random() * 5 < 1)
            {
               startJumpAttack();
               return;
            }
            if(formMode >= 3 && Math.random() * 8 < 1)
            {
               startDash();
               return;
            }
            if(formMode >= 2 && Math.random() * 5 < 1)
            {
               startJump();
               return;
            }
            if(Math.abs(Player.instance.x - this.x) > 170)
            {
               destinationX = Player.instance.x;
               faceDestination();
               actionState = MOVE_STATE;
               speed = walkspeed;
            }
         }
      }
      
      public function startKneel() : *
      {
         enemy.gotoAndStop(26);
         if(currentFrame == 1)
         {
            x -= 130;
         }
         else
         {
            x += 130;
         }
         y = GameStage.groundY;
         canHit = true;
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         stop();
      }
      
      public function updateBossBar() : *
      {
         MovieClip(parent.parent).bosshp.hpbar.width = hp * 4;
         MovieClip(parent.parent).bosshp.hurtbar.width = maxhp * 4;
      }
      
      override public function die() : *
      {
         if(dead)
         {
            return;
         }
         dead = true;
         enemy.gotoAndStop(27);
         actionState = DIE_STATE;
      }
      
      override public function freeze() : *
      {
         this.enemy.enemy.stop();
         frozen = true;
      }
      
      override public function continueAnimation() : *
      {
         if(disappearCounter > 0 && !deathAnimDone)
         {
            MovieClip(this).enemy.enemy.play();
            if(MovieClip(this).enemy.enemy.grass1 != null)
            {
               MovieClip(this).enemy.enemy.grass1.play();
            }
            if(MovieClip(this).enemy.enemy.grass2 != null)
            {
               MovieClip(this).enemy.enemy.grass2.play();
            }
            if(MovieClip(this).enemy.enemy.wave != null)
            {
               MovieClip(this).enemy.enemy.wave.play();
            }
            if(MovieClip(this).enemy.enemy.flame1 != null)
            {
               MovieClip(this).enemy.enemy.flame1.play();
            }
            if(MovieClip(this).enemy.enemy.flame2 != null)
            {
               MovieClip(this).enemy.enemy.flame2.play();
            }
         }
      }
      
      internal function doAttack() : *
      {
         facePlayer();
         if(enemy.currentFrame != 3)
         {
            enemy.gotoAndStop(3);
         }
      }
      
      public function setIsVul(param1:Boolean) : *
      {
         isVul = param1;
      }
      
      public function walkForward() : *
      {
         if(currentFrame == 2)
         {
            this.x -= speed;
         }
         else
         {
            this.x += speed;
         }
      }
      
      public function doDash() : *
      {
         x += velX;
         if(x < -100 || x > GameStage.stageWidth + 50)
         {
            moveAgain();
         }
         if(y < GameStage.groundY - 50 && enemy.enemy != null)
         {
            if(enemy.enemy.grass1 != null)
            {
               enemy.enemy.grass1.visible = false;
            }
            if(enemy.enemy.grass2 != null)
            {
               enemy.enemy.grass2.visible = false;
            }
            if(enemy.enemy.wave != null)
            {
               enemy.enemy.wave.visible = false;
            }
         }
         if(checkEnemyWeaponHitPlayer(this))
         {
            Player.instance.gotLaunched();
         }
      }
      
      override public function update() : *
      {
         if(!canMove)
         {
            return;
         }
         if(inVulCounter > 0)
         {
            --inVulCounter;
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
            case DOWNED_STATE:
               doDowned();
               break;
            case JUMP_STATE:
               doJump();
               break;
            case DASH_STATE:
               doDash();
               break;
            case JUMPATTACK_STATE:
            case FLEE_STATE:
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
            if(this.x - destinationX < speed)
            {
               if(this.x - destinationX > -speed)
               {
                  moveAgain();
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
      
      public function startDash() : *
      {
         actionState = DASH_STATE;
         if(x < Player.instance.x)
         {
            gotoAndStop(1);
            velX = 25;
         }
         else
         {
            gotoAndStop(2);
            velX = -25;
         }
         enemy.gotoAndStop(30);
         if(formMode == 3)
         {
            y = Player.instance.y;
         }
      }
      
      override public function doDowned() : *
      {
         if(dead)
         {
            return;
         }
         if(enemy.currentFrame != 25 && enemy.currentFrame != 26)
         {
            enemy.gotoAndStop(25);
         }
         --downedCounter;
         if(downedCounter == 0 && hp > 0)
         {
            if(formMode > 1 && Math.random() * 2 < 1)
            {
               startDash();
            }
            else
            {
               startJump();
            }
            inVulCounter = 1 * 24;
            isVul = false;
         }
      }
      
      internal function doIdle() : *
      {
         if(enemy.currentFrame != 1)
         {
            enemy.gotoAndStop(1);
         }
      }
      
      public function initFlee() : *
      {
         if(enemy.currentFrame == 25)
         {
            if(currentFrame == 1)
            {
               x -= 130;
            }
            else
            {
               x += 130;
            }
         }
         if(currentFrame == 1)
         {
            enemy.gotoAndStop(41);
         }
         else
         {
            enemy.gotoAndStop(42);
         }
         InputManager.instance.disable();
         actionState = DIE_STATE;
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
            actionState = IDLE_STATE;
            facePlayer();
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
         }
      }
      
      override public function hit(param1:int, param2:Array, param3:Array) : *
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(inVulCounter > 0)
         {
            return;
         }
         if(actionState == DOWNED_STATE && canHit)
         {
            _loc4_ = int(param2[param1]);
            _loc5_ = int(param3[param1]);
            if(param3[0] < param3[param1] && param3[param1] - param3[0] > 40)
            {
               hp -= 5;
               updateBossBar();
               Player.instance.downSlashVictim = this;
               downedCounter += 12;
               canHit = false;
               SoundManager.instance.playBoss1Hurt();
            }
            else if(canHit)
            {
               hp = hp - 1;
               SoundManager.instance.playHit();
               updateBossBar();
            }
         }
         else if(isVul && (actionState == ATTACK_STATE || actionState == JUMPATTACK_STATE))
         {
            actionState = DOWNED_STATE;
            downedCounter = 2 * 24;
            hp -= 2;
            SoundManager.instance.playHit();
            updateBossBar();
         }
         else
         {
            SoundManager.instance.playHitMetal();
         }
         if(hp < 10)
         {
            formMode = 5;
         }
         else if(hp < 20)
         {
            formMode = 4;
         }
         else if(hp < 30)
         {
            formMode = 3;
         }
         else if(hp < 40)
         {
            formMode = 2;
         }
      }
      
      internal function immediateAI() : *
      {
         var _loc1_:* = undefined;
         if(Player.instance.isRedFreeze)
         {
            return;
         }
         if(hp > 0 && Math.abs(Player.instance.x - this.x) <= 170)
         {
            if(Boolean(Player.instance.isGrounded()) && Math.abs(Player.instance.y - y) < 30)
            {
               if(formMode < 5)
               {
                  actionState = ATTACK_STATE;
                  y = Player.instance.y;
               }
               else
               {
                  AI();
               }
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
      
      override public function downSlashHit() : *
      {
      }
      
      override public function stopAnimation() : *
      {
         if(MovieClip(this).enemy.enemy == null)
         {
            trace("enemy.enemy null");
            return;
         }
         MovieClip(this).enemy.enemy.stop();
         if(!Player.instance.isRedFreeze && MovieClip(this).enemy.enemy.grass1 != null)
         {
            MovieClip(this).enemy.enemy.grass1.stop();
         }
         if(!Player.instance.isRedFreeze && MovieClip(this).enemy.enemy.grass2 != null)
         {
            MovieClip(this).enemy.enemy.grass2.stop();
         }
         if(!Player.instance.isRedFreeze && MovieClip(this).enemy.enemy.wave != null)
         {
            MovieClip(this).enemy.enemy.wave.stop();
         }
         if(!Player.instance.isRedFreeze && MovieClip(this).enemy.enemy.flame1 != null)
         {
            MovieClip(this).enemy.enemy.flame1.stop();
         }
         if(!Player.instance.isRedFreeze && MovieClip(this).enemy.enemy.flame2 != null)
         {
            MovieClip(this).enemy.enemy.flame2.stop();
         }
      }
      
      internal function startJump() : *
      {
         actionState = JUMP_STATE;
         if(x < Player.instance.x)
         {
            gotoAndStop(1);
            velX = 10;
         }
         else
         {
            gotoAndStop(2);
            velX = -10;
         }
         velY = -20;
         if(Math.abs(x - Player.instance.x) < 200)
         {
            velX = velX / 3 * 2;
         }
         y = y - 1;
      }
      
      public function playerMoveOn() : *
      {
         ForestStage.instance.doScroll(100);
         MovieClip(parent.parent).bosshp.visible = false;
         MovieClip(parent.parent).transition.gotoAndPlay(26);
      }
      
      public function shootWave() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:* = undefined;
         _loc1_ = -30;
         _loc2_ = -200;
         if(currentFrame == 1)
         {
            _loc1_ = 30;
            _loc2_ = 200;
         }
         _loc3_ = ProjectileManager.instance.createProjectile(Projectile_wave.typeCode,x + _loc2_,y,_loc1_,0);
         if(_loc1_ > 0)
         {
            _loc3_.scaleX = -1;
         }
      }
   }
}

