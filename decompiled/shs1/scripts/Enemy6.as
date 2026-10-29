package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol265")]
   public class Enemy6 extends Enemy
   {
      
      public static var typeCode:int = 6;
      
      internal var fallVel:* = 0;
      
      internal var reloadMax:int = 24;
      
      public var enemy:MovieClip;
      
      internal var reload:int = reloadMax;
      
      public function Enemy6()
      {
         super();
         addFrameScript(0,frame1,1,frame2);
         speed = 5;
         AIcounterMax = 24;
         destinationX = this.x;
         actionState = MOVE_STATE;
         hp = 3;
      }
      
      public function shouldDrawSmoke() : Boolean
      {
         return true;
      }
      
      internal function AI() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = getPlayerPos().x;
         if(Math.abs(_loc1_ - this.x) > 400)
         {
            destinationX = _loc1_;
            faceDestination();
            actionState = MOVE_STATE;
            speed = Math.random() * 3 + 2;
         }
         else if(Math.random() * 2 < 1 || Math.abs(_loc1_ - this.x) <= 400)
         {
            if(_loc1_ < this.x)
            {
               destinationX = _loc1_ - 500;
            }
            else
            {
               destinationX = _loc1_ + 500;
            }
            faceDestination();
            actionState = ATTACK_STATE;
            speed = 15;
         }
      }
      
      public function jumpDownStart() : *
      {
         actionState = JUMPDOWN_STATE;
         enemy.gotoAndStop(11);
         this.y -= 25 * 10;
         if(this.currentFrame == 1)
         {
            this.x += 30 * 10;
         }
         else
         {
            this.x -= 30 * 10;
         }
         fallVel = 0;
      }
      
      internal function frame2() : *
      {
         stop();
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      override public function die() : *
      {
         if(StatsManager.instance.survivalMode)
         {
            ++StatsManager.instance.kills;
            dead = true;
            this.y = Player.groundY;
            if(this.x > getPlayerPos().x)
            {
               this.gotoAndStop(2);
            }
            else
            {
               this.gotoAndStop(1);
            }
            if(enemy.currentFrame != 4)
            {
               enemy.gotoAndStop(4);
            }
         }
         else
         {
            SoundManager.instance.playBossDie();
            StatsManager.instance.bossDefeated = true;
            StatsManager.instance.hexState[2][5].side = 2;
            ++StatsManager.instance.kills;
            this.y = Player.groundY;
            dead = true;
            if(this.x > getPlayerPos().x)
            {
               this.gotoAndStop(2);
            }
            else
            {
               this.gotoAndStop(1);
            }
            if(enemy.currentFrame != 4)
            {
               enemy.gotoAndStop(4);
            }
         }
      }
      
      override public function reactShunpo(param1:Array, param2:Array) : *
      {
         if(checkHitBeforeShunpo(param1,param2))
         {
            enemy.gotoAndStop(10);
            actionState = JUMPUP_STATE;
         }
      }
      
      override public function unpauseGame() : *
      {
         if(disappearCounter > 0 && !deathAnimDone)
         {
            MovieClip(this).enemy.enemy.play();
         }
      }
      
      override public function freeze() : *
      {
         frozen = true;
         this.y = Player.groundY;
         enemy.gotoAndStop(1);
         if(Player.instance.currentFrame == 1)
         {
            this.x = getPlayerPos().x + 12;
         }
         else
         {
            this.x = getPlayerPos().x - 12;
         }
      }
      
      public function throwSpear() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         _loc1_ = this.x;
         _loc2_ = this.y - 100;
         _loc3_ = 0;
         _loc4_ = 30;
         if(getPlayerIsFacingLeft())
         {
            _loc4_ = -_loc4_;
         }
         _loc5_ = 20;
         if(_loc1_ > getPlayerPos().x)
         {
            _loc5_ = -_loc5_;
         }
         _loc6_ = -15 + Math.random() * 20;
         _loc7_ = ProjectileManager.instance.createProjectile(Javalin.typeCode,_loc1_,_loc2_,_loc5_,_loc6_);
         if(_loc5_ < 0)
         {
            _loc7_.scaleX = -1;
         }
         _loc8_ = 0;
         _loc9_ = 0;
         while(_loc9_ < _loc8_)
         {
            _loc6_ = -25 + Math.random() * 20;
            _loc7_ = ProjectileManager.instance.createProjectile(Javalin.typeCode,_loc1_,_loc2_,_loc5_,_loc6_);
            if(_loc5_ < 0)
            {
               _loc7_.scaleX = -1;
            }
            _loc9_++;
         }
      }
      
      internal function doAttack() : *
      {
         if(enemy.currentFrame != 3)
         {
            enemy.gotoAndStop(3);
         }
         if(this.x - destinationX > speed)
         {
            this.x -= speed;
         }
         else if(this.x - destinationX < -speed)
         {
            this.x += speed;
         }
         else
         {
            this.x = destinationX;
            actionState = STOP_STATE;
         }
         if(reload <= 0 && Math.abs(this.x - getPlayerPos().x) < 150 && enemy.enemy != null && enemy.enemy.currentFrame < 23)
         {
            enemy.enemy.gotoAndPlay(23);
            reload = reloadMax;
         }
      }
      
      override public function update() : *
      {
         var _loc1_:* = undefined;
         if(isDead() || frozen)
         {
            return;
         }
         --reload;
         if(reload <= 0 && Math.abs(this.x - getPlayerPos().x) < 150 && actionState != ATTACK_STATE && actionState != JUMPUP_STATE && actionState != JUMPDOWN_STATE)
         {
            _loc1_ = getPlayerPos().x;
            if(_loc1_ < this.x)
            {
               destinationX = _loc1_ - 500;
            }
            else
            {
               destinationX = _loc1_ + 500;
            }
            faceDestination();
            actionState = ATTACK_STATE;
            speed = 15;
         }
         --AIcounter;
         if(AIcounter <= 0 && actionState != ATTACK_STATE && actionState != JUMPUP_STATE && actionState != JUMPDOWN_STATE)
         {
            AIcounter = AIcounterMax;
            AI();
         }
         switch(actionState)
         {
            case STOP_STATE:
               doStop();
               break;
            case MOVE_STATE:
               doMove();
               break;
            case ATTACK_STATE:
               doAttack();
               break;
            case DIE_STATE:
               die();
               break;
            case JUMPUP_STATE:
               jumpup();
               break;
            case JUMPDOWN_STATE:
               jumpdown();
         }
      }
      
      override public function arrowHit(param1:Arrow_player) : Boolean
      {
         var _loc2_:* = undefined;
         if(param1.isSimulation())
         {
            return true;
         }
         param1.breakarrow();
         if(enemy.currentFrame == 3 && enemy.enemy != null)
         {
            enemy.enemy.gotoAndPlay(23);
         }
         else
         {
            _loc2_ = getPlayerPos().x;
            if(_loc2_ < this.x)
            {
               destinationX = _loc2_ - 500;
            }
            else
            {
               destinationX = _loc2_ + 500;
            }
            faceDestination();
            actionState = ATTACK_STATE;
            speed = 15;
         }
         return true;
      }
      
      internal function doMove() : *
      {
         faceDestination();
         if(enemy.currentFrame != 2)
         {
            enemy.gotoAndStop(2);
         }
         if(this.x - destinationX > speed)
         {
            this.x -= speed;
         }
         else if(this.x - destinationX < -speed)
         {
            this.x += speed;
         }
         else
         {
            actionState = STOP_STATE;
         }
      }
      
      override public function pauseGame() : *
      {
         MovieClip(this).enemy.enemy.stop();
      }
      
      internal function doStop() : *
      {
         facePlayer();
         if(enemy.currentFrame != 1)
         {
            enemy.gotoAndStop(1);
         }
      }
      
      public function jumpup() : *
      {
      }
      
      public function getPositionAfter15() : int
      {
         var _loc1_:* = undefined;
         _loc1_ = 1;
         if(this.currentFrame == 2)
         {
            _loc1_ = -1;
         }
         return this.x + speed * 15 * _loc1_;
      }
      
      override public function hit(param1:int, param2:int) : Boolean
      {
         if(hp > 0 && actionState == JUMPDOWN_STATE)
         {
            --hp;
            Player.instance.displayScoreMessage("Landed a hit: +500");
            StatsManager.instance.addScore(500);
            SoundManager.instance.playPunch();
            if(hp == 0)
            {
               Player.instance.displayScoreMessage("Boss defeated: +5000");
               StatsManager.instance.addScore(5000);
               if(StatsManager.instance.survivalMode)
               {
                  die();
               }
            }
            return true;
         }
         return false;
      }
      
      public function checkHitBeforeShunpo(param1:Array, param2:Array) : Boolean
      {
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
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
         _loc6_ = enemyManager.getGameStage().x;
         _loc7_ = 0;
         while(_loc7_ < _loc3_.length)
         {
            if(!isDead() && Math.abs(x - _loc3_[_loc7_] + _loc6_) < 100 && MovieClip(this).hitTestPoint(_loc3_[_loc7_],_loc4_[_loc7_],true))
            {
               if(this.hp > 0 && actionState != JUMPDOWN_STATE)
               {
                  return true;
               }
            }
            _loc7_++;
         }
         return false;
      }
      
      public function jumpdown() : *
      {
         facePlayer();
         fallVel += 0.5;
         this.y += fallVel;
         if(this.currentFrame == 1)
         {
            this.x -= 5;
         }
         else
         {
            this.x += 5;
         }
         if(this.y >= Player.groundY)
         {
            actionState = STOP_STATE;
            this.y = Player.groundY;
         }
      }
   }
}

