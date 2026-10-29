package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol3139")]
   public class §1t8595s0§ extends §1t399s0§
   {
      
      internal var dest:int;
      
      public function §1t8595s0§(param1:String, param2:String = "")
      {
         super();
         if(param2 == "")
         {
            objectName = "Ninja Trail";
         }
         else
         {
            objectName = param2;
         }
         §1t8503s0§ = §1t407s0§.§1t12439s0§;
         this.dest = parseInt(param1);
         §1t8501s0§ = true;
         buttonMode = §1t8501s0§;
         gotoAndStop(1);
      }
      
      override public function §1t8523s0§() : *
      {
         §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6851s0§(this);
         §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6848s0§(§1t6497s0§.§1t12442s0§);
         gotoAndStop(2);
      }
      
      override public function interact() : *
      {
         §1t1525s0§.§1t9922s0§(this.dest);
      }
      
      override public function §1t6733s0§() : String
      {
         return "Enter ninja trail";
      }
      
      override public function §1t2289s0§(param1:int) : *
      {
         x += param1 / 2;
      }
   }
}

