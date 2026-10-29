package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1842")]
   public class ChargedShotProjectile extends Projectile
   {
      
      public function ChargedShotProjectile()
      {
         super();
      }
      
      override public function init(velX:int, velY:int, damage:int, skilllevel:int, owner:NPC = null) : *
      {
         if(damage > 10)
         {
            damage = 10;
         }
         var chargePercent:Number = damage / 10;
         scaleX = 1 + chargePercent;
         scaleY = scaleX;
         if(skilllevel == 1)
         {
            damage = 20 * damage;
         }
         else if(skilllevel == 2)
         {
            damage = 40 * damage;
         }
         else if(skilllevel == 3)
         {
            damage = 60 * damage;
         }
         visible = true;
         flying = true;
         this.velX = velX;
         this.velY = velY;
         ttl = 24 * 3;
         this.owner = owner;
         if(velX < 0)
         {
            scaleX = -scaleX;
         }
         damageObj = new Damage(damage,0,Damage.LAUNCH_KNOCKDOWN);
      }
      
      override public function update() : *
      {
         this.doDisappear();
         x += velX;
         if(flying)
         {
            if(isFriendly())
            {
               if(NPCManager.checkHitObject(this,damageObj))
               {
                  ttl = 6;
                  flying = false;
               }
            }
            else if(NPCManager.checkPlayerHitObject(this,damageObj,100,false,null,owner))
            {
               ttl = 6;
               flying = false;
            }
         }
      }
      
      override public function doDisappear() : *
      {
         if(ttl >= 0)
         {
            --ttl;
            if(ttl < 6)
            {
               flying = false;
               this.alpha = ttl / 6;
               if(scaleX > 0)
               {
                  scaleX += 0.4;
               }
               else
               {
                  scaleX -= 0.4;
               }
               this.scaleY += 0.4;
            }
            if(ttl <= 0)
            {
               this.alpha = 1;
               this.removeProjectile();
            }
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

