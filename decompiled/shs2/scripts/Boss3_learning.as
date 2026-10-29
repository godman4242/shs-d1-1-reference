package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1198")]
   public class Boss3_learning extends Enemy
   {
      
      public static var instance:Boss3_learning;
      
      public static var typeCode:int = 25;
      
      internal var walkspeed:int = 2;
      
      internal var evaded:Boolean = false;
      
      internal const HURT_STATE:* = 7;
      
      internal const REST_STATE:* = 8;
      
      public var formMode:int = 1;
      
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
      
      public function Boss3_learning()
      {
         super();
         addFrameScript(0,frame1,1,frame2);
         instance = this;
         speed = walkspeed;
         AIcounterMax = 2 * 24;
         maxhp = 1;
         hp = maxhp;
         moveRandom();
         gravity = 3;
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
         if(actionState == HURT_STATE || actionState == DIE_STATE)
         {
            return;
         }
         if(formMode == 1)
         {
            if(x < 10 || x > GameStage.stageWidth || Math.random() * 5 < 1)
            {
               moveRandom();
            }
         }
         else if(formMode >= 2 && actionState != ATTACK_STATE)
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
         x -= 60;
         enemy.gotoAndStop(31);
         die();
         instance = null;
      }
      
      public function evade() : *
      {
         var _loc1_:int = 0;
         SoundManager.instance.playDeflect();
         evaded = true;
         if(targetline != null)
         {
            targetline.visible = false;
         }
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
      
      public function destroyTargetLine() : *
      {
         if(targetline != null)
         {
            MovieClip(parent.parent).slashcanvas.removeChild(targetline);
            targetline = null;
         }
      }
      
      override public function update() : *
      {
         if(actionState == DIE_STATE)
         {
            return;
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
               doHurt();
         }
      }
      
      public function exitEnd() : *
      {
         if(GameStage.getStage().enemiesInWaiting + EnemyManager.instance.countAlive() + EnemyManager.instance.countDying() == 0)
         {
            GameStage.getStage().nextArea();
            instance = null;
         }
      }
      
      internal function doMove() : *
      {
         if(!Player.instance.isRedFreeze)
         {
            if(enemy.currentFrame != 2)
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
            else if(formMode == 1)
            {
               startIdle();
            }
            else
            {
               moveAgain();
            }
         }
      }
      
      public function doHurt() : *
      {
         if(formMode == 3)
         {
            if(enemy.currentFrame != 32)
            {
               gotoAndStop(1);
               enemy.gotoAndStop(32);
               y = GameStage.groundY;
               destroyTargetLine();
            }
         }
         else if(enemy.currentFrame != 30)
         {
            gotoAndStop(1);
            enemy.gotoAndStop(30);
            y = GameStage.groundY;
            destroyTargetLine();
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
         if(evaded)
         {
            actionState = HURT_STATE;
         }
      }
      
      override public function hit(param1:int, param2:Array, param3:Array) : *
      {
         if(formMode <= 2)
         {
            actionState = HURT_STATE;
            SoundManager.instance.playHit();
         }
         else
         {
            evade();
         }
      }
      
      internal function immediateAI() : *
      {
         if(Boolean(formMode < 2 || Player.instance.isRedFreeze) || Boolean(actionState == HURT_STATE) || actionState == DIE_STATE)
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
      
      internal function targetPlayer() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(targetline == null)
         {
            createTargetLine();
         }
         hasSlash = true;
         targetline.visible = true;
         targetline.gotoAndStop(1);
         targetline.x = Player.instance.x;
         targetline.y = Player.instance.y - 50;
         _loc1_ = Player.instance.x - x;
         _loc2_ = Player.instance.y - y;
         launchNext = false;
         targetline.rotation = Math.atan2(_loc2_,_loc1_) * 180 / Math.PI;
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
      
      public function moveRandom() : *
      {
         destinationX = Math.random() * GameStage.stageWidth;
         faceDestination();
         actionState = MOVE_STATE;
      }
   }
}

