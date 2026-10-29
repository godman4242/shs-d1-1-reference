package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1580")]
   public class YinYangUpFX extends Projectile
   {
      
      public var hitarea:MovieClip;
      
      public function YinYangUpFX()
      {
         super();
         addFrameScript(49,this.frame50);
      }
      
      override public function init(velX:int, velY:int, damage:int, skilllevel:int, owner:NPC = null) : *
      {
         if(skilllevel == 1)
         {
            damage = 50;
         }
         else if(skilllevel == 2)
         {
            damage = 100;
         }
         else if(skilllevel == 3)
         {
            damage = 150;
         }
         visible = true;
         flying = true;
         this.owner = owner;
         damageObj = new Damage(0,0,Damage.STUN);
         damageObj.setStunTime(90,velX);
         this.hitarea.visible = false;
      }
      
      override public function update() : *
      {
         if(flying)
         {
            if(isFriendly())
            {
               if(NPCManager.checkHitObject(this.hitarea,damageObj,200,false,this))
               {
                  flying = false;
               }
            }
            else if(NPCManager.checkPlayerHitObject(this.hitarea,damageObj,200,false,this))
            {
               flying = false;
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
      
      internal function frame50() : *
      {
         this.removeProjectile();
      }
   }
}

