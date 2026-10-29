package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1612")]
   public class WaterSplashProjectile extends Projectile
   {
      
      public function WaterSplashProjectile()
      {
         super();
         addFrameScript(20,this.frame21);
      }
      
      override public function init(velX:int, velY:int, damage:int, skilllevel:int, owner:NPC = null) : *
      {
         var scale:Number = NaN;
         scale = 1;
         if(skilllevel == 1)
         {
            scale = 1;
            damage *= 0.8;
         }
         else if(skilllevel == 2)
         {
            scale = 1.1;
            damage *= 0.9;
         }
         else if(skilllevel == 3)
         {
            scale = 1.2;
            damage *= 1;
         }
         else if(skilllevel == 4)
         {
            scale = 1.3;
            damage *= 1.1;
         }
         else if(skilllevel == 5)
         {
            scale = 1.4;
            damage *= 1.2;
         }
         this.scaleX = scale;
         this.scaleY = scale;
         visible = true;
         flying = true;
         if(velX < 0)
         {
            scaleX = -scaleX;
         }
         this.owner = owner;
         damageObj = new Damage(0,0,2,-1,0,damage);
      }
      
      override public function update() : *
      {
         if(isFriendly())
         {
            NPCManager.checkHitObject(this,damageObj,200);
         }
         else
         {
            NPCManager.checkPlayerHitObject(this,damageObj,200);
         }
      }
      
      override internal function removeProjectile() : *
      {
         stop();
         flying = false;
         visible = false;
         MovieClip(parent).removeChild(this);
         ProjectileManager.unregister(this);
      }
      
      internal function frame21() : *
      {
         this.removeProjectile();
      }
   }
}

