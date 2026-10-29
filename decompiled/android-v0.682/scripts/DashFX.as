package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1847")]
   public class DashFX extends Projectile
   {
      
      public function DashFX()
      {
         super();
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
   }
}

