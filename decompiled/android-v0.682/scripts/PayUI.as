package
{
   import com.flappsh.WhipFlash;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.*;
   import flash.text.TextField;
   import flash.utils.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol932")]
   public class PayUI extends MovieClip
   {
      
      public var fbicon4:MovieClip;
      
      public var pricetext0:TextField;
      
      public var goldtext4:TextField;
      
      public var pricetext1:TextField;
      
      public var closeWindowButton:SimpleButton;
      
      public var oldpricetext4:MovieClip;
      
      public var pricetext2:TextField;
      
      public var trialpaybutton:SimpleButton;
      
      public var pricetext3:TextField;
      
      public var expirestext:TextField;
      
      public var hGoldText:TextField;
      
      public var oldpricetext0:MovieClip;
      
      public var oldpricetext1:MovieClip;
      
      public var discounttext:TextField;
      
      public var whipflashbutton:SimpleButton;
      
      public var superrewardsbutton:SimpleButton;
      
      public var oldpricetext2:MovieClip;
      
      public var populartext:TextField;
      
      public var oldpricetext3:MovieClip;
      
      public var bg:MovieClip;
      
      public var buy0:GoldButtonSmall;
      
      public var kredoffersbutton:GreyButton;
      
      public var buy1:GoldButtonSmall;
      
      public var buy2:GoldButtonSmall;
      
      public var goldtext1:TextField;
      
      public var firstbuyertext:TextField;
      
      public var titletext:TextField;
      
      public var fbicon0:MovieClip;
      
      public var buy3:GoldButtonSmall;
      
      public var pricetext4:TextField;
      
      public var bestdealtext:TextField;
      
      public var goldtext0:TextField;
      
      public var loading:MovieClip;
      
      public var kredmobilebutton:GreyButton;
      
      public var fbicon1:MovieClip;
      
      public var buy4:GoldButtonSmall;
      
      public var goldtext3:TextField;
      
      public var fbcreditsbutton:GreyButton;
      
      public var goldlabel:TextField;
      
      public var paymentselect:ProviderSelectDialog;
      
      public var fbicon2:MovieClip;
      
      public var goldtext2:TextField;
      
      public var showNinjaCheck:XCheckBoxRight;
      
      public var fbicon3:MovieClip;
      
      internal var checkedDiscount:Boolean = false;
      
      internal var discount:int;
      
      internal var discountEnd:int;
      
      internal var currentGold:int;
      
      public function PayUI()
      {
         super();
         this.titletext.text = LangManager.getString(486);
         LangManager.initTextField(this.goldlabel,true);
         this.goldlabel.text = LangManager.getString(64);
         LangManager.initTextField(this.firstbuyertext,true);
         this.showNinjaCheck.setText(LangManager.getString(621));
         this.showNinjaCheck.setCheck(StatsManager.showNinjaServant);
         this.buy0.setText(LangManager.getString(83));
         this.buy1.setText(LangManager.getString(83));
         this.buy2.setText(LangManager.getString(83));
         this.buy3.setText(LangManager.getString(83));
         this.buy4.setText(LangManager.getString(83));
         this.bestdealtext.text = LangManager.getString(487);
         this.populartext.text = "Most\npopular!";
         this.discounttext.text = "";
         this.goldtext0.text = 10 + " " + LangManager.getString(64);
         this.goldtext1.text = 25 + " " + LangManager.getString(64);
         this.goldtext2.text = 40 + " " + LangManager.getString(64);
         this.goldtext3.text = 55 + " " + LangManager.getString(64);
         this.goldtext4.text = 75 + " " + LangManager.getString(64);
         this.pricetext0.text = "";
         this.pricetext1.text = "";
         this.pricetext2.text = "";
         this.pricetext3.text = "";
         this.pricetext4.text = "";
         this.oldpricetext0.pricetext.text = "4.99";
         this.oldpricetext1.pricetext.text = "9.99";
         this.oldpricetext2.pricetext.text = "14.99";
         this.oldpricetext3.pricetext.text = "19.99";
         this.oldpricetext4.pricetext.text = "24.99";
         this.fbicon0.visible = false;
         this.fbicon1.visible = false;
         this.fbicon2.visible = false;
         this.fbicon3.visible = false;
         this.fbicon4.visible = false;
         this.fbcreditsbutton.visible = false;
         this.kredoffersbutton.visible = false;
         this.kredmobilebutton.visible = false;
         this.oldpricetext0.visible = false;
         this.oldpricetext1.visible = false;
         this.oldpricetext2.visible = false;
         this.oldpricetext3.visible = false;
         this.oldpricetext4.visible = false;
         this.expirestext.visible = false;
         this.visible = false;
         this.discounttext.visible = false;
         this.expirestext.visible = false;
         if(StatsManager.isMobile)
         {
            Mobile.getInstance().initIAP();
         }
      }
      
      public function show() : *
      {
         this.addEventListeners();
         this.visible = true;
         StageManager.getGameStage().visible = false;
         this.hGoldText.text = StatsManager.getHeavenlyGold().toString();
         this.showNinjaCheck.setCheck(StatsManager.showNinjaServant);
         this.loading.visible = false;
         this.expirestext.visible = false;
         this.firstbuyertext.visible = false;
         this.setState();
         this.paymentselect.visible = false;
         if(!StatsManager.usePlayerIO)
         {
            this.firstbuyertext.visible = false;
            this.superrewardsbutton.visible = false;
            this.trialpaybutton.visible = false;
            this.whipflashbutton.visible = false;
         }
         if(StatsManager.isMobile)
         {
            this.whipflashbutton.visible = false;
            this.trialpaybutton.y = 253;
            this.superrewardsbutton.y = 183;
         }
         if(StatsManager.isKongregate)
         {
            this.fbcreditsbutton.x = 564.4;
            this.fbcreditsbutton.y = 128.05;
            this.fbcreditsbutton.visible = true;
            this.fbcreditsbutton.setText("Get more Kreds");
            this.whipflashbutton.visible = false;
            this.superrewardsbutton.visible = false;
            this.trialpaybutton.visible = false;
            this.kredmobilebutton.visible = true;
            this.kredmobilebutton.setText("use Mobile");
            this.kredoffersbutton.visible = true;
            this.kredoffersbutton.setText("free kreds");
            this.firstbuyertext.text = "not enough kreds?\n\n\n\n\n\n\n\n\n\n\nyou can also get kreds for free(!!!) by completing surveys and other offers";
         }
      }
      
      internal function setState() : *
      {
         if(StatsManager.purchasesMade.getIntValue() == 0)
         {
            this.showNinjaCheck.visible = false;
         }
         else
         {
            this.showNinjaCheck.visible = true;
         }
         this.gotDiscount(0,0);
         this.discounttext.visible = true;
         this.discounttext.text = "FREE GIFT!";
         this.expirestext.visible = false;
         this.firstbuyertext.visible = true;
         if(StatsManager.isKongregate)
         {
            this.firstbuyertext.text = "not enough kreds?\n\n\n\n\n\n\n\n\n\n\nyou can also get kreds for free(!!!) by completing surveys and other offers";
         }
         else
         {
            this.firstbuyertext.text = "you can also get\ngold for free(!!!)\nby completing surveys\nand other offers at:";
         }
      }
      
      public function updateGold() : *
      {
         this.hGoldText.text = StatsManager.getHeavenlyGold().toString();
      }
      
      internal function gotDiscount(num:int, discountEnd:int) : *
      {
         this.checkedDiscount = true;
         this.discount = num;
         this.discountEnd = discountEnd;
         if(discountEnd < QueryManager.instance.getServerTime())
         {
            this.discount = 0;
         }
         if(num == 50)
         {
            this.pricetext0.text = "2.49 USD";
            this.pricetext1.text = "4.99 USD";
            this.pricetext2.text = "7.49 USD";
            this.pricetext3.text = "9.99 USD";
            this.pricetext4.text = "12.49 USD";
            this.oldpricetext0.visible = true;
            this.oldpricetext1.visible = true;
            this.oldpricetext2.visible = true;
            this.oldpricetext3.visible = true;
            this.oldpricetext4.visible = true;
         }
         else if(num == 25)
         {
            this.pricetext0.text = "3.74 USD";
            this.pricetext1.text = "7.49 USD";
            this.pricetext2.text = "11.24 USD";
            this.pricetext3.text = "14.99 USD";
            this.pricetext4.text = "18.74 USD";
            this.oldpricetext0.visible = true;
            this.oldpricetext1.visible = true;
            this.oldpricetext2.visible = true;
            this.oldpricetext3.visible = true;
            this.oldpricetext4.visible = true;
         }
         else if(num == 0)
         {
            if(StatsManager.isKongregate)
            {
               this.pricetext0.text = "50 KREDS";
               this.pricetext1.text = "100 KREDS";
               this.pricetext2.text = "150 KREDS";
               this.pricetext3.text = "200 KREDS";
               this.pricetext4.text = "250 KREDS";
            }
            else
            {
               this.pricetext0.text = "4.99 USD";
               this.pricetext1.text = "9.99 USD";
               this.pricetext2.text = "14.99 USD";
               this.pricetext3.text = "19.99 USD";
               this.pricetext4.text = "24.99 USD";
            }
            this.oldpricetext0.visible = false;
            this.oldpricetext1.visible = false;
            this.oldpricetext2.visible = false;
            this.oldpricetext3.visible = false;
            this.oldpricetext4.visible = false;
            this.expirestext.visible = false;
         }
         if(this.discount != 0)
         {
            this.discounttext.text = num.toString() + "% " + LangManager.getString(488);
            if(StatsManager.purchasesMade.getIntValue() == 0)
            {
               this.expirestext.visible = false;
               this.firstbuyertext.visible = true;
               this.firstbuyertext.text = LangManager.getString(622);
            }
            else if(StatsManager.purchasesMade.getIntValue() == 1)
            {
               this.expirestext.visible = false;
               this.firstbuyertext.visible = true;
               this.firstbuyertext.text = LangManager.getString(623);
            }
            else
            {
               this.expirestext.visible = true;
               this.expirestext.text = LangManager.getString(489) + "\n" + this.getTimeString(discountEnd - QueryManager.instance.getServerTime());
            }
         }
      }
      
      internal function getTimeString(secs:int) : String
      {
         var hours:int = Math.floor(secs / (60 * 60));
         var divisor_for_minutes:int = secs % (60 * 60);
         var min:int = Math.floor(divisor_for_minutes / 60);
         var divisor_for_seconds:int = divisor_for_minutes % 60;
         var sec:int = Math.ceil(divisor_for_seconds);
         var secstr:String = sec.toString();
         if(sec < 10)
         {
            secstr = "0" + secstr;
         }
         var minstr:String = min.toString();
         if(min < 10)
         {
            minstr = "0" + minstr;
         }
         return hours + ":" + minstr + ":" + secstr;
      }
      
      public function update(servertime:int) : *
      {
         if(visible && this.expirestext.visible)
         {
            this.expirestext.text = LangManager.getString(489) + this.getTimeString(this.discountEnd - servertime);
            if(servertime > this.discountEnd)
            {
               this.gotDiscount(0,0);
            }
         }
      }
      
      public function addEventListeners() : *
      {
         this.buy0.addEventListener(MouseEvent.CLICK,this.buyGold0);
         this.buy1.addEventListener(MouseEvent.CLICK,this.buyGold1);
         this.buy2.addEventListener(MouseEvent.CLICK,this.buyGold2);
         this.buy3.addEventListener(MouseEvent.CLICK,this.buyGold3);
         this.buy4.addEventListener(MouseEvent.CLICK,this.buyGold4);
         this.buy0.addEventListeners();
         this.buy1.addEventListeners();
         this.buy2.addEventListeners();
         this.buy3.addEventListeners();
         this.buy4.addEventListeners();
         this.fbcreditsbutton.addEventListener(MouseEvent.CLICK,this.getFBCredits);
         this.fbcreditsbutton.addEventListeners();
         this.kredoffersbutton.addEventListener(MouseEvent.CLICK,this.getKredsOffer);
         this.kredoffersbutton.addEventListeners();
         this.kredmobilebutton.addEventListener(MouseEvent.CLICK,this.getKredsMobile);
         this.kredmobilebutton.addEventListeners();
         this.closeWindowButton.addEventListener(MouseEvent.CLICK,this.onLeave);
         this.showNinjaCheck.addEventListener(MouseEvent.CLICK,this.toggleShowNinja);
         this.superrewardsbutton.addEventListener(MouseEvent.CLICK,this.superrewardsClick);
         this.trialpaybutton.addEventListener(MouseEvent.CLICK,this.trialpayClick);
         this.whipflashbutton.addEventListener(MouseEvent.CLICK,this.whipflashClick);
         this.bg.cacheAsBitmap = true;
      }
      
      public function removeEventListeners() : *
      {
         this.buy0.removeEventListener(MouseEvent.CLICK,this.buyGold0);
         this.buy1.removeEventListener(MouseEvent.CLICK,this.buyGold1);
         this.buy2.removeEventListener(MouseEvent.CLICK,this.buyGold2);
         this.buy3.removeEventListener(MouseEvent.CLICK,this.buyGold3);
         this.buy4.removeEventListener(MouseEvent.CLICK,this.buyGold4);
         this.buy0.removeEventListeners();
         this.buy1.removeEventListeners();
         this.buy2.removeEventListeners();
         this.buy3.removeEventListeners();
         this.buy4.removeEventListeners();
         this.fbcreditsbutton.removeEventListener(MouseEvent.CLICK,this.getFBCredits);
         this.fbcreditsbutton.removeEventListeners();
         this.kredoffersbutton.removeEventListener(MouseEvent.CLICK,this.getKredsOffer);
         this.kredoffersbutton.removeEventListeners();
         this.kredmobilebutton.removeEventListener(MouseEvent.CLICK,this.getKredsMobile);
         this.kredmobilebutton.removeEventListeners();
         this.closeWindowButton.removeEventListener(MouseEvent.CLICK,this.onLeave);
         this.showNinjaCheck.removeEventListener(MouseEvent.CLICK,this.toggleShowNinja);
         this.superrewardsbutton.removeEventListener(MouseEvent.CLICK,this.superrewardsClick);
         this.trialpaybutton.removeEventListener(MouseEvent.CLICK,this.trialpayClick);
         this.whipflashbutton.removeEventListener(MouseEvent.CLICK,this.whipflashClick);
         this.bg.cacheAsBitmap = false;
      }
      
      internal function buyGold0(mouseEvent:MouseEvent) : *
      {
         this.buy(0);
      }
      
      internal function buyGold1(mouseEvent:MouseEvent) : *
      {
         this.buy(1);
      }
      
      internal function buyGold2(mouseEvent:MouseEvent) : *
      {
         this.buy(2);
      }
      
      internal function buyGold3(mouseEvent:MouseEvent) : *
      {
         this.buy(3);
      }
      
      internal function buyGold4(mouseEvent:MouseEvent) : *
      {
         this.buy(4);
      }
      
      internal function buy(option:int) : *
      {
         var discountstr:String = "";
         if(this.discount == 50)
         {
            discountstr = "50off";
         }
         else if(this.discount == 25)
         {
            discountstr = "25off";
         }
         GameEngine.leaveFullScreen();
         if(StatsManager.isFacebook() && QueryManagerPIO.instance.facebookTokenLogin)
         {
            this.paymentselect.showFB(this);
            switch(option)
            {
               case 0:
                  QueryManagerPIO.instance.buyFBGold(10);
                  break;
               case 1:
                  QueryManagerPIO.instance.buyFBGold(25);
                  break;
               case 2:
                  QueryManagerPIO.instance.buyFBGold(40);
                  break;
               case 3:
                  QueryManagerPIO.instance.buyFBGold(55);
                  break;
               case 4:
                  QueryManagerPIO.instance.buyFBGold(75);
            }
         }
         else if(StatsManager.isKongregate)
         {
            this.paymentselect.showKong(this);
            switch(option)
            {
               case 0:
                  Kongregate.instance.buyGold(10,this.kongregateOK);
                  break;
               case 1:
                  Kongregate.instance.buyGold(25,this.kongregateOK);
                  break;
               case 2:
                  Kongregate.instance.buyGold(40,this.kongregateOK);
                  break;
               case 3:
                  Kongregate.instance.buyGold(55,this.kongregateOK);
                  break;
               case 4:
                  Kongregate.instance.buyGold(75,this.kongregateOK);
            }
         }
         else if(StatsManager.isMobile)
         {
            Mobile.getInstance().makePurchase(option);
         }
         else if(StatsManager.usePlayerIO)
         {
            if(option == 0)
            {
               this.paymentselect.show(10,this);
            }
            else if(option == 1)
            {
               this.paymentselect.show(25,this);
            }
            else if(option == 2)
            {
               this.paymentselect.show(40,this);
            }
            else if(option == 3)
            {
               this.paymentselect.show(55,this);
            }
            else if(option == 4)
            {
               this.paymentselect.show(75,this);
            }
         }
         else
         {
            PayPal.setPaymentCallback(this.payPalCallback);
            this.loading.visible = true;
            switch(option)
            {
               case 0:
                  PayPal.requestPurchase("10G" + discountstr,StatsManager.id);
                  break;
               case 1:
                  PayPal.requestPurchase("25G" + discountstr,StatsManager.id);
                  break;
               case 2:
                  PayPal.requestPurchase("40G" + discountstr,StatsManager.id);
                  break;
               case 3:
                  PayPal.requestPurchase("55G" + discountstr,StatsManager.id);
                  break;
               case 4:
                  PayPal.requestPurchase("75G" + discountstr,StatsManager.id);
            }
         }
      }
      
      internal function superrewardsClick(event:MouseEvent) : *
      {
         this.paymentselect.show(10,this);
         this.paymentselect.superrewardsClick(null);
      }
      
      internal function trialpayClick(event:MouseEvent) : *
      {
         this.paymentselect.show(10,this);
         this.paymentselect.trialpayClick(null);
      }
      
      internal function whipflashClick(event:MouseEvent) : *
      {
         WhipFlash.showInterface(this.whipflashComplete,SoundManager.instance.hasSound);
         this.paymentselect.showWhipFlash(this);
      }
      
      internal function whipflashComplete(numCurrencyAwarded:int, realMoneyEarned:Number) : *
      {
         if(numCurrencyAwarded > 0)
         {
            NetworkManager.instance.reportWhipFlash(numCurrencyAwarded);
         }
      }
      
      internal function whipflashOK() : *
      {
         this.paymentselect.getGoldClick(null);
      }
      
      internal function kongregateOK(result:Object) : *
      {
         trace("Purchase success:" + result.success);
         if(result.success)
         {
            this.paymentselect.getGoldClick(null);
         }
      }
      
      internal function toggleShowNinja(event:MouseEvent) : *
      {
         this.showNinjaCheck.toggleCheck();
         StatsManager.toggleNinjaServant();
      }
      
      public function onLeave(mouseEvent:MouseEvent) : *
      {
         this.removeEventListeners();
         this.visible = false;
         StageManager.getGameStage().visible = true;
         if(GameEngine.gameMode != GameEngine.MODE_BATTLEENDLOSE && !OverworldHUD.instance.interactUI.visible && !OverworldHUD.instance.getGoldPromptDialog.visible && !OverworldHUD.instance.shopUI.visible && !OverworldHUD.instance.questLogUI.visible && (CutsceneManager.instance == null || !CutsceneManager.instance.isShowing()))
         {
            InputManager.setAdventureMode();
            NetworkManager.instance.playerUpdateBusy(false);
            OverworldHUD.instance.initForAdventureMode();
         }
      }
      
      internal function payPalCallback(status:String, error:String) : void
      {
         if(status == PayPal.PAYMENT_SUCCEEDED)
         {
            trace("paid");
            QueryManager.instance.checkNotifications();
            StatsManager.purchasesMade.changeIntValue(1);
            NetworkManager.instance.reportGoldPurchase();
            this.setState();
         }
         else if(status == PayPal.PAYMENT_FAILED)
         {
            trace("failed:" + error);
         }
         else if(status == PayPal.PAYMENT_CANCELLED)
         {
            trace("cancelled");
         }
         this.loading.visible = false;
      }
      
      internal function FBCallback(status:String, error:String = "") : void
      {
         var delayStart:* = undefined;
         if(status == FacebookCredits.PAYMENT_SUCCEEDED)
         {
            trace("fb paid");
            StatsManager.purchasesMade.changeIntValue(1);
            NetworkManager.instance.reportGoldPurchase();
            delayStart = setInterval(function():*
            {
               trace("delay run");
               paymentselect.getGoldClick(null);
               clearInterval(delayStart);
            },2000);
         }
         else if(status == FacebookCredits.PAYMENT_FAILED)
         {
            trace("fb failed:" + error);
            this.paymentselect.hide();
         }
         else if(status == FacebookCredits.PAYMENT_CANCELLED)
         {
            trace("fb canceled:" + error);
            if(error != "initiated")
            {
               this.paymentselect.hide();
            }
         }
      }
      
      internal function getFBCredits(event:MouseEvent) : *
      {
         if(StatsManager.isKongregate)
         {
            Kongregate.instance.getKreds();
         }
         else
         {
            FacebookCredits.getFBCredits();
         }
      }
      
      internal function getKredsOffer(event:MouseEvent) : *
      {
         Kongregate.instance.getKreds("offers");
      }
      
      internal function getKredsMobile(event:MouseEvent) : *
      {
         Kongregate.instance.getKreds("mobile");
      }
      
      internal function fbpayVaultRefreshDone() : *
      {
         var newGold:int = QueryManagerPIO.instance.client.payVault.coins;
         if(newGold > this.currentGold)
         {
            this.updateGold();
            OverworldHUD.instance.gotGiftDialog.addLootGold(newGold - this.currentGold);
            OverworldHUD.instance.gotGiftDialog.show();
            QueryManager.instance.reportGotGold(newGold - this.currentGold,"FBC");
         }
      }
   }
}

