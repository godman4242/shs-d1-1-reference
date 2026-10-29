package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3276")]
   public class §1t8566s0§ extends §1t399s0§
   {
      
      internal var shakeDuration:int = 24;
      
      internal var shakeAmt:int = 30;
      
      public function §1t8566s0§(param1:String, param2:String = "")
      {
         super();
         var _loc3_:Array = param1.split(",");
         if(_loc3_.length > 0)
         {
            this.shakeDuration = _loc3_[0];
         }
         if(_loc3_.length > 1)
         {
            this.shakeAmt = _loc3_[1];
         }
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
            §1t6427s0§.§1t12475s0§(§1t8502s0§.id,§1t8502s0§.§1t1103s0§);
         }
         §1t1525s0§.§1t9960s0§(this.shakeDuration,this.shakeAmt);
         §1t1525s0§.§1t9927s0§(objectName);
      }
      
      override public function showInteractButton(param1:Boolean) : *
      {
         if(param1 && !shown && §1t8501s0§)
         {
            shown = true;
            this.interact();
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

