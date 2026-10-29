package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol3082")]
   public class §1t8480s0§ extends StageObject
   {
      
      public function §1t8480s0§(param1:String)
      {
         super();
         addFrameScript(0,this.frame1);
         if(param1 != "")
         {
            gotoAndStop(int(param1));
         }
         §1t1643s0§.blur(this,8);
      }
      
      override public function §1t2289s0§(param1:int) : *
      {
         x += param1 / 4;
      }
      
      override public function §1t8164s0§() : Boolean
      {
         return true;
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

