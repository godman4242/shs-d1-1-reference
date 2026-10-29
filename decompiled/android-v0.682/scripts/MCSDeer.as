package
{
   import flash.display.MovieClip;
   
   public class MCSDeer extends MCSAnimal
   {
      
      public function MCSDeer()
      {
         var mc:MovieClip = null;
         super();
         animalName = "deer";
         for(var i:int = 0; i <= partListLength; i++)
         {
            mc = new MovieClip();
            addChild(mc);
            partList.push(mc);
         }
         healthBar.y = -120;
         displayName.y = -120;
      }
   }
}

