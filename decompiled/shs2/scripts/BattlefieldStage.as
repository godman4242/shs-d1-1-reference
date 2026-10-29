package
{
   import flash.display.MovieClip;
   
   public class BattlefieldStage extends GameStage
   {
      
      public static var instance:BattlefieldStage;
      
      internal var hpbardone:Boolean = false;
      
      internal var treePlatform1:MovieClip;
      
      internal var treePlatform2:MovieClip;
      
      internal var bosslearning1out:Boolean = false;
      
      internal var bosslearning3out:Boolean = false;
      
      internal var autoScroll:Boolean = false;
      
      internal var player:MovieClip;
      
      internal var bosslearning2out:Boolean = false;
      
      internal var stage:MovieClip;
      
      public function BattlefieldStage(param1:MovieClip)
      {
         super();
         GameStage.groundY = 350;
         instance = this;
         this.player = param1;
         stage = MovieClip(param1.parent);
         GameStage.setStage(3);
         stage.redbg.visible = false;
         area = 1;
         treePlatform1 = new battlefield_tree2_platform();
         treePlatform2 = new battlefield_tree5_platform();
         stage.ground.addChild(treePlatform1);
         stage.ground.addChild(treePlatform2);
         treePlatform1.x = -100;
         treePlatform2.x = -100;
         treePlatform1.y = stage.tree1.y;
         treePlatform2.y = stage.tree2.y;
         totalAreas = 7;
         Boss3.instance = null;
         if(StatsManager.skipToBoss)
         {
            area = 6;
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
         EnemyManager.instance.makeDarkAll(-255);
         ProjectileManager.instance.makeDarkAll(-255);
         ColorCode.makeDark(stage.grass1_1,-255);
         ColorCode.makeDark(stage.grass1_2,-255);
         ColorCode.makeDark_blur(stage.grass2_1,-255,5);
         ColorCode.makeDark_blur(stage.grass2_2,-255,5);
         ColorCode.makeDark(stage.grass3_1,-255);
         ColorCode.makeDark(stage.grass3_2,-255);
         ColorCode.makeDark_blur(stage.grass4_1,-255,5);
         ColorCode.makeDark_blur(stage.grass4_2,-255,5);
         ColorCode.makeDark(stage.tree1,-255);
         ColorCode.makeDark(stage.tree2,-255);
         ColorCode.makeDark_blur(stage.tree3,-255,5);
         ColorCode.makeDark_blur(stage.tree4,-255,5);
      }
      
      override public function nextArea() : *
      {
         var _loc1_:Enemy = null;
         if(bossNext && Boss3.instance == null)
         {
            doScroll(5);
            _loc1_ = EnemyManager.instance.createEnemyType(23);
            _loc1_.x = 2950;
            _loc1_.facePlayer();
            Boss3.instance.createTargetLine();
            Boss3.instance.gotoAndStop(35);
         }
         else if(Boss3.instance != null && Boss3.instance.isDead())
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
         Boss3.instance.initDie();
      }
      
      override public function doScroll(param1:int) : *
      {
         scrollCounter = param1 * 24;
         Player.instance.isScrolling = true;
         Player.instance.stopMovement();
         InputManager.instance.disable();
         Player.instance.setPosition(Player.instance.x,GameStage.groundY);
         stage.bossoverheat.visible = false;
      }
      
      override public function clearFilterAll() : *
      {
         ColorCode.blur(stage.bg,10);
         ColorCode.blur(stage.fgtree1,10);
         ColorCode.blur(stage.fgleaf1,10);
         ColorCode.blur(stage.fgleaf2,10);
         ColorCode.clearFilter(stage.tree1);
         ColorCode.clearFilter(stage.tree2);
         ColorCode.blur(stage.tree3,5);
         ColorCode.blur(stage.tree4,5);
         ColorCode.clearFilter(stage.grass1_1);
         ColorCode.clearFilter(stage.grass1_2);
         ColorCode.clearFilter(stage.grass2_1);
         ColorCode.clearFilter(stage.grass2_2);
         ColorCode.blur(stage.grass3_1,5);
         ColorCode.blur(stage.grass3_2,5);
         ColorCode.blur(stage.grass4_1,5);
         ColorCode.blur(stage.grass4_2,5);
         LeafParticleSystem.instance.clearFilterAll();
      }
      
      public function initArea() : *
      {
         switch(area)
         {
            case 1:
               spawnArray = [6,7,12];
               enemiesInWaiting = 12;
               maxEnemies = 4;
               break;
            case 2:
               spawnArray = [6,7,8,9,13];
               enemiesInWaiting = 12;
               maxEnemies = 4;
               break;
            case 3:
               spawnArray = [7,11];
               enemiesInWaiting = 15;
               maxEnemies = 5;
               break;
            case 4:
               spawnArray = [6,7,8,9,10,11,12];
               enemiesInWaiting = 12;
               maxEnemies = 4;
               break;
            case 5:
               enemiesInWaiting = 1;
               maxEnemies = 1;
               break;
            case 6:
               spawnArray = [6,7,8,9,10,11,12,13];
               enemiesInWaiting = 12;
               maxEnemies = 4;
               bossNext = true;
               playerGotoLeft = true;
               break;
            case 7:
               SoundManager.instance.playMusic(7);
               enemiesInWaiting = 0;
               maxEnemies = 1;
               bossNext = false;
               playerGotoLeft = false;
               stage.bosshp.visible = true;
               stage.bosshp.hpbar.width = 0;
               stage.bosshp.hurtbar.width = 0;
               Player.instance.bossFight = true;
               InputManager.instance.disable();
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
      
      override public function update() : *
      {
         if(Boolean(stage.bosshp != null) && Boolean(stage.bosshp.visible) && !hpbardone)
         {
            stage.bosshp.hpbar.width += 4;
            stage.bosshp.hurtbar.width += 4;
            if(stage.bosshp.hpbar.width >= Boss3.instance.maxhp * 4)
            {
               hpbardone = true;
               Boss3.instance.canMove = true;
               InputManager.instance.enable();
               stage.bossoverheat.visible = true;
               Boss3.instance.updateBossOverheat();
            }
         }
         if(autoScroll)
         {
            scrollRight(20);
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
      
      override public function scrollRight(param1:int) : *
      {
         var _loc2_:int = 0;
         EnemyManager.instance.scrollRight(param1);
         ProjectileManager.instance.scrollRight(param1);
         stage.fgtree1.x -= param1 * 2;
         if(stage.fgtree1.x < -100 && !bossNext)
         {
            stage.fgtree1.x = Math.random() * 1600 + 1600;
            _loc2_ = Math.random() * 2;
            if(_loc2_ == 0)
            {
               stage.fgtree1.scaleX = 2.5;
            }
            else if(_loc2_ == 1)
            {
               stage.fgtree1.scaleX = -2.5;
            }
         }
         stage.fgleaf1.x -= param1 * 2;
         if(stage.fgleaf1.x < -100)
         {
            stage.fgleaf1.x = Math.random() * 300 + 1000;
            stage.fgleaf1.scaleX = (Math.random() * 5 + 7) / 10;
            stage.fgleaf1.scaleY = (Math.random() * 5 + 7) / 10;
         }
         stage.fgleaf2.x -= param1 * 2;
         if(stage.fgleaf2.x < -100)
         {
            stage.fgleaf2.x = Math.random() * 300 + 1000;
            stage.fgleaf2.scaleX = (Math.random() * 5 + 7) / 10;
            stage.fgleaf2.scaleY = (Math.random() * 5 + 7) / 10;
         }
         stage.grass1_1.x -= param1;
         stage.grass1_2.x -= param1;
         if(stage.grass1_1.x < -800)
         {
            stage.grass1_1.x = stage.grass1_2.x + 750;
         }
         if(stage.grass1_2.x < -800)
         {
            stage.grass1_2.x = stage.grass1_1.x + 750;
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
         stage.grass3_1.x -= param1;
         stage.grass3_2.x -= param1;
         if(stage.grass3_1.x < -700)
         {
            stage.grass3_1.x = stage.grass3_2.x + 700;
         }
         if(stage.grass3_2.x < -700)
         {
            stage.grass3_2.x = stage.grass3_1.x + 700;
         }
         stage.grass4_1.x -= param1 / 3;
         stage.grass4_2.x -= param1 / 3;
         if(stage.grass4_1.x < -700)
         {
            stage.grass4_1.x = stage.grass4_2.x + 700;
         }
         if(stage.grass4_2.x < -700)
         {
            stage.grass4_2.x = stage.grass4_1.x + 700;
         }
         stage.tree1.x -= param1;
         if(stage.tree1.x < -200)
         {
            stage.tree1.x = Math.random() * 800 + 800;
            _loc2_ = Math.random() * 3;
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
               stage.tree1.scaleX = 0;
            }
            treePlatform1.scaleX = stage.tree1.scaleX;
         }
         treePlatform1.x = stage.tree1.x;
         stage.tree2.x -= param1;
         if(stage.tree2.x < -200)
         {
            stage.tree2.x = Math.random() * 800 + 800;
            _loc2_ = Math.random() * 3;
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
               stage.tree2.scaleX = 0;
            }
            treePlatform2.scaleX = stage.tree2.scaleX;
         }
         treePlatform2.x = stage.tree2.x;
         stage.tree3.x -= param1 / 3;
         if(stage.tree3.x < -200)
         {
            stage.tree3.x = Math.random() * 800 + 800;
            _loc2_ = Math.random() * 3;
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
               stage.tree3.scaleX = 0;
            }
         }
         stage.tree4.x -= param1 / 3;
         if(stage.tree4.x < -200)
         {
            stage.tree4.x = Math.random() * 800 + 800;
            _loc2_ = Math.random() * 3;
            if(_loc2_ == 0)
            {
               stage.tree4.scaleX = 1;
            }
            else if(_loc2_ == 1)
            {
               stage.tree4.scaleX = -1;
            }
            else if(_loc2_ == 2)
            {
               stage.tree4.scaleX = 0;
            }
         }
      }
      
      override public function desaturateAll() : *
      {
         ColorCode.desaturate_blur(stage.bg,10);
         ColorCode.desaturate_blur(stage.fgtree1,10);
         ColorCode.desaturate_blur(stage.fgleaf1,10);
         ColorCode.desaturate_blur(stage.fgleaf2,10);
         ColorCode.desaturate(stage.tree1);
         ColorCode.desaturate(stage.tree2);
         ColorCode.desaturate_blur(stage.tree3,5);
         ColorCode.desaturate_blur(stage.tree4,5);
         ColorCode.desaturate(stage.grass1_1);
         ColorCode.desaturate(stage.grass1_2);
         ColorCode.desaturate(stage.grass2_1);
         ColorCode.desaturate(stage.grass2_2);
         ColorCode.desaturate_blur(stage.grass3_1,5);
         ColorCode.desaturate_blur(stage.grass3_2,5);
         ColorCode.desaturate_blur(stage.grass4_1,5);
         ColorCode.desaturate_blur(stage.grass4_2,5);
         LeafParticleSystem.instance.desaturateAll();
      }
      
      override public function unRedFreeze() : *
      {
         stage.redbg.visible = false;
         stage.leaflayer1.visible = true;
         stage.leaflayer2.visible = true;
         stage.fgtree1.visible = true;
         stage.fgleaf1.visible = true;
         stage.fgleaf2.visible = true;
         EnemyManager.instance.clearFilterAll();
         ProjectileManager.instance.clearFilterAll();
         ColorCode.clearFilter(stage.grass1_1);
         ColorCode.clearFilter(stage.grass1_2);
         ColorCode.blur(stage.grass2_1,5);
         ColorCode.blur(stage.grass2_2,5);
         ColorCode.clearFilter(stage.grass3_1);
         ColorCode.clearFilter(stage.grass3_2);
         ColorCode.blur(stage.grass4_1,5);
         ColorCode.blur(stage.grass4_2,5);
         ColorCode.clearFilter(stage.tree1);
         ColorCode.clearFilter(stage.tree2);
         ColorCode.blur(stage.tree3,5);
         ColorCode.blur(stage.tree4,5);
      }
      
      public function spawn() : *
      {
         var _loc1_:MovieClip = null;
         if(Player.instance.isRedFreeze)
         {
            return;
         }
         switch(area)
         {
            case 2:
               if(!bosslearning1out)
               {
                  bosslearning1out = true;
                  _loc1_ = EnemyManager.instance.createEnemyType(25);
                  _loc1_.formMode = 1;
               }
               if(EnemyManager.instance.countAlive() < maxEnemies)
               {
                  EnemyManager.instance.createEnemyFromArray(spawnArray);
               }
               break;
            case 5:
               if(!bosslearning3out)
               {
                  bosslearning3out = true;
                  _loc1_ = EnemyManager.instance.createEnemyType(25);
                  _loc1_.formMode = 3;
                  _loc1_.createTargetLine();
               }
               break;
            case 7:
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

