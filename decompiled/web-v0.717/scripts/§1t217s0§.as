package
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   
   public class §1t217s0§ extends §1t153s0§
   {
      
      public function §1t217s0§(param1:BitmapData)
      {
         super();
         bitmap = new Bitmap(param1);
         bitmap.visible = false;
      }
      
      override public function destroy() : *
      {
         if(bitmap.visible)
         {
            bitmap.visible = false;
            §1t2731s0§.returnBloodParticle(this);
            MovieClip(bitmap.parent).removeChild(bitmap);
         }
      }
   }
}

