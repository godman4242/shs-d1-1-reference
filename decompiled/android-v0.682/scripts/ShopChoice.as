package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2595")]
   public class ShopChoice extends MovieClip
   {
      
      public var coinslabel:TextField;
      
      public var hGoldText:TextField;
      
      public var goldText:TextField;
      
      public var bust:DialogueBust;
      
      public var buyButton:GenericActionButton;
      
      public var leaveButton:GenericActionButton;
      
      public var npcText:TextField;
      
      public var shopName:MovieClip;
      
      public var goldlabel:TextField;
      
      public var npcName:TextField;
      
      public var sellButton:GenericActionButton;
      
      public function ShopChoice()
      {
         var nodeuiX:Number = NaN;
         var nodeuiY:Number = NaN;
         super();
         nodeuiX = NodeUI.instance.x + 10;
         nodeuiY = NodeUI.instance.y + 40;
         var nodeuiSpacingY:Number = NodeUI.instance.actionButtonHeight;
         this.buyButton.setText(LangManager.getString(83));
         this.buyButton.setInteractIcon(NodeUI.ACTION_BUY);
         this.buyButton.x = nodeuiX;
         this.buyButton.y = nodeuiY;
         this.sellButton.setText(LangManager.getString(84));
         this.sellButton.setInteractIcon(NodeUI.ACTION_SELL);
         this.sellButton.x = nodeuiX;
         this.sellButton.y = nodeuiY + nodeuiSpacingY;
         this.leaveButton.setText(LangManager.getString(85));
         this.leaveButton.setInteractIcon(NodeUI.ACTION_LEAVE);
         this.leaveButton.x = nodeuiX;
         this.leaveButton.y = nodeuiY + 2 * nodeuiSpacingY;
         LangManager.initTextField(this.shopName.label,true);
         LangManager.initTextField(this.npcName,true);
         LangManager.initTextField(this.npcText);
         LangManager.initTextField(this.coinslabel,true);
         this.coinslabel.text = LangManager.getString(63);
         LangManager.initTextField(this.goldlabel,true);
         this.goldlabel.text = LangManager.getString(64);
      }
      
      public function updateNodeName(str:String) : *
      {
         this.shopName.label.text = str;
      }
      
      public function onShow(shopData:XMLShopData) : *
      {
         this.buyButton.addEventListener(MouseEvent.CLICK,this.onBuy);
         this.sellButton.addEventListener(MouseEvent.CLICK,this.onSell);
         this.leaveButton.addEventListener(MouseEvent.CLICK,this.onLeave);
         NodeUI.instance.visible = false;
         this.visible = true;
         this.bust.initMCSFromNPCID(shopData.npcID);
         this.bust.faceLeft();
         this.npcText.text = shopData.welcome;
         this.npcName.text = QuestEngine.getNPCName(shopData.npcID);
         this.goldText.text = StatsManager.getStat(11).toString();
         this.hGoldText.text = StatsManager.getStat(12).toString();
         this.shopName.label.text = LangManager.getString(shopData.name);
         OverworldHUD.instance.showInfoBustButtons(false);
         Overworld.setMapEnabled(false);
         if(!GameEngine.isOverworld())
         {
            InputManager.disableInput();
            StatsManager.getPlayer().stopMoving();
         }
      }
      
      public function onBuy(mouseEvent:MouseEvent) : void
      {
         this.visible = false;
         OverworldHUD.instance.shopUI.showBuy(QuestEngine.getShopData(StageManager.getCurrentNode()));
      }
      
      public function onSell(mouseEvent:MouseEvent) : void
      {
         this.visible = false;
         OverworldHUD.instance.shopUI.showSell(QuestEngine.getShopData(StageManager.getCurrentNode()));
      }
      
      public function onLeave(mouseEvent:MouseEvent) : void
      {
         this.visible = false;
         OverworldHUD.instance.showInfoBustButtons(true);
         NodeUI.instance.visible = true;
         this.buyButton.removeEventListener(MouseEvent.CLICK,this.onBuy);
         this.sellButton.removeEventListener(MouseEvent.CLICK,this.onSell);
         this.leaveButton.removeEventListener(MouseEvent.CLICK,this.onLeave);
         Overworld.setMapEnabled(true);
         if(!GameEngine.isOverworld())
         {
            OverworldHUD.instance.initForAdventureMode();
            InputManager.setAdventureMode();
         }
      }
   }
}

