package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol351")]
   public class Enemy_squirrel extends Enemy
   {
      
      public static var typeCode:int = 102;
      
      public var squirrel:MovieClip;
      
      internal var running:Boolean = false;
      
      public function Enemy_squirrel()
      {
         super();
         addFrameScript(0,frame1,1,frame2);
         type = typeCode;
         if(Math.random() * 2 < 1)
         {
            this.scaleX = -1;
         }
         hp = 0;
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
         if(this.squirrel != null)
         {
            this.squirrel.play();
         }
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
         if(Player.stageMode == 1)
         {
            freeze();
            frozen = true;
         }
         if(!visible || frozen)
         {
            return;
         }
         if(running)
         {
            if(this.scaleX == 1)
            {
               this.x += 10;
            }
            else
            {
               this.x -= 10;
            }
            if(this.x < -50 || this.x > StageManager.instance.stageWidth + 50)
            {
               this.visible = false;
            }
            if(Math.random() * 8 < 1)
            {
               running = false;
               this.gotoAndStop(1);
            }
         }
         else if(Math.random() * 20 < 1)
         {
            running = true;
            this.gotoAndStop(2);
         }
      }
      
      override public function pauseGame() : *
      {
         if(this.squirrel != null)
         {
            this.squirrel.stop();
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
   }
}

