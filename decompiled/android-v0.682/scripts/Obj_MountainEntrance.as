package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol1954")]
   public class Obj_MountainEntrance extends StageObject
   {
      
      public function Obj_MountainEntrance(props:String)
      {
         super();
         addFrameScript(0,this.frame1);
         if(props != "")
         {
            gotoAndStop(int(props));
         }
         ColorCode.blur(this,8);
      }
      
      override public function doScroll(dist:int) : *
      {
         x += dist / 4;
      }
      
      override public function forFarCanvas() : Boolean
      {
         return true;
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

