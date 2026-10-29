package
{
   public class §1t397s0§ extends §1t399s0§
   {
      
      internal var §1t5518s0§:String = "";
      
      public function §1t397s0§()
      {
         super();
      }
      
      public function getSequence() : String
      {
         return this.§1t5518s0§;
      }
      
      public function validSequence() : *
      {
      }
      
      public function invalidSequence() : *
      {
      }
      
      public function nodeTaught() : int
      {
         return -1;
      }
      
      public function §1t6246s0§(param1:String) : *
      {
      }
      
      override public function showInteractButton(param1:Boolean) : *
      {
         if(param1 && !shown && §1t8501s0§)
         {
            if(§1t8502s0§ != null)
            {
               §1t406s0§.instance.§1t6574s0§().§1t6390s0§(this,§1t8502s0§.title,§1t8502s0§.§1t1105s0§,§1t8502s0§.type,§1t8502s0§.id,§1t8502s0§.§1t1103s0§,§1t8502s0§.ap,true);
            }
            else
            {
               §1t406s0§.instance.§1t6574s0§().§1t6388s0§(this,§1t8503s0§);
            }
            shown = true;
         }
         else if(!param1 && shown)
         {
            shown = false;
         }
      }
   }
}

