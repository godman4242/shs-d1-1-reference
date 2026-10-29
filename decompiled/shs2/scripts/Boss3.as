package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1199")]
   public class Boss3 extends Enemy
   {
      
      public static var instance:Boss3;
      
      public static var typeCode:int = 23;
      
      internal var walkspeed:int = 2;
      
      internal const HURT_STATE:* = 7;
      
      internal const REST_STATE:* = 8;
      
      internal var formMode:int = 1;
      
      internal var runspeed:int = 20;
      
      internal var endX:int = 0;
      
      internal var endY:int = 0;
      
      internal var targetline:MovieClip;
      
      internal var hasSlash:Boolean = false;
      
      internal var shunpoCounter:int = 0;
      
      internal var totalSlashes:int = 5;
      
      public var fleeCounter:int = 5;
      
      internal var launchNext:Boolean = false;
      
      public var enemy:MovieClip;
      
      internal var slashesLeft:int = 5;
      
      internal var restCounter:int = 0;
      
      public var hasHat:Boolean = true;
      
      internal var targetLineEndX:int;
      
      internal var targetLineEndY:int;
      
      internal var targetLineStartX:int;
      
      public var canMove:Boolean = false;
      
      public function Boss3()
      {
         super();
         addFrameScript(0,frame1,1,frame2);
         instance = this;
         speed = walkspeed;
         AIcounterMax = 24;
         maxhp = 60;
         hp = maxhp;
         startIdle();
         gravity = 3;
         enemy.gotoAndStop(35);
         if(StatsManager.bossNoLife)
         {
            hp = 1;
         }
      }
      
      override public function moveAgain() : *
      {
         destinationX = targetLineStartX;
         faceDestination();
         actionState = MOVE_STATE;
      }
      
      public function shouldDrawSmoke() : Boolean
      {
         return false;
      }
      
      internal function AI() : *
      {
         if(actionState != ATTACK_STATE && actionState != REST_STATE && actionState != DIE_STATE)
         {
            targetPlayer();
            if(actionState != JUMP_STATE && Math.abs(x - targetLineEndX) > 50)
            {
               moveAgain();
            }
         }
      }
      
      public function hurtEnd() : *
      {
      }
      
      public function evade() : *
      {
         var _loc1_:int = 0;
         --slashesLeft;
         updateBossOverheat();
         targetline.visible = false;
         _loc1_ = 180 + Math.random() * 180;
         targetLineStartX = x;
         targetLineEndX = x + 200 * Math.cos(_loc1_ * Math.PI / 180);
         targetLineEndY = y + 200 * Math.sin(_loc1_ * Math.PI / 180);
         if(targetline.x > x && currentFrame != 1)
         {
            gotoAndStop(1);
         }
         else if(currentFrame != 2)
         {
            gotoAndStop(2);
         }
         if(actionState == JUMP_STATE)
         {
            if(targetLineEndX - y > 50)
            {
               enemy.gotoAndStop(13);
            }
            else
            {
               enemy.gotoAndStop(11);
            }
         }
         else if(y - targetLineEndY > 150 || Math.abs(destinationX - targetLineEndX) < 50)
         {
            enemy.gotoAndStop(12);
         }
         else
         {
            enemy.gotoAndStop(10);
         }
         actionState = ATTACK_STATE;
         shunpoCounter = 15;
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
      
      internal function frame1() : *
      {
         stop();
      }
      
      override public function die() : *
      {
         if(dead)
         {
            return;
         }
         dead = true;
         y = GameStage.groundY;
         enemy.gotoAndStop(26);
         actionState = DIE_STATE;
      }
      
      public function drawSlash() : *
      {
         targetline.gotoAndPlay(2);
      }
      
      override public function continueAnimation() : *
      {
         if(disappearCounter > 0 && !deathAnimDone)
         {
            if(MovieClip(this).enemy.enemy == null)
            {
               trace("enemy.enemy null");
               return;
            }
            MovieClip(this).enemy.enemy.play();
            if(enemy.enemy.smoke != null)
            {
               enemy.enemy.smoke.play();
            }
            if(enemy.enemy.dashcloud1 != null)
            {
               enemy.enemy.dashcloud1.play();
            }
            if(enemy.enemy.dashcloud2 != null)
            {
               enemy.enemy.dashcloud2.play();
            }
            if(enemy.enemy.explosion1 != null)
            {
               enemy.enemy.explosion1.play();
            }
            if(enemy.enemy.explosion2 != null)
            {
               enemy.enemy.explosion2.play();
            }
         }
      }
      
      public function increaseBossOverheat() : *
      {
         if(formMode >= 3)
         {
            MovieClip(parent.parent).bossoverheat.indicator.x = restCounter / (2 * 24) * 170;
         }
         else
         {
            MovieClip(parent.parent).bossoverheat.indicator.x = restCounter / (3 * 24) * 170;
         }
         MovieClip(parent.parent).bossoverheat.txt.text = "STEAM RELEASE";
      }
      
      public function updateBossOverheat() : *
      {
         if(slashesLeft <= 0)
         {
            slashesLeft = 0;
            MovieClip(parent.parent).bossoverheat.txt.text = "HEAT CAUTION";
         }
         else
         {
            MovieClip(parent.parent).bossoverheat.txt.text = "HEAT NORMAL";
         }
         MovieClip(parent.parent).bossoverheat.indicator.x = (totalSlashes - slashesLeft) / totalSlashes * 150;
      }
      
      override public function update() : *
      {
         var _loc1_:int = 0;
         if(!canMove || actionState == DIE_STATE)
         {
            return;
         }
         _loc1_ = Math.random() * 5;
         if(_loc1_ == 0 && MovieClip(parent.parent).bossoverheat.indicator.x > 10)
         {
            --MovieClip(parent.parent).bossoverheat.indicator.x;
         }
         else if(_loc1_ == 1 && MovieClip(parent.parent).bossoverheat.indicator.x < 175)
         {
            ++MovieClip(parent.parent).bossoverheat.indicator.x;
         }
         --AIcounter;
         if(!Player.instance.isRedFreeze && AIcounter <= 0)
         {
            AIcounter = AIcounterMax;
            AI();
         }
         if(shunpoCounter > 0)
         {
            --shunpoCounter;
            if(shunpoCounter == 0)
            {
               shunpoEnd();
            }
         }
         switch(actionState)
         {
            case IDLE_STATE:
               immediateAI();
               break;
            case MOVE_STATE:
               doMove();
               immediateAI();
               break;
            case ATTACK_STATE:
            case DIE_STATE:
            case DOWNED_STATE:
               break;
            case JUMP_STATE:
               doJump();
               immediateAI();
               break;
            case HURT_STATE:
               break;
            case REST_STATE:
               doRest();
         }
      }
      
      internal function doMove() : *
      {
         if(!Player.instance.isRedFreeze)
         {
            if(formMode >= 3 && currentFrame != 6)
            {
               enemy.gotoAndStop(6);
            }
            else if(enemy.currentFrame != 2)
            {
               enemy.gotoAndStop(2);
            }
            if(this.x - destinationX >= speed * 2)
            {
               this.x -= speed;
            }
            else if(this.x - destinationX <= -speed * 2)
            {
               this.x += speed;
            }
            else
            {
               moveAgain();
            }
         }
      }
      
      public function doIdle() : *
      {
      }
      
      public function createTargetLine() : *
      {
         targetline = new boss3_targetline();
         MovieClip(parent.parent).slashcanvas.addChild(targetline);
         targetline.visible = false;
      }
      
      public function initDie() : *
      {
         actionState = DIE_STATE;
         y = GameStage.groundY;
         enemy.gotoAndStop(26);
         InputManager.instance.disable();
         targetline.visible = false;
         MovieClip(parent.parent).bossoverheat.visible = false;
         MovieClip(parent.parent).bosshp.visible = false;
      }
      
      internal function doRest() : *
      {
         if(enemy.currentFrame != 25)
         {
            enemy.gotoAndStop(25);
         }
         --restCounter;
         increaseBossOverheat();
         if(restCounter == 12)
         {
            enemy.enemy.gotoAndStop(10);
         }
         if(restCounter == 6)
         {
            enemy.enemy.gotoAndPlay(11);
         }
         else if(restCounter == 0)
         {
            startIdle();
         }
      }
      
      public function startIdle() : *
      {
         actionState = IDLE_STATE;
         facePlayer();
         if(enemy.currentFrame != 1)
         {
            enemy.gotoAndStop(1);
         }
      }
      
      public function shunpoEnd() : *
      {
         if(Boolean(Player.instance.checkEnemyWeaponHitPlayer(targetline)) && launchNext)
         {
            Player.instance.gotLaunched();
            AIcounter = 6;
            if(y == GameStage.groundY)
            {
               if(enemy.currentFrame != 19)
               {
                  enemy.gotoAndStop(19);
               }
            }
         }
         hasSlash = false;
         x = targetLineEndX;
         if(targetLineEndY > GameStage.groundY - 50)
         {
            y = GameStage.groundY;
            actionState = IDLE_STATE;
            if(enemy.currentFrame != 19)
            {
               enemy.gotoAndStop(3);
            }
         }
         else
         {
            y = targetLineEndY;
            actionState = JUMP_STATE;
            enemy.gotoAndStop(5);
            velY = 0;
            if(currentFrame == 1)
            {
               velX = 5;
            }
            else
            {
               velX = -5;
            }
         }
      }
      
      internal function loseHat() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         _loc1_ = 3;
         _loc2_ = 0;
         _loc3_ = 30;
         if(Math.random() * 2 < 1)
         {
            _loc1_ = -_loc1_;
            _loc2_ = 50;
            _loc3_ = -_loc3_;
         }
         _loc4_ = ProjectileManager.instance.createProjectile(HatProjectile.typeCode,x,y - 85,_loc1_,15);
         _loc4_.rot = _loc3_;
         hasHat = false;
      }
      
      override public function hit(param1:int, param2:Array, param3:Array) : *
      {
         if(actionState == REST_STATE)
         {
            hp -= 2;
            SoundManager.instance.playHit();
            updateBossBar();
            if(Player.instance.powerOn)
            {
               restCounter -= 3;
               increaseBossOverheat();
               if(restCounter <= 0)
               {
                  restCounter = 0;
                  Player.instance.activatePower();
                  startIdle();
               }
            }
         }
         else if(Player.instance.powerOn)
         {
            --hp;
            SoundManager.instance.playHit();
            updateBossBar();
         }
         else if(slashesLeft > 0 && shunpoCounter == 0)
         {
            SoundManager.instance.playDeflect();
            evade();
         }
         else if(shunpoCounter == 0 && slashesLeft <= 0)
         {
            SoundManager.instance.playHit();
            actionState = REST_STATE;
            if(formMode >= 3)
            {
               restCounter = 2 * 24;
            }
            else
            {
               restCounter = 3 * 24;
            }
            targetline.visible = false;
            y = GameStage.groundY;
            if(formMode == 1)
            {
               slashesLeft = 5;
               totalSlashes = 5;
            }
            else if(formMode == 2)
            {
               slashesLeft = 6;
               totalSlashes = 6;
            }
            else if(formMode == 3)
            {
               slashesLeft = 7;
               totalSlashes = 7;
            }
            else if(formMode == 4)
            {
               slashesLeft = 8;
               totalSlashes = 8;
            }
            else if(formMode == 5)
            {
               slashesLeft = 10;
               totalSlashes = 10;
            }
            if(hasHat && formMode >= 3)
            {
               loseHat();
            }
            updateBossOverheat();
         }
         if(hp <= 20)
         {
            formMode = 5;
            speed = 25;
         }
         else if(hp <= 30)
         {
            formMode = 4;
            speed = 20;
         }
         else if(hp <= 40)
         {
            formMode = 3;
            speed = 15;
         }
         else if(hp <= 50)
         {
            formMode = 2;
            speed = 5;
         }
      }
      
      internal function immediateAI() : *
      {
         if(Boolean(Player.instance.isRedFreeze) || actionState == DIE_STATE)
         {
            return;
         }
         if(hasSlash && Math.abs(x - targetLineStartX) < 50)
         {
            facePlayer();
            if(actionState == JUMP_STATE)
            {
               if(targetLineEndX - y > 50)
               {
                  enemy.gotoAndStop(13);
               }
               else
               {
                  enemy.gotoAndStop(11);
               }
            }
            else if(y - targetLineEndY > 150 || Math.abs(destinationX - targetLineEndX) < 50)
            {
               enemy.gotoAndStop(12);
            }
            else
            {
               enemy.gotoAndStop(10);
            }
            actionState = ATTACK_STATE;
            shunpoCounter = 15;
            --slashesLeft;
            updateBossOverheat();
            if(Boolean(Player.instance.checkEnemyWeaponHitPlayer(targetline)) && launchNext)
            {
               Player.instance.gotLaunched();
               shunpoCounter = 1;
               AIcounter = 6;
               if(y == GameStage.groundY)
               {
                  enemy.gotoAndStop(19);
               }
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
         if(enemy.enemy.smoke != null)
         {
            enemy.enemy.smoke.stop();
         }
         if(enemy.enemy.dashcloud1 != null)
         {
            enemy.enemy.dashcloud1.stop();
         }
         if(enemy.enemy.dashcloud2 != null)
         {
            enemy.enemy.dashcloud2.stop();
         }
         if(enemy.enemy.explosion1 != null)
         {
            enemy.enemy.explosion1.stop();
         }
         if(enemy.enemy.explosion2 != null)
         {
            enemy.enemy.explosion2.stop();
         }
      }
      
      internal function doJump() : *
      {
         if(y >= GameStage.groundY)
         {
            y = GameStage.groundY;
            velY = 0;
            actionState = IDLE_STATE;
            enemy.gotoAndStop(4);
         }
         else
         {
            y += velY;
            x += velX;
            velY += gravity;
         }
      }
      
      public function playerMoveOn() : *
      {
         BattlefieldStage.instance.doScroll(100);
         MovieClip(parent.parent).bosshp.visible = false;
         MovieClip(parent.parent).transition.gotoAndPlay(26);
      }
      
      internal function targetPlayer() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         hasSlash = true;
         targetline.visible = true;
         targetline.gotoAndStop(1);
         targetline.x = Player.instance.x;
         targetline.y = Player.instance.y - 50;
         _loc1_ = Player.instance.x - x;
         _loc2_ = Player.instance.y - y;
         if(Boolean(Player.instance.isLaunched && !Player.instance.isDowned) || Boolean((formMode == 3 || formMode == 4) && Math.random() * 3 < 1) || formMode == 5 && Math.random() * 2 < 1)
         {
            launchNext = true;
            targetline.rotation = 270 + Math.random() * 15 - 30;
         }
         else
         {
            launchNext = false;
            targetline.rotation = Math.atan2(_loc2_,_loc1_) * 180 / Math.PI;
         }
         targetLineStartX = targetline.x - 150 * Math.cos(targetline.rotation * Math.PI / 180);
         targetLineEndX = targetline.x + 100 * Math.cos(targetline.rotation * Math.PI / 180);
         targetLineEndY = targetline.y - 100 * Math.sin(targetline.rotation * Math.PI / 180);
         if(Math.abs(x - Player.instance.x) > 150)
         {
            targetline.scaleX = 1;
         }
         else
         {
            _loc3_ = Math.abs(x - Player.instance.x);
            targetline.scaleX = _loc3_ / 150;
            targetLineStartX = x;
            targetLineEndX = targetline.x + 50 * Math.cos(targetline.rotation * Math.PI / 180);
            targetLineEndY = targetline.y - 50 * Math.sin(targetline.rotation * Math.PI / 180);
         }
      }
      
      public function flee() : *
      {
      }
   }
}

