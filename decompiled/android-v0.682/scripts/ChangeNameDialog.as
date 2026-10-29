package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1043")]
   public class ChangeNameDialog extends MovieClip
   {
      
      public static var MODE_CHANGENAME:int = 0;
      
      public static var MODE_NAMEWEAPON:int = 1;
      
      public static var MODE_REDEEM:int = 2;
      
      public var errortext:TextField;
      
      public var nametext:TextField;
      
      public var cancelbutton:GreyButton;
      
      public var titletext:TextField;
      
      public var nametext2:TextField;
      
      public var loadingtext:TextField;
      
      public var okbutton:YellowButton;
      
      internal var mode:int = 0;
      
      internal var redeemedItem:int = 0;
      
      internal var errorTimes:int = 0;
      
      public function ChangeNameDialog()
      {
         super();
         LangManager.initTextField(this.titletext);
         LangManager.initTextField(this.nametext);
         LangManager.initTextField(this.errortext);
         LangManager.initTextField(this.loadingtext);
         this.loadingtext.text = LangManager.getString(90);
         this.okbutton.setText(LangManager.getString(5));
         this.cancelbutton.setText(LangManager.getString(470));
      }
      
      public function show(mode:int) : *
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
         this.nametext.visible = false;
         this.nametext2.visible = false;
         this.nametext.text = "";
         this.nametext2.text = "";
         this.mode = mode;
         if(mode == MODE_NAMEWEAPON)
         {
            this.nametext.maxChars = 30;
            this.titletext.text = LangManager.getString(664);
            this.nametext.visible = true;
         }
         else if(mode == MODE_CHANGENAME)
         {
            this.nametext.maxChars = 15;
            this.titletext.text = LangManager.getString(634);
            this.nametext.visible = true;
         }
         else if(mode == MODE_REDEEM)
         {
            this.nametext.maxChars = 30;
            this.titletext.text = "Enter Redeem Code";
            this.nametext2.visible = true;
         }
      }
      
      internal function addEventListeners() : *
      {
         this.okbutton.addEventListener(MouseEvent.CLICK,this.okClick);
         this.cancelbutton.addEventListener(MouseEvent.CLICK,this.cancelClick);
         this.okbutton.addEventListeners();
         this.cancelbutton.addEventListeners();
      }
      
      internal function removeEventListeners() : *
      {
         this.okbutton.removeEventListener(MouseEvent.CLICK,this.okClick);
         this.cancelbutton.removeEventListener(MouseEvent.CLICK,this.cancelClick);
         this.okbutton.removeEventListeners();
         this.cancelbutton.removeEventListeners();
      }
      
      internal function okClick(event:Event) : *
      {
         var nameEx:RegExp = null;
         var weapon:Item = null;
         if(this.nametext.text == "" && this.nametext2.text == "")
         {
            return;
         }
         if(this.mode == MODE_CHANGENAME)
         {
            nameEx = /[^a-zA-Z0-9]/;
         }
         else if(this.mode == MODE_NAMEWEAPON)
         {
            nameEx = /[^a-zA-Z0-9\s-]/;
         }
         if((this.mode == MODE_CHANGENAME || this.mode == MODE_NAMEWEAPON) && LangManager.getLanguage() == LangManager.ENGLISH && nameEx.test(this.nametext.text))
         {
            this.errortext.text = LangManager.getString(137);
            this.errortext.visible = true;
            return;
         }
         if(this.mode == MODE_NAMEWEAPON)
         {
            weapon = StatsManager.equipment[StatsManager.EQ_WEAPON];
            if(weapon == null || weapon.itemID == 0 || weapon.itemID == 13000)
            {
               this.errortext.text = LangManager.getString(637);
               this.errortext.visible = true;
               return;
            }
         }
         if(this.mode == MODE_NAMEWEAPON)
         {
            StatsManager.spendHeavenlyGold(2,this.purchaseSuccess,this.purchaseError);
         }
         else if(this.mode == MODE_REDEEM)
         {
            this.okbutton.visible = false;
            this.cancelbutton.visible = false;
            this.errortext.visible = false;
            this.loadingtext.visible = true;
            NetworkManager.instance.redeemCode(this.nametext2.text);
         }
         else
         {
            this.purchaseSuccess();
         }
      }
      
      internal function purchaseSuccess() : *
      {
         var weapon:Item = null;
         if(this.mode == MODE_CHANGENAME)
         {
            this.nametext.text = this.nametext.text.toLowerCase();
            QueryManager.instance.changeName(this.nametext.text);
            this.okbutton.visible = false;
            this.cancelbutton.visible = false;
            this.errortext.visible = false;
            this.loadingtext.visible = true;
         }
         else if(this.mode == MODE_NAMEWEAPON)
         {
            weapon = StatsManager.equipment[StatsManager.EQ_WEAPON];
            SoundManager.instance.playGoodKoto();
            QueryManager.instance.reportPremiumBuy(1,"nameweapon",2);
            weapon.setItemName(this.uppercaseFirstLetter(this.nametext.text));
            weapon.uses = 0;
            QueryManager.instance.reportDataModified(StatsManager.EQUIPMENT);
            this.removeEventListeners();
            this.visible = false;
            InputManager.setAdventureMode();
            OverworldHUD.instance.onShowInventory(null);
            weapon.setCreator("");
            NetworkManager.instance.storeItem(weapon);
         }
      }
      
      public function setRedeemedItem(redeemedItem:int) : *
      {
         this.redeemedItem = redeemedItem;
      }
      
      public function redeemSuccessful() : *
      {
         if(this.redeemedItem != 0)
         {
            if(this.redeemedItem == 12)
            {
               QueryManagerPIO.instance.refreshPayVaultCoins();
               InputManager.setAdventureMode();
            }
            else
            {
               OverworldHUD.instance.lootDialog.addLootItemBasic(this.redeemedItem,1);
               OverworldHUD.instance.lootDialog.notifyDontRefreshAfter();
               OverworldHUD.instance.lootDialog.show();
            }
            SoundManager.instance.playGoodKoto();
            this.redeemedItem = 0;
         }
         else
         {
            InputManager.setAdventureMode();
         }
         this.removeEventListeners();
         this.visible = false;
      }
      
      public function uppercaseFirstLetter(displayname:String) : String
      {
         var firstChar:String = displayname.substr(0,1);
         var restOfString:String = displayname.substr(1,displayname.length);
         return firstChar.toUpperCase() + restOfString;
      }
      
      internal function purchaseError() : *
      {
      }
      
      public function changeSuccessful() : *
      {
         NetworkManager.instance.globalAnnouncement("",LangManager.getString(867,[StatsManager.getChatDisplayCharname(),NetworkManager.instance.uppercaseFirstLetter(this.nametext.text)]));
         StatsManager.charname = this.nametext.text;
         StatsManager.id = this.nametext.text;
         NetworkManager.instance.nid = this.nametext.text;
         QueryManagerPIO.instance.charstring = this.nametext.text + "," + StatsManager.getLevel();
         StatsManager.changeStat(2207,-1);
         QueryManager.instance.saveModifiedCharData();
         StatsManager.getPlayer().getMCS().setDisplayName(StatsManager.charname,16763904);
         this.removeEventListeners();
         this.visible = false;
         InputManager.setAdventureMode();
      }
      
      public function changeError(errorCode:int) : *
      {
         if(this.mode == MODE_CHANGENAME)
         {
            this.okbutton.visible = true;
            this.cancelbutton.visible = true;
            this.errortext.visible = true;
            this.loadingtext.visible = false;
            this.errortext.text = LangManager.getString(44);
         }
         else if(this.mode == MODE_REDEEM)
         {
            this.okbutton.visible = true;
            this.cancelbutton.visible = true;
            this.errortext.visible = true;
            this.loadingtext.visible = false;
            if(errorCode == 1)
            {
               this.errortext.text = "Incorrect/expired redeem code";
            }
            else if(errorCode == 2)
            {
               this.errortext.text = "Redeem code already used";
            }
            else
            {
               this.errortext.text = "Redeem code error";
            }
            ++this.errorTimes;
            if(this.errorTimes > 5)
            {
               this.okbutton.visible = false;
            }
         }
      }
      
      internal function cancelClick(event:Event) : *
      {
         this.removeEventListeners();
         this.visible = false;
         InputManager.setAdventureMode();
      }
   }
}

