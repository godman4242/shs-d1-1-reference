package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol330")]
   public class Arrow extends Projectile
   {
      
      public static var gravity:Number = 1;
      
      public static var typeCode:int = 1;
      
      public function Arrow(param1:int, param2:int, param3:Number, param4:Number)
      {
         super();
         addFrameScript(0,frame1,1,frame2);
         this.x = param1;
         this.y = param2;
         this.velX = param3;
         this.velY = param4;
         this.buttonMode = true;
         this.addEventListener(MouseEvent.CLICK,onClick);
      }
      
      override public function breakarrow() : *
      {
         var _loc1_:* = undefined;
         flying = false;
         visible = false;
         _loc1_ = ProjectileManager.instance.createProjectile(Arrow_broken.typeCode,this.x,this.y,-10 + Math.random() * 20,-5 + Math.random() * 10);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         stop();
      }
      
      override public function update() : *
      {
         if(!flying)
         {
            doDissappear();
            return;
         }
         this.x += velX;
         this.y -= velY;
         this.rotation = Math.atan(-velY / velX) * (180 / Math.PI);
         velY -= gravity;
         if(this.hitTestObject(MovieClip(parent.parent).player))
         {
            if(MovieClip(parent.parent).player.gotArrowHit(this))
            {
               this.visible = false;
               this.flying = false;
            }
         }
         if(this.y > Player.groundY - 15)
         {
            if(Math.random() * 3 > 1)
            {
               flying = false;
               this.gotoAndStop(2);
            }
         }
      }
      
      internal function onClick(param1:MouseEvent) : void
      {
         if(Player.stageMode == 2)
         {
            return;
         }
         this.visible = false;
         this.flying = false;
         StatsManager.instance.addArrowAmmo();
      }
   }
}

