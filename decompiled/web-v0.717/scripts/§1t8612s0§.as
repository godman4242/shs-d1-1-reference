package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol3029")]
   public class §1t8612s0§ extends §1t399s0§
   {
      
      public function §1t8612s0§(param1:String, param2:String = "")
      {
         super();
         addFrameScript(0,this.frame1);
         if(param1 != "")
         {
            gotoAndStop(int(param1));
         }
         if(param2 == "")
         {
            objectName = "RitualSpike";
         }
         else
         {
            objectName = param2;
         }
      }
      
      override public function §1t8161s0§() : Boolean
      {
         return false;
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

