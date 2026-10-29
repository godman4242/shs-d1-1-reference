package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.utils.Timer;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1347")]
   public class InteractUI_crops extends MovieClip
   {
      
      public var itemName:TextField;
      
      public var scrollDown:ScrollButton;
      
      public var slot0:ShopItem;
      
      public var slot1:ShopItem;
      
      public var scrollUp:ScrollButton;
      
      public var slot2:ShopItem;
      
      public var slot3:ShopItem;
      
      public var slot4:ShopItem;
      
      public var titleText:TextField;
      
      public var slot5:ShopItem;
      
      internal var plantType:int;
      
      internal var plantTime:int;
      
      internal var harvestedTimes:int;
      
      internal var modLevel:int;
      
      internal var NOTPLANTED:int = 0;
      
      internal var PLANTED:int = 1;
      
      internal var READYFORHARVEST:int = 2;
      
      internal var ROTTED:int = 3;
      
      internal var vegState:int;
      
      internal var startingIndex:int;
      
      internal var timePeriod:int;
      
      internal var gracePeriod:int = 900;
      
      internal var topRow:int;
      
      internal var totalRows:int;
      
      internal var cols:int = 3;
      
      internal var rows:int = 2;
      
      internal var totalSlots:int = this.cols * this.rows;
      
      internal var slots:Vector.<ShopItem> = new Vector.<ShopItem>(8);
      
      internal var maxItem:int = 6;
      
      internal var rareCrops:Vector.<int> = new Vector.<int>(this.maxItem);
      
      internal var timer:Timer = new Timer(1000);
      
      internal var interactUI:InteractUI;
      
      public function InteractUI_crops()
      {
         super();
         this.slots[0] = this.slot0;
         this.slots[1] = this.slot1;
         this.slots[2] = this.slot2;
         this.slots[3] = this.slot3;
         this.slots[4] = this.slot4;
         this.slots[5] = this.slot5;
         this.slots.fixed = true;
         LangManager.initTextField(this.titleText,true);
         LangManager.initTextField(this.itemName);
         for(var i:int = 0; i < this.maxItem; i++)
         {
            this.rareCrops[i] = 1;
         }
      }
      
      public function show(startingIndex:int, interactUI:InteractUI) : *
      {
         var totalSec:int = 0;
         var secPassed:int = 0;
         visible = true;
         this.interactUI = interactUI;
         this.startingIndex = startingIndex;
         this.plantType = StatsManager.getStat(startingIndex);
         this.plantTime = StatsManager.getStat(startingIndex + 1);
         this.harvestedTimes = StatsManager.getStat(startingIndex + 2);
         if(this.harvestedTimes > 50)
         {
            this.harvestedTimes = 50;
         }
         this.modLevel = StatsManager.getStat(startingIndex + 3);
         switch(this.plantType)
         {
            case 0:
               this.vegState = this.NOTPLANTED;
               break;
            case 1:
               this.timePeriod = 15 * 60;
               if(QueryManager.instance.getServerTime() - this.plantTime < this.timePeriod)
               {
                  this.vegState = this.PLANTED;
               }
               else if(QueryManager.instance.getServerTime() - this.plantTime < this.timePeriod + this.gracePeriod)
               {
                  this.vegState = this.READYFORHARVEST;
               }
               else
               {
                  this.vegState = this.ROTTED;
               }
               break;
            case 2:
               this.timePeriod = 60 * 60;
               if(QueryManager.instance.getServerTime() - this.plantTime < this.timePeriod)
               {
                  this.vegState = this.PLANTED;
               }
               else if(QueryManager.instance.getServerTime() - this.plantTime < this.timePeriod + this.gracePeriod)
               {
                  this.vegState = this.READYFORHARVEST;
               }
               else
               {
                  this.vegState = this.ROTTED;
               }
               break;
            case 3:
               this.timePeriod = 6 * 60 * 60;
               if(QueryManager.instance.getServerTime() - this.plantTime < this.timePeriod)
               {
                  this.vegState = this.PLANTED;
               }
               else if(QueryManager.instance.getServerTime() - this.plantTime < this.timePeriod + this.gracePeriod)
               {
                  this.vegState = this.READYFORHARVEST;
               }
               else
               {
                  this.vegState = this.ROTTED;
               }
               break;
            case 4:
               this.timePeriod = 12 * 60 * 60;
               if(QueryManager.instance.getServerTime() - this.plantTime < this.timePeriod)
               {
                  this.vegState = this.PLANTED;
               }
               else
               {
                  this.vegState = this.READYFORHARVEST;
               }
         }
         if(this.vegState == this.NOTPLANTED)
         {
            this.showNotPlanted();
            interactUI.detailstext.text = LangManager.getString(258);
            if(this.harvestedTimes == 50)
            {
               interactUI.detailstext.appendText("\n\n\n\n" + LangManager.getString(285) + " 6");
            }
            else
            {
               interactUI.detailstext.appendText("\n\n\n\n" + LangManager.getString(285) + " " + this.getPatchLevel(this.harvestedTimes) + " (" + LangManager.getString(287) + " " + this.harvestedTimes + "/" + this.getNextPatchLevel(this.harvestedTimes) + ")");
            }
         }
         else if(this.vegState == this.PLANTED)
         {
            totalSec = this.timePeriod;
            secPassed = QueryManager.instance.getServerTime() - this.plantTime;
            this.showNotPlanted();
            interactUI.detailstext.text = LangManager.getString(259) + " (" + this.getTimeString(totalSec - secPassed) + " " + LangManager.getString(260) + ")";
            if(this.harvestedTimes == 50)
            {
               interactUI.detailstext.appendText("\n\n\n\n" + LangManager.getString(285) + " 6");
            }
            else
            {
               interactUI.detailstext.appendText("\n\n\n\n" + LangManager.getString(285) + " " + this.getPatchLevel(this.harvestedTimes) + " (" + LangManager.getString(287) + " " + this.harvestedTimes + "/" + this.getNextPatchLevel(this.harvestedTimes) + ")");
            }
         }
         else if(this.vegState == this.READYFORHARVEST)
         {
            this.showReadyForHarvest();
            interactUI.detailstext.text = LangManager.getString(261);
            if(this.harvestedTimes == 50)
            {
               interactUI.detailstext.appendText("\n\n\n\n" + LangManager.getString(285) + " 6");
            }
            else
            {
               interactUI.detailstext.appendText("\n\n\n\n" + LangManager.getString(285) + " " + this.getPatchLevel(this.harvestedTimes) + " (" + LangManager.getString(287) + " " + this.harvestedTimes + "/" + this.getNextPatchLevel(this.harvestedTimes) + ")");
            }
         }
         else if(this.vegState == this.ROTTED)
         {
            this.showRotted();
            interactUI.detailstext.text = LangManager.getString(262);
            if(this.harvestedTimes == 50)
            {
               interactUI.detailstext.appendText("\n\n\n\n" + LangManager.getString(285) + " 6");
            }
            else
            {
               interactUI.detailstext.appendText("\n\n\n\n" + LangManager.getString(285) + " " + this.getPatchLevel(this.harvestedTimes) + " (" + LangManager.getString(287) + " " + this.harvestedTimes + "/" + this.getNextPatchLevel(this.harvestedTimes) + ")");
            }
         }
         this.itemName.htmlText = "";
         this.topRow = 0;
         this.totalRows = Math.floor(this.maxItem / this.cols);
         var count:int = 0;
         if(StatsManager.getStat(30008) > 0)
         {
            this.rareCrops[0] = 2115;
            count++;
         }
         if(StatsManager.getStat(30009) > 0)
         {
            this.rareCrops[1] = 2116;
            count++;
         }
         if(StatsManager.getStat(30010) > 0)
         {
            this.rareCrops[2] = 2117;
            count++;
         }
         if(StatsManager.getStat(30011) > 0)
         {
            this.rareCrops[3] = 2118;
            count++;
         }
         if(StatsManager.getStat(30012) > 0)
         {
            this.rareCrops[4] = 2140;
            count++;
         }
         if(StatsManager.getStat(30013) > 0)
         {
            this.rareCrops[5] = 2141;
            count++;
         }
         this.refreshSlots();
         this.titleText.text = LangManager.getString(282) + " (" + int(count / this.maxItem * 100).toString() + "%)";
         this.addEventListeners();
      }
      
      public function hide() : *
      {
         this.removeEventListeners();
      }
      
      internal function addEventListeners() : *
      {
         this.scrollUp.addEventListener(MouseEvent.CLICK,this.onScrollUp);
         this.scrollDown.addEventListener(MouseEvent.CLICK,this.onScrollDown);
         for(var i:int = 0; i < this.totalSlots; i++)
         {
            this.slots[i].addEventListener(MouseEvent.CLICK,this.showItemName);
            this.slots[i].addEventListener(MouseEvent.ROLL_OVER,this.showItemName);
            this.slots[i].addEventListener(MouseEvent.ROLL_OUT,this.clearSelected);
         }
         this.timer.addEventListener(TimerEvent.TIMER,this.timerListener);
         this.timer.start();
      }
      
      internal function removeEventListeners() : *
      {
         this.timer.removeEventListener(TimerEvent.TIMER,this.timerListener);
         this.scrollUp.removeEventListener(MouseEvent.CLICK,this.onScrollUp);
         this.scrollDown.removeEventListener(MouseEvent.CLICK,this.onScrollDown);
         for(var i:int = 0; i < this.totalSlots; i++)
         {
            this.slots[i].removeEventListener(MouseEvent.CLICK,this.showItemName);
            this.slots[i].removeEventListener(MouseEvent.ROLL_OVER,this.showItemName);
            this.slots[i].removeEventListener(MouseEvent.ROLL_OUT,this.clearSelected);
         }
         this.timer.stop();
      }
      
      internal function showItemName(mouseEvent:MouseEvent) : void
      {
         var stat:int = 0;
         var levelreq:int = 0;
         var index:int = 0;
         this.itemName.visible = true;
         this.clearSelected(mouseEvent);
         var itemid:int = int(mouseEvent.target.getItemID());
         if(itemid == 1)
         {
            this.itemName.htmlText = "<font color=\"#FFFFFF\">" + LangManager.getString(283) + "</font>";
         }
         else
         {
            this.itemName.htmlText = mouseEvent.target.getItemName();
         }
         mouseEvent.target.setGotSelected(true);
         if(itemid == 2115)
         {
            stat = 30008;
         }
         if(itemid == 2116)
         {
            stat = 30009;
         }
         if(itemid == 2117)
         {
            stat = 30010;
         }
         if(itemid == 2118)
         {
            stat = 30011;
         }
         if(itemid == 2140)
         {
            stat = 30012;
         }
         if(itemid == 2141)
         {
            stat = 30013;
         }
         if(itemid != 1)
         {
            this.itemName.appendText(" (" + LangManager.getString(284) + ": " + StatsManager.getStat(stat) + ")");
         }
         else
         {
            index = int(mouseEvent.target.getIndex());
            levelreq = index + 1;
            if(levelreq > this.getPatchLevel(StatsManager.getStat(this.startingIndex + 2)))
            {
               this.itemName.appendText(" (" + LangManager.getString(285) + " " + levelreq + " " + LangManager.getString(286) + ")");
            }
         }
      }
      
      internal function clearSelected(mouseEvent:MouseEvent) : *
      {
         for(var i:int = 0; i < this.totalSlots; i++)
         {
            this.slots[i].setGotSelected(false);
         }
         this.itemName.htmlText = "";
      }
      
      internal function refreshSlots() : *
      {
         var maxDisplay:int = 0;
         var slot:ShopItem = null;
         var index:int = 0;
         var prevSlotCount:int = this.topRow * this.cols;
         this.scrollUp.visible = this.topRow > 0;
         this.scrollDown.visible = Math.ceil(this.maxItem / this.cols) - this.topRow > this.rows;
         if(this.maxItem - prevSlotCount < this.totalSlots)
         {
            maxDisplay = this.maxItem - prevSlotCount;
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
               slot.setItemID(this.rareCrops[index],"normal");
               slot.setQtyText("");
               slot.setIndex(index);
               slot.visible = true;
            }
         }
      }
      
      internal function onScrollUp(mouseEvent:MouseEvent) : *
      {
         if(this.topRow > 0)
         {
            --this.topRow;
            this.refreshSlots();
         }
      }
      
      internal function onScrollDown(mouseEvent:MouseEvent) : *
      {
         if(this.topRow < this.totalRows)
         {
            ++this.topRow;
            this.refreshSlots();
         }
      }
      
      internal function timerListener(e:TimerEvent) : void
      {
         var timeLeft:int = 0;
         var timeLeft2:int = 0;
         if(this.vegState == this.PLANTED)
         {
            timeLeft = this.timePeriod - (QueryManager.instance.getServerTime() - this.plantTime);
            this.interactUI.detailstext.text = LangManager.getString(259) + " (" + this.getTimeString(timeLeft) + " " + LangManager.getString(260) + ")";
            if(timeLeft <= 0)
            {
               this.vegState = this.READYFORHARVEST;
               this.interactUI.detailstext.text = LangManager.getString(261);
               this.showReadyForHarvest();
            }
            if(this.harvestedTimes == 50)
            {
               this.interactUI.detailstext.appendText("\n\n\n\n" + LangManager.getString(285) + " 6");
            }
            else
            {
               this.interactUI.detailstext.appendText("\n\n\n\n" + LangManager.getString(285) + " " + this.getPatchLevel(this.harvestedTimes) + " (" + LangManager.getString(287) + " " + this.harvestedTimes + "/" + this.getNextPatchLevel(this.harvestedTimes) + ")");
            }
         }
         else if(this.vegState == this.READYFORHARVEST && this.plantType != 4)
         {
            timeLeft2 = this.timePeriod - (QueryManager.instance.getServerTime() - this.plantTime);
            if(timeLeft2 < -this.gracePeriod)
            {
               this.vegState = this.ROTTED;
               this.interactUI.detailstext.text = LangManager.getString(262);
               if(this.harvestedTimes == 50)
               {
                  this.interactUI.detailstext.appendText("\n\n\n\n" + LangManager.getString(285) + " 6");
               }
               else
               {
                  this.interactUI.detailstext.appendText("\n\n\n\n" + LangManager.getString(285) + " " + this.getPatchLevel(this.harvestedTimes) + " (" + LangManager.getString(287) + " " + this.harvestedTimes + "/" + this.getNextPatchLevel(this.harvestedTimes) + ")");
               }
               this.showRotted();
            }
         }
      }
      
      internal function getPatchLevel(harvestedTimes:int) : int
      {
         if(harvestedTimes < 10)
         {
            return 1;
         }
         if(harvestedTimes < 20)
         {
            return 2;
         }
         if(harvestedTimes < 30)
         {
            return 3;
         }
         if(harvestedTimes < 40)
         {
            return 4;
         }
         if(harvestedTimes < 50)
         {
            return 5;
         }
         return 6;
      }
      
      internal function getNextPatchLevel(harvestedTimes:int) : int
      {
         var patchlevel:int = this.getPatchLevel(harvestedTimes);
         if(patchlevel == 1)
         {
            return 10;
         }
         if(patchlevel == 2)
         {
            return 20;
         }
         if(patchlevel == 3)
         {
            return 30;
         }
         if(patchlevel == 4)
         {
            return 40;
         }
         if(patchlevel == 5)
         {
            return 50;
         }
         return 60;
      }
      
      internal function getTimeString(totalSecs:int) : String
      {
         var secStr:String = null;
         var minStr:String = null;
         var secs:int = totalSecs % 60;
         var temp:int = (totalSecs - secs) / 60;
         var mins:int = temp % 60;
         var hours:int = (temp - mins) / 60;
         if(secs < 10)
         {
            secStr = "0" + secs.toString();
         }
         else
         {
            secStr = secs.toString();
         }
         if(mins < 10)
         {
            minStr = "0" + mins.toString();
         }
         else
         {
            minStr = mins.toString();
         }
         if(hours == 0)
         {
            return minStr + ":" + secStr;
         }
         return hours + ":" + minStr + ":" + secStr;
      }
      
      internal function plant(type:int) : *
      {
         this.plantType = type;
         this.plantTime = QueryManager.instance.getServerTime();
         this.vegState = this.PLANTED;
         StatsManager.setStat(this.startingIndex,this.plantType);
         StatsManager.setStat(this.startingIndex + 1,this.plantTime);
         switch(this.plantType)
         {
            case 1:
               this.timePeriod = 15 * 60;
               break;
            case 2:
               this.timePeriod = 60 * 60;
               break;
            case 3:
               this.timePeriod = 6 * 60 * 60;
               break;
            case 4:
               this.timePeriod = 12 * 60 * 60;
         }
         this.showNotPlanted();
      }
      
      internal function showNotPlanted() : *
      {
         this.interactUI.menuState = 0;
         this.interactUI.initButtons();
      }
      
      internal function showDoPlant() : *
      {
         this.interactUI.menuState = 1;
         this.interactUI.initButtons();
      }
      
      internal function showReadyForHarvest() : *
      {
         this.interactUI.menuState = 2;
         this.interactUI.initButtons();
      }
      
      internal function showRotted() : *
      {
         this.showNotPlanted();
      }
      
      internal function harvest() : *
      {
         var patchlevel:int = 0;
         var dice:int = 0;
         StatsManager.setStat(this.startingIndex,0);
         StatsManager.setStat(this.startingIndex + 1,0);
         StatsManager.changeStat(this.startingIndex + 2,1);
         this.interactUI.hide();
         var wavelist:Vector.<XMLQuestWave> = new Vector.<XMLQuestWave>();
         var wave:XMLQuestWave = new XMLQuestWave(null);
         wave.init(new XMLList(<enemy><id>64</id><qty>1</qty><x>400</x></enemy>));
         wavelist.push(wave);
         Overworld.setCurrentQuest(-1);
         if(StageManager.getCurrentNode() == 8402947)
         {
            GameEngine.initBattleMode(-1,8,19,800,0,wavelist,150);
         }
         else
         {
            GameEngine.initBattleMode(-1,8,43,800,0,wavelist,150);
         }
         if(StatsManager.getStat(this.startingIndex + 2) == 1 || int(Math.random() * (10 - StatsManager.getStat(1020))) == 0)
         {
            patchlevel = this.getPatchLevel(StatsManager.getStat(this.startingIndex + 2));
            dice = Math.random() * patchlevel;
            if(dice == 0)
            {
               OverworldHUD.instance.lootDialog.addLootItemBasic(2115,1);
               StatsManager.changeStat(30008,1);
               StatsManager.reportAchievementStat(60002,1);
            }
            else if(dice == 1)
            {
               OverworldHUD.instance.lootDialog.addLootItemBasic(2116,1);
               StatsManager.changeStat(30009,1);
               StatsManager.reportAchievementStat(60002,1);
            }
            else if(dice == 2)
            {
               OverworldHUD.instance.lootDialog.addLootItemBasic(2117,1);
               StatsManager.changeStat(30010,1);
               StatsManager.reportAchievementStat(60002,1);
            }
            else if(dice == 3)
            {
               OverworldHUD.instance.lootDialog.addLootItemBasic(2118,1);
               StatsManager.changeStat(30011,1);
               StatsManager.reportAchievementStat(60002,1);
            }
            else if(dice == 4)
            {
               OverworldHUD.instance.lootDialog.addLootItemBasic(2140,1);
               StatsManager.changeStat(30011,1);
               StatsManager.reportAchievementStat(60002,1);
            }
            else if(dice == 5)
            {
               OverworldHUD.instance.lootDialog.addLootItemBasic(2141,1);
               StatsManager.changeStat(30011,1);
               StatsManager.reportAchievementStat(60002,1);
            }
         }
      }
   }
}

