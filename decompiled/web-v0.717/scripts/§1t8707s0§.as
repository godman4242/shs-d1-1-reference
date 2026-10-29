package
{
   import flash.display.MovieClip;
   
   public class §1t8707s0§ extends §1t8630s0§
   {
      
      public function §1t8707s0§(param1:String, param2:String = "")
      {
         super(param1,param2);
         blocking = true;
      }
      
      override public function §1t8518s0§(param1:MovieClip) : Boolean
      {
         return abs(x - param1.x) < 100;
      }
      
      override public function showInteractButton(param1:Boolean) : *
      {
         if(param1 && !shown && §1t8501s0§)
         {
            if(§1t8502s0§ != null)
            {
               §1t406s0§.instance.§1t6574s0§().§1t6390s0§(this,§1t8502s0§.title,§1t8502s0§.§1t1105s0§,§1t8502s0§.type,§1t8502s0§.id,§1t8502s0§.§1t1103s0§,§1t8502s0§.ap);
            }
            else
            {
               §1t406s0§.instance.§1t6574s0§().§1t6388s0§(this,§1t407s0§.§1t12445s0§);
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

