package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol2430")]
   public class Obj_DungeonEntrance extends StageObject
   {
      
      public function Obj_DungeonEntrance(objProperty:String)
      {
         super();
         addFrameScript(0,this.frame1);
         var strArray:Array = objProperty.split(",");
         if(strArray.length >= 1)
         {
            scaleX = strArray[0];
         }
         if(strArray.length >= 2)
         {
            gotoAndStop(int(strArray[1]));
         }
         else
         {
            gotoAndStop(1);
         }
      }
      
      internal function frame1() : *
      {
         stop();
         stop();
      }
   }
}

