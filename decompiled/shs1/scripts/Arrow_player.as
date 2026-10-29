package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol329")]
   public class Arrow_player extends Projectile
   {
      
      public static var gravity:Number = 1;
      
      public static var typeCode:int = 5;
      
      public var killingHit:Boolean = false;
      
      internal var enemyTarget:Enemy;
      
      public var sharpend:MovieClip;
      
      internal var stopcentering:Boolean = false;
      
      internal var centered:Boolean = false;
      
      internal var simulating:Boolean = false;
      
      public function Arrow_player(param1:int, param2:int, param3:Number, param4:Number)
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
         _loc1_ = ProjectileManager.instance.createProjectile(Arrow_broken.typeCode,this.x,this.y,-10 + Math.random() * 20,-5 + Math.random() * 10);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      public function unfreeze() : *
      {
         flying = true;
         stopcentering = true;
      }
      
      internal function frame2() : *
      {
         stop();
      }
      
      override public function update() : *
      {
         if(!flying)
         {
            if(!killingHit)
            {
               doDissappear();
            }
            return;
         }
         this.x += velX;
         this.y -= velY;
         this.rotation = Math.atan(-velY / velX) * (180 / Math.PI);
         velY -= gravity;
         if(Player.stageMode == 1 && !stopcentering)
         {
            if(!centered)
            {
               centered = true;
               Player.instance.centrePlayer();
            }
            MovieClip(parent).x = MovieClip(parent).x - this.velX;
            MovieClip(parent.parent).playercanvas.x = MovieClip(parent.parent).playercanvas.x - this.velX;
         }
         if(EnemyManager.instance.checkArrowHit(this))
         {
            flying = false;
            if(Player.stageMode == 1)
            {
               this.x = enemyTarget.x;
               EnemyManager.instance.freezeCounter = 36;
            }
            else
            {
               this.visible = false;
            }
         }
         if(Player.stageMode == 1 && EnemyManager.instance.freezeCounter <= 0 && !enemyTarget.isDead() || enemyTarget != null && !enemyTarget.isDead() && killingHit && !simulating && Math.abs(enemyTarget.getPlayerPos().x - enemyTarget.x) < Math.abs(enemyTarget.getPlayerPos().x - this.x))
         {
            enemyTarget.setArrowShot(true);
            enemyTarget.die();
            trace("autokill");
            stopcentering = true;
            this.visible = false;
         }
         if(this.y > Player.groundY - 15)
         {
            if(Math.random() * 3 > 1)
            {
               flying = false;
               if(this.x > 0 && this.x < MovieClip(parent.parent).foreground.width)
               {
                  MovieClip(parent.parent).stagebg1.addChild(this);
               }
            }
         }
         if(this.x < 0 || this.x > StageManager.instance.stageWidth)
         {
            this.visible = false;
            this.flying = false;
         }
      }
      
      public function simulateHit(param1:Enemy) : Boolean
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         simulating = true;
         killingHit = false;
         _loc2_ = this.x;
         _loc3_ = this.y;
         _loc4_ = velX;
         _loc5_ = velY;
         _loc6_ = param1.x;
         _loc7_ = param1.y;
         enemyTarget = param1;
         while(this.flying && !killingHit)
         {
            if(param1.currentFrame == 1)
            {
               param1.x += param1.speed;
            }
            else
            {
               param1.x -= param1.speed;
            }
            this.update();
         }
         this.x = _loc2_;
         this.y = _loc3_;
         velX = _loc4_;
         velY = _loc5_;
         this.visible = true;
         param1.x = _loc6_;
         param1.y = _loc7_;
         flying = true;
         simulating = false;
         return killingHit;
      }
      
      public function isSimulation() : Boolean
      {
         return simulating;
      }
      
      public function disable() : *
      {
         flying = false;
         visible = false;
         killingHit = false;
      }
      
      internal function onClick(param1:MouseEvent) : void
      {
         if(Player.stageMode == 2)
         {
            return;
         }
         this.disable();
         StatsManager.instance.addArrowAmmo();
      }
   }
}

