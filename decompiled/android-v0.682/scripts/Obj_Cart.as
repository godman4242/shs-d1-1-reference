package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol2541")]
   public class Obj_Cart extends StageObject
   {
      
      public function Obj_Cart(props:String)
      {
         super();
         addFrameScript(0,this.frame1);
         if(props != "")
         {
            gotoAndStop(int(props));
         }
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

