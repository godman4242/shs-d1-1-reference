package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol214")]
   public class Enemy5 extends Enemy
   {
      
      public static var typeCode:int = 5;
      
      public var stuckarrow3rot:* = 0;
      
      public var stuckarrow1rot:* = 0;
      
      public var enemy:MovieClip;
      
      public var stuckarrow2rot:* = 0;
      
      public function Enemy5()
      {
         super();
         addFrameScript(0,frame1,1,frame2);
         speed = 1;
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
         if(actionState == STOP_STATE && Math.random() * 3 < 2)
         {
            return;
         }
         if(Math.random() * 4 < 1 && this.x > 20 && this.x < Player.instance.windowWidth - 20)
         {
            actionState = STOP_STATE;
         }
         else if(Math.abs(_loc1_ - this.x) > 50)
         {
            destinationX = _loc1_;
            faceDestination();
            actionState = MOVE_STATE;
            speed = Math.random() * 3 + 1;
         }
         else
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
      
      internal function doAttack() : *
      {
         facePlayer();
         if(enemy.currentFrame != 3)
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
         if(hp > 0 && Math.abs(getPlayerPos().x - this.x) <= 50)
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
         if(param1.y < this.y - 95)
         {
            return false;
         }
         if(enemy.currentFrame == 1 && enemy.enemy != null && enemy.enemy.currentFrame == 3)
         {
            if(param1.y < this.y - 75)
            {
               return false;
            }
         }
         if(hp > 0)
         {
            if(!(enemy.enemy.shield != null && !enemy.enemy.shield.shield.hitTestObject(param1)))
            {
               if(param1.isSimulation())
               {
                  param1.killingHit = false;
                  return true;
               }
               if(this.currentFrame == 1)
               {
                  this.x -= 20;
               }
               else
               {
                  this.x += 20;
               }
               param1.disable();
               if(Math.random() * 3 < 1)
               {
                  param1.breakarrow();
               }
               else if(!enemy.enemy.shield.shield.stuckarrow1.visible)
               {
                  enemy.enemy.shield.shield.stuckarrow1.rotation = param1.rotation;
                  enemy.enemy.shield.shield.stuckarrow1.visible = true;
                  stuckarrow1rot = param1.rotation;
               }
               else if(!enemy.enemy.shield.shield.stuckarrow2.visible)
               {
                  enemy.enemy.shield.shield.stuckarrow2.rotation = param1.rotation;
                  enemy.enemy.shield.shield.stuckarrow2.visible = true;
                  stuckarrow2rot = param1.rotation;
               }
               else if(!enemy.enemy.shield.shield.stuckarrow3.visible)
               {
                  enemy.enemy.shield.shield.stuckarrow3.rotation = param1.rotation;
                  enemy.enemy.shield.shield.stuckarrow3.visible = true;
                  stuckarrow3rot = param1.rotation;
               }
               else
               {
                  param1.breakarrow();
               }
               return true;
            }
            if(param1.isSimulation())
            {
               if(hp == 1)
               {
                  param1.killingHit = true;
               }
               return true;
            }
            --hp;
            if(MovieClip(this).enemy.enemy.head.hitTestObject(param1))
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
         }
         return false;
      }
      
      internal function doMove() : *
      {
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
            if(!enemy.enemy.shield.shield.hitTestPoint(param1,param2))
            {
               --hp;
               _loc3_ = new Point(param1,param2);
               if(MovieClip(this).enemy.enemy.head.hitTestPoint(_loc3_.x,_loc3_.y))
               {
                  headshot = true;
               }
            }
            return true;
         }
         return false;
      }
   }
}

