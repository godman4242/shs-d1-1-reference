package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol2289")]
   public class Obj_Tent extends StageObject
   {
      
      public function Obj_Tent()
      {
         super();
      }
      
      override public function doScroll(dist:int) : *
      {
         x += dist / 2;
      }
   }
}

