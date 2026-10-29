package
{
   import flash.display.MovieClip;
   
   public class MCSBoar extends MCSAnimal
   {
      
      public function MCSBoar()
      {
         var mc:MovieClip = null;
         super();
         animalName = "boar";
         for(var i:int = 0; i <= partListLength; i++)
         {
            mc = new MovieClip();
            addChild(mc);
            partList.push(mc);
         }
         healthBar.y = -70;
         displayName.y = -70;
      }
   }
}

