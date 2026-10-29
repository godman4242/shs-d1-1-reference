package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2579")]
   public class Obj_Bird extends InteractiveStageObject
   {
      
      public var flybird:MovieClip;
      
      internal var flying:Boolean = false;
      
      internal var velX:int;
      
      internal var velY:int;
      
      public function Obj_Bird()
      {
         var scale:Number = NaN;
         super();
         addFrameScript(0,this.frame1,1,this.frame2);
         updateMe = true;
         scale = Math.random() * 0.4 + 1;
         if(int(Math.random() * 2) == 0)
         {
            scaleX = scale;
         }
         else
         {
            scaleX = -scale;
         }
         scaleY = scale;
      }
      
      override public function interactClick() : *
      {
         interact();
      }
      
      override public function isInInteractRange(mc:MovieClip) : Boolean
      {
         return abs(x - mc.x) < 200;
      }
      
      override public function showInteractButton(flag:Boolean) : *
      {
         if(!this.flying)
         {
            this.flyaway();
         }
      }
      
      override public function getDisplayText() : String
      {
         return "";
      }
      
      override public function update() : *
      {
         if(this.flying)
         {
            x += this.velX;
            y -= this.velY;
            if(y < -10 || this.velX < 0 && x < -10 || this.velX > 0 && x > StatsManager.stageWidth + 10)
            {
               this.flying = false;
               this.visible = false;
               canInteract = false;
            }
         }
      }
      
      public function flyaway() : *
      {
         var dest:int = 0;
         if(Math.random() * 2 < 1)
         {
            dest = this.x + Math.random() * 200;
         }
         else
         {
            dest = this.x - Math.random() * 200;
         }
         this.flyTo(dest,-20);
      }
      
      public function flyTo(fx:int, fy:int) : *
      {
         this.flying = true;
         gotoAndStop(2);
         this.velY = 5 + Math.random() * 8;
         if(fx < x)
         {
            scaleX = 1;
            this.velX = -(Math.random() * 10 + 12);
         }
         else
         {
            scaleX = -1;
            this.velX = Math.random() * 10 + 12;
         }
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         stop();
      }
   }
}

