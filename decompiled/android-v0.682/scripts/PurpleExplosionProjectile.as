package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1694")]
   public class PurpleExplosionProjectile extends Projectile
   {
      
      public function PurpleExplosionProjectile()
      {
         super();
         addFrameScript(60,this.frame61);
      }
      
      override public function init(velX:int, velY:int, damage:int, skilllevel:int, owner:NPC = null) : *
      {
      }
      
      override public function update() : *
      {
      }
      
      override internal function removeProjectile() : *
      {
         if(parent != null)
         {
            MovieClip(parent).removeChild(this);
         }
      }
      
      internal function frame61() : *
      {
         this.removeProjectile();
      }
   }
}

