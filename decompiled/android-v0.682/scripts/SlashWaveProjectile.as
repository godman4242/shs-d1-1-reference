package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1657")]
   public class SlashWaveProjectile extends Projectile
   {
      
      public var wave:MovieClip;
      
      public var grass:MovieClip;
      
      public function SlashWaveProjectile()
      {
         super();
      }
      
      override public function init(velX:int, velY:int, damage:int, skilllevel:int, owner:NPC = null) : *
      {
         var scale:Number = NaN;
         scale = 1;
         if(skilllevel == 1)
         {
            scale = 1;
            damage = 25;
         }
         else if(skilllevel == 2)
         {
            scale = 1.2;
            damage = 50;
         }
         else if(skilllevel == 3)
         {
            scale = 1.3;
            damage = 75;
         }
         this.scaleX = scale;
         this.scaleY = scale;
         visible = true;
         flying = true;
         this.velX = velX;
         this.velY = velY;
         ttl = 30;
         this.owner = owner;
         if(velX < 0)
         {
            scaleX = -scaleX;
         }
         damageObj = new Damage(damage,0);
      }
      
      override public function update() : *
      {
         doDisappear();
         x += velX;
         if(isFriendly())
         {
            NPCManager.checkHitObject(this,damageObj);
         }
         else
         {
            NPCManager.checkPlayerHitObject(this,damageObj);
         }
      }
      
      override internal function removeProjectile() : *
      {
         flying = false;
         visible = false;
         MovieClip(parent).removeChild(this);
         ProjectileManager.unregister(this);
      }
   }
}

