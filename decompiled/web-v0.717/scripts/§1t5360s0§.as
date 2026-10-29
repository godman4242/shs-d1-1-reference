package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1028")]
   public class §1t5360s0§ extends MovieClip
   {
      
      public var §1t5001s0§:TextField;
      
      public var noButton:§1t5337s0§;
      
      public var yesButton:§1t5334s0§;
      
      public function §1t5360s0§()
      {
         super();
         this.yesButton.§1t5769s0§(§1t1521s0§.getString(1));
         this.noButton.§1t5769s0§(§1t1521s0§.getString(0));
         §1t1521s0§.§1t9290s0§(this.§1t5001s0§);
      }
      
      public function §1t5004s0§() : void
      {
         this.yesButton.addEventListener(MouseEvent.CLICK,this.§1t5363s0§);
         this.yesButton.§1t5004s0§();
         this.noButton.addEventListener(MouseEvent.CLICK,this.§1t5006s0§);
         this.noButton.§1t5004s0§();
      }
      
      public function removeEventListeners() : void
      {
         this.yesButton.removeEventListener(MouseEvent.CLICK,this.§1t5363s0§);
         this.yesButton.removeEventListeners();
         this.noButton.removeEventListener(MouseEvent.CLICK,this.§1t5006s0§);
         this.noButton.removeEventListeners();
      }
      
      public function §1t5363s0§(param1:MouseEvent) : void
      {
         §1t406s0§.instance.§1t6518s0§.loading.visible = true;
         §1t1523s0§.§1t9615s0§(MovieClip(parent).§1t6291s0§.§1t6869s0§(),MovieClip(parent).§1t5125s0§,MovieClip(parent).§1t5126s0§);
         this.removeEventListeners();
         this.visible = false;
      }
      
      public function §1t5006s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_back");
         this.removeEventListeners();
         this.visible = false;
      }
      
      public function show(param1:String) : *
      {
         this.§1t5004s0§();
         this.§1t5001s0§.htmlText = §1t1521s0§.getString(83) + " " + param1 + "?";
         this.visible = true;
      }
   }
}

