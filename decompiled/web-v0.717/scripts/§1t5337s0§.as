package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol764")]
   public class §1t5337s0§ extends MovieClip
   {
      
      public var bg:SimpleButton;
      
      public var §1t5829s0§:TextField;
      
      public function §1t5337s0§()
      {
         super();
         this.§1t5829s0§.mouseEnabled = false;
         §1t1521s0§.§1t9290s0§(this.§1t5829s0§,true);
         if(§1t1523s0§.§1t9528s0§)
         {
            this.bg.hitTestState.height = 45;
            this.bg.hitTestState.y = -10;
         }
      }
      
      public function §1t5769s0§(param1:String) : *
      {
         if(this.§1t5829s0§.text != param1)
         {
            this.§1t5829s0§.text = param1;
         }
      }
      
      public function §1t5004s0§() : void
      {
      }
      
      public function removeEventListeners() : void
      {
      }
   }
}

