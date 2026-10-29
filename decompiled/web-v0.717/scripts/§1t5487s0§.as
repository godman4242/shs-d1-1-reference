package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1210")]
   public class §1t5487s0§ extends MovieClip
   {
      
      public var button:§1t5003s0§;
      
      public var msgText:TextField;
      
      public function §1t5487s0§()
      {
         super();
         §1t1521s0§.§1t9290s0§(this.msgText);
      }
      
      public function show(param1:String, param2:String, param3:Boolean, param4:int = 0) : void
      {
         if(param4 == 0)
         {
            gotoAndStop(1);
         }
         else
         {
            gotoAndStop(param4);
         }
         this.msgText.text = param1;
         this.button.§1t5769s0§(param2);
         this.button.addEventListener(MouseEvent.CLICK,this.§1t5484s0§);
         this.button.§1t5004s0§();
         if(!§1t1540s0§.§1t10014s0§() && !§1t1540s0§.§1t10012s0§())
         {
            §1t1541s0§.§1t10099s0§();
         }
         this.button.visible = param3;
         if(param4 == 0 && this.msgText.numLines > 5)
         {
            gotoAndStop(2);
            this.msgText.text = param1;
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
         if(§1t1540s0§.§1t10047s0§())
         {
            §1t1541s0§.§1t10097s0§();
         }
         else if(!§1t1540s0§.§1t10014s0§() && !§1t1540s0§.§1t10012s0§() && !§1t406s0§.instance.§1t6466s0§.visible && (§1t126s0§.instance == null || !§1t126s0§.instance.§1t1700s0§()))
         {
            §1t1541s0§.§1t10045s0§();
         }
         this.visible = false;
      }
   }
}

