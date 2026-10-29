package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.*;
   import flash.text.TextField;
   import flash.utils.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1300")]
   public class CraftingUI extends MovieClip
   {
      
      public static var instance:CraftingUI;
      
      public var statsButton:RedButton;
      
      public var WeightAmount:TextField;
      
      public var statsLabel:TextField;
      
      public var namelabel:TextField;
      
      public var hGoldText:TextField;
      
      public var combineButton:GoldButton;
      
      public var invLabel:TextField;
      
      public var designSlot:ShopItem;
      
      public var finalSlot:ShopItem;
      
      public var goldicon1:MovieClip;
      
      public var designButton:RedButton;
      
      public var dragitem:ShopItem;
      
      public var descScrollDown:ScrollButton;
      
      public var errortext:TextField;
      
      public var goldicon2:MovieClip;
      
      public var popUp:MovieClip;
      
      public var nametext:TextField;
      
      public var inventoryScrollDown:ScrollButton;
      
      public var titletext:TextField;
      
      public var closeWindow:SimpleButton;
      
      public var statsSlot:ShopItem;
      
      public var goldlabel:TextField;
      
      public var inventoryScrollUp:ScrollButton;
      
      public var bgPopUpButton:MovieClip;
      
      public var designLabel:TextField;
      
      internal var inventory:Vector.<Item>;
      
      internal var totalRows:int;
      
      internal var topRow:int;
      
      internal var selectedSlot:ShopItem;
      
      internal var selectedSlotItem:Item;
      
      internal var selectedSlotID:int = -1;
      
      internal var startX:int = 380;
      
      internal var startY:int = 268;
      
      internal var spacingX:int = 80;
      
      internal var spacingY:int = 80;
      
      internal var cols:int = 4;
      
      internal var rows:int = 2;
      
      internal var totalSlots:int;
      
      internal var slots:Vector.<ShopItem>;
      
      internal var mousedown:Boolean;
      
      internal var dragequipflag:Boolean;
      
      public function CraftingUI()
      {
         var slot:ShopItem = null;
         var xpos:int = 0;
         var ypos:int = 0;
         var i:int = 0;
         this.totalSlots = this.cols * this.rows;
         this.slots = new Vector.<ShopItem>(this.totalSlots);
         super();
         instance = this;
         LangManager.initTextField(this.invLabel,true);
         LangManager.initTextField(this.WeightAmount,true);
         LangManager.initTextField(this.popUp.selectItemName,true);
         LangManager.initTextField(this.popUp.selectItemAttribute,true);
         LangManager.initTextField(this.goldlabel,true);
         LangManager.initTextField(this.statsLabel,true);
         LangManager.initTextField(this.designLabel,true);
         this.goldlabel.text = LangManager.getString(64);
         this.titletext.text = LangManager.getString(699);
         this.invLabel.text = LangManager.getString(682);
         this.designButton.setText(LangManager.getString(693));
         this.statsButton.setText(LangManager.getString(694));
         this.combineButton.setText(LangManager.getString(695));
         this.designLabel.text = LangManager.getString(696);
         this.statsLabel.text = LangManager.getString(697);
         this.designButton.visible = false;
         this.statsButton.visible = false;
         this.combineButton.visible = false;
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
         this.dragitem.visible = false;
         this.designSlot.doubleClickEnabled = true;
         this.statsSlot.doubleClickEnabled = true;
         this.finalSlot.doubleClickEnabled = true;
      }
      
      public function show() : *
      {
         this.inventory = StatsManager.inventory;
         this.inventory = this.inventory.concat(StatsManager.questItems);
         this.totalRows = Math.floor((this.inventory.length - 1) / this.cols);
         this.topRow = 0;
         this.selectedSlotID = -1;
         this.refreshInventory();
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
         this.designSlot.visible = false;
         this.statsSlot.visible = false;
         this.finalSlot.visible = false;
         this.namelabel.visible = false;
         this.nametext.visible = false;
         this.errortext.visible = false;
         this.goldicon1.visible = false;
         this.goldicon2.visible = false;
         this.combineButton.visible = false;
         if(this.inventory.length > 0)
         {
            this.clickInventory(this.slots[0]);
         }
         this.hGoldText.text = StatsManager.getHeavenlyGold().toString();
      }
      
      public function refreshInventory() : *
      {
         var maxItem:int = 0;
         var maxDisplay:int = 0;
         var slot:ShopItem = null;
         var index:int = 0;
         var prevSlotCount:int = this.topRow * this.cols;
         maxItem = int(this.inventory.length);
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
      
      public function addEventListeners() : void
      {
         this.designButton.addEventListener(MouseEvent.CLICK,this.onDesignClick);
         this.designButton.addEventListeners();
         this.statsButton.addEventListener(MouseEvent.CLICK,this.onStatsClick);
         this.statsButton.addEventListeners();
         this.combineButton.addEventListener(MouseEvent.CLICK,this.onCombineClick);
         this.combineButton.addEventListeners();
         this.closeWindow.addEventListener(MouseEvent.CLICK,this.onLeave);
         this.inventoryScrollUp.addEventListener(MouseEvent.CLICK,this.onScrollUp);
         this.inventoryScrollDown.addEventListener(MouseEvent.CLICK,this.onScrollDown);
         for(var i:int = 0; i < this.totalSlots; i++)
         {
            this.slots[i].addEventListener(MouseEvent.CLICK,this.onClickInventory);
            this.slots[i].addEventListener(MouseEvent.DOUBLE_CLICK,this.onDoubleClickInventory);
            this.slots[i].addEventListeners();
            this.slots[i].addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDOWN);
            this.slots[i].addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseDRAG);
         }
         this.designSlot.addEventListener(MouseEvent.CLICK,this.onClickDesignStats);
         this.designSlot.addEventListener(MouseEvent.DOUBLE_CLICK,this.onDoubleClickDesignStats);
         this.designSlot.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDOWN);
         this.designSlot.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseDRAG);
         this.statsSlot.addEventListener(MouseEvent.CLICK,this.onClickDesignStats);
         this.statsSlot.addEventListener(MouseEvent.DOUBLE_CLICK,this.onDoubleClickDesignStats);
         this.statsSlot.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDOWN);
         this.statsSlot.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseDRAG);
         this.finalSlot.addEventListener(MouseEvent.CLICK,this.onClickDesignStats);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUP);
         this.dragitem.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUP);
         this.bgPopUpButton.cacheAsBitmap = true;
      }
      
      public function removeEventListeners() : void
      {
         this.designButton.removeEventListener(MouseEvent.CLICK,this.onDesignClick);
         this.designButton.removeEventListeners();
         this.statsButton.removeEventListener(MouseEvent.CLICK,this.onStatsClick);
         this.statsButton.removeEventListeners();
         this.combineButton.removeEventListener(MouseEvent.CLICK,this.onCombineClick);
         this.combineButton.removeEventListeners();
         this.closeWindow.removeEventListener(MouseEvent.CLICK,this.onLeave);
         this.inventoryScrollUp.removeEventListener(MouseEvent.CLICK,this.onScrollUp);
         this.inventoryScrollDown.removeEventListener(MouseEvent.CLICK,this.onScrollDown);
         for(var i:int = 0; i < this.totalSlots; i++)
         {
            this.slots[i].removeEventListener(MouseEvent.CLICK,this.onClickInventory);
            this.slots[i].removeEventListener(MouseEvent.DOUBLE_CLICK,this.onDoubleClickInventory);
            this.slots[i].removeEventListeners();
            this.slots[i].removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDOWN);
            this.slots[i].removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseDRAG);
         }
         this.designSlot.removeEventListener(MouseEvent.CLICK,this.onClickDesignStats);
         this.designSlot.removeEventListener(MouseEvent.DOUBLE_CLICK,this.onDoubleClickDesignStats);
         this.designSlot.removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDOWN);
         this.designSlot.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseDRAG);
         this.statsSlot.removeEventListener(MouseEvent.CLICK,this.onClickDesignStats);
         this.statsSlot.removeEventListener(MouseEvent.DOUBLE_CLICK,this.onDoubleClickDesignStats);
         this.statsSlot.removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDOWN);
         this.statsSlot.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseDRAG);
         this.finalSlot.removeEventListener(MouseEvent.CLICK,this.onClickDesignStats);
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
      
      public function onDesignClick(mouseEvent:MouseEvent) : void
      {
         this.onTransferToDesign();
         this.designButton.visible = false;
         this.statsButton.visible = false;
      }
      
      public function onStatsClick(mouseEvent:MouseEvent) : void
      {
         this.onTransferToStats();
         this.designButton.visible = false;
         this.statsButton.visible = false;
      }
      
      public function onCombineClick(mouseEvent:MouseEvent) : void
      {
         StatsManager.spendHeavenlyGold(2,this.purchaseSuccess,this.purchaseError);
      }
      
      internal function purchaseSuccess() : *
      {
         QueryManager.instance.reportPremiumBuy(6,"combineitems",2);
         StatsManager.removeItemFromInventory(this.statsSlot.getItem());
         StatsManager.removeItemFromInventory(this.designSlot.getItem());
         StatsManager.addItemToInventory(this.finalSlot.getItem());
         this.hGoldText.text = StatsManager.getHeavenlyGold().toString();
         SoundManager.instance.playGoodKoto();
         this.inventory = StatsManager.inventory;
         this.inventory = this.inventory.concat(StatsManager.questItems);
         this.totalRows = Math.floor((this.inventory.length - 1) / this.cols);
         this.topRow = this.totalRows - 1;
         if(this.topRow < 0)
         {
            this.topRow = 0;
         }
         this.refreshInventory();
         this.noCombine("");
         this.statsSlot.visible = false;
         this.designSlot.visible = false;
         QueryManager.instance.saveModifiedCharData();
         NetworkManager.instance.storeItem(this.finalSlot.getItem());
      }
      
      internal function purchaseError() : *
      {
         OverworldHUD.instance.onShowGetGoldPromptDialog(2);
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
         this.designButton.visible = false;
         this.statsButton.visible = false;
         this.popUp.visible = false;
         this.descScrollDown.visible = false;
      }
      
      public function onTransferToDesign() : void
      {
         if(this.statsSlot.visible && this.statsSlot.getItem().equals(this.selectedSlotItem))
         {
            return;
         }
         if(this.itemCanCombine(this.selectedSlotItem.itemID))
         {
            this.designSlot.visible = true;
            this.designSlot.setItemID(this.selectedSlotItem.itemID,this.selectedSlotItem.getShopItemType(),this.selectedSlotItem.getPrimaryColor(),this.selectedSlotItem.getSecondaryColor());
            this.designSlot.setItem(this.selectedSlotItem);
            this.designSlot.setQtyText("");
            this.designSlot.setGotSelected(false);
            this.checkCombine();
         }
      }
      
      public function onTransferToStats() : void
      {
         if(this.designSlot.visible && this.designSlot.getItem().equals(this.selectedSlotItem))
         {
            return;
         }
         if(this.itemCanCombine(this.selectedSlotItem.itemID))
         {
            this.statsSlot.visible = true;
            this.statsSlot.setItemID(this.selectedSlotItem.itemID,this.selectedSlotItem.getShopItemType(),this.selectedSlotItem.getPrimaryColor(),this.selectedSlotItem.getSecondaryColor());
            this.statsSlot.setItem(this.selectedSlotItem);
            this.statsSlot.setQtyText("");
            this.statsSlot.setGotSelected(false);
            this.checkCombine();
         }
      }
      
      public function onTransferToInventory() : *
      {
         if(this.designSlot.visible && this.designSlot.getItem().equals(this.selectedSlotItem))
         {
            this.designSlot.visible = false;
         }
         else if(this.statsSlot.visible && this.statsSlot.getItem().equals(this.selectedSlotItem))
         {
            this.statsSlot.visible = false;
         }
         this.noCombine("");
      }
      
      internal function itemCanCombine(id:int) : Boolean
      {
         return id >= 3000 && id < 6000 || id >= 7000 && id < 8000 || id >= 9000 && id < 10000 || id >= 11000 && id < 14000;
      }
      
      internal function checkCombine() : *
      {
         var modifier:Modifier = null;
         var designItemXML:XMLItem = null;
         var designMinDamage:int = 0;
         var statsMinDamage:int = 0;
         if(!this.designSlot.visible || !this.statsSlot.visible)
         {
            this.noCombine("");
            return;
         }
         var designType:int = Math.floor(this.designSlot.itemID / 1000);
         var statsType:int = Math.floor(this.statsSlot.itemID / 1000);
         if(designType != statsType)
         {
            this.noCombine(LangManager.getString(698));
            return;
         }
         this.finalSlot.visible = true;
         this.errortext.visible = false;
         this.goldicon1.visible = true;
         this.goldicon2.visible = true;
         this.combineButton.visible = true;
         var combinedItem:Item = new Item(this.designSlot.itemID);
         combinedItem.copyModifiers(this.statsSlot.getItem().modifiers);
         if(designType == 13)
         {
            designItemXML = QuestEngine.getItemData(this.designSlot.itemID);
            designMinDamage = designItemXML.mindamage;
            statsMinDamage = QuestEngine.getItemData(this.statsSlot.itemID).mindamage;
            if(combinedItem.getModifierBonus(6) == 0)
            {
               combinedItem.addModifier(6,statsMinDamage - designMinDamage);
            }
            else
            {
               modifier = combinedItem.getModifierObject(6);
               modifier.value += statsMinDamage - designMinDamage;
            }
            combinedItem.uses = this.statsSlot.getItem().uses;
         }
         combinedItem.setPrimaryColor(this.designSlot.getPrimaryColor());
         combinedItem.setSecondaryColor(this.designSlot.getSecondaryColor());
         this.finalSlot.setItemID(combinedItem.itemID,combinedItem.getShopItemType(),combinedItem.getPrimaryColor(),combinedItem.getSecondaryColor());
         this.finalSlot.setItem(combinedItem);
         this.finalSlot.setQtyText("");
         this.finalSlot.setGotSelected(false);
         this.errortext.visible = false;
      }
      
      internal function noCombine(error:String) : *
      {
         this.finalSlot.visible = false;
         this.errortext.visible = true;
         this.goldicon1.visible = false;
         this.goldicon2.visible = false;
         this.combineButton.visible = false;
         this.errortext.text = error;
      }
      
      public function onMouseDOWN(mouseEvent:MouseEvent) : *
      {
         this.mousedown = true;
         var clickedItem:ShopItem = ShopItem(mouseEvent.currentTarget);
         this.dragitem.setItemID(clickedItem.itemID,clickedItem.getBorderType(),clickedItem.getPrimaryColor(),clickedItem.getSecondaryColor());
         this.dragitem.x = mouseX - 35;
         this.dragitem.y = mouseY - 35;
         if((mouseEvent.stageX - StatsManager.stageOffsetX) / StatsManager.stageScale < 200)
         {
            this.clickDesignStats(clickedItem);
            this.dragequipflag = true;
         }
         else if((mouseEvent.stageX - StatsManager.stageOffsetX) / StatsManager.stageScale < 355)
         {
            this.clickDesignStats(clickedItem);
            this.dragequipflag = true;
         }
         else
         {
            this.clickInventory(clickedItem);
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
            if(this.dragequipflag)
            {
               this.onTransferToInventory();
            }
            if(this.dragitem.x < 200)
            {
               this.onTransferToStats();
            }
            else if(this.dragitem.x < 355)
            {
               this.onTransferToDesign();
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
         if(!this.selectedSlotItem.isQuestItem() && this.itemCanCombine(this.selectedSlotItem.getItemID()))
         {
            if(this.selectedSlotItem != null && (this.designSlot.visible && this.designSlot.getItem().equals(this.selectedSlotItem) || this.statsSlot.visible && this.statsSlot.getItem().equals(this.selectedSlotItem)))
            {
               this.designButton.visible = false;
               this.statsButton.visible = false;
            }
            else
            {
               this.designButton.visible = true;
               this.statsButton.visible = true;
            }
         }
         else
         {
            this.designButton.visible = false;
            this.statsButton.visible = false;
         }
      }
      
      public function onDoubleClickInventory(mouseEvent:MouseEvent) : void
      {
         this.selectedSlot = ShopItem(mouseEvent.currentTarget);
         this.selectedSlotItem = this.selectedSlot.item;
         if(!this.statsSlot.visible)
         {
            this.onTransferToStats();
         }
         else
         {
            this.onTransferToDesign();
         }
      }
      
      public function onClickDesignStats(mouseEvent:MouseEvent) : void
      {
         var clickedItem:ShopItem = ShopItem(mouseEvent.currentTarget);
         this.clickDesignStats(clickedItem);
      }
      
      public function clickDesignStats(clickedItem:ShopItem) : void
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
         this.designButton.visible = false;
         this.statsButton.visible = false;
      }
      
      public function onDoubleClickDesignStats(mouseEvent:MouseEvent) : void
      {
         this.selectedSlot = ShopItem(mouseEvent.currentTarget);
         this.selectedSlotItem = this.selectedSlot.item;
         this.onTransferToInventory();
      }
   }
}

