package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol2294")]
   public class Obj_Stairs extends StageObject
   {
      
      public function Obj_Stairs(props:String)
      {
         super();
         var strArray:Array = props.split(",");
         if(strArray.length >= 1 && strArray[0] != "")
         {
            gotoAndStop(int(strArray[0]));
         }
         if(strArray.length >= 2)
         {
            scaleX = int(strArray[1]);
         }
      }
   }
}

