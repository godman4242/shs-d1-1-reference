package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol714")]
   public class Enemy_armoredSamurai extends Enemy
   {
      
      public static var typeCode:int = 13;
      
      internal var isVul:Boolean = false;
      
      internal var walkspeed:int = 40;
      
      internal var reloadCounter:int = 0;
      
      public var enemy:MovieClip;
      
      internal var canHit:Boolean = false;
      
      public function Enemy_armoredSamurai()
      {
         super();
         addFrameScript(0,frame1,1,frame2);
         speed = walkspeed;
         AIcounterMax = 24;
         hp = 10;
         maxhp = 10;
         updateHPBar();
         enemyType = 13;
      }
      
      override public function moveAgain() : *
      {
         destinationX = Player.instance.x;
         faceDestination();
         actionState = MOVE_STATE;
         speed = walkspeed;
      }
      
      internal function AI() : *
      {
         if(actionState == IDLE_STATE || actionState == MOVE_STATE || actionState == ATTACK_STATE)
         {
            isVul = false;
            if(Math.abs(Player.instance.x - this.x) > 250)
            {
               destinationX = Player.instance.x;
               faceDestination();
               actionState = MOVE_STATE;
               speed = walkspeed;
            }
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
         SoundManager.instance.playDie();
         dead = true;
         if(actionState == DOWNED_STATE)
         {
            enemy.gotoAndStop(5);
         }
         else if(Player.instance.isRedFreeze)
         {
            enemy.gotoAndStop(7);
         }
         else
         {
            enemy.gotoAndStop(6);
         }
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
         }
      }
      
      internal function doAttack() : *
      {
         if(enemy.currentFrame != 3)
         {
            facePlayer();
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
      
      override public function update() : *
      {
         if(isDead() && actionState != LAUNCHED_STATE && actionState != DOWNED_STATE)
         {
            doDisappear();
            return;
         }
         if(reloadCounter > 0)
         {
            --reloadCounter;
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
                  actionState = IDLE_STATE;
                  facePlayer();
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
         actionState = IDLE_STATE;
         facePlayer();
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
         if(enemy.currentFrame != 4)
         {
            enemy.gotoAndStop(4);
         }
         --downedCounter;
         if(downedCounter == 0 && hp > 0)
         {
            enemy.gotoAndStop(2);
            if(currentFrame == 1)
            {
               x -= 100;
            }
            else
            {
               x += 100;
            }
            moveAgain();
         }
      }
      
      override public function hit(param1:int, param2:Array, param3:Array) : *
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc4_ = int(param2[param1]);
         _loc5_ = int(param3[param1]);
         if(actionState == DOWNED_STATE)
         {
            if(param3[0] < param3[param1] && param3[param1] - param3[0] > 40)
            {
               hp = 0;
               Player.instance.downSlashVictim = this;
            }
            else
            {
               hp = hp - 1;
            }
         }
         else if(isVul && actionState == ATTACK_STATE)
         {
            actionState = DOWNED_STATE;
            downedCounter = 3 * 24;
            hp -= 2;
         }
         else if(param1 > 0 && param3[param1 - 1] > y - 20)
         {
            actionState = DOWNED_STATE;
            downedCounter = 3 * 24;
            hp -= 2;
         }
         else
         {
            hp = hp - 1;
         }
         if(hp > 0)
         {
            SoundManager.instance.playHitMetal();
         }
      }
      
      internal function immediateAI() : *
      {
         if(Player.instance.isRedFreeze)
         {
            return;
         }
         if(hp > 0 && reloadCounter == 0 && Math.abs(Player.instance.x - this.x) <= 250)
         {
            if(Boolean(Player.instance.isGrounded()) && Math.abs(Player.instance.y - y) < 30)
            {
               actionState = ATTACK_STATE;
               reloadCounter = 36;
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
         if(Boolean(Player.instance.isRedFreeze) && (MovieClip(this).enemy.currentFrame == 5 || MovieClip(this).enemy.currentFrame == 7))
         {
            return;
         }
         MovieClip(this).enemy.enemy.stop();
      }
   }
}

