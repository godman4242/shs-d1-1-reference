package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol320")]
   public class Enemy_guardtower extends Enemy
   {
      
      public static var typeCode:int = 102;
      
      internal var e2dead:Boolean = false;
      
      internal var ducking:Boolean = false;
      
      internal var moved:Boolean = false;
      
      internal var e1dead:Boolean = false;
      
      public var enemy1:MovieClip;
      
      public var enemy2:MovieClip;
      
      public var enemy3:MovieClip;
      
      internal var e3dead:Boolean = false;
      
      public function Enemy_guardtower()
      {
         super();
         speed = 0;
         hp = 3;
         AIcounterMax = 12;
         destinationX = this.x;
         actionState = STOP_STATE;
      }
      
      internal function AI() : *
      {
         if(!ducking)
         {
            if(Math.random() * 10 < 1)
            {
               duck();
            }
            else if(Math.random() * 4 < 1)
            {
               doAttack();
            }
         }
         else if(Math.random() * 10 < 1)
         {
            comeout();
         }
         else if(Math.random() * 25 < 1)
         {
            spawnSpear();
         }
      }
      
      override public function die() : *
      {
         dead = true;
      }
      
      override public function unpauseGame() : *
      {
      }
      
      override public function freeze() : *
      {
         frozen = true;
      }
      
      internal function duck() : *
      {
         if(!ducking)
         {
            if(!e1dead)
            {
               enemy1.gotoAndPlay(10);
            }
            if(!e2dead)
            {
               enemy2.gotoAndPlay(10);
            }
            if(!e3dead)
            {
               enemy3.gotoAndPlay(10);
            }
            ducking = true;
         }
      }
      
      internal function doAttack() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = 0;
         while(_loc1_ < hp)
         {
            shootArrow();
            _loc1_++;
         }
      }
      
      override public function update() : *
      {
         var _loc1_:* = undefined;
         if(Player.stageMode == 1 && !moved)
         {
            _loc1_ = new Point(x,y);
            _loc1_ = MovieClip(this.parent).localToGlobal(_loc1_);
            _loc1_ = EnemyManager.instance.getGameStage().globalToLocal(_loc1_);
            this.setPosition(_loc1_.x,_loc1_.y);
            EnemyManager.instance.getGameStage().addChild(this);
            moved = true;
         }
         if(frozen)
         {
            return;
         }
         --AIcounter;
         if(AIcounter <= 0)
         {
            AIcounter = AIcounterMax;
            AI();
         }
      }
      
      override public function arrowHit(param1:Arrow_player) : Boolean
      {
         duck();
         if(param1.hitTestObject(enemy1) && !enemy1.down)
         {
            e1dead = true;
            --hp;
            enemy1.visible = false;
            spawnSpear();
            createFaller();
            Player.instance.displayScoreMessage("+100");
            StatsManager.instance.addScore(100);
            return true;
         }
         if(param1.hitTestObject(enemy2) && !enemy2.down)
         {
            e2dead = true;
            --hp;
            enemy2.visible = false;
            spawnSpear();
            createFaller();
            Player.instance.displayScoreMessage("+100");
            StatsManager.instance.addScore(100);
            return true;
         }
         if(param1.hitTestObject(enemy3) && !enemy3.down)
         {
            e3dead = true;
            --hp;
            enemy3.visible = false;
            spawnSpear();
            createFaller();
            Player.instance.displayScoreMessage("+100");
            StatsManager.instance.addScore(100);
            return true;
         }
         return false;
      }
      
      override public function pauseGame() : *
      {
      }
      
      internal function spawnSpear() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = 0;
         while(_loc1_ < 4 - hp)
         {
            EnemyManager.instance.createEnemyType(4);
            _loc1_++;
         }
         if(hp == 0)
         {
            EnemyManager.instance.setEnemyInWaiting(0);
            Player.instance.displayScoreMessage("Defeated Guard Tower: +1000");
            StatsManager.instance.addScore(1000);
            StageManager.instance.showHint(LangManager.getWords(5));
         }
      }
      
      public function shootArrow() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         _loc1_ = new Point(x,y);
         _loc1_ = MovieClip(this.parent).localToGlobal(_loc1_);
         _loc1_ = EnemyManager.instance.getGameStage().globalToLocal(_loc1_);
         _loc2_ = _loc1_.x;
         _loc3_ = _loc1_.y - 300;
         _loc4_ = Math.random() * 25 + 5;
         _loc5_ = Math.random() * 20 - 5;
         _loc6_ = EnemyManager.instance.gameStage.globalToLocal(new Point(Player.instance.x,Player.instance.y));
         if(_loc2_ > _loc6_.x)
         {
            _loc4_ = -Math.abs(_loc4_);
         }
         _loc7_ = ProjectileManager.instance.createProjectile(Arrow.typeCode,_loc2_,_loc3_,_loc4_,_loc5_);
         if(_loc4_ < 0)
         {
            _loc7_.scaleX = -1;
         }
      }
      
      internal function createFaller() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         _loc1_ = Math.random() * 2 - 4;
         _loc2_ = ProjectileManager.instance.createProjectile(8,x,y - 250,_loc1_,8);
         MovieClip(parent).addChild(_loc2_);
         MovieClip(parent).setChildIndex(_loc2_,MovieClip(parent).getChildIndex(this));
         SoundManager.instance.playDie();
      }
      
      override public function hit(param1:int, param2:int) : Boolean
      {
         return false;
      }
      
      internal function comeout() : *
      {
         if(ducking)
         {
            if(!e1dead)
            {
               enemy1.gotoAndPlay(20);
            }
            if(!e2dead)
            {
               enemy2.gotoAndPlay(20);
            }
            if(!e3dead)
            {
               enemy3.gotoAndPlay(20);
            }
            ducking = false;
            doAttack();
         }
      }
   }
}

