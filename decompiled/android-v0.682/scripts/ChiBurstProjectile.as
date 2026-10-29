package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1800")]
   public class ChiBurstProjectile extends Projectile
   {
      
      public function ChiBurstProjectile()
      {
         super();
         addFrameScript(11,this.frame12);
      }
      
      override public function init(velX:int, velY:int, damage:int, skilllevel:int, owner:NPC = null) : *
      {
         if(skilllevel == 1)
         {
            damage = 50;
         }
         else if(skilllevel == 2)
         {
            damage = 70;
         }
         else if(skilllevel == 3)
         {
            damage = 100;
         }
         else if(skilllevel == -1)
         {
            damage = 1;
         }
         visible = true;
         flying = true;
         if(velX < 0)
         {
            scaleX = -scaleX;
         }
         this.owner = owner;
         damageObj = new Damage(damage,0,Damage.LAUNCH_FLYAWAY);
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
      
      internal function frame12() : *
      {
         this.removeProjectile();
      }
   }
}

