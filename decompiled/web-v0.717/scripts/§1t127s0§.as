package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1263")]
   public class §1t127s0§ extends MovieClip
   {
      
      public var §1t5829s0§:TextField;
      
      internal var §1t6404s0§:§1t405s0§;
      
      public function §1t127s0§(param1:§1t405s0§, param2:int = 0, param3:int = 0)
      {
         super();
         §1t1521s0§.§1t9290s0§(this.§1t5829s0§);
         this.§1t5829s0§.text = param1.text;
         this.§1t6404s0§ = param1;
         this.§1t5829s0§.mouseEnabled = false;
         x = param2;
         y = param3;
      }
      
      public function §1t6405s0§() : int
      {
         return this.§1t6404s0§.goto;
      }
      
      public function §1t6406s0§() : String
      {
         return this.§1t6404s0§.gotolabel;
      }
      
      public function §1t795s0§() : *
      {
         this.§1t6404s0§.§1t795s0§();
      }
   }
}

