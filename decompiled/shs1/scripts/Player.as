package
{
   import flash.display.CapsStyle;
   import flash.display.JointStyle;
   import flash.display.LineScaleMode;
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol476")]
   public class Player extends MovieClip
   {
      
      public static var instance:MovieClip;
      
      public static const groundY:* = 350;
      
      public static var stageMode:int = 0;
      
      internal var destinationX:int = 0;
      
      internal var destinationY:int = 0;
      
      internal var shunpoJump:Boolean = false;
      
      internal var isShunPo:Boolean = false;
      
      public var keyScrollLeft:* = false;
      
      internal var standingRange:int = 100;
      
      internal var arrowPower:int = 0;
      
      internal var runSpeed:int = 20;
      
      internal var aimAngle:* = 0;
      
      internal var PAUSE_MOVE:* = 3;
      
      internal var clickThreshhold:int = 5;
      
      internal var isDead:Boolean = false;
      
      public var player:MovieClip;
      
      internal var NORMAL:* = 0;
      
      internal var getHitTimer:int = 0;
      
      internal var hasSlash:Boolean = false;
      
      internal var shunpoCounter:int = -1;
      
      internal var arrayY:Array = new Array();
      
      internal var arrayX:Array = new Array();
      
      internal var STAGEEND:* = 1;
      
      internal var isRunning:Boolean = false;
      
      internal var arrayX_temp:Array = new Array();
      
      internal var oldMouseX:int = 0;
      
      internal var oldMouseY:int = 0;
      
      public var keyScrollRight:* = false;
      
      internal var fallingCounter:int = -1;
      
      internal const gameStageBorder:* = 30;
      
      internal var maxDistance:int = 300;
      
      internal const scrollSpeed:* = 15;
      
      internal var arrowCharging:Boolean = false;
      
      internal var aimingArrow:Boolean = false;
      
      internal var distanceLeft:int = 0;
      
      internal var arrayY_temp:Array = new Array();
      
      internal var fallingCounterMax:int = 15;
      
      internal const windowWidth:* = 720;
      
      internal var shunpoCounterMax:int = 20;
      
      internal var PAUSE:* = 2;
      
      internal var isFalling:Boolean = false;
      
      internal var walkSpeed:int = 3;
      
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
         _loc4_.x = param1;
         _loc4_.y = param2;
         _loc4_.destinationX = param1;
         _loc4_.destinationY = param2;
         instance = _loc4_;
         return _loc4_;
      }
      
      public function getAimAngle() : *
      {
         return aimAngle;
      }
      
      public function shouldDrawSmoke() : Boolean
      {
         return getDistance(arrayX[0],arrayY[0],arrayX[arrayX.length - 1],arrayY[arrayY.length - 1]) >= maxDistance - 20;
      }
      
      public function mouseUp(param1:int, param2:int, param3:MovieClip, param4:Boolean) : *
      {
         if(Player.stageMode == 2 || Player.stageMode == 1 || !param4)
         {
            return;
         }
         if(aimingArrow)
         {
            arrowCharging = false;
            if(this.player.currentFrame == 21)
            {
               fireArrow();
            }
         }
         else
         {
            hasSlash = arrayX_temp.length > clickThreshhold || getDistance(arrayX_temp[0],arrayY_temp[0],arrayX_temp[arrayX_temp.length - 1],arrayY_temp[arrayY_temp.length - 1]) > 10;
            if(!hasSlash)
            {
               destinationX = param1;
               destinationY = param2;
               param3.graphics.clear();
               param3.graphics.moveTo(param1,param2);
               isRunning = false;
            }
            else
            {
               destinationX = arrayX_temp[0];
               destinationY = arrayY_temp[0];
               arrayX = arrayX_temp.slice();
               arrayY = arrayY_temp.slice();
               isRunning = Math.abs(destinationX - this.x) > standingRange;
            }
         }
      }
      
      public function checkEnemyWeaponHitPlayer(param1:MovieClip) : *
      {
         if(player != null && param1 != null && player.hitTestObject(param1))
         {
            gotHit();
         }
      }
      
      public function getAimingArrow() : Boolean
      {
         return aimingArrow;
      }
      
      internal function frame2() : *
      {
         stop();
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      public function setArrowPower(param1:*) : *
      {
         arrowPower = param1;
      }
      
      public function getIsRunning() : Boolean
      {
         return isRunning;
      }
      
      public function unpauseGame() : *
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
      
      public function centrePlayerScroll() : *
      {
         var _loc1_:* = undefined;
         if(isShunPo)
         {
            return;
         }
         _loc1_ = this.x - windowWidth / 2;
         if(_loc1_ > 10)
         {
            _loc1_ = 10;
         }
         else if(_loc1_ < -10)
         {
            _loc1_ = -10;
         }
         MovieClip(parent.parent).gameStage.x = MovieClip(parent.parent).gameStage.x - _loc1_;
         MovieClip(this.parent).x = MovieClip(this.parent).x - _loc1_;
      }
      
      public function drawSlash() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         MovieClip(root).canvas.graphics.clear();
         MovieClip(root).canvas.graphics.moveTo(mouseX,mouseY);
         _loc1_ = maxDistance;
         MovieClip(root).slashcanvas.graphics.moveTo(arrayX[0],arrayY[0]);
         _loc2_ = 1;
         while(_loc2_ <= arrayX.length - 1)
         {
            _loc3_ = getDistance(arrayX[_loc2_ - 1],arrayY[_loc2_ - 1],arrayX[_loc2_],arrayY[_loc2_]);
            MovieClip(root).slashcanvas.graphics.lineStyle(10 - 10 * ((maxDistance - _loc1_) / maxDistance),13421772,1,false,LineScaleMode.NONE,CapsStyle.ROUND,JointStyle.ROUND,3);
            MovieClip(root).slashcanvas.graphics.lineTo(arrayX[_loc2_],arrayY[_loc2_]);
            _loc1_ -= _loc3_;
            _loc2_++;
         }
      }
      
      public function deathAnim() : *
      {
         if(Math.random() * 2 < 1)
         {
            this.gotoAndStop(1);
         }
         else
         {
            this.gotoAndStop(2);
         }
         this.player.gotoAndStop(15);
      }
      
      public function centrePlayer() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = this.x - windowWidth / 2;
         MovieClip(parent.parent).gameStage.x = MovieClip(parent.parent).gameStage.x - _loc1_;
         MovieClip(this.parent).x = MovieClip(this.parent).x - _loc1_;
         MovieClip(parent.parent).stagebg1.x = MovieClip(parent.parent).stagebg1.x - _loc1_;
         MovieClip(parent.parent).stagebg2.x = MovieClip(parent.parent).stagebg2.x - _loc1_ / 3;
      }
      
      public function movement(param1:Boolean) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         if(isFalling)
         {
            return;
         }
         _loc2_ = walkSpeed;
         _loc3_ = walkSpeed;
         if(isRunning)
         {
            _loc3_ = runSpeed;
            _loc2_ = standingRange;
         }
         _loc4_ = hasSlash && !isRunning;
         if(!_loc4_ && this.x - destinationX < -_loc2_)
         {
            this.x += _loc3_;
            if(_loc3_ == runSpeed && player.currentFrame != 6 && !isShunPo)
            {
               player.gotoAndStop(6);
            }
            else if(_loc3_ != runSpeed && player.currentFrame != 2 && !isShunPo)
            {
               player.gotoAndStop(2);
            }
         }
         else if(!_loc4_ && this.x - destinationX > _loc2_)
         {
            this.x -= _loc3_;
            if(_loc3_ == runSpeed && player.currentFrame != 6 && !isShunPo)
            {
               player.gotoAndStop(6);
            }
            else if(_loc3_ != runSpeed && player.currentFrame != 2 && !isShunPo)
            {
               player.gotoAndStop(2);
            }
         }
         else
         {
            this.x = destinationX;
            if(!hasSlash)
            {
               if(!isShunPo && player.currentFrame != 1 && player.currentFrame != 3 && player.currentFrame != 4)
               {
                  player.gotoAndStop(1);
               }
            }
            else if(!isShunPo)
            {
               isShunPo = true;
               isRunning = false;
               hasSlash = false;
               _loc5_ = destinationX - arrayX[0];
               _loc6_ = 0;
               while(_loc6_ <= arrayX.length - 1)
               {
                  arrayX[_loc6_] += _loc5_;
                  _loc6_++;
               }
               if(this.y - destinationY > 150)
               {
                  player.gotoAndStop(11);
                  shunpoJump = true;
               }
               else
               {
                  player.gotoAndStop(10);
               }
               SoundManager.instance.playSlash();
               shunpoCounter = shunpoCounterMax;
               EnemyManager.instance.reactShunpo(arrayX,arrayY);
               EnemyManager.instance.checkHit(arrayX,arrayY);
               ProjectileManager.instance.checkHit(arrayX,arrayY);
            }
         }
      }
      
      public function update(param1:Boolean, param2:int, param3:int) : *
      {
         ++StatsManager.instance.timing;
         if(isDead)
         {
            return;
         }
         if(stageMode != STAGEEND)
         {
            if(keyScrollLeft)
            {
               scrollGameStage(param1,0,0);
            }
            else if(keyScrollRight)
            {
               scrollGameStage(param1,windowWidth,0);
            }
            else
            {
               scrollGameStage(param1,param2,param3);
            }
         }
         if(stageMode == NORMAL || stageMode == PAUSE_MOVE)
         {
            if(!aimingArrow)
            {
               movement(param1);
               facing();
            }
            else
            {
               getAimingAngle(param2,param3);
               if(arrowCharging)
               {
                  if(this.player.currentFrame == 21)
                  {
                     this.player.player.aimtop.nextFrame();
                  }
               }
            }
            if(getHitTimer > 0)
            {
               --getHitTimer;
            }
            if(isShunPo && shunpoCounter > 0)
            {
               --shunpoCounter;
            }
            else if(shunpoCounter == 0)
            {
               shunpoCounter = -1;
               shunpoEnd();
               trace("forced shunpo end");
            }
            if(isFalling && fallingCounter > 0)
            {
               --fallingCounter;
            }
            else if(fallingCounter == 0)
            {
               fallingCounter = -1;
               land();
               trace("forced land");
            }
         }
      }
      
      public function getShunpoDestination() : Point
      {
         return new Point(arrayX[arrayX.length - 1],arrayY[arrayY.length - 1]);
      }
      
      public function mouseDown(param1:int, param2:int, param3:MovieClip) : *
      {
         if(aimingArrow)
         {
            arrowCharging = true;
         }
         else
         {
            param3.graphics.clear();
            param3.x = 0;
            arrayX_temp = new Array();
            arrayY_temp = new Array();
            arrayX_temp.push(param1);
            arrayY_temp.push(param2);
            param3.graphics.moveTo(param1,param2);
            oldMouseX = param1;
            oldMouseY = param2;
            distanceLeft = maxDistance;
         }
      }
      
      public function gotBallHit(param1:Projectile) : *
      {
         var _loc2_:* = undefined;
         if(!isShunPo && getHitTimer == 0)
         {
            displayScoreMessage("");
            getHitTimer = 12;
            _loc2_ = StatsManager.instance.getChanceToDeflect();
            if(Math.random() * 100 > _loc2_)
            {
               --StatsManager.instance.hp;
               StatsManager.instance.displayHP();
               if(StatsManager.instance.hp <= 0)
               {
                  this.y = groundY;
                  this.player.gotoAndStop(15);
                  isDead = true;
                  if(param1.getVelX() < 0)
                  {
                     this.gotoAndStop(1);
                  }
                  else
                  {
                     this.gotoAndStop(2);
                  }
                  EnemyManager.instance.playerDie();
               }
               else
               {
                  MovieClip(this.parent.parent).transition.transition.gotoAndPlay(150);
               }
            }
            return true;
         }
         return false;
      }
      
      public function getDestination() : Point
      {
         return new Point(destinationX,destinationY);
      }
      
      public function displayScoreMessage(param1:String) : *
      {
         MovieClip(this.parent.parent).scoremessage.text = param1;
      }
      
      public function pauseGame() : *
      {
         if(player.player != null)
         {
            player.player.stop();
         }
         if(player.player.dashcloud1 != null)
         {
            Player.instance.player.player.dashcloud1.stop();
         }
         if(player.player.dashcloud2 != null)
         {
            Player.instance.player.player.dashcloud2.stop();
         }
      }
      
      public function getAimingAngle(param1:int, param2:int) : *
      {
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         if(instance.player.currentFrame != 21)
         {
            return;
         }
         _loc3_ = new Point(this.player.player.aimtop.x,this.player.player.aimtop.y);
         _loc3_ = this.player.player.localToGlobal(_loc3_);
         _loc4_ = param1 - _loc3_.x;
         _loc5_ = param2 - _loc3_.y + 20;
         if(_loc4_ > 0)
         {
            this.gotoAndStop(1);
         }
         else if(_loc4_ < 0)
         {
            this.gotoAndStop(2);
         }
         if(this.currentFrame == 1)
         {
            _loc6_ = -Math.atan2(_loc5_,_loc4_) * 180 / Math.PI;
            if(_loc6_ > 50)
            {
               _loc6_ = 50;
            }
            else if(_loc6_ < -20)
            {
               _loc6_ = -20;
            }
            this.player.player.aimtop.rotation = _loc6_;
            aimAngle = _loc6_;
         }
         else
         {
            _loc6_ = Math.atan2(_loc5_,_loc4_) * 180 / Math.PI + 180;
            if(_loc6_ > 50 && _loc6_ < 200)
            {
               _loc6_ = 50;
            }
            else if(_loc6_ < 340 && _loc6_ > 60)
            {
               _loc6_ = 340;
            }
            this.player.player.aimtop.rotation = _loc6_;
            aimAngle = _loc6_;
         }
      }
      
      public function drawLine(param1:Boolean, param2:int, param3:int, param4:MovieClip) : *
      {
         var _loc5_:* = undefined;
         if(param1 && distanceLeft > 0 && !isShunPo && !aimingArrow && Player.stageMode != 2 && Player.stageMode != 1)
         {
            _loc5_ = getDistance(oldMouseX,oldMouseY,param2,param3);
            param4.graphics.lineStyle(9 - 9 * ((maxDistance - distanceLeft) / maxDistance),10027008,1,false,LineScaleMode.NONE,CapsStyle.ROUND,JointStyle.ROUND,3);
            param4.graphics.lineTo(param2,param3);
            distanceLeft -= _loc5_;
            if(param2 != oldMouseX || param3 != oldMouseY)
            {
               arrayX_temp.push(param2);
               arrayY_temp.push(param3);
            }
            oldMouseX = param2;
            oldMouseY = param3;
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
      
      public function getIsShunpo() : Boolean
      {
         return isShunPo;
      }
      
      public function shunpoEnd() : *
      {
         MovieClip(root).slashcanvas.graphics.clear();
         getEnemyManager().checkHit(arrayX,arrayY);
         ProjectileManager.instance.checkHit(arrayX,arrayY);
         if(stageMode != 2)
         {
            EnemyManager.instance.checkDeath();
         }
         if(arrayX[arrayX.length - 1] > arrayX[arrayX.length - 8])
         {
            this.gotoAndStop(1);
         }
         else
         {
            this.gotoAndStop(2);
         }
         this.x = arrayX[arrayX.length - 1];
         if(this.x < 50)
         {
            this.x = 50;
         }
         else if(this.x > windowWidth - 50)
         {
            this.x = windowWidth - 50;
         }
         isFalling = arrayY[arrayY.length - 1] < 140 && !shunpoJump;
         destinationX = this.x;
         destinationY = this.y;
         if(isFalling)
         {
            fallingCounter = fallingCounterMax;
            player.gotoAndStop(5);
            this.y = arrayY[arrayY.length - 1];
         }
         else if(shunpoJump)
         {
            land();
         }
         else
         {
            player.gotoAndStop(3);
         }
         shunpoJump = false;
         isShunPo = false;
         arrayX = new Array();
         arrayY = new Array();
         ++StatsManager.instance.slashCount;
      }
      
      public function gotHit() : *
      {
         var _loc1_:* = undefined;
         if(!isShunPo && getHitTimer == 0)
         {
            displayScoreMessage("");
            getHitTimer = 12;
            _loc1_ = StatsManager.instance.getChanceToDeflect();
            if(Math.random() * 100 > _loc1_)
            {
               --StatsManager.instance.hp;
               if(StatsManager.instance.location == 101)
               {
                  --StatsManager.instance.hp;
               }
               StatsManager.instance.displayHP();
               if(StatsManager.instance.hp <= 0)
               {
                  isDead = true;
                  pauseGame();
                  this.y = groundY;
                  EnemyManager.instance.playerDie();
               }
               else
               {
                  MovieClip(this.parent.parent).transition.transition.gotoAndPlay(150);
               }
            }
            else
            {
               displayScoreMessage("Dodged enemy hit");
            }
         }
      }
      
      public function getEnemyManager() : EnemyManager
      {
         return EnemyManager.instance;
      }
      
      public function gotArrowHit(param1:Projectile) : *
      {
         var _loc2_:* = undefined;
         if(!isShunPo && getHitTimer == 0)
         {
            displayScoreMessage("");
            getHitTimer = 12;
            _loc2_ = StatsManager.instance.getChanceToDeflect();
            if(Math.random() * 100 > _loc2_)
            {
               --StatsManager.instance.hp;
               StatsManager.instance.displayHP();
               if(StatsManager.instance.hp <= 0)
               {
                  this.y = groundY;
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
                  EnemyManager.instance.playerDieArrow();
               }
               else
               {
                  MovieClip(this.parent.parent).transition.transition.gotoAndPlay(150);
               }
               return true;
            }
            displayScoreMessage("Dodged arrow");
            return false;
         }
         return false;
      }
      
      public function fireArrow() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:Enemy = null;
         var _loc8_:* = undefined;
         this.player.gotoAndStop(23);
         _loc1_ = MovieClip(StageManager.instance.gameStage).globalToLocal(new Point(this.x,this.y));
         if(this.currentFrame == 1)
         {
            _loc1_.x += 10;
         }
         else
         {
            _loc1_.x -= 10;
         }
         _loc2_ = arrowPower * 4;
         _loc3_ = aimAngle;
         _loc4_ = _loc2_ * Math.cos(_loc3_ * Math.PI / 180);
         _loc5_ = _loc2_ * Math.sin(_loc3_ * Math.PI / 180);
         if(this.currentFrame == 2)
         {
            _loc4_ = -_loc4_;
         }
         _loc6_ = ProjectileManager.instance.createProjectile(Arrow_player.typeCode,_loc1_.x,_loc1_.y - 70,_loc4_,_loc5_);
         if(this.currentFrame == 2)
         {
            _loc6_.scaleX = -1;
         }
         if(EnemyManager.instance.getEnemyInWaiting() == 0 && EnemyManager.instance.countAlive() == 1)
         {
            _loc8_ = 0;
            while(_loc8_ < EnemyManager.instance.enemyList.length)
            {
               if(!EnemyManager.instance.enemyList[_loc8_].isDead())
               {
                  _loc7_ = EnemyManager.instance.enemyList[_loc8_];
               }
               _loc8_++;
            }
            if(_loc6_.simulateHit(_loc7_))
            {
               EnemyManager.instance.freezeDyingArrow(_loc6_);
            }
         }
         --StatsManager.instance.arrowAmmo;
         if(StatsManager.instance.arrowAmmo == 0)
         {
            aimingArrow = false;
         }
         StatsManager.instance.displayArrowAmmo();
         ++StatsManager.instance.arrowCount;
      }
      
      public function getIsDead() : Boolean
      {
         return isDead;
      }
      
      public function setPosition(param1:int, param2:int) : *
      {
         this.x = param1;
         this.y = param2;
         this.destinationX = param1;
         this.destinationY = param2;
      }
      
      public function reinit() : *
      {
         stageMode = 0;
         isDead = false;
         aimingArrow = false;
         isShunPo = false;
         isRunning = false;
         isFalling = false;
         hasSlash = false;
         keyScrollLeft = false;
         keyScrollRight = false;
         shunpoCounter = -1;
      }
      
      public function setAimingArrow(param1:Boolean, param2:int, param3:int) : *
      {
         if(param1 == true && !isShunPo && !isRunning && !isFalling && !aimingArrow && !hasSlash)
         {
            MovieClip(parent.parent).canvas.graphics.clear();
            aimingArrow = true;
            destinationX = this.x;
            destinationY = this.y;
            if(this.x < param2)
            {
               this.gotoAndStop(1);
            }
            else if(this.x > param2)
            {
               this.gotoAndStop(2);
            }
            this.player.gotoAndStop(20);
            aimingArrow = param1;
         }
         else if(param1 == false)
         {
            aimingArrow = false;
         }
      }
      
      public function isFacingLeft() : Boolean
      {
         return this.currentFrame == 2;
      }
      
      public function facing() : *
      {
         if(destinationX > this.x && !isFalling)
         {
            if(this.currentFrame != 1)
            {
               this.gotoAndStop(1);
            }
         }
         else if(destinationX < this.x && !isFalling)
         {
            if(this.currentFrame != 2)
            {
               this.gotoAndStop(2);
            }
         }
      }
      
      public function scrollGameStage(param1:Boolean, param2:int, param3:int) : *
      {
         var _loc4_:* = undefined;
         if(param1 && !aimingArrow || stageMode == STAGEEND)
         {
            return;
         }
         if(StageManager.instance.l1 != null)
         {
            StageManager.instance.l1.visible = false;
         }
         if(StageManager.instance.l2 != null)
         {
            StageManager.instance.l2.visible = false;
         }
         if(StageManager.instance.r1 != null)
         {
            StageManager.instance.r1.visible = false;
         }
         if(StageManager.instance.r2 != null)
         {
            StageManager.instance.r2.visible = false;
         }
         _loc4_ = 1;
         if(!isShunPo && param2 <= 50 && MovieClip(parent.parent).gameStage.x < 0 - gameStageBorder + 10)
         {
            StageManager.instance.l1.visible = true;
            if(param2 <= 25)
            {
               _loc4_ = 1.5;
               StageManager.instance.l2.visible = true;
            }
            MovieClip(parent.parent).gameStage.x = MovieClip(parent.parent).gameStage.x + scrollSpeed * _loc4_;
            MovieClip(parent.parent).canvas.x = MovieClip(parent.parent).canvas.x + scrollSpeed * _loc4_;
            MovieClip(parent.parent).foreground.x = MovieClip(parent.parent).foreground.x + scrollSpeed * _loc4_;
            if(MovieClip(parent.parent).stagebg1 != null)
            {
               MovieClip(parent.parent).stagebg1.x = MovieClip(parent.parent).stagebg1.x + scrollSpeed * _loc4_;
            }
            if(MovieClip(parent.parent).stagebg2 != null)
            {
               MovieClip(parent.parent).stagebg2.x = MovieClip(parent.parent).stagebg2.x + scrollSpeed * _loc4_ / 3;
            }
            this.x += scrollSpeed * _loc4_;
            destinationX += scrollSpeed * _loc4_;
         }
         else if(!isShunPo && param2 >= windowWidth - 50 && MovieClip(parent.parent).gameStage.x + StageManager.instance.stageWidth > windowWidth + gameStageBorder)
         {
            StageManager.instance.r1.visible = true;
            if(param2 >= windowWidth - 25)
            {
               _loc4_ = 1.5;
               StageManager.instance.r2.visible = true;
            }
            MovieClip(parent.parent).gameStage.x = MovieClip(parent.parent).gameStage.x - scrollSpeed * _loc4_;
            MovieClip(parent.parent).canvas.x = MovieClip(parent.parent).canvas.x - scrollSpeed * _loc4_;
            MovieClip(parent.parent).foreground.x = MovieClip(parent.parent).foreground.x - scrollSpeed * _loc4_;
            if(MovieClip(parent.parent).stagebg1 != null)
            {
               MovieClip(parent.parent).stagebg1.x = MovieClip(parent.parent).stagebg1.x - scrollSpeed * _loc4_;
            }
            if(MovieClip(parent.parent).stagebg2 != null)
            {
               MovieClip(parent.parent).stagebg2.x = MovieClip(parent.parent).stagebg2.x - scrollSpeed * _loc4_ / 3;
            }
            this.x -= scrollSpeed * _loc4_;
            destinationX -= scrollSpeed * _loc4_;
         }
      }
      
      public function land() : *
      {
         isFalling = false;
         player.gotoAndStop(4);
         this.y = groundY;
         if(this.currentFrame == 1)
         {
            this.x += 40;
            destinationX = this.x;
         }
         else
         {
            this.x -= 40;
            destinationX = this.x;
         }
      }
   }
}

