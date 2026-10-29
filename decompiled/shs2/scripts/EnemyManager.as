package
{
   import flash.display.MovieClip;
   
   public class EnemyManager
   {
      
      public static var instance:EnemyManager;
      
      internal var cleanUpCounterMax:int = 20 * 24;
      
      public var enemyList:* = new Array();
      
      internal var cleanUpCounter:int = cleanUpCounterMax;
      
      internal var gameStage:MovieClip;
      
      public function EnemyManager()
      {
         super();
         instance = this;
      }
      
      public function updateHPBar() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = 0;
         while(_loc1_ < enemyList.length)
         {
            enemyList[_loc1_].updateHPBar();
            _loc1_++;
         }
      }
      
      public function createEnemyFromArray(param1:Array) : *
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc2_ = Math.random() * param1.length;
         _loc3_ = int(param1[_loc2_]);
         _loc4_ = Math.floor(Math.random() * 7);
         if(_loc4_ <= 4 && _loc3_ != 13)
         {
            createEnemy(_loc3_,Math.random() * GameStage.stageWidth,-50);
         }
         else if(_loc4_ == 5)
         {
            createEnemy(_loc3_,-50 - Math.random() * 50,GameStage.groundY);
         }
         else
         {
            createEnemy(_loc3_,GameStage.stageWidth + 50 + Math.random() * 50,GameStage.groundY);
         }
      }
      
      public function createEnemyFromArray_Position(param1:Array, param2:String) : *
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc3_ = Math.random() * param1.length;
         _loc4_ = int(param1[_loc3_]);
         if(param2 == "top" && _loc4_ != 13)
         {
            createEnemy(_loc4_,Math.random() * GameStage.stageWidth,-50);
         }
         else if(param2 == "bottom" && _loc4_ != 13)
         {
            createEnemy(_loc4_,Math.random() * GameStage.stageWidth,500);
         }
         else if(param2 == "left")
         {
            createEnemy(_loc4_,-50 - Math.random() * 50,GameStage.groundY);
         }
         else
         {
            createEnemy(_loc4_,GameStage.stageWidth + 50 + Math.random() * 50,GameStage.groundY);
         }
      }
      
      public function scrollUp(param1:int) : *
      {
         var _loc2_:* = undefined;
         _loc2_ = 0;
         while(_loc2_ < enemyList.length)
         {
            enemyList[_loc2_].y += param1;
            _loc2_++;
         }
      }
      
      public function update() : *
      {
         var _loc1_:* = undefined;
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
            if(!enemyList[_loc2_].removeMe && enemyList[_loc2_].x > -200)
            {
               _loc1_.push(enemyList[_loc2_]);
            }
            _loc2_++;
         }
         enemyList = _loc1_;
      }
      
      public function createEnemyType(param1:int) : Enemy
      {
         var _loc2_:* = undefined;
         _loc2_ = -50;
         if(Math.random() * 2 > 1)
         {
            _loc2_ = GameStage.stageWidth + 50;
         }
         return createEnemy(param1,_loc2_,GameStage.groundY);
      }
      
      public function init(param1:MovieClip) : *
      {
         this.gameStage = param1;
         enemyList = new Array();
         cleanUpCounter = cleanUpCounterMax;
      }
      
      public function desaturateAll() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = 0;
         while(_loc1_ < enemyList.length)
         {
            ColorCode.desaturate(enemyList[_loc1_]);
            _loc1_++;
         }
      }
      
      public function resetGotHit() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = 0;
         while(_loc1_ < enemyList.length)
         {
            enemyList[_loc1_].gotHit = false;
            _loc1_++;
         }
      }
      
      public function continueAnimation() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = 0;
         while(_loc1_ < enemyList.length)
         {
            enemyList[_loc1_].continueAnimation();
            _loc1_++;
         }
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
      
      public function createRandomEnemySide(param1:int, param2:Boolean) : *
      {
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         _loc3_ = -50;
         if(param2)
         {
            _loc3_ = GameStage.stageWidth + 50;
         }
         _loc4_ = Math.floor(Math.random() * param1 + 1);
         createEnemy(_loc4_,_loc3_,GameStage.groundY);
      }
      
      public function stopAnimation() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = 0;
         while(_loc1_ < enemyList.length)
         {
            enemyList[_loc1_].stopAnimation();
            _loc1_++;
         }
      }
      
      public function register(param1:Enemy) : *
      {
         enemyList.push(param1);
      }
      
      public function createRandomEnemy(param1:int) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:int = 0;
         _loc2_ = Math.floor(Math.random() * param1 + 1);
         _loc3_ = Math.floor(Math.random() * 3);
         if(_loc3_ == 0 && _loc2_ != 13)
         {
            createEnemy(_loc2_,Math.random() * GameStage.stageWidth,-50);
         }
         else if(_loc3_ == 1)
         {
            createEnemy(_loc2_,-50,GameStage.groundY);
         }
         else
         {
            createEnemy(_loc2_,GameStage.stageWidth + 50,GameStage.groundY);
         }
      }
      
      public function checkHit(param1:Array, param2:Array) : *
      {
         var _loc3_:int = 0;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         _loc4_ = 0;
         while(_loc4_ < enemyList.length)
         {
            if(!enemyList[_loc4_].isDead())
            {
               _loc5_ = 0;
               while(_loc5_ < param1.length)
               {
                  if(!enemyList[_loc4_].gotHit && Math.abs(enemyList[_loc4_].x - param1[_loc5_]) < 200 && MovieClip(enemyList[_loc4_]).hitTestPoint(param1[_loc5_],param2[_loc5_],true))
                  {
                     enemyList[_loc4_].hit(_loc5_,param1,param2);
                     enemyList[_loc4_].gotHit = true;
                     Player.instance.increasePowerMeter(1);
                     _loc3_++;
                  }
                  _loc5_++;
               }
            }
            _loc4_++;
         }
         if(_loc3_ > 0)
         {
            Player.instance.updateCombo(_loc3_);
         }
      }
      
      public function killDying() : *
      {
         var _loc1_:int = 0;
         var _loc2_:* = undefined;
         _loc1_ = 0;
         _loc2_ = 0;
         while(_loc2_ < enemyList.length)
         {
            if(!enemyList[_loc2_].isDead() && enemyList[_loc2_].hp <= 0)
            {
               _loc1_++;
               enemyList[_loc2_].die();
            }
            _loc2_++;
         }
         StatsManager.kills += _loc1_;
         Player.instance.updateScore(_loc1_ * 10);
      }
      
      public function scrollRight(param1:int) : *
      {
         var _loc2_:* = undefined;
         _loc2_ = 0;
         while(_loc2_ < enemyList.length)
         {
            enemyList[_loc2_].scrollRight(param1);
            _loc2_++;
         }
      }
      
      public function createRandomEnemyTop(param1:int) : *
      {
         var _loc2_:MovieClip = null;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         _loc2_ = GameStage.getStage().getRandomPlatform();
         if(_loc2_ == null)
         {
            createRandomEnemy(param1);
         }
         else
         {
            _loc3_ = -50;
            _loc4_ = _loc2_.x;
            _loc5_ = Math.floor(Math.random() * param1 + 1);
            createEnemy(_loc5_,_loc4_,_loc3_);
         }
      }
      
      public function getGameStage() : MovieClip
      {
         return gameStage;
      }
      
      public function hideHPBar() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = 0;
         while(_loc1_ < enemyList.length)
         {
            enemyList[_loc1_].hideHPBar();
            _loc1_++;
         }
      }
      
      public function createEnemy(param1:int, param2:int, param3:int) : Enemy
      {
         var _loc4_:Enemy = null;
         switch(param1)
         {
            case Enemy_knife.typeCode:
               _loc4_ = new Enemy_knife();
               break;
            case Enemy_arrow.typeCode:
               _loc4_ = new Enemy_arrow();
               break;
            case Enemy_katana.typeCode:
               _loc4_ = new Enemy_katana();
               break;
            case Enemy_spear.typeCode:
               _loc4_ = new Enemy_spear();
               break;
            case Enemy_shield.typeCode:
               _loc4_ = new Enemy_shield();
               break;
            case Enemy_knifeArmored.typeCode:
               _loc4_ = new Enemy_knifeArmored();
               break;
            case Enemy_arrowArmored.typeCode:
               _loc4_ = new Enemy_arrowArmored();
               break;
            case Enemy_katanaArmored.typeCode:
               _loc4_ = new Enemy_katanaArmored();
               break;
            case Enemy_spearArmored.typeCode:
               _loc4_ = new Enemy_spearArmored();
               break;
            case Enemy_shieldArmored.typeCode:
               _loc4_ = new Enemy_shieldArmored();
               break;
            case Enemy_jetpackArrow.typeCode:
               _loc4_ = new Enemy_jetpackArrow();
               break;
            case Enemy_jetpackKatana.typeCode:
               _loc4_ = new Enemy_jetpackKatana();
               break;
            case Enemy_armoredSamurai.typeCode:
               _loc4_ = new Enemy_armoredSamurai();
               break;
            case Boss1.typeCode:
               _loc4_ = new Boss1();
               break;
            case Boss2.typeCode:
               _loc4_ = new Boss2();
               break;
            case Boss3.typeCode:
               _loc4_ = new Boss3();
               break;
            case Boss4.typeCode:
               _loc4_ = new Boss4();
               break;
            case Boss3_learning.typeCode:
               _loc4_ = new Boss3_learning();
         }
         gameStage.addChild(_loc4_);
         enemyList.push(_loc4_);
         _loc4_.setPosition(param2,param3);
         --GameStage.getStage().enemiesInWaiting;
         return _loc4_;
      }
      
      public function clearFilterAll() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = 0;
         while(_loc1_ < enemyList.length)
         {
            ColorCode.clearFilter(enemyList[_loc1_]);
            _loc1_++;
         }
      }
      
      public function makeDarkAll(param1:int) : *
      {
         var _loc2_:* = undefined;
         _loc2_ = 0;
         while(_loc2_ < enemyList.length)
         {
            ColorCode.makeDark(enemyList[_loc2_],param1);
            _loc2_++;
         }
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

