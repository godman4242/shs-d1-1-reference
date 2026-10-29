package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol2341")]
   public class Obj_Platform extends StageObject
   {
      
      public function Obj_Platform(props:String)
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

