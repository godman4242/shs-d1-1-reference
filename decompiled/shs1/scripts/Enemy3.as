package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol167")]
   public class Enemy3 extends Enemy
   {
      
      public static var typeCode:int = 3;
      
      public var enemy:MovieClip;
      
      internal var reload:Boolean = false;
      
      public function Enemy3()
      {
         super();
         addFrameScript(0,frame1,1,frame2);
         speed = 3;
         AIcounterMax = 48;
         destinationX = this.x;
         actionState = MOVE_STATE;
      }
      
      public function moveAgain() : *
      {
         destinationX = getPlayerPos().x;
         faceDestination();
         actionState = MOVE_STATE;
         speed = Math.random() * 2 + 2;
      }
      
      internal function AI() : *
      {
         var _loc1_:* = undefined;
         if(Player.stageMode == 1)
         {
            return;
         }
         _loc1_ = getPlayerPos().x;
         if(Math.abs(_loc1_ - this.x) > 70)
         {
            destinationX = _loc1_;
            faceDestination();
            actionState = MOVE_STATE;
            speed = Math.random() * 3 + 2;
         }
         else if(!reload)
         {
            actionState = ATTACK_STATE;
         }
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
         dead = true;
         SoundManager.instance.playDie();
         ++StatsManager.instance.kills;
         if(headshot)
         {
            enemy.gotoAndStop(6);
         }
         else if(arrowshot && Player.stageMode == 1)
         {
            enemy.gotoAndStop(7);
         }
         else
         {
            if(!arrowshot)
            {
               if(Math.random() * 2 < 1)
               {
                  this.gotoAndStop(1);
               }
               else
               {
                  this.gotoAndStop(2);
               }
            }
            if(Math.random() * 10 > 1)
            {
               enemy.gotoAndStop(4);
            }
            else
            {
               enemy.gotoAndStop(5);
            }
         }
      }
      
      override public function freeze() : *
      {
         this.enemy.enemy.stop();
         frozen = true;
      }
      
      public function setReload(param1:Boolean) : *
      {
         reload = param1;
      }
      
      internal function doAttack() : *
      {
         facePlayer();
         if(!reload && enemy.currentFrame != 3)
         {
            enemy.gotoAndStop(3);
         }
      }
      
      override public function update() : *
      {
         if(isDead())
         {
            doDisappear();
            return;
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
         if(hp > 0 && Math.abs(getPlayerPos().x - this.x) <= 70 && !reload && this.x > 20 && this.x < Player.instance.windowWidth - 20)
         {
            actionState = ATTACK_STATE;
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
         }
      }
      
      override public function arrowHit(param1:Arrow_player) : Boolean
      {
         if(param1.y < this.y - 100)
         {
            return false;
         }
         if(param1.isSimulation())
         {
            if(hp == 1)
            {
               param1.killingHit = true;
            }
            return true;
         }
         if(hp > 0)
         {
            --hp;
            arrowshot = true;
            if(MovieClip(this).enemy.enemy != null && Boolean(MovieClip(this).enemy.enemy.head.hitTestObject(param1)))
            {
               headshot = true;
            }
            if(hp <= 0)
            {
               if(param1.killingHit)
               {
                  freeze();
                  if(headshot)
                  {
                     Player.instance.displayScoreMessage("Coup de Grace Arrow Headshot: +5000");
                     StatsManager.instance.addScore(5000);
                     ++StatsManager.instance.arrowHeadShots;
                  }
                  else
                  {
                     Player.instance.displayScoreMessage("Coup de Grace: +500");
                     StatsManager.instance.addScore(500);
                  }
               }
               else
               {
                  die();
                  if(headshot)
                  {
                     Player.instance.displayScoreMessage("Arrow Headshot: +400");
                     StatsManager.instance.addScore(400);
                     ++StatsManager.instance.arrowHeadShots;
                  }
                  else
                  {
                     Player.instance.displayScoreMessage("+100");
                     StatsManager.instance.addScore(100);
                  }
               }
            }
            return true;
         }
         return false;
      }
      
      internal function doMove() : *
      {
         reload = false;
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
         if(MovieClip(this).enemy.currentFrame == 3 && (MovieClip(this).enemy.enemy.currentFrame == 3 || MovieClip(this).enemy.enemy.currentFrame == 4))
         {
            MovieClip(this).enemy.enemy.gotoAndStop(5);
         }
         else
         {
            MovieClip(this).enemy.enemy.stop();
         }
      }
      
      internal function doStop() : *
      {
         if(enemy.currentFrame != 1)
         {
            enemy.gotoAndStop(1);
         }
      }
      
      override public function hit(param1:int, param2:int) : Boolean
      {
         var _loc3_:* = undefined;
         if(this.enemy.currentFrame == 1 || this.enemy.currentFrame == 2 || this.enemy.currentFrame == 3)
         {
            if(this.enemy.enemy.weapon != null)
            {
               if(this.enemy.enemy.weapon.hitTestPoint(param1,param2))
               {
                  return false;
               }
            }
         }
         if(hp > 0)
         {
            --hp;
            _loc3_ = new Point(param1,param2);
            if(MovieClip(this).enemy.enemy.head.hitTestPoint(_loc3_.x,_loc3_.y))
            {
               headshot = true;
            }
            return true;
         }
         return false;
      }
   }
}

