package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1338")]
   public class §1t6425s0§ extends MovieClip
   {
      
      public var gobackbutton:§1t5334s0§;
      
      public var prompt:TextField;
      
      public var submitbutton:§1t5337s0§;
      
      public function §1t6425s0§()
      {
         super();
         this.gobackbutton.§1t5769s0§(§1t1521s0§.getString(0));
         this.submitbutton.§1t5769s0§(§1t1521s0§.getString(1));
         §1t1521s0§.§1t9290s0§(this.prompt);
         this.prompt.text = §1t1521s0§.getString(73);
      }
      
      public function §1t5773s0§() : *
      {
         this.gobackbutton.addEventListener(MouseEvent.CLICK,this.§1t5341s0§);
         this.submitbutton.addEventListener(MouseEvent.CLICK,this.submit);
         this.gobackbutton.§1t5004s0§();
         this.submitbutton.§1t5004s0§();
      }
      
      internal function §1t5340s0§() : *
      {
         this.gobackbutton.removeEventListener(MouseEvent.CLICK,this.§1t5341s0§);
         this.submitbutton.removeEventListener(MouseEvent.CLICK,this.submit);
         this.gobackbutton.removeEventListeners();
         this.submitbutton.removeEventListeners();
      }
      
      internal function §1t5341s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_back");
         this.§1t5340s0§();
         visible = false;
      }
      
      internal function submit(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         this.§1t5340s0§();
         §1t3317s0§.instance.§1t1946s0§();
         §1t406s0§.instance.§1t6649s0§();
         if(§1t1540s0§.§1t10014s0§())
         {
            §1t1540s0§.§1t10038s0§();
         }
         else
         {
            §1t251s0§.instance.§1t3521s0§();
            §1t1540s0§.§1t10039s0§();
         }
         if(§1t1523s0§.§1t9503s0§)
         {
            §1t251s0§.instance.§1t3589s0§();
            §1t251s0§.instance.§1t3620s0§();
         }
      }
   }
}

