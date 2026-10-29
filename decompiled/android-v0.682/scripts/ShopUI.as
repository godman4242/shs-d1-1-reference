package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol824")]
   public class ShopUI extends MovieClip
   {
      
      public var confirmBuyDialog:ConfirmBuyDialogBox;
      
      public var coinslabel:TextField;
      
      public var itemName:TextField;
      
      public var hGoldText:TextField;
      
      public var goldText:TextField;
      
      public var buyButton:RedButton;
      
      public var leaveButton:SimpleButton;
      
      public var scrollDown:ScrollButton;
      
      public var shopdtap:MovieClip;
      
      public var displayItem:ShopItem;
      
      public var scrollUp:ScrollButton;
      
      public var payUIButton:GetGoldButton;
      
      public var itemDesc:TextField;
      
      public var titletext:TextField;
      
      public var itemQty:TextField;
      
      public var goldlabel:TextField;
      
      public var bgPopUpButton:MovieClip;
      
      internal var shopData:XMLShopData;
      
      internal var currentItemList:Vector.<XMLShopItem>;
      
      internal var selectedSlotID:int;
      
      internal var topRow:int;
      
      internal var totalRows:int;
      
      internal var buy:Boolean = true;
      
      internal var sellPercentage:Number = 0.5;
      
      internal var changeInputMode:Boolean = false;
      
      internal var startX:int = 65;
      
      internal var startY:int = 125;
      
      internal var spacingX:int = 85;
      
      internal var spacingY:int = 85;
      
      internal var cols:int = 4;
      
      internal var rows:int = 4;
      
      internal var totalSlots:int;
      
      internal var slots:Vector.<ShopItem>;
      
      public function ShopUI()
      {
         var slot:ShopItem = null;
         var xpos:int = 0;
         var ypos:int = 0;
         var i:int = 0;
         this.totalSlots = this.cols * this.rows;
         this.slots = new Vector.<ShopItem>(this.totalSlots);
         super();
         this.buyButton.setText(LangManager.getString(83));
         LangManager.initTextField(this.titletext,true);
         this.setTitle(LangManager.getString(86));
         this.displayItem.setDisplayOnly();
         this.shopData = null;
         this.selectedSlotID = -1;
         this.topRow = 0;
         this.totalRows = 0;
         this.buy = true;
         this.displayItem.visible = false;
         LangManager.initTextField(this.itemName,true);
         this.itemName.htmlText = "";
         this.itemName.mouseEnabled = false;
         LangManager.initTextField(this.itemDesc);
         this.itemDesc.text = "";
         this.itemDesc.mouseEnabled = false;
         LangManager.initTextField(this.itemQty);
         this.itemQty.text = "";
         this.itemQty.mouseEnabled = false;
         this.buyButton.visible = false;
         this.hGoldText.mouseEnabled = false;
         this.goldText.mouseEnabled = false;
         LangManager.initTextField(this.coinslabel,true);
         this.coinslabel.text = LangManager.getString(63);
         LangManager.initTextField(this.goldlabel,true);
         this.goldlabel.text = LangManager.getString(64);
         LangManager.initTextField(this.shopdtap.tokenlabel,true);
         this.shopdtap.tokenlabel.text = LangManager.getString(59);
         LangManager.initTextField(this.shopdtap.apbaricon,true);
         this.shopdtap.apbaricon.text = LangManager.getString(223);
         LangManager.initTextField(this.shopdtap.aplabel,true);
         this.shopdtap.aplabel.text = LangManager.getString(65);
         LangManager.initTextField(this.payUIButton.getgoldlabel,true);
         this.payUIButton.getgoldlabel.mouseEnabled = false;
         this.payUIButton.getgoldlabel.text = LangManager.getString(486);
         for(i = 0; i < this.totalSlots; i++)
         {
            slot = new ShopItem();
            addChild(slot);
            ypos = Math.floor(i / this.cols);
            xpos = i - ypos * this.cols;
            slot.x = this.startX + xpos * this.spacingX;
            slot.y = this.startY + ypos * this.spacingY;
            slot.id = i;
            this.slots[i] = slot;
            this.slots[i].doubleClickEnabled = true;
            this.slots[i].mouseChildren = false;
         }
         this.slots.fixed = true;
      }
      
      internal function setTitle(str:String) : *
      {
         this.titletext.text = str;
      }
      
      public function showBuy(data:XMLShopData) : *
      {
         if(data != this.shopData)
         {
            this.shopData = data;
         }
         this.setTitle(LangManager.getString(83));
         this.goldText.text = StatsManager.getGold().toString();
         this.hGoldText.text = StatsManager.getHeavenlyGold().toString();
         this.selectedSlotID = -1;
         this.topRow = 0;
         this.currentItemList = this.shopData.sellList;
         for(var i:* = 0; i < this.currentItemList.length; i++)
         {
            this.currentItemList[i].initItem();
         }
         this.totalRows = Math.floor((this.currentItemList.length - 1) / this.cols);
         this.buy = true;
         this.refreshItems();
         this.addEventListeners();
         this.visible = true;
         StageManager.getGameStage().visible = false;
         this.buyButton.setText(LangManager.getString(83));
         this.buyButton.removeEventListener(MouseEvent.CLICK,this.onBuy);
         this.buyButton.addEventListener(MouseEvent.CLICK,this.onBuy);
         this.buyButton.visible = false;
         this.shopdtap.visible = false;
         this.confirmBuyDialog.visible = false;
      }
      
      public function showBuyMerchant(data:XMLShopData) : *
      {
         var xsi:XMLShopItem = null;
         if(data != this.shopData)
         {
            this.shopData = data;
         }
         this.setTitle(LangManager.getString(83));
         this.goldText.text = StatsManager.getGold().toString();
         this.hGoldText.text = StatsManager.getHeavenlyGold().toString();
         this.selectedSlotID = -1;
         this.topRow = 0;
         this.currentItemList = this.shopData.sellList;
         for(var i:* = 0; i < this.currentItemList.length; i++)
         {
            this.currentItemList[i].initItem();
         }
         var seed:int = StageManager.getCurrentNode() * QueryManager.instance.getServerDate();
         ItemGenerator.instance.setRNGSeed(seed);
         var rng:RNG = new RNG(seed);
         for(i = 0; i < 8; i++)
         {
            xsi = new XMLShopItem(new XML());
            xsi.initRandomRareMerchantItem(rng);
            this.currentItemList.push(xsi);
         }
         for(i = 0; i < 8; i++)
         {
            xsi = new XMLShopItem(new XML());
            xsi.initRandomLegendaryMerchantPremiumItem(rng);
            this.currentItemList.push(xsi);
         }
         this.totalRows = Math.floor((this.currentItemList.length - 1) / this.cols);
         this.buy = true;
         this.refreshItems();
         this.addEventListeners();
         this.visible = true;
         StageManager.getGameStage().visible = false;
         this.buyButton.setText(LangManager.getString(83));
         this.buyButton.removeEventListener(MouseEvent.CLICK,this.onBuy);
         this.buyButton.addEventListener(MouseEvent.CLICK,this.onBuy);
         this.buyButton.visible = false;
         this.shopdtap.visible = false;
         this.confirmBuyDialog.visible = false;
      }
      
      public function showSell(data:XMLShopData) : void
      {
         var flag:Boolean = false;
         var xmlShopItem:XMLShopItem = null;
         var j:int = 0;
         var itemData:XMLItem = null;
         if(data != this.shopData)
         {
            this.shopData = data;
         }
         this.setTitle(LangManager.getString(84));
         this.goldText.text = StatsManager.getGold().toString();
         this.hGoldText.text = StatsManager.getHeavenlyGold().toString();
         this.selectedSlotID = -1;
         this.topRow = 0;
         this.currentItemList = new Vector.<XMLShopItem>();
         var inventory:Vector.<Item> = StatsManager.inventory;
         var invLength:int = int(inventory.length);
         var buyList:Vector.<XMLShopItem> = this.shopData.buyList;
         var buyListLength:int = int(this.shopData.buyList.length);
         for(var i:int = 0; i < invLength; i++)
         {
            flag = false;
            xmlShopItem = null;
            j = 0;
            while(j < buyListLength && flag == false)
            {
               if(buyList[j].id == inventory[i].itemID)
               {
                  xmlShopItem = buyList[j];
                  this.currentItemList.push(xmlShopItem);
                  flag = true;
               }
               j++;
            }
            if(flag == false)
            {
               itemData = QuestEngine.getItemData(inventory[i].itemID);
               xmlShopItem = XMLShopItem.create(itemData.id,itemData.gvalue,itemData.desc);
               if(!itemData.nodrop)
               {
                  this.currentItemList.push(xmlShopItem);
               }
               else
               {
                  xmlShopItem = null;
               }
            }
            if(xmlShopItem != null)
            {
               xmlShopItem.item = inventory[i];
            }
         }
         this.totalRows = Math.floor((this.currentItemList.length - 1) / this.cols);
         this.buy = false;
         this.refreshItems();
         this.addEventListeners();
         this.buyButton.setText(LangManager.getString(84));
         this.buyButton.removeEventListener(MouseEvent.CLICK,this.onSell);
         this.buyButton.addEventListener(MouseEvent.CLICK,this.onSell);
         this.buyButton.visible = false;
         this.shopdtap.visible = false;
         this.visible = true;
         StageManager.getGameStage().visible = false;
         this.confirmBuyDialog.visible = false;
      }
      
      public function showShopDTAP() : *
      {
         this.shopdtap.visible = true;
         this.updateDT();
         this.updateAP();
      }
      
      public function itemClicked(mouseEvent:MouseEvent) : *
      {
         var slotid:int = 0;
         if(this.selectedSlotID != -1)
         {
            slotid = this.selectedSlotID - this.topRow * this.cols;
            if(slotid >= 0 && slotid < this.totalSlots)
            {
               this.slots[slotid].setGotSelected(false);
            }
         }
         var selectedSlot:ShopItem = ShopItem(mouseEvent.target);
         selectedSlot.setGotSelected(true);
         this.selectedSlotID = this.topRow * this.cols + selectedSlot.id;
         this.displayItem.setItemID(selectedSlot.itemID,selectedSlot.getBorderType(),selectedSlot.getPrimaryColor(),selectedSlot.getSecondaryColor());
         this.displayItem.setItem(selectedSlot.item);
         this.displayItem.setCost(selectedSlot.getCost(),selectedSlot.getHCost());
         this.displayItem.visible = true;
         var itemData:XMLItem = QuestEngine.getItemData(selectedSlot.itemID);
         if(itemData != null)
         {
            this.itemName.htmlText = selectedSlot.item.getNameBlackBG();
            this.itemDesc.text = "";
            if(selectedSlot.item.getDesc() == "")
            {
               this.itemDesc.htmlText = selectedSlot.item.getCompareAttributes();
            }
            else
            {
               this.itemDesc.htmlText = selectedSlot.item.getDesc() + "\n\n" + selectedSlot.item.getCompareAttributes();
            }
            if(this.displayItem.itemID == 2208 || this.displayItem.itemID == 2209)
            {
               this.itemQty.text = "";
            }
            else if(this.buy)
            {
               this.itemQty.text = LangManager.getString(87) + StatsManager.countItemType(this.displayItem.itemID);
            }
            else if(QuestEngine.getItemData(selectedSlot.itemID).unique == 0 && selectedSlot.item.getModifierCount() == 0 && selectedSlot.item.uses == 0 || this.displayItem.itemID < 3000)
            {
               this.itemQty.text = LangManager.getString(87) + StatsManager.getItemQty(this.displayItem.itemID);
            }
            else
            {
               this.itemQty.text = "";
            }
         }
         this.buyButton.visible = true;
      }
      
      public function onScrollUp(mouseEvent:MouseEvent) : void
      {
         if(this.topRow > 0)
         {
            --this.topRow;
            this.refreshItems();
         }
      }
      
      public function onScrollDown(mouseEvent:MouseEvent) : void
      {
         if(this.topRow < this.totalRows)
         {
            ++this.topRow;
            this.refreshItems();
         }
      }
      
      public function refreshItems() : *
      {
         var maxDisplay:int = 0;
         var slot:ShopItem = null;
         var index:int = 0;
         var prevSlotCount:int = this.topRow * this.cols;
         var maxItem:int = int(this.currentItemList.length);
         this.scrollUp.visible = this.topRow > 0;
         this.scrollDown.visible = Math.ceil(maxItem / this.cols) - this.topRow > this.rows;
         if(maxItem - prevSlotCount < this.totalSlots)
         {
            maxDisplay = maxItem - prevSlotCount;
         }
         else
         {
            maxDisplay = this.totalSlots;
         }
         for(var i:int = 0; i < this.totalSlots; i++)
         {
            slot = this.slots[i];
            if(i >= maxDisplay)
            {
               slot.visible = false;
            }
            else
            {
               index = prevSlotCount + i;
               slot.setItemID(this.currentItemList[index].id,"normal",this.currentItemList[index].item.getPrimaryColor(),this.currentItemList[index].item.getSecondaryColor());
               slot.setItem(this.currentItemList[index].item);
               if(this.buy)
               {
                  slot.setCost(this.currentItemList[index].value,this.currentItemList[index].hvalue);
               }
               else if(slot.getItemID() == 13002)
               {
                  slot.setCost(0,0);
               }
               else
               {
                  slot.setCost(slot.getItem().getSellAmt(),0);
               }
               slot.visible = true;
               slot.setGotSelected(index == this.selectedSlotID);
            }
         }
      }
      
      internal function onDoubleClickBuy(mouseEvent:MouseEvent) : *
      {
         this.onBuy(mouseEvent);
      }
      
      internal function onBuy(mouseEvent:MouseEvent) : *
      {
         var hp:int = 0;
         var maxhp:int = 0;
         var chi:int = 0;
         var maxchi:int = 0;
         var itemData:XMLItem = QuestEngine.getItemData(this.displayItem.itemID);
         if(this.displayItem.getHCost() < itemData.hvalue)
         {
            QueryManager.instance.reportHack("shop buy");
            return;
         }
         if(this.displayItem.getHCost() > 0)
         {
            if(this.displayItem.itemID == 2208)
            {
               if(StatsManager.isCoinPurseFull())
               {
                  OverworldHUD.instance.showDialog(LangManager.getString(356),LangManager.getString(5));
                  OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
                  return;
               }
            }
            else if(this.displayItem.itemID == 2209)
            {
               hp = StatsManager.getPlayerStats(StatsManager.STAT_HP);
               maxhp = StatsManager.getPlayerStats(StatsManager.STAT_MAXHP) + StatsManager.findBonusStat(StatsManager.STAT_MAXHP);
               chi = StatsManager.getPlayerStats(StatsManager.STAT_CHI);
               maxchi = StatsManager.getPlayerStats(StatsManager.STAT_MAXCHI) + StatsManager.findBonusStat(StatsManager.STAT_MAXCHI);
               if(hp >= maxhp && chi >= maxchi)
               {
                  OverworldHUD.instance.showDialog(LangManager.getString(685),LangManager.getString(5));
                  OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
                  return;
               }
            }
            if(StatsManager.getHeavenlyGold() < this.displayItem.getHCost())
            {
               OverworldHUD.instance.onShowGetGoldPromptDialog(this.displayItem.getHCost() - StatsManager.getHeavenlyGold());
            }
            else
            {
               setChildIndex(this.confirmBuyDialog,numChildren - 1);
               this.confirmBuyDialog.show(this.displayItem.item.getNameBlackBG());
            }
         }
         else
         {
            this.purchaseSuccess();
         }
      }
      
      internal function purchaseError() : *
      {
         OverworldHUD.instance.showDialog(LangManager.getString(88),LangManager.getString(5));
         OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
      }
      
      public function purchaseSuccess() : *
      {
         var itemData:XMLItem = QuestEngine.getItemData(this.displayItem.itemID);
         if(this.displayItem.getHCost() < itemData.hvalue)
         {
            QueryManager.instance.reportHack("shop buy");
            return;
         }
         if(StatsManager.getGold() >= this.displayItem.getCost() && NetworkManager.instance.isGlobalPIOConnected())
         {
            if(this.displayItem.itemID == 2208)
            {
               StatsManager.changeGold(1000);
               SoundManager.instance.playGoodKoto();
            }
            else if(this.displayItem.itemID == 2209)
            {
               StatsManager.fullHealth();
               SoundManager.instance.playGoodKoto();
            }
            else if(this.displayItem.itemID == 2212)
            {
               StatsManager.addItemToInventory(this.displayItem.getItem());
               QueryManager.instance.reportDataModified(StatsManager.ITEM);
               this.onLeave(null);
               OverworldHUD.instance.interactUI.hide();
               OverworldHUD.instance.showCreateClanDialog(false);
            }
            else if(this.displayItem.itemID == 2215)
            {
               StatsManager.addItemToInventory(this.displayItem.getItem());
               QueryManager.instance.reportDataModified(StatsManager.ITEM);
               this.onLeave(null);
               OverworldHUD.instance.interactUI.hide();
               OverworldHUD.instance.showCreateClanDialog(true);
            }
            else
            {
               if(this.displayItem.getItem().canStack())
               {
                  this.itemQty.text = LangManager.getString(87) + StatsManager.changeItemQty(this.displayItem.itemID,1).toString();
               }
               else
               {
                  StatsManager.addItemToInventory(this.displayItem.getItem());
                  this.itemQty.text = LangManager.getString(87) + StatsManager.countItemType(this.displayItem.itemID).toString();
               }
               QueryManager.instance.reportDataModified(StatsManager.ITEM);
            }
            this.goldText.text = StatsManager.changeGold(-this.displayItem.getCost()).toString();
            StatsManager.reportAchievementStat(60006,this.displayItem.getCost());
            this.hGoldText.text = StatsManager.getHeavenlyGold().toString();
            if(this.displayItem.getHCost() > 0)
            {
               QueryManager.instance.reportPremiumBuy(this.displayItem.itemID,this.displayItem.item.toStringNoQty(),this.displayItem.getHCost());
            }
         }
         else
         {
            OverworldHUD.instance.showDialog(LangManager.getString(88),LangManager.getString(5));
            OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
         }
      }
      
      public function onSell(mouseEvent:MouseEvent) : void
      {
         var index:int = 0;
         var newQty:int = 0;
         StatsManager.changeGold(this.displayItem.getCost());
         if(QuestEngine.getItemData(this.displayItem.itemID).unique == 0 && this.displayItem.item.getModifierCount() == 0 && this.displayItem.item.uses == 0)
         {
            newQty = StatsManager.changeItemQty(this.displayItem.itemID,-1);
         }
         else
         {
            newQty = 0;
            StatsManager.removeItemFromInventory(this.displayItem.item);
         }
         if(newQty <= 0)
         {
            this.displayItem.visible = false;
            this.buyButton.visible = false;
            this.itemName.htmlText = "";
            this.itemQty.text = "";
            this.itemDesc.text = "";
            index = this.selectedSlotID;
            this.currentItemList.splice(index,1);
            this.totalRows = Math.floor((this.currentItemList.length - 1) / this.cols);
            if(this.totalRows < 0)
            {
               this.topRow = 0;
               this.totalRows = 0;
            }
            this.selectedSlotID = -1;
            this.refreshItems();
         }
         else
         {
            this.itemQty.text = LangManager.getString(87) + newQty;
         }
         QueryManager.instance.reportDataModified(StatsManager.ITEM);
         this.goldText.text = StatsManager.getGold().toString();
      }
      
      public function onLeave(mouseEvent:MouseEvent) : void
      {
         this.topRow = 0;
         this.displayItem.visible = false;
         this.itemName.htmlText = "";
         this.itemDesc.text = "";
         this.itemQty.text = "";
         this.buyButton.visible = false;
         this.removeEventListeners();
         QueryManager.instance.saveModifiedCharData();
         this.visible = false;
         StageManager.getGameStage().visible = true;
         OverworldHUD.instance.interactUI.updateMoney();
         if(this.changeInputMode)
         {
            InputManager.setAdventureMode();
         }
         this.changeInputMode = false;
      }
      
      public function notifyChangeInputMode() : *
      {
         this.changeInputMode = true;
      }
      
      public function addEventListeners() : void
      {
         this.scrollUp.addEventListener(MouseEvent.CLICK,this.onScrollUp);
         this.scrollDown.addEventListener(MouseEvent.CLICK,this.onScrollDown);
         this.leaveButton.addEventListener(MouseEvent.CLICK,this.onLeave);
         this.buyButton.addEventListeners();
         this.payUIButton.addEventListener(MouseEvent.CLICK,this.getGoldClick);
         for(var i:int = 0; i < this.totalSlots; i++)
         {
            this.slots[i].addEventListener(MouseEvent.CLICK,this.itemClicked);
            this.slots[i].addEventListeners();
            if(this.buy)
            {
               this.slots[i].addEventListener(MouseEvent.DOUBLE_CLICK,this.onDoubleClickBuy);
            }
            else
            {
               this.slots[i].addEventListener(MouseEvent.DOUBLE_CLICK,this.onSell);
            }
         }
         this.bgPopUpButton.cacheAsBitmap = true;
      }
      
      public function removeEventListeners() : void
      {
         this.leaveButton.removeEventListener(MouseEvent.CLICK,this.onLeave);
         this.scrollUp.removeEventListener(MouseEvent.CLICK,this.onScrollUp);
         this.scrollDown.removeEventListener(MouseEvent.CLICK,this.onScrollDown);
         if(this.buy)
         {
            this.buyButton.removeEventListener(MouseEvent.CLICK,this.onBuy);
         }
         else
         {
            this.buyButton.removeEventListener(MouseEvent.CLICK,this.onSell);
         }
         this.buyButton.removeEventListeners();
         this.payUIButton.removeEventListener(MouseEvent.CLICK,this.getGoldClick);
         for(var i:int = 0; i < this.totalSlots; i++)
         {
            this.slots[i].removeEventListener(MouseEvent.CLICK,this.itemClicked);
            this.slots[i].removeEventListeners();
            if(this.buy)
            {
               this.slots[i].removeEventListener(MouseEvent.DOUBLE_CLICK,this.onDoubleClickBuy);
            }
            else
            {
               this.slots[i].removeEventListener(MouseEvent.DOUBLE_CLICK,this.onSell);
            }
         }
         this.bgPopUpButton.cacheAsBitmap = false;
      }
      
      internal function getGoldClick(mouseEvent:MouseEvent) : *
      {
         OverworldHUD.instance.payUI.show();
      }
      
      public function updateDT() : *
      {
         if(this.shopdtap.visible)
         {
            this.shopdtap.tokenText.text = StatsManager.getStat(StatsManager.STAT_DUELTOKENS) + "/" + StatsManager.MAXDUELTOKENS;
         }
      }
      
      public function updateAP() : *
      {
         var charAP:int = 0;
         var charMaxAP:int = 0;
         if(this.shopdtap.visible)
         {
            charAP = StatsManager.getStat(13);
            charMaxAP = StatsManager.getStat(14);
            this.shopdtap.APtext.text = charAP + " / " + charMaxAP;
            this.shopdtap.APtextshadow.text = this.shopdtap.APtext.text;
            this.shopdtap.APbar.bar.scaleX = charAP / charMaxAP;
         }
      }
      
      public function updateHGold() : *
      {
         this.hGoldText.text = StatsManager.getHeavenlyGold().toString();
      }
   }
}

