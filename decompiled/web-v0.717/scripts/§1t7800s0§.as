package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol636")]
   public class §1t7800s0§ extends MovieClip
   {
      
      public var §1t7463s0§:TextField;
      
      public var messageboardlabel:TextField;
      
      public var §1t5019s0§:§1t4912s0§;
      
      public var §1t5020s0§:§1t4912s0§;
      
      public function §1t7800s0§()
      {
         super();
         §1t1521s0§.§1t9290s0§(this.messageboardlabel,true);
         §1t1521s0§.§1t9290s0§(this.§1t7463s0§);
      }
      
      public function §1t7895s0§(param1:String) : *
      {
         this.§1t7463s0§.text = param1;
         this.§1t5020s0§.visible = this.§1t7463s0§.numLines > 15;
         this.§1t5019s0§.visible = this.§1t7463s0§.numLines > 15;
      }
      
      public function §1t6784s0§(param1:String) : *
      {
         this.messageboardlabel.text = param1;
      }
      
      internal function §1t5004s0§() : *
      {
         this.§1t5020s0§.addEventListener(MouseEvent.CLICK,this.§1t5251s0§);
         this.§1t5019s0§.addEventListener(MouseEvent.CLICK,this.§1t5252s0§);
      }
      
      internal function removeEventListeners() : *
      {
         this.§1t5020s0§.removeEventListener(MouseEvent.CLICK,this.§1t5251s0§);
         this.§1t5019s0§.removeEventListener(MouseEvent.CLICK,this.§1t5252s0§);
      }
      
      internal function §1t5251s0§(param1:MouseEvent) : *
      {
         param1.stopPropagation();
         --this.§1t7463s0§.scrollV;
      }
      
      internal function §1t5252s0§(param1:MouseEvent) : *
      {
         param1.stopPropagation();
         ++this.§1t7463s0§.scrollV;
      }
   }
}

