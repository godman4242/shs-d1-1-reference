package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol878")]
   public class ProviderSelectDialog extends MovieClip
   {
      
      public var paypalbutton:SimpleButton;
      
      public var backbutton:GreyButton;
      
      public var prompt:TextField;
      
      public var trialpaybutton:SimpleButton;
      
      public var superrewardsbutton:SimpleButton;
      
      public var getgoldbutton:YellowButton;
      
      public var errortext:TextField;
      
      internal var state:int;
      
      internal var amt:int;
      
      internal var payui:PayUI;
      
      internal var paymethod:String = "";
      
      internal var currentGold:int;
      
      public function ProviderSelectDialog()
      {
         super();
         stop();
         LangManager.initTextField(this.prompt,true);
         LangManager.initTextField(this.errortext);
         this.errortext.text = LangManager.getString(688);
      }
      
      public function show(amt:int, payui:PayUI) : *
      {
         this.addEventListeners();
         visible = true;
         this.showSelect();
         this.amt = amt;
         this.payui = payui;
         this.paypalClick(null);
      }
      
      public function showFB(payui:PayUI) : *
      {
         this.addEventListeners();
         visible = true;
         this.showSelect();
         this.payui = payui;
         this.showGetGold();
         this.paymethod = "FB";
      }
      
      public function showWhipFlash(payui:PayUI) : *
      {
         this.addEventListeners();
         this.showSelect();
         this.payui = payui;
         this.showGetGold();
         this.paymethod = "WF";
      }
      
      public function showKong(payui:PayUI) : *
      {
         this.addEventListeners();
         this.showSelect();
         this.payui = payui;
         this.showGetGold();
         this.paymethod = "KONG";
      }
      
      public function showMobile(payui:PayUI) : *
      {
         this.addEventListeners();
         this.showSelect();
         this.payui = payui;
         this.showGetGold();
         if(StatsManager.isAndroid)
         {
            this.paymethod = "AND";
         }
         else if(StatsManager.isIOS)
         {
            this.paymethod = "IOS";
         }
      }
      
      internal function hide() : *
      {
         this.removeEventListeners();
         visible = false;
      }
      
      internal function addEventListeners() : *
      {
         this.backbutton.addEventListener(MouseEvent.CLICK,this.backClick);
         this.backbutton.addEventListeners();
         this.getgoldbutton.addEventListener(MouseEvent.CLICK,this.getGoldClick);
         this.getgoldbutton.addEventListeners();
         this.paypalbutton.addEventListener(MouseEvent.CLICK,this.paypalClick);
         this.superrewardsbutton.addEventListener(MouseEvent.CLICK,this.superrewardsClick);
         this.trialpaybutton.addEventListener(MouseEvent.CLICK,this.trialpayClick);
      }
      
      internal function removeEventListeners() : *
      {
         this.backbutton.removeEventListener(MouseEvent.CLICK,this.backClick);
         this.backbutton.removeEventListeners();
         this.getgoldbutton.removeEventListener(MouseEvent.CLICK,this.getGoldClick);
         this.getgoldbutton.removeEventListeners();
         this.paypalbutton.removeEventListener(MouseEvent.CLICK,this.paypalClick);
         this.superrewardsbutton.removeEventListener(MouseEvent.CLICK,this.superrewardsClick);
         this.trialpaybutton.removeEventListener(MouseEvent.CLICK,this.trialpayClick);
      }
      
      internal function showSelect() : *
      {
         gotoAndStop(1);
         this.state = 1;
         this.prompt.text = LangManager.getString(689);
         this.backbutton.setText(LangManager.getString(9));
         this.errortext.visible = false;
         this.getgoldbutton.visible = false;
         this.paypalbutton.visible = true;
         this.superrewardsbutton.visible = true;
         this.trialpaybutton.visible = true;
      }
      
      internal function showGetGold() : *
      {
         gotoAndStop(2);
         this.state = 2;
         this.prompt.text = LangManager.getString(690);
         this.getgoldbutton.setText(LangManager.getString(486));
         this.backbutton.setText(LangManager.getString(17));
         this.errortext.visible = false;
         this.getgoldbutton.visible = true;
         this.paypalbutton.visible = false;
         this.superrewardsbutton.visible = false;
         this.trialpaybutton.visible = false;
         this.currentGold = QueryManagerPIO.instance.client.payVault.coins;
      }
      
      internal function backClick(event:MouseEvent) : *
      {
         this.hide();
      }
      
      internal function getGoldClick(event:MouseEvent) : *
      {
         if(this.state == 1)
         {
            return;
         }
         QueryManagerPIO.instance.client.payVault.refresh(this.payVaultRefreshDone);
      }
      
      internal function payVaultRefreshDone() : *
      {
         var newGold:int = QueryManagerPIO.instance.client.payVault.coins;
         if(newGold > this.currentGold)
         {
            this.hide();
            this.payui.updateGold();
            this.payui.payPalCallback(PayPal.PAYMENT_SUCCEEDED,"");
            OverworldHUD.instance.gotGiftDialog.addLootGold(newGold - this.currentGold);
            OverworldHUD.instance.gotGiftDialog.addGiver(LangManager.getString(86));
            OverworldHUD.instance.gotGiftDialog.show();
            QueryManager.instance.reportGotGold(newGold - this.currentGold,this.paymethod);
         }
         else if(this.state == 2)
         {
            this.errortext.visible = true;
         }
      }
      
      internal function paypalClick(event:MouseEvent) : *
      {
         var url:String = "http://api.playerio.com/payvault/paypal/coinsredirect?gameid=" + QueryManagerPIO.instance.gameid + "&connectuserid=" + QueryManager.instance.userid + "&connection=public&coinamount=" + this.amt.toString() + "&currency=USD&item_name=" + this.amt.toString() + " Gold for Straw Hat Samurai Duels";
         QueryManager.instance.showWebsite(url);
         this.showGetGold();
         this.paymethod = "PIOPP";
      }
      
      internal function superrewardsClick(event:MouseEvent) : *
      {
         var url:String = "http://api.playerio.com/payvault/superrewards/coinsredirect?gameid=" + QueryManagerPIO.instance.gameid + "&connectuserid=" + QueryManager.instance.userid + "&connection=public";
         QueryManager.instance.showWebsite(url);
         this.showGetGold();
         this.paymethod = "PIOSR";
      }
      
      internal function trialpayClick(event:MouseEvent) : *
      {
         var url:String = "http://api.playerio.com/payvault/trialpay/coinsredirect?gameid=" + QueryManagerPIO.instance.gameid + "&connectuserid=" + QueryManager.instance.userid + "&connection=public";
         QueryManager.instance.showWebsite(url);
         this.showGetGold();
         this.paymethod = "PIOTP";
      }
   }
}

