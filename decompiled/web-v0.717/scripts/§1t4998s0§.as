package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1064")]
   public class §1t4998s0§ extends MovieClip
   {
      
      public var §1t4999s0§:§1t5000s0§;
      
      public var §1t5001s0§:TextField;
      
      public var §1t5002s0§:§1t5003s0§;
      
      public function §1t4998s0§()
      {
         super();
         this.§1t4999s0§.§1t5769s0§(§1t1521s0§.getString(40));
         this.§1t5002s0§.§1t5769s0§(§1t1521s0§.getString(17));
         §1t1521s0§.§1t9290s0§(this.§1t5001s0§);
      }
      
      public function §1t5004s0§() : void
      {
         this.§1t4999s0§.addEventListener(MouseEvent.CLICK,this.§1t5005s0§);
         this.§1t4999s0§.§1t5004s0§();
         this.§1t5002s0§.addEventListener(MouseEvent.CLICK,this.§1t5006s0§);
         this.§1t5002s0§.§1t5004s0§();
      }
      
      public function removeEventListeners() : void
      {
         this.§1t4999s0§.removeEventListener(MouseEvent.CLICK,this.§1t5005s0§);
         this.§1t4999s0§.removeEventListeners();
         this.§1t5002s0§.removeEventListener(MouseEvent.CLICK,this.§1t5006s0§);
         this.§1t5002s0§.removeEventListeners();
      }
      
      public function §1t5005s0§(param1:MouseEvent) : void
      {
         MovieClip(parent).§1t6821s0§();
         this.removeEventListeners();
         this.visible = false;
         §1t88s0§.instance.§1t1516s0§("Snd_error");
      }
      
      public function §1t5006s0§(param1:MouseEvent) : void
      {
         this.removeEventListeners();
         this.visible = false;
         §1t88s0§.instance.§1t1516s0§("Snd_back");
      }
      
      public function show(param1:String) : *
      {
         this.§1t5004s0§();
         this.§1t5001s0§.text = §1t1521s0§.getString(3,[param1]);
         this.visible = true;
      }
   }
}

