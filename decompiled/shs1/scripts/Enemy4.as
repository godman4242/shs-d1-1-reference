package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol149")]
   public class Enemy4 extends Enemy
   {
      
      public static var typeCode:int = 4;
      
      public var enemy:MovieClip;
      
      public function Enemy4()
      {
         super();
         addFrameScript(0,frame1,1,frame2);
         speed = 3;
         AIcounterMax = 24;
         destinationX = this.x;
         actionState = MOVE_STATE;
      }
      
      internal function AI() : *
      {
         var _loc1_:* = undefined;
         if(Player.stageMode == 1)
         {
            return;
         }
         _loc1_ = getPlayerPos().x;
         if(Math.abs(_loc1_ - this.x) > 400)
         {
            destinationX = _loc1_;
            faceDestination();
            actionState = MOVE_STATE;
            speed = Math.random() * 3 + 1;
         }
         else if(Math.random() * 2 < 1 || Math.abs(_loc1_ - this.x) < 200)
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
            speed = 8;
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
            facePlayer();
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
         if(AIcounter <= 0 && actionState != ATTACK_STATE)
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
         }
      }
      
      override public function arrowHit(param1:Arrow_player) : Boolean
      {
         if(param1.y < this.y - 97)
         {
            return false;
         }
         if(enemy.currentFrame == 3)
         {
            if(param1.y < this.y - 75)
            {
               return false;
            }
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
      
      internal function doStop() : *
      {
         facePlayer();
         if(enemy.currentFrame != 1)
         {
            enemy.gotoAndStop(1);
         }
      }
      
      override public function hit(param1:int, param2:int) : Boolean
      {
         var _loc3_:* = undefined;
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

