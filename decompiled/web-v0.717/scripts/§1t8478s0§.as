package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol3097")]
   public class §1t8478s0§ extends StageObject
   {
      
      public function §1t8478s0§(param1:String)
      {
         super();
         scaleX = Math.random() * 0.2 + 0.9;
         scaleY = Math.random() * 0.2 + 0.9;
         rotation = Math.random() * 5 - 10;
         if(param1 == "")
         {
            gotoAndStop(1);
         }
         else
         {
            gotoAndStop(int(param1));
         }
      }
   }
}

