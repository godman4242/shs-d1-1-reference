package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol2298")]
   public class Obj_ShopStand extends StageObject
   {
      
      public function Obj_ShopStand(props:String)
      {
         super();
         if(props == "")
         {
            gotoAndStop(1);
         }
         else
         {
            gotoAndStop(int(props));
         }
      }
   }
}

