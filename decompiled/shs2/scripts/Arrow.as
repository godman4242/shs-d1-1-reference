package
{
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol78")]
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
      }
      
      override public function breakarrow() : *
      {
         var _loc1_:Projectile = null;
         flying = false;
         visible = false;
         _loc1_ = ProjectileManager.instance.createProjectile(Arrow_broken.typeCode,this.x,this.y,velX / 2,-5 + Math.random() * 10);
         _loc1_.rotation = this.rotation;
         _loc1_.scaleX = this.scaleX;
         SoundManager.instance.playDeflect();
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      override public function scrollRight(param1:int) : *
      {
         if(!flying)
         {
            x -= param1;
         }
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
         if(this.hitTestObject(Player.instance))
         {
            if(Player.instance.gotArrowHit(this))
            {
               this.visible = false;
               this.flying = false;
            }
         }
         if(this.y > GameStage.groundY - 15 && Math.random() * 3 > 1)
         {
            flying = false;
            this.gotoAndStop(2);
         }
         if(this.x < -100 || this.x > GameStage.stageWidth + 100 || this.y < -100 || this.y > 500)
         {
            flying = false;
            visible = false;
         }
      }
      
      internal function onClick(param1:MouseEvent) : void
      {
      }
   }
}

