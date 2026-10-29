package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.net.*;
   import flash.text.TextField;
   import playerio.DatabaseObject;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1437")]
   public class PlayerPanel extends MovieClip
   {
      
      public var DTTimerShadow:TextField;
      
      public var button6:GenericActionButton;
      
      public var tokenlabel:TextField;
      
      public var playerBust:DialogueBust;
      
      public var playerName:TextField;
      
      public var playerText:TextField;
      
      public var playerLabel:MovieClip;
      
      public var tokenText:TextField;
      
      public var DTTimer:TextField;
      
      public var button1:GenericActionButton;
      
      public var button2:GenericActionButton;
      
      public var getDTButton:SimpleButton;
      
      public var button3:GenericActionButton;
      
      public var button4:GenericActionButton;
      
      public var button5:GenericActionButton;
      
      internal var menuState:int;
      
      internal var buttons:Array = new Array();
      
      internal var actions:Array = new Array();
      
      internal var menuData:XMLList;
      
      internal var ppcharname:String;
      
      internal var pplevel:int;
      
      internal var ppdan:int = 0;
      
      internal var ppequipment:String;
      
      internal var ppid:String;
      
      internal var ppside:int;
      
      internal var nodeuiX:Number = NodeUI.instance.x + 10;
      
      internal var nodeuiY:Number = NodeUI.instance.y + 40;
      
      internal var nodeuiSpacingY:Number = NodeUI.instance.actionButtonHeight;
      
      internal var isFriend:Boolean = false;
      
      internal var facetoface:Boolean = false;
      
      internal var friendItem:FriendItem;
      
      public function PlayerPanel()
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
         LangManager.initTextField(this.playerLabel.label,true);
         LangManager.initTextField(this.playerName,true);
         LangManager.initTextField(this.playerText);
         LangManager.initTextField(this.tokenlabel,true);
         this.tokenlabel.text = LangManager.getString(59);
      }
      
      public function init(charname:String, level:int, equipment:String, id:String, side:int) : *
      {
         if(!QueryManager.instance.checkCurrentSessionId())
         {
            OverworldHUD.instance.showMultipleClients();
            return;
         }
         this.addEventListeners();
         this.visible = true;
         this.playerLabel.label.text = LangManager.getString(201) + charname;
         this.ppid = id;
         this.ppcharname = charname;
         this.pplevel = level;
         this.ppside = side;
         OverworldHUD.instance.showInfoBustButtons(false);
         this.tokenText.text = StatsManager.getStat(StatsManager.STAT_DUELTOKENS).toString();
         Overworld.setMapEnabled(false);
         if(!GameEngine.isOverworld())
         {
            InputManager.disableInput();
            StatsManager.getPlayer().stopMoving();
         }
         if(OverworldHUD.instance.friendpanel.hasInit)
         {
            this.isFriend = OverworldHUD.instance.friendpanel.isFriend(id);
         }
         else
         {
            this.isFriend = true;
         }
         this.playerText.text = LangManager.getString(90);
         this.getFriendData();
         var uidata:XML = InteractUI.getUIData();
         this.menuData = XMLList(uidata.ui[InteractUI.UIMODE_PLAYERPANEL]);
         this.menuState = 0;
         this.initButtons();
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
      
      internal function buttonClick(num:int) : *
      {
         var mylevel:int = 0;
         switch(this.actions[num].id.toString())
         {
            case "goto":
               this.menuState = int(this.actions[num].param);
               this.initButtons();
               break;
            case "close":
               this.closePanel();
               break;
            case "challenge":
               if(StageManager.getRoomPrivate() == XMLRoomData.ROOMTYPE_HELL)
               {
                  OverworldHUD.instance.showDialog(LangManager.getString(860),LangManager.getString(5));
               }
               else if(StatsManager.getStat(StatsManager.STAT_DUELTOKENS) > 0)
               {
                  mylevel = StatsManager.getLevel();
                  if(Math.abs(this.pplevel - mylevel) <= 3)
                  {
                     this.doChallenge();
                  }
                  else if(this.pplevel > mylevel && this.facetoface)
                  {
                     OverworldHUD.instance.showYesNoDialog(LangManager.getString(766),this.doChallenge);
                  }
                  else
                  {
                     OverworldHUD.instance.showDialog(LangManager.getString(240),LangManager.getString(5));
                  }
               }
               else
               {
                  OverworldHUD.instance.showDialogDT();
               }
               break;
            case "duelreplay":
               QueryManager.instance.getReplayByName(this.ppcharname);
               break;
            case "addfriend":
               OverworldHUD.instance.friendpanel.addFriend(this.ppid);
               this.refresh();
               break;
            case "givecoins":
               OverworldHUD.instance.onShowGiveCoinsDialog();
               break;
            case "giveitem":
               OverworldHUD.instance.onShowInventoryGive();
               this.visible = false;
               break;
            case "teachfire1":
               NetworkManager.instance.playerTeach(1,this.ppid);
               StatsManager.getPlayer().startAnim(MCSActor.POSE1);
               this.closePanel();
               break;
            case "teachfire2":
               NetworkManager.instance.playerTeach(2,this.ppid);
               StatsManager.getPlayer().startAnim(MCSActor.POSE1);
               this.closePanel();
               break;
            case "teachwater1":
               NetworkManager.instance.playerTeach(3,this.ppid);
               StatsManager.getPlayer().startAnim(MCSActor.POSE5);
               this.closePanel();
               break;
            case "teachwater2":
               NetworkManager.instance.playerTeach(4,this.ppid);
               StatsManager.getPlayer().startAnim(MCSActor.POSE5);
               this.closePanel();
               break;
            case "teachwind1":
               NetworkManager.instance.playerTeach(5,this.ppid);
               StatsManager.getPlayer().startAnim(MCSActor.POSE8);
               this.closePanel();
               break;
            case "teachwind2":
               NetworkManager.instance.playerTeach(6,this.ppid);
               StatsManager.getPlayer().startAnim(MCSActor.POSE8);
               this.closePanel();
               break;
            case "teachearth1":
               NetworkManager.instance.playerTeach(7,this.ppid);
               StatsManager.getPlayer().startAnim(MCSActor.POSE2);
               this.closePanel();
               break;
            case "teachearth2":
               NetworkManager.instance.playerTeach(8,this.ppid);
               StatsManager.getPlayer().startAnim(MCSActor.POSE2);
               this.closePanel();
         }
      }
      
      public function doChallenge() : *
      {
         visible = false;
         DuelModeUI.instance.showButDontRefresh();
         DuelModeUI.instance.startDuel(this.ppcharname,this.pplevel,this.ppequipment);
         Tracker.instance.trackDuelUIChallenge();
      }
      
      public function refresh() : *
      {
         this.show(this.ppcharname,this.pplevel,this.ppequipment,this.ppid,this.ppside);
      }
      
      public function show(charname:String, level:int, equipment:String, id:String, side:int) : *
      {
         this.facetoface = true;
         this.friendItem = null;
         this.init(charname,level,equipment,id,side);
      }
      
      public function updateDT() : *
      {
         this.tokenText.text = StatsManager.getStat(StatsManager.STAT_DUELTOKENS).toString();
      }
      
      public function showFriend(friendItem:FriendItem) : *
      {
         this.facetoface = false;
         this.friendItem = friendItem;
         this.init(friendItem.charname,int(friendItem.level),friendItem.equipment,friendItem.id,friendItem.side);
      }
      
      internal function showGive() : *
      {
         this.button1.setText(LangManager.getString(234));
         this.button1.setInteractIcon(NodeUI.ACTION_BUY);
         this.button2.setText(LangManager.getString(235));
         this.button2.setInteractIcon(NodeUI.ACTION_ITEM);
         this.button3.setText(LangManager.getString(232));
         this.button3.setInteractIcon(NodeUI.ACTION_BACK);
         this.button1.visible = true;
         this.button2.visible = true;
         this.button3.visible = true;
         this.button4.visible = false;
         this.button5.visible = false;
         this.menuState = 2;
      }
      
      public function closePanel() : *
      {
         if(!visible)
         {
            return;
         }
         this.removeEventListeners();
         this.visible = false;
         StatsManager.getPlayer().stopMoving();
         OverworldHUD.instance.showInfoBustButtons(true);
         NodeUI.instance.visible = true;
         Overworld.setMapEnabled(true);
         if(!GameEngine.isOverworld())
         {
            InputManager.setAdventureMode();
            OverworldHUD.instance.initForAdventureMode();
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
         this.getDTButton.addEventListener(MouseEvent.CLICK,this.showGetDT);
      }
      
      public function removeEventListeners() : *
      {
         this.button1.removeEventListener(MouseEvent.CLICK,this.button1Click);
         this.button2.removeEventListener(MouseEvent.CLICK,this.button2Click);
         this.button3.removeEventListener(MouseEvent.CLICK,this.button3Click);
         this.button4.removeEventListener(MouseEvent.CLICK,this.button4Click);
         this.button5.removeEventListener(MouseEvent.CLICK,this.button5Click);
         this.button6.removeEventListener(MouseEvent.CLICK,this.button6Click);
         this.getDTButton.removeEventListener(MouseEvent.CLICK,this.showGetDT);
      }
      
      public function showPlayerData(charname:String, level:int, equipment:String, dan:int, side:int) : *
      {
         var dantext:String = null;
         this.playerName.text = charname;
         switch(dan)
         {
            case 0:
               dantext = "";
               break;
            case 1:
               dantext = "(nidan)";
               break;
            case 2:
               dantext = "(sandan)";
               break;
            case 3:
               dantext = "(yondan) " + LangManager.getString(465);
               break;
            case 4:
               dantext = "(godan) " + LangManager.getString(465);
               break;
            case 5:
               dantext = "(rokudan) " + LangManager.getString(465);
               break;
            case 6:
               dantext = "(nanadan) " + LangManager.getString(466);
               break;
            case 7:
               dantext = "(hachidan) " + LangManager.getString(466);
               break;
            case 8:
               dantext = "(kyudan) " + LangManager.getString(467);
               break;
            case 9:
               dantext = "(judan) " + LangManager.getString(467);
               break;
            default:
               dantext = "(judan) " + LangManager.getString(467);
         }
         this.playerBust.initMCSFromEqString(equipment);
         this.playerBust.faceLeft();
         this.ppcharname = charname;
         this.pplevel = level;
         this.ppdan = dan;
         this.ppequipment = equipment;
         this.playerText.text = LangManager.getString(155) + ": " + String(level) + " " + dantext;
         switch(side)
         {
            case 0:
               break;
            case 1:
               this.playerText.appendText("\n" + LangManager.getString(245) + ": " + LangManager.getString(275));
               break;
            case 2:
               this.playerText.appendText("\n" + LangManager.getString(245) + ": " + LangManager.getString(276));
               break;
            case 3:
               this.playerText.appendText("\n" + LangManager.getString(245) + ": " + LangManager.getString(277));
               break;
            case 4:
               this.playerText.appendText("\n" + LangManager.getString(245) + ": " + LangManager.getString(278));
               break;
            default:
               if(StatsManager.isCustomClan(side))
               {
                  if(QueryManagerPIO.instance.hasCustomClanData(side))
                  {
                     this.playerText.appendText("\n" + LangManager.getString(245) + ": " + LangManager.getString(563) + " " + QueryManagerPIO.instance.getCustomClanData(side).clanname);
                  }
                  else
                  {
                     QueryManagerPIO.instance.loadCustomClanData(side,function():*
                     {
                        refresh();
                     });
                  }
               }
         }
         if(this.friendItem != null)
         {
            if(this.friendItem.bounty > 0)
            {
               this.playerText.appendText("\n" + LangManager.getString(246) + ": " + this.friendItem.bounty);
            }
            this.playerText.appendText("\n" + LangManager.getString(241) + ": " + this.friendItem.wins);
         }
      }
      
      internal function canDuelAnyone() : Boolean
      {
         var roomtype:int = StageManager.getRoomPrivate();
         return roomtype >= 2 && roomtype <= 7;
      }
      
      internal function button1Click(mouseEvent:MouseEvent) : *
      {
         this.buttonClick(0);
      }
      
      internal function button2Click(mouseEvent:MouseEvent) : *
      {
         this.buttonClick(1);
      }
      
      internal function button3Click(mouseEvent:MouseEvent) : *
      {
         this.buttonClick(2);
      }
      
      internal function button4Click(mouseEvent:MouseEvent) : *
      {
         this.buttonClick(3);
      }
      
      internal function button5Click(mouseEvent:MouseEvent) : *
      {
         this.buttonClick(4);
      }
      
      internal function button6Click(mouseEvent:MouseEvent) : *
      {
         this.buttonClick(5);
      }
      
      internal function getFriendData() : *
      {
         if(this.friendItem != null && this.friendItem.isLoaded())
         {
            trace("already have data");
            if(this.friendItem.equipment == null)
            {
               this.friendItem.equipment = XMLNpc.DEFAULT_EQSTRING;
            }
            this.showPlayerData(this.friendItem.charname,this.friendItem.level,this.friendItem.equipment,this.friendItem.dan,this.friendItem.side);
            return;
         }
         if(StatsManager.usePlayerIO)
         {
            QueryManagerPIO.instance.client.bigDB.load("PlayerData",this.ppid,this.getFriendDataCompletePIO);
            return;
         }
         var request:URLRequest = new URLRequest(QueryManager.instance.server + "getfrienddata.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.id = this.ppid;
         variables.magicnum = QueryManager.instance.magicnum;
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.getFriendDataComplete);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.getFriendDataIOError);
         loader.load(request);
      }
      
      internal function getFriendDataComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(QueryManager.instance.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               if(vars.charname == this.ppcharname)
               {
                  if(this.friendItem == null)
                  {
                     this.friendItem = new FriendItem(vars.id);
                  }
                  this.friendItem.initData(vars);
                  this.showPlayerData(vars.charname,vars.lvl,vars.eq,vars.dan,vars.side);
                  if(vars.lastping < 300)
                  {
                     this.playerText.appendText("\n\n" + LangManager.getString(202));
                  }
               }
               break;
            case "1":
               trace("not logged in");
               break;
            case "2":
               trace("incorrect magic number");
         }
      }
      
      internal function getFriendDataCompletePIO(o:DatabaseObject) : *
      {
         if(o == null)
         {
            return;
         }
         if(o.key == this.ppcharname)
         {
            if(this.friendItem == null)
            {
               this.friendItem = new FriendItem(o.key);
            }
            if(o.equipment == null)
            {
               o.equipment = XMLNpc.DEFAULT_EQSTRING;
            }
            this.friendItem.initDataPIO(o);
            this.showPlayerData(o.key,o.playerlevel,o.equipment,o.playerdan,o.side);
            if(o.lastping < 300)
            {
               this.playerText.appendText("\n\n" + LangManager.getString(202));
            }
         }
      }
      
      internal function getFriendDataIOError(event:IOErrorEvent) : void
      {
         trace("getFriendData IO error");
      }
      
      public function showGetDT(mouseEvent:MouseEvent) : *
      {
         this.closePanel();
         OverworldHUD.instance.interactUI.show(InteractUI.UIMODE_GETAP);
      }
   }
}

