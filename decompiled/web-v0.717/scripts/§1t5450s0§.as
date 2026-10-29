package
{
   import fl.controls.ColorPicker;
   import fl.events.ColorPickerEvent;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1246")]
   public class §1t5450s0§ extends MovieClip
   {
      
      public var §1t5451s0§:TextField;
      
      public var §1t5452s0§:TextField;
      
      public var cancelbutton:§1t5000s0§;
      
      public var §1t5453s0§:TextField;
      
      public var §1t5454s0§:ColorPicker;
      
      public var §1t5456s0§:TextField;
      
      public var §1t5457s0§:TextField;
      
      public var §1t5458s0§:§1t5359s0§;
      
      public var errortext:TextField;
      
      public var loadingtext:TextField;
      
      public var okbutton:§1t5003s0§;
      
      public var §1t5459s0§:TextField;
      
      public var §1t5460s0§:ColorPicker;
      
      public var §1t5461s0§:TextField;
      
      public var §1t5462s0§:SimpleButton;
      
      public var §1t5463s0§:SimpleButton;
      
      public var §1t5021s0§:TextField;
      
      internal var §1t5464s0§:int = 1;
      
      internal var §1t5465s0§:Boolean = false;
      
      public function §1t5450s0§()
      {
         super();
         §1t1521s0§.§1t9290s0§(this.§1t5021s0§);
         §1t1521s0§.§1t9290s0§(this.§1t5456s0§);
         §1t1521s0§.§1t9290s0§(this.§1t5457s0§);
         §1t1521s0§.§1t9290s0§(this.§1t5451s0§);
         §1t1521s0§.§1t9290s0§(this.§1t5452s0§);
         §1t1521s0§.§1t9290s0§(this.errortext);
         §1t1521s0§.§1t9290s0§(this.§1t5461s0§);
         §1t1521s0§.§1t9290s0§(this.§1t5453s0§);
         §1t1521s0§.§1t9290s0§(this.§1t5459s0§);
         §1t1521s0§.§1t9290s0§(this.loadingtext);
         this.§1t5456s0§.text = §1t1521s0§.getString(814);
         this.§1t5461s0§.text = §1t1521s0§.getString(815);
         this.§1t5453s0§.text = §1t1521s0§.getString(816);
         this.§1t5459s0§.text = §1t1521s0§.getString(817);
         this.loadingtext.text = §1t1521s0§.getString(90);
         this.okbutton.§1t5769s0§(§1t1521s0§.getString(5));
         this.cancelbutton.§1t5769s0§(§1t1521s0§.getString(470));
         this.§1t5451s0§.text = §1t1521s0§.getString(818);
         this.__setProp_clancolorpicker_CreateClanDialog_text_0();
         this.__setProp_symbolcolorpicker_CreateClanDialog_text_0();
      }
      
      public function show(param1:Boolean = false) : *
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(!§1t1540s0§.§1t10014s0§() && !§1t1540s0§.§1t10012s0§())
         {
            §1t1541s0§.§1t10099s0§();
         }
         this.visible = true;
         this.okbutton.visible = true;
         this.cancelbutton.visible = true;
         this.errortext.visible = false;
         this.§1t5004s0§();
         this.loadingtext.visible = false;
         this.§1t5457s0§.maxChars = 15;
         if(!param1)
         {
            this.§1t5021s0§.text = §1t1521s0§.getString(4400);
            this.§1t5457s0§.text = "";
            this.§1t5452s0§.text = "";
            this.§1t5464s0§ = int(Math.random() * this.§1t5458s0§.logo.totalFrames) + 1;
            _loc2_ = int(§1t1643s0§.§1t11226s0§(Math.random() * 1000));
            _loc3_ = int(§1t1643s0§.§1t11224s0§(Math.random() * 1000));
            this.§1t5454s0§.selectedColor = _loc2_;
            this.§1t5460s0§.selectedColor = _loc3_;
            §1t1643s0§.§1t11214s0§(this.§1t5458s0§.bg,_loc2_);
            §1t1643s0§.§1t11214s0§(this.§1t5458s0§.logo,_loc3_);
         }
         else
         {
            this.§1t5021s0§.text = §1t1521s0§.getString(4404);
            this.§1t5457s0§.text = §1t1523s0§.§1t9654s0§();
            this.§1t5452s0§.text = §1t1523s0§.§1t9656s0§();
            this.§1t5464s0§ = §1t1523s0§.§1t9658s0§();
            this.§1t5454s0§.selectedColor = §1t1523s0§.§1t9655s0§();
            this.§1t5460s0§.selectedColor = §1t1523s0§.§1t9659s0§();
            §1t1643s0§.§1t11214s0§(this.§1t5458s0§.bg,§1t1523s0§.§1t9655s0§());
            §1t1643s0§.§1t11214s0§(this.§1t5458s0§.logo,§1t1523s0§.§1t9659s0§());
            if(!§1t1523s0§.§1t9653s0§())
            {
               this.§1t5471s0§(4);
               this.okbutton.visible = false;
            }
         }
         this.§1t5465s0§ = param1;
         this.§1t5458s0§.logo.gotoAndStop(this.§1t5464s0§);
      }
      
      internal function §1t5004s0§() : *
      {
         this.okbutton.addEventListener(MouseEvent.CLICK,this.§1t5323s0§);
         this.cancelbutton.addEventListener(MouseEvent.CLICK,this.§1t5330s0§);
         this.okbutton.§1t5004s0§();
         this.cancelbutton.§1t5004s0§();
         this.§1t5463s0§.addEventListener(MouseEvent.CLICK,this.§1t5466s0§);
         this.§1t5462s0§.addEventListener(MouseEvent.CLICK,this.§1t5467s0§);
         this.§1t5454s0§.addEventListener(ColorPickerEvent.CHANGE,this.§1t5468s0§);
         this.§1t5460s0§.addEventListener(ColorPickerEvent.CHANGE,this.§1t5469s0§);
      }
      
      internal function removeEventListeners() : *
      {
         this.okbutton.removeEventListener(MouseEvent.CLICK,this.§1t5323s0§);
         this.cancelbutton.removeEventListener(MouseEvent.CLICK,this.§1t5330s0§);
         this.okbutton.removeEventListeners();
         this.cancelbutton.removeEventListeners();
         this.§1t5463s0§.removeEventListener(MouseEvent.CLICK,this.§1t5466s0§);
         this.§1t5462s0§.removeEventListener(MouseEvent.CLICK,this.§1t5467s0§);
         this.§1t5454s0§.addEventListener(ColorPickerEvent.CHANGE,this.§1t5468s0§);
         this.§1t5460s0§.addEventListener(ColorPickerEvent.CHANGE,this.§1t5469s0§);
      }
      
      internal function §1t5466s0§(param1:Event) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         --this.§1t5464s0§;
         if(this.§1t5464s0§ == 0)
         {
            this.§1t5464s0§ = this.§1t5458s0§.logo.totalFrames;
         }
         this.§1t5458s0§.logo.gotoAndStop(this.§1t5464s0§);
      }
      
      internal function §1t5467s0§(param1:Event) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         ++this.§1t5464s0§;
         if(this.§1t5464s0§ > this.§1t5458s0§.logo.totalFrames)
         {
            this.§1t5464s0§ = 1;
         }
         this.§1t5458s0§.logo.gotoAndStop(this.§1t5464s0§);
      }
      
      internal function §1t5468s0§(param1:Event) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         §1t1643s0§.§1t11214s0§(this.§1t5458s0§.bg,this.§1t5454s0§.selectedColor);
      }
      
      internal function §1t5469s0§(param1:Event) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         §1t1643s0§.§1t11214s0§(this.§1t5458s0§.logo,this.§1t5460s0§.selectedColor);
      }
      
      internal function §1t5323s0§(param1:Event) : *
      {
         if(this.§1t5457s0§.text == "" || this.§1t5457s0§.text == "?" || this.§1t5452s0§.text == "")
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         var _loc2_:RegExp = /[^a-zA-Z0-9\s-]/;
         if(_loc2_.test(this.§1t5457s0§.text))
         {
            this.errortext.y = 160;
            this.errortext.text = §1t1521s0§.getString(137);
            this.errortext.visible = true;
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         _loc2_ = /[^a-zA-Z0-9]/;
         if(_loc2_.test(this.§1t5452s0§.text))
         {
            this.errortext.y = 200;
            this.errortext.text = §1t1521s0§.getString(137);
            this.errortext.visible = true;
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         if(this.§1t5457s0§.text == §1t1523s0§.§1t9654s0§() && this.§1t5452s0§.text == §1t1523s0§.§1t9656s0§() && this.§1t5464s0§ == §1t1523s0§.§1t9658s0§() && this.§1t5454s0§.selectedColor == §1t1523s0§.§1t9655s0§() && this.§1t5460s0§.selectedColor == §1t1523s0§.§1t9659s0§())
         {
            this.errortext.y = 160;
            this.errortext.text = §1t1521s0§.getString(837);
            this.errortext.visible = true;
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return;
         }
         this.§1t5125s0§();
      }
      
      internal function §1t5125s0§() : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         this.§1t5457s0§.text = this.§1t5457s0§.text.toLowerCase();
         var _loc1_:int = 0;
         if(this.§1t5465s0§)
         {
            _loc1_ = §1t1523s0§.§1t7746s0§();
         }
         §1t251s0§.instance.§1t3553s0§(this.§1t5457s0§.text,this.§1t5454s0§.selectedColor,this.§1t5464s0§,this.§1t5460s0§.selectedColor,this.§1t5452s0§.text,_loc1_);
         this.okbutton.visible = false;
         this.cancelbutton.visible = false;
         this.errortext.visible = false;
         this.loadingtext.visible = true;
      }
      
      public function §1t5470s0§(param1:int) : *
      {
         var _loc2_:§1t17s0§ = null;
         var _loc3_:int = 0;
         §1t88s0§.instance.§1t1513s0§();
         if(this.§1t5465s0§)
         {
            §1t1523s0§.§1t9713s0§(2215,-1);
            §1t1523s0§.§1t9652s0§(this.§1t5457s0§.text,this.§1t5454s0§.selectedColor,this.§1t5464s0§,this.§1t5460s0§.selectedColor,this.§1t5452s0§.text,§1t1523s0§.charname,§1t1523s0§.§1t9660s0§());
            §1t3318s0§.instance.§1t3436s0§(param1,this.§1t5457s0§.text,this.§1t5454s0§.selectedColor,this.§1t5464s0§,this.§1t5460s0§.selectedColor,this.§1t5452s0§.text,§1t1523s0§.charname,§1t1523s0§.§1t9660s0§());
         }
         else
         {
            §1t1523s0§.§1t9713s0§(2212,-1);
            §1t1523s0§.§1t9712s0§(§1t1523s0§.§1t9422s0§,param1);
            §1t3317s0§.instance.§1t1918s0§(-1,§1t1523s0§.id);
            §1t406s0§.instance.§1t6526s0§();
            §1t3317s0§.instance.§1t1946s0§();
            §1t1523s0§.§1t9652s0§(this.§1t5457s0§.text,this.§1t5454s0§.selectedColor,this.§1t5464s0§,this.§1t5460s0§.selectedColor,this.§1t5452s0§.text,§1t1523s0§.charname,0);
            §1t251s0§.instance.§1t3524s0§("",902,[§1t1523s0§.§1t9765s0§(),§1t1521s0§.getString(563,[§1t1523s0§.§1t9654s0§()])]);
         }
         this.removeEventListeners();
         this.visible = false;
         §1t1541s0§.§1t10045s0§();
         if(!this.§1t5465s0§)
         {
            _loc3_ = 0;
            while(_loc3_ < 1)
            {
               _loc2_ = new §1t17s0§(2214,1);
               _loc2_.§1t493s0§(§1t1523s0§.§1t9422s0§,§1t1523s0§.§1t7746s0§());
               _loc2_.§1t542s0§(§1t1523s0§.§1t9654s0§());
               §1t406s0§.instance.§1t6488s0§.§1t6185s0§(_loc2_);
               _loc3_++;
            }
            _loc3_ = 0;
            while(_loc3_ < 3)
            {
               _loc2_ = new §1t17s0§(2213,1);
               _loc2_.§1t493s0§(§1t1523s0§.§1t9422s0§,§1t1523s0§.§1t7746s0§());
               _loc2_.§1t542s0§(§1t1523s0§.§1t9654s0§());
               §1t406s0§.instance.§1t6488s0§.§1t6185s0§(_loc2_);
               _loc3_++;
            }
            §1t406s0§.instance.§1t6488s0§.§1t5826s0§();
            §1t406s0§.instance.§1t6488s0§.show();
         }
         §1t406s0§.instance.§1t6573s0§();
      }
      
      public function §1t5471s0§(param1:int) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_error");
         this.okbutton.visible = true;
         this.cancelbutton.visible = true;
         this.errortext.visible = true;
         this.loadingtext.visible = false;
         if(param1 == 1)
         {
            this.errortext.y = 160;
            this.errortext.text = §1t1521s0§.getString(836);
         }
         else if(param1 == 2)
         {
            this.errortext.y = 200;
            this.errortext.text = §1t1521s0§.getString(821);
         }
         else if(param1 == 3)
         {
            this.errortext.y = 320;
            this.errortext.text = §1t1521s0§.getString(822);
         }
         else if(param1 == 4)
         {
            this.errortext.y = 160;
            this.errortext.text = §1t1521s0§.getString(819);
         }
      }
      
      internal function §1t5330s0§(param1:Event) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_back");
         this.removeEventListeners();
         this.visible = false;
         §1t1541s0§.§1t10045s0§();
         §1t406s0§.instance.§1t6573s0§();
      }
      
      internal function __setProp_clancolorpicker_CreateClanDialog_text_0() : *
      {
         try
         {
            this.§1t5454s0§["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         this.§1t5454s0§.enabled = true;
         this.§1t5454s0§.selectedColor = 16737792;
         this.§1t5454s0§.showTextField = true;
         this.§1t5454s0§.visible = true;
         try
         {
            this.§1t5454s0§["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp_symbolcolorpicker_CreateClanDialog_text_0() : *
      {
         try
         {
            this.§1t5460s0§["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         this.§1t5460s0§.enabled = true;
         this.§1t5460s0§.selectedColor = 16777215;
         this.§1t5460s0§.showTextField = true;
         this.§1t5460s0§.visible = true;
         try
         {
            this.§1t5460s0§["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
   }
}

