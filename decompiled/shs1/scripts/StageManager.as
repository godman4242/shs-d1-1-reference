package
{
   import flash.display.MovieClip;
   import flash.display.StageQuality;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.ColorTransform;
   
   public class StageManager
   {
      
      public static var instance:StageManager;
      
      public var r2:MovieClip;
      
      internal var colorMax:* = 11;
      
      internal var colorCounterMax:* = 2;
      
      internal var colorCounter:* = colorCounterMax;
      
      internal var autoCreateBirds:Boolean = true;
      
      internal var stageNum:int = 0;
      
      public var gameStage:MovieClip;
      
      internal var cloudspeed:* = new Array();
      
      public var l1:MovieClip;
      
      public var l2:MovieClip;
      
      internal var counterMax:int = 12;
      
      internal var stageVar:int = 0;
      
      internal var noclouds:Boolean = false;
      
      internal var color:* = 1;
      
      public var stageWidth:int = 800;
      
      internal var counter:int = counterMax;
      
      internal var enemyCountMax:int = 0;
      
      public var r1:MovieClip;
      
      public function StageManager(param1:MovieClip)
      {
         super();
         this.gameStage = param1;
         instance = this;
      }
      
      public function makeDark(param1:MovieClip, param2:int) : *
      {
         var _loc3_:Array = null;
         var _loc4_:ColorMatrixFilter = null;
         _loc3_ = [1,0,0,0,param2,0,1,0,0,param2,0,0,1,0,param2,0,0,0,1,0];
         _loc4_ = new ColorMatrixFilter(_loc3_);
         param1.filters = [_loc4_];
      }
      
      public function updateColorCounter() : *
      {
         --colorCounter;
         if(colorCounter == 0)
         {
            colorCounter = colorCounterMax;
            ++color;
            if(color > colorMax)
            {
               color = 1;
            }
         }
      }
      
      public function init() : *
      {
         initStage(StatsManager.instance.location);
      }
      
      public function changeColor(param1:MovieClip, param2:uint) : *
      {
         var _loc3_:ColorTransform = null;
         _loc3_ = param1.transform.colorTransform;
         _loc3_.color = param2;
         param1.transform.colorTransform = _loc3_;
      }
      
      public function createRandomTree() : MovieClip
      {
         var _loc1_:MovieClip = null;
         if(Math.random() * 2 < 1)
         {
            _loc1_ = new tree1();
         }
         else
         {
            _loc1_ = new tree2();
         }
         return _loc1_;
      }
      
      public function initScenary(param1:int, param2:int, param3:int, param4:MovieClip) : *
      {
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:int = 0;
         if(autoCreateBirds)
         {
            if(Math.random() * 2 < 1)
            {
               _loc5_ = Math.random() * 10 + 1;
               _loc6_ = 0;
               while(_loc6_ < _loc5_)
               {
                  _loc7_ = createBird(Math.random() * stageWidth,350);
                  if(Math.random() * 4 < 1)
                  {
                     _loc7_.flyStraight(stageWidth - Math.random() * 50,20 + Math.random() * 50,-50);
                  }
                  _loc6_++;
               }
            }
            if(Math.random() * 4 < 1)
            {
               _loc8_ = Math.random() * 3;
               _loc6_ = 0;
               while(_loc6_ < _loc8_)
               {
                  createSquirrel(Math.random() * stageWidth,350);
                  _loc6_++;
               }
            }
         }
         switch(param1)
         {
            case -1:
               MovieClip(gameStage.parent).stagebg1.gotoAndStop(2);
               MovieClip(gameStage.parent).stagebg2.gotoAndStop(2);
               MovieClip(gameStage.parent).staticbg.gotoAndStop(1);
               break;
            case -2:
               MovieClip(gameStage.parent).stagebg1.gotoAndStop(3);
               MovieClip(gameStage.parent).stagebg2.gotoAndStop(2);
               MovieClip(gameStage.parent).staticbg.gotoAndStop(2);
               break;
            case 1:
               MovieClip(gameStage.parent).staticbg.gotoAndStop(1);
               StageManager.instance.createTrees(param2,9397305,param3,16482326,param4);
               break;
            case 2:
               MovieClip(gameStage.parent).staticbg.gotoAndStop(2);
               StageManager.instance.createTrees(param2,9397305,param3,16482326,param4);
               break;
            case 3:
               MovieClip(gameStage.parent).staticbg.gotoAndStop(3);
               StageManager.instance.createTrees(param2,5396224,param3,10204928,param4);
               break;
            case 4:
               MovieClip(gameStage.parent).staticbg.gotoAndStop(4);
               StageManager.instance.createTrees(param2,1653510,param3,2711305,param4);
               break;
            case 5:
               MovieClip(gameStage.parent).staticbg.gotoAndStop(5);
               StageManager.instance.createTrees(param2,3300460,param3,6261921,param4);
               break;
            case 6:
               MovieClip(gameStage.parent).staticbg.gotoAndStop(6);
               StageManager.instance.createTrees(param2,677255,param3,6664950,param4);
               break;
            case 7:
               MovieClip(gameStage.parent).staticbg.gotoAndStop(7);
               StageManager.instance.createTrees(param2,5192058,param3,8742829,param4);
               break;
            case 8:
               MovieClip(gameStage.parent).staticbg.gotoAndStop(8);
               StageManager.instance.createTrees(param2,2568731,param3,3821096,param4);
               break;
            case 9:
               MovieClip(gameStage.parent).staticbg.gotoAndStop(9);
               StageManager.instance.createTrees(param2,4660054,param3,7023751,param4);
               break;
            case 10:
               MovieClip(gameStage.parent).staticbg.gotoAndStop(10);
               StageManager.instance.createTrees(param2,1446193,param3,3945361,param4);
               break;
            case 11:
               MovieClip(gameStage.parent).staticbg.gotoAndStop(11);
         }
      }
      
      public function showHint(param1:String) : *
      {
         MovieClip(gameStage.parent).hinttext.text = param1;
      }
      
      public function moveClouds() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         if(cloudspeed.length == 0)
         {
            _loc1_ = 1;
            while(_loc1_ <= 8)
            {
               cloudspeed[_loc1_] = Math.random();
               MovieClip(gameStage.parent).getChildByName("cloud" + _loc1_).y = 50 + Math.random() * 200;
               if(noclouds || Math.random() * 3 < 1)
               {
                  MovieClip(gameStage.parent).getChildByName("cloud" + _loc1_).visible = false;
               }
               _loc1_++;
            }
         }
         _loc1_ = 1;
         while(_loc1_ <= 8)
         {
            _loc2_ = MovieClip(gameStage.parent).getChildByName("cloud" + _loc1_);
            _loc2_.x -= cloudspeed[_loc1_];
            if(_loc2_.x < -100)
            {
               _loc2_.x = 820;
               _loc2_.y = 50 + Math.random() * 200;
               cloudspeed[_loc1_] = Math.random();
               if(noclouds || Math.random() * 3 < 1)
               {
                  _loc2_.visible = false;
               }
            }
            _loc1_++;
         }
      }
      
      public function desaturate(param1:MovieClip) : *
      {
         var _loc2_:Array = null;
         var _loc3_:ColorMatrixFilter = null;
         _loc2_ = [0.3,0.59,0.11,0,0,0.3,0.59,0.11,0,0,0.3,0.59,0.11,0,0,0,0,0,1,0];
         _loc3_ = new ColorMatrixFilter(_loc2_);
         param1.filters = [_loc3_];
      }
      
      public function clearFilter(param1:MovieClip) : *
      {
         param1.filters = null;
      }
      
      public function reinit(param1:MovieClip) : *
      {
         this.gameStage = param1;
         counter = counterMax;
         l1 = new scrollarrow();
         l1.x = 12;
         l1.y = 180;
         l1.visible = false;
         l2 = new scrollarrow();
         l2.x = 27;
         l2.y = 180;
         l2.visible = false;
         r1 = new scrollarrow();
         r1.scaleX = -1;
         r1.x = 710;
         r1.y = 180;
         r1.visible = false;
         r2 = new scrollarrow();
         r2.scaleX = -1;
         r2.x = 695;
         r2.y = 180;
         r2.visible = false;
         MovieClip(param1.parent).addChild(l1);
         MovieClip(param1.parent).addChild(l2);
         MovieClip(param1.parent).addChild(r1);
         MovieClip(param1.parent).addChild(r2);
         cloudspeed = new Array();
         noclouds = false;
      }
      
      public function initStage(param1:*) : *
      {
         var _loc2_:* = undefined;
         stageNum = param1;
         stageWidth = 720;
         enemyCountMax = 0;
         stageVar = 0;
         noclouds = false;
         autoCreateBirds = true;
         switch(param1)
         {
            case 36:
               Player.instance.setPosition(80,350);
               stageWidth = 1300;
               EnemyManager.instance.setEnemyInWaiting(4);
               EnemyManager.instance.createEnemy(100,500,350);
               EnemyManager.instance.createEnemy(100,1105,350);
               EnemyManager.instance.createEnemy(100,1015,350);
               EnemyManager.instance.createEnemy(100,925,350);
               autoCreateBirds = false;
               initScenary(-1,0,0,null);
               noclouds = true;
               _loc2_ = 0;
               while(_loc2_ < 5)
               {
                  createBird(200 + Math.random() * 300,350);
                  _loc2_++;
               }
               showHint(LangManager.getWords(0));
               break;
            case 37:
               Player.instance.setPosition(80,350);
               stageWidth = 1300;
               EnemyManager.instance.setEnemyInWaiting(1);
               EnemyManager.instance.createEnemy(101,1200,350);
               initScenary(7,0,0,null);
               ProjectileManager.instance.createProjectile(Arrow.typeCode,300,200,1,0);
               ProjectileManager.instance.createProjectile(Arrow.typeCode,320,200,1,0);
               ProjectileManager.instance.createProjectile(Arrow.typeCode,340,200,1,0);
               ProjectileManager.instance.createProjectile(Arrow.typeCode,360,200,1,0);
               ProjectileManager.instance.createProjectile(Arrow.typeCode,380,200,1,0);
               showHint(LangManager.getWords(2));
               break;
            case 0:
               Player.instance.setPosition(100,350);
               stageWidth = 720;
               initScenary(2,1,4,null);
               EnemyManager.instance.setEnemyInWaiting(1);
               EnemyManager.instance.createEnemy(1,700,350);
               break;
            case 1:
               Player.instance.setPosition(360,350);
               stageWidth = 720;
               initScenary(-2,2,4,null);
               EnemyManager.instance.setEnemyInWaiting(8);
               EnemyManager.instance.createEnemy(1,700,350);
               EnemyManager.instance.createEnemy(1,800,350);
               EnemyManager.instance.createEnemy(1,900,350);
               EnemyManager.instance.createEnemy(1,1000,350);
               EnemyManager.instance.createEnemy(1,-400,350);
               EnemyManager.instance.createEnemy(1,-300,350);
               EnemyManager.instance.createEnemy(1,-200,350);
               EnemyManager.instance.createEnemy(1,-100,350);
               break;
            case 2:
               Player.instance.setPosition(100,350);
               stageWidth = 720;
               initScenary(3,2,4,null);
               EnemyManager.instance.setEnemyInWaiting(3);
               EnemyManager.instance.createEnemy(1,700,350);
               EnemyManager.instance.createEnemy(1,600,350);
               EnemyManager.instance.createEnemy(1,-100,350);
               break;
            case 3:
               Player.instance.setPosition(360,350);
               stageWidth = 720;
               initScenary(3,3,4,null);
               EnemyManager.instance.setEnemyInWaiting(6);
               EnemyManager.instance.createEnemy(1,700,350);
               EnemyManager.instance.createEnemy(3,800,350);
               EnemyManager.instance.createEnemy(1,900,350);
               EnemyManager.instance.createEnemy(3,-300,350);
               EnemyManager.instance.createEnemy(1,-200,350);
               EnemyManager.instance.createEnemy(3,-100,350);
               break;
            case 5:
               Player.instance.setPosition(100,350);
               stageWidth = 1300;
               initScenary(4,2,5,null);
               EnemyManager.instance.setEnemyInWaiting(5);
               EnemyManager.instance.createEnemy(1,700,350);
               EnemyManager.instance.createEnemy(1,800,350);
               EnemyManager.instance.createEnemy(1,900,350);
               EnemyManager.instance.createEnemy(2,1200,350);
               EnemyManager.instance.createEnemy(2,1100,350);
               noclouds = true;
               break;
            case 6:
               Player.instance.setPosition(360,350);
               stageWidth = 1300;
               initScenary(3,2,5,null);
               EnemyManager.instance.setEnemyInWaiting(10);
               EnemyManager.instance.createEnemy(3,1300,350);
               EnemyManager.instance.createEnemy(3,1200,350);
               EnemyManager.instance.createEnemy(3,1100,350);
               EnemyManager.instance.createEnemy(3,1000,350);
               EnemyManager.instance.createEnemy(3,900,350);
               EnemyManager.instance.createEnemy(3,0,350);
               EnemyManager.instance.createEnemy(3,-100,350);
               EnemyManager.instance.createEnemy(3,-200,350);
               EnemyManager.instance.createEnemy(3,-300,350);
               EnemyManager.instance.createEnemy(3,-400,350);
               break;
            case 8:
               Player.instance.setPosition(360,350);
               stageWidth = 1300;
               autoCreateBirds = false;
               initScenary(-2,0,0,null);
               EnemyManager.instance.setEnemyInWaiting(8);
               EnemyManager.instance.createEnemy(4,1300,350);
               EnemyManager.instance.createEnemy(4,1250,350);
               EnemyManager.instance.createEnemy(4,1200,350);
               EnemyManager.instance.createEnemy(4,1150,350);
               EnemyManager.instance.createEnemy(4,-100,350);
               EnemyManager.instance.createEnemy(4,-150,350);
               EnemyManager.instance.createEnemy(4,-200,350);
               EnemyManager.instance.createEnemy(4,-250,350);
               _loc2_ = 0;
               while(_loc2_ < 10)
               {
                  createBird(100 + Math.random() * 1100,350);
                  _loc2_++;
               }
               break;
            case 9:
               Player.instance.setPosition(100,350);
               stageWidth = 1300;
               initScenary(4,5,5,null);
               noclouds = true;
               EnemyManager.instance.setEnemyInWaiting(10);
               EnemyManager.instance.createEnemy(2,900,350);
               EnemyManager.instance.createEnemy(2,1000,350);
               EnemyManager.instance.createEnemy(2,1100,350);
               EnemyManager.instance.createEnemy(2,1200,350);
               EnemyManager.instance.createEnemy(2,1300,350);
               EnemyManager.instance.createEnemy(2,-100,350);
               EnemyManager.instance.createEnemy(2,-200,350);
               EnemyManager.instance.createEnemy(2,-300,350);
               EnemyManager.instance.createEnemy(2,-400,350);
               EnemyManager.instance.createEnemy(2,-500,350);
               break;
            case 10:
               Player.instance.setPosition(360,350);
               stageWidth = 1300;
               initScenary(4,3,5,null);
               noclouds = true;
               EnemyManager.instance.setEnemyInWaiting(10);
               EnemyManager.instance.createEnemy(2,1100,350);
               EnemyManager.instance.createEnemy(2,1200,350);
               EnemyManager.instance.createEnemy(2,1300,350);
               EnemyManager.instance.createEnemy(1,1100,350);
               EnemyManager.instance.createEnemy(1,1200,350);
               EnemyManager.instance.createEnemy(2,-400,350);
               EnemyManager.instance.createEnemy(2,-300,350);
               EnemyManager.instance.createEnemy(2,-200,350);
               EnemyManager.instance.createEnemy(1,-100,350);
               EnemyManager.instance.createEnemy(1,-100,350);
               break;
            case 11:
               Player.instance.setPosition(100,350);
               stageWidth = 1300;
               initScenary(4,4,5,null);
               noclouds = true;
               EnemyManager.instance.setEnemyInWaiting(11);
               EnemyManager.instance.createEnemy(2,1300,350);
               EnemyManager.instance.createEnemy(2,1200,350);
               EnemyManager.instance.createEnemy(2,1100,350);
               EnemyManager.instance.createEnemy(1,1100,350);
               EnemyManager.instance.createEnemy(1,1000,350);
               EnemyManager.instance.createEnemy(1,900,350);
               EnemyManager.instance.createEnemy(1,800,350);
               EnemyManager.instance.createEnemy(1,700,350);
               EnemyManager.instance.createEnemy(3,1300,350);
               EnemyManager.instance.createEnemy(3,1200,350);
               EnemyManager.instance.createEnemy(3,1100,350);
               break;
            case 13:
               Player.instance.setPosition(100,350);
               stageWidth = 1300;
               initScenary(8,2,5,createBanner());
               EnemyManager.instance.setEnemyInWaiting(-1);
               EnemyManager.instance.createGuardTower(500,350);
               break;
            case 4:
            case 7:
            case 12:
            case 14:
               Player.instance.setPosition(360,350);
               stageWidth = 1300;
               initScenary(5,2,8,null);
               EnemyManager.instance.setEnemyInWaiting(25);
               enemyCountMax = 5;
               break;
            case 15:
            case 16:
            case 17:
            case 18:
            case 19:
            case 20:
               Player.instance.setPosition(360,350);
               stageWidth = 900;
               if(param1 == 17)
               {
                  initScenary(-2,2,5,null);
               }
               else if(param1 <= 16)
               {
                  initScenary(6,2,5,null);
               }
               else if(param1 >= 18)
               {
                  initScenary(7,2,5,null);
               }
               EnemyManager.instance.setEnemyInWaiting(25);
               enemyCountMax = 5;
               break;
            case 21:
               Player.instance.setPosition(360,350);
               stageWidth = 900;
               initScenary(7,2,5,null);
               EnemyManager.instance.setEnemyInWaiting(6);
               EnemyManager.instance.createEnemy(5,700,350);
               EnemyManager.instance.createEnemy(5,800,350);
               EnemyManager.instance.createEnemy(5,900,350);
               EnemyManager.instance.createEnemy(5,-300,350);
               EnemyManager.instance.createEnemy(5,-200,350);
               EnemyManager.instance.createEnemy(5,-100,350);
               break;
            case 28:
               Player.instance.setPosition(360,350);
               stageWidth = 900;
               initScenary(8,2,5,null);
               EnemyManager.instance.setEnemyInWaiting(40);
               enemyCountMax = 8;
               break;
            case 22:
            case 24:
            case 26:
               if(StatsManager.instance.getBuildersLeft() == 0 && (param1 == 22 || param1 == 24))
               {
                  stageWidth = 2400;
                  MovieClip(gameStage.parent).foreground.gotoAndStop(2);
                  initScenary(8,2,5,createBanner());
                  EnemyManager.instance.createCatapult(1100,350);
                  showHint(LangManager.getWords(3));
               }
               else
               {
                  stageWidth = 900;
                  initScenary(9,2,5,null);
               }
               Player.instance.setPosition(360,350);
               EnemyManager.instance.setEnemyInWaiting(25);
               enemyCountMax = 5;
               break;
            case 25:
            case 23:
            case 27:
               if(StatsManager.instance.getBuildersLeft() == 0 && param1 == 23)
               {
                  stageWidth = 2400;
                  MovieClip(gameStage.parent).foreground.gotoAndStop(2);
                  initScenary(8,2,5,createBanner());
                  EnemyManager.instance.createCatapult(1100,350);
                  showHint(LangManager.getWords(3));
               }
               else
               {
                  stageWidth = 900;
                  initScenary(9,2,5,null);
               }
               Player.instance.setPosition(360,350);
               EnemyManager.instance.setEnemyInWaiting(25);
               enemyCountMax = 5;
               break;
            case 100:
               Player.instance.setPosition(360,350);
               if(HexManager.enemiesToFight < 5)
               {
                  stageWidth = 720;
               }
               else if(HexManager.enemiesToFight <= 8)
               {
                  stageWidth = 900;
               }
               else
               {
                  stageWidth = 1300;
               }
               if(Math.random() * 2 < 1)
               {
                  initScenary(10,2,5,null);
               }
               else
               {
                  initScenary(11,2,5,null);
               }
               EnemyManager.instance.setEnemyInWaiting(HexManager.enemiesToFight * 5);
               enemyCountMax = HexManager.enemiesToFight;
               if(enemyCountMax < 4)
               {
                  enemyCountMax = 4;
               }
               makeDark(gameStage,-25);
               makeDark(MovieClip(gameStage.parent).playercanvas,-25);
               break;
            case 101:
               showHint(LangManager.getWords(4));
               Player.instance.setPosition(100,350);
               stageWidth = 1300;
               initScenary(8,2,5,createBanner());
               EnemyManager.instance.setEnemyInWaiting(1);
               EnemyManager.instance.createEnemy(6,800,350);
               break;
            case 102:
               Player.instance.setPosition(360,350);
               stageWidth = 900;
               initScenary(8,2,5,null);
               EnemyManager.instance.setEnemyInWaiting(-1);
               enemyCountMax = 8;
               showHint(LangManager.getWords(36));
         }
      }
      
      public function createBanner() : MovieClip
      {
         var _loc1_:* = undefined;
         _loc1_ = new enemybanner();
         _loc1_.x = 100 + Math.random() * (stageWidth - 200);
         _loc1_.y = 350;
         gameStage.addChild(_loc1_);
         _loc1_.rotation += Math.random() * 20 - 10;
         makeDark(_loc1_,-50);
         return _loc1_;
      }
      
      public function createBird(param1:*, param2:*) : Enemy_bird
      {
         var _loc3_:* = undefined;
         _loc3_ = new Enemy_bird();
         _loc3_.setPosition(param1,param2);
         EnemyManager.instance.enemyList.push(_loc3_);
         MovieClip(gameStage.parent).foreground.addChild(_loc3_);
         return _loc3_;
      }
      
      public function update() : *
      {
         var _loc1_:* = undefined;
         if(Player.instance.getIsDead())
         {
            return;
         }
         moveClouds();
         --counter;
         if(counter <= 0)
         {
            counter = counterMax;
            switch(stageNum)
            {
               case 4:
               case 7:
               case 12:
               case 14:
                  if(EnemyManager.instance.countAlive() < enemyCountMax)
                  {
                     EnemyManager.instance.createRandomEnemy(3);
                  }
                  break;
               case 15:
               case 16:
               case 17:
               case 18:
               case 19:
               case 20:
                  if(EnemyManager.instance.countAlive() < enemyCountMax)
                  {
                     EnemyManager.instance.createRandomEnemyNoArrow(4);
                  }
                  break;
               case 28:
                  if(EnemyManager.instance.countAlive() < enemyCountMax)
                  {
                     EnemyManager.instance.createRandomEnemyNoArrow(4);
                  }
                  break;
               case 22:
               case 24:
               case 26:
                  if(EnemyManager.instance.countAlive() < enemyCountMax)
                  {
                     EnemyManager.instance.createRandomEnemy(4);
                  }
                  break;
               case 25:
               case 23:
               case 27:
                  if(EnemyManager.instance.countAlive() < enemyCountMax)
                  {
                     EnemyManager.instance.createRandomEnemyNoArrow(5);
                  }
                  break;
               case 100:
                  if(EnemyManager.instance.countAlive() < enemyCountMax)
                  {
                     EnemyManager.instance.createRandomEnemy(5);
                  }
                  break;
               case 102:
                  if(StatsManager.instance.kills == 0)
                  {
                     gameStage.stage.quality = StageQuality.MEDIUM;
                     ParticleSystemManager.quality = "MEDIUM";
                  }
                  if(StatsManager.instance.kills > 170)
                  {
                     enemyCountMax = 10;
                  }
                  _loc1_ = 1;
                  if(StatsManager.instance.kills > 40)
                  {
                     _loc1_ = 5;
                  }
                  else if(StatsManager.instance.kills > 30)
                  {
                     _loc1_ = 4;
                  }
                  else if(StatsManager.instance.kills > 20)
                  {
                     _loc1_ = 3;
                  }
                  else if(StatsManager.instance.kills > 5)
                  {
                     _loc1_ = 2;
                  }
                  if(StatsManager.instance.kills > 100 && StatsManager.instance.kills < 110)
                  {
                     EnemyManager.instance.createEnemy(6,1000,350);
                     StatsManager.instance.kills += 10;
                  }
                  if(StatsManager.instance.kills > 150 && StatsManager.instance.kills < 160)
                  {
                     EnemyManager.instance.createEnemy(6,1000,350);
                     EnemyManager.instance.createEnemy(6,-100,350);
                     StatsManager.instance.kills += 10;
                  }
                  if(EnemyManager.instance.countAlive() < enemyCountMax)
                  {
                     EnemyManager.instance.createRandomEnemy(_loc1_);
                  }
            }
         }
      }
      
      public function createSquirrel(param1:*, param2:*) : *
      {
         var _loc3_:* = undefined;
         _loc3_ = new Enemy_squirrel();
         _loc3_.setPosition(param1,param2);
         EnemyManager.instance.enemyList.push(_loc3_);
         MovieClip(gameStage.parent).foreground.addChild(_loc3_);
      }
      
      public function createTrees(param1:int, param2:uint, param3:int, param4:uint, param5:MovieClip) : *
      {
         var _loc6_:MovieClip = null;
         var _loc7_:MovieClip = null;
         var _loc8_:MovieClip = null;
         var _loc9_:* = undefined;
         var _loc10_:* = undefined;
         _loc6_ = MovieClip(gameStage.parent).stagebg1;
         _loc7_ = MovieClip(gameStage.parent).stagebg2;
         _loc9_ = 0;
         while(_loc9_ < param1)
         {
            if(Math.random() * 2 < 1)
            {
               _loc8_ = new tree1();
            }
            else
            {
               _loc8_ = new tree2();
            }
            _loc8_.name = "tree" + _loc9_;
            _loc8_.y = Player.groundY + 15;
            _loc8_.x = Math.random() * StageManager.instance.stageWidth * 3 / 4;
            _loc10_ = (10 + Math.random() * 3) / 10;
            _loc8_.scaleY = _loc10_;
            _loc8_.scaleX = _loc10_;
            if(Math.random() * 2 < 1)
            {
               _loc8_.scaleX = -_loc8_.scaleX;
            }
            _loc8_.rotation = -5 + Math.random() * 10;
            _loc6_.addChild(_loc8_);
            StageManager.instance.changeColor(_loc8_,param2);
            if(param5 != null)
            {
               while(param5.hitTestObject(_loc8_))
               {
                  _loc8_.x += 10;
               }
            }
            _loc9_++;
         }
         _loc9_ = 0;
         while(_loc9_ < param3)
         {
            if(Math.random() * 2 < 1)
            {
               _loc8_ = new tree1();
            }
            else
            {
               _loc8_ = new tree2();
            }
            _loc8_.name = "tree" + _loc9_;
            _loc8_.y = Player.groundY + 15;
            _loc8_.x = Math.random() * StageManager.instance.stageWidth * 3 / 4;
            _loc10_ = (10 + Math.random() * 3) / 20;
            _loc8_.scaleY = _loc10_;
            _loc8_.scaleX = _loc10_;
            if(Math.random() * 2 < 1)
            {
               _loc8_.scaleX = -_loc8_.scaleX;
            }
            _loc8_.rotation = -5 + Math.random() * 10;
            _loc7_.addChild(_loc8_);
            StageManager.instance.changeColor(_loc8_,param4);
            _loc9_++;
         }
      }
   }
}

