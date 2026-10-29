package
{
   import flash.display.MovieClip;
   
   public class FortWallsStage extends GameStage
   {
      
      public static var instance:FortWallsStage;
      
      internal var autoScroll:Boolean = false;
      
      internal var player:MovieClip;
      
      internal var bosslifeintrodone:Boolean = false;
      
      internal var stage:MovieClip;
      
      public function FortWallsStage(param1:MovieClip)
      {
         super();
         instance = this;
         this.player = param1;
         stage = MovieClip(param1.parent);
         GameStage.setStage(4);
         stage.redbg.visible = false;
         maxEnemies = 2;
         EnemyManager.instance.register(stage.boss4);
         stage.bosshp.visible = true;
         Player.instance.bossFight = true;
         stage.bosshp.hpbar.width = 0;
         stage.bosshp.hurtbar.width = 0;
         totalAreas = 1;
         EnemyManager.instance.createEnemyFromArray_Position([11],"right");
      }
      
      override public function clearFilterAll() : *
      {
         ColorCode.blurHIGH(stage.bg,10);
         ColorCode.blur(stage.fgtree1,10);
         ColorCode.blur(stage.fgleaf1,10);
         ColorCode.blur(stage.fgleaf2,10);
         ColorCode.clearFilter(stage.grass1_1);
         ColorCode.clearFilter(stage.grass1_2);
         ColorCode.clearFilter(stage.grass2_1);
         ColorCode.clearFilter(stage.grass2_2);
         ColorCode.clearFilter(stage.walls1);
         ColorCode.clearFilter(stage.walls2);
         LeafParticleSystem.instance.clearFilterAll();
      }
      
      override public function update() : *
      {
         if(!bosslifeintrodone)
         {
            if(stage.bosshp.hpbar.width < Boss4.instance.maxhp * 5)
            {
               stage.bosshp.hpbar.width += 10;
               stage.bosshp.hurtbar.width += 10;
            }
            else
            {
               bosslifeintrodone = true;
            }
         }
         if(Player.instance.isRedFreeze)
         {
            return;
         }
         scrollRight(3);
         spawn();
         checkTooLeft();
         if(Player.instance.x < 1)
         {
            Player.instance.x = 5;
            Player.instance.gotLaunchedRight();
            Player.instance.gotHit();
         }
      }
      
      override public function desaturateAll() : *
      {
         ColorCode.desaturate_blurHIGH(stage.bg,10);
         ColorCode.desaturate_blur(stage.fgtree1,10);
         ColorCode.desaturate_blur(stage.fgleaf1,10);
         ColorCode.desaturate_blur(stage.fgleaf2,10);
         ColorCode.desaturate(stage.grass1_1);
         ColorCode.desaturate(stage.grass1_2);
         ColorCode.desaturate(stage.grass2_1);
         ColorCode.desaturate(stage.grass2_2);
         ColorCode.desaturate(stage.walls1);
         ColorCode.desaturate(stage.walls2);
         LeafParticleSystem.instance.desaturateAll();
      }
      
      override public function scrollRight(param1:int) : *
      {
         var _loc2_:int = 0;
         EnemyManager.instance.scrollRight(param1);
         ProjectileManager.instance.scrollRight(param1);
         Player.instance.x -= param1;
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
         stage.walls1.x -= param1 / 2;
         stage.walls2.x -= param1 / 2;
         if(stage.walls1.x < 0)
         {
            stage.walls1.x = stage.walls2.x + 936;
         }
         if(stage.walls2.x < 0)
         {
            stage.walls2.x = stage.walls1.x + 936;
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
      }
      
      override public function redFreeze() : *
      {
         stage.redbg.visible = true;
         stage.fgtree1.visible = false;
         stage.fgleaf1.visible = false;
         stage.fgleaf2.visible = false;
         EnemyManager.instance.makeDarkAll(-255);
         ProjectileManager.instance.makeDarkAll(-255);
         ColorCode.makeDark(stage.grass1_1,-255);
         ColorCode.makeDark(stage.grass1_2,-255);
         ColorCode.makeDark_blur(stage.grass2_1,-255,5);
         ColorCode.makeDark_blur(stage.grass2_2,-255,5);
      }
      
      public function checkTooLeft() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = 0;
         while(_loc1_ < EnemyManager.instance.enemyList.length)
         {
            if(EnemyManager.instance.enemyList[_loc1_] != Boss4.instance && EnemyManager.instance.enemyList[_loc1_].x < -50)
            {
               EnemyManager.instance.enemyList[_loc1_].die();
               EnemyManager.instance.enemyList[_loc1_].visible = false;
            }
            _loc1_++;
         }
      }
      
      internal function createRandomEnemy(param1:int) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:int = 0;
         _loc2_ = Math.floor(Math.random() * param1 + 1);
         if(Math.random() * 2 < 1)
         {
            if(Math.random() * 2 < 1)
            {
               _loc2_ = 11;
            }
            else
            {
               _loc2_ = 12;
            }
         }
         _loc3_ = Math.floor(Math.random() * 2);
         if(_loc3_ == 0 || _loc2_ == 13)
         {
            EnemyManager.instance.createEnemy(_loc2_,GameStage.stageWidth + 50,GameStage.groundY);
         }
         else
         {
            EnemyManager.instance.createEnemy(_loc2_,Math.random() * GameStage.stageWidth,-50);
         }
      }
      
      override public function unRedFreeze() : *
      {
         stage.redbg.visible = false;
         stage.fgtree1.visible = true;
         stage.fgleaf1.visible = true;
         stage.fgleaf2.visible = true;
         EnemyManager.instance.clearFilterAll();
         ProjectileManager.instance.clearFilterAll();
         ColorCode.clearFilter(stage.grass1_1);
         ColorCode.clearFilter(stage.grass1_2);
         ColorCode.blur(stage.grass2_1,5);
         ColorCode.blur(stage.grass2_2,5);
      }
      
      public function spawn() : *
      {
         if(Player.instance.isRedFreeze)
         {
            return;
         }
         if(EnemyManager.instance.countAlive() < maxEnemies)
         {
            createRandomEnemy(13);
         }
      }
   }
}

