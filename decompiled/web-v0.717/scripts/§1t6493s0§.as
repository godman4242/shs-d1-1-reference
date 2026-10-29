package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1176")]
   public class §1t6493s0§ extends MovieClip
   {
      
      public var button:§1t5003s0§;
      
      public var msgText:TextField;
      
      public var titleText:TextField;
      
      public function §1t6493s0§()
      {
         super();
         §1t1521s0§.§1t9290s0§(this.titleText,true);
         §1t1521s0§.§1t9290s0§(this.msgText);
         this.titleText.text = §1t1521s0§.getString(182);
      }
      
      public function show(param1:String, param2:String) : void
      {
         if(param1 == "")
         {
            return;
         }
         this.msgText.text = param1;
         this.button.§1t5769s0§(param2);
         this.button.addEventListener(MouseEvent.CLICK,this.§1t5484s0§);
         this.button.§1t5004s0§();
         if(!§1t1540s0§.§1t10014s0§() && !§1t1540s0§.§1t10012s0§())
         {
            §1t1541s0§.§1t10099s0§();
         }
         this.visible = true;
      }
      
      public function §1t5482s0§(param1:String) : *
      {
         this.msgText.htmlText = param1;
      }
      
      public function §1t5484s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         this.button.removeEventListener(MouseEvent.CLICK,this.§1t5484s0§);
         this.button.removeEventListeners();
         this.visible = false;
         if(!§1t406s0§.instance.§1t6488s0§.visible)
         {
            §1t406s0§.instance.§1t6488s0§.show();
         }
      }
   }
}

