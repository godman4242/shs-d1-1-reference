package
{
   import flash.display.MovieClip;
   
   public class ForestStage extends GameStage
   {
      
      public static var instance:ForestStage;
      
      public var autoScroll:Boolean = false;
      
      internal var player:MovieClip;
      
      internal var stage:MovieClip;
      
      public function ForestStage(param1:MovieClip)
      {
         super();
         instance = this;
         this.player = param1;
         stage = MovieClip(param1.parent);
         GameStage.setStage(1);
         stage.redbg.visible = false;
         totalAreas = 10;
         area = 1;
         Boss1.instance = null;
         if(StatsManager.skipToBoss)
         {
            area = 9;
         }
      }
      
      override public function clearFilterAll() : *
      {
         ColorCode.blur(stage.bg,10);
         ColorCode.blur(stage.fgtree1,10);
         ColorCode.blur(stage.fgleaf1,10);
         ColorCode.blur(stage.fgleaf2,10);
         ColorCode.blur(stage.fgleaf3,10);
         ColorCode.blur(stage.bgtree1,10);
         ColorCode.blur(stage.bgtree2,10);
         ColorCode.blur(stage.bgtree3,10);
         ColorCode.blur(stage.bgtree4,10);
         ColorCode.blur(stage.bgtree7,10);
         ColorCode.blur(stage.bgtree8,10);
         ColorCode.blur(stage.bgtree9,10);
         ColorCode.blur(stage.bgtree10,10);
         ColorCode.blur(stage.grass1_1,5);
         ColorCode.blur(stage.grass1_2,5);
         ColorCode.blur(stage.grass2_1,5);
         ColorCode.blur(stage.grass2_2,5);
         ColorCode.blur(stage.logs1,5);
         ColorCode.blur(stage.logs2,5);
         ColorCode.blur(stage.rock,5);
         ColorCode.clearFilter(stage.tree1);
         ColorCode.clearFilter(stage.tree2);
         ColorCode.clearFilter(stage.tree3);
         LeafParticleSystem.instance.clearFilterAll();
      }
      
      public function bossFightStart() : *
      {
         InputManager.instance.enable();
         Boss1.instance.canMove = true;
         stage.bosshp.visible = true;
         Player.instance.bossFight = true;
         enemiesInWaiting = 0;
         bossNext = false;
         playerGotoLeft = false;
      }
      
      override public function update() : *
      {
         if(autoScroll)
         {
            if(stage.introMode)
            {
               scrollRight(3);
            }
            else
            {
               scrollRight(20);
            }
         }
         else if(scrollCounter > 10)
         {
            --scrollCounter;
            scrollRight(20);
         }
         else if(scrollCounter > 0)
         {
            --scrollCounter;
            scrollRight(scrollCounter * 2);
         }
         else if(scrollCounter == 0)
         {
            --scrollCounter;
            Player.instance.isScrolling = false;
            InputManager.instance.enable();
         }
         else
         {
            if(enemiesInWaiting == -100)
            {
               initArea();
            }
            if(enemiesInWaiting > 0)
            {
               spawn();
            }
         }
      }
      
      override public function autoScrollPress() : *
      {
         if(!autoScroll)
         {
            autoScroll = true;
            doScroll(100);
         }
         else
         {
            autoScroll = false;
            scrollCounter = 10;
         }
      }
      
      override public function desaturateAll() : *
      {
         ColorCode.desaturate_blur(stage.bg,10);
         ColorCode.desaturate_blur(stage.fgtree1,10);
         ColorCode.desaturate_blur(stage.fgleaf1,10);
         ColorCode.desaturate_blur(stage.fgleaf2,10);
         ColorCode.desaturate_blur(stage.fgleaf3,10);
         ColorCode.desaturate_blur(stage.bgtree1,10);
         ColorCode.desaturate_blur(stage.bgtree2,10);
         ColorCode.desaturate_blur(stage.bgtree3,10);
         ColorCode.desaturate_blur(stage.bgtree4,10);
         ColorCode.desaturate_blur(stage.bgtree7,10);
         ColorCode.desaturate_blur(stage.bgtree8,10);
         ColorCode.desaturate_blur(stage.bgtree9,10);
         ColorCode.desaturate_blur(stage.bgtree10,10);
         ColorCode.desaturate_blur(stage.grass1_1,5);
         ColorCode.desaturate_blur(stage.grass1_2,5);
         ColorCode.desaturate_blur(stage.grass2_1,5);
         ColorCode.desaturate_blur(stage.grass2_2,5);
         ColorCode.desaturate_blur(stage.logs1,5);
         ColorCode.desaturate_blur(stage.logs2,5);
         ColorCode.desaturate_blur(stage.rock,5);
         ColorCode.desaturate(stage.tree1);
         ColorCode.desaturate(stage.tree2);
         ColorCode.desaturate(stage.tree3);
         LeafParticleSystem.instance.desaturateAll();
      }
      
      public function initArea() : *
      {
         switch(area)
         {
            case 1:
               spawnArray = [1];
               enemiesInWaiting = 1;
               maxEnemies = 1;
               spawnDelay = 5 * 24;
               break;
            case 2:
               spawnArray = [6];
               enemiesInWaiting = 3;
               maxEnemies = 1;
               stage.tutorial.gotoAndStop(2);
               spawnDelay = 5 * 24;
               break;
            case 3:
               spawnArray = [1,6];
               enemiesInWaiting = 3;
               maxEnemies = 3;
               stage.tutorial.gotoAndStop(3);
               spawnDelay = 5 * 24;
               break;
            case 4:
               spawnArray = [1,2,6];
               enemiesInWaiting = 6;
               maxEnemies = 3;
               stage.tutorial.gotoAndStop(7);
               break;
            case 5:
               spawnArray = [2];
               enemiesInWaiting = 15;
               maxEnemies = 5;
               stage.tutorial.gotoAndStop(8);
               break;
            case 6:
               spawnArray = [13];
               enemiesInWaiting = 1;
               maxEnemies = 1;
               stage.tutorial.visible = true;
               stage.tutorial.gotoAndStop(4);
               spawnDelay = 5 * 24;
               break;
            case 7:
               spawnArray = [1,2,3,6];
               enemiesInWaiting = 12;
               maxEnemies = 3;
               stage.tutorial.visible = false;
               break;
            case 8:
               spawnArray = [1,2,3,4,5,6];
               enemiesInWaiting = 12;
               maxEnemies = 3;
               break;
            case 9:
               spawnArray = [1,2,3,4,5,6,13];
               enemiesInWaiting = 16;
               maxEnemies = 4;
               bossNext = true;
               playerGotoLeft = true;
               break;
            case 10:
               SoundManager.instance.playMusic(7);
               enemiesInWaiting = 1;
               maxEnemies = 1;
         }
      }
      
      override public function scrollRight(param1:int) : *
      {
         var _loc2_:int = 0;
         EnemyManager.instance.scrollRight(param1);
         ProjectileManager.instance.scrollRight(param1);
         stage.fgtree1.x -= param1 * 2;
         if(stage.fgtree1.x < -100 && !bossNext)
         {
            stage.fgtree1.x = Math.random() * 300 + 1000;
            _loc2_ = Math.random() * 2;
            if(_loc2_ == 0)
            {
               stage.fgtree1.scaleX = 1;
            }
            else if(_loc2_ == 1)
            {
               stage.fgtree1.scaleX = -1;
            }
         }
         stage.fgleaf1.x -= param1 * 2;
         if(stage.fgleaf1.x < -100)
         {
            stage.fgleaf1.x = Math.random() * 300 + 1000;
            stage.fgleaf1.scaleX = (Math.random() * 5 + 7) / 10;
            stage.fgleaf1.scaleY = (Math.random() * 5 + 7) / 10;
            _loc2_ = Math.random() * 2;
            if(_loc2_ == 0)
            {
               stage.fgleaf1.scaleX *= -1;
            }
         }
         stage.fgleaf2.x -= param1 * 2;
         if(stage.fgleaf2.x < -100)
         {
            stage.fgleaf2.x = Math.random() * 300 + 1000;
            stage.fgleaf2.scaleX = (Math.random() * 5 + 7) / 10;
            stage.fgleaf2.scaleY = (Math.random() * 5 + 7) / 10;
            _loc2_ = Math.random() * 2;
            if(_loc2_ == 0)
            {
               stage.fgleaf2.scaleX *= -1;
            }
         }
         stage.fgleaf3.x -= param1 * 2;
         if(stage.fgleaf3.x < -100)
         {
            stage.fgleaf3.x = Math.random() * 300 + 1000;
            stage.fgleaf3.scaleX = (Math.random() * 5 + 7) / 10;
            stage.fgleaf3.scaleY = (Math.random() * 5 + 7) / 10;
            _loc2_ = Math.random() * 2;
            if(_loc2_ == 0)
            {
               stage.fgleaf3.scaleX *= -1;
            }
         }
         stage.bgtree1.x -= param1 / 3;
         if(stage.bgtree1.x < -100)
         {
            stage.bgtree1.x = Math.random() * 400 + 720;
            _loc2_ = Math.random() * 2;
            if(_loc2_ == 0)
            {
               stage.bgtree1.scaleX = 1;
            }
            else if(_loc2_ == 1)
            {
               stage.bgtree1.scaleX = -1;
            }
         }
         stage.bgtree2.x -= param1 / 3;
         if(stage.bgtree2.x < -100)
         {
            stage.bgtree2.x = Math.random() * 400 + 720;
            _loc2_ = Math.random() * 2;
            if(_loc2_ == 0)
            {
               stage.bgtree2.scaleX = 1;
            }
            else if(_loc2_ == 1)
            {
               stage.bgtree2.scaleX = -1;
            }
         }
         stage.bgtree3.x -= param1 / 3;
         if(stage.bgtree3.x < -100)
         {
            stage.bgtree3.x = Math.random() * 400 + 720;
            _loc2_ = Math.random() * 2;
            if(_loc2_ == 0)
            {
               stage.bgtree3.scaleX = 1;
            }
            else if(_loc2_ == 1)
            {
               stage.bgtree3.scaleX = -1;
            }
         }
         stage.bgtree4.x -= param1 / 3;
         if(stage.bgtree4.x < -100)
         {
            stage.bgtree4.x = Math.random() * 400 + 720;
            _loc2_ = Math.random() * 2;
            if(_loc2_ == 0)
            {
               stage.bgtree4.scaleX = 1;
            }
            else if(_loc2_ == 1)
            {
               stage.bgtree4.scaleX = -1;
            }
         }
         stage.bgtree7.x -= param1 / 2;
         if(stage.bgtree7.x < -100)
         {
            stage.bgtree7.x = Math.random() * 400 + 720;
            _loc2_ = Math.random() * 2;
            if(_loc2_ == 0)
            {
               stage.bgtree7.scaleX = 1;
            }
            else if(_loc2_ == 1)
            {
               stage.bgtree7.scaleX = -1;
            }
         }
         stage.bgtree8.x -= param1 / 2;
         if(stage.bgtree8.x < -100)
         {
            stage.bgtree8.x = Math.random() * 400 + 720;
            _loc2_ = Math.random() * 2;
            if(_loc2_ == 0)
            {
               stage.bgtree8.scaleX = 1;
            }
            else if(_loc2_ == 1)
            {
               stage.bgtree8.scaleX = -1;
            }
         }
         stage.bgtree9.x -= param1 / 2;
         if(stage.bgtree9.x < -100)
         {
            stage.bgtree9.x = Math.random() * 400 + 720;
            _loc2_ = Math.random() * 2;
            if(_loc2_ == 0)
            {
               stage.bgtree9.scaleX = 1;
            }
            else if(_loc2_ == 1)
            {
               stage.bgtree9.scaleX = -1;
            }
         }
         stage.bgtree10.x -= param1 / 2;
         if(stage.bgtree10.x < -100)
         {
            stage.bgtree10.x = Math.random() * 400 + 720;
            _loc2_ = Math.random() * 2;
            if(_loc2_ == 0)
            {
               stage.bgtree10.scaleX = 1;
            }
            else if(_loc2_ == 1)
            {
               stage.bgtree10.scaleX = -1;
            }
         }
         stage.grass1_1.x -= param1;
         stage.grass1_2.x -= param1;
         if(stage.grass1_1.x < -800)
         {
            stage.grass1_1.x = stage.grass1_2.x + 800;
         }
         if(stage.grass1_2.x < -800)
         {
            stage.grass1_2.x = stage.grass1_1.x + 800;
         }
         stage.grass2_1.x -= param1;
         stage.grass2_2.x -= param1;
         if(stage.grass2_1.x < -720)
         {
            stage.grass2_1.x = stage.grass2_2.x + 720;
         }
         if(stage.grass2_2.x < -720)
         {
            stage.grass2_2.x = stage.grass2_1.x + 720;
         }
         stage.logs1.x -= param1;
         if(stage.logs1.x < -200)
         {
            stage.logs1.x = Math.random() * 400 + 800;
            _loc2_ = Math.random() * 3;
            if(_loc2_ == 0)
            {
               stage.logs1.scaleX = 1;
            }
            else if(_loc2_ == 1)
            {
               stage.logs1.scaleX = -1;
            }
            else if(_loc2_ == 2)
            {
               stage.logs1.scaleX = 0;
            }
         }
         stage.logs2.x -= param1;
         if(stage.logs2.x < -200)
         {
            stage.logs2.x = Math.random() * 400 + 800;
            _loc2_ = Math.random() * 3;
            if(_loc2_ == 0)
            {
               stage.logs2.scaleX = 1;
            }
            else if(_loc2_ == 1)
            {
               stage.logs2.scaleX = -1;
            }
            else if(_loc2_ == 2)
            {
               stage.logs2.scaleX = 0;
            }
         }
         stage.rock.x -= param1;
         if(stage.rock.x < -200)
         {
            stage.rock.x = Math.random() * 720 + 900;
            _loc2_ = Math.random() * 3;
            if(_loc2_ == 0)
            {
               stage.rock.scaleX = 1;
            }
            else if(_loc2_ == 1)
            {
               stage.rock.scaleX = -1;
            }
            else if(_loc2_ == 2)
            {
               stage.rock.scaleX = 0;
            }
         }
         stage.tree1.x -= param1;
         if(stage.tree1.groundplatform1 != null)
         {
            stage.tree1.groundplatform1.x -= param1;
         }
         if(stage.tree1.groundplatform2 != null)
         {
            stage.tree1.groundplatform2.x -= param1;
         }
         if(stage.tree1.x < -100)
         {
            stage.tree1.x = Math.random() * 720 + 800;
            stage.tree1.init();
            if(!bossNext)
            {
               _loc2_ = Math.random() * 4;
            }
            else
            {
               _loc2_ = Math.random() * 2;
            }
            if(_loc2_ == 0)
            {
               stage.tree1.scaleX = 1;
            }
            else if(_loc2_ == 1)
            {
               stage.tree1.scaleX = -1;
            }
            else if(_loc2_ == 2)
            {
               stage.tree1.showPlatform1(-1);
            }
            else if(_loc2_ == 3)
            {
               stage.tree1.showPlatform1(-1);
               stage.tree1.showPlatform2(-1);
            }
         }
         stage.tree2.x -= param1;
         if(stage.tree2.groundplatform1 != null)
         {
            stage.tree2.groundplatform1.x -= param1;
         }
         if(stage.tree2.groundplatform2 != null)
         {
            stage.tree2.groundplatform2.x -= param1;
         }
         if(stage.tree2.x < -100)
         {
            stage.tree2.x = Math.random() * 400 + 800;
            stage.tree2.init();
            if(!bossNext)
            {
               _loc2_ = Math.random() * 4;
            }
            else
            {
               _loc2_ = Math.random() * 2;
            }
            if(_loc2_ == 0)
            {
               stage.tree2.scaleX = 1;
            }
            else if(_loc2_ == 1)
            {
               stage.tree2.scaleX = -1;
            }
            else if(_loc2_ == 2)
            {
               stage.tree2.showPlatform1(-1);
            }
            else if(_loc2_ == 3)
            {
               stage.tree2.showPlatform1(-1);
               stage.tree2.showPlatform2(-1);
            }
         }
         stage.tree3.x -= param1;
         if(stage.tree3.groundplatform1 != null)
         {
            stage.tree3.groundplatform1.x -= param1;
         }
         if(stage.tree3.groundplatform2 != null)
         {
            stage.tree3.groundplatform2.x -= param1;
         }
         if(stage.tree3.x < -100)
         {
            stage.tree3.x = Math.random() * 400 + 800;
            stage.tree3.init();
            if(!bossNext)
            {
               _loc2_ = Math.random() * 4;
            }
            else
            {
               _loc2_ = Math.random() * 2;
            }
            if(_loc2_ == 0)
            {
               stage.tree3.scaleX = 1;
            }
            else if(_loc2_ == 1)
            {
               stage.tree3.scaleX = -1;
            }
            else if(_loc2_ == 2)
            {
               stage.tree3.showPlatform1(50 + Math.random() * 300);
            }
            else if(_loc2_ == 3)
            {
               stage.tree3.showPlatform1(-1);
               stage.tree3.showPlatform2(-1);
            }
         }
      }
      
      override public function redFreeze() : *
      {
         stage.redbg.visible = true;
         stage.leaflayer1.visible = false;
         stage.leaflayer2.visible = false;
         stage.fgtree1.visible = false;
         stage.fgleaf1.visible = false;
         stage.fgleaf2.visible = false;
         stage.fgleaf3.visible = false;
         EnemyManager.instance.makeDarkAll(-255);
         ProjectileManager.instance.makeDarkAll(-255);
         ColorCode.makeDark_blur(stage.grass1_1,-255,5);
         ColorCode.makeDark_blur(stage.grass1_2,-255,5);
         ColorCode.makeDark_blur(stage.grass2_1,-255,5);
         ColorCode.makeDark_blur(stage.grass2_2,-255,5);
         ColorCode.makeDark(stage.tree1,-255);
         ColorCode.makeDark(stage.tree2,-255);
         ColorCode.makeDark(stage.tree3,-255);
         stage.logs1.visible = false;
         stage.logs2.visible = false;
         stage.rock.visible = false;
      }
      
      public function showBossHP() : *
      {
         stage.bosshp.visible = true;
      }
      
      override public function nextArea() : *
      {
         var _loc1_:Enemy = null;
         if(bossNext && Boss1.instance == null)
         {
            doScroll(5);
            _loc1_ = EnemyManager.instance.createEnemyType(21);
            _loc1_.x = 2950;
            _loc1_.facePlayer();
         }
         else if(Boss1.instance != null && Boss1.instance.isDead())
         {
            autoScrollPress();
         }
         else
         {
            doScroll(Math.floor(Math.random() * 3) + 4);
         }
         enemiesInWaiting = -100;
         ++area;
      }
      
      override public function winBossFight() : *
      {
         Boss1.instance.initFlee();
      }
      
      override public function unRedFreeze() : *
      {
         stage.redbg.visible = false;
         stage.leaflayer1.visible = true;
         stage.leaflayer2.visible = true;
         stage.fgtree1.visible = true;
         stage.fgleaf1.visible = true;
         stage.fgleaf2.visible = true;
         stage.fgleaf3.visible = true;
         EnemyManager.instance.makeDarkAll(0);
         ProjectileManager.instance.makeDarkAll(0);
         ColorCode.blur(stage.grass1_1,5);
         ColorCode.blur(stage.grass1_2,5);
         ColorCode.blur(stage.grass2_1,5);
         ColorCode.blur(stage.grass2_2,5);
         ColorCode.blur(stage.logs1,5);
         ColorCode.blur(stage.logs2,5);
         ColorCode.blur(stage.rock,5);
         ColorCode.clearFilter(stage.tree1);
         ColorCode.clearFilter(stage.tree2);
         ColorCode.clearFilter(stage.tree3);
         stage.logs1.visible = true;
         stage.logs2.visible = true;
         stage.rock.visible = true;
      }
      
      override public function doScroll(param1:int) : *
      {
         scrollCounter = param1 * 24;
         Player.instance.isScrolling = true;
         Player.instance.stopMovement();
         InputManager.instance.disable();
         Player.instance.setPosition(Player.instance.x,GameStage.groundY);
      }
      
      public function spawn() : *
      {
         if(Player.instance.isRedFreeze)
         {
            return;
         }
         if(spawnDelay > 0)
         {
            --spawnDelay;
            return;
         }
         switch(area)
         {
            case 1:
               if(EnemyManager.instance.countAlive() < maxEnemies)
               {
                  EnemyManager.instance.createEnemyFromArray_Position(spawnArray,"right");
               }
               break;
            case 3:
               if(EnemyManager.instance.countAlive() < maxEnemies)
               {
                  EnemyManager.instance.createEnemyFromArray_Position([1],"top");
                  EnemyManager.instance.createEnemyFromArray_Position([1],"top");
                  EnemyManager.instance.createEnemyFromArray_Position([6],"top");
               }
               break;
            case 6:
               if(EnemyManager.instance.countAlive() < maxEnemies)
               {
                  EnemyManager.instance.createEnemyFromArray_Position(spawnArray,"right");
               }
               break;
            case 10:
               if(!Boss1.instance.canMove)
               {
                  if(Boss1.instance.enemy.currentFrame != 40)
                  {
                     Boss1.instance.enemy.gotoAndStop(40);
                     stage.bosshp.hpbar.width = 0;
                     stage.bosshp.hurtbar.width = 0;
                     InputManager.instance.disable();
                  }
                  if(stage.bosshp.visible)
                  {
                     if(stage.bosshp.hpbar.width < Boss1.instance.maxhp * 4)
                     {
                        stage.bosshp.hpbar.width += 4;
                        stage.bosshp.hurtbar.width += 4;
                     }
                     else
                     {
                        bossFightStart();
                     }
                  }
               }
               break;
            default:
               if(EnemyManager.instance.countAlive() < maxEnemies)
               {
                  EnemyManager.instance.createEnemyFromArray(spawnArray);
               }
         }
      }
   }
}

