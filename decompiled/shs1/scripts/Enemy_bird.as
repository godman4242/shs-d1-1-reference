package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol344")]
   public class Enemy_bird extends Enemy
   {
      
      public static var typeCode:int = 101;
      
      internal var destinationY:*;
      
      internal var flystraight:* = false;
      
      internal var flying:Boolean = false;
      
      internal var oldx:* = 0;
      
      internal var yspeed:*;
      
      public var onscarecrow:Boolean = false;
      
      public var flybird:MovieClip;
      
      public function Enemy_bird()
      {
         super();
         addFrameScript(0,frame1,1,frame2);
         type = typeCode;
         hp = 0;
      }
      
      public function flyTo(param1:*, param2:*) : *
      {
         flying = true;
         destinationX = param1;
         destinationY = param2;
         this.gotoAndStop(2);
         oldx = this.x;
         yspeed = Math.random() * 10;
         if(param1 < this.x)
         {
            this.scaleX = 1;
         }
         else
         {
            this.scaleX = -1;
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
      }
      
      override public function unpauseGame() : *
      {
         if(flybird != null)
         {
            flybird.play();
         }
      }
      
      public function flyStraight(param1:*, param2:*, param3:*) : *
      {
         if(param3 < param1)
         {
            this.scaleX = 1;
         }
         else
         {
            this.scaleX = -1;
         }
         flystraight = true;
         this.gotoAndStop(2);
         oldx = param1;
         destinationX = param3;
         this.x = param1;
         this.y = param2;
      }
      
      override public function freeze() : *
      {
         this.visible = false;
      }
      
      override public function isDead() : Boolean
      {
         return true;
      }
      
      override public function update() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:Enemy_bird = null;
         var _loc4_:* = undefined;
         if(Player.stageMode == 1)
         {
            freeze();
            frozen = true;
         }
         if(!visible)
         {
            return;
         }
         if(frozen)
         {
            return;
         }
         if(!flystraight && !flying && isNearPlayer())
         {
            if(Math.random() * 2 < 1)
            {
               return;
            }
            flyaway();
            _loc1_ = 0;
            while(_loc1_ < EnemyManager.instance.enemyList.length)
            {
               _loc2_ = EnemyManager.instance.enemyList[_loc1_];
               if(_loc2_.type == 101)
               {
                  _loc3_ = _loc2_;
                  if(!_loc3_.flying && !_loc3_.flystraight && Math.abs(_loc3_.x - this.x) < 200)
                  {
                     if(Math.random() * 2 < 1)
                     {
                        _loc4_ = _loc3_.x + Math.random() * 200;
                     }
                     else
                     {
                        _loc4_ = _loc3_.x - Math.random() * 200;
                     }
                     _loc3_.flyTo(_loc4_,-20);
                  }
               }
               _loc1_++;
            }
         }
         else if(flying)
         {
            if(destinationX > oldx)
            {
               this.x += Math.random() * 10 + 10;
            }
            else
            {
               this.x -= Math.random() * 10 + 10;
            }
            this.y -= yspeed;
            yspeed += Math.random() * 4 - 2;
            if(!onscarecrow && this.y <= destinationY || onscarecrow && this.y <= destinationY - MovieClip(this.parent).y)
            {
               flying = false;
               this.visible = false;
            }
         }
         else if(flystraight)
         {
            if(destinationX > oldx)
            {
               this.x += 5;
            }
            else if(destinationX < oldx)
            {
               this.x -= 5;
            }
            this.y += Math.random() * 2 - 1;
            if(this.x < 0 || this.x > StageManager.instance.stageWidth)
            {
               flystraight = false;
               this.visible = false;
            }
         }
      }
      
      override public function pauseGame() : *
      {
         if(flybird != null)
         {
            flybird.stop();
         }
      }
      
      override public function hit(param1:int, param2:int) : Boolean
      {
         if(hp > 0)
         {
            --hp;
            return true;
         }
         return false;
      }
      
      public function flyaway() : *
      {
         var _loc1_:* = undefined;
         if(flying)
         {
            return;
         }
         if(Math.random() * 2 < 1)
         {
            _loc1_ = this.x + Math.random() * 200;
         }
         else
         {
            _loc1_ = this.x - Math.random() * 200;
         }
         flyTo(_loc1_,-20);
      }
   }
}

