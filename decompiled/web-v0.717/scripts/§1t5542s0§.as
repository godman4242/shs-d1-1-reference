package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol922")]
   public class §1t5542s0§ extends MovieClip
   {
      
      public var indicator1:MovieClip;
      
      public var indicator2:MovieClip;
      
      public var namefield:TextField;
      
      public var rankfield:TextField;
      
      public var §1t5547s0§:TextField;
      
      public function §1t5542s0§()
      {
         super();
      }
      
      public function §1t5548s0§(param1:String, param2:int, param3:int, param4:int, param5:int, param6:int) : *
      {
         §1t1521s0§.§1t9290s0§(this.namefield);
         §1t1521s0§.§1t9290s0§(this.§1t5547s0§);
         this.§1t5547s0§.text = String(param3) + "/" + String(param4) + "/" + String(param5);
         this.namefield.text = param1;
      }
      
      public function §1t5549s0§(param1:int) : *
      {
         §1t1521s0§.§1t9290s0§(this.rankfield);
         this.rankfield.text = String(param1);
      }
      
      public function §1t5550s0§(param1:Boolean) : *
      {
         this.indicator1.visible = param1;
         this.indicator2.visible = param1;
      }
   }
}

