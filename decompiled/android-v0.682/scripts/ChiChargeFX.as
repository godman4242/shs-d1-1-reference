package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1786")]
   public class ChiChargeFX extends Projectile
   {
      
      public function ChiChargeFX()
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

