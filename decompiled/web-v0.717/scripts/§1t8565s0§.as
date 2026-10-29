package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3277")]
   public class §1t8565s0§ extends §1t399s0§
   {
      
      public function §1t8565s0§(param1:String, param2:String = "")
      {
         super();
         if(param1 == "")
         {
            param1 = "0";
         }
         blocking = param1 != "1";
         this.props = param1;
         objectName = param2;
         visible = false;
      }
      
      override public function §1t8518s0§(param1:MovieClip) : Boolean
      {
         return abs(x - param1.x) < 50;
      }
      
      override public function showInteractButton(param1:Boolean) : *
      {
         this.interact();
      }
      
      override public function §1t8522s0§() : Boolean
      {
         return true;
      }
      
      override public function §1t8512s0§() : *
      {
         return false;
      }
      
      override public function interact() : *
      {
         if(§1t8502s0§ != null)
         {
            if(props == "")
            {
               §1t406s0§.instance.§1t6488s0§.§1t5826s0§();
            }
            §1t6427s0§.§1t12475s0§(§1t8502s0§.id,§1t8502s0§.§1t1103s0§);
         }
      }
   }
}

