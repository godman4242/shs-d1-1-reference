package
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   
   public class BloodParticle extends Particle
   {
      
      public function BloodParticle(bloodBitmapData:BitmapData)
      {
         super();
         bitmap = new Bitmap(bloodBitmapData);
         bitmap.visible = false;
      }
      
      override public function destroy() : *
      {
         if(bitmap.visible)
         {
            bitmap.visible = false;
            BloodParticlePool.returnBloodParticle(this);
            MovieClip(bitmap.parent).removeChild(bitmap);
         }
      }
   }
}

