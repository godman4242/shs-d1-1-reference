package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol36")]
   public class Enemy_catapult extends Enemy
   {
      
      public static var instance:Enemy_catapult;
      
      public static var typeCode:int = 103;
      
      public var operator:MovieClip;
      
      internal var moved:Boolean = false;
      
      public function Enemy_catapult()
      {
         super();
         addFrameScript(0,frame1,1,frame2,34,frame35);
         speed = 0;
         hp = 1;
         AIcounterMax = 12;
         destinationX = this.x;
         actionState = STOP_STATE;
         instance = this;
      }
      
      internal function AI() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         _loc1_ = new Point(x,y);
         _loc1_ = MovieClip(this.parent).localToGlobal(_loc1_);
         _loc2_ = MovieClip(Player.instance.parent).localToGlobal(new Point(Player.instance.x,Player.instance.y));
         if(this.currentFrame == 1 && _loc1_.x - _loc2_.x > 400 && Math.random() * 5 < 1)
         {
            shootBall();
         }
      }
      
      internal function frame2() : *
      {
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      override public function die() : *
      {
         dead = true;
      }
      
      override public function unpauseGame() : *
      {
      }
      
      internal function frame35() : *
      {
         operator.gotoAndPlay(10);
      }
      
      override public function freeze() : *
      {
         frozen = true;
      }
      
      override public function isDead() : Boolean
      {
         return true;
      }
      
      public function shootBall() : *
      {
         var _loc1_:* = undefined;
         gotoAndPlay(2);
         _loc1_ = EnemyManager.instance.getGameStage().globalToLocal(new Point(Player.instance.x,Player.instance.y));
         ProjectileManager.instance.createProjectile(BallProjectile.typeCode,_loc1_.x + 200 + Math.random() * 100,-100,-5 - Math.random() * 10,-10);
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
         if(frozen || Player.stageMode == 1)
         {
            return;
         }
         if(hp == 0 && this.operator.currentFrame != 40)
         {
            this.gotoAndStop(24);
            this.operator.gotoAndStop(40);
         }
         --AIcounter;
         if(AIcounter <= 0)
         {
            AIcounter = AIcounterMax;
            if(hp > 0)
            {
               AI();
            }
         }
      }
      
      override public function arrowHit(param1:Arrow_player) : Boolean
      {
         return false;
      }
      
      override public function pauseGame() : *
      {
      }
      
      override public function hit(param1:int, param2:int) : Boolean
      {
         return false;
      }
      
      public function destroy() : *
      {
         this.operator.gotoAndStop(40);
         hp = 0;
         Player.instance.displayScoreMessage("Disabled Catapult Operator: +1000");
         StatsManager.instance.addScore(1000);
         StageManager.instance.showHint("");
      }
   }
}

