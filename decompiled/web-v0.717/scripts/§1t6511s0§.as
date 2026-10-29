package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1154")]
   public class §1t6511s0§ extends MovieClip
   {
      
      public var shade:§1t6775s0§;
      
      public var textBodyText:TextField;
      
      public function §1t6511s0§()
      {
         super();
         this.visible = false;
         §1t1521s0§.§1t9290s0§(this.textBodyText);
         this.textBodyText.condenseWhite = true;
         this.shade.visible = false;
      }
      
      public function show(param1:String) : *
      {
         this.textBodyText.htmlText = param1;
         this.addEventListener(MouseEvent.CLICK,this.§1t6777s0§);
         this.hitArea = this.shade;
         this.visible = true;
      }
      
      public function §1t6777s0§(param1:MouseEvent) : *
      {
         this.removeEventListener(MouseEvent.CLICK,this.§1t6777s0§);
         this.visible = false;
         §1t126s0§.§1t9190s0§().§1t813s0§();
      }
   }
}

