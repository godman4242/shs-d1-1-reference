package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2460")]
   public class Obj_DoorDungeon extends StageObject
   {
      
      public var base:MovieClip;
      
      public function Obj_DoorDungeon(props:String)
      {
         super();
         var strArray:Array = props.split(",");
         if(props == "")
         {
            gotoAndStop(1);
         }
         else if(int(strArray[0]) == GameStage.BG_MINE)
         {
            gotoAndStop(11);
         }
         else if(int(strArray[0]) == GameStage.BG_CAVE)
         {
            gotoAndStop(4);
         }
         else
         {
            gotoAndStop(1);
         }
         if(strArray.length == 2 && currentFrame == 1)
         {
            ColorCode.setMCTint(this.base,0.1,int(strArray[1]));
         }
         ColorCode.blur(this,2);
      }
   }
}

