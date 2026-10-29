package
{
   import flash.display.MovieClip;
   
   public class MountainStage extends GameStage
   {
      
      public static var instance:MountainStage;
      
      internal var landEndPlatform:mountain_landend_platform;
      
      internal var triggerUpPlatform:MovieClip;
      
      internal var upwardsScroll:Boolean = false;
      
      internal var noLandScrollUp:Boolean = false;
      
      internal var scrollStanding:Boolean = false;
      
      internal var noLandTransition:Boolean = false;
      
      internal var triggerRightPlatform:MovieClip;
      
      internal var noLand:Boolean = false;
      
      internal var autoScroll:Boolean = false;
      
      internal var player:MovieClip;
      
      internal var noLandScrollRight:Boolean = false;
      
      internal var stage:MovieClip;
      
      public function MountainStage(param1:MovieClip)
      {
         super();
         GameStage.groundY = 350;
         instance = this;
         this.player = param1;
         stage = MovieClip(param1.parent);
         GameStage.setStage(2);
         stage.redbg.visible = false;
         stage.mountainshade.visible = false;
         stage.mountain3.visible = false;
         stage.mountain3.gotoAndStop(2);
         stage.exitledge1.visible = false;
         stage.exitledge2.visible = false;
         stage.exitledge3.visible = false;
         totalAreas = 17;
         area = 1;
         Boss2.instance = null;
         if(StatsManager.skipToBoss)
         {
            area = 16;
            noLand = true;
         }
      }
      
      override public function redFreeze() : *
      {
         stage.redbg.visible = true;
         stage.leaflayer1.visible = false;
         stage.leaflayer2.visible = false;
         stage.fgtree1.visible = false;
         stage.fgtree2.visible = false;
         stage.fgleaf1.visible = false;
         stage.fgleaf2.visible = false;
         stage.fgleaf3.visible = false;
         EnemyManager.instance.makeDarkAll(-255);
         ProjectileManager.instance.makeDarkAll(-255);
         ColorCode.makeDark(stage.grass1_1,-255);
         ColorCode.makeDark(stage.grass1_2,-255);
         ColorCode.makeDark(stage.grass2_1,-255);
         ColorCode.makeDark(stage.grass2_2,-255);
         ColorCode.makeDark(stage.fence1,-255);
         ColorCode.makeDark(stage.fence2,-255);
         ColorCode.makeDark(stage.fence3,-255);
         ColorCode.makeDark(stage.ledge1,-255);
         ColorCode.makeDark(stage.ledge2,-255);
         ColorCode.makeDark(stage.ledge3,-255);
         ColorCode.makeDark(stage.ledge4,-255);
         ColorCode.makeDark(stage.ledge5,-255);
         ColorCode.makeDark(stage.ledge6,-255);
         ColorCode.makeDark(stage.exitledge1,-255);
         ColorCode.makeDark(stage.exitledge2,-255);
         ColorCode.makeDark(stage.exitledge3,-255);
         ColorCode.makeDark(stage.landend,-255);
         stage.ledge1.visible = stage.ledge1.hitTestPoint(Player.instance.x,Player.instance.y + 10) && stage.ledge1.pactive;
         stage.ledge2.visible = stage.ledge2.hitTestPoint(Player.instance.x,Player.instance.y + 10) && stage.ledge2.pactive;
         stage.ledge3.visible = stage.ledge3.hitTestPoint(Player.instance.x,Player.instance.y + 10) && stage.ledge3.pactive;
         stage.ledge4.visible = stage.ledge4.hitTestPoint(Player.instance.x,Player.instance.y + 10) && stage.ledge4.pactive;
         stage.ledge5.visible = stage.ledge5.hitTestPoint(Player.instance.x,Player.instance.y + 10) && stage.ledge5.pactive;
         stage.ledge6.visible = stage.ledge6.hitTestPoint(Player.instance.x,Player.instance.y + 10) && stage.ledge6.pactive;
         stage.ledge7.visible = stage.ledge7.hitTestPoint(Player.instance.x,Player.instance.y + 10) && stage.ledge7.pactive;
         stage.ledge8.visible = stage.ledge8.hitTestPoint(Player.instance.x,Player.instance.y + 10) && stage.ledge8.pactive;
         stage.ledge9.visible = stage.ledge9.hitTestPoint(Player.instance.x,Player.instance.y + 10) && stage.ledge9.pactive;
         stage.ledge1.shadow.visible = false;
         stage.ledge2.shadow.visible = false;
         stage.ledge3.shadow.visible = false;
         stage.ledge4.shadow.visible = false;
         stage.ledge5.shadow.visible = false;
         stage.ledge6.shadow.visible = false;
         stage.ledge7.shadow.visible = false;
         stage.ledge8.shadow.visible = false;
         stage.ledge9.shadow.visible = false;
      }
      
      public function notifyNoEnemiesLeft() : *
      {
         if(upwardsScroll)
         {
            notifyCanMoveUp();
            return;
         }
         if(triggerRightPlatform == null)
         {
            triggerRightPlatform = getNextTriggerRightPlatform();
            if(triggerRightPlatform == null)
            {
               trace("no platform");
               if(stage.exitledge1.x > 800)
               {
                  stage.exitledge1.x = 500;
                  stage.exitledge1.showPlatform(-1);
                  triggerRightPlatform = stage.exitledge1;
               }
               else if(stage.exitledge2.x > 800)
               {
                  stage.exitledge2.x = 500;
                  stage.exitledge2.showPlatform(-1);
                  triggerRightPlatform = stage.exitledge2;
               }
               else
               {
                  stage.exitledge3.x = 500;
                  stage.exitledge3.showPlatform(-1);
                  triggerRightPlatform = stage.exitledge3;
               }
            }
            triggerRightPlatform.gotoAndStop(2);
            if(triggerRightPlatform.scaleX == -1)
            {
               triggerRightPlatform.go.scaleX = -1;
            }
            else
            {
               triggerRightPlatform.go.scaleX = 1;
            }
         }
      }
      
      public function getLeftestPlatform() : MovieClip
      {
         var _loc1_:* = undefined;
         var _loc2_:MovieClip = null;
         var _loc3_:* = undefined;
         _loc1_ = new Array();
         if(Boolean(stage.ledge1.pactive && stage.ledge1.x > 0 && stage.ledge1.x < GameStage.stageWidth) && Boolean(stage.ledge1.y > 0) && stage.ledge1.y < 400)
         {
            _loc1_.push(stage.ledge1);
         }
         if(Boolean(stage.ledge2.pactive && stage.ledge2.x > 0 && stage.ledge2.x < GameStage.stageWidth) && Boolean(stage.ledge2.y > 0) && stage.ledge2.y < 400)
         {
            _loc1_.push(stage.ledge2);
         }
         if(Boolean(stage.ledge3.pactive && stage.ledge3.x > 0 && stage.ledge3.x < GameStage.stageWidth) && Boolean(stage.ledge3.y > 0) && stage.ledge3.y < 400)
         {
            _loc1_.push(stage.ledge3);
         }
         if(Boolean(stage.ledge4.pactive && stage.ledge4.x > 0 && stage.ledge4.x < GameStage.stageWidth) && Boolean(stage.ledge4.y > 0) && stage.ledge4.y < 400)
         {
            _loc1_.push(stage.ledge4);
         }
         if(Boolean(stage.ledge5.pactive && stage.ledge5.x > 0 && stage.ledge5.x < GameStage.stageWidth) && Boolean(stage.ledge5.y > 0) && stage.ledge5.y < 400)
         {
            _loc1_.push(stage.ledge5);
         }
         if(Boolean(stage.ledge6.pactive && stage.ledge6.x > 0 && stage.ledge6.x < GameStage.stageWidth) && Boolean(stage.ledge6.y > 0) && stage.ledge6.y < 400)
         {
            _loc1_.push(stage.ledge6);
         }
         if(Boolean(stage.ledge7.pactive && stage.ledge7.x > 0 && stage.ledge7.x < GameStage.stageWidth) && Boolean(stage.ledge7.y > 0) && stage.ledge7.y < 400)
         {
            _loc1_.push(stage.ledge7);
         }
         if(Boolean(stage.ledge8.pactive && stage.ledge8.x > 0 && stage.ledge8.x < GameStage.stageWidth) && Boolean(stage.ledge8.y > 0) && stage.ledge8.y < 400)
         {
            _loc1_.push(stage.ledge8);
         }
         if(Boolean(stage.ledge9.pactive && stage.ledge9.x > 0 && stage.ledge9.x < GameStage.stageWidth) && Boolean(stage.ledge9.y > 0) && stage.ledge9.y < 400)
         {
            _loc1_.push(stage.ledge9);
         }
         if(Boolean(stage.exitledge1.pactive && stage.exitledge1.x > 0 && stage.exitledge1.x < GameStage.stageWidth) && Boolean(stage.exitledge1.y > 0) && stage.exitledge1.y < 400)
         {
            _loc1_.push(stage.exitledge1);
         }
         if(Boolean(stage.exitledge2.pactive && stage.exitledge2.x > 0 && stage.exitledge2.x < GameStage.stageWidth) && Boolean(stage.exitledge2.y > 0) && stage.exitledge2.y < 400)
         {
            _loc1_.push(stage.exitledge2);
         }
         if(Boolean(stage.exitledge3.pactive && stage.exitledge3.x > 0 && stage.exitledge3.x < GameStage.stageWidth) && Boolean(stage.exitledge3.y > 0) && stage.exitledge3.y < 400)
         {
            _loc1_.push(stage.exitledge3);
         }
         if(_loc1_.length == 0)
         {
            return null;
         }
         _loc2_ = _loc1_[0];
         _loc3_ = 1;
         while(_loc3_ < _loc1_.length)
         {
            if(_loc1_[_loc3_].x < _loc2_.x)
            {
               _loc2_ = _loc1_[_loc3_];
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function getNextTriggerUpPlatform() : MovieClip
      {
         var _loc1_:* = undefined;
         var _loc2_:MovieClip = null;
         var _loc3_:* = undefined;
         _loc1_ = new Array();
         if(Boolean(stage.ledge1.pactive && stage.ledge1.x > 0 && stage.ledge1.x < GameStage.stageWidth) && Boolean(stage.ledge1.y >= 50) && stage.ledge1.y < 400)
         {
            _loc1_.push(stage.ledge1);
         }
         if(Boolean(stage.ledge2.pactive && stage.ledge2.x > 0 && stage.ledge2.x < GameStage.stageWidth) && Boolean(stage.ledge2.y >= 50) && stage.ledge2.y < 400)
         {
            _loc1_.push(stage.ledge2);
         }
         if(Boolean(stage.ledge3.pactive && stage.ledge3.x > 0 && stage.ledge3.x < GameStage.stageWidth) && Boolean(stage.ledge3.y >= 50) && stage.ledge3.y < 400)
         {
            _loc1_.push(stage.ledge3);
         }
         if(Boolean(stage.ledge4.pactive && stage.ledge4.x > 0 && stage.ledge4.x < GameStage.stageWidth) && Boolean(stage.ledge4.y >= 50) && stage.ledge4.y < 400)
         {
            _loc1_.push(stage.ledge4);
         }
         if(Boolean(stage.ledge5.pactive && stage.ledge5.x > 0 && stage.ledge5.x < GameStage.stageWidth) && Boolean(stage.ledge5.y >= 50) && stage.ledge5.y < 400)
         {
            _loc1_.push(stage.ledge5);
         }
         if(Boolean(stage.ledge6.pactive && stage.ledge6.x > 0 && stage.ledge6.x < GameStage.stageWidth) && Boolean(stage.ledge6.y >= 50) && stage.ledge6.y < 400)
         {
            _loc1_.push(stage.ledge6);
         }
         if(Boolean(stage.ledge7.pactive && stage.ledge7.x > 0 && stage.ledge7.x < GameStage.stageWidth) && Boolean(stage.ledge7.y >= 50) && stage.ledge7.y < 400)
         {
            _loc1_.push(stage.ledge7);
         }
         if(Boolean(stage.ledge8.pactive && stage.ledge8.x > 0 && stage.ledge8.x < GameStage.stageWidth) && Boolean(stage.ledge8.y >= 50) && stage.ledge8.y < 400)
         {
            _loc1_.push(stage.ledge8);
         }
         if(Boolean(stage.ledge9.pactive && stage.ledge9.x > 0 && stage.ledge9.x < GameStage.stageWidth) && Boolean(stage.ledge9.y >= 50) && stage.ledge9.y < 400)
         {
            _loc1_.push(stage.ledge9);
         }
         if(Boolean(stage.exitledge1.pactive && stage.exitledge1.x > 0 && stage.exitledge1.x < GameStage.stageWidth) && Boolean(stage.exitledge1.y >= 50) && stage.exitledge1.y < 400)
         {
            _loc1_.push(stage.exitledge1);
         }
         if(Boolean(stage.exitledge2.pactive && stage.exitledge2.x > 0 && stage.exitledge2.x < GameStage.stageWidth) && Boolean(stage.exitledge2.y >= 50) && stage.exitledge2.y < 400)
         {
            _loc1_.push(stage.exitledge2);
         }
         if(Boolean(stage.exitledge3.pactive && stage.exitledge3.x > 0 && stage.exitledge3.x < GameStage.stageWidth) && Boolean(stage.exitledge3.y >= 50) && stage.exitledge3.y < 400)
         {
            _loc1_.push(stage.exitledge3);
         }
         if(_loc1_.length == 0)
         {
            return null;
         }
         _loc2_ = _loc1_[0];
         _loc3_ = 1;
         while(_loc3_ < _loc1_.length)
         {
            if(_loc1_[_loc3_].y < _loc2_.y)
            {
               _loc2_ = _loc1_[_loc3_];
            }
            _loc3_++;
         }
         if(_loc2_.y >= 300)
         {
            return null;
         }
         return _loc2_;
      }
      
      override public function nextArea() : *
      {
         var _loc1_:Enemy = null;
         if(noLandTransition)
         {
            noLand = true;
            if(stage.grass1_1.x > stage.grass1_2 && stage.grass1_1.x > 100)
            {
               stage.landend.x = stage.grass1_1.x + 800;
            }
            else
            {
               stage.landend.x = stage.grass1_2.x + 800;
            }
            stage.mountain1.y += 75;
            stage.mountain2.y += 75;
            stage.mountain1.gotoAndStop(2);
            stage.mountain2.gotoAndStop(2);
            stage.mountainshade.visible = true;
            stage.grass2_1.visible = false;
            stage.grass2_2.visible = false;
            if(stage.fence1.x > stage.landend.x + 700)
            {
               stage.fence1.visible = false;
            }
            if(stage.fence2.x > stage.landend.x + 700)
            {
               stage.fence2.visible = false;
            }
            if(stage.fence3.x > stage.landend.x + 700)
            {
               stage.fence3.visible = false;
            }
            stage.fence4.visible = false;
            stage.fence5.visible = false;
            stage.fence6.visible = false;
            stage.banner.visible = false;
            landEndPlatform = new mountain_landend_platform();
            stage.ground.addChild(landEndPlatform);
            landEndPlatform.x = stage.landend.x;
            landEndPlatform.y = stage.landend.y;
            stage.exitledge1.visible = true;
            stage.exitledge2.visible = true;
            stage.exitledge3.visible = true;
            stage.exitledge1.x = stage.landend.x + 1450;
            stage.exitledge1.showPlatform(-1);
            stage.exitledge2.x = stage.exitledge1.x + 400;
            stage.exitledge2.showPlatform(-1);
            stage.exitledge3.x = stage.landend.x + 1150;
            stage.exitledge3.gotoAndStop(3);
            stage.exitledge3.showPlatform(200);
            doScroll(5);
         }
         else if(bossNext && Boss2.instance == null)
         {
            doScroll(2);
            _loc1_ = EnemyManager.instance.createEnemyType(22);
            stage.enemyLayer2.addChild(_loc1_);
            _loc1_.setPosition(0,-100);
            _loc1_.facePlayer();
         }
         else if(noLand)
         {
            doScroll(2);
         }
         else if(Boss1.instance != null && Boss1.instance.isDead())
         {
            trace("defeated boss");
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
      }
      
      public function getTopPlatform() : MovieClip
      {
         var _loc1_:* = undefined;
         var _loc2_:MovieClip = null;
         var _loc3_:* = undefined;
         _loc1_ = new Array();
         if(Boolean(stage.ledge1.pactive && stage.ledge1.x > 0 && stage.ledge1.x < GameStage.stageWidth) && Boolean(stage.ledge1.y > 0) && stage.ledge1.y < 400)
         {
            _loc1_.push(stage.ledge1);
         }
         if(Boolean(stage.ledge2.pactive && stage.ledge2.x > 0 && stage.ledge2.x < GameStage.stageWidth) && Boolean(stage.ledge2.y > 0) && stage.ledge2.y < 400)
         {
            _loc1_.push(stage.ledge2);
         }
         if(Boolean(stage.ledge3.pactive && stage.ledge3.x > 0 && stage.ledge3.x < GameStage.stageWidth) && Boolean(stage.ledge3.y > 0) && stage.ledge3.y < 400)
         {
            _loc1_.push(stage.ledge3);
         }
         if(Boolean(stage.ledge4.pactive && stage.ledge4.x > 0 && stage.ledge4.x < GameStage.stageWidth) && Boolean(stage.ledge4.y > 0) && stage.ledge4.y < 400)
         {
            _loc1_.push(stage.ledge4);
         }
         if(Boolean(stage.ledge5.pactive && stage.ledge5.x > 0 && stage.ledge5.x < GameStage.stageWidth) && Boolean(stage.ledge5.y > 0) && stage.ledge5.y < 400)
         {
            _loc1_.push(stage.ledge5);
         }
         if(Boolean(stage.ledge6.pactive && stage.ledge6.x > 0 && stage.ledge6.x < GameStage.stageWidth) && Boolean(stage.ledge6.y > 0) && stage.ledge6.y < 400)
         {
            _loc1_.push(stage.ledge6);
         }
         if(Boolean(stage.ledge7.pactive && stage.ledge7.x > 0 && stage.ledge7.x < GameStage.stageWidth) && Boolean(stage.ledge7.y > 0) && stage.ledge7.y < 400)
         {
            _loc1_.push(stage.ledge7);
         }
         if(Boolean(stage.ledge8.pactive && stage.ledge8.x > 0 && stage.ledge8.x < GameStage.stageWidth) && Boolean(stage.ledge8.y > 0) && stage.ledge8.y < 400)
         {
            _loc1_.push(stage.ledge8);
         }
         if(Boolean(stage.ledge9.pactive && stage.ledge9.x > 0 && stage.ledge9.x < GameStage.stageWidth) && Boolean(stage.ledge9.y > 0) && stage.ledge9.y < 400)
         {
            _loc1_.push(stage.ledge9);
         }
         if(Boolean(stage.exitledge1.pactive && stage.exitledge1.x > 0 && stage.exitledge1.x < GameStage.stageWidth) && Boolean(stage.exitledge1.y > 0) && stage.exitledge1.y < 400)
         {
            _loc1_.push(stage.exitledge1);
         }
         if(Boolean(stage.exitledge2.pactive && stage.exitledge2.x > 0 && stage.exitledge2.x < GameStage.stageWidth) && Boolean(stage.exitledge2.y > 0) && stage.exitledge2.y < 400)
         {
            _loc1_.push(stage.exitledge2);
         }
         if(Boolean(stage.exitledge3.pactive && stage.exitledge3.x > 0 && stage.exitledge3.x < GameStage.stageWidth) && Boolean(stage.exitledge3.y > 0) && stage.exitledge3.y < 400)
         {
            _loc1_.push(stage.exitledge3);
         }
         if(_loc1_.length == 0)
         {
            return null;
         }
         _loc2_ = _loc1_[0];
         _loc3_ = 1;
         while(_loc3_ < _loc1_.length)
         {
            if(_loc1_[_loc3_].y < _loc2_.y)
            {
               _loc2_ = _loc1_[_loc3_];
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      override public function getClosestPlatform() : MovieClip
      {
         var _loc1_:* = undefined;
         var _loc2_:MovieClip = null;
         var _loc3_:* = undefined;
         _loc1_ = new Array();
         if(Boolean(stage.ledge1.pactive && stage.ledge1.x > 0 && stage.ledge1.x < GameStage.stageWidth) && Boolean(stage.ledge1.y > 0) && stage.ledge1.y < 400)
         {
            _loc1_.push(stage.ledge1);
         }
         if(Boolean(stage.ledge2.pactive && stage.ledge2.x > 0 && stage.ledge2.x < GameStage.stageWidth) && Boolean(stage.ledge2.y > 0) && stage.ledge2.y < 400)
         {
            _loc1_.push(stage.ledge2);
         }
         if(Boolean(stage.ledge3.pactive && stage.ledge3.x > 0 && stage.ledge3.x < GameStage.stageWidth) && Boolean(stage.ledge3.y > 0) && stage.ledge3.y < 400)
         {
            _loc1_.push(stage.ledge3);
         }
         if(Boolean(stage.ledge4.pactive && stage.ledge4.x > 0 && stage.ledge4.x < GameStage.stageWidth) && Boolean(stage.ledge4.y > 0) && stage.ledge4.y < 400)
         {
            _loc1_.push(stage.ledge4);
         }
         if(Boolean(stage.ledge5.pactive && stage.ledge5.x > 0 && stage.ledge5.x < GameStage.stageWidth) && Boolean(stage.ledge5.y > 0) && stage.ledge5.y < 400)
         {
            _loc1_.push(stage.ledge5);
         }
         if(Boolean(stage.ledge6.pactive && stage.ledge6.x > 0 && stage.ledge6.x < GameStage.stageWidth) && Boolean(stage.ledge6.y > 0) && stage.ledge6.y < 400)
         {
            _loc1_.push(stage.ledge6);
         }
         if(Boolean(stage.ledge7.pactive && stage.ledge7.x > 0 && stage.ledge7.x < GameStage.stageWidth) && Boolean(stage.ledge7.y > 0) && stage.ledge7.y < 400)
         {
            _loc1_.push(stage.ledge7);
         }
         if(Boolean(stage.ledge8.pactive && stage.ledge8.x > 0 && stage.ledge8.x < GameStage.stageWidth) && Boolean(stage.ledge8.y > 0) && stage.ledge8.y < 400)
         {
            _loc1_.push(stage.ledge8);
         }
         if(Boolean(stage.ledge9.pactive && stage.ledge9.x > 0 && stage.ledge9.x < GameStage.stageWidth) && Boolean(stage.ledge9.y > 0) && stage.ledge9.y < 400)
         {
            _loc1_.push(stage.ledge9);
         }
         if(Boolean(stage.exitledge1.pactive && stage.exitledge1.x > 0 && stage.exitledge1.x < GameStage.stageWidth) && Boolean(stage.exitledge1.y > 0) && stage.exitledge1.y < 400)
         {
            _loc1_.push(stage.exitledge1);
         }
         if(Boolean(stage.exitledge2.pactive && stage.exitledge2.x > 0 && stage.exitledge2.x < GameStage.stageWidth) && Boolean(stage.exitledge2.y > 0) && stage.exitledge2.y < 400)
         {
            _loc1_.push(stage.exitledge2);
         }
         if(Boolean(stage.exitledge3.pactive && stage.exitledge3.x > 0 && stage.exitledge3.x < GameStage.stageWidth) && Boolean(stage.exitledge3.y > 0) && stage.exitledge3.y < 400)
         {
            _loc1_.push(stage.exitledge3);
         }
         if(_loc1_.length == 0)
         {
            return null;
         }
         _loc2_ = _loc1_[0];
         _loc3_ = 1;
         while(_loc3_ < _loc1_.length)
         {
            if(Math.abs(_loc1_[_loc3_].x - Player.instance.x) < Math.abs(_loc2_.x - Player.instance.x))
            {
               _loc2_ = _loc1_[_loc3_];
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      override public function doScroll(param1:int) : *
      {
         scrollCounter = param1 * 24;
         Player.instance.isScrolling = true;
         Player.instance.stopMovement();
         InputManager.instance.disable();
         if(!noLand || noLandTransition)
         {
            Player.instance.setPosition(Player.instance.x,GameStage.groundY);
         }
      }
      
      override public function clearFilterAll() : *
      {
         ColorCode.blur(stage.fgtree1,10);
         ColorCode.blur(stage.fgtree2,10);
         ColorCode.blur(stage.fgleaf1,10);
         ColorCode.blur(stage.fgleaf2,10);
         ColorCode.blur(stage.fgleaf3,10);
         ColorCode.clearFilter(stage.mountain1);
         ColorCode.clearFilter(stage.mountain2);
         ColorCode.clearFilter(stage.mountain3);
         ColorCode.clearFilter(stage.fence1);
         ColorCode.clearFilter(stage.fence2);
         ColorCode.clearFilter(stage.fence3);
         ColorCode.clearFilter(stage.fence4);
         ColorCode.clearFilter(stage.fence5);
         ColorCode.clearFilter(stage.fence6);
         ColorCode.clearFilter(stage.banner);
         ColorCode.clearFilter(stage.grass1_1);
         ColorCode.clearFilter(stage.grass1_2);
         ColorCode.clearFilter(stage.grass2_1);
         ColorCode.clearFilter(stage.grass2_2);
         ColorCode.clearFilter(stage.ledge1);
         ColorCode.clearFilter(stage.ledge2);
         ColorCode.clearFilter(stage.ledge3);
         ColorCode.clearFilter(stage.ledge4);
         ColorCode.clearFilter(stage.ledge5);
         ColorCode.clearFilter(stage.ledge6);
         ColorCode.clearFilter(stage.ledge7);
         ColorCode.clearFilter(stage.ledge8);
         ColorCode.clearFilter(stage.ledge9);
         ColorCode.clearFilter(stage.exitledge1);
         ColorCode.clearFilter(stage.exitledge2);
         ColorCode.clearFilter(stage.exitledge3);
         ColorCode.clearFilter(stage.landend);
         LeafParticleSystem.instance.clearFilterAll();
      }
      
      public function initArea() : *
      {
         noLandScrollRight = false;
         switch(area)
         {
            case 1:
               spawnArray = [1,6];
               enemiesInWaiting = 8;
               maxEnemies = 4;
               break;
            case 2:
               spawnArray = [1,2,3,4,5,6,13];
               enemiesInWaiting = 15;
               maxEnemies = 3;
               break;
            case 3:
               spawnArray = [1,2,3,4,5,6,11,13];
               enemiesInWaiting = 15;
               maxEnemies = 3;
               break;
            case 4:
               spawnArray = [1,2,3,4,5,6,11,12];
               enemiesInWaiting = 15;
               maxEnemies = 3;
               break;
            case 5:
               spawnArray = [1,3,4,5,6,7];
               enemiesInWaiting = 15;
               maxEnemies = 3;
               break;
            case 6:
               spawnArray = [11,12];
               enemiesInWaiting = 9;
               maxEnemies = 3;
               playerGotoLeft = true;
               noLandTransition = true;
               break;
            case 7:
               spawnArray = [11];
               enemiesInWaiting = 1;
               maxEnemies = 1;
               GameStage.groundY = 1000;
               noLandTransition = false;
               playerGotoLeft = false;
               stage.tutorial.visible = true;
               stage.tutorial.gotoAndStop(5);
               spawnDelay = 5 * 24;
               break;
            case 8:
               spawnArray = [12];
               enemiesInWaiting = 1;
               maxEnemies = 1;
               stage.ground.removeChild(landEndPlatform);
               landEndPlatform = null;
               stage.exitledge3.gotoAndStop(1);
               stage.tutorial.gotoAndStop(6);
               spawnDelay = 5 * 24;
               break;
            case 9:
               spawnArray = [7,11];
               enemiesInWaiting = 2;
               maxEnemies = 2;
               stage.tutorial.visible = false;
               break;
            case 10:
               spawnArray = [7,11];
               enemiesInWaiting = 2;
               maxEnemies = 2;
               break;
            case 11:
               spawnArray = [6,7,11];
               enemiesInWaiting = 3;
               maxEnemies = 3;
               break;
            case 12:
               spawnArray = [6,7,11];
               enemiesInWaiting = 3;
               maxEnemies = 3;
               break;
            case 13:
               spawnArray = [11,12];
               enemiesInWaiting = 2;
               maxEnemies = 2;
               break;
            case 14:
               spawnArray = [11,12];
               enemiesInWaiting = 2;
               maxEnemies = 2;
               break;
            case 15:
               spawnArray = [6,7,11,12];
               enemiesInWaiting = 3;
               maxEnemies = 3;
               break;
            case 16:
               spawnArray = [6,7,11,12];
               enemiesInWaiting = 3;
               maxEnemies = 3;
               bossNext = true;
               break;
            case 17:
               SoundManager.instance.playMusic(7);
               enemiesInWaiting = 1;
               maxEnemies = 1;
               upwardsScroll = true;
               stage.mountain3.visible = true;
               if(stage.ledge1.x > GameStage.stageWidth)
               {
                  stage.ledge1.y = -Math.random() * 150 - 50;
                  stage.ledge1.showPlatform_upwards(-1);
               }
               if(stage.ledge2.x > GameStage.stageWidth)
               {
                  stage.ledge2.y = -Math.random() * 150 - 50;
                  stage.ledge2.showPlatform_upwards(-1);
               }
               if(stage.ledge3.x > GameStage.stageWidth)
               {
                  stage.ledge3.y = -Math.random() * 150 - 50;
                  stage.ledge3.showPlatform_upwards(-1);
               }
               if(stage.ledge4.x > GameStage.stageWidth)
               {
                  stage.ledge4.y = -Math.random() * 150 - 50;
                  stage.ledge4.showPlatform_upwards(-1);
               }
               if(stage.ledge5.x > GameStage.stageWidth)
               {
                  stage.ledge5.y = -Math.random() * 150 - 50;
                  stage.ledge5.showPlatform_upwards(-1);
               }
               if(stage.ledge6.x > GameStage.stageWidth)
               {
                  stage.ledge6.y = -Math.random() * 150 - 50;
                  stage.ledge6.showPlatform_upwards(-1);
               }
               if(stage.ledge7.x > GameStage.stageWidth)
               {
                  stage.ledge7.y = -Math.random() * 150 - 50;
                  stage.ledge7.showPlatform_upwards(-1);
               }
               if(stage.ledge8.x > GameStage.stageWidth)
               {
                  stage.ledge8.y = -Math.random() * 150 - 50;
                  stage.ledge8.showPlatform_upwards(-1);
               }
               if(stage.ledge9.x > GameStage.stageWidth)
               {
                  stage.ledge9.y = -Math.random() * 150 - 50;
                  stage.ledge9.showPlatform_upwards(-1);
               }
               if(stage.exitledge1.x > GameStage.stageWidth)
               {
                  stage.exitledge1.y = -Math.random() * 150 - 50;
                  stage.exitledge1.showPlatform_upwards(-1);
               }
               if(stage.exitledge2.x > GameStage.stageWidth)
               {
                  stage.exitledge2.y = -Math.random() * 150 - 50;
                  stage.exitledge2.showPlatform_upwards(-1);
               }
               if(stage.exitledge3.x > GameStage.stageWidth)
               {
                  stage.exitledge3.y = -Math.random() * 150 - 50;
                  stage.exitledge3.showPlatform_upwards(-1);
               }
               Boss2.instance.gotoAndStop(2);
               Boss2.instance.enemy.gotoAndStop(15);
               Boss2.instance.setPosition(600,150);
               stage.bosshp.visible = true;
               stage.bosshp.hpbar.width = 0;
               stage.bosshp.hurtbar.width = 0;
               Player.instance.bossFight = true;
               break;
            default:
               enemiesInWaiting = 2;
               maxEnemies = 1;
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
         if(autoScroll)
         {
            scrollRight(20);
         }
         else if(noLandScrollRight)
         {
            scrollRight(20);
            if(Player.instance.x <= 100)
            {
               noLandScrollRight = false;
               scrollCounter = 0;
            }
         }
         else if(noLandScrollUp)
         {
            scrollUp(10);
            if(Player.instance.y >= 300)
            {
               noLandScrollUp = false;
               scrollCounter = 0;
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
         else if(noLand && triggerRightPlatform != null)
         {
            if(triggerRightPlatform.hitTestPoint(Player.instance.x,Player.instance.y + 5,true) || Boolean(Player.instance.x > triggerRightPlatform.x - 50) && Boolean(Player.instance.isGrounded()))
            {
               if(!Player.instance.isGrounded())
               {
                  Player.instance.setPosition(Player.instance.x,triggerRightPlatform.y - 1);
               }
               nextArea();
               noLandScrollRight = true;
               triggerRightPlatform.gotoAndStop(4);
               triggerRightPlatform = null;
            }
         }
         else if(noLand && triggerUpPlatform != null)
         {
            if(triggerUpPlatform.hitTestPoint(Player.instance.x,Player.instance.y + 5,true) || Boolean(Player.instance.y < triggerUpPlatform.y) && Boolean(Player.instance.isGrounded()))
            {
               if(!Player.instance.isGrounded())
               {
                  Player.instance.setPosition(Player.instance.x,triggerUpPlatform.y - 1);
               }
               nextArea();
               noLandScrollUp = true;
               triggerUpPlatform.gotoAndStop(4);
               triggerUpPlatform = null;
            }
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
      
      override public function getRandomPlatform() : MovieClip
      {
         var _loc1_:* = undefined;
         var _loc2_:int = 0;
         _loc1_ = new Array();
         if(Boolean(stage.ledge1.pactive && stage.ledge1.x > 0 && stage.ledge1.x < GameStage.stageWidth) && Boolean(stage.ledge1.y > 0) && stage.ledge1.y < 400)
         {
            _loc1_.push(stage.ledge1);
         }
         if(Boolean(stage.ledge2.pactive && stage.ledge2.x > 0 && stage.ledge2.x < GameStage.stageWidth) && Boolean(stage.ledge2.y > 0) && stage.ledge2.y < 400)
         {
            _loc1_.push(stage.ledge2);
         }
         if(Boolean(stage.ledge3.pactive && stage.ledge3.x > 0 && stage.ledge3.x < GameStage.stageWidth) && Boolean(stage.ledge3.y > 0) && stage.ledge3.y < 400)
         {
            _loc1_.push(stage.ledge3);
         }
         if(Boolean(stage.ledge4.pactive && stage.ledge4.x > 0 && stage.ledge4.x < GameStage.stageWidth) && Boolean(stage.ledge4.y > 0) && stage.ledge4.y < 400)
         {
            _loc1_.push(stage.ledge4);
         }
         if(Boolean(stage.ledge5.pactive && stage.ledge5.x > 0 && stage.ledge5.x < GameStage.stageWidth) && Boolean(stage.ledge5.y > 0) && stage.ledge5.y < 400)
         {
            _loc1_.push(stage.ledge5);
         }
         if(Boolean(stage.ledge6.pactive && stage.ledge6.x > 0 && stage.ledge6.x < GameStage.stageWidth) && Boolean(stage.ledge6.y > 0) && stage.ledge6.y < 400)
         {
            _loc1_.push(stage.ledge6);
         }
         if(Boolean(stage.ledge7.pactive && stage.ledge7.x > 0 && stage.ledge7.x < GameStage.stageWidth) && Boolean(stage.ledge7.y > 0) && stage.ledge7.y < 400)
         {
            _loc1_.push(stage.ledge7);
         }
         if(Boolean(stage.ledge8.pactive && stage.ledge8.x > 0 && stage.ledge8.x < GameStage.stageWidth) && Boolean(stage.ledge8.y > 0) && stage.ledge8.y < 400)
         {
            _loc1_.push(stage.ledge8);
         }
         if(Boolean(stage.ledge9.pactive && stage.ledge9.x > 0 && stage.ledge9.x < GameStage.stageWidth) && Boolean(stage.ledge9.y > 0) && stage.ledge9.y < 400)
         {
            _loc1_.push(stage.ledge9);
         }
         if(Boolean(stage.exitledge1.pactive && stage.exitledge1.x > 0 && stage.exitledge1.x < GameStage.stageWidth) && Boolean(stage.exitledge1.y > 0) && stage.exitledge1.y < 400)
         {
            _loc1_.push(stage.exitledge1);
         }
         if(Boolean(stage.exitledge2.pactive && stage.exitledge2.x > 0 && stage.exitledge2.x < GameStage.stageWidth) && Boolean(stage.exitledge2.y > 0) && stage.exitledge2.y < 400)
         {
            _loc1_.push(stage.exitledge2);
         }
         if(Boolean(stage.exitledge3.pactive && stage.exitledge3.x > 0 && stage.exitledge3.x < GameStage.stageWidth) && Boolean(stage.exitledge3.y > 0) && stage.exitledge3.y < 400)
         {
            _loc1_.push(stage.exitledge3);
         }
         if(_loc1_.length == 0)
         {
            return null;
         }
         _loc2_ = Math.random() * _loc1_.length;
         return _loc1_[_loc2_];
      }
      
      override public function scrollRight(param1:int) : *
      {
         var _loc2_:int = 0;
         EnemyManager.instance.scrollRight(param1);
         ProjectileManager.instance.scrollRight(param1);
         if((noLandTransition || noLand) && landEndPlatform != null)
         {
            stage.landend.x -= param1;
            landEndPlatform.x -= param1;
            if(noLandTransition && stage.landend.x < -700 && scrollCounter > 10)
            {
               scrollCounter = 10;
            }
         }
         if(noLand && !noLandTransition)
         {
            Player.instance.setPosition(Player.instance.x - param1,Player.instance.y);
         }
         stage.mountain1.x -= param1;
         stage.mountain2.x -= param1;
         if(stage.mountain1.x < -800)
         {
            stage.mountain1.x = stage.mountain2.x + 750;
         }
         if(stage.mountain2.x < -800)
         {
            stage.mountain2.x = stage.mountain1.x + 750;
         }
         stage.grass1_1.x -= param1;
         stage.grass1_2.x -= param1;
         if(stage.grass1_1.x < -800 && !noLand)
         {
            stage.grass1_1.x = stage.grass1_2.x + 750;
         }
         if(stage.grass1_2.x < -800 && !noLand)
         {
            stage.grass1_2.x = stage.grass1_1.x + 750;
         }
         stage.grass2_1.x -= param1;
         stage.grass2_2.x -= param1;
         if(stage.grass2_1.x < -720 && !noLand)
         {
            stage.grass2_1.x = stage.grass2_2.x + 720;
         }
         if(stage.grass2_2.x < -720 && !noLand)
         {
            stage.grass2_2.x = stage.grass2_1.x + 720;
         }
         stage.fence1.x -= param1;
         if(stage.fence1.x < -200 && !noLand)
         {
            stage.fence1.x = Math.random() * 800 + 800;
            _loc2_ = Math.random() * 3;
            if(_loc2_ == 0)
            {
               stage.fence1.scaleX = 1;
            }
            else if(_loc2_ == 1)
            {
               stage.fence1.scaleX = -1;
            }
            else if(_loc2_ == 2)
            {
               stage.fence1.scaleX = 0;
            }
         }
         stage.fence2.x -= param1;
         if(stage.fence2.x < -200 && !noLand)
         {
            stage.fence2.x = Math.random() * 800 + 800;
            _loc2_ = Math.random() * 3;
            if(_loc2_ == 0)
            {
               stage.fence2.scaleX = 1;
            }
            else if(_loc2_ == 1)
            {
               stage.fence2.scaleX = -1;
            }
            else if(_loc2_ == 2)
            {
               stage.fence2.scaleX = 0;
            }
         }
         stage.fence3.x -= param1;
         if(stage.fence3.x < -200 && !noLand)
         {
            stage.fence3.x = Math.random() * 800 + 800;
            _loc2_ = Math.random() * 3;
            if(_loc2_ == 0)
            {
               stage.fence3.scaleX = 1;
            }
            else if(_loc2_ == 1)
            {
               stage.fence3.scaleX = -1;
            }
            else if(_loc2_ == 2)
            {
               stage.fence3.scaleX = 0;
            }
         }
         stage.fence4.x -= param1;
         if(stage.fence4.x < -200 && !noLand)
         {
            stage.fence4.x = Math.random() * 800 + 800;
            _loc2_ = Math.random() * 3;
            if(_loc2_ == 0)
            {
               stage.fence4.scaleX = 1;
            }
            else if(_loc2_ == 1)
            {
               stage.fence4.scaleX = -1;
            }
            else if(_loc2_ == 2)
            {
               stage.fence4.scaleX = 0;
            }
         }
         stage.fence5.x -= param1;
         if(stage.fence5.x < -200 && !noLand)
         {
            stage.fence5.x = Math.random() * 800 + 800;
            _loc2_ = Math.random() * 3;
            if(_loc2_ == 0)
            {
               stage.fence5.scaleX = 1;
            }
            else if(_loc2_ == 1)
            {
               stage.fence5.scaleX = -1;
            }
            else if(_loc2_ == 2)
            {
               stage.fence5.scaleX = 0;
            }
         }
         stage.fence6.x -= param1;
         if(stage.fence6.x < -200)
         {
            stage.fence6.x = Math.random() * 800 + 800;
            _loc2_ = Math.random() * 3;
            if(_loc2_ == 0)
            {
               stage.fence6.scaleX = 1;
            }
            else if(_loc2_ == 1)
            {
               stage.fence6.scaleX = -1;
            }
            else if(_loc2_ == 2)
            {
               stage.fence6.scaleX = 0;
            }
         }
         stage.banner.x -= param1;
         if(stage.banner.x < -200 && !noLand)
         {
            stage.banner.x = Math.random() * 1600 + 1600;
            _loc2_ = Math.random() * 45 - 20;
            stage.banner.rotation = _loc2_;
         }
         stage.fgtree1.x -= param1 * 2;
         if(stage.fgtree1.x < -100 && !noLand)
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
         stage.fgtree2.x -= param1 * 2;
         if(stage.fgtree2.x < -100 && !noLand)
         {
            stage.fgtree2.x = Math.random() * 1600 + 1600;
            _loc2_ = Math.random() * 2;
            if(_loc2_ == 0)
            {
               stage.fgtree2.scaleX = 1;
            }
            else if(_loc2_ == 1)
            {
               stage.fgtree2.scaleX = -1;
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
         stage.ledge1.x -= param1;
         if(stage.ledge1.groundplatform != null && (Boolean(stage.ledge1.pactive) || Boolean(noLand)))
         {
            stage.ledge1.groundplatform.x -= param1;
         }
         if(stage.ledge1.x < -100)
         {
            stage.ledge1.x = 720 + 100;
            if(!noLand)
            {
               _loc2_ = Math.random() * 3;
            }
            else
            {
               _loc2_ = 1;
            }
            if(_loc2_ > 0)
            {
               stage.ledge1.showPlatform(-1);
               _loc2_ = Math.random() * 2;
               if(_loc2_ == 0)
               {
                  stage.ledge1.scaleX = 1;
                  if(stage.ledge1.groundplatform != null)
                  {
                     stage.ledge1.groundplatform.scaleX = 1;
                  }
               }
               else if(_loc2_ == 1)
               {
                  stage.ledge1.scaleX = -1;
                  if(stage.ledge1.groundplatform != null)
                  {
                     stage.ledge1.groundplatform.scaleX = -1;
                  }
               }
            }
            else
            {
               stage.ledge1.visible = false;
               stage.ledge1.pactive = false;
            }
         }
         stage.ledge2.x -= param1;
         if(stage.ledge2.groundplatform != null && Boolean(stage.ledge2.pactive))
         {
            stage.ledge2.groundplatform.x -= param1;
         }
         if(stage.ledge2.x < -100)
         {
            stage.ledge2.x = 720 + 100;
            _loc2_ = 1;
            if(_loc2_ > 0)
            {
               stage.ledge2.showPlatform(-1);
               _loc2_ = Math.random() * 2;
               if(_loc2_ == 0)
               {
                  stage.ledge2.scaleX = 1;
                  if(stage.ledge2.groundplatform != null)
                  {
                     stage.ledge2.groundplatform.scaleX = 1;
                  }
               }
               else if(_loc2_ == 1)
               {
                  stage.ledge2.scaleX = -1;
                  if(stage.ledge2.groundplatform != null)
                  {
                     stage.ledge2.groundplatform.scaleX = -1;
                  }
               }
            }
            else
            {
               stage.ledge2.visible = false;
               stage.ledge2.pactive = false;
            }
         }
         stage.ledge3.x -= param1;
         if(stage.ledge3.groundplatform != null && Boolean(stage.ledge3.pactive))
         {
            stage.ledge3.groundplatform.x -= param1;
         }
         if(stage.ledge3.x < -100)
         {
            stage.ledge3.x = Math.random() * 200 + 720;
            if(!noLand)
            {
               _loc2_ = Math.random() * 3;
            }
            else
            {
               _loc2_ = Math.random() * 5;
            }
            if(_loc2_ > 0)
            {
               stage.ledge3.showPlatform(-1);
               _loc2_ = Math.random() * 2;
               if(_loc2_ == 0)
               {
                  stage.ledge3.scaleX = 1;
                  if(stage.ledge3.groundplatform != null)
                  {
                     stage.ledge3.groundplatform.scaleX = 1;
                  }
               }
               else if(_loc2_ == 1)
               {
                  stage.ledge3.scaleX = -1;
                  if(stage.ledge3.groundplatform != null)
                  {
                     stage.ledge3.groundplatform.scaleX = -1;
                  }
               }
            }
            else
            {
               stage.ledge3.visible = false;
               stage.ledge3.pactive = false;
            }
         }
         stage.ledge4.x -= param1;
         if(stage.ledge4.groundplatform != null)
         {
            stage.ledge4.groundplatform.x -= param1;
         }
         if(stage.ledge4.x < -100)
         {
            stage.ledge4.x = 720 + 100;
            _loc2_ = 1;
            if(!noLand)
            {
               _loc2_ = Math.random() * 3;
            }
            else
            {
               _loc2_ = 1;
            }
            if(_loc2_ > 0)
            {
               stage.ledge4.showPlatform(-1);
               _loc2_ = Math.random() * 2;
               if(_loc2_ == 0)
               {
                  stage.ledge4.scaleX = 1;
                  if(stage.ledge4.groundplatform != null)
                  {
                     stage.ledge4.groundplatform.scaleX = 1;
                  }
               }
               else if(_loc2_ == 1)
               {
                  stage.ledge4.scaleX = -1;
                  if(stage.ledge4.groundplatform != null)
                  {
                     stage.ledge4.groundplatform.scaleX = -1;
                  }
               }
            }
            else
            {
               stage.ledge4.visible = false;
               stage.ledge4.pactive = false;
            }
         }
         stage.ledge5.x -= param1;
         if(stage.ledge5.groundplatform != null)
         {
            stage.ledge5.groundplatform.x -= param1;
         }
         if(stage.ledge5.x < -100 && Boolean(stage.ledge5.pactive))
         {
            stage.ledge5.x = Math.random() * 200 + 720;
            if(!noLand)
            {
               _loc2_ = Math.random() * 3;
            }
            else
            {
               _loc2_ = Math.random() * 5;
            }
            if(_loc2_ > 0)
            {
               stage.ledge5.showPlatform(-1);
               _loc2_ = Math.random() * 2;
               if(_loc2_ == 0)
               {
                  stage.ledge5.scaleX = 1;
                  if(stage.ledge5.groundplatform != null)
                  {
                     stage.ledge5.groundplatform.scaleX = 1;
                  }
               }
               else if(_loc2_ == 1)
               {
                  stage.ledge5.scaleX = -1;
                  if(stage.ledge5.groundplatform != null)
                  {
                     stage.ledge5.groundplatform.scaleX = -1;
                  }
               }
            }
            else
            {
               stage.ledge5.visible = false;
               stage.ledge5.pactive = false;
            }
         }
         stage.ledge6.x -= param1;
         if(stage.ledge6.groundplatform != null)
         {
            stage.ledge6.groundplatform.x -= param1;
         }
         if(stage.ledge6.x < -100 && Boolean(stage.ledge6.pactive))
         {
            stage.ledge6.x = Math.random() * 200 + 720;
            if(!noLand)
            {
               _loc2_ = Math.random() * 3;
            }
            else
            {
               _loc2_ = Math.random() * 5;
            }
            if(_loc2_ > 0)
            {
               stage.ledge6.showPlatform(-1);
               _loc2_ = Math.random() * 2;
               if(_loc2_ == 0)
               {
                  stage.ledge6.scaleX = 1;
                  if(stage.ledge6.groundplatform != null)
                  {
                     stage.ledge6.groundplatform.scaleX = 1;
                  }
               }
               else if(_loc2_ == 1)
               {
                  stage.ledge6.scaleX = -1;
                  if(stage.ledge6.groundplatform != null)
                  {
                     stage.ledge6.groundplatform.scaleX = -1;
                  }
               }
            }
            else
            {
               stage.ledge6.visible = false;
               stage.ledge6.pactive = false;
            }
         }
         stage.ledge7.x -= param1;
         if(stage.ledge7.groundplatform != null)
         {
            stage.ledge7.groundplatform.x -= param1;
         }
         if(stage.ledge7.x < -100)
         {
            stage.ledge7.x = 720 + 100;
            _loc2_ = 1;
            if(!noLand)
            {
               _loc2_ = Math.random() * 3;
            }
            else
            {
               _loc2_ = 1;
            }
            if(_loc2_ > 0)
            {
               stage.ledge7.showPlatform(-1);
               _loc2_ = Math.random() * 2;
               if(_loc2_ == 0)
               {
                  stage.ledge7.scaleX = 1;
                  if(stage.ledge7.groundplatform != null)
                  {
                     stage.ledge7.groundplatform.scaleX = 1;
                  }
               }
               else if(_loc2_ == 1)
               {
                  stage.ledge7.scaleX = -1;
                  if(stage.ledge7.groundplatform != null)
                  {
                     stage.ledge7.groundplatform.scaleX = -1;
                  }
               }
            }
            else
            {
               stage.ledge7.visible = false;
               stage.ledge7.pactive = false;
            }
         }
         stage.ledge8.x -= param1;
         if(stage.ledge8.groundplatform != null)
         {
            stage.ledge8.groundplatform.x -= param1;
         }
         if(stage.ledge8.x < -100 && Boolean(stage.ledge8.pactive))
         {
            stage.ledge8.x = Math.random() * 200 + 720;
            if(!noLand)
            {
               _loc2_ = Math.random() * 3;
            }
            else
            {
               _loc2_ = Math.random() * 5;
            }
            if(_loc2_ > 0)
            {
               stage.ledge8.showPlatform(-1);
               _loc2_ = Math.random() * 2;
               if(_loc2_ == 0)
               {
                  stage.ledge8.scaleX = 1;
                  if(stage.ledge8.groundplatform != null)
                  {
                     stage.ledge8.groundplatform.scaleX = 1;
                  }
               }
               else if(_loc2_ == 1)
               {
                  stage.ledge8.scaleX = -1;
                  if(stage.ledge8.groundplatform != null)
                  {
                     stage.ledge8.groundplatform.scaleX = -1;
                  }
               }
            }
            else
            {
               stage.ledge8.visible = false;
               stage.ledge8.pactive = false;
            }
         }
         stage.ledge9.x -= param1;
         if(stage.ledge9.groundplatform != null)
         {
            stage.ledge9.groundplatform.x -= param1;
         }
         if(stage.ledge9.x < -100 && Boolean(stage.ledge9.pactive))
         {
            stage.ledge9.x = Math.random() * 200 + 720;
            if(!noLand)
            {
               _loc2_ = Math.random() * 3;
            }
            else
            {
               _loc2_ = Math.random() * 5;
            }
            if(_loc2_ > 0)
            {
               stage.ledge9.showPlatform(-1);
               _loc2_ = Math.random() * 2;
               if(_loc2_ == 0)
               {
                  stage.ledge9.scaleX = 1;
                  if(stage.ledge9.groundplatform != null)
                  {
                     stage.ledge9.groundplatform.scaleX = 1;
                  }
               }
               else if(_loc2_ == 1)
               {
                  stage.ledge9.scaleX = -1;
                  if(stage.ledge9.groundplatform != null)
                  {
                     stage.ledge9.groundplatform.scaleX = -1;
                  }
               }
            }
            else
            {
               stage.ledge9.visible = false;
               stage.ledge9.pactive = false;
            }
         }
         if(noLand || noLandTransition)
         {
            stage.exitledge1.x -= param1;
         }
         if(stage.exitledge1.groundplatform != null)
         {
            stage.exitledge1.groundplatform.x -= param1;
         }
         if(stage.exitledge1.x < -100 && Boolean(stage.exitledge1.pactive))
         {
            stage.exitledge1.x = stage.exitledge3.x + 400;
            stage.exitledge1.showPlatform(-1);
            _loc2_ = Math.random() * 2;
            if(_loc2_ == 0)
            {
               stage.exitledge1.scaleX = 1;
               if(stage.exitledge1.groundplatform != null)
               {
                  stage.exitledge1.groundplatform.scaleX = 1;
               }
            }
            else if(_loc2_ == 1)
            {
               stage.exitledge1.scaleX = -1;
               if(stage.exitledge1.groundplatform != null)
               {
                  stage.exitledge1.groundplatform.scaleX = -1;
               }
            }
         }
         if(noLand || noLandTransition)
         {
            stage.exitledge2.x -= param1;
         }
         if(stage.exitledge2.groundplatform != null && Boolean(stage.exitledge2.pactive))
         {
            stage.exitledge2.groundplatform.x -= param1;
         }
         if(stage.exitledge2.x < -100)
         {
            stage.exitledge2.x = stage.exitledge1.x + 400;
            stage.exitledge2.showPlatform(-1);
            _loc2_ = Math.random() * 2;
            if(_loc2_ == 0)
            {
               stage.exitledge2.scaleX = 1;
               if(stage.exitledge2.groundplatform != null)
               {
                  stage.exitledge2.groundplatform.scaleX = 1;
               }
            }
            else if(_loc2_ == 1)
            {
               stage.exitledge2.scaleX = -1;
               if(stage.exitledge2.groundplatform != null)
               {
                  stage.exitledge2.groundplatform.scaleX = -1;
               }
            }
         }
         if(noLand || noLandTransition)
         {
            stage.exitledge3.x -= param1;
         }
         if(stage.exitledge3.groundplatform != null && Boolean(stage.exitledge3.pactive))
         {
            stage.exitledge3.groundplatform.x -= param1;
         }
         if(stage.exitledge3.x < -100)
         {
            stage.exitledge3.x = stage.exitledge2.x + 400;
            stage.exitledge3.showPlatform(-1);
            _loc2_ = Math.random() * 2;
            if(_loc2_ == 0)
            {
               stage.exitledge3.scaleX = 1;
               if(stage.exitledge3.groundplatform != null)
               {
                  stage.exitledge3.groundplatform.scaleX = 1;
               }
            }
            else if(_loc2_ == 1)
            {
               stage.exitledge3.scaleX = -1;
               if(stage.exitledge3.groundplatform != null)
               {
                  stage.exitledge3.groundplatform.scaleX = -1;
               }
            }
         }
      }
      
      override public function desaturateAll() : *
      {
         ColorCode.desaturate_blur(stage.fgtree1,10);
         ColorCode.desaturate_blur(stage.fgtree2,10);
         ColorCode.desaturate_blur(stage.fgleaf1,10);
         ColorCode.desaturate_blur(stage.fgleaf2,10);
         ColorCode.desaturate_blur(stage.fgleaf3,10);
         ColorCode.desaturate(stage.mountain1);
         ColorCode.desaturate(stage.mountain2);
         ColorCode.desaturate(stage.mountain3);
         ColorCode.desaturate(stage.fence1);
         ColorCode.desaturate(stage.fence2);
         ColorCode.desaturate(stage.fence3);
         ColorCode.desaturate(stage.fence4);
         ColorCode.desaturate(stage.fence5);
         ColorCode.desaturate(stage.fence6);
         ColorCode.desaturate(stage.banner);
         ColorCode.desaturate(stage.grass1_1);
         ColorCode.desaturate(stage.grass1_2);
         ColorCode.desaturate(stage.grass2_1);
         ColorCode.desaturate(stage.grass2_2);
         ColorCode.desaturate(stage.ledge1);
         ColorCode.desaturate(stage.ledge2);
         ColorCode.desaturate(stage.ledge3);
         ColorCode.desaturate(stage.ledge4);
         ColorCode.desaturate(stage.ledge5);
         ColorCode.desaturate(stage.ledge6);
         ColorCode.desaturate(stage.ledge7);
         ColorCode.desaturate(stage.ledge8);
         ColorCode.desaturate(stage.ledge9);
         ColorCode.desaturate(stage.exitledge1);
         ColorCode.desaturate(stage.exitledge2);
         ColorCode.desaturate(stage.exitledge3);
         ColorCode.desaturate(stage.landend);
         LeafParticleSystem.instance.desaturateAll();
      }
      
      public function removeTriggerPlatform() : *
      {
         if(triggerUpPlatform != null)
         {
            triggerUpPlatform.gotoAndStop(4);
            triggerUpPlatform = null;
         }
      }
      
      public function getNextTriggerRightPlatform() : MovieClip
      {
         var _loc1_:* = undefined;
         var _loc2_:MovieClip = null;
         var _loc3_:* = undefined;
         _loc1_ = new Array();
         if(Boolean(stage.ledge1.pactive && stage.ledge1.x > 0 && stage.ledge1.x < GameStage.stageWidth) && Boolean(stage.ledge1.y > 0) && stage.ledge1.y < 400)
         {
            _loc1_.push(stage.ledge1);
         }
         if(Boolean(stage.ledge2.pactive && stage.ledge2.x > 0 && stage.ledge2.x < GameStage.stageWidth) && Boolean(stage.ledge2.y > 0) && stage.ledge2.y < 400)
         {
            _loc1_.push(stage.ledge2);
         }
         if(Boolean(stage.ledge3.pactive && stage.ledge3.x > 0 && stage.ledge3.x < GameStage.stageWidth) && Boolean(stage.ledge3.y > 0) && stage.ledge3.y < 400)
         {
            _loc1_.push(stage.ledge3);
         }
         if(Boolean(stage.ledge4.pactive && stage.ledge4.x > 0 && stage.ledge4.x < GameStage.stageWidth) && Boolean(stage.ledge4.y > 0) && stage.ledge4.y < 400)
         {
            _loc1_.push(stage.ledge4);
         }
         if(Boolean(stage.ledge5.pactive && stage.ledge5.x > 0 && stage.ledge5.x < GameStage.stageWidth) && Boolean(stage.ledge5.y > 0) && stage.ledge5.y < 400)
         {
            _loc1_.push(stage.ledge5);
         }
         if(Boolean(stage.ledge6.pactive && stage.ledge6.x > 0 && stage.ledge6.x < GameStage.stageWidth) && Boolean(stage.ledge6.y > 0) && stage.ledge6.y < 400)
         {
            _loc1_.push(stage.ledge6);
         }
         if(Boolean(stage.ledge7.pactive && stage.ledge7.x > 0 && stage.ledge7.x < GameStage.stageWidth) && Boolean(stage.ledge7.y > 0) && stage.ledge7.y < 400)
         {
            _loc1_.push(stage.ledge7);
         }
         if(Boolean(stage.ledge8.pactive && stage.ledge8.x > 0 && stage.ledge8.x < GameStage.stageWidth) && Boolean(stage.ledge8.y > 0) && stage.ledge8.y < 400)
         {
            _loc1_.push(stage.ledge8);
         }
         if(Boolean(stage.ledge9.pactive && stage.ledge9.x > 0 && stage.ledge9.x < GameStage.stageWidth) && Boolean(stage.ledge9.y > 0) && stage.ledge9.y < 400)
         {
            _loc1_.push(stage.ledge9);
         }
         if(Boolean(stage.exitledge1.pactive && stage.exitledge1.x > 0 && stage.exitledge1.x < GameStage.stageWidth) && Boolean(stage.exitledge1.y > 0) && stage.exitledge1.y < 400)
         {
            _loc1_.push(stage.exitledge1);
         }
         if(Boolean(stage.exitledge2.pactive && stage.exitledge2.x > 0 && stage.exitledge2.x < GameStage.stageWidth) && Boolean(stage.exitledge2.y > 0) && stage.exitledge2.y < 400)
         {
            _loc1_.push(stage.exitledge2);
         }
         if(Boolean(stage.exitledge3.pactive && stage.exitledge3.x > 0 && stage.exitledge3.x < GameStage.stageWidth) && Boolean(stage.exitledge3.y > 0) && stage.exitledge3.y < 400)
         {
            _loc1_.push(stage.exitledge3);
         }
         if(_loc1_.length == 0)
         {
            return null;
         }
         _loc2_ = _loc1_[0];
         _loc3_ = 1;
         while(_loc3_ < _loc1_.length)
         {
            if(_loc1_[_loc3_].x > _loc2_.x)
            {
               _loc2_ = _loc1_[_loc3_];
            }
            _loc3_++;
         }
         if(_loc2_.x <= 400)
         {
            return null;
         }
         return _loc2_;
      }
      
      public function scrollUp(param1:int) : *
      {
         var _loc2_:MovieClip = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         Player.instance.setPosition(Player.instance.x,Player.instance.y + param1);
         EnemyManager.instance.scrollUp(param1);
         ProjectileManager.instance.scrollUp(param1);
         stage.mountain1.y += param1;
         stage.mountain3.y += param1;
         if(stage.mountainshade.visible)
         {
            stage.mountainshade.y += param1;
         }
         if(stage.mountain3.y > -50)
         {
            stage.mountain1.y = stage.mountain3.y - 400;
            stage.mountain1.x = stage.mountain3.x;
            stage.mountain2.visible = false;
            stage.mountainshade.visible = false;
         }
         if(stage.mountain1.y > -50)
         {
            stage.mountain3.y = stage.mountain1.y - 400;
         }
         if(stage.mountain2.visible)
         {
            stage.mountain2.y = stage.mountain1.y;
         }
         if(stage.fgleaf1.y < 600)
         {
            stage.fgleaf1.y += param1 * 2;
         }
         else
         {
            stage.fgleaf1.visible = false;
         }
         if(stage.fgleaf2.y < 600)
         {
            stage.fgleaf2.y += param1 * 2;
         }
         else
         {
            stage.fgleaf2.visible = false;
         }
         if(stage.fgleaf3.y < 600)
         {
            stage.fgleaf3.y += param1 * 2;
         }
         else
         {
            stage.fgleaf3.visible = false;
         }
         stage.ledge1.y += param1;
         if(stage.ledge1.groundplatform != null && Boolean(stage.ledge1.pactive))
         {
            stage.ledge1.groundplatform.y += param1;
         }
         if(stage.ledge1.y > 400)
         {
            _loc2_ = getTopPlatform();
            _loc3_ = 0;
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_.y;
            }
            _loc4_ = Math.random() * 4;
            if(_loc4_ == 0)
            {
               stage.ledge1.y = _loc3_ - 250;
            }
            else if(_loc4_ == 1)
            {
               stage.ledge1.y = _loc3_ - 100;
            }
            else if(_loc4_ == 2)
            {
               stage.ledge1.y = _loc3_ - 150;
            }
            else if(_loc4_ == 3)
            {
               stage.ledge1.y = _loc3_ - 200;
            }
            _loc4_ = Math.random() * 4;
            if(_loc4_ > 0)
            {
               stage.ledge1.showPlatform_upwards(-1);
               _loc4_ = Math.random() * 2;
               if(_loc4_ == 0)
               {
                  stage.ledge1.scaleX = 1;
                  if(stage.ledge1.groundplatform != null)
                  {
                     stage.ledge1.groundplatform.scaleX = 1;
                  }
               }
               else if(_loc4_ == 1)
               {
                  stage.ledge1.scaleX = -1;
                  if(stage.ledge1.groundplatform != null)
                  {
                     stage.ledge1.groundplatform.scaleX = -1;
                  }
               }
            }
            else
            {
               stage.ledge1.visible = false;
               stage.ledge1.pactive = false;
               if(stage.ledge1.groundplatform != null)
               {
                  stage.ledge1.groundplatform.x = -200;
               }
            }
         }
         stage.ledge2.y += param1;
         if(stage.ledge2.groundplatform != null && Boolean(stage.ledge2.pactive))
         {
            stage.ledge2.groundplatform.y += param1;
         }
         if(stage.ledge2.y > 400)
         {
            _loc2_ = getTopPlatform();
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_.y;
            }
            else
            {
               _loc3_ = 0;
            }
            _loc4_ = Math.random() * 4;
            if(_loc4_ == 0)
            {
               stage.ledge2.y = _loc3_ - 250;
            }
            else if(_loc4_ == 1)
            {
               stage.ledge2.y = _loc3_ - 100;
            }
            else if(_loc4_ == 2)
            {
               stage.ledge2.y = _loc3_ - 150;
            }
            else if(_loc4_ == 3)
            {
               stage.ledge2.y = _loc3_ - 200;
            }
            _loc4_ = Math.random() * 4;
            if(_loc4_ > 0)
            {
               stage.ledge2.showPlatform_upwards(-1);
               _loc4_ = Math.random() * 2;
               if(_loc4_ == 0)
               {
                  stage.ledge2.scaleX = 1;
                  if(stage.ledge2.groundplatform != null)
                  {
                     stage.ledge2.groundplatform.scaleX = 1;
                  }
               }
               else if(_loc4_ == 1)
               {
                  stage.ledge2.scaleX = -1;
                  if(stage.ledge2.groundplatform != null)
                  {
                     stage.ledge2.groundplatform.scaleX = -1;
                  }
               }
            }
            else
            {
               stage.ledge2.visible = false;
               stage.ledge2.pactive = false;
               if(stage.ledge2.groundplatform != null)
               {
                  stage.ledge2.groundplatform.x = -200;
               }
            }
         }
         stage.ledge3.y += param1;
         if(stage.ledge3.groundplatform != null && Boolean(stage.ledge3.pactive))
         {
            stage.ledge3.groundplatform.y += param1;
         }
         if(stage.ledge3.y > 400)
         {
            _loc2_ = getTopPlatform();
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_.y;
            }
            else
            {
               _loc3_ = 0;
            }
            _loc4_ = Math.random() * 4;
            if(_loc4_ == 0)
            {
               stage.ledge3.y = _loc3_ - 250;
            }
            else if(_loc4_ == 1)
            {
               stage.ledge3.y = _loc3_ - 100;
            }
            else if(_loc4_ == 2)
            {
               stage.ledge3.y = _loc3_ - 150;
            }
            else if(_loc4_ == 3)
            {
               stage.ledge3.y = _loc3_ - 200;
            }
            _loc4_ = Math.random() * 4;
            if(_loc4_ > 0)
            {
               stage.ledge3.showPlatform_upwards(-1);
               _loc4_ = Math.random() * 2;
               if(_loc4_ == 0)
               {
                  stage.ledge3.scaleX = 1;
                  if(stage.ledge3.groundplatform != null)
                  {
                     stage.ledge3.groundplatform.scaleX = 1;
                  }
               }
               else if(_loc4_ == 1)
               {
                  stage.ledge3.scaleX = -1;
                  if(stage.ledge3.groundplatform != null)
                  {
                     stage.ledge3.groundplatform.scaleX = -1;
                  }
               }
            }
            else
            {
               stage.ledge3.visible = false;
               stage.ledge3.pactive = false;
               if(stage.ledge3.groundplatform != null)
               {
                  stage.ledge3.groundplatform.x = -200;
               }
            }
         }
         stage.ledge4.y += param1;
         if(stage.ledge4.groundplatform != null && Boolean(stage.ledge4.pactive))
         {
            stage.ledge4.groundplatform.y += param1;
         }
         if(stage.ledge4.y > 400)
         {
            _loc2_ = getTopPlatform();
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_.y;
            }
            else
            {
               _loc3_ = 0;
            }
            _loc4_ = Math.random() * 4;
            if(_loc4_ == 0)
            {
               stage.ledge4.y = _loc3_ - 250;
            }
            else if(_loc4_ == 1)
            {
               stage.ledge4.y = _loc3_ - 100;
            }
            else if(_loc4_ == 2)
            {
               stage.ledge4.y = _loc3_ - 150;
            }
            else if(_loc4_ == 3)
            {
               stage.ledge4.y = _loc3_ - 200;
            }
            _loc4_ = Math.random() * 4;
            if(_loc4_ > 0)
            {
               stage.ledge4.showPlatform_upwards(-1);
               _loc4_ = Math.random() * 2;
               if(_loc4_ == 0)
               {
                  stage.ledge4.scaleX = 1;
                  if(stage.ledge4.groundplatform != null)
                  {
                     stage.ledge4.groundplatform.scaleX = 1;
                  }
               }
               else if(_loc4_ == 1)
               {
                  stage.ledge4.scaleX = -1;
                  if(stage.ledge4.groundplatform != null)
                  {
                     stage.ledge4.groundplatform.scaleX = -1;
                  }
               }
            }
            else
            {
               stage.ledge4.visible = false;
               stage.ledge4.pactive = false;
               if(stage.ledge4.groundplatform != null)
               {
                  stage.ledge4.groundplatform.x = -200;
               }
            }
         }
         stage.ledge5.y += param1;
         if(stage.ledge5.groundplatform != null && Boolean(stage.ledge5.pactive))
         {
            stage.ledge5.groundplatform.y += param1;
         }
         if(stage.ledge5.y > 400)
         {
            _loc2_ = getTopPlatform();
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_.y;
            }
            else
            {
               _loc3_ = 0;
            }
            _loc4_ = Math.random() * 4;
            if(_loc4_ == 0)
            {
               stage.ledge5.y = _loc3_ - 250;
            }
            else if(_loc4_ == 1)
            {
               stage.ledge5.y = _loc3_ - 100;
            }
            else if(_loc4_ == 2)
            {
               stage.ledge5.y = _loc3_ - 150;
            }
            else if(_loc4_ == 3)
            {
               stage.ledge5.y = _loc3_ - 200;
            }
            _loc4_ = Math.random() * 4;
            if(_loc4_ > 0)
            {
               stage.ledge5.showPlatform_upwards(-1);
               _loc4_ = Math.random() * 2;
               if(_loc4_ == 0)
               {
                  stage.ledge5.scaleX = 1;
                  if(stage.ledge5.groundplatform != null)
                  {
                     stage.ledge5.groundplatform.scaleX = 1;
                  }
               }
               else if(_loc4_ == 1)
               {
                  stage.ledge5.scaleX = -1;
                  if(stage.ledge5.groundplatform != null)
                  {
                     stage.ledge5.groundplatform.scaleX = -1;
                  }
               }
            }
            else
            {
               stage.ledge5.visible = false;
               stage.ledge5.pactive = false;
               if(stage.ledge5.groundplatform != null)
               {
                  stage.ledge5.groundplatform.x = -200;
               }
            }
         }
         stage.ledge6.y += param1;
         if(stage.ledge6.groundplatform != null && Boolean(stage.ledge6.pactive))
         {
            stage.ledge6.groundplatform.y += param1;
         }
         if(stage.ledge6.y > 400)
         {
            _loc2_ = getTopPlatform();
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_.y;
            }
            else
            {
               _loc3_ = 0;
            }
            _loc4_ = Math.random() * 4;
            if(_loc4_ == 0)
            {
               stage.ledge6.y = _loc3_ - 250;
            }
            else if(_loc4_ == 1)
            {
               stage.ledge6.y = _loc3_ - 100;
            }
            else if(_loc4_ == 2)
            {
               stage.ledge6.y = _loc3_ - 150;
            }
            else if(_loc4_ == 3)
            {
               stage.ledge6.y = _loc3_ - 200;
            }
            _loc4_ = Math.random() * 4;
            if(_loc4_ > 0)
            {
               stage.ledge6.showPlatform_upwards(-1);
               _loc4_ = Math.random() * 2;
               if(_loc4_ == 0)
               {
                  stage.ledge6.scaleX = 1;
                  if(stage.ledge6.groundplatform != null)
                  {
                     stage.ledge6.groundplatform.scaleX = 1;
                  }
               }
               else if(_loc4_ == 1)
               {
                  stage.ledge6.scaleX = -1;
                  if(stage.ledge6.groundplatform != null)
                  {
                     stage.ledge6.groundplatform.scaleX = -1;
                  }
               }
            }
            else
            {
               stage.ledge6.visible = false;
               stage.ledge6.pactive = false;
               if(stage.ledge6.groundplatform != null)
               {
                  stage.ledge6.groundplatform.x = -200;
               }
            }
         }
         stage.ledge7.y += param1;
         if(stage.ledge7.groundplatform != null && Boolean(stage.ledge7.pactive))
         {
            stage.ledge7.groundplatform.y += param1;
         }
         if(stage.ledge7.y > 400)
         {
            _loc2_ = getTopPlatform();
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_.y;
            }
            else
            {
               _loc3_ = 0;
            }
            _loc4_ = Math.random() * 4;
            if(_loc4_ == 0)
            {
               stage.ledge7.y = _loc3_ - 250;
            }
            else if(_loc4_ == 1)
            {
               stage.ledge7.y = _loc3_ - 100;
            }
            else if(_loc4_ == 2)
            {
               stage.ledge7.y = _loc3_ - 150;
            }
            else if(_loc4_ == 3)
            {
               stage.ledge7.y = _loc3_ - 200;
            }
            _loc4_ = Math.random() * 4;
            if(_loc4_ > 0)
            {
               stage.ledge7.showPlatform_upwards(-1);
               _loc4_ = Math.random() * 2;
               if(_loc4_ == 0)
               {
                  stage.ledge7.scaleX = 1;
                  if(stage.ledge7.groundplatform != null)
                  {
                     stage.ledge7.groundplatform.scaleX = 1;
                  }
               }
               else if(_loc4_ == 1)
               {
                  stage.ledge7.scaleX = -1;
                  if(stage.ledge7.groundplatform != null)
                  {
                     stage.ledge7.groundplatform.scaleX = -1;
                  }
               }
            }
            else
            {
               stage.ledge7.visible = false;
               stage.ledge7.pactive = false;
               if(stage.ledge7.groundplatform != null)
               {
                  stage.ledge7.groundplatform.x = -200;
               }
            }
         }
         stage.ledge8.y += param1;
         if(stage.ledge8.groundplatform != null && Boolean(stage.ledge8.pactive))
         {
            stage.ledge8.groundplatform.y += param1;
         }
         if(stage.ledge8.y > 400)
         {
            _loc2_ = getTopPlatform();
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_.y;
            }
            else
            {
               _loc3_ = 0;
            }
            _loc4_ = Math.random() * 4;
            if(_loc4_ == 0)
            {
               stage.ledge8.y = _loc3_ - 250;
            }
            else if(_loc4_ == 1)
            {
               stage.ledge8.y = _loc3_ - 100;
            }
            else if(_loc4_ == 2)
            {
               stage.ledge8.y = _loc3_ - 150;
            }
            else if(_loc4_ == 3)
            {
               stage.ledge8.y = _loc3_ - 200;
            }
            _loc4_ = Math.random() * 4;
            if(_loc4_ > 0)
            {
               stage.ledge8.showPlatform_upwards(-1);
               _loc4_ = Math.random() * 2;
               if(_loc4_ == 0)
               {
                  stage.ledge8.scaleX = 1;
                  if(stage.ledge8.groundplatform != null)
                  {
                     stage.ledge8.groundplatform.scaleX = 1;
                  }
               }
               else if(_loc4_ == 1)
               {
                  stage.ledge8.scaleX = -1;
                  if(stage.ledge8.groundplatform != null)
                  {
                     stage.ledge8.groundplatform.scaleX = -1;
                  }
               }
            }
            else
            {
               stage.ledge8.visible = false;
               stage.ledge8.pactive = false;
               if(stage.ledge8.groundplatform != null)
               {
                  stage.ledge8.groundplatform.x = -200;
               }
            }
         }
         stage.ledge9.y += param1;
         if(stage.ledge9.groundplatform != null && Boolean(stage.ledge9.pactive))
         {
            stage.ledge9.groundplatform.y += param1;
         }
         if(stage.ledge9.y > 400)
         {
            _loc2_ = getTopPlatform();
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_.y;
            }
            else
            {
               _loc3_ = 0;
            }
            _loc4_ = Math.random() * 4;
            if(_loc4_ == 0)
            {
               stage.ledge9.y = _loc3_ - 250;
            }
            else if(_loc4_ == 1)
            {
               stage.ledge9.y = _loc3_ - 100;
            }
            else if(_loc4_ == 2)
            {
               stage.ledge9.y = _loc3_ - 150;
            }
            else if(_loc4_ == 3)
            {
               stage.ledge9.y = _loc3_ - 200;
            }
            _loc4_ = Math.random() * 4;
            if(_loc4_ > 0)
            {
               stage.ledge9.showPlatform_upwards(-1);
               _loc4_ = Math.random() * 2;
               if(_loc4_ == 0)
               {
                  stage.ledge9.scaleX = 1;
                  if(stage.ledge9.groundplatform != null)
                  {
                     stage.ledge9.groundplatform.scaleX = 1;
                  }
               }
               else if(_loc4_ == 1)
               {
                  stage.ledge9.scaleX = -1;
                  if(stage.ledge9.groundplatform != null)
                  {
                     stage.ledge9.groundplatform.scaleX = -1;
                  }
               }
            }
            else
            {
               stage.ledge9.visible = false;
               stage.ledge9.pactive = false;
               if(stage.ledge9.groundplatform != null)
               {
                  stage.ledge9.groundplatform.x = -200;
               }
            }
         }
         stage.exitledge1.y += param1;
         if(stage.exitledge1.groundplatform != null && Boolean(stage.exitledge1.pactive))
         {
            stage.exitledge1.groundplatform.y += param1;
         }
         if(stage.exitledge1.y > 400)
         {
            _loc2_ = getTopPlatform();
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_.y;
            }
            else
            {
               _loc3_ = 0;
            }
            _loc4_ = Math.random() * 4;
            if(_loc4_ == 0)
            {
               stage.exitledge1.y = _loc3_ - 250;
            }
            else if(_loc4_ == 1)
            {
               stage.exitledge1.y = _loc3_ - 100;
            }
            else if(_loc4_ == 2)
            {
               stage.exitledge1.y = _loc3_ - 150;
            }
            else if(_loc4_ == 3)
            {
               stage.exitledge1.y = _loc3_ - 200;
            }
            stage.exitledge1.showPlatform_upwards(-1);
            _loc4_ = Math.random() * 2;
            if(_loc4_ == 0)
            {
               stage.exitledge1.scaleX = 1;
               if(stage.exitledge1.groundplatform != null)
               {
                  stage.exitledge1.groundplatform.scaleX = 1;
               }
            }
            else if(_loc4_ == 1)
            {
               stage.exitledge1.scaleX = -1;
               if(stage.exitledge1.groundplatform != null)
               {
                  stage.exitledge1.groundplatform.scaleX = -1;
               }
            }
         }
         stage.exitledge2.y += param1;
         if(stage.exitledge2.groundplatform != null && Boolean(stage.exitledge2.pactive))
         {
            stage.exitledge2.groundplatform.y += param1;
         }
         if(stage.exitledge2.y > 400)
         {
            _loc2_ = getTopPlatform();
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_.y;
            }
            else
            {
               _loc3_ = 0;
            }
            _loc4_ = Math.random() * 4;
            if(_loc4_ == 0)
            {
               stage.exitledge2.y = _loc3_ - 250;
            }
            else if(_loc4_ == 1)
            {
               stage.exitledge2.y = _loc3_ - 100;
            }
            else if(_loc4_ == 2)
            {
               stage.exitledge2.y = _loc3_ - 150;
            }
            else if(_loc4_ == 3)
            {
               stage.exitledge2.y = _loc3_ - 200;
            }
            stage.exitledge2.showPlatform_upwards(-1);
            _loc4_ = Math.random() * 2;
            if(_loc4_ == 0)
            {
               stage.exitledge2.scaleX = 1;
               if(stage.exitledge2.groundplatform != null)
               {
                  stage.exitledge2.groundplatform.scaleX = 1;
               }
            }
            else if(_loc4_ == 1)
            {
               stage.exitledge2.scaleX = -1;
               if(stage.exitledge2.groundplatform != null)
               {
                  stage.exitledge2.groundplatform.scaleX = -1;
               }
            }
         }
         stage.exitledge3.y += param1;
         if(stage.exitledge3.groundplatform != null && Boolean(stage.exitledge3.pactive))
         {
            stage.exitledge3.groundplatform.y += param1;
         }
         if(stage.exitledge3.y > 400)
         {
            _loc2_ = getTopPlatform();
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_.y;
            }
            else
            {
               _loc3_ = 0;
            }
            _loc4_ = Math.random() * 4;
            if(_loc4_ == 0)
            {
               stage.exitledge3.y = _loc3_ - 250;
            }
            else if(_loc4_ == 1)
            {
               stage.exitledge3.y = _loc3_ - 100;
            }
            else if(_loc4_ == 2)
            {
               stage.exitledge3.y = _loc3_ - 150;
            }
            else if(_loc4_ == 3)
            {
               stage.exitledge3.y = _loc3_ - 200;
            }
            stage.exitledge3.showPlatform_upwards(-1);
            _loc4_ = Math.random() * 2;
            if(_loc4_ == 0)
            {
               stage.exitledge3.scaleX = 1;
               if(stage.exitledge3.groundplatform != null)
               {
                  stage.exitledge3.groundplatform.scaleX = 1;
               }
            }
            else if(_loc4_ == 1)
            {
               stage.exitledge3.scaleX = -1;
               if(stage.exitledge3.groundplatform != null)
               {
                  stage.exitledge3.groundplatform.scaleX = -1;
               }
            }
         }
      }
      
      public function notifyCanMoveUp() : *
      {
         removeTriggerPlatform();
         if(triggerUpPlatform == null)
         {
            triggerUpPlatform = getNextTriggerUpPlatform();
            if(triggerUpPlatform == null)
            {
               trace("no platform");
               if(stage.exitledge1.y < -50)
               {
                  stage.exitledge1.y = 100;
                  stage.exitledge1.showPlatform_upwards(-1);
                  triggerUpPlatform = stage.exitledge1;
               }
               else if(stage.exitledge2.y < -50)
               {
                  stage.exitledge2.y = 100;
                  stage.exitledge2.showPlatform_upwards(-1);
                  triggerUpPlatform = stage.exitledge2;
               }
               else
               {
                  stage.exitledge3.y = 100;
                  stage.exitledge3.showPlatform_upwards(-1);
                  triggerUpPlatform = stage.exitledge3;
               }
            }
            triggerUpPlatform.gotoAndStop(5);
            if(triggerUpPlatform.scaleX == -1)
            {
               triggerUpPlatform.goup.scaleX = -1;
            }
            else
            {
               triggerUpPlatform.goup.scaleX = 1;
            }
         }
      }
      
      override public function unRedFreeze() : *
      {
         stage.redbg.visible = false;
         stage.leaflayer1.visible = true;
         stage.leaflayer2.visible = true;
         stage.fgtree1.visible = true;
         stage.fgtree2.visible = true;
         stage.fgleaf1.visible = true;
         stage.fgleaf2.visible = true;
         stage.fgleaf3.visible = true;
         EnemyManager.instance.makeDarkAll(0);
         ProjectileManager.instance.makeDarkAll(0);
         ColorCode.clearFilter(stage.grass1_1);
         ColorCode.clearFilter(stage.grass1_2);
         ColorCode.clearFilter(stage.grass2_1);
         ColorCode.clearFilter(stage.grass2_2);
         ColorCode.clearFilter(stage.fence1);
         ColorCode.clearFilter(stage.fence2);
         ColorCode.clearFilter(stage.fence3);
         ColorCode.clearFilter(stage.ledge1);
         ColorCode.clearFilter(stage.ledge2);
         ColorCode.clearFilter(stage.ledge3);
         ColorCode.clearFilter(stage.ledge4);
         ColorCode.clearFilter(stage.ledge5);
         ColorCode.clearFilter(stage.ledge6);
         ColorCode.clearFilter(stage.ledge7);
         ColorCode.clearFilter(stage.ledge8);
         ColorCode.clearFilter(stage.ledge9);
         ColorCode.clearFilter(stage.exitledge1);
         ColorCode.clearFilter(stage.exitledge2);
         ColorCode.clearFilter(stage.exitledge3);
         ColorCode.clearFilter(stage.landend);
         stage.ledge1.visible = stage.ledge1.pactive;
         stage.ledge2.visible = stage.ledge2.pactive;
         stage.ledge3.visible = stage.ledge3.pactive;
         stage.ledge4.visible = stage.ledge4.pactive;
         stage.ledge5.visible = stage.ledge5.pactive;
         stage.ledge6.visible = stage.ledge6.pactive;
         stage.ledge7.visible = stage.ledge7.pactive;
         stage.ledge8.visible = stage.ledge8.pactive;
         stage.ledge9.visible = stage.ledge9.pactive;
         stage.ledge1.shadow.visible = true;
         stage.ledge2.shadow.visible = true;
         stage.ledge3.shadow.visible = true;
         stage.ledge4.shadow.visible = true;
         stage.ledge5.shadow.visible = true;
         stage.ledge6.shadow.visible = true;
         stage.ledge7.shadow.visible = true;
         stage.ledge8.shadow.visible = true;
         stage.ledge9.shadow.visible = true;
      }
      
      public function getRightestPlatform() : MovieClip
      {
         var _loc1_:* = undefined;
         var _loc2_:MovieClip = null;
         var _loc3_:* = undefined;
         _loc1_ = new Array();
         if(Boolean(stage.ledge1.pactive && stage.ledge1.x > 0 && stage.ledge1.x < GameStage.stageWidth) && Boolean(stage.ledge1.y > 0) && stage.ledge1.y < 400)
         {
            _loc1_.push(stage.ledge1);
         }
         if(Boolean(stage.ledge2.pactive && stage.ledge2.x > 0 && stage.ledge2.x < GameStage.stageWidth) && Boolean(stage.ledge2.y > 0) && stage.ledge2.y < 400)
         {
            _loc1_.push(stage.ledge2);
         }
         if(Boolean(stage.ledge3.pactive && stage.ledge3.x > 0 && stage.ledge3.x < GameStage.stageWidth) && Boolean(stage.ledge3.y > 0) && stage.ledge3.y < 400)
         {
            _loc1_.push(stage.ledge3);
         }
         if(Boolean(stage.ledge4.pactive && stage.ledge4.x > 0 && stage.ledge4.x < GameStage.stageWidth) && Boolean(stage.ledge4.y > 0) && stage.ledge4.y < 400)
         {
            _loc1_.push(stage.ledge4);
         }
         if(Boolean(stage.ledge5.pactive && stage.ledge5.x > 0 && stage.ledge5.x < GameStage.stageWidth) && Boolean(stage.ledge5.y > 0) && stage.ledge5.y < 400)
         {
            _loc1_.push(stage.ledge5);
         }
         if(Boolean(stage.ledge6.pactive && stage.ledge6.x > 0 && stage.ledge6.x < GameStage.stageWidth) && Boolean(stage.ledge6.y > 0) && stage.ledge6.y < 400)
         {
            _loc1_.push(stage.ledge6);
         }
         if(Boolean(stage.ledge7.pactive && stage.ledge7.x > 0 && stage.ledge7.x < GameStage.stageWidth) && Boolean(stage.ledge7.y > 0) && stage.ledge7.y < 400)
         {
            _loc1_.push(stage.ledge7);
         }
         if(Boolean(stage.ledge8.pactive && stage.ledge8.x > 0 && stage.ledge8.x < GameStage.stageWidth) && Boolean(stage.ledge8.y > 0) && stage.ledge8.y < 400)
         {
            _loc1_.push(stage.ledge8);
         }
         if(Boolean(stage.ledge9.pactive && stage.ledge9.x > 0 && stage.ledge9.x < GameStage.stageWidth) && Boolean(stage.ledge9.y > 0) && stage.ledge9.y < 400)
         {
            _loc1_.push(stage.ledge9);
         }
         if(Boolean(stage.exitledge1.pactive && stage.exitledge1.x > 0 && stage.exitledge1.x < GameStage.stageWidth) && Boolean(stage.exitledge1.y > 0) && stage.exitledge1.y < 400)
         {
            _loc1_.push(stage.exitledge1);
         }
         if(Boolean(stage.exitledge2.pactive && stage.exitledge2.x > 0 && stage.exitledge2.x < GameStage.stageWidth) && Boolean(stage.exitledge2.y > 0) && stage.exitledge2.y < 400)
         {
            _loc1_.push(stage.exitledge2);
         }
         if(Boolean(stage.exitledge3.pactive && stage.exitledge3.x > 0 && stage.exitledge3.x < GameStage.stageWidth) && Boolean(stage.exitledge3.y > 0) && stage.exitledge3.y < 400)
         {
            _loc1_.push(stage.exitledge3);
         }
         if(_loc1_.length == 0)
         {
            return null;
         }
         _loc2_ = _loc1_[0];
         _loc3_ = 1;
         while(_loc3_ < _loc1_.length)
         {
            if(_loc1_[_loc3_].x > _loc2_.x)
            {
               _loc2_ = _loc1_[_loc3_];
            }
            _loc3_++;
         }
         return _loc2_;
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
         if(Boss2.instance != null)
         {
            return;
         }
         var _loc1_:int = area;
         switch(0)
         {
         }
         if(EnemyManager.instance.countAlive() < maxEnemies)
         {
            EnemyManager.instance.createEnemyFromArray(spawnArray);
         }
      }
   }
}

