package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol647")]
   public class WarUI extends MovieClip
   {
      
      public var warHexUI:WarHexUI;
      
      public var helpbutton:RedButtonSmall;
      
      public var readytomovelabel:TextField;
      
      public var warSelectUI:WarSelectUI;
      
      public var titletext:TextField;
      
      public var warrules:WarRules;
      
      public var loading:MovieClip;
      
      public var closewindowbutton:SimpleButton;
      
      public var warChooseUI:WarChooseUI;
      
      public var movesleftlabel:TextField;
      
      internal var worldStateCache:String = "";
      
      internal var activeBattlesCache:String = "";
      
      internal var nextUpdate:int;
      
      public function WarUI()
      {
         super();
         LangManager.initTextField(this.titletext,true);
         var str:String = LangManager.getString(305);
         var outputstr:String = "";
         for(var i:* = 0; i < str.length; i++)
         {
            outputstr += str.charAt(i) + "\n";
         }
         this.titletext.text = outputstr;
         LangManager.initTextField(this.movesleftlabel,true);
         LangManager.initTextField(this.loading.prompt);
         LangManager.initTextField(this.readytomovelabel,true);
         this.helpbutton.setText(LangManager.getString(368));
      }
      
      public function addEventListeners() : void
      {
         this.closewindowbutton.addEventListener(MouseEvent.CLICK,this.onLeave);
         this.warHexUI.backbutton.addEventListener(MouseEvent.CLICK,this.showSelectUI);
         this.warHexUI.backbutton.addEventListeners();
         this.helpbutton.addEventListeners();
         this.helpbutton.addEventListener(MouseEvent.CLICK,this.helpClick);
      }
      
      public function removeEventListeners() : void
      {
         this.closewindowbutton.removeEventListener(MouseEvent.CLICK,this.onLeave);
         this.warHexUI.backbutton.removeEventListener(MouseEvent.CLICK,this.showSelectUI);
         this.warHexUI.backbutton.removeEventListeners();
         this.helpbutton.removeEventListeners();
         this.helpbutton.removeEventListener(MouseEvent.CLICK,this.helpClick);
      }
      
      public function forceClose() : *
      {
         if(this.warHexUI.visible || this.warrules.visible)
         {
            this.onLeave(null);
         }
         this.onLeave(null);
      }
      
      public function onLeave(mouseEvent:MouseEvent) : void
      {
         if(this.warHexUI.visible)
         {
            if(!this.warHexUI.canClose)
            {
               return;
            }
            this.warSelectUI.show();
            this.warHexUI.hide();
            return;
         }
         if(this.warrules.visible)
         {
            this.warrules.closeClick(null);
            return;
         }
         this.removeEventListeners();
         if(GameEngine.isOverworld())
         {
            Overworld.showOverworldMap(true);
         }
         else
         {
            InputManager.setAdventureMode();
            OverworldHUD.instance.initForAdventureMode();
            NetworkManager.instance.playerUpdateBusy(false);
         }
         this.visible = false;
         OverworldHUD.instance.unHideAll();
         this.warSelectUI.resetZoom();
         this.warSelectUI.hide();
         this.warHexUI.hide();
         OverworldHUD.instance.lootDialog.notifyDontRefreshAfter();
         OverworldHUD.instance.lootDialog.show();
         StatsManager.parseGiftNotificationsString();
      }
      
      public function onShow() : *
      {
         this.addEventListeners();
         this.visible = true;
         Tracker.instance.trackShowWarUI();
         if(GameEngine.isAdventureMode())
         {
            NetworkManager.instance.playerUpdateBusy(true);
         }
         LangManager.initTextField(this.loading.prompt,true);
         this.loading.prompt.text = LangManager.getString(25);
         this.warHexUI.visible = false;
         this.warSelectUI.visible = false;
         this.warChooseUI.visible = false;
         this.warrules.visible = false;
         this.loading.visible = false;
         this.readytomovelabel.text = " ";
         if(StatsManager.getSide() == 0)
         {
            this.showChooseSide();
            return;
         }
         if(!StatsManager.offlineModeOnly)
         {
            this.loading.visible = true;
            this.movesleftlabel.visible = false;
            this.readytomovelabel.visible = false;
            QueryManager.instance.getWarMaps(StatsManager.getSide(),this.worldStateCache == "");
         }
      }
      
      internal function showChooseSide() : *
      {
         this.warChooseUI.show();
         this.movesleftlabel.visible = false;
         this.readytomovelabel.visible = false;
      }
      
      public function initWarMarkers(str:String, sentry:String, activebattles:String, nextupdate:String, maintenance:Boolean) : *
      {
         var strArray:Array = null;
         if(maintenance && !StatsManager.consoleEnabled)
         {
            this.onLeave(null);
            OverworldHUD.instance.showDialog(LangManager.getString(730),LangManager.getString(5));
            return;
         }
         if(str == "")
         {
            str = this.worldStateCache;
         }
         else
         {
            this.worldStateCache = str;
         }
         if(activebattles == "")
         {
            activebattles = this.activeBattlesCache;
         }
         else
         {
            this.activeBattlesCache = activebattles;
         }
         if(nextupdate != "")
         {
            this.warHexUI.setNextUpdate(nextupdate);
         }
         this.loading.visible = false;
         this.movesleftlabel.visible = true;
         this.readytomovelabel.visible = true;
         if(sentry != "")
         {
            strArray = sentry.split(",");
            this.initSelfSentry(strArray[0],strArray[1],strArray[2]);
         }
         else
         {
            this.initSelfSentry(-1,-1,-1);
         }
         this.warSelectUI.initWarMarkers(str,activebattles);
         this.warSelectUI.show();
      }
      
      public function initSelfSentry(mapid:int, xpos:int, ypos:int) : *
      {
         this.warSelectUI.initSelfSentry(mapid,xpos,ypos);
         this.warHexUI.initSelfSentry(mapid,xpos,ypos);
      }
      
      internal function showHex(mapid:int, owner:int, activeState:WarActiveBattle) : *
      {
         var customClanKeys:Array;
         this.loading.visible = true;
         this.movesleftlabel.visible = false;
         this.readytomovelabel.visible = false;
         this.warSelectUI.hide();
         this.warHexUI.mapid = mapid;
         this.warHexUI.territoryOwner = owner;
         this.warHexUI.activeState = activeState;
         this.movesleftlabel.text = StatsManager.getStat(StatsManager.STAT_WARMOVES) + LangManager.getString(308);
         customClanKeys = null;
         if(activeState != null)
         {
            customClanKeys = activeState.getCustomClansInvolved();
         }
         else if(StatsManager.isCustomClan(owner))
         {
            customClanKeys = [owner];
         }
         QueryManagerPIO.instance.loadCustomClanDataRange(customClanKeys,function():*
         {
            QueryManager.instance.getWarHexMap(mapid,StatsManager.getSide());
         });
      }
      
      internal function useWarMove(val:int) : *
      {
         var armorid:int = 0;
         var lvl:int = 0;
         var eqlvl:int = 0;
         var item:Item = null;
         OverworldHUD.instance.lootDialog.addLootCoins(5);
         var oldrank:int = StatsManager.getWarRank();
         StatsManager.changeStat(StatsManager.STAT_WARMOVESMADE,val);
         var newrank:int = StatsManager.getWarRank();
         if(newrank > oldrank)
         {
            if(StatsManager.isCustomClan(StatsManager.getSide()) && StatsManager.getCustomClanOwned() < StatsManager.MAJORCUSTOMCLANTHRESHHOLD)
            {
               OverworldHUD.instance.showDialogBig(LangManager.getString(402) + " " + StatsManager.getWarRankName() + "!",LangManager.getString(5));
            }
            else
            {
               OverworldHUD.instance.showDialogBig(LangManager.getString(402) + " " + StatsManager.getWarRankName() + "!\n\n" + LangManager.getString(404),LangManager.getString(5));
            }
            armorid = 0;
            lvl = StatsManager.getLevel();
            eqlvl = newrank * 5 + 10;
            if(lvl < eqlvl)
            {
               eqlvl = lvl;
            }
            if(StatsManager.getSide() == 1)
            {
               if(newrank == 1)
               {
                  armorid = 4038;
               }
               else if(newrank == 2)
               {
                  armorid = 4039;
               }
               else if(newrank == 3)
               {
                  armorid = 4040;
               }
               else if(newrank == 4)
               {
                  armorid = 7024;
               }
               else if(newrank == 5)
               {
                  armorid = 5002;
               }
               else if(newrank == 6)
               {
                  armorid = 4055;
               }
               else if(newrank == 7)
               {
                  armorid = 11005;
               }
               else if(newrank == 8)
               {
                  armorid = 7030;
               }
               else if(newrank == 9)
               {
                  armorid = 9008;
               }
               else if(newrank == 10)
               {
                  armorid = 3003;
               }
            }
            else if(StatsManager.getSide() == 3)
            {
               if(newrank == 1)
               {
                  armorid = 4041;
               }
               else if(newrank == 2)
               {
                  armorid = 4042;
               }
               else if(newrank == 3)
               {
                  armorid = 4043;
               }
               else if(newrank == 4)
               {
                  armorid = 7025;
               }
               else if(newrank == 5)
               {
                  armorid = 5002;
               }
               else if(newrank == 6)
               {
                  armorid = 4056;
               }
               else if(newrank == 7)
               {
                  armorid = 11005;
               }
               else if(newrank == 8)
               {
                  armorid = 7031;
               }
               else if(newrank == 9)
               {
                  armorid = 9007;
               }
               else if(newrank == 10)
               {
                  armorid = 3005;
               }
            }
            else if(StatsManager.getSide() == 2)
            {
               if(newrank == 1)
               {
                  armorid = 4044;
               }
               else if(newrank == 2)
               {
                  armorid = 4045;
               }
               else if(newrank == 3)
               {
                  armorid = 4046;
               }
               else if(newrank == 4)
               {
                  armorid = 7026;
               }
               else if(newrank == 5)
               {
                  armorid = 5002;
               }
               else if(newrank == 6)
               {
                  armorid = 4057;
               }
               else if(newrank == 7)
               {
                  armorid = 11005;
               }
               else if(newrank == 8)
               {
                  armorid = 7032;
               }
               else if(newrank == 9)
               {
                  armorid = 9027;
               }
               else if(newrank == 10)
               {
                  armorid = 3004;
               }
            }
            else if(StatsManager.getSide() == 4)
            {
               if(newrank == 1)
               {
                  armorid = 4047;
               }
               else if(newrank == 2)
               {
                  armorid = 4048;
               }
               else if(newrank == 3)
               {
                  armorid = 4049;
               }
               else if(newrank == 4)
               {
                  armorid = 7027;
               }
               else if(newrank == 5)
               {
                  armorid = 5002;
               }
               else if(newrank == 6)
               {
                  armorid = 4058;
               }
               else if(newrank == 7)
               {
                  armorid = 11005;
               }
               else if(newrank == 8)
               {
                  armorid = 7033;
               }
               else if(newrank == 9)
               {
                  armorid = 9028;
               }
               else if(newrank == 10)
               {
                  armorid = 3006;
               }
            }
            else if(StatsManager.isCustomClan(StatsManager.getSide()) && StatsManager.getCustomClanOwned() >= StatsManager.MAJORCUSTOMCLANTHRESHHOLD)
            {
               if(newrank == 1)
               {
                  armorid = 4145;
               }
               else if(newrank == 2)
               {
                  armorid = 4146;
               }
               else if(newrank == 3)
               {
                  armorid = 4147;
               }
               else if(newrank == 4)
               {
                  armorid = 7090;
               }
               else if(newrank == 5)
               {
                  armorid = 5002;
               }
               else if(newrank == 6)
               {
                  armorid = 4148;
               }
               else if(newrank == 7)
               {
                  armorid = 11005;
               }
               else if(newrank == 8)
               {
                  armorid = 7091;
               }
               else if(newrank == 9)
               {
                  armorid = 9058;
               }
               else if(newrank == 10)
               {
                  armorid = 3008;
               }
            }
            if(armorid != 0)
            {
               if(newrank == 10)
               {
                  item = OverworldHUD.instance.lootDialog.addRareLootItem(armorid,eqlvl,1,true);
               }
               else
               {
                  item = OverworldHUD.instance.lootDialog.addRareLootItem(armorid,eqlvl,1);
               }
               if(StatsManager.isCustomClan(StatsManager.getSide()))
               {
                  item.setPrimaryColor(StatsManager.getCustomClanColor());
               }
               OverworldHUD.instance.lootDialog.addLootCoins(newrank * 100);
               if(newrank <= 3)
               {
                  OverworldHUD.instance.lootDialog.addRareLootItem(11006,eqlvl,1);
                  OverworldHUD.instance.lootDialog.addRareLootItem(12002,eqlvl,1);
               }
            }
         }
         if(StatsManager.unlimitedAP)
         {
            return;
         }
         var num:int = StatsManager.changeStat(StatsManager.STAT_WARMOVES,-val);
         this.movesleftlabel.text = num.toString() + LangManager.getString(308);
         StatsManager.setNextWarTurn();
         QueryManager.instance.saveModifiedCharData();
      }
      
      internal function showSelectUI(event:MouseEvent) : *
      {
         this.warSelectUI.show();
         this.warHexUI.hide();
      }
      
      public function initWarHexMap(str:String, territoryData:String, troops:Array = null, castleGateTime:int = 0) : *
      {
         NodeGenerator.instance.gotTerritoryData(this.warHexUI.mapid >> 12 & 0x0FFF,this.warHexUI.mapid & 0x0FFF,territoryData);
         this.loading.visible = false;
         this.movesleftlabel.visible = true;
         this.readytomovelabel.visible = true;
         this.warHexUI.show();
         this.warHexUI.initHex(str,troops,castleGateTime);
      }
      
      public function updateWarMoveCounter(timediff:int, servertime:int) : *
      {
         var maxmoves:int = 0;
         var warmoves:int = 0;
         if(timediff >= 0)
         {
            if(this.readytomovelabel.text != "")
            {
               maxmoves = StatsManager.getMaxWarMoves();
               warmoves = StatsManager.getPlayerStats(StatsManager.STAT_WARMOVES);
               if(warmoves != maxmoves)
               {
                  StatsManager.setStat(StatsManager.STAT_WARMOVES,maxmoves);
               }
               this.movesleftlabel.text = warmoves + LangManager.getString(308);
               this.readytomovelabel.text = "";
               OverworldHUD.instance.updateHUD();
            }
         }
         else
         {
            this.readytomovelabel.text = LangManager.getString(309) + this.getTimeString(-timediff);
         }
         if(this.warHexUI.visible)
         {
            this.warHexUI.updateTime(servertime);
         }
      }
      
      public function clearCache() : *
      {
         this.worldStateCache = "";
         this.activeBattlesCache = "";
      }
      
      public function updateActiveBattleCache() : *
      {
         var str:String = "";
         for(var i:int = 0; i < this.warSelectUI.activeBattleList.length; i++)
         {
            str += this.warSelectUI.activeBattleList[i].toString();
         }
         this.activeBattlesCache = str;
         this.warSelectUI.initWarMarkers(this.worldStateCache,this.activeBattlesCache);
      }
      
      public function updateSpawnPoints(str:String) : *
      {
         this.activeBattlesCache = str;
         this.warSelectUI.initWarMarkers(this.worldStateCache,this.activeBattlesCache);
      }
      
      public function update(serverTimeVariable:int) : *
      {
         if(!visible)
         {
            return;
         }
         if(this.warSelectUI.visible)
         {
            this.warSelectUI.update();
         }
         if(this.warHexUI.visible)
         {
            this.warHexUI.updateAnimation(serverTimeVariable);
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
      
      public function returnFromBattle(kills:int) : *
      {
         visible = true;
         this.warHexUI.showWarRoomKills(kills);
         this.readytomovelabel.text = " ";
         InputManager.disableInput();
      }
      
      internal function helpClick(event:MouseEvent) : *
      {
         this.warrules.show();
      }
      
      public function getOwner(territoryx:int, territoryy:int) : int
      {
         return this.warSelectUI.getHexOwner(territoryx,territoryy);
      }
      
      public function updateHexOwner(territoryid:int, side:int) : *
      {
         if(this.worldStateCache == "")
         {
            return;
         }
         this.warSelectUI.updateHexOwner(territoryid,side);
      }
   }
}

