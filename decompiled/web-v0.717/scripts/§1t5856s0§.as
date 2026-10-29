package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1199")]
   public class §1t5856s0§ extends MovieClip
   {
      
      public var errortext:TextField;
      
      public var nametext:TextField;
      
      public var okbutton:§1t5003s0§;
      
      public var §1t5021s0§:TextField;
      
      internal var code:int = 0;
      
      public function §1t5856s0§()
      {
         super();
         §1t1521s0§.§1t9290s0§(this.§1t5021s0§);
         §1t1521s0§.§1t9290s0§(this.nametext);
         §1t1521s0§.§1t9290s0§(this.errortext);
         this.okbutton.§1t5769s0§(§1t1521s0§.getString(5));
      }
      
      public function show() : *
      {
         §1t1541s0§.§1t10099s0§();
         this.visible = true;
         this.errortext.visible = false;
         this.§1t5004s0§();
         this.nametext.text = "";
         this.code = Math.random() * 10000 + 10000;
         this.§1t5021s0§.text = "Enter the code: " + this.code;
      }
      
      internal function §1t5004s0§() : *
      {
         this.okbutton.addEventListener(MouseEvent.CLICK,this.§1t5323s0§);
         this.okbutton.§1t5004s0§();
      }
      
      internal function removeEventListeners() : *
      {
         this.okbutton.removeEventListener(MouseEvent.CLICK,this.§1t5323s0§);
         this.okbutton.removeEventListeners();
      }
      
      internal function §1t5323s0§(param1:Event) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         if(this.nametext.text == "")
         {
            return;
         }
         if(this.nametext.text == this.code.toString())
         {
            this.removeEventListeners();
            this.visible = false;
            §1t1541s0§.§1t10045s0§();
            MovieClip(parent).removeChild(this);
         }
         else
         {
            this.errortext.visible = true;
         }
      }
   }
}

