package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2119")]
   public class §1t7394s0§ extends MovieClip
   {
      
      public var namefield:TextField;
      
      public var nametext:TextField;
      
      public var okbutton:§1t5003s0§;
      
      public var §1t5021s0§:TextField;
      
      internal var §1t6015s0§:§1t29s0§;
      
      public function §1t7394s0§()
      {
         super();
         this.namefield.maxChars = 20;
      }
      
      public function init() : *
      {
         this.§1t5021s0§.text = §1t1521s0§.getString(22099);
         this.okbutton.§1t5769s0§(§1t1521s0§.getString(5));
      }
      
      internal function show(param1:§1t29s0§) : *
      {
         this.§1t6015s0§ = param1;
         visible = true;
         this.§1t5004s0§();
         if(param1.§1t7321s0§())
         {
            this.namefield.visible = false;
            this.nametext.text = param1.charname;
         }
         else
         {
            this.namefield.visible = true;
            this.namefield.text = param1.charname;
         }
      }
      
      internal function hide() : *
      {
         visible = false;
         this.removeEventListeners();
      }
      
      internal function §1t5004s0§() : *
      {
         this.okbutton.addEventListener(MouseEvent.CLICK,this.§1t7395s0§);
      }
      
      internal function removeEventListeners() : *
      {
         this.okbutton.removeEventListener(MouseEvent.CLICK,this.§1t7395s0§);
      }
      
      internal function §1t7395s0§(param1:MouseEvent) : *
      {
         if(this.namefield.text == "")
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         var _loc2_:RegExp = /[\r]*/gim;
         this.namefield.text = this.namefield.text.replace(_loc2_,"");
         var _loc3_:RegExp = /[^a-zA-Z0-9\s-]/;
         if(_loc3_.test(this.namefield.text))
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         if(§1t406s0§.instance.§1t6504s0§.§1t5322s0§(this.namefield.text) != this.namefield.text)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         this.hide();
         if(!this.§1t6015s0§.§1t7321s0§() && this.§1t6015s0§.charname != this.namefield.text)
         {
            this.§1t6015s0§.charname = this.namefield.text;
            this.§1t6015s0§.§1t927s0§ = true;
            §1t114s0§.instance.§1t1530s0§(§1t114s0§.§1t9962s0§);
            §1t114s0§.instance.§1t1539s0§();
         }
         §1t412s0§.instance.§1t7551s0§.show(this.§1t6015s0§);
         this.§1t6015s0§ = null;
      }
   }
}

