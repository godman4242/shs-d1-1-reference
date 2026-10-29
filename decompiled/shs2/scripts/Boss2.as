package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1429")]
   public class Boss2 extends Enemy
   {
      
      public static var instance:Boss2;
      
      public static var typeCode:int = 22;
      
      internal var reloadCounter:int = 0;
      
      internal const HURT_STATE:* = 7;
      
      internal var formMode:int = 1;
      
      internal var tempxpos:int;
      
      internal var fire45next:Boolean = false;
      
      internal var inVulCounter:int = -1;
      
      internal const FLEE_STATE:* = 9;
      
      internal var tempypos:int;
      
      internal var dontShoot:Boolean = false;
      
      internal var frontBombCounter:int = 0;
      
      public var fleeCounter:int = 5;
      
      internal var flyspeedx:int;
      
      internal var flyspeedy:int;
      
      internal const FRONTBOMB_STATE:* = 8;
      
      public var enemy:MovieClip;
      
      public var canMove:Boolean = false;
      
      public function Boss2()
      {
         super();
         addFrameScript(0,frame1,1,frame2);
         instance = this;
         speed = flyspeedx;
         AIcounterMax = 24;
         maxhp = 8 * 5;
         hp = maxhp;
         if(StatsManager.bossNoLife)
         {
            hp = 1;
         }
      }
      
      override public function moveAgain() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(Player.instance.x < GameStage.stageWidth / 2)
         {
            destinationX = GameStage.stageWidth / 2 + Math.random() * GameStage.stageWidth / 2;
         }
         else
         {
            destinationX = Math.random() * GameStage.stageWidth / 2;
         }
         destinationY = Math.random() * 400;
         prepFire45();
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
      
      override public function checkEnemyWeaponHitPlayer(param1:MovieClip) : Boolean
      {
         return Player.instance.checkEnemyWeaponHitPlayer(param1);
      }
      
      internal function AI() : *
      {
         if(Boolean(actionState == FRONTBOMB_STATE) || Boolean(Player.instance.isScrolling) || actionState == FLEE_STATE)
         {
            return;
         }
         if(frontBombCounter > 0)
         {
            --frontBombCounter;
         }
         if(!isOnScreen())
         {
            if(frontBombCounter == 0 && formMode >= 4 && Math.random() * 3 < 1)
            {
               startFrontBomb();
               return;
            }
            if(formMode >= 3 && Math.random() * 5 < 1)
            {
               createRocketDownFromTop();
            }
            else if(formMode >= 2 && Math.random() * 5 < 1)
            {
               createFireBombFromTopRandom(3);
            }
            else if(formMode >= 1 && Math.random() * 5 < 1)
            {
               createFireBombFromTop(Player.instance.x);
            }
            MountainStage.instance.notifyCanMoveUp();
         }
         else if(fleeCounter > 0)
         {
            if(actionState == IDLE_STATE)
            {
               MountainStage.instance.removeTriggerPlatform();
               moveToPlayerY();
            }
            else if(formMode == 3 && actionState == MOVE_STATE && !dontShoot && Math.random() * 5 < 1)
            {
               actionState = ATTACK_STATE;
               enemy.gotoAndStop(7);
            }
            else if(formMode >= 4 && actionState == MOVE_STATE && !dontShoot && Math.random() * 3 < 1)
            {
               actionState = ATTACK_STATE;
               enemy.gotoAndStop(7);
            }
         }
      }
      
      internal function startFrontBomb() : *
      {
         frontBombCounter = 3 * 24;
         actionState = FRONTBOMB_STATE;
         MountainStage.instance.removeTriggerPlatform();
         tempxpos = x;
         tempypos = y;
         if(Math.random() * 2 < 1)
         {
            if(currentFrame != 1)
            {
               gotoAndStop(1);
            }
            x = Math.random() * GameStage.stageWidth / 4;
         }
         else
         {
            if(currentFrame != 2)
            {
               gotoAndStop(2);
            }
            x = GameStage.stageWidth - Math.random() * GameStage.stageWidth / 4;
         }
         enemy.gotoAndStop(10);
         y = 400;
      }
      
      public function hurtEnd() : *
      {
         if(hp > 0)
         {
            if(currentFrame == 1)
            {
               x -= 160;
            }
            else
            {
               x += 160;
            }
            dontShoot = true;
            if(fleeCounter <= 0)
            {
               flee();
            }
            else
            {
               moveAgain();
            }
         }
         else
         {
            initFlee();
         }
      }
      
      internal function frame2() : *
      {
         stop();
      }
      
      internal function isOnScreen() : Boolean
      {
         return actionState != FRONTBOMB_STATE && y >= -100 && y <= 500;
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
         enemy.gotoAndStop(20);
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
            if(MovieClip(this).enemy.enemy == null)
            {
               trace("enemy.enemy null");
               return;
            }
            MovieClip(this).enemy.enemy.play();
            if(enemy.enemy.jetpack != null)
            {
               enemy.enemy.jetpack.play();
               if(enemy.enemy.jetpack.flame1 != null)
               {
                  enemy.enemy.jetpack.flame1.play();
               }
               if(enemy.enemy.jetpack.flame2 != null)
               {
                  enemy.enemy.jetpack.flame2.play();
               }
            }
            if(enemy.enemy.flame1 != null)
            {
               enemy.enemy.flame1.play();
            }
            if(enemy.enemy.flame2 != null)
            {
               enemy.enemy.flame2.play();
            }
            if(enemy.enemy.flame3 != null)
            {
               enemy.enemy.flame3.play();
            }
            if(enemy.enemy.enemy != null)
            {
               enemy.enemy.enemy.play();
               if(enemy.enemy.enemy.jetpack != null)
               {
                  enemy.enemy.enemy.jetpack.play();
                  if(enemy.enemy.enemy.jetpack.flame1 != null)
                  {
                     enemy.enemy.enemy.jetpack.flame1.play();
                  }
                  if(enemy.enemy.enemy.jetpack.flame2 != null)
                  {
                     enemy.enemy.enemy.jetpack.flame2.play();
                  }
               }
               if(enemy.enemy.enemy.flame1 != null)
               {
                  enemy.enemy.enemy.flame1.play();
                  if(enemy.enemy.enemy.flame1.flame1 != null)
                  {
                     enemy.enemy.enemy.flame1.flame1.play();
                  }
                  enemy.enemy.enemy.flame1.flame2.play();
               }
               if(enemy.enemy.enemy.flame2 != null)
               {
                  enemy.enemy.enemy.flame2.play();
                  if(enemy.enemy.enemy.flame2.flame1 != null)
                  {
                     enemy.enemy.enemy.flame2.flame1.play();
                  }
                  enemy.enemy.enemy.flame2.flame2.play();
               }
            }
            if(enemy.enemy.laser != null)
            {
               enemy.enemy.laser.play();
               if(enemy.enemy.laser.flame1 != null)
               {
                  enemy.enemy.laser.flame1.play();
               }
            }
         }
      }
      
      public function fleeDone() : *
      {
         MovieClip(parent.parent).transition.gotoAndPlay(92);
         MovieClip(parent.parent).playerhp.visible = false;
         SoundManager.instance.playMusic(9);
      }
      
      override public function update() : *
      {
         var _loc1_:int = 0;
         _loc1_ = Math.random() * 4;
         if(_loc1_ == 0)
         {
            --y;
         }
         else if(_loc1_ == 1)
         {
            ++y;
         }
         if(!canMove)
         {
            return;
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
         if(!Player.instance.isRedFreeze && AIcounter <= 0)
         {
            AIcounter = AIcounterMax;
            AI();
         }
         switch(actionState)
         {
            case IDLE_STATE:
               break;
            case MOVE_STATE:
               doMove();
               if(fleeCounter > 0)
               {
                  immediateAI();
               }
               break;
            case ATTACK_STATE:
            case DIE_STATE:
            case DOWNED_STATE:
            case JUMP_STATE:
               break;
            case HURT_STATE:
               doHurt();
               break;
            case FLEE_STATE:
               doFlee();
         }
      }
      
      public function updateBossBar() : *
      {
         MovieClip(parent.parent).bosshp.hpbar.width = hp * 8;
         MovieClip(parent.parent).bosshp.hurtbar.width = maxhp * 8;
      }
      
      public function createHomingRocket(param1:int) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:Projectile = null;
         _loc2_ = 0;
         while(_loc2_ < param1)
         {
            _loc3_ = ProjectileManager.instance.createProjectile(Projectile_rocket_homing.typeCode,Math.random() * GameStage.stageWidth,-50,0,5);
            MovieClip(parent).addChild(_loc3_);
            _loc2_++;
         }
      }
      
      public function fireHomingRocketFromBack() : *
      {
         var _loc1_:Projectile = null;
         _loc1_ = ProjectileManager.instance.createProjectile(Projectile_rocket_homing.typeCode,x,y - 80,0,-5);
         MovieClip(parent).addChild(_loc1_);
      }
      
      internal function doMove() : *
      {
         var _loc1_:Boolean = false;
         if(!Player.instance.isRedFreeze)
         {
            if(enemy.currentFrame != 2)
            {
               enemy.gotoAndStop(2);
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
               dontShoot = false;
               moveToPlayerY();
            }
            if(fire45next && x > 0 && x < GameStage.stageWidth && (x < 100 || x > GameStage.stageWidth - 100) && y < 100)
            {
               facePlayer();
               enemy.gotoAndStop(5);
               actionState = ATTACK_STATE;
               dontShoot = false;
               fire45next = false;
            }
            if(y < -100)
            {
               y = -800;
               doIdle();
               fleeCounter = 5;
               dontShoot = false;
            }
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
      
      internal function doFlee() : *
      {
         if(x < 200)
         {
            x += 5;
         }
         else if(x > GameStage.stageWidth - 200)
         {
            x -= 5;
         }
         if(y < 150)
         {
            y += 5;
         }
         else if(y > 350)
         {
            y -= 5;
         }
      }
      
      public function initFlee() : *
      {
         gotoAndStop(2);
         enemy.gotoAndStop(16);
         InputManager.instance.disable();
         MovieClip(parent.parent).bosshp.visible = false;
         actionState = FLEE_STATE;
      }
      
      internal function doHurt() : *
      {
         if(enemy.currentFrame != 8)
         {
            facePlayer();
            enemy.gotoAndStop(8);
         }
      }
      
      public function createRocketDownFromTop() : *
      {
         var _loc1_:Projectile = null;
         var _loc2_:* = undefined;
         if(MountainStage.instance.getRandomPlatform() != null)
         {
            _loc2_ = 50;
            while(_loc2_ < 800)
            {
               if(Math.random() * 2 < 1)
               {
                  _loc1_ = ProjectileManager.instance.createProjectile(Projectile_rocket_down.typeCode,_loc2_,-Math.random() * 100,0,15);
                  MovieClip(parent).addChild(_loc1_);
               }
               _loc2_ += 100;
            }
         }
      }
      
      public function createFireBombFromTopRandom(param1:int) : *
      {
         var _loc2_:* = undefined;
         if(MountainStage.instance.getRandomPlatform() != null)
         {
            _loc2_ = 0;
            while(_loc2_ < param1)
            {
               ProjectileManager.instance.createProjectile(Projectile_firebomb.typeCode,MountainStage.instance.getRandomPlatform().x + Math.random() * 20 - 10,-50,Math.random() * 4 - 2,0);
               _loc2_++;
            }
         }
      }
      
      override public function hit(param1:int, param2:Array, param3:Array) : *
      {
         if(hp <= 0 || inVulCounter > 0 || !canMove || actionState == HURT_STATE || actionState == FRONTBOMB_STATE)
         {
            return;
         }
         if(!isOnScreen())
         {
            moveAgain();
         }
         else
         {
            actionState = HURT_STATE;
            --fleeCounter;
            --hp;
            SoundManager.instance.playHit();
            updateBossBar();
            inVulCounter = 25;
         }
      }
      
      public function createFireBombFromTop(param1:int) : *
      {
         ProjectileManager.instance.createProjectile(Projectile_firebomb.typeCode,param1,-50,Math.random() * 4 - 2,0);
      }
      
      internal function immediateAI() : *
      {
         if(Player.instance.isRedFreeze)
         {
            return;
         }
         if(!dontShoot && reloadCounter == 0 && Math.abs(y - (Player.instance.y - 50)) < 50)
         {
            facePlayer();
            actionState = ATTACK_STATE;
            enemy.gotoAndStop(4);
            reloadCounter = 24;
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
         if(enemy.enemy.jetpack != null)
         {
            enemy.enemy.jetpack.stop();
            if(enemy.enemy.jetpack.flame1 != null)
            {
               enemy.enemy.jetpack.flame1.stop();
            }
            if(enemy.enemy.jetpack.flame2 != null)
            {
               enemy.enemy.jetpack.flame2.stop();
            }
         }
         if(enemy.enemy.flame1 != null)
         {
            enemy.enemy.flame1.stop();
         }
         if(enemy.enemy.flame2 != null)
         {
            enemy.enemy.flame2.stop();
         }
         if(enemy.enemy.flame3 != null)
         {
            enemy.enemy.flame3.stop();
         }
         if(enemy.enemy.enemy != null)
         {
            enemy.enemy.enemy.stop();
            if(enemy.enemy.enemy.jetpack != null)
            {
               enemy.enemy.enemy.jetpack.stop();
               if(enemy.enemy.enemy.jetpack.flame1 != null)
               {
                  enemy.enemy.enemy.jetpack.flame1.stop();
               }
               if(enemy.enemy.enemy.jetpack.flame2 != null)
               {
                  enemy.enemy.enemy.jetpack.flame2.stop();
               }
            }
            if(enemy.enemy.enemy.flame1 != null)
            {
               enemy.enemy.enemy.flame1.stop();
               if(enemy.enemy.enemy.flame1.flame1 != null)
               {
                  enemy.enemy.enemy.flame1.flame1.stop();
               }
               enemy.enemy.enemy.flame1.flame2.stop();
            }
            if(enemy.enemy.enemy.flame2 != null)
            {
               enemy.enemy.enemy.flame2.stop();
               if(enemy.enemy.enemy.flame2.flame1 != null)
               {
                  enemy.enemy.enemy.flame2.flame1.stop();
               }
               enemy.enemy.enemy.flame2.flame2.stop();
            }
         }
         if(enemy.enemy.laser != null)
         {
            enemy.enemy.laser.stop();
            if(enemy.enemy.laser.flame1 != null)
            {
               enemy.enemy.laser.flame1.stop();
            }
         }
      }
      
      public function moveToPlayerY() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(Player.instance.x < GameStage.stageWidth / 2)
         {
            destinationX = GameStage.stageWidth / 2 + Math.random() * GameStage.stageWidth / 2;
         }
         else
         {
            destinationX = Math.random() * GameStage.stageWidth / 2;
         }
         destinationY = Player.instance.y - 50;
         prepFire45();
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
      
      internal function prepFire45() : *
      {
         if(formMode >= 2 && Math.random() * 5 < 1)
         {
            fire45next = true;
            dontShoot = true;
            destinationY = 50;
            if(Player.instance.x < GameStage.stageWidth / 2)
            {
               destinationX = GameStage.stageWidth - 50;
            }
            else
            {
               destinationX = 50;
            }
         }
      }
      
      public function endFrontBomb() : *
      {
         actionState = IDLE_STATE;
         createHomingRocket(3);
         enemy.gotoAndStop(1);
         x = tempxpos;
         y = tempypos;
      }
      
      public function flee() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         destinationX = Math.random() * GameStage.stageWidth;
         destinationY = -200;
         _loc1_ = Math.abs(x - destinationX);
         _loc2_ = Math.abs(destinationY - y);
         _loc3_ = Math.sqrt(_loc1_ * _loc1_ + _loc2_ * _loc2_);
         if(_loc3_ == 0)
         {
            _loc3_ = 1;
         }
         flyspeedx = _loc1_ * 15 / _loc3_;
         flyspeedy = _loc2_ * 15 / _loc3_;
         if(flyspeedx == 0 && destinationX != x)
         {
            flyspeedx = 1;
         }
         if(flyspeedy == 0 && destinationY != y)
         {
            flyspeedy = 1;
         }
         actionState = MOVE_STATE;
         ++formMode;
      }
   }
}

