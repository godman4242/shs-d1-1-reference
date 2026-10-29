package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol2397")]
   public class Obj_Jizo extends StageObject
   {
      
      public function Obj_Jizo(props:String)
      {
         super();
         scaleX = Math.random() * 0.2 + 0.9;
         scaleY = Math.random() * 0.2 + 0.9;
         rotation = Math.random() * 5 - 10;
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

