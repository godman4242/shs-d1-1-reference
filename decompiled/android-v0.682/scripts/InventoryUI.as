package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.*;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.utils.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1277")]
   public class InventoryUI extends MovieClip
   {
      
      public static var instance:InventoryUI;
      
      internal static var CONTEXT_USE:int = 0;
      
      internal static var CONTEXT_UNEQUIP:int = 1;
      
      internal static var CONTEXT_EQUIP:int = 2;
      
      internal static var MODE_INVENTORY:int = 0;
      
      internal static var MODE_GIVE:int = 1;
      
      internal static var MODE_MERGE:int = 2;
      
      internal static var MODE_CRAFT:int = 3;
      
      internal static var MODE_BANK:int = 4;
      
      public var equipAccessory2:ShopItem;
      
      public var equipShoes:ShopItem;
      
      public var equipGloves:ShopItem;
      
      public var xplabel:TextField;
      
      public var WeightAmount:TextField;
      
      public var coinslabel:TextField;
      
      public var XPbar:MovieClip;
      
      public var allstatsbutton:RedButtonSmall;
      
      public var contextButton:RedButton;
      
      public var hGoldText:TextField;
      
      public var goldText:TextField;
      
      public var equipHat:ShopItem;
      
      public var shoesIcon:MovieClip;
      
      public var XPbarText:TextField;
      
      public var equipMask:ShopItem;
      
      public var armorIcon:MovieClip;
      
      public var allstatsbutton_hitarea:Blocker;
      
      public var XPbarTextShadow:TextField;
      
      public var equipPants:ShopItem;
      
      public var pantsIcon:MovieClip;
      
      public var statPoints:TextField;
      
      public var dragitem:ShopItem;
      
      public var descScrollDown:ScrollButton;
      
      public var itemPanel:MovieClip;
      
      public var acc1Icon:MovieClip;
      
      public var autoassignlabel:TextField;
      
      public var CharLvl:TextField;
      
      public var acc2Icon:MovieClip;
      
      public var weaponIcon:MovieClip;
      
      public var dropButton:RedButton;
      
      public var danfield:TextField;
      
      public var maskIcon:MovieClip;
      
      public var statsPanel:MovieClip;
      
      public var inventoryScrollDown:ScrollButton;
      
      public var equipWeapon:ShopItem;
      
      public var glovesIcon:MovieClip;
      
      public var titletext:TextField;
      
      public var closeWindow:SimpleButton;
      
      public var inventoryScrollUp:ScrollButton;
      
      public var goldlabel:TextField;
      
      public var equipAccessory1:ShopItem;
      
      public var hatIcon:MovieClip;
      
      public var CharName:TextField;
      
      public var bgPopUpButton:MovieClip;
      
      public var allstatstext:TextField;
      
      public var autoAssignCheckBox:AssignBox;
      
      public var equipArmor:ShopItem;
      
      public var playerImage:MCSCharacter;
      
      internal var inventory:Vector.<Item>;
      
      internal var giveList:Vector.<Item>;
      
      internal var totalRows:int;
      
      internal var topRow:int;
      
      internal var selectedSlot:ShopItem;
      
      internal var selectedSlotItem:Item;
      
      internal var selectedSlotID:int = -1;
      
      internal var contextAction:int = 0;
      
      internal var invMode:int = 0;
      
      internal var startX:int = 380;
      
      internal var startY:int = 268;
      
      internal var spacingX:int = 80;
      
      internal var spacingY:int = 80;
      
      internal var cols:int = 4;
      
      internal var rows:int = 2;
      
      internal var totalSlots:int;
      
      internal var slots:Vector.<ShopItem>;
      
      internal var SLOT_HAT:int = 0;
      
      internal var SLOT_MASK:int = 1;
      
      internal var SLOT_ARMOR:int = 2;
      
      internal var SLOT_GLOVES:int = 3;
      
      internal var SLOT_PANTS:int = 4;
      
      internal var SLOT_WEAPON:int = 5;
      
      internal var SLOT_RING1:int = 6;
      
      internal var SLOT_SHOES:int = 7;
      
      internal var SLOT_RING2:int = 8;
      
      internal var totalEquippedSlots:int = 9;
      
      internal var equippedSlots:Vector.<ShopItem>;
      
      internal var eqStringHolder:String;
      
      internal var confirmDialog:ConfirmDialog;
      
      internal var mousedown:Boolean;
      
      internal var dragequipflag:Boolean;
      
      public function InventoryUI()
      {
         var slot:ShopItem = null;
         var xpos:int = 0;
         var ypos:int = 0;
         this.totalSlots = this.cols * this.rows;
         this.slots = new Vector.<ShopItem>(this.totalSlots);
         this.equippedSlots = new Vector.<ShopItem>(this.totalEquippedSlots);
         super();
         instance = this;
         LangManager.initTextField(this.autoassignlabel,true);
         this.autoassignlabel.text = LangManager.getString(62);
         LangManager.initTextField(this.coinslabel,true);
         this.coinslabel.text = LangManager.getString(63);
         LangManager.initTextField(this.goldlabel,true);
         this.goldlabel.text = LangManager.getString(64);
         LangManager.initTextField(this.xplabel,true);
         this.xplabel.text = LangManager.getString(66);
         LangManager.initTextField(this.titletext,true);
         var format:TextFormat = new TextFormat();
         format.bold = true;
         this.danfield.defaultTextFormat = format;
         LangManager.initTextField(this.statsPanel.hpbaricon,true);
         this.statsPanel.hpbaricon.text = LangManager.getString(211);
         LangManager.initTextField(this.statsPanel.chibaricon,true);
         this.statsPanel.chibaricon.text = LangManager.getString(222);
         LangManager.initTextField(this.statsPanel.apbaricon,true);
         this.statsPanel.apbaricon.text = LangManager.getString(223);
         LangManager.initTextField(this.statsPanel.atkbaricon,true);
         this.statsPanel.atkbaricon.text = LangManager.getString(224);
         LangManager.initTextField(this.statsPanel.defbaricon,true);
         this.statsPanel.defbaricon.text = LangManager.getString(225);
         LangManager.initTextField(this.statsPanel.spdbaricon,true);
         this.statsPanel.spdbaricon.text = LangManager.getString(226);
         LangManager.initTextField(this.WeightAmount,true);
         LangManager.initTextField(this.itemPanel.selectItemName,true);
         LangManager.initTextField(this.itemPanel.selectItemAttribute,true);
         LangManager.initTextField(this.CharName);
         LangManager.initTextField(this.statPoints,true);
         LangManager.initTextField(this.statsPanel.damagerangetext,true);
         this.contextButton.visible = false;
         this.dropButton.visible = false;
         this.autoAssignCheckBox.buttonMode = true;
         this.itemPanel.selectItem.setDisplayOnly();
         this.itemPanelClose(null);
         this.weaponIcon.visible = false;
         this.hatIcon.visible = false;
         this.maskIcon.visible = false;
         this.armorIcon.visible = false;
         this.glovesIcon.visible = false;
         this.pantsIcon.visible = false;
         this.shoesIcon.visible = false;
         this.acc1Icon.visible = false;
         this.acc2Icon.visible = false;
         for(var i:int = 0; i < this.totalSlots; i++)
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
         this.equippedSlots[this.SLOT_HAT] = this.equipHat;
         this.equippedSlots[this.SLOT_ARMOR] = this.equipArmor;
         this.equippedSlots[this.SLOT_MASK] = this.equipMask;
         this.equippedSlots[this.SLOT_GLOVES] = this.equipGloves;
         this.equippedSlots[this.SLOT_WEAPON] = this.equipWeapon;
         this.equippedSlots[this.SLOT_PANTS] = this.equipPants;
         this.equippedSlots[this.SLOT_SHOES] = this.equipShoes;
         this.equippedSlots[this.SLOT_RING1] = this.equipAccessory1;
         this.equippedSlots[this.SLOT_RING2] = this.equipAccessory2;
         this.equippedSlots.fixed = true;
         for(i = 0; i < this.totalEquippedSlots; i++)
         {
            slot = this.equippedSlots[i];
            slot.doubleClickEnabled = true;
            slot.mouseChildren = false;
         }
         this.dragitem.visible = false;
         this.confirmDialog = new ConfirmDialog();
         addChild(this.confirmDialog);
         this.confirmDialog.yesbutton.setText(LangManager.getString(1));
         this.confirmDialog.nobutton.setText(LangManager.getString(0));
         this.playerImage = new MCSCharacter();
         this.playerImage.faceRight();
         this.playerImage.showDisplayName(false);
         this.playerImage.setSpeechText("");
         this.playerImage.scaleX = 1.2;
         this.playerImage.scaleY = 1.2;
         this.playerImage.x = 208;
         this.playerImage.y = 365;
         this.playerImage.startAnim(MCSActor.IDLE_SHEATHED);
         addChild(this.playerImage);
         this.allstatsbutton_hitarea.visible = false;
         this.allstatsbutton.hitArea = this.allstatsbutton_hitarea;
      }
      
      public function show() : *
      {
         this.titletext.text = LangManager.getString(67);
         this.invMode = MODE_INVENTORY;
         this.dropButton.setText(LangManager.getString(68));
         this.updateAllStats();
         this.inventory = StatsManager.inventory;
         this.inventory = this.inventory.concat(StatsManager.questItems);
         this.totalRows = Math.floor((this.inventory.length - 1) / this.cols);
         this.topRow = 0;
         this.selectedSlot = null;
         this.selectedSlotItem = null;
         this.selectedSlotID = -1;
         this.refreshInventory();
         this.refreshEquipment();
         this.addEventListeners();
         this.visible = true;
         this.autoAssignCheckBox.setCheck(StatsManager.autoAssignStats);
         this.dragitem.costText.text = "";
         setChildIndex(this.dragitem,numChildren - 1);
         Tracker.instance.trackShowInventoryUI();
         if(this.eqStringHolder == null)
         {
            this.playerImage.initMCSFromEqString(StatsManager.getEquipmentString());
         }
         this.eqStringHolder = StatsManager.getEquipmentString();
         if(GameEngine.isAdventureMode())
         {
            NetworkManager.instance.playerUpdateBusy(true);
         }
         this.confirmDialog.visible = false;
         this.confirmDialog.prompt.text = LangManager.getString(249);
         setChildIndex(this.confirmDialog,numChildren - 1);
         this.confirmDialog.yesbutton.addEventListener(MouseEvent.CLICK,this.doDrop);
         this.confirmDialog.nobutton.addEventListener(MouseEvent.CLICK,this.doDropCancel);
         this.confirmDialog.yesbutton.addEventListeners();
         this.confirmDialog.nobutton.addEventListeners();
         this.allstatsbutton.visible = true;
         this.showAllStats(false);
      }
      
      public function showGive() : *
      {
         this.show();
         this.invMode = MODE_GIVE;
         this.titletext.text = LangManager.getString(247);
         this.dropButton.setText(LangManager.getString(228));
         this.giveList = new Vector.<Item>();
         this.confirmDialog.prompt.text = LangManager.getString(250) + OverworldHUD.instance.playerPanelDisplay.ppcharname + "?";
         this.allstatsbutton.visible = false;
         this.showAllStats(false);
         StageManager.getGameStage().visible = false;
      }
      
      public function refreshInventory() : *
      {
         var maxDisplay:int = 0;
         var slot:ShopItem = null;
         var index:int = 0;
         var val:int = 0;
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
               if(this.inventory[index].getQuantity() > 1 && !this.inventory[index].hasModifiers() && this.inventory[index].uses == 0 && !this.inventory[index].named)
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
               }
               else
               {
                  slot.setGotSelected(false);
               }
            }
         }
         this.updateAllStats();
         val = StatsManager.findBonusStat(6,true);
         if(val == 0)
         {
            this.statsPanel.AtkBonusAmount.text = "";
         }
         else if(val > 0)
         {
            this.statsPanel.AtkBonusAmount.text = " + " + val;
         }
         else
         {
            this.statsPanel.AtkBonusAmount.text = " - " + -val;
         }
         val = StatsManager.findBonusStat(7);
         if(val == 0)
         {
            this.statsPanel.DefBonusAmount.text = "";
         }
         else if(StatsManager.findBonusStat(7) >= 0)
         {
            this.statsPanel.DefBonusAmount.text = " + " + val;
         }
         else
         {
            this.statsPanel.DefBonusAmount.text = " - " + -val;
         }
         val = StatsManager.findBonusStat(8);
         if(val == 0)
         {
            this.statsPanel.SpdBonusAmount.text = "";
         }
         else if(StatsManager.findBonusStat(8) >= 0)
         {
            this.statsPanel.SpdBonusAmount.text = " + " + val;
         }
         else
         {
            this.statsPanel.SpdBonusAmount.text = " - " + -val;
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
      
      internal function findWeaponDamageRange() : String
      {
         var minDamage:int = StatsManager.getMinDamage();
         return "(total dmg: " + minDamage + " - " + (minDamage + StatsManager.getDamageRange()) + ")";
      }
      
      public function refreshEquipment() : void
      {
         var tempInt:int = 0;
         var tempItem:Item = null;
         var tempShopItem:ShopItem = null;
         for(var i:int = 0; i < 9; i++)
         {
            switch(i)
            {
               case 0:
                  tempItem = StatsManager.equipment[StatsManager.EQ_HAT];
                  if(tempItem.getItemID() == 0)
                  {
                     this.hatIcon.visible = true;
                  }
                  tempShopItem = this.equippedSlots[this.SLOT_HAT];
                  break;
               case 1:
                  tempItem = StatsManager.equipment[StatsManager.EQ_ARMOR];
                  if(tempItem.getItemID() == 0 || tempItem.getItemID() == 4001 || tempItem.getItemID() == 4000)
                  {
                     this.armorIcon.visible = true;
                  }
                  tempShopItem = this.equippedSlots[this.SLOT_ARMOR];
                  break;
               case 2:
                  tempItem = StatsManager.equipment[StatsManager.EQ_GLOVES];
                  if(tempItem.getItemID() == 0)
                  {
                     this.glovesIcon.visible = true;
                  }
                  tempShopItem = this.equippedSlots[this.SLOT_GLOVES];
                  break;
               case 3:
                  tempItem = StatsManager.equipment[StatsManager.EQ_PANTS];
                  if(tempItem.getItemID() == 0 || tempItem.getItemID() == 11001)
                  {
                     this.pantsIcon.visible = true;
                  }
                  tempShopItem = this.equippedSlots[this.SLOT_PANTS];
                  break;
               case 4:
                  tempItem = StatsManager.equipment[StatsManager.EQ_MASK];
                  if(tempItem.getItemID() == 0)
                  {
                     this.maskIcon.visible = true;
                  }
                  tempShopItem = this.equippedSlots[this.SLOT_MASK];
                  break;
               case 5:
                  tempItem = StatsManager.equipment[StatsManager.EQ_WEAPON];
                  if(tempItem.getItemID() == 0)
                  {
                     this.weaponIcon.visible = true;
                  }
                  tempShopItem = this.equippedSlots[this.SLOT_WEAPON];
                  break;
               case 6:
                  tempItem = StatsManager.equipment[StatsManager.EQ_SHOES];
                  if(tempItem.getItemID() == 0)
                  {
                     this.shoesIcon.visible = true;
                  }
                  tempShopItem = this.equippedSlots[this.SLOT_SHOES];
                  break;
               case 7:
                  tempItem = StatsManager.equipment[StatsManager.EQ_ACCESSORY1];
                  if(tempItem.getItemID() == 0)
                  {
                     this.acc1Icon.visible = true;
                  }
                  tempShopItem = this.equippedSlots[this.SLOT_RING1];
                  break;
               case 8:
                  tempItem = StatsManager.equipment[StatsManager.EQ_ACCESSORY2];
                  if(tempItem.getItemID() == 0)
                  {
                     this.acc2Icon.visible = true;
                  }
                  tempShopItem = this.equippedSlots[this.SLOT_RING2];
            }
            if(tempItem.getItemID() != 0 && tempItem.getItemID() != 4001 && tempItem.getItemID() != 4000 && tempItem.getItemID() != 11001)
            {
               tempShopItem.setItemID(tempItem.getItemID(),tempItem.getShopItemType(),tempItem.getPrimaryColor(),tempItem.getSecondaryColor());
               tempShopItem.setItem(tempItem);
               tempShopItem.setGotSelected(false);
               tempShopItem.setQtyText("");
            }
            else
            {
               tempShopItem.visible = false;
            }
         }
      }
      
      public function getInventoryPlayerImage() : MCSCharacter
      {
         return this.playerImage;
      }
      
      public function addEventListeners() : void
      {
         this.contextButton.addEventListener(MouseEvent.CLICK,this.onClickContextButton);
         this.contextButton.addEventListeners();
         this.dropButton.addEventListener(MouseEvent.CLICK,this.onDrop);
         this.dropButton.addEventListeners();
         this.closeWindow.addEventListener(MouseEvent.CLICK,this.onLeave);
         this.autoAssignCheckBox.addEventListener(MouseEvent.CLICK,this.autoAssignStatsToggle);
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
         for(i = 0; i < this.totalEquippedSlots; i++)
         {
            this.equippedSlots[i].addEventListener(MouseEvent.CLICK,this.onClickEquip);
            this.equippedSlots[i].addEventListener(MouseEvent.DOUBLE_CLICK,this.onDoubleClickEquip);
            this.equippedSlots[i].addEventListeners();
            this.equippedSlots[i].addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDOWN);
            this.equippedSlots[i].addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseDRAG);
         }
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUP);
         this.dragitem.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUP);
         this.itemPanel.chatbutton.addEventListener(MouseEvent.CLICK,this.chatButtonClick);
         this.allstatsbutton.addEventListener(MouseEvent.CLICK,this.allstatsbuttonClick);
         this.allstatsbutton.addEventListeners();
         this.bgPopUpButton.cacheAsBitmap = true;
      }
      
      public function removeEventListeners() : void
      {
         this.contextButton.removeEventListener(MouseEvent.CLICK,this.onClickContextButton);
         this.contextButton.removeEventListeners();
         this.dropButton.removeEventListener(MouseEvent.CLICK,this.onDrop);
         this.dropButton.removeEventListeners();
         this.closeWindow.removeEventListener(MouseEvent.CLICK,this.onLeave);
         this.autoAssignCheckBox.removeEventListener(MouseEvent.CLICK,this.autoAssignStatsToggle);
         this.inventoryScrollUp.removeEventListener(MouseEvent.CLICK,this.onScrollUp);
         this.inventoryScrollDown.removeEventListener(MouseEvent.CLICK,this.onScrollDown);
         this.itemPanel.removeEventListener(MouseEvent.CLICK,this.itemPanelClose);
         this.bgPopUpButton.removeEventListener(MouseEvent.CLICK,this.itemPanelClose);
         for(var i:int = 0; i < this.totalSlots; i++)
         {
            this.slots[i].removeEventListener(MouseEvent.CLICK,this.onClickInventory);
            this.slots[i].removeEventListener(MouseEvent.DOUBLE_CLICK,this.onDoubleClickInventory);
            this.slots[i].removeEventListeners();
            this.slots[i].removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDOWN);
            this.slots[i].removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseDRAG);
         }
         for(i = 0; i < this.totalEquippedSlots; i++)
         {
            this.equippedSlots[i].removeEventListener(MouseEvent.CLICK,this.onClickEquip);
            this.equippedSlots[i].removeEventListener(MouseEvent.DOUBLE_CLICK,this.onDoubleClickEquip);
            this.equippedSlots[i].removeEventListeners();
            this.equippedSlots[i].removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDOWN);
            this.equippedSlots[i].removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseDRAG);
         }
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUP);
         this.dragitem.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUP);
         this.itemPanel.chatbutton.removeEventListener(MouseEvent.CLICK,this.chatButtonClick);
         this.confirmDialog.yesbutton.removeEventListener(MouseEvent.CLICK,this.doDrop);
         this.confirmDialog.nobutton.removeEventListener(MouseEvent.CLICK,this.doDropCancel);
         this.confirmDialog.yesbutton.removeEventListeners();
         this.confirmDialog.nobutton.removeEventListeners();
         this.allstatsbutton.removeEventListener(MouseEvent.CLICK,this.allstatsbuttonClick);
         this.allstatsbutton.removeEventListeners();
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
      
      internal function onClickDescScroll(mouseEvent:MouseEvent) : *
      {
         if(this.itemPanel.selectItemAttribute.scrollV == this.itemPanel.selectItemAttribute.numLines - 7)
         {
            this.itemPanel.selectItemAttribute.scrollV = 0;
         }
         else
         {
            ++this.itemPanel.selectItemAttribute.scrollV;
         }
      }
      
      public function onLeave(event:MouseEvent) : void
      {
         var newEqString:String = null;
         var max:int = 0;
         var giveStr:String = null;
         var i:int = 0;
         if(GameEngine.isOverworld())
         {
            Overworld.refreshMap();
            Overworld.showOverworldHUD();
            Overworld.showOverworldMap(true);
         }
         else
         {
            newEqString = StatsManager.getEquipmentString();
            if(this.eqStringHolder != newEqString)
            {
               NetworkManager.instance.playerUpdateEq(newEqString);
            }
            NetworkManager.instance.playerUpdateBusy(false);
            if(this.invMode == MODE_GIVE)
            {
               max = int(this.giveList.length);
               if(max > 0)
               {
                  giveStr = "";
                  for(i = 0; i < max; i++)
                  {
                     if(i == max - 1)
                     {
                        giveStr += this.giveList[i].toStringNoQty();
                     }
                     else
                     {
                        giveStr += this.giveList[i].toStringNoQty() + "|";
                     }
                  }
                  QueryManager.instance.giveItem(OverworldHUD.instance.playerPanelDisplay.ppcharname,StatsManager.charname,giveStr,0);
               }
               OverworldHUD.instance.playerPanelDisplay.visible = true;
            }
            else
            {
               InputManager.setAdventureMode();
            }
         }
         OverworldHUD.instance.updateHUD();
         QueryManager.instance.saveModifiedCharData();
         this.itemPanelClose(null);
         this.removeEventListeners();
         this.visible = false;
         if(this.invMode == MODE_GIVE)
         {
            StageManager.getGameStage().visible = true;
         }
         else
         {
            OverworldHUD.instance.unHideAll();
         }
      }
      
      internal function itemPanelOpen() : *
      {
         this.itemPanel.visible = true;
         this.statsPanel.visible = false;
         this.itemPanel.addEventListener(MouseEvent.CLICK,this.itemPanelClose);
         this.bgPopUpButton.addEventListener(MouseEvent.CLICK,this.itemPanelClose);
         this.descScrollDown.addEventListener(MouseEvent.CLICK,this.onClickDescScroll);
         if(this.allstatstext.visible)
         {
            this.setAllStatsText();
         }
      }
      
      internal function itemPanelClose(event:MouseEvent) : *
      {
         this.itemPanel.selectItemName.text = "";
         this.itemPanel.selectItemAttribute.htmlText = "";
         this.itemPanel.removeEventListener(MouseEvent.CLICK,this.itemPanelClose);
         this.descScrollDown.removeEventListener(MouseEvent.CLICK,this.onClickDescScroll);
         if(this.selectedSlot != null)
         {
            this.selectedSlot.setGotSelected(false);
            this.selectedSlot = null;
            this.selectedSlotItem = null;
         }
         this.selectedSlotID = -1;
         this.contextButton.visible = false;
         this.dropButton.visible = false;
         this.itemPanel.visible = false;
         this.statsPanel.visible = true;
         this.descScrollDown.visible = false;
         if(this.allstatstext.visible)
         {
            this.setAllStatsText();
         }
      }
      
      internal function setContextButton(context:int) : *
      {
         switch(context)
         {
            case CONTEXT_USE:
               this.contextButton.setText(LangManager.getString(69));
               break;
            case CONTEXT_EQUIP:
               this.contextButton.setText(LangManager.getString(70));
               break;
            case CONTEXT_UNEQUIP:
               this.contextButton.setText(LangManager.getString(71));
         }
         this.contextAction = context;
      }
      
      public function onClickContextButton(mouseEvent:MouseEvent) : *
      {
         switch(this.contextAction)
         {
            case CONTEXT_USE:
               this.onUseItem();
               break;
            case CONTEXT_EQUIP:
               this.onEquip();
               break;
            case CONTEXT_UNEQUIP:
               this.onUnequip();
         }
      }
      
      public function onUnequip() : void
      {
         switch(this.selectedSlot)
         {
            case this.equippedSlots[this.SLOT_HAT]:
               StatsManager.removeEquipment(StatsManager.EQ_HAT);
               this.hatIcon.visible = true;
               OverworldHUD.instance.friendpanel.refreshSelf();
               break;
            case this.equippedSlots[this.SLOT_ARMOR]:
               StatsManager.removeEquipment(StatsManager.EQ_ARMOR);
               this.armorIcon.visible = true;
               OverworldHUD.instance.friendpanel.refreshSelf();
               break;
            case this.equippedSlots[this.SLOT_MASK]:
               StatsManager.removeEquipment(StatsManager.EQ_MASK);
               this.maskIcon.visible = true;
               OverworldHUD.instance.friendpanel.refreshSelf();
               break;
            case this.equippedSlots[this.SLOT_GLOVES]:
               StatsManager.removeEquipment(StatsManager.EQ_GLOVES);
               this.glovesIcon.visible = true;
               break;
            case this.equippedSlots[this.SLOT_WEAPON]:
               StatsManager.removeEquipment(StatsManager.EQ_WEAPON);
               this.weaponIcon.visible = true;
               break;
            case this.equippedSlots[this.SLOT_PANTS]:
               StatsManager.removeEquipment(StatsManager.EQ_PANTS);
               this.pantsIcon.visible = true;
               break;
            case this.equippedSlots[this.SLOT_SHOES]:
               StatsManager.removeEquipment(StatsManager.EQ_SHOES);
               this.shoesIcon.visible = true;
               break;
            case this.equippedSlots[this.SLOT_RING1]:
               StatsManager.removeEquipment(StatsManager.EQ_ACCESSORY1);
               this.acc1Icon.visible = true;
               break;
            case this.equippedSlots[this.SLOT_RING2]:
               StatsManager.removeEquipment(StatsManager.EQ_ACCESSORY2);
               this.acc2Icon.visible = true;
         }
         StatsManager.addItemToInventory(this.selectedSlotItem);
         this.inventory = StatsManager.inventory;
         this.inventory = this.inventory.concat(StatsManager.questItems);
         this.selectedSlot.setGotSelected(false);
         this.selectedSlot.itemMCS.clearItem();
         this.selectedSlot.visible = false;
         this.itemPanel.visible = false;
         this.statsPanel.visible = true;
         this.itemPanel.removeEventListener(MouseEvent.CLICK,this.itemPanelClose);
         this.itemPanel.selectItemName.htmlText = "";
         this.itemPanel.selectItemAttribute.htmlText = "";
         this.contextButton.visible = false;
         this.selectedSlot = null;
         this.selectedSlotItem = null;
         this.selectedSlotID = -1;
         StatsManager.refreshStats();
         this.updateAllStats();
         OverworldHUD.instance.updateHUD();
         this.refreshInventory();
         QueryManager.instance.reportDataModified(StatsManager.ITEM);
      }
      
      public function onUseItem() : void
      {
         var modid:int = 0;
         var nodeid:int = 0;
         var interactUIItem:Item = null;
         var j:int = 0;
         var seed:int = 0;
         var genArray:* = undefined;
         var territory:Point = null;
         var territoryData:TerritoryData = null;
         var item:XMLItem = QuestEngine.getItemData(this.selectedSlotItem.itemID);
         if(this.selectedSlotItem.itemID == 2129)
         {
            if(StageManager.getRoomPrivate() == XMLRoomData.ROOMTYPE_HELL)
            {
               return;
            }
            nodeid = this.selectedSlotItem.getModifierBonus(102);
            if(nodeid == 0)
            {
               nodeid = 8382465;
            }
            this.reduceInventory();
            this.onLeave(null);
            OverworldHUD.getInstance().screenTransition.setTeleportTarget(nodeid);
            OverworldHUD.getInstance().screenTransition.startClose(ScreenTransition.ACTION_TELEPORT);
            return;
         }
         if(this.selectedSlotItem.itemID == 2213)
         {
            interactUIItem = this.selectedSlotItem;
            this.onLeave(null);
            OverworldHUD.instance.interactUI.show(InteractUI.UIMODE_JOINCUSTOMCLANRECRUIT,0,interactUIItem);
            return;
         }
         if(this.selectedSlotItem.itemID == 2214)
         {
            if(StatsManager.getWarRank() < 9)
            {
               OverworldHUD.instance.showDialog(LangManager.getString(827),LangManager.getString(5));
               return;
            }
            interactUIItem = this.selectedSlotItem;
            this.onLeave(null);
            OverworldHUD.instance.interactUI.show(InteractUI.UIMODE_JOINCUSTOMCLANGENERAL,0,interactUIItem);
            return;
         }
         for(var i:int = 0; i < item.modifierXML.length(); i++)
         {
            modid = int(item.modifierXML[i].id);
            if(modid == 9)
            {
               StatsManager.changeXP(item.modifierXML[i].value);
            }
            else
            {
               if(modid == 25)
               {
                  if(StatsManager.getLevel() > StatsManager.levelCap || StatsManager.didRebirth)
                  {
                     QueryManager.instance.reportHack("multiple rebirth");
                     return;
                  }
                  if(StatsManager.getLevel() == StatsManager.levelCap)
                  {
                     this.onLeave(null);
                     OverworldHUD.instance.interactUI.show(InteractUI.UIMODE_REBIRTH);
                     return;
                  }
                  OverworldHUD.instance.showDialog(LangManager.getString(185),LangManager.getString(5));
                  return;
               }
               if(modid == 90)
               {
                  this.onLeave(null);
                  OverworldHUD.instance.interactUI.show(InteractUI.UIMODE_LEAVECLAN);
                  return;
               }
               if(modid == 97)
               {
                  StatsManager.changeSex();
                  OverworldHUD.instance.friendpanel.refreshSelf();
               }
               else
               {
                  if(modid == 98)
                  {
                     StatsManager.unequipAll();
                     StatsManager.inventory = new Vector.<Item>();
                     StatsManager.setStat(1009,10);
                     StatsManager.setStat(11,1000);
                     OverworldHUD.instance.lootDialog.addLootItem(2201,StatsManager.getLevel(),1);
                     OverworldHUD.instance.lootDialog.addLootItem(2206,StatsManager.getLevel(),10);
                     for(j = 0; j < 20; j++)
                     {
                        OverworldHUD.instance.lootDialog.addRandomLootItem(StatsManager.getLevel(),true,true);
                     }
                     OverworldHUD.instance.lootDialog.notifyDontRefreshAfter();
                     OverworldHUD.instance.lootDialog.notifyDontChangeInputModeAfter();
                     OverworldHUD.instance.lootDialog.show();
                     OverworldHUD.instance.lootDialog.onClick(null);
                     this.inventory = StatsManager.inventory.concat(StatsManager.questItems);
                     this.show();
                     StatsManager.completedQuestList.fixed = false;
                     StatsManager.completedQuestList.length = 0;
                     StatsManager.completedQuestList.fixed = true;
                     OverworldHUD.getInstance().screenTransition.setTeleportTarget(8382465,150,0);
                     OverworldHUD.getInstance().screenTransition.startClose(ScreenTransition.ACTION_TELEPORT);
                     return;
                  }
                  if(modid == 99)
                  {
                     StatsManager.fullHealth();
                  }
                  else
                  {
                     if(modid == 101)
                     {
                        this.onLeave(null);
                        OverworldHUD.instance.changeNameDialog.show(ChangeNameDialog.MODE_CHANGENAME);
                        return;
                     }
                     if(modid == 102)
                     {
                        this.reduceInventory();
                        this.onLeave(null);
                        OverworldHUD.getInstance().screenTransition.setTeleportTarget(item.modifierXML[i].value,0,0);
                        OverworldHUD.getInstance().screenTransition.startClose(ScreenTransition.ACTION_TELEPORT);
                        return;
                     }
                     if(modid == 78)
                     {
                        StatsManager.unAssignStatPoints();
                     }
                     else if(modid == 79)
                     {
                        StatsManager.unAssignSkillPoints();
                     }
                     else if(modid == 82)
                     {
                        StatsManager.repairEquippedWeapon(item.modifierXML[i].value);
                        StatsManager.reportAchievementStat(60005,1);
                     }
                     else if(modid == 84)
                     {
                        OverworldHUD.instance.lootDialog.addRandomLootItem(StatsManager.getLevel(),true,true);
                        OverworldHUD.instance.lootDialog.notifyDontRefreshAfter();
                        OverworldHUD.instance.lootDialog.notifyDontChangeInputModeAfter();
                        OverworldHUD.instance.lootDialog.show();
                        this.inventory = StatsManager.inventory.concat(StatsManager.questItems);
                     }
                     else if(modid == 103)
                     {
                        OverworldHUD.instance.lootDialog.addRareLootItem(item.modifierXML[i].value,StatsManager.getLevel(),1,true);
                     }
                     else if(modid == 106)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(item.modifierXML[i].value,1);
                     }
                     else if(modid == 104)
                     {
                        OverworldHUD.instance.lootDialog.notifyDontRefreshAfter();
                        OverworldHUD.instance.lootDialog.notifyDontChangeInputModeAfter();
                        OverworldHUD.instance.lootDialog.show();
                        this.inventory = StatsManager.inventory.concat(StatsManager.questItems);
                     }
                     else if(modid == 105)
                     {
                        seed = QueryManager.instance.getServerDate();
                        ItemGenerator.instance.setRNGSeed(seed);
                     }
                     else if(modid == 34)
                     {
                        genArray = item.modifierXML[i].value.split(",");
                        StatsManager.addGeneratedItemToInventory(genArray[0],genArray[1]);
                     }
                     else
                     {
                        if(modid == 96)
                        {
                           if(StatsManager.getLevel() < 3 || StageManager.getRoomPrivate() == 8)
                           {
                              OverworldHUD.instance.showDialog(LangManager.getString(714),LangManager.getString(5));
                              return;
                           }
                           territory = NodeGenerator.instance.getTerritory(StageManager.getCurrentNode());
                           territoryData = NodeGenerator.instance.getTerritoryData(territory.x,territory.y,false);
                           if(Boolean(StageManager.getCurrentRoom() == 0) || Boolean(territoryData.isTown(StageManager.getCurrentNode()) && !territoryData.isAbandonedTown() && !territoryData.territoryAtWar()) || Boolean(territoryData.isDojo(StageManager.getCurrentNode())))
                           {
                              this.onLeave(null);
                              nodeid = territoryData.getDojo();
                              OverworldHUD.getInstance().screenTransition.setTeleportTarget(nodeid,0,400);
                              OverworldHUD.getInstance().screenTransition.startClose(ScreenTransition.ACTION_TELEPORT);
                              return;
                           }
                           OverworldHUD.instance.showDialog(LangManager.getString(714),LangManager.getString(5));
                           return;
                        }
                        if(modid == 117)
                        {
                           StatsManager.completedQuestList.fixed = false;
                           StatsManager.completedQuestList.length = 0;
                           StatsManager.completedQuestList.fixed = true;
                           StatsManager.activeQuestList.fixed = false;
                           StatsManager.activeQuestList.length = 0;
                           StatsManager.activeQuestList.fixed = true;
                           StatsManager.setStat(30000,0);
                           StatsManager.setStat(40000,0);
                           StatsManager.setStat(40002,0);
                           QueryManager.instance.reportDataModified(StatsManager.COMPLETEDQUEST);
                           QueryManager.instance.reportDataModified(StatsManager.ACTIVEQUEST);
                           this.reduceInventory();
                           this.onLeave(null);
                           OverworldHUD.getInstance().screenTransition.setTeleportTarget(8382465,0,150);
                           OverworldHUD.getInstance().screenTransition.startClose(ScreenTransition.ACTION_TELEPORTDOWNED);
                           return;
                        }
                        if(modid == 122)
                        {
                           this.onLeave(null);
                           OverworldHUD.instance.onShowDragonDanceUI();
                           return;
                        }
                        if(modid == 123)
                        {
                           if(StatsManager.getWarRank() < 10)
                           {
                              OverworldHUD.instance.showDialog(LangManager.getString(827),LangManager.getString(5));
                              return;
                           }
                           this.onLeave(null);
                           OverworldHUD.instance.showCreateClanDialog(false);
                           return;
                        }
                        if(modid == 124)
                        {
                           this.onLeave(null);
                           OverworldHUD.instance.showCreateClanDialog(true);
                           return;
                        }
                        if(modid == 38)
                        {
                           StatsManager.setBuff(item.modifierXML[i].value,30 * 60);
                        }
                        else if(modid < 2000)
                        {
                           StatsManager.changeStat(modid,item.modifierXML[i].value);
                        }
                        else if(modid >= 30000)
                        {
                           StatsManager.setStat(modid,item.modifierXML[i].value);
                        }
                        else
                        {
                           StatsManager.changeItemQty(modid,item.modifierXML[i].value);
                        }
                     }
                  }
               }
            }
         }
         this.reduceInventory();
         StatsManager.refreshStats();
         this.updateAllStats();
         OverworldHUD.instance.updateHUD();
         this.refreshInventory();
         this.itemPanelClose(null);
      }
      
      public function reduceInventory() : void
      {
         var newQty:int = 0;
         if(this.selectedSlotItem.canStack())
         {
            newQty = StatsManager.changeItemQty(this.selectedSlotItem.itemID,-1);
         }
         else
         {
            newQty = 0;
            StatsManager.removeItemFromInventory(this.selectedSlotItem);
         }
         if(newQty <= 0)
         {
            this.inventory = StatsManager.inventory;
            this.inventory = this.inventory.concat(StatsManager.questItems);
            this.totalRows = Math.floor((this.inventory.length - 1) / this.cols);
            if(this.totalRows < 0)
            {
               this.topRow = 0;
               this.totalRows = 0;
            }
            this.itemPanelClose(null);
            this.refreshInventory();
         }
         else
         {
            this.selectedSlot.setQtyText("x" + newQty.toString());
            this.selectedSlot.visible = true;
            this.refreshInventory();
         }
         QueryManager.instance.reportDataModified(StatsManager.ITEM);
      }
      
      public function onEquip() : void
      {
         var existingItem:Item = null;
         var tempItem:ShopItem = null;
         if(this.selectedSlotItem.getLevel() > StatsManager.getLevel())
         {
            OverworldHUD.getInstance().showDialog(LangManager.getString(185),LangManager.getString(5));
            return;
         }
         var itemID:int = this.selectedSlotItem.itemID;
         var item:Item = this.selectedSlotItem;
         var tempValue:int = Math.floor(itemID / 1000);
         if(QuestEngine.getItemData(item.itemID).unique == 1)
         {
            switch(QuestEngine.getItemData(item.itemID).type)
            {
               case 11:
                  tempValue = 3;
                  break;
               case 0:
                  tempValue = 4;
                  break;
               case 1:
                  tempValue = 5;
                  break;
               case 3:
                  tempValue = 7;
                  break;
               case 5:
                  tempValue = 9;
                  break;
               case 7:
                  tempValue = 11;
                  break;
               case 8:
                  tempValue = 12;
                  break;
               case 9:
                  tempValue = 13;
                  break;
               default:
                  trace("out of range");
            }
         }
         switch(tempValue)
         {
            case 3:
               if(StatsManager.equipment[StatsManager.EQ_ACCESSORY1].itemID == 0)
               {
                  existingItem = new Item(0);
                  tempItem = this.equippedSlots[this.SLOT_RING1];
                  this.acc1Icon.visible = false;
                  StatsManager.equipItem(StatsManager.EQ_ACCESSORY1,item);
               }
               else if(StatsManager.equipment[StatsManager.EQ_ACCESSORY2].itemID == 0)
               {
                  existingItem = new Item(0);
                  tempItem = this.equippedSlots[this.SLOT_RING2];
                  this.acc2Icon.visible = false;
                  StatsManager.equipItem(StatsManager.EQ_ACCESSORY2,item);
               }
               else
               {
                  existingItem = StatsManager.equipment[StatsManager.EQ_ACCESSORY1];
                  tempItem = this.equippedSlots[this.SLOT_RING1];
                  this.acc1Icon.visible = false;
                  StatsManager.equipItem(StatsManager.EQ_ACCESSORY1,item);
               }
               break;
            case 4:
               existingItem = StatsManager.equipment[StatsManager.EQ_ARMOR];
               tempItem = this.equippedSlots[this.SLOT_ARMOR];
               if(existingItem.itemID == 4001 || existingItem.itemID == 4000)
               {
                  existingItem = new Item(0);
               }
               this.armorIcon.visible = false;
               StatsManager.equipItem(StatsManager.EQ_ARMOR,item);
               OverworldHUD.instance.friendpanel.refreshSelf();
               break;
            case 5:
               existingItem = StatsManager.equipment[StatsManager.EQ_GLOVES];
               tempItem = this.equippedSlots[this.SLOT_GLOVES];
               this.glovesIcon.visible = false;
               StatsManager.equipItem(StatsManager.EQ_GLOVES,item);
               break;
            case 7:
               existingItem = StatsManager.equipment[StatsManager.EQ_HAT];
               tempItem = this.equippedSlots[this.SLOT_HAT];
               this.hatIcon.visible = false;
               StatsManager.equipItem(StatsManager.EQ_HAT,item);
               OverworldHUD.instance.friendpanel.refreshSelf();
               break;
            case 9:
               existingItem = StatsManager.equipment[StatsManager.EQ_MASK];
               tempItem = this.equippedSlots[this.SLOT_MASK];
               this.maskIcon.visible = false;
               StatsManager.equipItem(StatsManager.EQ_MASK,item);
               OverworldHUD.instance.friendpanel.refreshSelf();
               break;
            case 11:
               existingItem = StatsManager.equipment[StatsManager.EQ_PANTS];
               tempItem = this.equippedSlots[this.SLOT_PANTS];
               if(existingItem.itemID == 11001)
               {
                  existingItem = new Item(0);
               }
               this.pantsIcon.visible = false;
               StatsManager.equipItem(StatsManager.EQ_PANTS,item);
               break;
            case 12:
               existingItem = StatsManager.equipment[StatsManager.EQ_SHOES];
               tempItem = this.equippedSlots[this.SLOT_SHOES];
               this.shoesIcon.visible = false;
               StatsManager.equipItem(StatsManager.EQ_SHOES,item);
               break;
            case 13:
               existingItem = StatsManager.equipment[StatsManager.EQ_WEAPON];
               tempItem = this.equippedSlots[this.SLOT_WEAPON];
               this.weaponIcon.visible = false;
               StatsManager.equipItem(StatsManager.EQ_WEAPON,item);
               break;
            case 6:
               existingItem = StatsManager.equipment[StatsManager.EQ_HAIR];
               if(existingItem.getQuantity() == 0)
               {
                  existingItem.setQuantity(1);
               }
               StatsManager.addItemToInventory(existingItem);
               StatsManager.equipItem(StatsManager.EQ_HAIR,item);
               OverworldHUD.instance.friendpanel.refreshSelf();
               break;
            case 8:
               existingItem = StatsManager.equipment[StatsManager.EQ_HEAD];
               if(existingItem.getQuantity() == 0)
               {
                  existingItem.setQuantity(1);
               }
               StatsManager.addItemToInventory(existingItem);
               StatsManager.equipItem(StatsManager.EQ_HEAD,item);
               OverworldHUD.instance.friendpanel.refreshSelf();
         }
         if(tempItem != null)
         {
            tempItem.visible = true;
            tempItem.setItemID(itemID,this.selectedSlotItem.getShopItemType(),this.selectedSlotItem.getPrimaryColor(),this.selectedSlotItem.getSecondaryColor());
            if(this.selectedSlotItem.canStack())
            {
               tempItem.setItem(new Item(itemID));
            }
            else
            {
               tempItem.setItem(this.selectedSlotItem);
            }
            tempItem.setQtyText("");
            tempItem.setGotSelected(false);
            if(existingItem.itemID != 0 && existingItem.itemID != 4001 && existingItem.itemID != 4000 && existingItem.itemID != 11001)
            {
               if(existingItem.getQuantity() == 0)
               {
                  existingItem.setQuantity(1);
               }
               StatsManager.addItemToInventory(existingItem);
            }
         }
         if(QuestEngine.getItemData(this.selectedSlotItem.itemID).unique == 0 && this.selectedSlotItem.getModifierCount() == 0 && this.selectedSlotItem.uses == 0 && !this.selectedSlotItem.named || this.selectedSlotItem.itemID < 3000)
         {
            StatsManager.changeItemQty(this.selectedSlotItem.itemID,-1);
         }
         else
         {
            StatsManager.removeItemFromInventory(this.selectedSlotItem);
         }
         this.inventory = StatsManager.inventory;
         this.inventory = this.inventory.concat(StatsManager.questItems);
         this.totalRows = Math.floor((this.inventory.length - 1) / this.cols);
         if(this.totalRows < 0)
         {
            this.topRow = 0;
            this.totalRows = 0;
         }
         this.itemPanelClose(null);
         this.updateAllStats();
         StatsManager.refreshStats();
         OverworldHUD.instance.updateHUD();
         this.refreshInventory();
         QueryManager.instance.reportDataModified(StatsManager.ITEM);
      }
      
      public function onDrop(mouseEvent:MouseEvent) : void
      {
         this.confirmDialog.visible = true;
      }
      
      internal function doDropCancel(mouseEvent:MouseEvent) : *
      {
         this.confirmDialog.visible = false;
      }
      
      internal function doDrop(mouseEvent:MouseEvent) : *
      {
         if(this.invMode == MODE_GIVE)
         {
            if(!StatsManager.hackReported)
            {
               this.giveList.push(this.selectedSlotItem);
               this.reduceInventory();
            }
            else
            {
               this.onLeave(null);
               OverworldHUD.instance.showDialog(LangManager.getString(679),LangManager.getString(5));
            }
         }
         else
         {
            this.reduceInventory();
         }
         this.confirmDialog.visible = false;
      }
      
      public function onMouseDOWN(mouseEvent:MouseEvent) : *
      {
         this.mousedown = true;
         this.dragitem.setItemID(mouseEvent.target.itemID,mouseEvent.target.getBorderType(),mouseEvent.target.getPrimaryColor(),mouseEvent.target.getSecondaryColor());
         this.dragitem.setDisplayOnly();
         this.dragitem.x = mouseX - 35;
         this.dragitem.y = mouseY - 35;
         if((mouseEvent.stageX - StatsManager.stageOffsetX) / StatsManager.stageScale < 355)
         {
            this.onClickEquip(mouseEvent);
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
            this.dragitem.alpha = 0.8;
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
                  if(this.selectedSlotItem.itemID < 3000)
                  {
                     this.onUseItem();
                  }
                  else if(this.selectedSlotItem.itemID < 20000)
                  {
                     this.onEquip();
                  }
               }
            }
            else if(this.dragequipflag)
            {
               this.onUnequip();
            }
            this.dragitem.visible = false;
            this.dragitem.cacheAsBitmap = false;
         }
         this.mousedown = false;
      }
      
      public function onClickInventory(mouseEvent:MouseEvent) : void
      {
         var clickedItem:ShopItem = ShopItem(mouseEvent.currentTarget);
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
         this.itemPanelOpen();
         this.itemPanel.selectItem.setItemID(clickedItem.itemID,clickedItem.getBorderType(),clickedItem.getPrimaryColor(),clickedItem.getSecondaryColor());
         this.itemPanel.selectItem.setQtyText("");
         this.itemPanel.selectItemName.htmlText = this.selectedSlotItem.getNameBlackBG();
         if(this.selectedSlotItem.getDesc() == "")
         {
            this.itemPanel.selectItemAttribute.htmlText = this.selectedSlotItem.getCompareAttributes();
         }
         else
         {
            this.itemPanel.selectItemAttribute.htmlText = this.selectedSlotItem.getDesc() + "\n\n" + this.selectedSlotItem.getCompareAttributes();
         }
         this.descScrollDown.visible = this.itemPanel.selectItemAttribute.numLines > 7;
         this.contextButton.visible = false;
         var itemID:int = this.selectedSlotItem.itemID;
         if(itemID >= 20000 || itemID < 3000 && itemID >= 2500)
         {
            this.contextButton.visible = false;
            if(this.invMode == MODE_GIVE && this.selectedSlotItem.isNoGive())
            {
               this.dropButton.visible = false;
            }
            else
            {
               this.dropButton.visible = this.selectedSlotItem.canDrop();
            }
         }
         else if(itemID < 2500 && itemID > 1999)
         {
            if(this.invMode != MODE_GIVE)
            {
               this.setContextButton(CONTEXT_USE);
               this.contextButton.visible = true;
            }
            if(this.invMode == MODE_GIVE && this.selectedSlotItem.isNoGive() || this.invMode != MODE_GIVE && !this.selectedSlotItem.canDrop())
            {
               this.dropButton.visible = false;
            }
            else
            {
               this.dropButton.visible = true;
            }
         }
         else
         {
            if(this.invMode != MODE_GIVE)
            {
               this.setContextButton(CONTEXT_EQUIP);
               this.contextButton.visible = true;
            }
            if(this.invMode == MODE_GIVE && this.selectedSlotItem.isNoGive())
            {
               this.dropButton.visible = false;
            }
            else
            {
               this.dropButton.visible = true;
            }
         }
      }
      
      public function onDoubleClickInventory(mouseEvent:MouseEvent) : void
      {
         if(this.invMode == MODE_GIVE)
         {
            if(!this.selectedSlotItem.isNoGive())
            {
               this.doDrop(null);
            }
            return;
         }
         this.selectedSlot = ShopItem(mouseEvent.currentTarget);
         var itemID:int = this.selectedSlotItem.itemID;
         if(itemID < 3000 && itemID > 1999)
         {
            this.onUseItem();
         }
         else if(itemID < 20000)
         {
            this.onEquip();
         }
      }
      
      public function onClickEquip(mouseEvent:MouseEvent) : void
      {
         var clickedItem:ShopItem = ShopItem(mouseEvent.currentTarget);
         if(clickedItem != this.selectedSlot)
         {
            if(this.selectedSlot != null)
            {
               this.selectedSlot.setGotSelected(false);
            }
            this.selectedSlot = clickedItem;
            this.selectedSlotItem = clickedItem.getItem();
            this.selectedSlot.setGotSelected(true);
            this.itemPanelOpen();
            this.itemPanel.selectItem.setItemID(clickedItem.itemID,clickedItem.getBorderType(),clickedItem.getPrimaryColor(),clickedItem.getSecondaryColor());
            this.itemPanel.selectItem.setQtyText("");
            this.itemPanel.selectItemName.htmlText = this.selectedSlotItem.getNameBlackBG();
            if(this.selectedSlotItem.getDesc() == "")
            {
               this.itemPanel.selectItemAttribute.htmlText = this.selectedSlotItem.getEquipAttributes();
            }
            else
            {
               this.itemPanel.selectItemAttribute.htmlText = this.selectedSlotItem.getDesc() + "\n\n" + this.selectedSlotItem.getEquipAttributes();
            }
            this.setContextButton(CONTEXT_UNEQUIP);
            this.contextButton.visible = true;
            this.dropButton.visible = false;
         }
      }
      
      public function onDoubleClickEquip(mouseEvent:MouseEvent) : void
      {
         this.selectedSlot = ShopItem(mouseEvent.currentTarget);
         this.selectedSlotItem = this.selectedSlot.item;
         this.onUnequip();
      }
      
      internal function chatButtonClick(mouseEvent:MouseEvent) : *
      {
         var inChatItem:Item = null;
         if(this.itemPanel.visible)
         {
            inChatItem = this.selectedSlotItem;
            this.onLeave(null);
            OverworldHUD.instance.showItemInChat(inChatItem);
         }
      }
      
      internal function allstatsbuttonClick(event:MouseEvent) : *
      {
         this.showAllStats(!this.allstatstext.visible);
      }
      
      internal function showAllStats(flag:Boolean) : *
      {
         var i:int = 0;
         if(flag)
         {
            this.setAllStatsText();
            this.allstatstext.visible = true;
            this.allstatsbutton.setText("eq");
            for(i = 0; i < this.totalEquippedSlots; i++)
            {
               this.equippedSlots[i].visible = false;
            }
            this.playerImage.visible = false;
            this.hatIcon.visible = false;
            this.maskIcon.visible = false;
            this.armorIcon.visible = false;
            this.glovesIcon.visible = false;
            this.pantsIcon.visible = false;
            this.weaponIcon.visible = false;
            this.acc1Icon.visible = false;
            this.shoesIcon.visible = false;
            this.acc2Icon.visible = false;
            this.CharName.visible = false;
            this.danfield.visible = false;
         }
         else
         {
            this.allstatstext.visible = false;
            this.allstatsbutton.setText("stats");
            for(i = 0; i < this.totalEquippedSlots; i++)
            {
               this.equippedSlots[i].visible = true;
            }
            this.playerImage.visible = true;
            this.hatIcon.visible = true;
            this.maskIcon.visible = true;
            this.armorIcon.visible = true;
            this.glovesIcon.visible = true;
            this.pantsIcon.visible = true;
            this.weaponIcon.visible = true;
            this.acc1Icon.visible = true;
            this.shoesIcon.visible = true;
            this.acc2Icon.visible = true;
            this.CharName.visible = true;
            this.danfield.visible = true;
            this.refreshEquipment();
         }
      }
      
      internal function setAllStatsText() : *
      {
         var piercingDmg:int = 0;
         var dmgModifier:Number = NaN;
         var critModifier:Number = NaN;
         var minCrit:int = 0;
         var maxCrit:int = 0;
         var stanceName:String = null;
         var mastery:int = 0;
         var defModifier:Number = NaN;
         var slashModifier:Number = NaN;
         var itemXML:XMLItem = null;
         var itemType:int = 0;
         var equippedItem:Item = null;
         var equippedItemXML:XMLItem = null;
         var selectedBonus:int = 0;
         var equippedBonus:int = 0;
         var attackDiff:int = 0;
         var speed:int = 0;
         var newSpeed:* = undefined;
         var equippedMinDamage:int = 0;
         var equippedMaxDamage:int = 0;
         var selectedMinDamage:int = 0;
         var selectedMaxDamage:int = 0;
         var minDamage:int = StatsManager.getMinDamage();
         var maxDamage:int = minDamage + StatsManager.getDamageRange();
         var defense:int = StatsManager.getPlayerStats(StatsManager.STAT_DEFENSE) + StatsManager.findBonusStat(StatsManager.STAT_DEFENSE);
         var fireATK:int = StatsManager.getPlayerStats(StatsManager.STAT_FIREATK) + StatsManager.findBonusStat(StatsManager.STAT_FIREATK);
         var waterATK:int = StatsManager.getPlayerStats(StatsManager.STAT_WATERATK) + StatsManager.findBonusStat(StatsManager.STAT_WATERATK);
         var windATK:int = StatsManager.getPlayerStats(StatsManager.STAT_WINDATK) + StatsManager.findBonusStat(StatsManager.STAT_WINDATK);
         var earthATK:int = StatsManager.getPlayerStats(StatsManager.STAT_EARTHATK) + StatsManager.findBonusStat(StatsManager.STAT_EARTHATK);
         var fireDEF:int = StatsManager.getPlayerStats(StatsManager.STAT_WATERATK) + StatsManager.findBonusStat(StatsManager.STAT_FIREDEF);
         var waterDEF:int = StatsManager.getPlayerStats(StatsManager.STAT_WINDATK) + StatsManager.findBonusStat(StatsManager.STAT_WATERDEF);
         var windDEF:int = StatsManager.getPlayerStats(StatsManager.STAT_EARTHATK) + StatsManager.findBonusStat(StatsManager.STAT_WINDDEF);
         var earthDEF:int = StatsManager.getPlayerStats(StatsManager.STAT_FIREATK) + StatsManager.findBonusStat(StatsManager.STAT_EARTHDEF);
         var criticalDmg:int = StatsManager.findBonusStat(StatsManager.STAT_CRITICALDMG);
         piercingDmg = StatsManager.findBonusStat(StatsManager.STAT_PIERCINGDMG);
         var hp:int = StatsManager.getStat(StatsManager.STAT_HP);
         var maxHp:int = StatsManager.getStat(StatsManager.STAT_MAXHP) + StatsManager.findBonusStat(StatsManager.STAT_MAXHP);
         var hpRegen:int = StatsManager.getStat(StatsManager.STAT_HPREGEN) + StatsManager.findBonusStat(StatsManager.STAT_HPREGEN);
         var chi:int = StatsManager.getStat(StatsManager.STAT_CHI);
         var maxChi:int = StatsManager.getStat(StatsManager.STAT_MAXCHI) + StatsManager.findBonusStat(StatsManager.STAT_MAXCHI);
         var chiRegen:int = StatsManager.getStat(StatsManager.STAT_CHIREGEN) + StatsManager.findBonusStat(StatsManager.STAT_CHIREGEN);
         piercingDmg = new Damage(1,StatsManager.getLevel()).getMinDamage() + StatsManager.findBonusStat(StatsManager.STAT_PIERCINGDMG);
         var skillCooldownModifier:Number = StatsManager.getSkillCooldownModifier();
         var baseSlashLength:int = StatsManager.getBaseSlashLength();
         var maxHpDiff:int = 0;
         var hpRegenDiff:int = 0;
         var maxChiDiff:int = 0;
         var chiRegenDiff:int = 0;
         var fireATKDiff:int = 0;
         var waterATKDiff:int = 0;
         var windATKDiff:int = 0;
         var earthATKDiff:int = 0;
         var fireDEFDiff:int = 0;
         var waterDEFDiff:int = 0;
         var windDEFDiff:int = 0;
         var earthDEFDiff:int = 0;
         var defDiff:int = 0;
         var minDamageDiff:int = 0;
         var maxDamageDiff:int = 0;
         var speedDiff:int = 0;
         var criticalDmgDiff:int = 0;
         var piercingDmgDiff:int = 0;
         if(this.selectedSlotItem != null)
         {
            itemXML = QuestEngine.getItemData(this.selectedSlotItem.itemID);
            itemType = itemXML.type;
            equippedItem = StatsManager.equipment[itemType];
            if(equippedItem.itemID == 0 || itemType == 10 || itemType == 12)
            {
               equippedItem = null;
            }
            else
            {
               equippedItemXML = QuestEngine.getItemData(equippedItem.itemID);
            }
            selectedBonus = this.selectedSlotItem.getModifierBonus(StatsManager.STAT_MAXHP);
            if(equippedItem == null)
            {
               equippedBonus = 0;
            }
            else
            {
               equippedBonus = equippedItem.getModifierBonus(StatsManager.STAT_MAXHP);
            }
            maxHpDiff = selectedBonus - equippedBonus;
            maxHp += maxHpDiff;
            selectedBonus = this.selectedSlotItem.getModifierBonus(StatsManager.STAT_HPREGEN);
            if(equippedItem == null)
            {
               equippedBonus = 0;
            }
            else
            {
               equippedBonus = equippedItem.getModifierBonus(StatsManager.STAT_HPREGEN);
            }
            hpRegenDiff = selectedBonus - equippedBonus;
            hpRegen += hpRegenDiff;
            selectedBonus = this.selectedSlotItem.getModifierBonus(StatsManager.STAT_MAXCHI);
            if(equippedItem == null)
            {
               equippedBonus = 0;
            }
            else
            {
               equippedBonus = equippedItem.getModifierBonus(StatsManager.STAT_MAXCHI);
            }
            maxChiDiff = selectedBonus - equippedBonus;
            maxChi += maxChiDiff;
            selectedBonus = this.selectedSlotItem.getModifierBonus(StatsManager.STAT_CHIREGEN);
            if(equippedItem == null)
            {
               equippedBonus = 0;
            }
            else
            {
               equippedBonus = equippedItem.getModifierBonus(StatsManager.STAT_CHIREGEN);
            }
            chiRegenDiff = selectedBonus - equippedBonus;
            chiRegen += chiRegenDiff;
            selectedBonus = this.selectedSlotItem.getModifierBonus(StatsManager.STAT_ATTACK);
            if(equippedItem == null)
            {
               equippedBonus = 0;
            }
            else
            {
               equippedBonus = equippedItem.getModifierBonus(StatsManager.STAT_ATTACK);
            }
            attackDiff = selectedBonus - equippedBonus;
            if(itemXML.mindamage > 0 || itemXML.maxdamage > 0)
            {
               if(equippedItem == null)
               {
                  equippedMinDamage = 0;
                  equippedMaxDamage = 0;
               }
               else if(equippedItem.isBroken())
               {
                  equippedMinDamage = 1;
                  equippedMaxDamage = 1;
               }
               else
               {
                  equippedMinDamage = equippedItemXML.mindamage + equippedBonus;
                  equippedMaxDamage = equippedItemXML.maxdamage + equippedBonus;
               }
               if(this.selectedSlotItem.isBroken())
               {
                  selectedMinDamage = 1;
                  selectedMaxDamage = 1;
               }
               else
               {
                  selectedMinDamage = itemXML.mindamage + selectedBonus;
                  selectedMaxDamage = itemXML.maxdamage + selectedBonus;
               }
               minDamageDiff = selectedMinDamage - equippedMinDamage;
               maxDamageDiff = selectedMaxDamage - equippedMaxDamage;
            }
            else
            {
               minDamageDiff = attackDiff;
               maxDamageDiff = attackDiff;
            }
            minDamage += minDamageDiff;
            maxDamage += maxDamageDiff;
            selectedBonus = this.selectedSlotItem.getModifierBonus(StatsManager.STAT_FIREATK);
            if(equippedItem == null)
            {
               equippedBonus = 0;
            }
            else
            {
               equippedBonus = equippedItem.getModifierBonus(StatsManager.STAT_FIREATK);
            }
            fireATKDiff = selectedBonus - equippedBonus;
            fireATK += fireATKDiff;
            selectedBonus = this.selectedSlotItem.getModifierBonus(StatsManager.STAT_WATERATK);
            if(equippedItem == null)
            {
               equippedBonus = 0;
            }
            else
            {
               equippedBonus = equippedItem.getModifierBonus(StatsManager.STAT_WATERATK);
            }
            waterATKDiff = selectedBonus - equippedBonus;
            waterATK += waterATKDiff;
            selectedBonus = this.selectedSlotItem.getModifierBonus(StatsManager.STAT_WINDATK);
            if(equippedItem == null)
            {
               equippedBonus = 0;
            }
            else
            {
               equippedBonus = equippedItem.getModifierBonus(StatsManager.STAT_WINDATK);
            }
            windATKDiff = selectedBonus - equippedBonus;
            windATK += windATKDiff;
            selectedBonus = this.selectedSlotItem.getModifierBonus(StatsManager.STAT_EARTHATK);
            if(equippedItem == null)
            {
               equippedBonus = 0;
            }
            else
            {
               equippedBonus = equippedItem.getModifierBonus(StatsManager.STAT_EARTHATK);
            }
            earthATKDiff = selectedBonus - equippedBonus;
            earthATK += earthATKDiff;
            selectedBonus = this.selectedSlotItem.getModifierBonus(StatsManager.STAT_FIREDEF);
            if(equippedItem == null)
            {
               equippedBonus = 0;
            }
            else
            {
               equippedBonus = equippedItem.getModifierBonus(StatsManager.STAT_FIREDEF);
            }
            fireDEFDiff = selectedBonus - equippedBonus;
            fireDEF += fireDEFDiff;
            selectedBonus = this.selectedSlotItem.getModifierBonus(StatsManager.STAT_WATERDEF);
            if(equippedItem == null)
            {
               equippedBonus = 0;
            }
            else
            {
               equippedBonus = equippedItem.getModifierBonus(StatsManager.STAT_WATERDEF);
            }
            waterDEFDiff = selectedBonus - equippedBonus;
            waterDEF += waterDEFDiff;
            selectedBonus = this.selectedSlotItem.getModifierBonus(StatsManager.STAT_WINDDEF);
            if(equippedItem == null)
            {
               equippedBonus = 0;
            }
            else
            {
               equippedBonus = equippedItem.getModifierBonus(StatsManager.STAT_WINDDEF);
            }
            windDEFDiff = selectedBonus - equippedBonus;
            windDEF += windDEFDiff;
            selectedBonus = this.selectedSlotItem.getModifierBonus(StatsManager.STAT_EARTHDEF);
            if(equippedItem == null)
            {
               equippedBonus = 0;
            }
            else
            {
               equippedBonus = equippedItem.getModifierBonus(StatsManager.STAT_EARTHDEF);
            }
            earthDEFDiff = selectedBonus - equippedBonus;
            earthDEF += earthDEFDiff;
            selectedBonus = this.selectedSlotItem.getModifierBonus(StatsManager.STAT_CRITICALDMG);
            if(equippedItem == null)
            {
               equippedBonus = 0;
            }
            else
            {
               equippedBonus = equippedItem.getModifierBonus(StatsManager.STAT_CRITICALDMG);
            }
            criticalDmgDiff = selectedBonus - equippedBonus;
            selectedBonus = this.selectedSlotItem.getModifierBonus(StatsManager.STAT_PIERCINGDMG);
            if(equippedItem == null)
            {
               equippedBonus = 0;
            }
            else
            {
               equippedBonus = equippedItem.getModifierBonus(StatsManager.STAT_PIERCINGDMG);
            }
            piercingDmgDiff = selectedBonus - equippedBonus;
            piercingDmg += piercingDmgDiff;
            selectedBonus = this.selectedSlotItem.getModifierBonus(StatsManager.STAT_DEFENSE) + itemXML.defense;
            if(equippedItem == null)
            {
               equippedBonus = 0;
            }
            else
            {
               equippedBonus = equippedItem.getModifierBonus(StatsManager.STAT_DEFENSE) + equippedItemXML.defense;
            }
            defDiff = selectedBonus - equippedBonus;
            defense += defDiff;
            speed = StatsManager.getPlayerStats(StatsManager.STAT_SPEED) + StatsManager.findBonusStat(StatsManager.STAT_SPEED);
            selectedBonus = this.selectedSlotItem.getModifierBonus(StatsManager.STAT_SPEED);
            if(equippedItem == null)
            {
               equippedBonus = 0;
            }
            else
            {
               equippedBonus = equippedItem.getModifierBonus(StatsManager.STAT_SPEED);
            }
            speedDiff = selectedBonus - equippedBonus;
            newSpeed = speed + speedDiff;
            skillCooldownModifier = StatsManager.getSkillCooldownModifierVal(newSpeed);
            baseSlashLength = StatsManager.getBaseSlashLengthVal(newSpeed);
         }
         var stance:int = StatsManager.stance;
         if(stance == MCSPlayer.LIGHT_STANCE)
         {
            stanceName = "light";
            mastery = StatsManager.getStat(1000);
            dmgModifier = 0.5 + 0.5 * mastery * 0.01;
            critModifier = 1.2;
            defModifier = 1;
            slashModifier = 1.5;
         }
         else if(stance == MCSPlayer.BALANCED_STANCE)
         {
            stanceName = "balanced";
            mastery = StatsManager.getStat(1001);
            dmgModifier = 1 + 0.5 * mastery * 0.01;
            critModifier = 1.5;
            defModifier = 1;
            slashModifier = 1 + 0.5 * mastery * 0.01;
         }
         else if(stance == MCSPlayer.HEAVY_STANCE)
         {
            stanceName = "heavy";
            mastery = StatsManager.getStat(1002);
            dmgModifier = 1.5;
            critModifier = 1.5;
            defModifier = 0.8;
            slashModifier = 0.5 + 0.5 * mastery * 0.01;
         }
         minDamage *= dmgModifier;
         maxDamage *= dmgModifier;
         minCrit = minDamage * critModifier + criticalDmgDiff;
         maxCrit = maxDamage * critModifier + criticalDmgDiff;
         if(hp > maxHp)
         {
            hp = maxHp;
         }
         if(chi > maxChi)
         {
            chi = maxChi;
         }
         var REDCOLOR:String = "<font color=\'#FF0000\'>";
         var GREENCOLOR:String = "<font color=\'#00A606\'>";
         var DEFAULTCOLOR:String = "<font color=\'#CCCCCC\'>";
         var FONTEND:String = "</font>";
         var FONTCOLOR1:String = "";
         var FONTCOLOR2:String = "";
         var str:String = "";
         if(maxHpDiff == 0)
         {
            FONTCOLOR1 = DEFAULTCOLOR;
         }
         else if(maxHpDiff > 0)
         {
            FONTCOLOR1 = GREENCOLOR;
         }
         else
         {
            FONTCOLOR1 = REDCOLOR;
         }
         if(hpRegenDiff == 0)
         {
            FONTCOLOR2 = DEFAULTCOLOR;
         }
         else if(hpRegenDiff > 0)
         {
            FONTCOLOR2 = GREENCOLOR;
         }
         else
         {
            FONTCOLOR2 = REDCOLOR;
         }
         str += "hp: " + hp + " / " + FONTCOLOR1 + maxHp + FONTEND + "  (hp regen " + FONTCOLOR2 + hpRegen + FONTEND + ")<br>";
         if(maxChiDiff == 0)
         {
            FONTCOLOR1 = DEFAULTCOLOR;
         }
         else if(maxChiDiff > 0)
         {
            FONTCOLOR1 = GREENCOLOR;
         }
         else
         {
            FONTCOLOR1 = REDCOLOR;
         }
         if(chiRegenDiff == 0)
         {
            FONTCOLOR2 = DEFAULTCOLOR;
         }
         else if(chiRegenDiff > 0)
         {
            FONTCOLOR2 = GREENCOLOR;
         }
         else
         {
            FONTCOLOR2 = REDCOLOR;
         }
         str += "chi: " + chi + " / " + FONTCOLOR1 + maxChi + FONTEND + "  (chi regen " + FONTCOLOR2 + chiRegen + FONTEND + ")<br>";
         str += "<br>";
         if(minDamageDiff == 0)
         {
            FONTCOLOR1 = DEFAULTCOLOR;
         }
         else if(minDamageDiff > 0)
         {
            FONTCOLOR1 = GREENCOLOR;
         }
         else
         {
            FONTCOLOR1 = REDCOLOR;
         }
         if(maxDamageDiff == 0)
         {
            FONTCOLOR2 = DEFAULTCOLOR;
         }
         else if(maxDamageDiff > 0)
         {
            FONTCOLOR2 = GREENCOLOR;
         }
         else
         {
            FONTCOLOR2 = REDCOLOR;
         }
         str += "physical dmg: " + FONTCOLOR1 + minDamage + FONTEND + " - " + FONTCOLOR2 + maxDamage + FONTEND + " (" + stanceName + ")<br>";
         if(minDamageDiff + criticalDmgDiff == 0)
         {
            FONTCOLOR1 = DEFAULTCOLOR;
         }
         else if(minDamageDiff + criticalDmgDiff > 0)
         {
            FONTCOLOR1 = GREENCOLOR;
         }
         else
         {
            FONTCOLOR1 = REDCOLOR;
         }
         if(maxDamageDiff + criticalDmgDiff == 0)
         {
            FONTCOLOR2 = DEFAULTCOLOR;
         }
         else if(maxDamageDiff + criticalDmgDiff > 0)
         {
            FONTCOLOR2 = GREENCOLOR;
         }
         else
         {
            FONTCOLOR2 = REDCOLOR;
         }
         str += "critical dmg: " + FONTCOLOR1 + minCrit + FONTEND + " - " + FONTCOLOR2 + maxCrit + FONTEND + " (" + stanceName + ")<br>";
         if(piercingDmgDiff == 0)
         {
            FONTCOLOR1 = DEFAULTCOLOR;
         }
         else if(piercingDmgDiff > 0)
         {
            FONTCOLOR1 = GREENCOLOR;
         }
         else
         {
            FONTCOLOR1 = REDCOLOR;
         }
         str += "piercing dmg: " + FONTCOLOR1 + piercingDmg + FONTEND + "<br>";
         if(fireATKDiff == 0)
         {
            FONTCOLOR1 = DEFAULTCOLOR;
         }
         else if(fireATKDiff > 0)
         {
            FONTCOLOR1 = GREENCOLOR;
         }
         else
         {
            FONTCOLOR1 = REDCOLOR;
         }
         str += "fire atk: " + FONTCOLOR1 + fireATK + FONTEND + "<br>";
         if(waterATKDiff == 0)
         {
            FONTCOLOR1 = DEFAULTCOLOR;
         }
         else if(waterATKDiff > 0)
         {
            FONTCOLOR1 = GREENCOLOR;
         }
         else
         {
            FONTCOLOR1 = REDCOLOR;
         }
         str += "water atk: " + FONTCOLOR1 + waterATK + FONTEND + "<br>";
         if(windATKDiff == 0)
         {
            FONTCOLOR1 = DEFAULTCOLOR;
         }
         else if(windATKDiff > 0)
         {
            FONTCOLOR1 = GREENCOLOR;
         }
         else
         {
            FONTCOLOR1 = REDCOLOR;
         }
         str += "wind atk: " + FONTCOLOR1 + windATK + FONTEND + "<br>";
         if(earthATKDiff == 0)
         {
            FONTCOLOR1 = DEFAULTCOLOR;
         }
         else if(earthATKDiff > 0)
         {
            FONTCOLOR1 = GREENCOLOR;
         }
         else
         {
            FONTCOLOR1 = REDCOLOR;
         }
         str += "earth atk: " + FONTCOLOR1 + earthATK + FONTEND + "<br>";
         str += "<br>";
         if(defDiff == 0)
         {
            FONTCOLOR1 = DEFAULTCOLOR;
         }
         else if(defDiff > 0)
         {
            FONTCOLOR1 = GREENCOLOR;
         }
         else
         {
            FONTCOLOR1 = REDCOLOR;
         }
         str += "physical def: " + FONTCOLOR1 + int(defense * defModifier).toString() + FONTEND + " (" + stanceName + ")<br>";
         if(fireDEFDiff == 0)
         {
            FONTCOLOR1 = DEFAULTCOLOR;
         }
         else if(fireDEFDiff > 0)
         {
            FONTCOLOR1 = GREENCOLOR;
         }
         else
         {
            FONTCOLOR1 = REDCOLOR;
         }
         str += "fire def: " + FONTCOLOR1 + fireDEF + FONTEND + "<br>";
         if(waterDEFDiff == 0)
         {
            FONTCOLOR1 = DEFAULTCOLOR;
         }
         else if(waterDEFDiff > 0)
         {
            FONTCOLOR1 = GREENCOLOR;
         }
         else
         {
            FONTCOLOR1 = REDCOLOR;
         }
         str += "water def: " + FONTCOLOR1 + waterDEF + FONTEND + "<br>";
         if(windDEFDiff == 0)
         {
            FONTCOLOR1 = DEFAULTCOLOR;
         }
         else if(windDEFDiff > 0)
         {
            FONTCOLOR1 = GREENCOLOR;
         }
         else
         {
            FONTCOLOR1 = REDCOLOR;
         }
         str += "wind def: " + FONTCOLOR1 + windDEF + FONTEND + "<br>";
         if(earthDEFDiff == 0)
         {
            FONTCOLOR1 = DEFAULTCOLOR;
         }
         else if(earthDEFDiff > 0)
         {
            FONTCOLOR1 = GREENCOLOR;
         }
         else
         {
            FONTCOLOR1 = REDCOLOR;
         }
         str += "earth def: " + FONTCOLOR1 + earthDEF + FONTEND + "<br>";
         str += "<br>";
         if(speedDiff == 0)
         {
            FONTCOLOR1 = DEFAULTCOLOR;
         }
         else if(speedDiff > 0)
         {
            FONTCOLOR1 = GREENCOLOR;
         }
         else
         {
            FONTCOLOR1 = REDCOLOR;
         }
         str += "slash distance: " + FONTCOLOR1 + int(baseSlashLength * slashModifier).toString() + FONTEND + " (" + stanceName + ")<br>";
         str += "skill cooldown modifier: " + FONTCOLOR1 + "0." + int(skillCooldownModifier * 1000) + FONTEND;
         this.allstatstext.htmlText = str;
      }
      
      public function updateAllStats() : *
      {
         var charlevel:int = StatsManager.getStat(StatsManager.STAT_LEVEL);
         var currentXP:int = StatsManager.getXP();
         var XPtoLevel:int = StatsManager.getXPLevelThreshhold(charlevel);
         var XPfromPrev:int = currentXP - StatsManager.getXPLevelThreshhold(charlevel - 1);
         var XPthisLevel:int = StatsManager.getXPLevelThreshhold(charlevel) - StatsManager.getXPLevelThreshhold(charlevel - 1);
         var charAP:int = StatsManager.getStat(StatsManager.STAT_AP);
         var charMaxAP:int = StatsManager.getStat(StatsManager.STAT_MAXAP);
         var charGold:int = StatsManager.getStat(StatsManager.STAT_GOLD);
         var charHGold:int = StatsManager.getHeavenlyGold();
         var charDuelTokens:int = StatsManager.getStat(StatsManager.STAT_DUELTOKENS);
         var charHP:int = StatsManager.getStat(StatsManager.STAT_HP);
         var charMaxHP:int = StatsManager.getStat(StatsManager.STAT_MAXHP) + StatsManager.findBonusStat(StatsManager.STAT_MAXHP);
         if(charHP > charMaxHP)
         {
            charHP = charMaxHP;
         }
         var charChi:int = StatsManager.getStat(StatsManager.STAT_CHI);
         var charMaxChi:int = StatsManager.getStat(StatsManager.STAT_MAXCHI) + StatsManager.findBonusStat(StatsManager.STAT_MAXCHI);
         if(charChi > charMaxChi)
         {
            charChi = charMaxChi;
         }
         var charAtk:int = StatsManager.getStat(StatsManager.STAT_ATTACK);
         var charDef:int = StatsManager.getStat(StatsManager.STAT_DEFENSE);
         var charSpd:int = StatsManager.getStat(StatsManager.STAT_SPEED);
         var charStatsPoints:int = StatsManager.getStat(StatsManager.STAT_STATPOINTS);
         if(charStatsPoints > 0)
         {
            this.showStatUpButtons(charStatsPoints);
         }
         else
         {
            this.hideStatUpButtons();
         }
         var nametext:String = StatsManager.charname;
         switch(StatsManager.getPlayerStats(StatsManager.STAT_DAN))
         {
            case 0:
               this.danfield.text = "";
               break;
            case 1:
               this.danfield.text = LangManager.getString(456);
               break;
            case 2:
               this.danfield.text = LangManager.getString(457);
               break;
            case 3:
               nametext += " <font color=\'#7D5500\'>" + LangManager.getString(465) + "</font>";
               this.danfield.text = LangManager.getString(458);
               break;
            case 4:
               nametext += " <font color=\'#7D5500\'>" + LangManager.getString(465) + "</font>";
               this.danfield.text = LangManager.getString(459);
               break;
            case 5:
               nametext += " <font color=\'#7D5500\'>" + LangManager.getString(465) + "</font>";
               this.danfield.text = LangManager.getString(460);
               break;
            case 6:
               nametext += " <font color=\'#7D5500\'>" + LangManager.getString(466) + "</font>";
               this.danfield.text = LangManager.getString(461);
               break;
            case 7:
               nametext += " <font color=\'#7D5500\'>" + LangManager.getString(466) + "</font>";
               this.danfield.text = LangManager.getString(462);
               break;
            case 8:
               nametext += " <font color=\'#7D5500\'>" + LangManager.getString(467) + "</font>";
               this.danfield.text = LangManager.getString(463);
               break;
            case 9:
               nametext += " <font color=\'#7D5500\'>" + LangManager.getString(467) + "</font>";
               this.danfield.text = LangManager.getString(464);
               break;
            default:
               nametext += " <font color=\'#7D5500\'>" + LangManager.getString(467) + "</font>";
               this.danfield.text = LangManager.getString(464);
         }
         this.CharName.htmlText = nametext;
         this.CharLvl.text = StatsManager.getLevel().toString();
         if(StatsManager.getLevel() < StatsManager.levelCap)
         {
            this.XPbarText.text = currentXP + " / " + XPtoLevel;
            this.XPbarTextShadow.text = this.XPbarText.text;
         }
         else
         {
            this.XPbarText.text = currentXP + " / " + currentXP;
            this.XPbarTextShadow.text = this.XPbarText.text;
         }
         this.statsPanel.APbarText.text = charAP + " / " + charMaxAP;
         this.statsPanel.APbarTextshadow.text = this.statsPanel.APbarText.text;
         this.goldText.text = charGold.toString();
         this.hGoldText.text = charHGold.toString();
         this.statsPanel.HPbarText.text = charHP + " / " + charMaxHP;
         this.statsPanel.HPbarTextshadow.text = this.statsPanel.HPbarText.text;
         this.statsPanel.ChibarText.text = charChi + " / " + charMaxChi;
         this.statsPanel.ChibarTextshadow.text = this.statsPanel.ChibarText.text;
         this.statsPanel.AtkAmount.text = charAtk.toString();
         this.statsPanel.DefAmount.text = charDef.toString();
         this.statsPanel.SpdAmount.text = charSpd.toString();
         this.statPoints.text = LangManager.getString(72) + charStatsPoints;
         if(StatsManager.getLevel() >= StatsManager.levelCap)
         {
            this.XPbar.bar.scaleX = 1;
         }
         else
         {
            this.XPbar.bar.scaleX = XPfromPrev / XPthisLevel;
         }
         this.statsPanel.APbar.bar.scaleX = charAP / charMaxAP;
         this.statsPanel.HPbar.bar.scaleX = charHP / charMaxHP;
         this.statsPanel.CHIbar.bar.scaleX = charChi / charMaxChi;
         this.statsPanel.damagerangetext.visible = false;
         if(this.allstatstext.visible)
         {
            this.showAllStats(true);
         }
      }
      
      public function updateAP() : *
      {
         var charAP:int = StatsManager.getStat(13);
         var charMaxAP:int = StatsManager.getStat(14);
         this.statsPanel.APbarText.text = charAP + " / " + charMaxAP;
         this.statsPanel.APbarTextshadow.text = this.statsPanel.APbarText.text;
         this.statsPanel.APbar.bar.scaleX = charAP / charMaxAP;
      }
      
      public function updateAPRegen(duration:String) : *
      {
         if(this.statsPanel.APregen.text != duration)
         {
            this.statsPanel.APregen.text = duration;
         }
      }
      
      public function autoAssignStatsToggle(event:MouseEvent) : void
      {
         this.autoAssignCheckBox.toggleCheck();
         StatsManager.toggleAutoAssignStats();
      }
      
      public function hideStatUpButtons() : *
      {
         this.statsPanel.HPadd.removeEventListener(MouseEvent.CLICK,this.HPaddHandle);
         this.statsPanel.CHIadd.removeEventListener(MouseEvent.CLICK,this.CHIaddHandle);
         this.statsPanel.APadd.removeEventListener(MouseEvent.CLICK,this.APaddHandle);
         this.statsPanel.ATKadd.removeEventListener(MouseEvent.CLICK,this.ATKaddHandle);
         this.statsPanel.DEFadd.removeEventListener(MouseEvent.CLICK,this.DEFaddHandle);
         this.statsPanel.SPDadd.removeEventListener(MouseEvent.CLICK,this.SPDaddHandle);
         this.statsPanel.HPadd.visible = false;
         this.statsPanel.CHIadd.visible = false;
         this.statsPanel.APadd.visible = false;
         this.statsPanel.ATKadd.visible = false;
         this.statsPanel.DEFadd.visible = false;
         this.statsPanel.SPDadd.visible = false;
      }
      
      public function showStatUpButtons(points:int) : *
      {
         this.statsPanel.HPadd.addEventListener(MouseEvent.CLICK,this.HPaddHandle);
         this.statsPanel.CHIadd.addEventListener(MouseEvent.CLICK,this.CHIaddHandle);
         this.statsPanel.APadd.addEventListener(MouseEvent.CLICK,this.APaddHandle);
         this.statsPanel.ATKadd.addEventListener(MouseEvent.CLICK,this.ATKaddHandle);
         this.statsPanel.DEFadd.addEventListener(MouseEvent.CLICK,this.DEFaddHandle);
         this.statsPanel.SPDadd.addEventListener(MouseEvent.CLICK,this.SPDaddHandle);
         var charlevel:int = StatsManager.getStat(StatsManager.STAT_LEVEL);
         this.statsPanel.HPadd.visible = StatsManager.getStat(StatsManager.STAT_MAXHP) < 10 + (charlevel + 10) * 5;
         this.statsPanel.CHIadd.visible = StatsManager.getStat(StatsManager.STAT_MAXCHI) < 10 + (charlevel + 10) * 5;
         this.statsPanel.APadd.visible = StatsManager.getStat(StatsManager.STAT_MAXAP) < 20 + (charlevel + 10);
         this.statsPanel.ATKadd.visible = StatsManager.getStat(StatsManager.STAT_ATTACK) < charlevel + 10;
         this.statsPanel.DEFadd.visible = StatsManager.getStat(StatsManager.STAT_DEFENSE) < charlevel + 10;
         this.statsPanel.SPDadd.visible = StatsManager.getStat(StatsManager.STAT_SPEED) < charlevel + 10;
      }
      
      public function HPaddHandle(event:MouseEvent) : void
      {
         StatsManager.changeStat(StatsManager.STAT_MAXHP,5);
         StatsManager.changeStat(StatsManager.STAT_STATPOINTS,-1);
         this.updateAllStats();
      }
      
      public function CHIaddHandle(event:MouseEvent) : void
      {
         StatsManager.changeStat(StatsManager.STAT_MAXCHI,5);
         StatsManager.changeStat(StatsManager.STAT_STATPOINTS,-1);
         this.updateAllStats();
      }
      
      public function APaddHandle(event:MouseEvent) : void
      {
         StatsManager.changeStat(StatsManager.STAT_STATPOINTS,-1);
         StatsManager.addMaxAP(1);
         this.updateAllStats();
      }
      
      public function ATKaddHandle(event:MouseEvent) : void
      {
         StatsManager.changeStat(StatsManager.STAT_STATPOINTS,-1);
         StatsManager.changeStat(StatsManager.STAT_ATTACK,1);
         this.updateAllStats();
      }
      
      public function DEFaddHandle(event:MouseEvent) : void
      {
         StatsManager.changeStat(StatsManager.STAT_STATPOINTS,-1);
         StatsManager.changeStat(StatsManager.STAT_DEFENSE,1);
         this.updateAllStats();
      }
      
      public function SPDaddHandle(event:MouseEvent) : void
      {
         StatsManager.changeStat(StatsManager.STAT_STATPOINTS,-1);
         StatsManager.changeStat(StatsManager.STAT_SPEED,1);
         this.updateAllStats();
      }
   }
}

