package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1581")]
   public class YinYangDownFX extends Projectile
   {
      
      public function YinYangDownFX()
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
      }
      
      override public function update() : *
      {
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

