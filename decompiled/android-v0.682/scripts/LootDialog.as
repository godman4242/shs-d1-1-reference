package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol966")]
   public class LootDialog extends MovieClip
   {
      
      public var itemName:TextField;
      
      public var goldText:TextField;
      
      public var xpText:TextField;
      
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
      
      public var xpimg:TextField;
      
      internal var lootList:Vector.<Item> = new Vector.<Item>();
      
      internal var lootXP:ObfuscatedObject = new ObfuscatedObject();
      
      internal var rewardCoins:ObfuscatedObject = new ObfuscatedObject();
      
      internal var rewardGold:ObfuscatedObject = new ObfuscatedObject();
      
      internal var topRow:int;
      
      internal var totalRows:int;
      
      internal var cols:int = 4;
      
      internal var rows:int = 1;
      
      internal var totalSlots:int = this.cols * this.rows;
      
      internal var slots:Vector.<ShopItem> = new Vector.<ShopItem>(4);
      
      internal var dontRefreshAfter:Boolean = false;
      
      internal var dontChangeInputModeAfter:Boolean = false;
      
      internal var checkQuestLogChange:Boolean = false;
      
      internal var ironWeaponList:Array = [13100,13101,13103,13104,13105,13106,13107,13108,13109,13110,13111,13112,13113,13114,13115,13116,13117,13118,13119,13120,13121,13122,13123,13124,13125,13126,13127,13128,13129,13200,13201,13202,13203,13204,13205,13206,13207,13208];
      
      internal var bronzeItemList:Array = [13130,13131,13133,13134,13135,13136,13137,13138,13139,13140,13141,13142,13143,13144,13145,13146,13147,13148,13149,13150,13151,13152,13153,13154,13155,13209,13210,13211,13212,13213,13214,13215,13216];
      
      internal var steelItemList:Array = [13156,13157,13159,13160,13161,13162,13163,13164,13165,13166,13167,13168,13169,13170,13171,13172,13173,13174,13175,13176,13177,13178,13179,13180,13181,13217,13218,13219,13223,13224,13225,13226,13227];
      
      internal var randomItemList1:Array = [2103,2104,2105,2106,2107,2108,3000,3001,4004,4007,4008,4010,4012,4013,4016,4017,4018,4019,4023,4025,4026,4027,4028,4029,7003,7005,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017,7018,7055,7056,7060,7061,7065,7066,11002,11003,11004,11006,11007,11008,11010,11011,11012,11013,11014,11015,11016,11017,11018,11019,11020,11023,11024,11025,11026,11027,11028,12001,12003,12004,12005,12010,12011,12013,13010,13100,13101,13103,13104,13105,13106,13107,13108,13109,13110,13111,13112,13113,13114,13115,13116,13117,13118,13119,13120,13121,13122,13123,13124,13125,13126,13127,13128,13129,13200,13201,13202,13203,13204,13205,13206,13207,13208,4059,4060,4062,4077,11040,20054,20055];
      
      internal var randomItemList2:Array = [2103,2104,2105,2106,2107,2108,3002,4004,4007,4008,4010,4012,4013,4016,4017,4018,4019,4023,4025,4026,4027,4028,4029,7003,7005,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017,7018,7055,7056,7060,7061,7065,7066,11002,11003,11004,11006,11007,11008,11010,11011,11012,11013,11014,11015,11016,11017,11018,11019,11020,11023,11024,11025,11026,11027,11028,12001,12003,12004,12005,12010,12011,12013,13130,13131,13133,13134,13135,13136,13137,13138,13139,13140,13141,13142,13143,13144,13145,13146,13147,13148,13149,13150,13151,13152,13153,13154,13155,13209,13210,13211,13212,13213,13214,13215,13216,4059,4060,4062,4077,11040,20054,20055,20056];
      
      internal var randomItemList3:Array = [2103,2104,2105,2106,2107,2108,3002,4004,4007,4008,4010,4012,4013,4016,4017,4018,4019,4023,4025,4026,4027,4028,4029,7003,7005,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017,7018,7055,7056,7060,7061,7065,7066,11002,11003,11004,11006,11007,11008,11010,11011,11012,11013,11014,11015,11016,11017,11018,11019,11020,11023,11024,11025,11026,11027,11028,12001,12003,12004,12005,12010,12011,12013,13156,13157,13159,13160,13161,13162,13163,13164,13165,13166,13167,13168,13169,13170,13171,13172,13173,13174,13175,13176,13177,13178,13179,13180,13181,13217,13218,13219,13223,13224,13225,13226,13227,4059,4060,4062,4077,11040,20054,20055,20056,20057];
      
      internal var randomMerchantItemList1:Array = [3000,3001,4004,4007,4008,4010,4012,4013,4016,4017,4018,4019,4023,4025,4026,4027,4028,4029,7003,7005,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017,7018,7055,7056,7060,7061,7065,7066,11002,11003,11004,11006,11007,11008,11010,11011,11012,11013,11014,11015,11016,11017,11018,11019,11020,11023,11024,11025,11026,11027,11028,12001,12003,12004,12005,12010,12011,12013,13010,13100,13101,13103,13104,13105,13106,13107,13108,13109,13110,13111,13112,13113,13114,13115,13116,13117,13118,13119,13120,13121,13122,13123,13124,13125,13126,13127,13128,13129,13200,13201,13202,13203,13204,13205,13206,13207,13208,4059,4060,4062,4077,11040];
      
      internal var randomMerchantItemList2:Array = [3002,4004,4007,4008,4010,4012,4013,4016,4017,4018,4019,4023,4025,4026,4027,4028,4029,7003,7005,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017,7018,7055,7056,7060,7061,7065,7066,11002,11003,11004,11006,11007,11008,11010,11011,11012,11013,11014,11015,11016,11017,11018,11019,11020,11023,11024,11025,11026,11027,11028,12001,12003,12004,12005,12010,12011,12013,13130,13131,13133,13134,13135,13136,13137,13138,13139,13140,13141,13142,13143,13144,13145,13146,13147,13148,13149,13150,13151,13152,13153,13154,13155,13209,13210,13211,13212,13213,13214,13215,13216,4059,4060,4062,4077,11040];
      
      internal var randomMerchantItemList3:Array = [3002,4004,4007,4008,4010,4012,4013,4016,4017,4018,4019,4023,4025,4026,4027,4028,4029,7003,7005,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017,7018,7055,7056,7060,7061,7065,7066,11002,11003,11004,11006,11007,11008,11010,11011,11012,11013,11014,11015,11016,11017,11018,11019,11020,11023,11024,11025,11026,11027,11028,12001,12003,12004,12005,12010,12011,12013,13156,13157,13159,13160,13161,13162,13163,13164,13165,13166,13167,13168,13169,13170,13171,13172,13173,13174,13175,13176,13177,13178,13179,13180,13181,13217,13218,13219,13223,13224,13225,13226,13227,4059,4060,4062,4077,11040];
      
      internal var consolationPrizeList:Array = [2103,2104,2106,2107,20054,20055];
      
      public function LootDialog()
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
         if(this.rewardCoins.getIntValue() > 0 || this.rewardGold.getIntValue() > 0)
         {
            if(this.lootXP.getIntValue() > 0)
            {
               this.coinimg.y = 163.2;
               this.coinsText.y = 164.3;
               this.xpimg.y = 191.3;
               this.xpText.y = 191.3;
               this.itemName.y = 277.45;
               for(i = 0; i < 4; i++)
               {
                  this.slots[i].y = 218;
               }
            }
            else
            {
               this.coinimg.y = 163.2;
               this.coinsText.y = 164.3;
               this.itemName.y = 267.45;
               for(i = 0; i < 4; i++)
               {
                  this.slots[i].y = 208;
               }
            }
         }
         else if(this.lootXP.getIntValue() > 0)
         {
            this.xpimg.y = 163.2;
            this.xpText.y = 164.3;
            this.itemName.y = 267.45;
            for(i = 0; i < 4; i++)
            {
               this.slots[i].y = 208;
            }
         }
         else
         {
            this.itemName.y = 267.45;
            for(i = 0; i < 4; i++)
            {
               this.slots[i].y = 208;
            }
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
         this.itemName.visible = false;
         this.itemName.htmlText = "";
         if(this.rewardCoins.getIntValue() <= 0)
         {
            this.coinimg.visible = false;
            this.coinsText.visible = false;
         }
         else
         {
            this.coinimg.visible = true;
            this.coinsText.visible = true;
            if(StatsManager.isCoinPurseFull())
            {
               this.coinsText.text = LangManager.getString(356);
            }
            else
            {
               this.coinsText.text = this.rewardCoins.toString();
            }
         }
         if(this.rewardGold.getIntValue() <= 0)
         {
            this.goldimg.visible = false;
            this.goldText.visible = false;
         }
         else
         {
            this.goldimg.visible = true;
            this.goldText.visible = true;
            this.goldText.text = this.rewardGold.toString();
         }
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
         if(this.lootXP.getIntValue() <= 0)
         {
            this.xpimg.visible = false;
            this.xpText.visible = false;
         }
         else
         {
            this.xpimg.visible = true;
            this.xpText.visible = true;
            this.xpText.text = this.lootXP.toString();
         }
         this.arrangeLootDialog();
         this.button.setText(LangManager.getString(5));
         this.button.addEventListener(MouseEvent.CLICK,this.onClick);
         this.button.addEventListeners();
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
         StatsManager.changeXP(this.lootXP.getIntValue());
         StatsManager.changeGold(this.rewardCoins.getIntValue());
         StatsManager.addHeavenlyGold(this.rewardGold.getIntValue());
         StatsManager.addItemsToInventory(this.lootList,true);
         this.titleText.text = LangManager.getString(103);
      }
      
      public function onClick(mouseEvent:MouseEvent) : void
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
         this.clearLoot();
         if(OverworldHUD.instance.questCompletedDialog.visible)
         {
            this.dontChangeInputModeAfter = true;
         }
         if(this.checkQuestLogChange)
         {
            QuestGenerator.instance.checkSetReturnMarkedNode();
         }
         if(GameEngine.isPvPRoomMode())
         {
            InputManager.setBattleMode();
         }
         else if(!this.dontChangeInputModeAfter)
         {
            if(GameEngine.isAdventureMode())
            {
               OverworldHUD.instance.initForAdventureMode();
               InputManager.setAdventureMode();
               if(!this.dontRefreshAfter)
               {
                  OverworldHUD.instance.screenTransition.startClose(ScreenTransition.ACTION_REFRESHROOM);
               }
            }
            else if(GameEngine.isOverworld())
            {
               OverworldHUD.instance.initForOverworld();
            }
            else
            {
               GameEngine.stopBattleMode();
            }
         }
         this.dontRefreshAfter = false;
         this.dontChangeInputModeAfter = false;
         if(!OverworldHUD.instance.inventoryUI.visible)
         {
            QueryManager.instance.saveModifiedCharData();
         }
      }
      
      internal function showItemName(mouseEvent:MouseEvent) : void
      {
         this.itemName.visible = true;
         this.clearSelected(mouseEvent);
         this.itemName.htmlText = mouseEvent.target.item.getNameBlackBG();
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
         var prevSlotCount:int = 0;
         var maxDisplay:int = 0;
         var slot:ShopItem = null;
         var index:int = 0;
         prevSlotCount = this.topRow * this.cols;
         var maxItem:int = int(this.lootList.length);
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
               slot.setItemID(this.lootList[index].itemID,this.lootList[index].getShopItemType(),this.lootList[index].getPrimaryColor(),this.lootList[index].getSecondaryColor());
               slot.setItem(this.lootList[index]);
               if(this.lootList[index].getQuantity() > 1)
               {
                  slot.setQtyText("x" + this.lootList[index].getQuantity().toString());
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
      
      public function addLootItem(itemID:int, level:int, qty:int) : *
      {
         var i:int = 0;
         if(ItemGenerator.instance.getItemType(itemID) != -1)
         {
            for(i = 0; i < qty; i++)
            {
               this.lootList.push(new Item(itemID,1));
            }
         }
         else
         {
            this.lootList.push(new Item(itemID,qty));
         }
      }
      
      public function addRareLootItem(itemID:int, level:int, qty:int, isLegendaryItem:Boolean = false) : Item
      {
         var item:Item = null;
         var i:int = 0;
         if(ItemGenerator.instance.getItemType(itemID) != -1)
         {
            for(i = 0; i < qty; i++)
            {
               item = ItemGenerator.instance.generateItem(itemID,level,true,isLegendaryItem);
               this.lootList.push(item);
            }
         }
         else
         {
            item = new Item(itemID,qty);
            this.lootList.push(item);
         }
         return item;
      }
      
      public function addQuestLootItem() : *
      {
         this.lootList.push(QuestGenerator.instance.getDungeonItem(StageManager.getCurrentNode(),QueryManager.instance.getServerDate()));
         this.checkQuestLogChange = true;
      }
      
      public function addBountyLootItem() : *
      {
         this.lootList.push(QuestGenerator.instance.getDungeonItem(StageManager.getCurrentNode(),QueryManager.instance.getServerDate(),StageManager.getCurrentRoom(),true));
         this.checkQuestLogChange = true;
      }
      
      public function addSpecialItem(item:Item) : *
      {
         this.lootList.push(item);
      }
      
      public function addLootItemBasic(itemID:int, qty:int) : *
      {
         this.lootList.push(new Item(itemID,qty));
      }
      
      public function addRandomLootItem(playerlevel:int, isRareItem:Boolean = false, alwaysGive:Boolean = false, isLegendaryItem:Boolean = false) : *
      {
         var reward:int = 0;
         if(StatsManager.hasBuff(StatsManager.BUFF_RARELOOT) && int(Math.random() * 4) == 0)
         {
            isRareItem = true;
            alwaysGive = true;
         }
         if(!alwaysGive && int(Math.random() * 2) == 0)
         {
            return;
         }
         var counter:int = 0;
         while(counter < 5)
         {
            if(counter < 4)
            {
               if(playerlevel < 30)
               {
                  reward = int(this.randomItemList1[int(Math.random() * this.randomItemList1.length)]);
               }
               else if(playerlevel < 60)
               {
                  reward = int(this.randomItemList2[int(Math.random() * this.randomItemList2.length)]);
               }
               else
               {
                  reward = int(this.randomItemList3[int(Math.random() * this.randomItemList3.length)]);
               }
               if(QuestEngine.getItemData(reward).levelrestriction <= playerlevel + 3)
               {
                  if(reward >= 3000 && reward < 20000)
                  {
                     this.lootList.push(ItemGenerator.instance.generateItem(reward,playerlevel,isRareItem,isLegendaryItem));
                  }
                  else
                  {
                     this.lootList.push(new Item(reward,1));
                  }
                  break;
               }
               counter++;
            }
            else
            {
               this.lootList.push(new Item(this.consolationPrizeList[Math.random() * this.consolationPrizeList.length],1));
               counter++;
            }
         }
      }
      
      public function addRandomSword(playerlevel:int) : Item
      {
         var reward:int = 0;
         if(playerlevel < 30)
         {
            reward = int(this.ironWeaponList[int(Math.random() * this.ironWeaponList.length)]);
         }
         else if(playerlevel < 60)
         {
            reward = int(this.bronzeItemList[int(Math.random() * this.bronzeItemList.length)]);
         }
         else
         {
            reward = int(this.steelItemList[int(Math.random() * this.steelItemList.length)]);
         }
         var sword:Item = ItemGenerator.instance.generateItem(reward,playerlevel,true,false);
         sword.setUses(1);
         this.lootList.push(sword);
         return sword;
      }
      
      public function getRandomRareItem(playerlevel:int, _rng:RNG = null) : Item
      {
         var reward:int = 0;
         var rng:RNG = null;
         if(_rng == null)
         {
            rng = new RNG(Math.random() * 1000);
         }
         else
         {
            rng = _rng;
         }
         if(playerlevel < 30)
         {
            reward = int(this.randomItemList1[rng.rand(this.randomItemList1.length)]);
         }
         else if(playerlevel < 60)
         {
            reward = int(this.randomItemList2[rng.rand(this.randomItemList2.length)]);
         }
         else
         {
            reward = int(this.randomItemList3[rng.rand(this.randomItemList3.length)]);
         }
         return ItemGenerator.instance.generateItem(reward,playerlevel,true);
      }
      
      public function getRandomRareMerchantItem(playerlevel:int, _rng:RNG = null) : Item
      {
         var reward:int = 0;
         var rng:RNG = null;
         if(_rng == null)
         {
            rng = new RNG(Math.random() * 1000);
         }
         else
         {
            rng = _rng;
         }
         if(playerlevel < 30)
         {
            reward = int(this.randomMerchantItemList1[rng.rand(this.randomMerchantItemList1.length)]);
         }
         else if(playerlevel < 60)
         {
            reward = int(this.randomMerchantItemList2[rng.rand(this.randomMerchantItemList2.length)]);
         }
         else
         {
            reward = int(this.randomMerchantItemList3[rng.rand(this.randomMerchantItemList3.length)]);
         }
         return ItemGenerator.instance.generateItem(reward,playerlevel,true);
      }
      
      public function getRandomPremiumItem(playerlevel:int, _rng:RNG = null) : Item
      {
         var reward:int = 0;
         var rng:RNG = null;
         var itemList:Array = null;
         var extraItems:Array = [4005,5002,7022,11005,12002,4061,9010];
         if(_rng == null)
         {
            rng = new RNG(Math.random() * 1000);
         }
         else
         {
            rng = _rng;
         }
         if(playerlevel < 30)
         {
            itemList = this.randomItemList1.concat(extraItems);
         }
         else if(playerlevel < 60)
         {
            itemList = this.randomItemList2.concat(extraItems);
         }
         else
         {
            itemList = this.randomItemList3.concat(extraItems);
         }
         reward = int(itemList[rng.rand(itemList.length)]);
         return ItemGenerator.instance.generateItem(reward,playerlevel,true,true);
      }
      
      public function getRandomLegendaryMerchantPremiumItem(playerlevel:int, _rng:RNG = null) : Item
      {
         var reward:int = 0;
         var rng:RNG = null;
         var itemList:Array = null;
         var extraItems:Array = [4005,5002,7022,11005,12002,4061,9010];
         if(_rng == null)
         {
            rng = new RNG(Math.random() * 1000);
         }
         else
         {
            rng = _rng;
         }
         if(playerlevel < 30)
         {
            itemList = this.randomMerchantItemList1.concat(extraItems);
         }
         else if(playerlevel < 60)
         {
            itemList = this.randomMerchantItemList2.concat(extraItems);
         }
         else
         {
            itemList = this.randomMerchantItemList3.concat(extraItems);
         }
         reward = int(itemList[rng.rand(itemList.length)]);
         if(reward < 3000)
         {
            reward = int(extraItems[rng.rand(extraItems.length)]);
         }
         return ItemGenerator.instance.generateItem(reward,playerlevel,true,true);
      }
      
      public function addLootXP(num:int) : *
      {
         if(StatsManager.hasBuff(StatsManager.BUFF_XP) || StatsManager.hasBuff(StatsManager.BUFF_MODERATOR))
         {
            num *= 1.5;
         }
         if(StatsManager.getLevel() < StatsManager.levelCap)
         {
            this.lootXP.changeIntValue(num);
         }
      }
      
      public function addLootCoins(num:int) : *
      {
         if(StatsManager.hasBuff(StatsManager.BUFF_COINS))
         {
            num *= 1.5;
         }
         this.rewardCoins.changeIntValue(num);
      }
      
      public function addLootGold(num:int) : *
      {
         this.rewardGold.changeIntValue(num);
      }
      
      public function hasLoot() : Boolean
      {
         return this.rewardCoins.getIntValue() > 0 || this.rewardGold.getIntValue() > 0 || this.lootXP.getIntValue() > 0 || this.lootList.length > 0;
      }
      
      public function clearLoot() : *
      {
         this.rewardCoins.setIntValue(0);
         this.rewardGold.setIntValue(0);
         this.lootXP.setIntValue(0);
         this.lootList.length = 0;
      }
      
      public function notifyDontRefreshAfter() : *
      {
         this.dontRefreshAfter = true;
      }
      
      public function notifyDontChangeInputModeAfter() : *
      {
         this.dontChangeInputModeAfter = true;
      }
      
      public function setSurvivalModeLoot() : *
      {
         this.lootXP.setIntValue(this.lootXP.getIntValue() / 2);
         this.addRandomLootItem(StatsManager.getLevel());
      }
      
      public function halfXPMaxFourLoot() : *
      {
         this.lootXP.setIntValue(this.lootXP.getIntValue() / 2);
         this.rewardCoins.setIntValue(this.rewardCoins.getIntValue() / 2);
         if(this.lootList.length > 4)
         {
            this.lootList.length = 4;
         }
      }
      
      public function getLootCount() : int
      {
         return this.lootList.length;
      }
      
      public function getLootList() : Vector.<Item>
      {
         return this.lootList;
      }
      
      public function getCoinsCount() : int
      {
         return this.rewardCoins.getIntValue();
      }
   }
}

