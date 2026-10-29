package
{
   import flash.display.CapsStyle;
   import flash.display.JointStyle;
   import flash.display.LineScaleMode;
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2040")]
   public class Player extends MovieClip
   {
      
      public static var instance:MovieClip;
      
      internal var destinationX:int = 0;
      
      internal var destinationY:int = 0;
      
      internal var xvel:int = 0;
      
      public var winPaused:Boolean = false;
      
      internal var standingRange:int = 50;
      
      internal var gravity:int = 3;
      
      public var downSlashVictim:Enemy = null;
      
      public var redFreezeCounter:int = 0;
      
      internal var runSpeed:int = 20;
      
      public var isRedFreeze:Boolean = false;
      
      internal var yvel:int = 0;
      
      internal var falling:Boolean = false;
      
      public var isDowned:Boolean = false;
      
      public var bossFight:Boolean = false;
      
      internal var isDead:Boolean = false;
      
      internal var hasNextSlash:Boolean = false;
      
      public var isLaunched:Boolean = false;
      
      public var player:MovieClip;
      
      public var shunpoLaunchVictim:Enemy = null;
      
      internal var getHitTimer:int = 0;
      
      internal var arrayX2:Array = new Array();
      
      internal var hasSlash:Boolean = false;
      
      internal var arrayY2:Array = new Array();
      
      public var hp:int = StatsManager.maxhp;
      
      internal var shunpoCounter:int = 0;
      
      internal var arrayX:Array = new Array();
      
      internal var arrayY:Array = new Array();
      
      internal var powerMeterMax:int = 60 * 24;
      
      internal var walking:Boolean = false;
      
      internal var powerMeter:int = 10 * 24;
      
      public var combo:int = 0;
      
      internal var windowWidth:* = 720;
      
      public var gamePaused:Boolean = false;
      
      public var powerOn:Boolean = false;
      
      public var isScrolling:Boolean = false;
      
      public var isShunpo:Boolean = false;
      
      internal var walkSpeed:int = 2;
      
      public function Player()
      {
         super();
         addFrameScript(0,frame1,1,frame2);
         destinationX = this.x;
         destinationY = this.y;
         instance = this;
      }
      
      public static function createPlayer(param1:int, param2:int, param3:MovieClip) : Player
      {
         var _loc4_:* = undefined;
         _loc4_ = new Player();
         param3.playercanvas.addChild(_loc4_);
         _loc4_.setPosition(param1,param2);
         return _loc4_;
      }
      
      public function shouldDrawSmoke() : Boolean
      {
         return getDistance(arrayX[0],arrayY[0],arrayX[arrayX.length - 1],arrayY[arrayY.length - 1]) >= InputManager.instance.maxDistance - 20;
      }
      
      public function updateTravelmeter() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = GameStage.getStage().area - 1;
         _loc2_ = GameStage.getStage().totalAreas - 1;
         if(_loc1_ > _loc2_)
         {
            _loc1_ = _loc2_;
         }
         MovieClip(parent).pausemsg.travelmeter.indicator.x = _loc1_ / _loc2_ * 450;
      }
      
      public function checkEnemyWeaponHitPlayer(param1:MovieClip) : Boolean
      {
         if(player != null && param1 != null && player.hitTestObject(param1))
         {
            return gotHit();
         }
         return false;
      }
      
      internal function shunpo() : *
      {
         --shunpoCounter;
         if(shunpoCounter == 0)
         {
            shunpoEnd();
         }
      }
      
      public function shunpoStart() : *
      {
         SoundManager.instance.playSlash();
         ProjectileManager.instance.checkHit(arrayX,arrayY);
         EnemyManager.instance.checkHit(arrayX,arrayY);
         redrawSlash();
         isShunpo = true;
         hasSlash = false;
         shunpoCounter = 15;
         if(arrayX[0] < arrayX[8])
         {
            if(currentFrame != 1)
            {
               gotoAndStop(1);
            }
         }
         else if(currentFrame != 2)
         {
            gotoAndStop(2);
         }
         if(shunpoLaunchVictim != null)
         {
            shunpoCounter = 1;
            player.gotoAndStop(25);
         }
         else if(downSlashVictim != null)
         {
            if(downSlashVictim == Boss1.instance)
            {
               if(downSlashVictim.currentFrame == 1)
               {
                  gotoAndStop(1);
                  x = downSlashVictim.x;
               }
               else
               {
                  gotoAndStop(2);
                  x = downSlashVictim.x;
               }
               player.gotoAndStop(27);
            }
            else if(downSlashVictim.enemyType == 13)
            {
               if(downSlashVictim.currentFrame == 1 && currentFrame == 2)
               {
                  x = downSlashVictim.x - 125;
               }
               else if(downSlashVictim.currentFrame == 1 && currentFrame == 1)
               {
                  x = downSlashVictim.x - 145;
               }
               else if(downSlashVictim.currentFrame == 2 && currentFrame == 1)
               {
                  x = downSlashVictim.x + 125;
               }
               else if(downSlashVictim.currentFrame == 2 && currentFrame == 2)
               {
                  x = downSlashVictim.x + 145;
               }
               player.gotoAndStop(26);
            }
            else
            {
               if(downSlashVictim.currentFrame == 1 && currentFrame == 2)
               {
                  x = downSlashVictim.x - 20;
               }
               else if(downSlashVictim.currentFrame == 1 && currentFrame == 1)
               {
                  x = downSlashVictim.x - 40;
               }
               else if(downSlashVictim.currentFrame == 2 && currentFrame == 1)
               {
                  x = downSlashVictim.x + 20;
               }
               else if(downSlashVictim.currentFrame == 2 && currentFrame == 2)
               {
                  x = downSlashVictim.x + 40;
               }
               player.gotoAndStop(26);
            }
            y = downSlashVictim.y;
            destinationX = x;
            destinationY = y;
            xvel = 0;
         }
         else if(falling)
         {
            if(destinationY - y > 50)
            {
               player.gotoAndStop(13);
            }
            else
            {
               player.gotoAndStop(11);
            }
         }
         else if(destinationY - y > 50 && y < GameStage.groundY)
         {
            player.gotoAndStop(13);
         }
         else if(y - destinationY > 150 || Math.abs(destinationX - arrayX[arrayX.length - 1]) < 50)
         {
            player.gotoAndStop(12);
         }
         else
         {
            player.gotoAndStop(10);
         }
      }
      
      internal function doLaunch() : *
      {
         if(y >= GameStage.groundY)
         {
            y = GameStage.groundY;
            yvel = 0;
            if(player.currentFrame != 43)
            {
               player.gotoAndStop(43);
            }
            else if(player.player.currentFrame == 25)
            {
               isLaunched = false;
               isDowned = false;
               if(currentFrame == 1)
               {
                  x += 10;
               }
               else
               {
                  x -= 10;
               }
               destinationX = x;
               player.gotoAndStop(4);
            }
            else
            {
               isDowned = true;
            }
         }
         else
         {
            y += yvel;
            x += xvel;
            yvel += 1;
            if(yvel > 0 && player.currentFrame != 42)
            {
               player.gotoAndStop(42);
            }
         }
      }
      
      public function gotLaunched() : *
      {
         if(isLaunched && !isDowned)
         {
            if(currentFrame == 1)
            {
               gotoAndStop(2);
            }
            else
            {
               gotoAndStop(1);
            }
            yvel = -5;
            xvel = 0;
            if(player.currentFrame != 41)
            {
               player.gotoAndStop(41);
            }
            SoundManager.instance.playHit();
         }
         else if(!isLaunched)
         {
            isLaunched = true;
            yvel = -20;
            xvel = 0;
            y -= 10;
            if(player.currentFrame != 41)
            {
               player.gotoAndStop(41);
            }
            SoundManager.instance.playHit();
         }
      }
      
      public function updateCombo(param1:int) : *
      {
         combo += param1;
         if(combo > 1)
         {
            MovieClip(parent).hitcombocount.visible = true;
         }
         MovieClip(parent).hitcombocount.gotoAndPlay(1);
      }
      
      public function initSlash(param1:Array, param2:Array) : *
      {
         if(isDead)
         {
            return;
         }
         destinationX = param1[0];
         destinationY = param2[0];
         arrayX = param1.slice();
         arrayY = param2.slice();
         hasSlash = true;
         walking = false;
         hasNextSlash = false;
         if(powerOn)
         {
            powerMeter -= 48;
         }
         if(!isLaunched && Math.abs(destinationX - this.x) < standingRange)
         {
            shunpoStart();
         }
      }
      
      public function storeNextSlash(param1:Array, param2:Array) : *
      {
         arrayX2 = param1.slice();
         arrayY2 = param2.slice();
         hasNextSlash = true;
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         stop();
      }
      
      public function redFreeze() : *
      {
         if(hp > 0 && GameStage.currentStage == 2 && MountainStage.instance.noLand)
         {
            MountainStage.instance.notifyNoEnemiesLeft();
            EnemyManager.instance.killDying();
            return;
         }
         isRedFreeze = true;
         redFreezeCounter = 96;
         InputManager.instance.disable();
         EnemyManager.instance.stopAnimation();
         GameStage.getStage().redFreeze();
         ColorCode.makeDark(this,-255);
         MovieClip(parent).playerhp.visible = false;
         EnemyManager.instance.hideHPBar();
         MovieClip(parent).hitcombocount.visible = false;
      }
      
      public function gotLaunchedRight() : *
      {
         if(!isLaunched)
         {
            isLaunched = true;
            yvel = -20;
            xvel = 15;
            y -= 10;
            gotoAndStop(2);
            if(player.currentFrame != 41)
            {
               player.gotoAndStop(41);
            }
            SoundManager.instance.playHit();
         }
      }
      
      public function isNearGround() : int
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         if(y > GameStage.groundY - 150)
         {
            return GameStage.groundY;
         }
         _loc1_ = this.y;
         while(_loc1_ < this.y + 150)
         {
            if(MovieClip(root).ground.hitTestPoint(this.x,_loc1_,true))
            {
               _loc2_ = _loc1_;
               while(MovieClip(root).ground.hitTestPoint(this.x,_loc2_,true))
               {
                  _loc2_--;
               }
               return _loc2_;
            }
            _loc1_ += 20;
         }
         return -1;
      }
      
      internal function movement() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:MovieClip = null;
         if(isLaunched)
         {
            doLaunch();
            return;
         }
         this.x += xvel;
         this.y += yvel;
         yvel += gravity;
         if((Boolean(y >= GameStage.groundY) || Boolean(MovieClip(root).ground.hitTestPoint(this.x,this.y,true))) && yvel > 0)
         {
            this.yvel = 0;
            this.y -= gravity;
            _loc1_ = this.y;
            while(_loc1_ > GameStage.groundY || Boolean(MovieClip(root).ground.hitTestPoint(this.x,_loc1_,true)))
            {
               _loc1_--;
            }
            this.y = _loc1_;
            if(falling)
            {
               if(destinationX < x && xvel > 0 || destinationX > x && xvel < 0)
               {
                  stopMovement();
               }
               falling = false;
               if(xvel == 0 && player.currentFrame != 4)
               {
                  player.gotoAndStop(4);
               }
            }
         }
         else if(yvel > gravity)
         {
            falling = true;
            if(currentFrame == 1)
            {
               xvel = 5;
            }
            else
            {
               xvel = -5;
            }
            if(player.currentFrame != 5)
            {
               player.gotoAndStop(5);
            }
         }
         if(!falling)
         {
            if(!walking)
            {
               if(this.x - destinationX < -runSpeed)
               {
                  xvel = runSpeed;
                  if(currentFrame != 1)
                  {
                     gotoAndStop(1);
                  }
                  if(hasSlash && player.currentFrame != 6)
                  {
                     player.gotoAndStop(6);
                  }
                  else if(!hasSlash && player.currentFrame != 7)
                  {
                     player.gotoAndStop(7);
                  }
               }
               else if(this.x - destinationX > runSpeed)
               {
                  xvel = -runSpeed;
                  if(currentFrame != 2)
                  {
                     gotoAndStop(2);
                  }
                  if(hasSlash && player.currentFrame != 6)
                  {
                     player.gotoAndStop(6);
                  }
                  else if(!hasSlash && player.currentFrame != 7)
                  {
                     player.gotoAndStop(7);
                  }
               }
               else if(hasSlash)
               {
                  shunpoStart();
               }
               else
               {
                  stopMovement();
                  if(player.currentFrame != 1 && player.currentFrame != 3 && player.currentFrame != 4 && player.currentFrame != 25 && player.currentFrame != 26 && player.currentFrame != 27)
                  {
                     player.gotoAndStop(1);
                  }
               }
            }
            else if(this.x - destinationX < -walkSpeed)
            {
               xvel = walkSpeed;
               if(currentFrame != 1)
               {
                  gotoAndStop(1);
               }
               if(player.currentFrame != 2)
               {
                  player.gotoAndStop(2);
               }
            }
            else if(this.x - destinationX > walkSpeed)
            {
               xvel = -walkSpeed;
               if(currentFrame != 2)
               {
                  gotoAndStop(2);
               }
               if(player.currentFrame != 2)
               {
                  player.gotoAndStop(2);
               }
            }
            else
            {
               stopMovement();
               if(player.currentFrame != 1 && player.currentFrame != 3 && player.currentFrame != 4 && player.currentFrame != 25 && player.currentFrame != 26 && player.currentFrame != 27)
               {
                  player.gotoAndStop(1);
               }
            }
         }
         else if(hasSlash && Math.abs(this.x - destinationX) <= runSpeed)
         {
            shunpoStart();
         }
         if(this.x < 0)
         {
            this.x = 0;
         }
         else if(this.x > windowWidth)
         {
            this.x = windowWidth;
         }
         if(this.y > GameStage.groundY)
         {
            this.y = GameStage.groundY;
         }
         if(GameStage.currentStage == 2)
         {
            if(this.y > 600)
            {
               if(hp > 0)
               {
                  _loc2_ = MountainStage.instance.getClosestPlatform();
                  if(_loc2_ == null)
                  {
                     yvel = -50;
                  }
                  else
                  {
                     yvel = 0;
                     xvel = 0;
                     x = _loc2_.x;
                     y = _loc2_.y - 50;
                     destinationX = x;
                     destinationY = y + 50;
                     hasSlash = false;
                     MovieClip(root).canvas.graphics.clear();
                     MovieClip(root).canvas.graphics.moveTo(x,y);
                  }
               }
            }
         }
      }
      
      public function updateHPBar() : *
      {
         MovieClip(parent).playerhp.hpbar.width = (hp + 1) * 2;
         MovieClip(parent).playerhp.powerbar.width = powerMeter / 10;
      }
      
      public function update() : *
      {
         if(isDead)
         {
            return;
         }
         if(isRedFreeze)
         {
            --redFreezeCounter;
            if(redFreezeCounter == 48)
            {
               EnemyManager.instance.killDying();
            }
            else if(redFreezeCounter == 36)
            {
               GameStage.getStage().nextArea();
            }
            else if(redFreezeCounter == 0)
            {
               unRedFreeze();
            }
         }
         if(isScrolling)
         {
            if(currentFrame != 1)
            {
               gotoAndStop(1);
            }
            if(GameStage.currentStage == 2 && MountainStage.instance.noLand && !MountainStage.instance.noLandTransition)
            {
               if(player.currentFrame != 1)
               {
                  player.gotoAndStop(1);
               }
            }
            else
            {
               if(GameStage.getStage().scrollCounter > 10 && player.currentFrame != 7)
               {
                  player.gotoAndStop(7);
               }
               else if(GameStage.getStage().scrollCounter <= 10 && player.currentFrame != 20)
               {
                  player.gotoAndStop(20);
               }
               if(x > 150 && GameStage.getStage().playerGotoLeft)
               {
                  setPosition(x - 15,GameStage.groundY);
               }
            }
         }
         else if(isShunpo)
         {
            shunpo();
         }
         else
         {
            movement();
         }
         if(getHitTimer > 0)
         {
            --getHitTimer;
         }
         if(powerOn)
         {
            --powerMeter;
            updateHPBar();
            if(powerMeter <= 0)
            {
               activatePower();
               powerMeter = 0;
            }
         }
      }
      
      public function stopMovement() : *
      {
         xvel = 0;
         this.destinationX = x;
         this.destinationY = y;
         shunpoCounter = 0;
         isShunpo = false;
      }
      
      public function unRedOnly() : *
      {
         GameStage.getStage().unRedFreeze();
         ColorCode.clearFilter(this);
      }
      
      internal function getDistanceSQ(param1:int, param2:int, param3:int, param4:int) : int
      {
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         _loc5_ = Math.abs(param1 - param3);
         _loc6_ = Math.abs(param2 - param4);
         return _loc5_ * _loc5_ + _loc6_ * _loc6_;
      }
      
      public function pauseGame() : *
      {
         if(winPaused)
         {
            return;
         }
         if(powerOn)
         {
            activatePower();
         }
         if(gamePaused)
         {
            gamePaused = false;
            MovieClip(parent).pausemsg.visible = false;
            if(!isRedFreeze)
            {
               EnemyManager.instance.continueAnimation();
               ProjectileManager.instance.continueAnimation();
               InputManager.instance.enable();
               GameStage.getStage().clearFilterAll();
               EnemyManager.instance.clearFilterAll();
               ProjectileManager.instance.clearFilterAll();
               ColorCode.clearFilter(this);
            }
            if(player.player != null)
            {
               player.player.play();
               if(player.player.dashcloud1 != null)
               {
                  Player.instance.player.player.dashcloud1.play();
               }
               if(player.player.dashcloud2 != null)
               {
                  Player.instance.player.player.dashcloud2.play();
               }
            }
         }
         else
         {
            gamePaused = true;
            MovieClip(parent).pausemsg.visible = true;
            updateTravelmeter();
            if(!isRedFreeze)
            {
               EnemyManager.instance.stopAnimation();
               ProjectileManager.instance.stopAnimation();
               InputManager.instance.disable();
               GameStage.getStage().desaturateAll();
               EnemyManager.instance.desaturateAll();
               ProjectileManager.instance.desaturateAll();
               ColorCode.desaturate(this);
            }
            if(player.player != null)
            {
               player.player.stop();
               if(player.player.dashcloud1 != null)
               {
                  Player.instance.player.player.dashcloud1.stop();
               }
               if(player.player.dashcloud2 != null)
               {
                  Player.instance.player.player.dashcloud2.stop();
               }
            }
         }
      }
      
      public function updateScore(param1:int) : *
      {
         if(combo > 0)
         {
            StatsManager.score += param1 * combo;
         }
         else
         {
            StatsManager.score += param1;
            if(StatsManager.score < 0)
            {
               StatsManager.score = 0;
            }
         }
         MovieClip(parent).score.score.text = "score " + StatsManager.score.toString();
      }
      
      public function dieContinue() : *
      {
         hp = StatsManager.maxhp;
         isDead = false;
         y = -50;
         unRedFreeze();
         MovieClip(parent).diedDialog.visible = false;
         InputManager.instance.enable();
         updateHPBar();
         MovieClip(parent).stage.frameRate = 24;
      }
      
      public function increasePowerMeter(param1:int) : *
      {
         powerMeter += param1 * 12;
         if(powerMeter > powerMeterMax)
         {
            powerMeter = powerMeterMax;
         }
         updateHPBar();
      }
      
      public function initMoveTo(param1:int, param2:int) : *
      {
         if(isDead)
         {
            return;
         }
         destinationX = param1;
         destinationY = param2;
         hasSlash = false;
         walking = GameStage.currentStage != 4 && Math.abs(this.x - destinationX) < 100;
      }
      
      public function shunpoEnd() : *
      {
         var _loc1_:* = undefined;
         ++StatsManager.slashes;
         ProjectileManager.instance.checkHit(arrayX,arrayY);
         EnemyManager.instance.checkHit(arrayX,arrayY);
         EnemyManager.instance.updateHPBar();
         EnemyManager.instance.resetGotHit();
         isShunpo = false;
         MovieClip(root).slashcanvas.graphics.clear();
         InputManager.instance.drawNextSlash();
         if(downSlashVictim == null)
         {
            setPosition(arrayX[arrayX.length - 1],arrayY[arrayY.length - 1]);
            yvel = 1;
            if(arrayX[arrayX.length - 1] > arrayX[arrayX.length - 8])
            {
               xvel = runSpeed / 4;
               if(currentFrame != 1)
               {
                  gotoAndStop(1);
               }
            }
            else
            {
               xvel = -runSpeed / 4;
               if(currentFrame != 2)
               {
                  gotoAndStop(2);
               }
            }
            _loc1_ = isNearGround();
            if(_loc1_ != -1)
            {
               setPosition(x,_loc1_);
               player.gotoAndStop(3);
            }
            else
            {
               player.gotoAndStop(5);
            }
         }
         if(shunpoLaunchVictim != null)
         {
            if(player.currentFrame != 25)
            {
               player.gotoAndStop(25);
            }
            x = shunpoLaunchVictim.x;
            destinationX = x;
            ++StatsManager.enemiesLaunched;
            Player.instance.updateScore(10);
         }
         else if(downSlashVictim != null)
         {
            ++StatsManager.enemiesStabbed;
            Player.instance.updateScore(10);
         }
         shunpoLaunchVictim = null;
         downSlashVictim = null;
         if(x < 0)
         {
            setPosition(0,y);
         }
         else if(x > 720)
         {
            setPosition(720,y);
         }
         if(hasNextSlash)
         {
            initSlash(arrayX2,arrayY2);
         }
         else
         {
            arrayX = new Array();
            arrayY = new Array();
         }
         if(!powerOn)
         {
            if(GameStage.getStage().enemiesInWaiting <= 0 && EnemyManager.instance.countAlive() == EnemyManager.instance.countDying())
            {
               if(bossFight)
               {
                  GameStage.getStage().winBossFight();
               }
               else
               {
                  redFreeze();
               }
            }
            else
            {
               EnemyManager.instance.killDying();
            }
         }
      }
      
      internal function getDistance(param1:int, param2:int, param3:int, param4:int) : int
      {
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         _loc5_ = Math.abs(param1 - param3);
         _loc6_ = Math.abs(param2 - param4);
         return Math.sqrt(_loc5_ * _loc5_ + _loc6_ * _loc6_);
      }
      
      public function gotHit() : Boolean
      {
         if(!isShunpo && !isScrolling && getHitTimer == 0 && !isRedFreeze)
         {
            getHitTimer = 12;
            --hp;
            updateHPBar();
            ++StatsManager.hitsTaken;
            if(StatsManager.maxCombo < combo)
            {
               StatsManager.maxCombo = combo;
            }
            combo = 0;
            MovieClip(parent).hitcombocount.visible = false;
            MovieClip(parent).hurtcolor.gotoAndPlay(2);
            MovieClip(parent).playerhp.portrait.gotoAndPlay(2);
            if(hp <= 0)
            {
               ++StatsManager.deaths;
               isDead = true;
               this.y = GameStage.groundY;
               player.gotoAndStop(15);
               redFreeze();
               MovieClip(parent).diedDialog.visible = true;
               MovieClip(parent).trackDied();
            }
            return true;
         }
         return false;
      }
      
      public function winPause() : *
      {
         gamePaused = true;
         winPaused = true;
         EnemyManager.instance.stopAnimation();
         ProjectileManager.instance.stopAnimation();
         InputManager.instance.disable();
         GameStage.getStage().desaturateAll();
         EnemyManager.instance.desaturateAll();
         ProjectileManager.instance.desaturateAll();
         ColorCode.desaturate(this);
         if(player.player != null)
         {
            player.player.stop();
            if(player.player.dashcloud1 != null)
            {
               Player.instance.player.player.dashcloud1.stop();
            }
            if(player.player.dashcloud2 != null)
            {
               Player.instance.player.player.dashcloud2.stop();
            }
         }
      }
      
      public function gotArrowHit(param1:Projectile) : *
      {
         if(!isShunpo && !isScrolling && getHitTimer == 0)
         {
            getHitTimer = 12;
            --hp;
            updateHPBar();
            ++StatsManager.hitsTaken;
            if(StatsManager.maxCombo < combo)
            {
               StatsManager.maxCombo = combo;
            }
            combo = 0;
            MovieClip(parent).hitcombocount.visible = false;
            MovieClip(parent).hurtcolor.gotoAndPlay(2);
            MovieClip(parent).playerhp.portrait.gotoAndPlay(2);
            if(hp <= 0)
            {
               ++StatsManager.deaths;
               this.y = GameStage.groundY;
               this.player.gotoAndStop(16);
               isDead = true;
               if(param1.getVelX() < 0)
               {
                  this.gotoAndStop(1);
               }
               else
               {
                  this.gotoAndStop(2);
               }
               param1.visible = false;
               redFreeze();
               MovieClip(parent).diedDialog.visible = true;
               MovieClip(parent).trackDied();
               return false;
            }
            return true;
         }
         return false;
      }
      
      internal function centerPlayer() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = 5;
         if(x - 360 > _loc1_)
         {
            GameStage.getStage().scrollRight(_loc1_);
            destinationX -= _loc1_;
            x -= _loc1_;
         }
         else if(x - 360 < -_loc1_)
         {
            GameStage.getStage().scrollRight(-_loc1_);
            destinationX += _loc1_;
            x += _loc1_;
         }
      }
      
      public function isGrounded() : Boolean
      {
         if(!isShunpo && !falling && (yvel == 0 || yvel == gravity))
         {
            return true;
         }
         return false;
      }
      
      public function setPosition(param1:int, param2:int) : *
      {
         this.x = param1;
         this.y = param2;
         xvel = 0;
         yvel = 0;
         this.destinationX = param1;
         this.destinationY = param2;
      }
      
      public function redrawSlash() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         _loc1_ = InputManager.instance.maxDistance;
         _loc2_ = _loc1_;
         MovieClip(root).canvas.graphics.clear();
         MovieClip(root).canvas.graphics.moveTo(arrayX[arrayX.length - 1],arrayY[arrayY.length - 1]);
         MovieClip(root).slashcanvas.graphics.clear();
         MovieClip(root).slashcanvas.graphics.moveTo(arrayX[0],arrayY[0]);
         _loc3_ = 1;
         while(_loc3_ <= arrayX.length - 1)
         {
            _loc4_ = getDistance(arrayX[_loc3_ - 1],arrayY[_loc3_ - 1],arrayX[_loc3_],arrayY[_loc3_]);
            MovieClip(root).slashcanvas.graphics.lineStyle(9 - 9 * ((_loc1_ - _loc2_) / _loc1_),13421772,1,false,LineScaleMode.NONE,CapsStyle.ROUND,JointStyle.ROUND,3);
            MovieClip(root).slashcanvas.graphics.lineTo(arrayX[_loc3_],arrayY[_loc3_]);
            _loc2_ -= _loc4_;
            _loc3_++;
         }
      }
      
      public function activatePower() : *
      {
         if(gamePaused)
         {
            return;
         }
         if(powerOn)
         {
            powerOn = false;
            SoundManager.instance.powerOff();
            GameStage.getStage().clearFilterAll();
            EnemyManager.instance.clearFilterAll();
            ProjectileManager.instance.clearFilterAll();
            EnemyManager.instance.continueAnimation();
            ProjectileManager.instance.continueAnimation();
            if(GameStage.getStage().enemiesInWaiting == 0 && EnemyManager.instance.countAlive() == EnemyManager.instance.countDying())
            {
               if(bossFight)
               {
                  GameStage.getStage().winBossFight();
               }
               else
               {
                  redFreeze();
               }
            }
            else
            {
               EnemyManager.instance.killDying();
            }
         }
         else if(!isScrolling && powerMeter > 0 && !isRedFreeze)
         {
            powerOn = true;
            SoundManager.instance.powerOn();
            GameStage.getStage().desaturateAll();
            EnemyManager.instance.desaturateAll();
            ProjectileManager.instance.desaturateAll();
            EnemyManager.instance.stopAnimation();
            ProjectileManager.instance.stopAnimation();
         }
      }
      
      public function isFacingLeft() : Boolean
      {
         return this.currentFrame == 2;
      }
      
      public function unRedFreeze() : *
      {
         isRedFreeze = false;
         GameStage.getStage().unRedFreeze();
         ColorCode.clearFilter(this);
         MovieClip(parent).playerhp.visible = true;
         EnemyManager.instance.continueAnimation();
      }
   }
}

