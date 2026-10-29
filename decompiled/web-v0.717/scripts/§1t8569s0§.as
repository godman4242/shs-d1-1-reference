package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3275")]
   public class §1t8569s0§ extends §1t399s0§
   {
      
      public function §1t8569s0§(param1:String, param2:String = "")
      {
         super();
         this.props = param1;
         objectName = param2;
         visible = false;
      }
      
      override public function §1t8518s0§(param1:MovieClip) : Boolean
      {
         return abs(x - param1.x) < 50;
      }
      
      override public function interact() : *
      {
         if(§1t8502s0§ != null)
         {
            if(props == "")
            {
               §1t406s0§.instance.§1t6488s0§.§1t5826s0§();
            }
            else if(props == "2")
            {
               §1t406s0§.instance.§1t6488s0§.§1t6203s0§();
            }
            §1t6427s0§.§1t12475s0§(§1t8502s0§.id,§1t8502s0§.§1t1103s0§);
         }
         §1t1525s0§.§1t9927s0§(objectName);
      }
      
      override public function showInteractButton(param1:Boolean) : *
      {
         if(param1 && !shown && §1t8501s0§)
         {
            shown = true;
            if(§1t8502s0§ != null)
            {
               this.interact();
            }
         }
         else if(!param1 && shown)
         {
            shown = false;
         }
      }
      
      override public function §1t8512s0§() : *
      {
         return false;
      }
      
      override public function §1t6733s0§() : String
      {
         return "";
      }
   }
}

