package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol3272")]
   public class §1t8571s0§ extends §1t399s0§
   {
      
      public function §1t8571s0§(param1:String, param2:String = "")
      {
         super();
         if(param2 == "")
         {
            objectName = "Bell";
         }
         else
         {
            objectName = param2;
         }
         §1t8503s0§ = §1t407s0§.§1t12444s0§;
      }
      
      override public function §1t8523s0§() : *
      {
         this.interact();
      }
      
      override public function showInteractButton(param1:Boolean) : *
      {
         if(param1 && !shown && §1t8501s0§)
         {
            §1t406s0§.instance.§1t6574s0§().§1t6388s0§(this,§1t8503s0§);
            shown = true;
         }
         else if(!param1 && shown)
         {
            shown = false;
         }
      }
      
      override public function interact() : *
      {
         var _loc1_:§1t85s0§ = null;
         if(§1t8502s0§ != null)
         {
            _loc1_ = §1t1524s0§.§1t9872s0§(§1t8502s0§.id,§1t8502s0§.§1t1103s0§);
            §1t6427s0§.§1t12475s0§(§1t8502s0§.id,§1t8502s0§.§1t1103s0§);
         }
         else
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(724),§1t1521s0§.getString(5));
         }
      }
      
      override public function §1t6733s0§() : String
      {
         return §1t1521s0§.getString(725);
      }
      
      override public function §1t8517s0§() : int
      {
         return 1;
      }
   }
}

