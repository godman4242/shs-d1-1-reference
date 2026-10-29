package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol3132")]
   public class §1t8476s0§ extends StageObject
   {
      
      public function §1t8476s0§(param1:String)
      {
         super();
         addFrameScript(0,this.frame1);
         var _loc2_:Array = param1.split(",");
         if(_loc2_.length >= 1)
         {
            scaleX = _loc2_[0];
         }
         if(_loc2_.length >= 2)
         {
            gotoAndStop(int(_loc2_[1]));
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

