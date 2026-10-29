package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3309")]
   public class §1t6468s0§ extends MovieClip
   {
      
      public var button:SimpleButton;
      
      public var §1t5051s0§:§1t4912s0§;
      
      public var §1t6878s0§:TextField;
      
      public var itemImage:§1t394s0§;
      
      public var §1t6879s0§:TextField;
      
      public var §1t472s0§:TextField;
      
      public function §1t6468s0§()
      {
         super();
         §1t1521s0§.§1t9290s0§(this.§1t472s0§);
         §1t1521s0§.§1t9290s0§(this.§1t6878s0§);
         this.itemImage.§1t6874s0§();
      }
      
      public function show(param1:§1t17s0§) : void
      {
         this.button.addEventListener(MouseEvent.CLICK,this.§1t5484s0§);
         this.§1t5051s0§.addEventListener(MouseEvent.CLICK,this.§1t5127s0§);
         this.visible = true;
         this.itemImage.§1t6872s0§(param1.§1t483s0§(),param1.§1t508s0§(),param1.§1t527s0§(),param1.§1t528s0§());
         this.itemImage.§1t6870s0§("");
         this.§1t472s0§.htmlText = param1.§1t510s0§();
         if(param1.§1t514s0§() == "")
         {
            this.§1t6878s0§.htmlText = param1.§1t518s0§();
         }
         else
         {
            this.§1t6878s0§.htmlText = param1.§1t514s0§() + "\n\n" + param1.§1t518s0§();
         }
         if(param1.getLevel() > 0)
         {
            this.§1t6879s0§.text = §1t1521s0§.getString(47,[param1.getLevel()]);
            this.§1t6878s0§.y = 190;
         }
         else
         {
            this.§1t6879s0§.text = "";
            this.§1t6878s0§.y = 180;
         }
         this.§1t5051s0§.visible = this.§1t6878s0§.numLines > 9;
      }
      
      public function §1t5484s0§(param1:MouseEvent) : void
      {
         if(param1 != null)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_back");
         }
         this.button.removeEventListener(MouseEvent.CLICK,this.§1t5484s0§);
         this.§1t5051s0§.removeEventListener(MouseEvent.CLICK,this.§1t5127s0§);
         this.visible = false;
      }
      
      internal function §1t5127s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         if(this.§1t6878s0§.scrollV == this.§1t6878s0§.numLines - 9)
         {
            this.§1t6878s0§.scrollV = 0;
         }
         else
         {
            ++this.§1t6878s0§.scrollV;
         }
      }
   }
}

