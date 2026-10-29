package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol985")]
   public class GotGiftDialog extends MovieClip
   {
      
      public var itemName:TextField;
      
      public var goldText:TextField;
      
      public var goldimg:MovieClip;
      
      public var scrollDown:ScrollButton;
      
      public var slot0:ShopItem;
      
      public var slot1:ShopItem;
      
      public var button:YellowButton;
      
      public var scrollUp:ScrollButton;
      
      public var slot2:ShopItem;
      
      public var coinimg:MovieClip;
      
      public var slot3:ShopItem;
      
      public var titleText:TextField;
      
      public var coinsText:TextField;
      
      public var discardbutton:GreyButton;
      
      internal var lootList:Vector.<Item> = new Vector.<Item>();
      
      internal var rewardCoins:ObfuscatedObject = new ObfuscatedObject();
      
      internal var rewardGold:ObfuscatedObject = new ObfuscatedObject();
      
      internal var giverList:Array = new Array();
      
      internal var giftList:Vector.<Item> = new Vector.<Item>();
      
      internal var topRow:int;
      
      internal var totalRows:int;
      
      internal var cols:int = 4;
      
      internal var rows:int = 1;
      
      internal var totalSlots:int = this.cols * this.rows;
      
      internal var slots:Vector.<ShopItem> = new Vector.<ShopItem>(4);
      
      public function GotGiftDialog()
      {
         super();
         this.slots[0] = this.slot0;
         this.slots[1] = this.slot1;
         this.slots[2] = this.slot2;
         this.slots[3] = this.slot3;
         this.slots.fixed = true;
         this.button.setText(LangManager.getString(5));
         LangManager.initTextField(this.titleText,true);
         LangManager.initTextField(this.itemName,true);
      }
      
      internal function resetSlotPos() : *
      {
         for(var i:* = 0; i < 4; i++)
         {
            this.slots[i].x = 270.45 + i * 60;
         }
      }
      
      internal function arrangeLootDialog() : *
      {
         var i:int = 0;
         this.resetSlotPos();
         this.coinsText.visible = this.rewardCoins.getIntValue() > 0;
         this.coinimg.visible = this.rewardCoins.getIntValue() > 0;
         this.goldText.visible = this.rewardGold.getIntValue() > 0;
         this.goldimg.visible = this.rewardGold.getIntValue() > 0;
         if(this.rewardGold.getIntValue() > 0 && this.rewardCoins.getIntValue() > 0)
         {
            this.coinimg.x = 395;
            this.coinsText.x = 425;
         }
         else
         {
            this.coinimg.x = this.goldimg.x;
            this.coinsText.x = this.goldText.x;
         }
         if(this.lootList.length == 1)
         {
            this.slots[0].x = 383.45;
         }
         else if(this.lootList.length == 2)
         {
            this.slots[0].x = 348.45;
            this.slots[1].x = 412.45;
         }
         else if(this.lootList.length == 3)
         {
            this.slots[0].x = 323.45;
            this.slots[1].x = 383.45;
            this.slots[2].x = 443.45;
         }
         else if(this.lootList.length >= 4)
         {
            this.resetSlotPos();
         }
      }
      
      public function show() : *
      {
         if(!this.hasLoot())
         {
            this.onClick(null);
            return;
         }
         if(!OverworldHUD.instance.payUI.visible)
         {
            OverworldHUD.instance.initForCutscene();
         }
         this.itemName.visible = false;
         this.itemName.htmlText = "";
         if(this.lootList.length == 0)
         {
            this.button.x = 340;
            this.discardbutton.visible = false;
         }
         else
         {
            this.button.x = 270;
            this.discardbutton.visible = true;
         }
         this.arrangeLootDialog();
         this.button.setText(LangManager.getString(178));
         this.button.addEventListener(MouseEvent.CLICK,this.onClick);
         this.button.addEventListeners();
         this.discardbutton.setText(LangManager.getString(471));
         this.discardbutton.addEventListener(MouseEvent.CLICK,this.onDiscard);
         this.discardbutton.addEventListeners();
         this.scrollUp.addEventListener(MouseEvent.CLICK,this.onScrollUp);
         this.scrollDown.addEventListener(MouseEvent.CLICK,this.onScrollDown);
         this.visible = true;
         this.topRow = 0;
         this.totalRows = Math.floor((this.lootList.length - 1) / this.cols);
         this.refreshSlots();
         for(var i:int = 0; i < 4; i++)
         {
            this.slots[i].addEventListener(MouseEvent.CLICK,this.showItemName);
            this.slots[i].addEventListener(MouseEvent.ROLL_OVER,this.showItemName);
            this.slots[i].addEventListener(MouseEvent.ROLL_OUT,this.clearSelected);
         }
         this.titleText.text = LangManager.getString(252) + "\n";
         var max:int = int(this.giverList.length);
         for(i = 0; i < max; i++)
         {
            if(i == max - 1)
            {
               this.titleText.appendText(this.giverList[i] + "!");
            }
            else if(i == max - 2 && max > 1)
            {
               this.titleText.appendText(this.giverList[i] + " " + LangManager.getString(253) + " ");
            }
            else
            {
               this.titleText.appendText(this.giverList[i] + ", ");
            }
         }
         this.coinsText.text = this.rewardCoins.toString();
         this.goldText.text = this.rewardGold.toString();
      }
      
      public function storeGiftList(giftList:Vector.<Item>) : *
      {
         if(this.visible)
         {
            this.giftList = this.giftList.concat(giftList);
         }
         else
         {
            this.giftList = giftList;
         }
      }
      
      internal function onClick(mouseEvent:MouseEvent) : void
      {
         StatsManager.addItemsToInventory(this.giftList);
         QueryManager.instance.saveModifiedCharData();
         this.onDiscard(null);
      }
      
      internal function onDiscard(mouseEvent:MouseEvent) : *
      {
         this.button.removeEventListener(MouseEvent.CLICK,this.onClick);
         this.button.removeEventListeners();
         this.scrollUp.removeEventListener(MouseEvent.CLICK,this.onScrollUp);
         this.scrollDown.removeEventListener(MouseEvent.CLICK,this.onScrollDown);
         for(var i:int = 0; i < 4; i++)
         {
            this.slots[i].removeEventListener(MouseEvent.CLICK,this.showItemName);
            this.slots[i].removeEventListener(MouseEvent.ROLL_OVER,this.showItemName);
            this.slots[i].removeEventListener(MouseEvent.ROLL_OUT,this.clearSelected);
         }
         this.visible = false;
         if(OverworldHUD.instance.payUI.visible)
         {
            OverworldHUD.instance.payUI.updateGold();
            if(OverworldHUD.instance.shopUI.visible)
            {
               OverworldHUD.instance.shopUI.updateHGold();
            }
            if(OverworldHUD.instance.interactUI.visible)
            {
               OverworldHUD.instance.interactUI.updateMoney();
            }
         }
         else if(!GameEngine.isOverworld() && !GameEngine.isTitle())
         {
            InputManager.setAdventureMode();
            OverworldHUD.instance.initForAdventureMode();
         }
         this.clearLoot();
      }
      
      internal function showItemName(mouseEvent:MouseEvent) : void
      {
         this.itemName.visible = true;
         this.clearSelected(mouseEvent);
         this.itemName.htmlText = mouseEvent.target.item.getName();
         mouseEvent.target.setGotSelected(true);
      }
      
      internal function clearSelected(mouseEvent:MouseEvent) : *
      {
         for(var i:int = 0; i < 4; i++)
         {
            this.slots[i].setGotSelected(false);
         }
         this.itemName.htmlText = "";
      }
      
      public function refreshSlots() : *
      {
         var maxItem:int = 0;
         var maxDisplay:int = 0;
         var slot:ShopItem = null;
         var index:int = 0;
         var prevSlotCount:int = this.topRow * this.cols;
         maxItem = int(this.giftList.length);
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
               slot.setItemID(this.giftList[index].itemID,this.giftList[index].getShopItemType(),this.giftList[index].getPrimaryColor(),this.giftList[index].getSecondaryColor());
               slot.setItem(this.giftList[index]);
               if(this.giftList[index].getQuantity() > 1)
               {
                  slot.setQtyText("x" + this.giftList[index].getQuantity().toString());
               }
               else
               {
                  slot.setQtyText("");
               }
               slot.visible = true;
            }
         }
      }
      
      public function onScrollUp(mouseEvent:MouseEvent) : *
      {
         if(this.topRow > 0)
         {
            --this.topRow;
            this.refreshSlots();
         }
      }
      
      public function onScrollDown(mouseEvent:MouseEvent) : *
      {
         if(this.topRow < this.totalRows)
         {
            ++this.topRow;
            this.refreshSlots();
         }
      }
      
      public function addLootItem(item:Item) : *
      {
         this.lootList.push(item);
      }
      
      public function addLootCoins(num:int) : *
      {
         this.rewardCoins.changeIntValue(num);
      }
      
      public function addLootGold(num:int) : *
      {
         this.rewardGold.changeIntValue(num);
      }
      
      public function hasLoot() : Boolean
      {
         return this.rewardCoins.getIntValue() > 0 || this.rewardGold.getIntValue() > 0 || this.lootList.length > 0;
      }
      
      public function addGiver(giver:String) : *
      {
         if(this.giverList.indexOf(giver) == -1)
         {
            this.giverList.push(giver);
         }
      }
      
      public function clearLoot() : *
      {
         this.rewardCoins.setIntValue(0);
         this.rewardGold.setIntValue(0);
         this.lootList.length = 0;
         this.giverList.length = 0;
         this.giftList.length = 0;
      }
   }
}

