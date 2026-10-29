package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol765")]
   public class §1t5367s0§ extends MovieClip
   {
      
      public var §1t5001s0§:TextField;
      
      public var noButton:§1t5337s0§;
      
      public var yesButton:§1t5368s0§;
      
      internal var §1t5369s0§:Function = null;
      
      public function §1t5367s0§()
      {
         super();
         this.yesButton.§1t5769s0§(§1t1521s0§.getString(1));
         this.noButton.§1t5769s0§(§1t1521s0§.getString(0));
         §1t1521s0§.§1t9290s0§(this.§1t5001s0§);
      }
      
      public function §1t5004s0§() : void
      {
         this.yesButton.addEventListener(MouseEvent.CLICK,this.§1t5370s0§);
         this.yesButton.§1t5004s0§();
         this.noButton.addEventListener(MouseEvent.CLICK,this.§1t5371s0§);
         this.noButton.§1t5004s0§();
      }
      
      public function removeEventListeners() : void
      {
         this.yesButton.removeEventListener(MouseEvent.CLICK,this.§1t5370s0§);
         this.yesButton.removeEventListeners();
         this.noButton.removeEventListener(MouseEvent.CLICK,this.§1t5371s0§);
         this.noButton.removeEventListeners();
      }
      
      public function show(param1:String, param2:Function) : *
      {
         this.§1t5004s0§();
         this.§1t5001s0§.htmlText = param1;
         this.visible = true;
         this.§1t5369s0§ = param2;
      }
      
      internal function §1t5370s0§(param1:MouseEvent) : *
      {
         if(§1t88s0§.instance != null)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_click");
         }
         visible = false;
         this.removeEventListeners();
         this.§1t5369s0§.call();
      }
      
      internal function §1t5371s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_back");
         this.removeEventListeners();
         this.visible = false;
      }
   }
}

