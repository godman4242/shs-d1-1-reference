package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1428")]
   public class InteractUI extends MovieClip
   {
      
      public static var UIMODE_PEDDLER:int = 0;
      
      public static var UIMODE_MARKET:int = 1;
      
      public static var UIMODE_VEGPATCH:int = 2;
      
      public static var UIMODE_STABLES:int = 3;
      
      public static var UIMODE_MERCHANT:int = 4;
      
      public static var UIMODE_INN:int = 5;
      
      public static var UIMODE_REBIRTH:int = 6;
      
      public static var UIMODE_BARBER:int = 7;
      
      public static var UIMODE_BANK:int = 8;
      
      public static var UIMODE_GAMBLINGDEN:int = 9;
      
      public static var UIMODE_GETCOINS:int = 10;
      
      public static var UIMODE_GETAP:int = 11;
      
      public static var UIMODE_LEAVECLAN:int = 12;
      
      public static var UIMODE_BLACKSMITH:int = 13;
      
      public static var UIMODE_RECENTEVENTSBOARD:int = 14;
      
      public static var UIMODE_PLAYERPANEL:int = 15;
      
      public static var UIMODE_JOINCUSTOMCLANRECRUIT:int = 16;
      
      public static var UIMODE_JOINCUSTOMCLANGENERAL:int = 17;
      
      public static var UIMODE_TOWNTOLL:int = 18;
      
      public static var UIMODE_BOUNTYBOARD:int = 19;
      
      public static var UIMODE_HOUSE:int = 20;
      
      internal static const UIData:Class = InteractUI_UIData;
      
      public var button6:GenericActionButton;
      
      public var kojuro:portrait_kojuro;
      
      public var bust:DialogueBust;
      
      public var elementCircle:MovieClip;
      
      public var detailstext:TextField;
      
      public var chohan:MovieClip;
      
      public var titleText:MovieClip;
      
      public var money:MovieClip;
      
      public var npcname:MovieClip;
      
      public var button1:GenericActionButton;
      
      public var button2:GenericActionButton;
      
      public var chikako:InteractUI_chikako;
      
      public var button3:GenericActionButton;
      
      public var crops:InteractUI_crops;
      
      public var button4:GenericActionButton;
      
      public var button5:GenericActionButton;
      
      internal var uimode:int;
      
      internal var menuState:int;
      
      internal var nodeuiX:Number = NodeUI.instance.x + 10;
      
      internal var nodeuiY:Number = NodeUI.instance.y + 40;
      
      internal var nodeuiSpacingY:Number = NodeUI.instance.actionButtonHeight;
      
      internal var buttons:Array = new Array();
      
      internal var actions:Array = new Array();
      
      internal var hasNinja:Boolean = false;
      
      internal var cropPrices:Array = [10,10,10,10];
      
      internal var selectedSlotItem:Item;
      
      internal var menuData:XMLList;
      
      internal var bet:int = 0;
      
      public function InteractUI()
      {
         super();
         this.button1.x = this.nodeuiX;
         this.button1.y = this.nodeuiY;
         this.buttons.push(this.button1);
         this.button2.x = this.nodeuiX;
         this.button2.y = this.nodeuiY + this.nodeuiSpacingY;
         this.buttons.push(this.button2);
         this.button3.x = this.nodeuiX;
         this.button3.y = this.nodeuiY + 2 * this.nodeuiSpacingY;
         this.buttons.push(this.button3);
         this.button4.x = this.nodeuiX;
         this.button4.y = this.nodeuiY + 3 * this.nodeuiSpacingY;
         this.buttons.push(this.button4);
         this.button5.x = this.nodeuiX;
         this.button5.y = this.nodeuiY + 4 * this.nodeuiSpacingY;
         this.buttons.push(this.button5);
         this.button6.x = this.nodeuiX;
         this.button6.y = this.nodeuiY + 5 * this.nodeuiSpacingY;
         this.buttons.push(this.button6);
         LangManager.initTextField(this.titleText.label,true);
         LangManager.initTextField(this.detailstext);
         LangManager.initTextField(this.npcname.nametext,true);
         LangManager.initTextField(this.money.coinslabel,true);
         this.money.coinslabel.text = LangManager.getString(63);
         LangManager.initTextField(this.money.goldlabel,true);
         this.money.goldlabel.text = LangManager.getString(64);
         LangManager.initTextField(this.money.payUIButton.getgoldlabel,true);
         this.money.payUIButton.getgoldlabel.mouseEnabled = false;
         this.money.payUIButton.getgoldlabel.text = LangManager.getString(486);
      }
      
      public static function getUIData() : XML
      {
         return XML(new UIData());
      }
      
      public function show(uimode:int, param:int = 0, item:Item = null) : *
      {
         var inncost:int = 0;
         var travelcost:int = 0;
         var shopData:XMLShopData = null;
         var territory:Point = null;
         var territoryData:TerritoryData = null;
         var clanId:int = 0;
         var clanName:String = null;
         var price:int = 0;
         this.uimode = uimode;
         this.addEventListeners();
         this.visible = true;
         this.npcname.visible = false;
         this.crops.visible = false;
         this.money.visible = false;
         this.bust.visible = false;
         this.chohan.visible = false;
         this.kojuro.visible = false;
         this.chikako.visible = false;
         this.elementCircle.visible = false;
         OverworldHUD.instance.showInfoBustButtons(false);
         Overworld.setMapEnabled(false);
         this.selectedSlotItem = item;
         if(!GameEngine.isOverworld())
         {
            InputManager.disableInput();
         }
         this.money.coinstext.text = StatsManager.getStat(11).toString();
         this.money.goldtext.text = StatsManager.getHeavenlyGold().toString();
         this.money.getCoinsButton.visible = true;
         var uidata:XML = XML(new UIData());
         this.menuData = XMLList(uidata.ui[uimode]);
         this.menuState = 0;
         gotoAndStop(1);
         switch(uimode)
         {
            case UIMODE_PEDDLER:
               this.titleText.label.text = LangManager.getString(2002);
               this.detailstext.text = LangManager.getString(2003);
               this.npcname.visible = true;
               this.npcname.nametext.text = LangManager.getString(5004);
               if(!StatsManager.showKojuroAsPeddler())
               {
                  this.bust.initMCSFromNPCID(104);
                  this.bust.faceLeft();
                  this.bust.visible = true;
               }
               else
               {
                  this.kojuro.visible = true;
                  this.bust.visible = false;
               }
               this.money.visible = true;
               break;
            case UIMODE_MERCHANT:
               this.titleText.label.text = LangManager.getString(2012);
               this.detailstext.text = LangManager.getString(2013);
               this.npcname.visible = true;
               this.npcname.nametext.text = LangManager.getString(5018);
               this.bust.initMCSFromNPCID(52);
               this.bust.faceLeft();
               this.bust.visible = true;
               this.money.visible = true;
               break;
            case UIMODE_MARKET:
               this.titleText.label.text = LangManager.getString(268);
               this.detailstext.text = "";
               this.money.visible = true;
               QueryManagerPIO.instance.getAllCrops(this.gotAllCrops);
               break;
            case UIMODE_VEGPATCH:
               this.titleText.label.text = LangManager.getString(257);
               this.detailstext.text = "";
               this.crops.show(param,this);
               break;
            case UIMODE_INN:
               this.titleText.label.text = LangManager.getString(511);
               inncost = NodeGenerator.instance.getNodeLevel(StageManager.getCurrentNode()) * 2;
               this.detailstext.text = LangManager.getString(512);
               this.detailstext.appendText("\n" + LangManager.getString(528) + " " + inncost + " " + LangManager.getString(63));
               this.npcname.visible = true;
               this.npcname.nametext.text = LangManager.getString(5060);
               this.bust.initMCSFromNPCID(XMLNpc.INDEX_NPCHOLDER);
               this.bust.faceLeft();
               this.bust.visible = true;
               this.money.visible = true;
               break;
            case UIMODE_STABLES:
               this.titleText.label.text = LangManager.getString(525);
               travelcost = NodeGenerator.instance.getNodeLevel(StageManager.getCurrentNode()) * 2;
               this.detailstext.text = LangManager.getString(526);
               this.detailstext.appendText("\n" + LangManager.getString(528) + " " + travelcost + " " + LangManager.getString(63));
               this.npcname.visible = true;
               this.npcname.nametext.text = LangManager.getString(5061);
               this.bust.initMCSFromNPCID(51);
               this.bust.faceLeft();
               this.bust.visible = true;
               this.money.visible = true;
               this.initStablesButtons();
               return;
            case UIMODE_REBIRTH:
               this.titleText.label.text = LangManager.getString(4154);
               this.bust.initMCSFromPlayer();
               this.bust.faceLeft();
               this.bust.visible = true;
               break;
            case UIMODE_BARBER:
               this.titleText.label.text = LangManager.getString(5062);
               this.detailstext.text = LangManager.getString(551);
               this.npcname.visible = true;
               this.npcname.nametext.text = LangManager.getString(5062);
               this.bust.initMCSFromNPCID(52);
               this.bust.faceLeft();
               this.bust.visible = true;
               this.money.visible = true;
               break;
            case UIMODE_BANK:
               this.titleText.label.text = LangManager.getString(552);
               this.detailstext.text = "";
               this.money.visible = false;
               break;
            case UIMODE_GAMBLINGDEN:
               this.titleText.label.text = LangManager.getString(553);
               this.detailstext.text = "";
               this.money.visible = true;
               this.bet = 0;
               break;
            case UIMODE_GETCOINS:
               this.titleText.label.text = LangManager.getString(559);
               if(!StatsManager.showChikakoAsNinja())
               {
                  this.bust.initMCSFromNPCID(32);
                  this.bust.faceLeft();
                  this.bust.visible = true;
                  this.detailstext.text = "";
               }
               else
               {
                  this.chikako.visible = true;
                  this.chikako.updateBar();
                  this.bust.visible = false;
               }
               this.money.visible = true;
               this.createNinjaServant();
               this.money.getCoinsButton.visible = false;
               this.menuState = param;
               break;
            case UIMODE_GETAP:
               this.titleText.label.text = LangManager.getString(559);
               if(!StatsManager.showChikakoAsNinja())
               {
                  this.bust.initMCSFromNPCID(32);
                  this.bust.faceLeft();
                  this.bust.visible = true;
                  this.detailstext.text = "";
               }
               else
               {
                  this.chikako.visible = true;
                  this.chikako.updateBar();
                  this.bust.visible = false;
               }
               this.money.visible = true;
               shopData = new XMLShopData(new XMLList());
               shopData.initPremiumItems();
               OverworldHUD.instance.shopUI.showBuy(shopData);
               OverworldHUD.instance.shopUI.showShopDTAP();
               this.createNinjaServant();
               this.money.getCoinsButton.visible = false;
               break;
            case UIMODE_LEAVECLAN:
               this.titleText.label.text = LangManager.getString(607);
               this.detailstext.text = LangManager.getString(608);
               break;
            case UIMODE_BLACKSMITH:
               this.titleText.label.text = LangManager.getString(5065);
               this.detailstext.text = LangManager.getString(2014);
               this.npcname.visible = true;
               this.npcname.nametext.text = LangManager.getString(5065);
               this.bust.initMCSFromNPCID(52);
               this.bust.faceLeft();
               this.bust.visible = true;
               this.money.visible = true;
               break;
            case UIMODE_RECENTEVENTSBOARD:
               gotoAndStop(2);
               this.detailstext.mouseWheelEnabled = false;
               this.titleText.label.text = LangManager.getString(743);
               territory = NodeGenerator.instance.getTerritory(StageManager.getCurrentNode());
               territoryData = NodeGenerator.instance.getTerritoryData(territory.x,territory.y,false);
               territoryData.getRecentEvents();
               break;
            case UIMODE_JOINCUSTOMCLANRECRUIT:
               this.titleText.label.text = LangManager.getString(828);
               this.detailstext.text = LangManager.getString(829,[this.selectedSlotItem.itemName]);
               break;
            case UIMODE_JOINCUSTOMCLANGENERAL:
               this.titleText.label.text = LangManager.getString(828);
               this.detailstext.text = LangManager.getString(830,[this.selectedSlotItem.itemName]);
               break;
            case UIMODE_TOWNTOLL:
               this.titleText.label.text = LangManager.getString(5013);
               this.npcname.nametext.text = LangManager.getString(5013);
               this.npcname.visible = true;
               this.bust.faceLeft();
               this.bust.visible = true;
               this.money.visible = true;
               territory = NodeGenerator.instance.getTerritory(StageManager.getCurrentNode());
               territoryData = NodeGenerator.instance.getTerritoryData(territory.x,territory.y,false);
               clanId = territoryData.getTownSide();
               if(clanId == 1)
               {
                  clanName = LangManager.getString(275);
                  this.bust.initMCSFromNPCID(247);
               }
               else if(clanId == 2)
               {
                  clanName = LangManager.getString(276);
                  this.bust.initMCSFromNPCID(447);
               }
               else if(clanId == 3)
               {
                  clanName = LangManager.getString(277);
                  this.bust.initMCSFromNPCID(347);
               }
               else if(clanId == 4)
               {
                  clanName = LangManager.getString(278);
                  this.bust.initMCSFromNPCID(547);
               }
               else if(StatsManager.isCustomClan(clanId))
               {
                  clanName = territoryData.customClanOwnerName;
                  this.bust.initMCSFromNPCID(647);
               }
               else
               {
                  clanName = "us";
                  this.bust.initMCSFromNPCID(647);
               }
               if(param == 0)
               {
                  price = NodeGenerator.instance.getNodeLevel(StageManager.getCurrentNode());
                  this.detailstext.text = LangManager.getString(879,[territoryData.getTownName(),clanName,price]);
               }
               else
               {
                  this.detailstext.text = LangManager.getString(880,[territoryData.getTownName()]);
                  this.menuState = 1;
               }
         }
         this.menuData = XMLList(uidata.ui[uimode]);
         this.initButtons();
         this.initDetails();
      }
      
      internal function createNinjaServant() : *
      {
         var ninja:Obj_NPC = null;
         if(StatsManager.purchasesMade.getIntValue() > 0 && StatsManager.showNinjaServant && !this.hasNinja)
         {
            ProjectileManager.createSmoke(StageManager.getPlayer().getMapPosition() + 100,StageManager.getPlayer().getMCS().y);
            ninja = StageManager.getGameStage().createRoomObject(3,StageManager.getPlayer().getMapPosition() + 100,StageManager.getPlayer().getMCS().y,"32,kneel,0,12",StatsManager.charname + "ninjaservant",null,false) as Obj_NPC;
            if(ninja != null)
            {
               this.hasNinja = true;
            }
            NetworkManager.instance.createRoomObject(3,StageManager.getPlayer().getMapPosition() + 100,StageManager.getPlayer().getMCS().y,"32,kneel,0,12",StatsManager.charname + "ninjaservant");
            NetworkManager.instance.createRoomProjectile(3,StageManager.getPlayer().getMapPosition() + 100,StageManager.getPlayer().getMCS().y,0,0,0,0);
         }
      }
      
      internal function initButtons(optionList:XMLList = null) : *
      {
         this.actions.length = 0;
         if(optionList == null)
         {
            optionList = this.menuData.menu[this.menuState].option;
         }
         var optionsMax:int = optionList.length();
         var count:int = 0;
         var passedCondition:Boolean = false;
         for(var i:int = 0; i < 6; i++)
         {
            this.buttons[i].visible = false;
         }
         var ap:int = 0;
         for(i = 0; i < optionsMax; i++)
         {
            passedCondition = StatsManager.checkConditions(optionList[i].condition);
            if(i < optionsMax && passedCondition)
            {
               if(optionList[i].action.ap.toString() != "")
               {
                  ap = 0;
               }
               else
               {
                  ap = int(optionList[i].ap);
               }
               this.buttons[count].visible = true;
               if(ap == 0)
               {
                  this.buttons[count].setText(LangManager.getString(int(optionList[i].label)));
               }
               else
               {
                  this.buttons[count].setText(LangManager.getString(int(optionList[i].label)),"",ap);
               }
               if(optionList[i].icon.toString() != "")
               {
                  this.buttons[count].setInteractIcon(int(optionList[i].icon));
               }
               else
               {
                  this.buttons[count].clearIcon();
               }
               this.actions[count] = optionList[i].action;
               count++;
            }
         }
      }
      
      public function gotAllCrops(array:Array) : *
      {
         var crops:int = 0;
         var max:int = int(array.length);
         var maxCrops:int = int(array[0]);
         var maxCropsSide:int = 0;
         var leastCrops:int = int(array[0]);
         var leastCropsSide:* = 0;
         for(var i:int = 1; i < max; i++)
         {
            crops = int(array[i]);
            if(crops > maxCrops)
            {
               maxCrops = crops;
               maxCropsSide = i;
            }
            if(crops < leastCrops)
            {
               leastCrops = crops;
               leastCropsSide = i;
            }
         }
         this.cropPrices = [10,10,10,10];
         if(maxCrops != leastCrops)
         {
            this.cropPrices[leastCropsSide] = 20;
            this.cropPrices[maxCropsSide] = 5;
         }
         if(this.uimode == UIMODE_MARKET && this.menuState == 1)
         {
            this.initDetails();
         }
      }
      
      internal function initDetails() : *
      {
         var level:int = 0;
         var count:int = 0;
         var weapon:Item = null;
         var weaponlevel:int = 0;
         switch(this.uimode)
         {
            case UIMODE_PEDDLER:
            case UIMODE_VEGPATCH:
            case UIMODE_MERCHANT:
            case UIMODE_INN:
            case UIMODE_STABLES:
            case UIMODE_LEAVECLAN:
            case UIMODE_JOINCUSTOMCLANRECRUIT:
            case UIMODE_JOINCUSTOMCLANGENERAL:
               break;
            case UIMODE_MARKET:
               if(this.menuState == 1)
               {
                  count = StatsManager.getStat(20040);
                  if(count == 0)
                  {
                     this.detailstext.text = LangManager.getString(270);
                  }
                  else
                  {
                     this.detailstext.text = LangManager.getString(838,[StatsManager.getStat(20040)]) + "\n";
                  }
                  this.detailstext.appendText(LangManager.getString(275) + ": " + this.cropPrices[0] + " " + LangManager.getString(63) + "/" + LangManager.getString(279) + "\n");
                  this.detailstext.appendText(LangManager.getString(276) + ": " + this.cropPrices[1] + " " + LangManager.getString(63) + "/" + LangManager.getString(279) + "\n");
                  this.detailstext.appendText(LangManager.getString(277) + ": " + this.cropPrices[2] + " " + LangManager.getString(63) + "/" + LangManager.getString(279) + "\n");
                  this.detailstext.appendText(LangManager.getString(278) + ": " + this.cropPrices[3] + " " + LangManager.getString(63) + "/" + LangManager.getString(279) + "\n");
               }
               else
               {
                  this.detailstext.text = LangManager.getString(4162) + this.getGoodsPriceString(0,StatsManager.getStat(20054));
                  this.detailstext.appendText("\n" + LangManager.getString(4163) + this.getGoodsPriceString(1,StatsManager.getStat(20055)));
                  this.detailstext.appendText("\n" + LangManager.getString(4164) + this.getGoodsPriceString(2,StatsManager.getStat(20056)));
                  this.detailstext.appendText("\n" + LangManager.getString(4165) + this.getGoodsPriceString(3,StatsManager.getStat(20057)));
               }
               break;
            case UIMODE_REBIRTH:
               if(this.menuState == 0)
               {
                  this.detailstext.text = LangManager.getString(610);
               }
               else if(this.menuState == 1)
               {
                  this.detailstext.text = LangManager.getString(611);
                  this.elementCircle.visible = true;
               }
               break;
            case UIMODE_BANK:
               break;
            case UIMODE_GAMBLINGDEN:
               if(this.menuState == 0)
               {
                  if(this.bet > 0)
                  {
                     StatsManager.changeStat(StatsManager.STAT_GOLD,this.bet);
                  }
                  this.bet = 0;
                  this.detailstext.text = "";
                  this.updateMoney();
               }
               else if(this.menuState == 1 || this.menuState == 2)
               {
                  this.detailstext.text = LangManager.getString(613) + this.bet;
               }
               if(this.menuState == 2)
               {
                  if(this.bet == 0)
                  {
                     this.menuState = 1;
                     this.initButtons();
                  }
                  else
                  {
                     this.chohan.visible = true;
                     this.chohan.gotoAndStop(1);
                  }
               }
               break;
            case UIMODE_GETAP:
            case UIMODE_GETCOINS:
               if(this.menuState == 1)
               {
                  this.detailstext.text = LangManager.getString(609);
               }
               else if(this.menuState == 2)
               {
                  this.detailstext.text = LangManager.getString(615);
               }
               else if(this.menuState == 3)
               {
                  this.detailstext.text = LangManager.getString(636);
               }
               else if(this.menuState == 4)
               {
                  this.update(QueryManager.instance.getServerTime());
               }
               else if(StatsManager.showChikakoAsNinja())
               {
                  this.detailstext.text = LangManager.getString(723);
               }
               else
               {
                  this.detailstext.text = "";
               }
               break;
            case UIMODE_BLACKSMITH:
               level = StageManager.getCurrentNodeLevel();
               if(level > 80)
               {
                  level = 80;
               }
               if(this.menuState == 0)
               {
                  this.detailstext.text = LangManager.getString(2014);
               }
               else if(this.menuState == 1)
               {
                  if(level < 30)
                  {
                     this.detailstext.text = LangManager.getString(845,[level,level * 100]);
                  }
                  else if(level < 60)
                  {
                     this.detailstext.text = LangManager.getString(846,[level,level * 100]);
                  }
                  else
                  {
                     this.detailstext.text = LangManager.getString(847,[level,level * 100]);
                  }
               }
               else if(this.menuState == 2)
               {
                  this.detailstext.text = LangManager.getString(848,[level * 10]);
               }
               else if(this.menuState == 3)
               {
                  weapon = StatsManager.equipment[StatsManager.EQ_WEAPON];
                  if(weapon == null || weapon.itemID == 0 || weapon.itemID == 13000)
                  {
                     this.detailstext.text = LangManager.getString(849);
                     return;
                  }
                  weaponlevel = weapon.getLevel();
                  if(weapon.itemID == 13022)
                  {
                     weaponlevel = 59;
                  }
                  if(weaponlevel < 30)
                  {
                     this.detailstext.text = LangManager.getString(850);
                  }
                  else if(weaponlevel < 60)
                  {
                     this.detailstext.text = LangManager.getString(851);
                  }
                  else
                  {
                     this.detailstext.text = LangManager.getString(852);
                  }
               }
         }
      }
      
      public function update(serverTimeVariable:int) : *
      {
         var diff:int = 0;
         var streak:int = 0;
         if(!visible)
         {
            return;
         }
         if((this.uimode == UIMODE_GETAP || this.uimode == UIMODE_GETCOINS) && this.menuState == 4)
         {
            diff = StatsManager.getStat(30018) - serverTimeVariable;
            if(diff <= 0)
            {
               if(this.detailstext.text != LangManager.getString(839))
               {
                  this.initButtons();
                  this.detailstext.text = LangManager.getString(839);
               }
            }
            else
            {
               this.detailstext.text = LangManager.getString(840,[this.getTimeString(diff)]);
            }
            streak = StatsManager.getStat(30019);
            if(diff < -172800)
            {
               streak = 0;
            }
            if(streak == 1)
            {
               this.detailstext.appendText("\n\n" + LangManager.getString(841));
            }
            else
            {
               this.detailstext.appendText("\n\n" + LangManager.getString(842,[streak]));
            }
            this.detailstext.appendText("\n" + LangManager.getString(843));
            this.detailstext.appendText("\n" + LangManager.getString(844));
         }
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
      
      internal function buttonClick(num:int) : *
      {
         var rng:RNG;
         var shopData:XMLShopData = null;
         var cost:int = 0;
         var weapon:Item = null;
         var clanId:int = 0;
         var hp:int = 0;
         var maxhp:int = 0;
         var chi:int = 0;
         var maxchi:int = 0;
         var level:int = 0;
         var sword:Item = null;
         var weaponlevel:int = 0;
         var dptimediff:int = 0;
         var streak:int = 0;
         var itemid:int = 0;
         var dice:int = 0;
         if(!StatsManager.checkConditions(this.actions[num].condition))
         {
            OverworldHUD.instance.showDialog(LangManager.getString(this.actions[num].errormsg),LangManager.getString(5));
            OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
            return;
         }
         if(this.actions[num].ap.toString() != "" && !StatsManager.checkAP(int(this.actions[num].ap)))
         {
            OverworldHUD.instance.showDialogAP(LangManager.getString(100),LangManager.getString(5));
            OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
            return;
         }
         rng = new RNG(StageManager.getCurrentNode() * QueryManager.instance.getServerDate());
         switch(this.actions[num].id.toString())
         {
            case "goto":
               this.menuState = int(this.actions[num].param);
               this.initButtons();
               this.initDetails();
               break;
            case "close":
               this.hide();
               break;
            case "innrest":
               if(StatsManager.getGold() < NodeGenerator.instance.getNodeLevel(StageManager.getCurrentNode()) * 2)
               {
                  OverworldHUD.instance.showDialog(LangManager.getString(88),LangManager.getString(5));
                  OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
                  return;
               }
               StatsManager.changeGold(-NodeGenerator.instance.getNodeLevel(StageManager.getCurrentNode()) * 2);
               this.hide();
               OverworldHUD.instance.screenTransition.startClose(ScreenTransition.ACTION_REST);
               break;
            case "peddlerbuy":
               shopData = new XMLShopData(new XMLList());
               shopData.initPeddlerItems(rng);
               OverworldHUD.instance.shopUI.showBuy(shopData);
               break;
            case "peddlersell":
               shopData = new XMLShopData(new XMLList());
               OverworldHUD.instance.shopUI.showSell(shopData);
               break;
            case "merchantbuy":
               shopData = new XMLShopData(new XMLList());
               shopData.initMerchantItems();
               OverworldHUD.instance.shopUI.showBuyMerchant(shopData);
               break;
            case "merchantsell":
               shopData = new XMLShopData(new XMLList());
               OverworldHUD.instance.shopUI.showSell(shopData);
               break;
            case "barberbuy":
               shopData = new XMLShopData(new XMLList());
               shopData.initBarberItems(rng);
               OverworldHUD.instance.shopUI.showBuy(shopData);
               break;
            case "innbuy":
               shopData = new XMLShopData(new XMLList());
               shopData.initInnItems(rng);
               OverworldHUD.instance.shopUI.showBuy(shopData);
               break;
            case "sellcrop":
               this.sellCrop(int(this.actions[num].param));
               break;
            case "travel":
               this.travel(int(this.actions[num].param));
               break;
            case "plant":
               this.crops.plant(int(this.actions[num].param));
               break;
            case "harvest":
               this.crops.harvest();
               break;
            case "buygoods":
               this.buyGoods(int(this.actions[num].param));
               break;
            case "sellgoods":
               this.sellGoods(int(this.actions[num].param));
               break;
            case "firerebirth":
               if(StatsManager.getPlayerStats(StatsManager.STAT_DAN) == 8)
               {
                  StatsManager.changeStat(StatsManager.STAT_FIREATK,20);
               }
               else if(StatsManager.getPlayerStats(StatsManager.STAT_DAN) < 8)
               {
                  StatsManager.changeStat(StatsManager.STAT_FIREATK,10);
               }
               StatsManager.changeStat(2202,-1);
               this.hide();
               StatsManager.doRebirth();
               break;
            case "windrebirth":
               if(StatsManager.getPlayerStats(StatsManager.STAT_DAN) == 8)
               {
                  StatsManager.changeStat(StatsManager.STAT_WINDATK,20);
               }
               else if(StatsManager.getPlayerStats(StatsManager.STAT_DAN) < 8)
               {
                  StatsManager.changeStat(StatsManager.STAT_WINDATK,10);
               }
               StatsManager.changeStat(2202,-1);
               this.hide();
               StatsManager.doRebirth();
               break;
            case "waterrebirth":
               if(StatsManager.getPlayerStats(StatsManager.STAT_DAN) == 8)
               {
                  StatsManager.changeStat(StatsManager.STAT_WATERATK,20);
               }
               else if(StatsManager.getPlayerStats(StatsManager.STAT_DAN) < 8)
               {
                  StatsManager.changeStat(StatsManager.STAT_WATERATK,10);
               }
               StatsManager.changeStat(2202,-1);
               this.hide();
               StatsManager.doRebirth();
               break;
            case "earthrebirth":
               if(StatsManager.getPlayerStats(StatsManager.STAT_DAN) == 8)
               {
                  StatsManager.changeStat(StatsManager.STAT_EARTHATK,20);
               }
               else if(StatsManager.getPlayerStats(StatsManager.STAT_DAN) < 8)
               {
                  StatsManager.changeStat(StatsManager.STAT_EARTHATK,10);
               }
               StatsManager.changeStat(2202,-1);
               this.hide();
               StatsManager.doRebirth();
               break;
            case "deposit":
               this.bankDeposit(int(this.actions[num].param));
               break;
            case "withdraw":
               this.bankWithdraw(int(this.actions[num].param));
               break;
            case "bet":
               this.doBet(int(this.actions[num].param));
               break;
            case "chohan":
               this.doChoHan(int(this.actions[num].param));
               break;
            case "buypremium":
               shopData = new XMLShopData(new XMLList());
               shopData.initPremiumItems();
               OverworldHUD.instance.shopUI.showBuy(shopData);
               OverworldHUD.instance.shopUI.showShopDTAP();
               break;
            case "convertgold":
               if(!StatsManager.isCoinPurseFull())
               {
                  StatsManager.spendHeavenlyGold(1,function():*
                  {
                     StatsManager.changeGold(1000);
                     QueryManager.instance.saveModifiedCharData();
                     updateMoney();
                     QueryManager.instance.reportPremiumBuy(4,"convertgold",1);
                  },function():*
                  {
                     OverworldHUD.instance.onShowGetGoldPromptDialog(1);
                  });
               }
               else
               {
                  OverworldHUD.instance.showDialog(LangManager.getString(356),LangManager.getString(5));
                  OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
               }
               break;
            case "leaveclan":
               StatsManager.changeStat(2203,-1);
               this.hide();
               StatsManager.leaveClan();
               break;
            case "joincustomclanrecruit":
               clanId = this.selectedSlotItem.getModifierBonus(StatsManager.STAT_SIDE);
               StatsManager.setStat(StatsManager.STAT_SIDE,clanId);
               StatsManager.setStat(StatsManager.STAT_WARMOVESMADE,0);
               StatsManager.setStat(StatsManager.STAT_WARCOINSDONATED,0);
               QueryManager.instance.delWarSentry(-1,StatsManager.id);
               OverworldHUD.instance.setCustomClan();
               StatsManager.removeItemFromInventory(this.selectedSlotItem);
               this.menuState = 1;
               this.initButtons();
               QueryManagerPIO.instance.loadCustomClanData(clanId,function():*
               {
                  hide();
               });
               break;
            case "joincustomclangeneral":
               clanId = this.selectedSlotItem.getModifierBonus(StatsManager.STAT_SIDE);
               StatsManager.setStat(StatsManager.STAT_SIDE,clanId);
               StatsManager.setStat(StatsManager.STAT_WARMOVESMADE,2076);
               StatsManager.setStat(StatsManager.STAT_WARCOINSDONATED,0);
               QueryManager.instance.delWarSentry(-1,StatsManager.id);
               OverworldHUD.instance.setCustomClan();
               StatsManager.removeItemFromInventory(this.selectedSlotItem);
               this.menuState = 1;
               this.initButtons();
               QueryManagerPIO.instance.loadCustomClanData(clanId,function():*
               {
                  hide();
               });
               break;
            case "nameweapon":
               if(StatsManager.getHeavenlyGold() >= 2 && NetworkManager.instance.isGlobalPIOConnected())
               {
                  this.hide();
                  OverworldHUD.instance.changeNameDialog.show(ChangeNameDialog.MODE_NAMEWEAPON);
               }
               else
               {
                  OverworldHUD.instance.onShowGetGoldPromptDialog(2 - StatsManager.getHeavenlyGold());
               }
               break;
            case "fullhpchi":
               hp = StatsManager.getPlayerStats(StatsManager.STAT_HP);
               maxhp = StatsManager.getPlayerStats(StatsManager.STAT_MAXHP) + StatsManager.findBonusStat(StatsManager.STAT_MAXHP);
               chi = StatsManager.getPlayerStats(StatsManager.STAT_CHI);
               maxchi = StatsManager.getPlayerStats(StatsManager.STAT_MAXCHI) + StatsManager.findBonusStat(StatsManager.STAT_MAXCHI);
               if(hp < maxhp || chi < maxchi)
               {
                  StatsManager.spendHeavenlyGold(1,function():*
                  {
                     hide();
                     OverworldHUD.instance.screenTransition.startClose(ScreenTransition.ACTION_REST);
                     QueryManager.instance.reportPremiumBuy(0,"fullhpchi",1);
                  },function():*
                  {
                     OverworldHUD.instance.onShowGetGoldPromptDialog(1);
                  });
               }
               break;
            case "forgeweapon":
               level = StageManager.getCurrentNodeLevel();
               if(level > 80)
               {
                  level = 80;
               }
               cost = level * 100;
               if(StatsManager.getGold() < cost)
               {
                  OverworldHUD.instance.showDialog(LangManager.getString(88),LangManager.getString(5));
                  OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
                  return;
               }
               if(level < 30)
               {
                  if(StatsManager.getStat(20061) < 2)
                  {
                     OverworldHUD.instance.showDialog(LangManager.getString(666),LangManager.getString(5));
                     OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
                     return;
                  }
                  StatsManager.changeStat(20061,-2);
               }
               else if(level < 60)
               {
                  if(StatsManager.getStat(20062) == 0 || StatsManager.getStat(20063) < 2)
                  {
                     OverworldHUD.instance.showDialog(LangManager.getString(666),LangManager.getString(5));
                     OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
                     return;
                  }
                  StatsManager.changeStat(20062,-1);
                  StatsManager.changeStat(20063,-2);
               }
               else
               {
                  if(StatsManager.getStat(20061) < 2 || StatsManager.getStat(20060) < 2 || StatsManager.getStat(20065) == 0)
                  {
                     OverworldHUD.instance.showDialog(LangManager.getString(666),LangManager.getString(5));
                     OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
                     return;
                  }
                  StatsManager.changeStat(20061,-2);
                  StatsManager.changeStat(20060,-2);
                  StatsManager.changeStat(20065,-1);
               }
               StatsManager.changeGold(-cost);
               QueryManager.instance.saveModifiedCharData();
               this.hide();
               sword = OverworldHUD.instance.lootDialog.addRandomSword(level);
               sword.setCreator(StatsManager.getChatDisplayCharname());
               OverworldHUD.instance.lootDialog.notifyDontRefreshAfter();
               OverworldHUD.instance.lootDialog.show();
               StatsManager.reportAchievementStat(60020,1);
               break;
            case "repairweapon":
               cost = StageManager.getCurrentNodeLevel() * 10;
               if(StatsManager.getGold() < cost)
               {
                  OverworldHUD.instance.showDialog(LangManager.getString(88),LangManager.getString(5));
                  OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
                  return;
               }
               weapon = StatsManager.equipment[StatsManager.EQ_WEAPON];
               if(weapon == null || weapon.itemID == 0 || weapon.itemID == 13000)
               {
                  OverworldHUD.instance.showDialog(LangManager.getString(637),LangManager.getString(5));
                  OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
                  return;
               }
               StatsManager.changeGold(-cost);
               if(weapon.uses > 1)
               {
                  weapon.uses = 1;
               }
               StatsManager.reportAchievementStat(60005,1);
               QueryManager.instance.reportDataModified(StatsManager.EQUIPMENT);
               QueryManager.instance.saveModifiedCharData();
               this.hide();
               break;
            case "reinforceweapon":
               cost = 5000;
               if(StatsManager.getGold() < cost)
               {
                  OverworldHUD.instance.showDialog(LangManager.getString(88),LangManager.getString(5));
                  OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
                  return;
               }
               weapon = StatsManager.equipment[StatsManager.EQ_WEAPON];
               if(weapon == null || weapon.itemID == 0 || weapon.itemID == 13000)
               {
                  OverworldHUD.instance.showDialog(LangManager.getString(637),LangManager.getString(5));
                  OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
                  return;
               }
               weaponlevel = weapon.getLevel();
               if(weapon.itemID == 13022)
               {
                  weaponlevel = 59;
               }
               if(weaponlevel < 30)
               {
                  if(StatsManager.getStat(20064) == 0)
                  {
                     OverworldHUD.instance.showDialog(LangManager.getString(666),LangManager.getString(5));
                     OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
                     return;
                  }
                  StatsManager.changeStat(20064,-1);
               }
               else if(weaponlevel < 60)
               {
                  if(StatsManager.getStat(20065) == 0)
                  {
                     OverworldHUD.instance.showDialog(LangManager.getString(666),LangManager.getString(5));
                     OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
                     return;
                  }
                  StatsManager.changeStat(20065,-1);
               }
               else
               {
                  if(StatsManager.getStat(20066) == 0)
                  {
                     OverworldHUD.instance.showDialog(LangManager.getString(666),LangManager.getString(5));
                     OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
                     return;
                  }
                  StatsManager.changeStat(20066,-1);
               }
               StatsManager.changeGold(-cost);
               weapon.uses = 0;
               weapon.setCreator(StatsManager.getChatDisplayCharname());
               QueryManager.instance.reportDataModified(StatsManager.EQUIPMENT);
               QueryManager.instance.saveModifiedCharData();
               this.hide();
               break;
            case "dailyprize":
               SoundManager.instance.playGoodKoto();
               dptimediff = StatsManager.getStat(30018) - QueryManager.instance.getServerTime();
               if(dptimediff <= 0)
               {
                  streak = 1;
                  if(dptimediff >= -172800)
                  {
                     streak = StatsManager.changeStat(30019,1);
                  }
                  else
                  {
                     StatsManager.setStat(30019,1);
                  }
                  StatsManager.setStat(30018,QueryManager.instance.getServerTime() + 24 * 60 * 60);
                  if(streak > 1 && (streak - 1) % 30 == 0)
                  {
                     trace("30 bonus prize");
                     if(StatsManager.bonusPrizeCollected)
                     {
                        QueryManager.instance.reportHack("multiple 30 bonus prize");
                        return;
                     }
                     StatsManager.bonusPrizeCollected = true;
                     dice = Math.random() * 10;
                     if(dice == 0)
                     {
                        itemid = 2130;
                     }
                     else if(dice == 1)
                     {
                        itemid = 2131;
                     }
                     else if(dice == 2)
                     {
                        itemid = 2132;
                     }
                     else if(dice == 3)
                     {
                        itemid = 2133;
                     }
                     else if(dice == 4)
                     {
                        itemid = 2135;
                     }
                     else if(dice == 5)
                     {
                        itemid = 2136;
                     }
                     else if(dice == 6)
                     {
                        itemid = 2137;
                     }
                     else if(dice == 7)
                     {
                        itemid = 2138;
                     }
                     else if(dice == 8)
                     {
                        itemid = 2139;
                     }
                     else if(dice == 9)
                     {
                        itemid = 2146;
                     }
                     OverworldHUD.instance.lootDialog.addLootItemBasic(itemid,1);
                     StatsManager.reportAchievementStat(60015,1);
                     NetworkManager.instance.globalAnnouncement("",LangManager.getString(862,[StatsManager.getChatDisplayCharname()]));
                  }
                  else if(streak > 1 && (streak - 1) % 10 == 0)
                  {
                     trace("10 bonus prize");
                     if(StatsManager.bonusPrizeCollected)
                     {
                        QueryManager.instance.reportHack("multiple 10 bonus prize");
                        return;
                     }
                     StatsManager.bonusPrizeCollected = true;
                     dice = Math.random() * 6;
                     if(dice == 0)
                     {
                        OverworldHUD.instance.lootDialog.addLootCoins(1000);
                     }
                     else if(dice == 1)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(2101,1);
                     }
                     else if(dice == 2)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(2105,1);
                     }
                     else if(dice == 3)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(2126,1);
                     }
                     else if(dice == 4)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(2127,1);
                     }
                     else if(dice == 5)
                     {
                        OverworldHUD.instance.lootDialog.addRandomLootItem(StatsManager.getLevel(),true,true,true);
                     }
                     NetworkManager.instance.globalAnnouncement("",LangManager.getString(861,[StatsManager.getChatDisplayCharname()]));
                  }
                  else
                  {
                     trace("claim prize");
                     dice = Math.random() * 36;
                     if(dice <= 4)
                     {
                        OverworldHUD.instance.lootDialog.addLootCoins(100);
                     }
                     else if(dice == 5)
                     {
                        OverworldHUD.instance.lootDialog.addLootCoins(200);
                     }
                     else if(dice == 6)
                     {
                        OverworldHUD.instance.lootDialog.addLootCoins(300);
                     }
                     else if(dice == 7)
                     {
                        OverworldHUD.instance.lootDialog.addRandomLootItem(StatsManager.getLevel(),true,true);
                     }
                     else if(dice == 8)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(2115,1);
                     }
                     else if(dice == 9)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(2116,1);
                     }
                     else if(dice == 10)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(2117,1);
                     }
                     else if(dice == 11)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(2118,1);
                     }
                     else if(dice == 12)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(2140,1);
                     }
                     else if(dice == 13)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(2141,1);
                     }
                     else if(dice == 14)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(2119,1);
                     }
                     else if(dice == 15)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(2120,1);
                     }
                     else if(dice == 16)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(2100,1);
                     }
                     else if(dice == 17)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(2125,1);
                     }
                     else if(dice == 18)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(2103,1);
                     }
                     else if(dice == 19)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(2104,1);
                     }
                     else if(dice == 20)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(2105,1);
                     }
                     else if(dice == 21)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(2106,1);
                     }
                     else if(dice == 22)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(2107,1);
                     }
                     else if(dice == 23)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(2108,1);
                     }
                     else if(dice == 24)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(2109,1);
                     }
                     else if(dice == 25)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(2110,1);
                     }
                     else if(dice == 26)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(2111,1);
                     }
                     else if(dice == 27)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(2112,1);
                     }
                     else if(dice == 28)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(2113,1);
                     }
                     else if(dice == 29)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(2114,1);
                     }
                     else if(dice == 30)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(2128,1);
                     }
                     else if(dice == 31)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(20054,1);
                     }
                     else if(dice == 32)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(20055,1);
                     }
                     else if(dice == 33)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(20056,1);
                     }
                     else if(dice == 34)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(20057,1);
                     }
                     else if(dice == 35)
                     {
                        OverworldHUD.instance.lootDialog.addLootItemBasic(2216,1);
                     }
                  }
                  this.hide();
                  OverworldHUD.instance.lootDialog.show();
                  OverworldHUD.instance.lootDialog.notifyDontRefreshAfter();
               }
               break;
            case "redeem":
               this.hide();
               OverworldHUD.instance.changeNameDialog.show(ChangeNameDialog.MODE_REDEEM);
               break;
            case "bankstorage":
               OverworldHUD.instance.onShowBank();
               break;
            case "crafting":
               OverworldHUD.instance.onShowCrafting();
               break;
            case "achievement":
               OverworldHUD.instance.onShowAchievement(null);
               break;
            case "recenteventsscrolldown":
               if(this.detailstext.scrollV >= this.detailstext.maxScrollV)
               {
                  this.detailstext.scrollV = 0;
               }
               else
               {
                  this.detailstext.scrollV += 10;
               }
               break;
            case "paytowntoll":
               cost = NodeGenerator.instance.getNodeLevel(StageManager.getCurrentNode());
               if(StatsManager.getGold() < cost)
               {
                  OverworldHUD.instance.showDialog(LangManager.getString(88),LangManager.getString(5));
                  OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
                  return;
               }
               StatsManager.changeGold(-cost);
            case "entertown":
               this.hide();
               OverworldHUD.getInstance().screenTransition.setTeleportTarget(StageManager.getCurrentNode(),1);
               OverworldHUD.getInstance().screenTransition.startClose(ScreenTransition.ACTION_TELEPORT);
         }
      }
      
      public function updateMoney() : *
      {
         this.money.coinstext.text = StatsManager.getStat(11).toString();
         this.money.goldtext.text = StatsManager.getHeavenlyGold().toString();
      }
      
      public function hide() : *
      {
         if(!visible)
         {
            return;
         }
         if(UIMODE_VEGPATCH)
         {
            this.crops.hide();
         }
         this.removeEventListeners();
         this.visible = false;
         this.selectedSlotItem = null;
         OverworldHUD.instance.showInfoBustButtons(true);
         NodeUI.instance.visible = true;
         QueryManager.instance.saveModifiedCharData();
         if(!GameEngine.isOverworld())
         {
            OverworldHUD.instance.initForAdventureMode();
            InputManager.setAdventureMode();
         }
         else
         {
            Overworld.setMapEnabled(true);
         }
         if(this.hasNinja)
         {
            ProjectileManager.createSmoke(StageManager.getPlayer().getMapPosition() + 100,StageManager.getPlayer().getMCS().y);
            StageManager.getGameStage().removeInteractiveRoomObject(StatsManager.charname + "ninjaservant");
            this.hasNinja = false;
            NetworkManager.instance.removeRoomObject(StatsManager.charname + "ninjaservant");
            NetworkManager.instance.createRoomProjectile(3,StageManager.getPlayer().getMapPosition() + 100,StageManager.getPlayer().getMCS().y,0,0,0,0);
         }
      }
      
      public function addEventListeners() : *
      {
         this.button1.addEventListener(MouseEvent.CLICK,this.button1Click);
         this.button2.addEventListener(MouseEvent.CLICK,this.button2Click);
         this.button3.addEventListener(MouseEvent.CLICK,this.button3Click);
         this.button4.addEventListener(MouseEvent.CLICK,this.button4Click);
         this.button5.addEventListener(MouseEvent.CLICK,this.button5Click);
         this.button6.addEventListener(MouseEvent.CLICK,this.button6Click);
         this.money.getCoinsButton.addEventListener(MouseEvent.CLICK,this.getCoinsClick);
         this.money.payUIButton.addEventListener(MouseEvent.CLICK,this.getGoldClick);
         this.chikako.leftButton.addEventListener(MouseEvent.CLICK,this.chikakoLeftButtonClick);
         this.chikako.rightButton.addEventListener(MouseEvent.CLICK,this.chikakoRightButtonClick);
      }
      
      public function removeEventListeners() : *
      {
         this.button1.removeEventListener(MouseEvent.CLICK,this.button1Click);
         this.button2.removeEventListener(MouseEvent.CLICK,this.button2Click);
         this.button3.removeEventListener(MouseEvent.CLICK,this.button3Click);
         this.button4.removeEventListener(MouseEvent.CLICK,this.button4Click);
         this.button5.removeEventListener(MouseEvent.CLICK,this.button5Click);
         this.button6.removeEventListener(MouseEvent.CLICK,this.button6Click);
         this.money.getCoinsButton.removeEventListener(MouseEvent.CLICK,this.getCoinsClick);
         this.money.payUIButton.removeEventListener(MouseEvent.CLICK,this.getGoldClick);
         this.chikako.leftButton.removeEventListener(MouseEvent.CLICK,this.chikakoLeftButtonClick);
         this.chikako.rightButton.removeEventListener(MouseEvent.CLICK,this.chikakoRightButtonClick);
      }
      
      internal function button1Click(event:Event) : *
      {
         this.buttonClick(0);
      }
      
      internal function button2Click(event:Event) : *
      {
         this.buttonClick(1);
      }
      
      internal function button3Click(event:Event) : *
      {
         this.buttonClick(2);
      }
      
      internal function button4Click(event:Event) : *
      {
         this.buttonClick(3);
      }
      
      internal function button5Click(event:Event) : *
      {
         this.buttonClick(4);
      }
      
      internal function button6Click(event:Event) : *
      {
         this.buttonClick(5);
      }
      
      internal function getCoinsClick(event:Event) : *
      {
         this.hide();
         this.show(InteractUI.UIMODE_GETCOINS);
      }
      
      internal function getGoldClick(event:Event) : *
      {
         this.hide();
         OverworldHUD.instance.showPayUI(null);
      }
      
      internal function chikakoLeftButtonClick(event:Event) : *
      {
         var current:int = this.chikako.getPortraitFrame();
         this.chikako.setPortrait(--current);
      }
      
      internal function chikakoRightButtonClick(event:Event) : *
      {
         var current:int = this.chikako.getPortraitFrame();
         this.chikako.setPortrait(++current);
      }
      
      internal function sellCrop(house:int) : *
      {
         var price:int = int(this.cropPrices[house]);
         var count:int = StatsManager.getStat(20040);
         OverworldHUD.instance.lootDialog.addLootCoins(count * price);
         StatsManager.setStat(20040,0);
         QueryManager.instance.saveModifiedCharData();
         this.hide();
         QueryManager.instance.updateGlobalVar(50000 + house,count);
         OverworldHUD.instance.globalVarDialog.show();
         OverworldHUD.instance.lootDialog.notifyDontRefreshAfter();
         OverworldHUD.instance.lootDialog.show();
      }
      
      internal function getGoodsPrice(index:int) : int
      {
         var price:int = 0;
         var variation:int = 0;
         var rng:RNG = new RNG(StageManager.getCurrentNode() * QueryManager.instance.getServerDate() * index);
         switch(index)
         {
            case 0:
               price = 10;
               variation = 20;
               break;
            case 1:
               price = 20;
               variation = 30;
               break;
            case 2:
               price = 100;
               variation = 15;
               break;
            case 3:
               price = 200;
               variation = 30;
               break;
            case 4:
               price = 200;
               variation = 30;
         }
         return price * (100 - variation / 2 + rng.rand(variation)) / 100;
      }
      
      internal function getGoodsPriceString(index:int, carrying:int) : String
      {
         var price:int = 0;
         var variation:int = 0;
         switch(index)
         {
            case 0:
               price = 10;
               variation = 20;
               break;
            case 1:
               price = 20;
               variation = 30;
               break;
            case 2:
               price = 100;
               variation = 15;
               break;
            case 3:
               price = 200;
               variation = 30;
               break;
            case 4:
               price = 200;
               variation = 30;
         }
         var rng:RNG = new RNG(StageManager.getCurrentNode() * QueryManager.instance.getServerDate() * index);
         var newprice:int = price * (100 - variation / 2 + rng.rand(variation)) / 100;
         return " (" + LangManager.getString(527) + " " + carrying + ") " + LangManager.getString(529) + " " + newprice + " per unit";
      }
      
      internal function buyGoods(index:int) : *
      {
         var price:int = 0;
         if(StatsManager.getGold() < this.getGoodsPrice(index))
         {
            OverworldHUD.instance.showDialog(LangManager.getString(88),LangManager.getString(5));
            OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
            return;
         }
         switch(index)
         {
            case 0:
               StatsManager.changeStat(20054,1);
               break;
            case 1:
               StatsManager.changeStat(20055,1);
               break;
            case 2:
               StatsManager.changeStat(20056,1);
               break;
            case 3:
               StatsManager.changeStat(20057,1);
               break;
            case 4:
               StatsManager.changeStat(20058,1);
         }
         StatsManager.changeGold(-this.getGoodsPrice(index));
         this.updateMoney();
         this.initDetails();
         StatsManager.reportAchievementStat(60024,-this.getGoodsPrice(index));
      }
      
      internal function sellGoods(index:int) : *
      {
         switch(index)
         {
            case 0:
               StatsManager.changeStat(20054,-1);
               break;
            case 1:
               StatsManager.changeStat(20055,-1);
               break;
            case 2:
               StatsManager.changeStat(20056,-1);
               break;
            case 3:
               StatsManager.changeStat(20057,-1);
               break;
            case 4:
               StatsManager.changeStat(20058,-1);
         }
         StatsManager.changeGold(this.getGoodsPrice(index));
         this.updateMoney();
         this.initButtons();
         this.initDetails();
         if(StatsManager.getStat(60024) < 5000)
         {
            StatsManager.reportAchievementStat(60024,this.getGoodsPrice(index));
         }
      }
      
      internal function initStablesButtons() : *
      {
         var nodeid:int = 0;
         var territoryData:TerritoryData = null;
         var str:String = "";
         var neighbourList:Array = NodeGenerator.instance.getAdjacentTerritories();
         var buttonLabels:Array = new Array();
         for(var i:int = 0; i < 4; i++)
         {
            territoryData = neighbourList[i];
            if(territoryData.hasTown() && territoryData.isInBoundary())
            {
               str += "<option><label>95</label><icon>7</icon><action><id>travel</id><param>" + territoryData.getTown() + "</param></action></option>";
               if(i == 0)
               {
                  buttonLabels.push(territoryData.getTownName() + " (N)");
               }
               else if(i == 1)
               {
                  buttonLabels.push(territoryData.getTownName() + " (W)");
               }
               else if(i == 2)
               {
                  buttonLabels.push(territoryData.getTownName() + " (E)");
               }
               else if(i == 3)
               {
                  buttonLabels.push(territoryData.getTownName() + " (S)");
               }
            }
         }
         str += "<option><label>85</label><icon>14</icon><action><id>close</id></action></option>";
         var optionlist:XMLList = new XMLList(str);
         this.initButtons(optionlist);
         var max:int = int(buttonLabels.length);
         for(i = 0; i < max; i++)
         {
            this.buttons[i].setText(buttonLabels[i],"",5);
         }
      }
      
      internal function travel(nodeid:int) : *
      {
         var cost:int = NodeGenerator.instance.getNodeLevel(StageManager.getCurrentNode()) * 2;
         if(StatsManager.getGold() < cost)
         {
            OverworldHUD.instance.showDialog(LangManager.getString(88),LangManager.getString(5));
            OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
            return;
         }
         if(StatsManager.findWeight() > StatsManager.getCarryingWeight())
         {
            OverworldHUD.instance.showDialogBig(LangManager.getString(138),LangManager.getString(5));
            OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
            return;
         }
         if(!StatsManager.checkAP(5))
         {
            OverworldHUD.instance.showDialogAP(LangManager.getString(100),LangManager.getString(5));
            OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
            return;
         }
         this.hide();
         StatsManager.changeGold(-cost);
         OverworldHUD.getInstance().screenTransition.setTeleportTarget(nodeid);
         OverworldHUD.getInstance().screenTransition.startClose(ScreenTransition.ACTION_TELEPORT);
      }
      
      internal function bankDeposit(num:int) : *
      {
         var inpocket:int = StatsManager.getPlayerStats(StatsManager.STAT_GOLD);
         var inbank:int = StatsManager.getPlayerStats(StatsManager.STAT_COINSINBANK);
         if(num <= inpocket)
         {
            StatsManager.changeStat(StatsManager.STAT_COINSINBANK,num);
            StatsManager.changeStat(StatsManager.STAT_GOLD,-num);
         }
         else if(num > inpocket)
         {
            StatsManager.changeStat(StatsManager.STAT_COINSINBANK,inpocket);
            StatsManager.setStat(StatsManager.STAT_GOLD,0);
         }
         this.updateMoney();
         this.initDetails();
      }
      
      internal function bankWithdraw(num:int) : *
      {
         var inpocket:int = StatsManager.getPlayerStats(StatsManager.STAT_GOLD);
         var inbank:int = StatsManager.getPlayerStats(StatsManager.STAT_COINSINBANK);
         var maxpocket:int = StatsManager.getMaxCoins();
         if(num > inbank)
         {
            num = inbank;
         }
         inpocket += num;
         inbank -= num;
         var pocketexcess:int = 0;
         if(inpocket > maxpocket)
         {
            pocketexcess = inpocket - maxpocket;
            inpocket = maxpocket;
            inbank += pocketexcess;
         }
         StatsManager.setStat(StatsManager.STAT_COINSINBANK,inbank);
         StatsManager.setStat(StatsManager.STAT_GOLD,inpocket);
         this.updateMoney();
         this.initDetails();
      }
      
      internal function doBet(num:int) : *
      {
         var inpocket:int = StatsManager.getPlayerStats(StatsManager.STAT_GOLD);
         if(num <= inpocket)
         {
            this.bet += num;
            StatsManager.changeStat(StatsManager.STAT_GOLD,-num);
            this.updateMoney();
            this.initDetails();
         }
      }
      
      internal function doChoHan(choice:int) : *
      {
         this.menuState = 1;
         this.initButtons();
         this.initDetails();
         if(this.bet == 0)
         {
            return;
         }
         var dice1:int = Math.random() * 6;
         var dice2:int = Math.random() * 6;
         this.chohan.dice1.gotoAndStop(dice1);
         this.chohan.dice2.gotoAndStop(dice2);
         this.chohan.dice1.x = 70 + Math.random() * 60;
         this.chohan.dice1.y = 70 + Math.random() * 120;
         this.chohan.dice2.x = 70 + 60 + Math.random() * 60;
         this.chohan.dice2.y = 70 + Math.random() * 120;
         this.chohan.dice1.rotation = Math.random() * 360;
         this.chohan.dice2.rotation = Math.random() * 360;
         this.chohan.gotoAndPlay(2);
         this.detailstext.text = "";
         var isEven:Boolean = (dice1 + dice2) % 2 == 0;
         if(isEven)
         {
            this.detailstext.appendText(LangManager.getString(555) + ": ");
         }
         else
         {
            this.detailstext.appendText(LangManager.getString(556) + ": ");
         }
         if(isEven && choice == 0 || !isEven && choice == 1)
         {
            StatsManager.changeGold(this.bet * 2);
            this.detailstext.appendText(LangManager.getString(281));
         }
         else
         {
            this.detailstext.appendText(LangManager.getString(477));
            QueryManager.instance.saveModifiedCharData();
         }
         this.bet = 0;
         this.updateMoney();
      }
   }
}

