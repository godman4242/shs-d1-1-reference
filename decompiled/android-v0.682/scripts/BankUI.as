package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.*;
   import flash.text.TextField;
   import flash.utils.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1344")]
   public class BankUI extends MovieClip
   {
      
      public static var instance:BankUI;
      
      internal static var CONTEXT_USE:int = 0;
      
      internal static var CONTEXT_UNEQUIP:int = 1;
      
      internal static var CONTEXT_EQUIP:int = 2;
      
      internal static var CONTEXT_TOSTORAGE:int = 3;
      
      internal static var CONTEXT_TOPLAYER:int = 4;
      
      public var increasebutton:GoldButton;
      
      public var DefBonusAmount:TextField;
      
      public var AtkAmount:TextField;
      
      public var xplabel:TextField;
      
      public var WeightAmount:TextField;
      
      public var coinslabel:TextField;
      
      public var APbarTextshadow:TextField;
      
      public var XPbar:MovieClip;
      
      public var contextButton:RedButton;
      
      public var APadd:SimpleButton;
      
      public var CHIadd:SimpleButton;
      
      public var tokenlabel:TextField;
      
      public var hGoldText:TextField;
      
      public var goldText:TextField;
      
      public var HPbar:MovieClip;
      
      public var storageScrollDown:ScrollButton;
      
      public var HPbarTextshadow:TextField;
      
      public var APbarText:TextField;
      
      public var XPbarText:TextField;
      
      public var chibaricon:TextField;
      
      public var invLabel:TextField;
      
      public var goldicon:MovieClip;
      
      public var damagerangetext:TextField;
      
      public var HPbarText:TextField;
      
      public var APregen:TextField;
      
      public var XPbarTextShadow:TextField;
      
      public var DefAmount:TextField;
      
      public var atkbaricon:TextField;
      
      public var statPoints:TextField;
      
      public var dragitem:ShopItem;
      
      public var descScrollDown:ScrollButton;
      
      public var defbaricon:TextField;
      
      public var storageWeightLabel:TextField;
      
      public var SPDadd:SimpleButton;
      
      public var tokenText:TextField;
      
      public var SpdBonusAmount:TextField;
      
      public var AtkBonusAmount:TextField;
      
      public var autoassignlabel:TextField;
      
      public var CharLvl:TextField;
      
      public var popUp:MovieClip;
      
      public var ChibarText:TextField;
      
      public var CHIbar:MovieClip;
      
      public var APbar:MovieClip;
      
      public var storageLabel:TextField;
      
      public var HPadd:SimpleButton;
      
      public var inventoryScrollDown:ScrollButton;
      
      public var titletext:TextField;
      
      public var ATKadd:SimpleButton;
      
      public var apbaricon:TextField;
      
      public var closeWindow:SimpleButton;
      
      public var DEFadd:SimpleButton;
      
      public var inventoryScrollUp:ScrollButton;
      
      public var goldlabel:TextField;
      
      public var SpdAmount:TextField;
      
      public var hpbaricon:TextField;
      
      public var bgPopUpButton:MovieClip;
      
      public var storageScrollUp:ScrollButton;
      
      public var autoAssignCheckBox:AssignBox;
      
      public var spdbaricon:TextField;
      
      public var ChibarTextshadow:TextField;
      
      internal var inventory:Vector.<Item>;
      
      internal var storage:Vector.<Item>;
      
      internal var storageWeight:int;
      
      internal var storageMaxWeight:int;
      
      internal var totalRows:int;
      
      internal var topRow:int;
      
      internal var selectedSlot:ShopItem;
      
      internal var selectedSlotItem:Item;
      
      internal var selectedSlotID:int = -1;
      
      internal var storage_selectedSlotID:int = -1;
      
      internal var contextAction:int = 0;
      
      internal var startX:int = 380;
      
      internal var startY:int = 268;
      
      internal var spacingX:int = 80;
      
      internal var spacingY:int = 80;
      
      internal var cols:int = 4;
      
      internal var rows:int = 2;
      
      internal var totalSlots:int;
      
      internal var slots:Vector.<ShopItem>;
      
      internal var storage_totalRows:int;
      
      internal var storage_topRow:int;
      
      internal var storage_startX:int = 60;
      
      internal var storage_startY:int = 106;
      
      internal var storage_cols:int = 3;
      
      internal var storage_rows:int = 4;
      
      internal var storage_totalSlots:int;
      
      internal var storageSlots:Vector.<ShopItem>;
      
      internal var mousedown:Boolean;
      
      internal var dragequipflag:Boolean;
      
      public function BankUI()
      {
         var slot:ShopItem = null;
         var xpos:int = 0;
         var ypos:int = 0;
         var i:int = 0;
         this.totalSlots = this.cols * this.rows;
         this.slots = new Vector.<ShopItem>(this.totalSlots);
         this.storage_totalSlots = this.storage_cols * this.storage_rows;
         this.storageSlots = new Vector.<ShopItem>(this.storage_totalSlots);
         super();
         instance = this;
         LangManager.initTextField(this.storageLabel,true);
         LangManager.initTextField(this.invLabel,true);
         LangManager.initTextField(this.storageWeightLabel,true);
         LangManager.initTextField(this.WeightAmount,true);
         LangManager.initTextField(this.popUp.selectItemName,true);
         LangManager.initTextField(this.popUp.selectItemAttribute,true);
         LangManager.initTextField(this.damagerangetext,true);
         LangManager.initTextField(this.goldlabel,true);
         this.goldlabel.text = LangManager.getString(64);
         this.contextButton.visible = false;
         this.popUp.selectItem.setDisplayOnly();
         this.popUpClose(null);
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
         for(i = 0; i < this.storage_totalSlots; i++)
         {
            slot = new ShopItem();
            addChild(slot);
            ypos = Math.floor(i / this.storage_cols);
            xpos = i - ypos * this.storage_cols;
            slot.x = this.storage_startX + xpos * this.spacingX;
            slot.y = this.storage_startY + ypos * this.spacingY;
            slot.id = i;
            this.storageSlots[i] = slot;
            this.storageSlots[i].doubleClickEnabled = true;
            this.storageSlots[i].mouseChildren = false;
         }
         this.storageSlots.fixed = true;
         this.dragitem.visible = false;
      }
      
      public function show() : *
      {
         this.titletext.text = LangManager.getString(681);
         this.storageLabel.text = LangManager.getString(681);
         this.invLabel.text = LangManager.getString(682);
         this.increasebutton.setText(LangManager.getString(691));
         this.storageMaxWeight = 100 + StatsManager.getPlayerStats(StatsManager.STAT_DAN) * 10 + StatsManager.getPlayerStats(StatsManager.STAT_PAIDSTORAGE) * 10;
         this.inventory = StatsManager.inventory;
         this.inventory = this.inventory.concat(StatsManager.questItems);
         this.storage = StatsManager.stash;
         this.totalRows = Math.floor((this.inventory.length - 1) / this.cols);
         this.topRow = 0;
         this.selectedSlotID = -1;
         this.refreshInventory();
         this.storage_totalRows = Math.floor((this.storage.length - 1) / this.storage_cols);
         this.storage_topRow = 0;
         this.storage_selectedSlotID = -1;
         this.refreshStorage();
         this.selectedSlot = null;
         this.selectedSlotItem = null;
         this.visible = true;
         StageManager.getGameStage().visible = false;
         this.dragitem.costText.text = "";
         setChildIndex(this.dragitem,numChildren - 1);
         if(GameEngine.isAdventureMode())
         {
            NetworkManager.instance.playerUpdateBusy(true);
         }
         this.addEventListeners();
         if(this.inventory.length > 0)
         {
            this.clickInventory(this.slots[0]);
         }
         else if(this.storage.length > 0)
         {
            this.clickStorage(this.storageSlots[0]);
         }
         this.hGoldText.text = StatsManager.getHeavenlyGold().toString();
      }
      
      public function refreshInventory() : *
      {
         var maxDisplay:int = 0;
         var slot:ShopItem = null;
         var index:int = 0;
         var prevSlotCount:int = this.topRow * this.cols;
         var maxItem:int = int(this.inventory.length);
         this.inventoryScrollUp.visible = this.topRow > 0;
         this.inventoryScrollDown.visible = Math.ceil(maxItem / this.cols) - this.topRow > this.rows;
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
               slot.setItemID(this.inventory[index].itemID,this.inventory[index].getShopItemType(),this.inventory[index].getPrimaryColor(),this.inventory[index].getSecondaryColor());
               slot.setItem(this.inventory[index]);
               if(this.inventory[index].canStack())
               {
                  slot.setQtyText("x" + this.inventory[index].getQuantity().toString());
               }
               else
               {
                  slot.setQtyText("");
               }
               slot.visible = true;
               if(index == this.selectedSlotID)
               {
                  slot.setGotSelected(true);
                  this.selectedSlot = slot;
               }
               else
               {
                  slot.setGotSelected(false);
               }
            }
         }
         this.WeightAmount.text = LangManager.getString(139) + ": " + StatsManager.findWeight() + " / " + StatsManager.getCarryingWeight().toString();
         if(StatsManager.findWeight() > StatsManager.getCarryingWeight())
         {
            this.WeightAmount.textColor = 16711680;
         }
         else
         {
            this.WeightAmount.textColor = 16777215;
         }
      }
      
      public function refreshStorage() : *
      {
         var maxDisplay:int = 0;
         var slot:ShopItem = null;
         var index:int = 0;
         var prevSlotCount:int = this.storage_topRow * this.storage_cols;
         var maxItem:int = int(this.storage.length);
         this.storageScrollUp.visible = this.storage_topRow > 0;
         this.storageScrollDown.visible = Math.ceil(maxItem / this.storage_cols) - this.storage_topRow > this.storage_rows;
         if(maxItem - prevSlotCount < this.storage_totalSlots)
         {
            maxDisplay = maxItem - prevSlotCount;
         }
         else
         {
            maxDisplay = this.storage_totalSlots;
         }
         for(var i:int = 0; i < this.storage_totalSlots; i++)
         {
            slot = this.storageSlots[i];
            if(i >= maxDisplay)
            {
               slot.visible = false;
            }
            else
            {
               index = prevSlotCount + i;
               slot.setItemID(this.storage[index].itemID,this.storage[index].getShopItemType(),this.storage[index].getPrimaryColor(),this.storage[index].getSecondaryColor());
               slot.setItem(this.storage[index]);
               if(this.storage[index].canStack())
               {
                  slot.setQtyText("x" + this.storage[index].getQuantity().toString());
               }
               else
               {
                  slot.setQtyText("");
               }
               slot.visible = true;
               if(index == this.storage_selectedSlotID)
               {
                  slot.setGotSelected(true);
                  this.selectedSlot = slot;
               }
               else
               {
                  slot.setGotSelected(false);
               }
            }
         }
         this.storageWeight = 0;
         for(i = 0; i < maxItem; i++)
         {
            this.storageWeight += this.storage[i].getWeight();
         }
         this.storageWeightLabel.text = LangManager.getString(139) + ": " + this.storageWeight + " / " + this.storageMaxWeight;
         if(this.storageWeight > this.storageMaxWeight)
         {
            this.storageWeightLabel.textColor = 16711680;
         }
         else
         {
            this.storageWeightLabel.textColor = 16777215;
         }
      }
      
      internal function findWeaponDamageRange() : String
      {
         var minDamage:int = StatsManager.getMinDamage();
         return minDamage + " - " + (minDamage + StatsManager.getDamageRange()) + " " + LangManager.getString(142);
      }
      
      public function addEventListeners() : void
      {
         this.contextButton.addEventListener(MouseEvent.CLICK,this.onClickContextButton);
         this.contextButton.addEventListeners();
         this.closeWindow.addEventListener(MouseEvent.CLICK,this.onLeave);
         this.inventoryScrollUp.addEventListener(MouseEvent.CLICK,this.onScrollUp);
         this.inventoryScrollDown.addEventListener(MouseEvent.CLICK,this.onScrollDown);
         this.storageScrollUp.addEventListener(MouseEvent.CLICK,this.onStorageScrollUp);
         this.storageScrollDown.addEventListener(MouseEvent.CLICK,this.onStorageScrollDown);
         this.increasebutton.addEventListener(MouseEvent.CLICK,this.onIncreaseClick);
         for(var i:int = 0; i < this.totalSlots; i++)
         {
            this.slots[i].addEventListener(MouseEvent.CLICK,this.onClickInventory);
            this.slots[i].addEventListener(MouseEvent.DOUBLE_CLICK,this.onDoubleClickInventory);
            this.slots[i].addEventListeners();
            this.slots[i].addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDOWN);
            this.slots[i].addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseDRAG);
         }
         for(i = 0; i < this.storage_totalSlots; i++)
         {
            this.storageSlots[i].addEventListener(MouseEvent.CLICK,this.onClickStorage);
            this.storageSlots[i].addEventListener(MouseEvent.DOUBLE_CLICK,this.onDoubleClickStorage);
            this.storageSlots[i].addEventListeners();
            this.storageSlots[i].addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDOWN);
            this.storageSlots[i].addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseDRAG);
         }
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUP);
         this.dragitem.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUP);
         this.bgPopUpButton.cacheAsBitmap = true;
      }
      
      public function removeEventListeners() : void
      {
         this.contextButton.removeEventListener(MouseEvent.CLICK,this.onClickContextButton);
         this.contextButton.removeEventListeners();
         this.closeWindow.removeEventListener(MouseEvent.CLICK,this.onLeave);
         this.inventoryScrollUp.removeEventListener(MouseEvent.CLICK,this.onScrollUp);
         this.inventoryScrollDown.removeEventListener(MouseEvent.CLICK,this.onScrollDown);
         this.storageScrollUp.removeEventListener(MouseEvent.CLICK,this.onStorageScrollUp);
         this.storageScrollDown.removeEventListener(MouseEvent.CLICK,this.onStorageScrollDown);
         this.increasebutton.removeEventListener(MouseEvent.CLICK,this.onIncreaseClick);
         for(var i:int = 0; i < this.totalSlots; i++)
         {
            this.slots[i].removeEventListener(MouseEvent.CLICK,this.onClickInventory);
            this.slots[i].removeEventListener(MouseEvent.DOUBLE_CLICK,this.onDoubleClickInventory);
            this.slots[i].removeEventListeners();
            this.slots[i].removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDOWN);
            this.slots[i].removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseDRAG);
         }
         for(i = 0; i < this.storage_totalSlots; i++)
         {
            this.storageSlots[i].removeEventListener(MouseEvent.CLICK,this.onClickStorage);
            this.storageSlots[i].removeEventListener(MouseEvent.DOUBLE_CLICK,this.onDoubleClickStorage);
            this.storageSlots[i].removeEventListeners();
            this.storageSlots[i].removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDOWN);
            this.storageSlots[i].removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseDRAG);
         }
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUP);
         this.dragitem.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUP);
         this.bgPopUpButton.cacheAsBitmap = false;
      }
      
      public function onScrollUp(mouseEvent:MouseEvent) : void
      {
         if(this.topRow > 0)
         {
            --this.topRow;
            this.refreshInventory();
         }
      }
      
      public function onScrollDown(mouseEvent:MouseEvent) : void
      {
         if(this.topRow < this.totalRows)
         {
            ++this.topRow;
            this.refreshInventory();
         }
      }
      
      public function onStorageScrollUp(mouseEvent:MouseEvent) : void
      {
         if(this.storage_topRow > 0)
         {
            --this.storage_topRow;
            this.refreshStorage();
         }
      }
      
      public function onStorageScrollDown(mouseEvent:MouseEvent) : void
      {
         if(this.storage_topRow < this.storage_totalRows)
         {
            ++this.storage_topRow;
            this.refreshStorage();
         }
      }
      
      public function onIncreaseClick(mouseEvent:MouseEvent) : void
      {
         StatsManager.spendHeavenlyGold(1,this.purchaseSuccess,this.purchaseError);
      }
      
      internal function purchaseSuccess() : *
      {
         QueryManager.instance.reportPremiumBuy(5,"addstorage",1);
         StatsManager.changeStat(StatsManager.STAT_PAIDSTORAGE,1);
         QueryManager.instance.saveModifiedCharData();
         this.storageMaxWeight = 100 + StatsManager.getPlayerStats(StatsManager.STAT_DAN) * 10 + StatsManager.getPlayerStats(StatsManager.STAT_PAIDSTORAGE) * 10;
         this.refreshStorage();
         this.hGoldText.text = StatsManager.getHeavenlyGold().toString();
         SoundManager.instance.playGoodKoto();
      }
      
      internal function purchaseError() : *
      {
         OverworldHUD.instance.onShowGetGoldPromptDialog(1);
      }
      
      internal function onClickDescScroll(mouseEvent:MouseEvent) : *
      {
         if(this.popUp.selectItemAttribute.scrollV == this.popUp.selectItemAttribute.numLines - 7)
         {
            this.popUp.selectItemAttribute.scrollV = 0;
         }
         else
         {
            ++this.popUp.selectItemAttribute.scrollV;
         }
      }
      
      public function onLeave(event:MouseEvent) : void
      {
         if(GameEngine.isOverworld())
         {
            Overworld.refreshMap();
            Overworld.showOverworldHUD();
            Overworld.showOverworldMap(true);
         }
         else
         {
            NetworkManager.instance.playerUpdateBusy(false);
            InputManager.setAdventureMode();
         }
         OverworldHUD.instance.updateHUD();
         QueryManager.instance.saveModifiedCharData();
         this.popUpClose(null);
         this.removeEventListeners();
         this.visible = false;
         StageManager.getGameStage().visible = true;
      }
      
      internal function popUpOpen() : *
      {
         this.popUp.visible = true;
         this.descScrollDown.addEventListener(MouseEvent.CLICK,this.onClickDescScroll);
      }
      
      internal function popUpClose(event:MouseEvent) : *
      {
         this.popUp.selectItemName.text = "";
         this.popUp.selectItemAttribute.htmlText = "";
         this.descScrollDown.removeEventListener(MouseEvent.CLICK,this.onClickDescScroll);
         if(this.selectedSlot != null)
         {
            this.selectedSlot.setGotSelected(false);
            this.selectedSlot = null;
            this.selectedSlotItem = null;
         }
         this.selectedSlotID = -1;
         this.storage_selectedSlotID = -1;
         this.contextButton.visible = false;
         this.popUp.visible = false;
         this.descScrollDown.visible = false;
      }
      
      internal function setContextButton(context:int) : *
      {
         switch(context)
         {
            case CONTEXT_TOSTORAGE:
               this.contextButton.setText(LangManager.getString(683));
               this.contextButton.x = 380;
               break;
            case CONTEXT_TOPLAYER:
               this.contextButton.setText(LangManager.getString(684));
               this.contextButton.x = 205;
         }
         this.contextAction = context;
      }
      
      public function onClickContextButton(mouseEvent:MouseEvent) : *
      {
         switch(this.contextAction)
         {
            case CONTEXT_TOSTORAGE:
               this.onTransferToStorage();
               break;
            case CONTEXT_TOPLAYER:
               this.onTransferToInventory();
         }
      }
      
      public function onTransferToStorage() : void
      {
         var max:int = 0;
         var i:int = 0;
         if(this.selectedSlotItem.isQuestItem() && !this.selectedSlotItem.isOre() || this.selectedSlotItem.isPickableQuestItem() || this.selectedSlotItem.isTradeQuestItem() || !this.selectedSlotItem.canDrop())
         {
            OverworldHUD.instance.showDialog(LangManager.getString(700),LangManager.getString(5));
            return;
         }
         if(this.storageWeight + this.selectedSlotItem.getWeight() / this.selectedSlotItem.getQuantity() > this.storageMaxWeight)
         {
            OverworldHUD.instance.showDialogIncreaseStorage();
            return;
         }
         var closePopUp:Boolean = this.selectedSlotItem.getQuantity() == 1;
         StatsManager.removeItemFromInventory(this.selectedSlotItem);
         this.inventory = StatsManager.inventory.concat(StatsManager.questItems);
         this.totalRows = Math.floor((this.inventory.length - 1) / this.cols);
         if(this.totalRows < 0)
         {
            this.topRow = 0;
            this.totalRows = 0;
         }
         StatsManager.addItemToStash(this.selectedSlotItem);
         this.storage_totalRows = Math.floor((this.storage.length - 1) / this.storage_cols);
         if(this.storage_totalRows < 0)
         {
            this.storage_topRow = 0;
            this.storage_totalRows = 0;
         }
         if(closePopUp)
         {
            max = int(this.storage.length);
            for(i = 0; i < max; i++)
            {
               if(this.storage[i].equals(this.selectedSlotItem))
               {
                  this.storage_selectedSlotID = i;
                  this.selectedSlotID = -1;
                  i -= this.storage_cols * this.storage_topRow;
                  if(i >= 0 && i < this.storage_totalSlots - 1)
                  {
                     this.storageSlots[i].setGotSelected(true);
                     this.selectedSlot = this.storageSlots[i];
                  }
                  this.setContextButton(CONTEXT_TOPLAYER);
                  break;
               }
            }
         }
         this.refreshInventory();
         this.refreshStorage();
         QueryManager.instance.reportDataModified(StatsManager.ITEM);
         QueryManager.instance.reportDataModified(StatsManager.STASH);
      }
      
      public function onTransferToInventory() : void
      {
         var max:int = 0;
         var i:int = 0;
         var closePopUp:Boolean = this.selectedSlotItem.getQuantity() == 1;
         if(this.selectedSlotItem.canStack())
         {
            StatsManager.addItemToInventory(new Item(this.selectedSlotItem.itemID));
         }
         else
         {
            StatsManager.addItemToInventory(this.selectedSlotItem);
         }
         this.inventory = StatsManager.inventory.concat(StatsManager.questItems);
         this.totalRows = Math.floor((this.inventory.length - 1) / this.cols);
         if(this.totalRows < 0)
         {
            this.topRow = 0;
            this.totalRows = 0;
         }
         StatsManager.removeItemFromStash(this.selectedSlotItem);
         this.storage_totalRows = Math.floor((this.storage.length - 1) / this.storage_cols);
         if(this.storage_totalRows < 0)
         {
            this.storage_topRow = 0;
            this.storage_totalRows = 0;
         }
         if(closePopUp)
         {
            max = int(this.inventory.length);
            for(i = 0; i < max; i++)
            {
               if(this.inventory[i].equals(this.selectedSlotItem))
               {
                  this.storage_selectedSlotID = -1;
                  this.selectedSlotID = i;
                  i -= this.cols * this.topRow;
                  if(i < this.totalSlots - 1)
                  {
                     this.slots[i].setGotSelected(true);
                     this.selectedSlot = this.slots[i];
                  }
                  this.setContextButton(CONTEXT_TOSTORAGE);
                  break;
               }
            }
         }
         this.refreshInventory();
         this.refreshStorage();
         QueryManager.instance.reportDataModified(StatsManager.ITEM);
         QueryManager.instance.reportDataModified(StatsManager.STASH);
      }
      
      public function onMouseDOWN(mouseEvent:MouseEvent) : *
      {
         this.mousedown = true;
         this.dragitem.setItemID(mouseEvent.target.itemID,mouseEvent.target.getBorderType(),mouseEvent.target.getPrimaryColor(),mouseEvent.target.getSecondaryColor());
         this.dragitem.x = mouseX - 35;
         this.dragitem.y = mouseY - 35;
         if((mouseEvent.stageX - StatsManager.stageOffsetX) / StatsManager.stageScale < 355)
         {
            this.onClickStorage(mouseEvent);
            this.dragequipflag = true;
         }
         else
         {
            this.onClickInventory(mouseEvent);
            this.dragequipflag = false;
         }
      }
      
      public function onMouseDRAG(mouseEvent:MouseEvent) : *
      {
         if(this.mousedown && !this.dragitem.visible)
         {
            if(!StatsManager.isMobile)
            {
               this.dragitem.alpha = 0.8;
            }
            this.dragitem.visible = true;
            this.dragitem.cacheAsBitmap = true;
            this.dragitem.startDrag();
         }
      }
      
      public function onMouseUP(mouseEvent:MouseEvent) : *
      {
         if(this.mousedown && this.dragitem.visible)
         {
            this.dragitem.stopDrag();
            if(this.dragitem.x < 355)
            {
               if(!this.dragequipflag)
               {
                  this.onTransferToStorage();
               }
            }
            else if(this.dragequipflag)
            {
               this.onTransferToInventory();
            }
            this.dragitem.visible = false;
            this.dragitem.cacheAsBitmap = false;
         }
         this.mousedown = false;
      }
      
      public function onClickInventory(mouseEvent:MouseEvent) : void
      {
         var clickedItem:ShopItem = ShopItem(mouseEvent.currentTarget);
         this.clickInventory(clickedItem);
      }
      
      public function clickInventory(clickedItem:ShopItem) : void
      {
         for(var i:int = 0; i < this.totalSlots; i++)
         {
            this.slots[i].setGotSelected(false);
         }
         if(this.selectedSlot != null)
         {
            this.selectedSlot.setGotSelected(false);
         }
         this.selectedSlot = clickedItem;
         this.selectedSlotItem = clickedItem.item;
         this.selectedSlot.setGotSelected(true);
         this.selectedSlotID = this.topRow * this.cols + this.selectedSlot.id;
         this.storage_selectedSlotID = -1;
         this.popUpOpen();
         this.popUp.selectItem.setItemID(clickedItem.itemID,clickedItem.getBorderType(),clickedItem.getPrimaryColor(),clickedItem.getSecondaryColor());
         this.popUp.selectItem.setQtyText("");
         this.popUp.selectItemName.htmlText = this.selectedSlotItem.getNameBlackBG();
         if(this.selectedSlotItem.getDesc() == "")
         {
            this.popUp.selectItemAttribute.htmlText = this.selectedSlotItem.getCompareAttributes();
         }
         else
         {
            this.popUp.selectItemAttribute.htmlText = this.selectedSlotItem.getDesc() + "\n\n" + this.selectedSlotItem.getCompareAttributes();
         }
         this.descScrollDown.visible = this.popUp.selectItemAttribute.numLines > 7;
         if((this.selectedSlotItem.isOre() || !this.selectedSlotItem.isQuestItem()) && this.selectedSlotItem.canDrop())
         {
            this.contextButton.visible = true;
            this.setContextButton(CONTEXT_TOSTORAGE);
         }
         else
         {
            this.contextButton.visible = false;
         }
      }
      
      public function onDoubleClickInventory(mouseEvent:MouseEvent) : void
      {
         this.selectedSlot = ShopItem(mouseEvent.currentTarget);
         this.selectedSlotItem = this.selectedSlot.item;
         if((this.selectedSlotItem.isOre() || !this.selectedSlotItem.isQuestItem()) && this.selectedSlotItem.canDrop())
         {
            this.onTransferToStorage();
         }
      }
      
      public function onClickStorage(mouseEvent:MouseEvent) : void
      {
         var clickedItem:ShopItem = ShopItem(mouseEvent.currentTarget);
         this.clickStorage(clickedItem);
      }
      
      public function clickStorage(clickedItem:ShopItem) : void
      {
         for(var i:int = 0; i < this.totalSlots; i++)
         {
            this.slots[i].setGotSelected(false);
         }
         if(this.selectedSlot != null)
         {
            this.selectedSlot.setGotSelected(false);
         }
         this.selectedSlot = clickedItem;
         this.selectedSlotItem = clickedItem.item;
         this.selectedSlot.setGotSelected(true);
         this.storage_selectedSlotID = this.storage_topRow * this.storage_cols + this.selectedSlot.id;
         this.selectedSlotID = -1;
         this.popUpOpen();
         this.popUp.selectItem.setItemID(clickedItem.itemID,clickedItem.getBorderType(),clickedItem.getPrimaryColor(),clickedItem.getSecondaryColor());
         this.popUp.selectItem.setQtyText("");
         this.popUp.selectItemName.htmlText = this.selectedSlotItem.getNameBlackBG();
         if(this.selectedSlotItem.getDesc() == "")
         {
            this.popUp.selectItemAttribute.htmlText = this.selectedSlotItem.getCompareAttributes();
         }
         else
         {
            this.popUp.selectItemAttribute.htmlText = this.selectedSlotItem.getDesc() + "\n\n" + this.selectedSlotItem.getCompareAttributes();
         }
         this.descScrollDown.visible = this.popUp.selectItemAttribute.numLines > 7;
         this.contextButton.visible = true;
         this.setContextButton(CONTEXT_TOPLAYER);
      }
      
      public function onDoubleClickStorage(mouseEvent:MouseEvent) : void
      {
         this.selectedSlot = ShopItem(mouseEvent.currentTarget);
         this.selectedSlotItem = this.selectedSlot.item;
         this.onTransferToInventory();
      }
   }
}

