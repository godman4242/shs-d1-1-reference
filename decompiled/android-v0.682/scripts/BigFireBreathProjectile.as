package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1929")]
   public class BigFireBreathProjectile extends Projectile
   {
      
      public function BigFireBreathProjectile()
      {
         super();
         addFrameScript(25,this.frame26);
      }
      
      override public function init(velX:int, velY:int, damage:int, skilllevel:int, owner:NPC = null) : *
      {
         visible = true;
         if(velX < 0)
         {
            scaleX = -scaleX;
         }
         this.owner = owner;
         damageObj = new Damage(0,0,Damage.LAUNCH_KNOCKDOWN,-1,damage * 1.5);
      }
      
      override public function update() : *
      {
         if(visible)
         {
            if(isFriendly())
            {
               NPCManager.checkHitObject(this,damageObj,600);
            }
            else
            {
               NPCManager.checkPlayerHitObject(this,damageObj,600);
            }
         }
      }
      
      override internal function removeProjectile() : *
      {
         stop();
         visible = false;
         MovieClip(parent).removeChild(this);
         ProjectileManager.unregister(this);
      }
      
      internal function frame26() : *
      {
         stop();
         this.removeProjectile();
      }
   }
}

