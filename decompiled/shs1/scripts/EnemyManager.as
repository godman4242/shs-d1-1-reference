package
{
   import flash.display.MovieClip;
   
   public class EnemyManager
   {
      
      public static var instance:EnemyManager;
      
      internal var cleanUpCounter:int;
      
      public var frozen:Boolean = false;
      
      internal var gameStage:MovieClip;
      
      internal var cleanUpCounterMax:int = 20 * 24;
      
      public var freezeCounterMax:int = 48;
      
      public var enemyList:* = new Array();
      
      internal var enemyInWaiting:int = 0;
      
      internal var frozenArrow:*;
      
      public var freezeCounter:int = freezeCounterMax;
      
      public function EnemyManager(param1:MovieClip)
      {
         cleanUpCounter = cleanUpCounterMax;
         super();
         this.gameStage = param1;
         instance = this;
      }
      
      public function pauseGame() : *
      {
         var _loc1_:* = undefined;
         Player.stageMode = 2;
         _loc1_ = 0;
         while(_loc1_ < enemyList.length)
         {
            enemyList[_loc1_].pauseGame();
            _loc1_++;
         }
         StageManager.instance.desaturate(MovieClip(gameStage.root).staticbg);
         StageManager.instance.desaturate(gameStage);
         Player.instance.pauseGame();
         MovieClip(gameStage.root).foreground.g1.stop();
         MovieClip(gameStage.root).foreground.g2.stop();
         MovieClip(gameStage.root).foreground.g3.stop();
         StageManager.instance.desaturate(MovieClip(gameStage.parent).stagebg1);
         StageManager.instance.desaturate(MovieClip(gameStage.parent).stagebg2);
      }
      
      public function countHeadshot() : int
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         _loc1_ = 0;
         _loc2_ = 0;
         while(_loc2_ < enemyList.length)
         {
            if(enemyList[_loc2_].isHeadshot())
            {
               _loc1_++;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function reactShunpo(param1:Array, param2:Array) : *
      {
         var _loc3_:* = undefined;
         _loc3_ = 0;
         while(_loc3_ < enemyList.length)
         {
            if(!enemyList[_loc3_].isDead())
            {
               enemyList[_loc3_].reactShunpo(param1,param2);
            }
            _loc3_++;
         }
      }
      
      public function unpauseGame() : *
      {
         var _loc1_:* = undefined;
         Player.stageMode = 0;
         _loc1_ = 0;
         while(_loc1_ < enemyList.length)
         {
            enemyList[_loc1_].unpauseGame();
            _loc1_++;
         }
         if(checkDeath())
         {
            freezeCounter = 1;
         }
         StageManager.instance.clearFilter(MovieClip(gameStage.root).staticbg);
         StageManager.instance.clearFilter(gameStage);
         Player.instance.unpauseGame();
         MovieClip(gameStage.root).foreground.g1.play();
         MovieClip(gameStage.root).foreground.g2.play();
         MovieClip(gameStage.root).foreground.g3.play();
         StageManager.instance.clearFilter(MovieClip(gameStage.parent).stagebg1);
         StageManager.instance.clearFilter(MovieClip(gameStage.parent).stagebg2);
      }
      
      public function finishPlayerDie() : *
      {
         StageManager.instance.makeDark(gameStage,-300);
         StageManager.instance.makeDark(MovieClip(gameStage.parent).playercanvas,-300);
         MovieClip(gameStage.parent).redbg.visible = true;
         MovieClip(gameStage.parent).stagebg1.visible = false;
         MovieClip(gameStage.parent).stagebg2.visible = false;
         StageManager.instance.l1.visible = false;
         StageManager.instance.l2.visible = false;
         StageManager.instance.r1.visible = false;
         StageManager.instance.r2.visible = false;
         StageManager.instance.showHint("");
      }
      
      public function createRandomEnemyNoArrow(param1:*) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         _loc2_ = -100;
         if(Math.random() * 2 > 1)
         {
            _loc2_ = StageManager.instance.stageWidth + 100;
         }
         _loc3_ = Math.floor(Math.random() * param1 + 1);
         if(_loc3_ == 2)
         {
            return;
         }
         createEnemy(_loc3_,_loc2_,350);
      }
      
      public function createGuardTower(param1:int, param2:int) : *
      {
         var _loc3_:* = undefined;
         _loc3_ = new Enemy_guardtower();
         MovieClip(gameStage.parent).stagebg2.addChild(_loc3_);
         _loc3_.x = param1;
         _loc3_.y = param2;
         _loc3_.setManager(this);
         enemyList.push(_loc3_);
      }
      
      public function register(param1:Enemy) : *
      {
         param1.setManager(this);
         enemyList.push(param1);
      }
      
      public function createCatapult(param1:int, param2:int) : *
      {
         var _loc3_:* = undefined;
         _loc3_ = new Enemy_catapult();
         MovieClip(gameStage.parent).stagebg2.addChild(_loc3_);
         _loc3_.x = param1;
         _loc3_.y = param2;
         _loc3_.setManager(this);
         enemyList.push(_loc3_);
         _loc3_.scaleX = 0.8;
         _loc3_.scaleY = 0.8;
      }
      
      public function getEnemyInWaiting() : *
      {
         return enemyInWaiting;
      }
      
      public function setEnemyInWaiting(param1:int) : *
      {
         enemyInWaiting = param1;
      }
      
      public function reinit(param1:MovieClip) : *
      {
         this.gameStage = param1;
         enemyList = new Array();
         cleanUpCounter = cleanUpCounterMax;
         frozen = false;
         freezeCounter = freezeCounterMax;
         frozenArrow = null;
      }
      
      public function showContinue() : *
      {
         MovieClip(gameStage.parent).continuebutton.visible = true;
      }
      
      public function update() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         if(frozen)
         {
            --freezeCounter;
            if(freezeCounter == 0)
            {
               _loc2_ = countDying();
               if(_loc2_ > StatsManager.instance.maxCombo)
               {
                  StatsManager.instance.maxCombo = _loc2_;
               }
               _loc3_ = countHeadshot();
               if(Player.instance.getIsDead())
               {
                  Player.instance.deathAnim();
               }
               else
               {
                  killDying();
               }
               if(frozenArrow != null)
               {
                  frozenArrow.unfreeze();
               }
               else if(_loc2_ == 1 && _loc3_ == 0)
               {
                  Player.instance.displayScoreMessage("Coup de Grace: +500");
                  StatsManager.instance.addScore(500);
               }
               else if(_loc2_ == 1 && _loc3_ == 1)
               {
                  Player.instance.displayScoreMessage("Coup de Grace Headshot: +1000");
                  StatsManager.instance.addScore(1000);
               }
               else if(_loc2_ > 1 && _loc3_ == 0)
               {
                  Player.instance.displayScoreMessage("Coup de Grace Combo: " + _loc2_ + "x" + _loc2_ * 500);
                  StatsManager.instance.addScore(_loc2_ * _loc2_ * 500);
               }
               else if(_loc2_ > 1 && _loc3_ == _loc2_)
               {
                  Player.instance.displayScoreMessage("Coup de Grace Headshot Combo: " + _loc3_ + "x" + _loc3_ * 1000);
                  StatsManager.instance.addScore(_loc3_ * _loc3_ * 1000);
               }
               else if(_loc2_ > 1 && _loc3_ > 0)
               {
                  Player.instance.displayScoreMessage("Coup de Grace Combo/Headshot: " + (_loc2_ - _loc3_) + "x" + _loc2_ * 500 + " + " + _loc3_ + "x" + _loc2_ * 1000);
                  StatsManager.instance.addScore((_loc2_ - _loc3_) * _loc2_ * 500 + _loc3_ * _loc2_ * 1000);
               }
            }
            if(freezeCounter == -2 * 24 || StatsManager.instance.location == 37 && freezeCounter == 12)
            {
               if(!Player.instance.getIsDead())
               {
                  showScoreboard();
               }
            }
         }
         _loc1_ = 0;
         while(_loc1_ < enemyList.length)
         {
            enemyList[_loc1_].update();
            _loc1_++;
         }
         --cleanUpCounter;
         if(cleanUpCounter <= 0 || enemyList.length > 50)
         {
            cleanUpCounter = cleanUpCounterMax;
            cleanUp();
         }
      }
      
      public function cleanUp() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         _loc1_ = new Array();
         _loc2_ = 0;
         while(_loc2_ < enemyList.length)
         {
            if(!enemyList[_loc2_].removeMe)
            {
               _loc1_.push(enemyList[_loc2_]);
            }
            _loc2_++;
         }
         enemyList = _loc1_;
      }
      
      public function checkDeath() : Boolean
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         _loc1_ = countDying();
         if(_loc1_ > StatsManager.instance.maxCombo)
         {
            StatsManager.instance.maxCombo = _loc1_;
         }
         _loc2_ = countHeadshot();
         if(countAlive() == _loc1_ && enemyInWaiting == 0)
         {
            freezeDying();
            return true;
         }
         killDying();
         if(_loc1_ == 1 && _loc2_ == 0)
         {
            Player.instance.displayScoreMessage("+100");
            StatsManager.instance.addScore(100);
         }
         else if(_loc1_ == 1 && _loc2_ == 1)
         {
            Player.instance.displayScoreMessage("Headshot: +200");
            StatsManager.instance.addScore(200);
         }
         else if(_loc1_ > 1 && _loc2_ == 0)
         {
            Player.instance.displayScoreMessage("Combo: " + _loc1_ + "x" + _loc1_ * 100);
            StatsManager.instance.addScore(_loc1_ * _loc1_ * 100);
         }
         else if(_loc1_ > 1 && _loc2_ == _loc1_)
         {
            Player.instance.displayScoreMessage("Headshot Combo: " + _loc2_ + "x" + _loc2_ * 200);
            StatsManager.instance.addScore(_loc2_ * _loc2_ * 200);
         }
         else if(_loc1_ > 1 && _loc2_ > 0)
         {
            Player.instance.displayScoreMessage("Combo/Headshot: " + (_loc1_ - _loc2_) + "x" + _loc1_ * 100 + " + " + _loc2_ + "x" + _loc1_ * 200);
            StatsManager.instance.addScore((_loc1_ - _loc2_) * _loc1_ * 100 + _loc2_ * _loc1_ * 200);
         }
         return false;
      }
      
      public function createEnemyType(param1:*) : *
      {
         var _loc2_:* = undefined;
         _loc2_ = -100;
         if(Math.random() * 2 > 1)
         {
            _loc2_ = StageManager.instance.stageWidth + 100;
         }
         createEnemy(param1,_loc2_,350);
      }
      
      public function freezeDyingArrow(param1:Arrow_player) : *
      {
         var _loc2_:* = undefined;
         frozenArrow = param1;
         _loc2_ = 0;
         while(_loc2_ < enemyList.length)
         {
            if(!enemyList[_loc2_].isDead() && enemyList[_loc2_].hp <= 0)
            {
               enemyList[_loc2_].freeze();
            }
            _loc2_++;
         }
         frozen = true;
         freezeCounter = freezeCounterMax;
         Player.stageMode = 1;
         StageManager.instance.makeDark(gameStage,-300);
         StageManager.instance.makeDark(MovieClip(gameStage.parent).playercanvas,-300);
         MovieClip(gameStage.parent).redbg.visible = true;
         MovieClip(gameStage.parent).stagebg1.visible = false;
         MovieClip(gameStage.parent).stagebg2.visible = false;
         MovieClip(gameStage.parent).guicover.visible = true;
         StageManager.instance.l1.visible = false;
         StageManager.instance.l2.visible = false;
         StageManager.instance.r1.visible = false;
         StageManager.instance.r2.visible = false;
         StageManager.instance.showHint("");
      }
      
      public function freezeDying() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = 0;
         while(_loc1_ < enemyList.length)
         {
            if(!enemyList[_loc1_].isDead() && enemyList[_loc1_].hp <= 0)
            {
               enemyList[_loc1_].freeze();
            }
            _loc1_++;
         }
         frozen = true;
         freezeCounter = freezeCounterMax;
         Player.stageMode = 1;
         StageManager.instance.makeDark(gameStage,-300);
         StageManager.instance.makeDark(MovieClip(gameStage.parent).playercanvas,-300);
         MovieClip(gameStage.parent).redbg.visible = true;
         MovieClip(gameStage.parent).stagebg1.visible = false;
         MovieClip(gameStage.parent).stagebg2.visible = false;
         MovieClip(gameStage.parent).guicover.visible = true;
         StageManager.instance.l1.visible = false;
         StageManager.instance.l2.visible = false;
         StageManager.instance.r1.visible = false;
         StageManager.instance.r2.visible = false;
         StageManager.instance.showHint("");
      }
      
      public function countDying() : int
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         _loc1_ = 0;
         _loc2_ = 0;
         while(_loc2_ < enemyList.length)
         {
            if(!enemyList[_loc2_].isDead() && enemyList[_loc2_].hp <= 0)
            {
               _loc1_++;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function createRandomEnemySide(param1:*, param2:*) : *
      {
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         _loc3_ = -100;
         if(param2)
         {
            _loc3_ = StageManager.instance.stageWidth + 100;
         }
         _loc4_ = Math.floor(Math.random() * param1 + 1);
         createEnemy(_loc4_,_loc3_,350);
      }
      
      public function playerDie() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = 0;
         while(_loc1_ < enemyList.length)
         {
            enemyList[_loc1_].pauseGame();
            enemyList[_loc1_].freeze();
            if(enemyList[_loc1_].isDead())
            {
               enemyList[_loc1_].visible = false;
            }
            _loc1_++;
         }
         frozen = true;
         freezeCounter = freezeCounterMax;
         Player.stageMode = 1;
         StageManager.instance.makeDark(gameStage,-300);
         StageManager.instance.makeDark(MovieClip(gameStage.parent).playercanvas,-300);
         MovieClip(gameStage.parent).redbg.visible = true;
         MovieClip(gameStage.parent).stagebg1.visible = false;
         MovieClip(gameStage.parent).stagebg2.visible = false;
         MovieClip(gameStage.parent).canvas.graphics.clear();
         MovieClip(gameStage.parent).guicover.visible = true;
         StageManager.instance.l1.visible = false;
         StageManager.instance.l2.visible = false;
         StageManager.instance.r1.visible = false;
         StageManager.instance.r2.visible = false;
         StageManager.instance.showHint("");
      }
      
      public function createRandomEnemy(param1:*) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         _loc2_ = -100;
         if(Math.random() * 2 > 1)
         {
            _loc2_ = StageManager.instance.stageWidth + 100;
         }
         _loc3_ = Math.floor(Math.random() * param1 + 1);
         createEnemy(_loc3_,_loc2_,350);
      }
      
      public function playerDieArrow() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = 0;
         while(_loc1_ < enemyList.length)
         {
            enemyList[_loc1_].pauseGame();
            StageManager.instance.desaturate(enemyList[_loc1_]);
            enemyList[_loc1_].freeze();
            if(enemyList[_loc1_].isDead())
            {
               enemyList[_loc1_].visible = false;
            }
            _loc1_++;
         }
         StageManager.instance.desaturate(MovieClip(gameStage.root).staticbg);
         MovieClip(gameStage.root).foreground.g1.stop();
         MovieClip(gameStage.root).foreground.g2.stop();
         MovieClip(gameStage.root).foreground.g3.stop();
         StageManager.instance.desaturate(MovieClip(gameStage.parent).stagebg1);
         StageManager.instance.desaturate(MovieClip(gameStage.parent).stagebg2);
         MovieClip(gameStage.parent).canvas.graphics.clear();
         freezeCounter = freezeCounterMax;
         Player.stageMode = 1;
         MovieClip(gameStage.parent).guicover.visible = true;
      }
      
      public function checkHit(param1:Array, param2:Array) : *
      {
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         var _loc10_:* = undefined;
         var _loc11_:* = undefined;
         _loc3_ = new Array();
         _loc4_ = new Array();
         _loc3_.push(param1[0]);
         _loc4_.push(param2[0]);
         _loc5_ = 1;
         while(_loc5_ < param1.length)
         {
            _loc8_ = (param1[_loc5_] - param1[_loc5_ - 1]) / 4;
            _loc9_ = (param2[_loc5_] - param2[_loc5_ - 1]) / 4;
            _loc3_.push(param1[_loc5_ - 1] + _loc8_);
            _loc4_.push(param2[_loc5_ - 1] + _loc9_);
            _loc3_.push(param1[_loc5_ - 1] + 2 * _loc8_);
            _loc4_.push(param2[_loc5_ - 1] + 2 * _loc9_);
            _loc3_.push(param1[_loc5_ - 1] + 3 * _loc8_);
            _loc4_.push(param2[_loc5_ - 1] + 3 * _loc9_);
            _loc3_.push(param1[_loc5_]);
            _loc4_.push(param2[_loc5_]);
            _loc5_++;
         }
         _loc6_ = gameStage.x;
         _loc7_ = 0;
         while(_loc7_ < enemyList.length)
         {
            _loc10_ = false;
            _loc11_ = 0;
            while(_loc11_ < _loc3_.length)
            {
               if(!enemyList[_loc7_].isDead() && !_loc10_ && Math.abs(enemyList[_loc7_].x - _loc3_[_loc11_] + _loc6_) < 100 && MovieClip(enemyList[_loc7_]).hitTestPoint(_loc3_[_loc11_],_loc4_[_loc11_],true))
               {
                  if(enemyList[_loc7_].hit(_loc3_[_loc11_],_loc4_[_loc11_]))
                  {
                     _loc10_ = true;
                  }
               }
               _loc11_++;
            }
            _loc7_++;
         }
      }
      
      public function createEnemy(param1:int, param2:int, param3:int) : Enemy
      {
         var _loc4_:Enemy = null;
         if(enemyInWaiting == 0)
         {
            return null;
         }
         --enemyInWaiting;
         switch(param1)
         {
            case Enemy_scarecrow.typeCode:
               _loc4_ = new Enemy_scarecrow();
               break;
            case Enemy_target.typeCode:
               _loc4_ = new Enemy_target();
               break;
            case Enemy1.typeCode:
               _loc4_ = new Enemy1();
               break;
            case Enemy2.typeCode:
               _loc4_ = new Enemy2();
               break;
            case Enemy3.typeCode:
               _loc4_ = new Enemy3();
               break;
            case Enemy4.typeCode:
               _loc4_ = new Enemy4();
               break;
            case Enemy5.typeCode:
               _loc4_ = new Enemy5();
               break;
            case Enemy6.typeCode:
               _loc4_ = new Enemy6();
         }
         gameStage.addChild(_loc4_);
         _loc4_.setManager(this);
         enemyList.push(_loc4_);
         _loc4_.setPosition(param2,param3);
         return _loc4_;
      }
      
      public function killDying() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = 0;
         while(_loc1_ < enemyList.length)
         {
            if(!enemyList[_loc1_].isDead() && enemyList[_loc1_].hp <= 0)
            {
               enemyList[_loc1_].die();
            }
            _loc1_++;
         }
      }
      
      public function showScoreboard() : *
      {
         MovieClip(gameStage.parent).scoreboard.visible = true;
         MovieClip(gameStage.parent).transition.transition.gotoAndPlay(90);
      }
      
      public function checkArrowHit(param1:MovieClip) : Boolean
      {
         var _loc2_:* = undefined;
         _loc2_ = 0;
         while(_loc2_ < enemyList.length)
         {
            if(!enemyList[_loc2_].isDead() && (Math.abs(enemyList[_loc2_].x - param1.x) < 100 || MovieClip(enemyList[_loc2_].parent) != gameStage) && MovieClip(enemyList[_loc2_]).hitTestObject(param1))
            {
               if(enemyList[_loc2_].arrowHit(param1))
               {
                  return true;
               }
            }
            _loc2_++;
         }
         return false;
      }
      
      public function getGameStage() : MovieClip
      {
         return gameStage;
      }
      
      public function isColliding(param1:Enemy) : Boolean
      {
         var _loc2_:* = undefined;
         _loc2_ = 0;
         while(_loc2_ < enemyList.length)
         {
            if(!enemyList[_loc2_].isDead() && param1 != enemyList[_loc2_] && Math.abs(param1.x - enemyList[_loc2_].x) < 50)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      public function countAlive() : int
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         _loc1_ = 0;
         _loc2_ = 0;
         while(_loc2_ < enemyList.length)
         {
            if(!enemyList[_loc2_].isDead())
            {
               _loc1_++;
            }
            _loc2_++;
         }
         return _loc1_;
      }
   }
}

