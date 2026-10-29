package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class Enemy extends MovieClip
   {
      
      internal var hp:int = 1;
      
      internal var destinationX:Number = 0;
      
      internal const STOP_STATE:* = 0;
      
      internal var enemyManager:* = null;
      
      public var removeMe:Boolean = false;
      
      public var speed:int = 5;
      
      internal var dead:Boolean = false;
      
      internal const JUMPUP_STATE:* = 4;
      
      internal const MOVE_STATE:* = 1;
      
      internal var arrowshot:Boolean = false;
      
      public var actionState:int = STOP_STATE;
      
      public var type:int = 0;
      
      internal var frozen:Boolean = false;
      
      internal const JUMPDOWN_STATE:* = 5;
      
      internal const ATTACK_STATE:* = 2;
      
      public var deathAnimDone:Boolean = false;
      
      internal const DIE_STATE:* = 3;
      
      internal var AIcounter:int = 0;
      
      internal var disappearCounter:int;
      
      internal var disappearCounterMax:int = 10 * 24;
      
      internal var headshot:Boolean = false;
      
      internal var player:Player = null;
      
      internal var AIcounterMax:int = 30;
      
      public function Enemy()
      {
         disappearCounter = disappearCounterMax;
         super();
      }
      
      public function getPlayerPos() : Point
      {
         return MovieClip(parent).globalToLocal(new Point(Player.instance.x,Player.instance.y));
      }
      
      public function isNearPlayer() : Boolean
      {
         return Math.abs(getPlayerPos().x - this.x) < 100;
      }
      
      public function getPlayerIsFacingLeft() : Boolean
      {
         return MovieClip(parent.parent).player.isFacingLeft();
      }
      
      public function pauseGame() : *
      {
         MovieClip(this).enemy.enemy.stop();
         if(MovieClip(this).enemy.enemy.bloodspurt != null)
         {
            MovieClip(this).enemy.enemy.bloodspurt.stop();
         }
      }
      
      public function getPlayerIsRunning() : Boolean
      {
         return MovieClip(parent.parent).player.getIsRunning();
      }
      
      public function isHeadshot() : Boolean
      {
         return headshot && !dead;
      }
      
      public function checkEnemyWeaponHitPlayer(param1:MovieClip) : *
      {
         if(!isNearPlayer())
         {
            return;
         }
         MovieClip(parent.parent).player.checkEnemyWeaponHitPlayer(param1);
      }
      
      public function setManager(param1:EnemyManager) : *
      {
         this.enemyManager = param1;
      }
      
      public function setArrowShot(param1:Boolean) : *
      {
         arrowshot = param1;
      }
      
      public function faceDestination() : *
      {
         if(destinationX < this.x)
         {
            if(this.currentFrame != 2)
            {
               this.gotoAndStop(2);
            }
         }
         else if(this.currentFrame != 1)
         {
            this.gotoAndStop(1);
         }
      }
      
      public function freeze() : *
      {
         MovieClip(this).enemy.enemy.stop();
         frozen = true;
      }
      
      public function die() : *
      {
      }
      
      public function getPlayerShunpoDestination() : int
      {
         return MovieClip(parent).globalToLocal(MovieClip(parent.parent).player.getShunpoDestination()).x;
      }
      
      public function hit(param1:int, param2:int) : Boolean
      {
         if(hp > 0)
         {
            --hp;
            return true;
         }
         return false;
      }
      
      public function doDisappear() : *
      {
         if(Player.stageMode == 1 && this.alpha == 1 || removeMe || disappearCounter < 0)
         {
            return;
         }
         --disappearCounter;
         if(disappearCounter < 24)
         {
            this.alpha = disappearCounter / 24;
         }
         if(disappearCounter == 0)
         {
            enemyManager.getGameStage().removeChild(this);
            disappearCounter = -1;
            removeMe = true;
         }
      }
      
      public function facePlayer() : *
      {
         if(getPlayerPos().x < this.x)
         {
            if(this.currentFrame != 2)
            {
               this.gotoAndStop(2);
            }
         }
         else if(this.currentFrame != 1)
         {
            this.gotoAndStop(1);
         }
      }
      
      public function isHitFront(param1:int, param2:int) : *
      {
         var _loc3_:* = undefined;
         _loc3_ = new Point(param1,param2);
         _loc3_ = enemyManager.getGameStage().globalToLocal(_loc3_);
         if(this.currentFrame == 1 && _loc3_.x > this.x)
         {
            return true;
         }
         if(this.currentFrame == 2 && _loc3_.x < this.x)
         {
            return true;
         }
         return false;
      }
      
      public function unpauseGame() : *
      {
         if(disappearCounter > 0 && !deathAnimDone)
         {
            MovieClip(this).enemy.enemy.play();
            if(MovieClip(this).enemy.enemy.bloodspurt != null)
            {
               MovieClip(this).enemy.enemy.bloodspurt.play();
            }
         }
      }
      
      public function getPlayerDestination() : int
      {
         return MovieClip(parent).globalToLocal(MovieClip(parent.parent).player.getDestination()).x;
      }
      
      public function isDead() : Boolean
      {
         return dead;
      }
      
      public function isColliding() : Boolean
      {
         return enemyManager.isColliding(this);
      }
      
      public function update() : *
      {
      }
      
      public function arrowHit(param1:Arrow_player) : Boolean
      {
         return true;
      }
      
      public function setPosition(param1:int, param2:int) : *
      {
         this.x = param1;
         this.y = param2;
      }
      
      public function getHP() : int
      {
         return hp;
      }
      
      public function setDead(param1:Boolean) : *
      {
         dead = param1;
      }
      
      public function getPlayerIsShunpo() : Boolean
      {
         return MovieClip(parent.parent).player.getIsShunpo();
      }
      
      public function reactShunpo(param1:Array, param2:Array) : *
      {
      }
   }
}

