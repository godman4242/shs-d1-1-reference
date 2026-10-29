package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol2507")]
   public class Obj_DecorDungeon extends StageObject
   {
      
      public function Obj_DecorDungeon(props:String)
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
         ColorCode.blur(this,2);
      }
   }
}

