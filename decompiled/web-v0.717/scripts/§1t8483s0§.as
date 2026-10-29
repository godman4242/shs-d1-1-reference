package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol2989")]
   public class §1t8483s0§ extends StageObject
   {
      
      public function §1t8483s0§(param1:String)
      {
         super();
         var _loc2_:Array = param1.split(",");
         if(_loc2_.length >= 1 && _loc2_[0] != "")
         {
            gotoAndStop(int(_loc2_[0]));
         }
         if(_loc2_.length >= 2)
         {
            scaleX = int(_loc2_[1]);
         }
      }
   }
}

