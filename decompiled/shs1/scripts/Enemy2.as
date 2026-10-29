package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol124")]
   public class Enemy2 extends Enemy
   {
      
      public static var typeCode:int = 2;
      
      internal var reloadCounter:int;
      
      internal var maxReloadCounter:int = 4 * 24;
      
      public var lastAimAngle:int = 0;
      
      public var enemy:MovieClip;
      
      public function Enemy2()
      {
         reloadCounter = maxReloadCounter;
         super();
         addFrameScript(0,frame1,1,frame2);
         speed = 2;
         AIcounterMax = 5 * 24;
         destinationX = this.x;
         actionState = MOVE_STATE;
      }
      
      public function getAimAngle(param1:MovieClip) : int
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         if(frozen)
         {
            return param1.rotation;
         }
         _loc2_ = this.x;
         _loc3_ = this.y - 50;
         _loc4_ = getPlayerPos().x + 10;
         _loc5_ = getPlayerPos().y - 50;
         _loc6_ = 20;
         if(_loc2_ > _loc4_)
         {
            _loc6_ = -_loc6_;
         }
         _loc7_ = (_loc4_ - _loc2_) / _loc6_;
         _loc8_ = (_loc5_ + 0.5 * Arrow.gravity * _loc7_ * _loc7_ - _loc3_) / _loc7_;
         lastAimAngle = Math.atan2(_loc8_,_loc6_) * 180 / Math.PI;
         if(_loc6_ < 0)
         {
            lastAimAngle = -Math.atan2(_loc8_,_loc6_) * 180 / Math.PI - 180;
         }
         return lastAimAngle;
      }
      
      internal function AI() : *
      {
         var _loc1_:* = undefined;
         if(Player.stageMode == 1)
         {
            return;
         }
         _loc1_ = getPlayerPos().x;
         if(Math.random() * 25 < 1 || this.x < 70 || this.x > StageManager.instance.stageWidth - 30)
         {
            actionState = MOVE_STATE;
            if(Math.abs(this.x - _loc1_) < 700)
            {
               if(this.x - _loc1_ > 0)
               {
                  destinationX = this.x + Math.random() * 100;
               }
               else
               {
                  destinationX = this.x - Math.random() * 100;
               }
            }
            if(destinationX < 0)
            {
               destinationX = Math.random() * 150;
            }
            else if(destinationX > StageManager.instance.stageWidth)
            {
               destinationX = StageManager.instance.stageWidth - Math.random() * 150;
            }
            faceDestination();
         }
         else
         {
            actionState = ATTACK_STATE;
            if(enemy.currentFrame != 1)
            {
               enemy.gotoAndStop(1);
            }
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
         switch(actionState)
         {
            case STOP_STATE:
               doStop();
               break;
            case MOVE_STATE:
               doMove();
               break;
            case ATTACK_STATE:
               facePlayer();
               --reloadCounter;
               if(reloadCounter <= 0)
               {
                  reloadCounter = maxReloadCounter;
                  doAttack();
               }
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
            if(MovieClip(this).enemy.enemy != null)
            {
               if(MovieClip(this).enemy.enemy.aimtop != null)
               {
                  if(MovieClip(this).enemy.enemy.aimtop.head.hitTestObject(param1))
                  {
                     headshot = true;
                  }
               }
               else if(MovieClip(this).enemy.enemy.head != null)
               {
                  if(MovieClip(this).enemy.enemy.head.hitTestObject(param1))
                  {
                     headshot = true;
                  }
               }
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
         if(enemy.currentFrame != 2)
         {
            enemy.gotoAndStop(2);
         }
         if(destinationX - this.x < -speed)
         {
            this.x -= speed;
         }
         else if(destinationX - this.x > speed)
         {
            this.x += speed;
         }
         else
         {
            actionState = ATTACK_STATE;
            if(enemy.currentFrame != 1)
            {
               enemy.gotoAndStop(1);
            }
         }
      }
      
      public function shootArrow(param1:MovieClip) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         var _loc10_:* = undefined;
         _loc2_ = this.x;
         _loc3_ = this.y - 80;
         _loc4_ = Math.random() * 200 - 100;
         _loc5_ = 2;
         if(getPlayerIsFacingLeft())
         {
            _loc5_ = -_loc5_;
         }
         _loc6_ = 20;
         if(_loc2_ > getPlayerPos().x)
         {
            _loc6_ = -_loc6_;
         }
         _loc7_ = (this.x - getPlayerPos().x) / (_loc5_ - _loc6_);
         _loc8_ = getPlayerPos().y - 125 + _loc4_;
         _loc9_ = (_loc8_ + 0.5 * Arrow.gravity * _loc7_ * _loc7_ - _loc3_) / _loc7_;
         _loc10_ = ProjectileManager.instance.createProjectile(Arrow.typeCode,_loc2_,_loc3_,_loc6_,_loc9_);
         if(_loc6_ < 0)
         {
            _loc10_.scaleX = -1;
         }
      }
      
      public function doStop() : *
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
         if(this.enemy.currentFrame == 1 || this.enemy.currentFrame == 3)
         {
            if(this.enemy.enemy.aimtop != null)
            {
               if(this.enemy.enemy.aimtop.bow.hitTestPoint(param1,param2,true))
               {
                  return false;
               }
            }
            else if(this.enemy.enemy.bow != null)
            {
               if(this.enemy.enemy.bow.hitTestPoint(param1,param2,true))
               {
                  return false;
               }
            }
         }
         if(hp > 0)
         {
            --hp;
            _loc3_ = new Point(param1,param2);
            if(MovieClip(this).enemy.enemy.aimtop != null)
            {
               if(MovieClip(this).enemy.enemy.aimtop.head.hitTestPoint(_loc3_.x,_loc3_.y))
               {
                  headshot = true;
               }
            }
            if(MovieClip(this).enemy.enemy.head != null)
            {
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

