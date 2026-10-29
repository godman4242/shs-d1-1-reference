package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2325")]
   public class VoidFireColumnProjectile extends Projectile
   {
      
      public function VoidFireColumnProjectile()
      {
         super();
         addFrameScript(11,this.frame12,34,this.frame35);
      }
      
      override public function init(velX:int, velY:int, damage:int, skilllevel:int, owner:NPC = null) : *
      {
         if(skilllevel == 1)
         {
            damage = 5;
            ttl = 24 * 2;
         }
         else if(skilllevel == 2)
         {
            damage = 10;
            ttl = 24 * 3;
         }
         else if(skilllevel == 3)
         {
            damage = 15;
            ttl = 24 * 4;
         }
         visible = true;
         flying = true;
         if(velX < 0)
         {
            scaleX = -scaleX;
         }
         this.owner = owner;
         damageObj = new Damage(damage,0,Damage.LAUNCH_AIR);
      }
      
      override public function update() : *
      {
         if(flying)
         {
            if(isFriendly())
            {
               NPCManager.checkHitObject(this,damageObj,100);
            }
            else
            {
               NPCManager.checkPlayerHitObject(this,damageObj,100);
            }
            --ttl;
            if(ttl <= 0)
            {
               flying = false;
               gotoAndPlay("end");
               ttl = 12;
            }
         }
         else if(ttl > 0)
         {
            --ttl;
            if(ttl == 0)
            {
               this.removeProjectile();
            }
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
      
      internal function frame12() : *
      {
         stop();
      }
      
      internal function frame35() : *
      {
         stop();
      }
   }
}

