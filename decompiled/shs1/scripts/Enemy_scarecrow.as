package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol315")]
   public class Enemy_scarecrow extends Enemy
   {
      
      public static var typeCode:int = 100;
      
      internal var yscale:Number = 1;
      
      internal var bird:Enemy_bird = null;
      
      internal var dark:Number;
      
      internal var xscale:Number = 1;
      
      public var ignore:* = false;
      
      public function Enemy_scarecrow()
      {
         var _loc1_:int = 0;
         xscale = 1;
         yscale = 1;
         bird = null;
         ignore = false;
         super();
         addFrameScript(0,frame1,1,frame2,2,frame3,3,frame4);
         _loc1_ = Math.random() * 5;
         if(_loc1_ < 3)
         {
            bird = new Enemy_bird();
            if(_loc1_ == 0)
            {
               bird.setPosition(-40,-135);
            }
            else if(_loc1_ == 1)
            {
               bird.setPosition(40,-135);
            }
            else if(_loc1_ == 2)
            {
               bird.setPosition(0,-165);
            }
            EnemyManager.instance.enemyList.push(bird);
            this.addChild(bird);
            bird.onscarecrow = true;
         }
         this.rotation = -10 + Math.random() * 20;
         this.y += 10 + Math.random() * 25;
         dark = -Math.random() * 60;
         xscale = (Math.random() * 2 + 8) / 10;
         yscale = (Math.random() * 2 + 8) / 10;
         if(Math.random() * 2 < 1)
         {
            xscale = -xscale;
         }
         this.scaleX = xscale;
         this.scaleY = yscale;
      }
      
      internal function frame2() : *
      {
         stop();
      }
      
      internal function frame3() : *
      {
         stop();
      }
      
      internal function frame4() : *
      {
         stop();
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      override public function die() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         if(StatsManager.instance.location == 36)
         {
            MovieClip(parent.parent).stagebg1.tuticon2.visible = false;
            MovieClip(parent.parent).stagebg1.tuticon3.visible = true;
         }
         if(bird != null)
         {
            bird.visible = false;
         }
         dead = true;
         SoundManager.instance.playScarecrowDie();
         if(Player.stageMode == 1)
         {
            this.gotoAndStop(4);
         }
         else
         {
            this.gotoAndStop(2);
         }
         this.rotation += 5;
         _loc1_ = -(Math.random() * 5 + 2);
         _loc2_ = Math.random() * 5 + 20;
         if(Math.random() * 2 < 1)
         {
            _loc2_ = -_loc2_;
            _loc1_ = -_loc1_;
         }
         _loc3_ = new Point(-20,-120);
         _loc3_ = this.localToGlobal(_loc3_);
         _loc3_ = EnemyManager.instance.getGameStage().globalToLocal(_loc3_);
         if(Player.stageMode == 1)
         {
            _loc4_ = ProjectileManager.instance.createProjectile(101,_loc3_.x,_loc3_.y,_loc1_,35);
         }
         else
         {
            _loc4_ = ProjectileManager.instance.createProjectile(100,_loc3_.x,_loc3_.y,_loc1_,35);
         }
         _loc4_.rot = _loc2_;
         _loc4_.scaleX = xscale;
         _loc4_.scaleY = yscale;
      }
      
      override public function unpauseGame() : *
      {
      }
      
      override public function freeze() : *
      {
         if(bird != null)
         {
            bird.visible = false;
         }
      }
      
      override public function isDead() : Boolean
      {
         if(Boolean(ignore) && !dead)
         {
            return false;
         }
         return dead;
      }
      
      override public function update() : *
      {
         if(Player.stageMode == 1)
         {
            if(dead)
            {
               gotoAndStop(4);
            }
            else
            {
               gotoAndStop(3);
            }
         }
      }
      
      override public function arrowHit(param1:Arrow_player) : Boolean
      {
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
            if(hp <= 0)
            {
               if(param1.killingHit)
               {
                  freeze();
               }
               else
               {
                  if(bird != null)
                  {
                     bird.flyaway();
                  }
                  die();
               }
            }
            return true;
         }
         return false;
      }
      
      override public function pauseGame() : *
      {
      }
      
      override public function hit(param1:int, param2:int) : Boolean
      {
         if(bird != null)
         {
            bird.flyaway();
         }
         if(hp > 0)
         {
            --hp;
            return true;
         }
         return false;
      }
   }
}

