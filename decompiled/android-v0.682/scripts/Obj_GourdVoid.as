package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol2408")]
   public class Obj_GourdVoid extends StageObject
   {
      
      public function Obj_GourdVoid(props:String)
      {
         super();
         if(props != "")
         {
            gotoAndStop(int(props));
         }
      }
   }
}

