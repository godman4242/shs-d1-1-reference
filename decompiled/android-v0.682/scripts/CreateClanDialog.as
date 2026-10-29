package
{
   import fl.controls.ColorPicker;
   import fl.events.ColorPickerEvent;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1037")]
   public class CreateClanDialog extends MovieClip
   {
      
      public var clancolorpicker:ColorPicker;
      
      public var acronymtext:TextField;
      
      public var symbolcolorlabel:TextField;
      
      public var acronymlabel:TextField;
      
      public var symbollabel:TextField;
      
      public var symbolprev:SimpleButton;
      
      public var clannamelabel:TextField;
      
      public var errortext:TextField;
      
      public var symbolcolortext:TextField;
      
      public var clancolorlabel:TextField;
      
      public var clannametext:TextField;
      
      public var cancelbutton:GreyButton;
      
      public var titletext:TextField;
      
      public var clancolortext:TextField;
      
      public var symbolcolorpicker:ColorPicker;
      
      public var loadingtext:TextField;
      
      public var clansymbol:ClanSymbol;
      
      public var symbolnext:SimpleButton;
      
      public var okbutton:YellowButton;
      
      internal var logoId:int = 1;
      
      internal var isEdit:Boolean = false;
      
      public function CreateClanDialog()
      {
         super();
         LangManager.initTextField(this.titletext);
         LangManager.initTextField(this.clannamelabel);
         LangManager.initTextField(this.clannametext);
         LangManager.initTextField(this.acronymlabel);
         LangManager.initTextField(this.acronymtext);
         LangManager.initTextField(this.errortext);
         LangManager.initTextField(this.symbollabel);
         LangManager.initTextField(this.clancolorlabel);
         LangManager.initTextField(this.clancolortext);
         LangManager.initTextField(this.symbolcolorlabel);
         LangManager.initTextField(this.symbolcolortext);
         LangManager.initTextField(this.loadingtext);
         this.clannamelabel.text = LangManager.getString(814);
         this.symbollabel.text = LangManager.getString(815);
         this.clancolorlabel.text = LangManager.getString(816);
         this.symbolcolortext.text = LangManager.getString(817);
         this.loadingtext.text = LangManager.getString(90);
         this.okbutton.setText(LangManager.getString(5));
         this.cancelbutton.setText(LangManager.getString(470));
         this.acronymlabel.text = LangManager.getString(818);
         this.clancolortext.selectable = false;
         this.symbolcolortext.selectable = false;
         this.__setProp_clancolorpicker_CreateClanDialog_text_0();
         this.__setProp_symbolcolorpicker_CreateClanDialog_text_0();
      }
      
      public function show(isEdit:Boolean = false) : *
      {
         if(!GameEngine.isOverworld() && !GameEngine.isTitle())
         {
            InputManager.disableInput();
         }
         this.visible = true;
         this.okbutton.visible = true;
         this.cancelbutton.visible = true;
         this.errortext.visible = false;
         this.addEventListeners();
         this.loadingtext.visible = false;
         this.clannametext.maxChars = 15;
         if(!isEdit)
         {
            this.titletext.text = LangManager.getString(4400);
            this.clannametext.text = "";
            this.acronymtext.text = "";
            this.logoId = int(Math.random() * this.clansymbol.logo.totalFrames) + 1;
            this.clancolorpicker.selectedColor = ColorCode.generateColor(Math.random() * 1000);
            this.symbolcolorpicker.selectedColor = ColorCode.generateLightColor(Math.random() * 1000);
         }
         else
         {
            this.titletext.text = LangManager.getString(4404);
            this.clannametext.text = StatsManager.getCustomClanName();
            this.acronymtext.text = StatsManager.getCustomClanAcronym();
            this.logoId = StatsManager.getCustomClanLogoId();
            this.clancolorpicker.selectedColor = StatsManager.getCustomClanColor();
            this.symbolcolorpicker.selectedColor = StatsManager.getCustomClanLogoColor();
            if(!StatsManager.isCustomClanFounder())
            {
               this.createClanError(4);
               this.okbutton.visible = false;
            }
         }
         this.isEdit = isEdit;
         this.clansymbol.logo.gotoAndStop(this.logoId);
         this.clancolortext.text = this.clancolorpicker.hexValue;
         this.symbolcolortext.text = this.symbolcolorpicker.hexValue;
         ColorCode.changeColor(this.clansymbol.bg,this.clancolorpicker.selectedColor);
         ColorCode.changeColor(this.clansymbol.logo,this.symbolcolorpicker.selectedColor);
      }
      
      internal function addEventListeners() : *
      {
         this.okbutton.addEventListener(MouseEvent.CLICK,this.okClick);
         this.cancelbutton.addEventListener(MouseEvent.CLICK,this.cancelClick);
         this.okbutton.addEventListeners();
         this.cancelbutton.addEventListeners();
         this.symbolprev.addEventListener(MouseEvent.CLICK,this.symbolprevClick);
         this.symbolnext.addEventListener(MouseEvent.CLICK,this.symbolnextClick);
         this.clancolorpicker.addEventListener(ColorPickerEvent.CHANGE,this.clanColorChangeHandler);
         this.symbolcolorpicker.addEventListener(ColorPickerEvent.CHANGE,this.symbolColorChangeHandler);
      }
      
      internal function removeEventListeners() : *
      {
         this.okbutton.removeEventListener(MouseEvent.CLICK,this.okClick);
         this.cancelbutton.removeEventListener(MouseEvent.CLICK,this.cancelClick);
         this.okbutton.removeEventListeners();
         this.cancelbutton.removeEventListeners();
         this.symbolprev.removeEventListener(MouseEvent.CLICK,this.symbolprevClick);
         this.symbolnext.removeEventListener(MouseEvent.CLICK,this.symbolnextClick);
         this.clancolorpicker.addEventListener(ColorPickerEvent.CHANGE,this.clanColorChangeHandler);
         this.symbolcolorpicker.addEventListener(ColorPickerEvent.CHANGE,this.symbolColorChangeHandler);
      }
      
      internal function symbolprevClick(event:Event) : *
      {
         --this.logoId;
         if(this.logoId == 0)
         {
            this.logoId = this.clansymbol.logo.totalFrames;
         }
         this.clansymbol.logo.gotoAndStop(this.logoId);
      }
      
      internal function symbolnextClick(event:Event) : *
      {
         ++this.logoId;
         if(this.logoId > this.clansymbol.logo.totalFrames)
         {
            this.logoId = 1;
         }
         this.clansymbol.logo.gotoAndStop(this.logoId);
      }
      
      internal function clanColorChangeHandler(event:Event) : *
      {
         this.clancolortext.text = event.target.hexValue;
         ColorCode.changeColor(this.clansymbol.bg,event.target.selectedColor);
      }
      
      internal function symbolColorChangeHandler(event:Event) : *
      {
         this.symbolcolortext.text = event.target.hexValue;
         ColorCode.changeColor(this.clansymbol.logo,event.target.selectedColor);
      }
      
      internal function okClick(event:Event) : *
      {
         if(this.clannametext.text == "" || this.clannametext.text == "?" || this.acronymtext.text == "")
         {
            return;
         }
         var nameEx:RegExp = /[^a-zA-Z0-9\s-]/;
         if(LangManager.getLanguage() == LangManager.ENGLISH && nameEx.test(this.clannametext.text))
         {
            this.errortext.y = 160;
            this.errortext.text = LangManager.getString(137);
            this.errortext.visible = true;
            return;
         }
         nameEx = /[^a-zA-Z0-9]/;
         if(LangManager.getLanguage() == LangManager.ENGLISH && nameEx.test(this.acronymtext.text))
         {
            this.errortext.y = 200;
            this.errortext.text = LangManager.getString(137);
            this.errortext.visible = true;
            return;
         }
         if(this.clannametext.text == StatsManager.getCustomClanName() && this.acronymtext.text == StatsManager.getCustomClanAcronym() && this.logoId == StatsManager.getCustomClanLogoId() && this.clancolorpicker.selectedColor == StatsManager.getCustomClanColor() && this.symbolcolorpicker.selectedColor == StatsManager.getCustomClanLogoColor())
         {
            this.errortext.y = 160;
            this.errortext.text = LangManager.getString(837);
            this.errortext.visible = true;
            return;
         }
         this.purchaseSuccess();
      }
      
      internal function purchaseSuccess() : *
      {
         this.clannametext.text = this.clannametext.text.toLowerCase();
         var clanId:int = 0;
         if(this.isEdit)
         {
            clanId = StatsManager.getSide();
         }
         NetworkManager.instance.createClan(this.clannametext.text,this.clancolorpicker.selectedColor,this.logoId,this.symbolcolorpicker.selectedColor,this.acronymtext.text,clanId);
         this.okbutton.visible = false;
         this.cancelbutton.visible = false;
         this.errortext.visible = false;
         this.loadingtext.visible = true;
      }
      
      public function createClanSuccessful(clanId:int) : *
      {
         var item:Item = null;
         var i:int = 0;
         if(this.isEdit)
         {
            StatsManager.changeStat(2215,-1);
            StatsManager.initCustomClan(this.clannametext.text,this.clancolorpicker.selectedColor,this.logoId,this.symbolcolorpicker.selectedColor,this.acronymtext.text,StatsManager.charname,StatsManager.getCustomClanOwned());
            QueryManagerPIO.instance.updateCustomClanData(clanId,this.clannametext.text,this.clancolorpicker.selectedColor,this.logoId,this.symbolcolorpicker.selectedColor,this.acronymtext.text,StatsManager.charname,StatsManager.getCustomClanOwned());
         }
         else
         {
            StatsManager.changeStat(2212,-1);
            StatsManager.setStat(StatsManager.STAT_SIDE,clanId);
            QueryManager.instance.delWarSentry(-1,StatsManager.id);
            OverworldHUD.instance.setCustomClan();
            QueryManager.instance.saveModifiedCharData();
            StatsManager.initCustomClan(this.clannametext.text,this.clancolorpicker.selectedColor,this.logoId,this.symbolcolorpicker.selectedColor,this.acronymtext.text,StatsManager.charname,0);
         }
         this.removeEventListeners();
         this.visible = false;
         InputManager.setAdventureMode();
         if(!this.isEdit)
         {
            for(i = 0; i < 1; i++)
            {
               item = new Item(2214,1);
               item.addModifier(StatsManager.STAT_SIDE,StatsManager.getSide());
               item.setClanInvitationName(StatsManager.getCustomClanName());
               OverworldHUD.instance.lootDialog.addSpecialItem(item);
            }
            for(i = 0; i < 3; i++)
            {
               item = new Item(2213,1);
               item.addModifier(StatsManager.STAT_SIDE,StatsManager.getSide());
               item.setClanInvitationName(StatsManager.getCustomClanName());
               OverworldHUD.instance.lootDialog.addSpecialItem(item);
            }
            OverworldHUD.instance.lootDialog.notifyDontRefreshAfter();
            OverworldHUD.instance.lootDialog.show();
         }
         OverworldHUD.instance.destroyCreateClanDialog();
      }
      
      public function createClanError(error:int) : *
      {
         this.okbutton.visible = true;
         this.cancelbutton.visible = true;
         this.errortext.visible = true;
         this.loadingtext.visible = false;
         if(error == 1)
         {
            this.errortext.y = 160;
            this.errortext.text = LangManager.getString(836);
         }
         else if(error == 2)
         {
            this.errortext.y = 200;
            this.errortext.text = LangManager.getString(821);
         }
         else if(error == 3)
         {
            this.errortext.y = 320;
            this.errortext.text = LangManager.getString(822);
         }
         else if(error == 4)
         {
            this.errortext.y = 160;
            this.errortext.text = LangManager.getString(819);
         }
      }
      
      internal function cancelClick(event:Event) : *
      {
         this.removeEventListeners();
         this.visible = false;
         InputManager.setAdventureMode();
         OverworldHUD.instance.destroyCreateClanDialog();
      }
      
      internal function __setProp_clancolorpicker_CreateClanDialog_text_0() : *
      {
         try
         {
            this.clancolorpicker["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         this.clancolorpicker.enabled = true;
         this.clancolorpicker.selectedColor = 16737792;
         this.clancolorpicker.showTextField = true;
         this.clancolorpicker.visible = true;
         try
         {
            this.clancolorpicker["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp_symbolcolorpicker_CreateClanDialog_text_0() : *
      {
         try
         {
            this.symbolcolorpicker["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         this.symbolcolorpicker.enabled = true;
         this.symbolcolorpicker.selectedColor = 16777215;
         this.symbolcolorpicker.showTextField = true;
         this.symbolcolorpicker.visible = true;
         try
         {
            this.symbolcolorpicker["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
   }
}

