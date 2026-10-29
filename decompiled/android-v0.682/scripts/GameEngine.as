package
{
   import com.flappsh.WhipFlash;
   import flash.display.DisplayObject;
   import flash.display.LoaderInfo;
   import flash.display.MovieClip;
   import flash.display.Stage;
   import flash.display.StageAlign;
   import flash.display.StageDisplayState;
   import flash.display.StageScaleMode;
   import flash.events.Event;
   import flash.events.FullScreenEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class GameEngine
   {
      
      internal static var stageMC:Stage;
      
      internal static var titleScreenBG:GameStage;
      
      internal static var titleScreenUI:TitleUI;
      
      internal static var titleMCS:MCSCharacter;
      
      internal static var overworld:Overworld;
      
      internal static var questID:int;
      
      internal static var action:int;
      
      internal static var u_blocker:Blocker;
      
      internal static var d_blocker:Blocker;
      
      internal static var l_blocker:Blocker;
      
      internal static var r_blocker:Blocker;
      
      internal static var topParent:DisplayObject;
      
      internal static var loadingScreen:LoadingScreen = new LoadingScreen();
      
      internal static var returnToAdventureMode:Boolean = false;
      
      internal static var isPaused:Boolean = false;
      
      internal static var playbackClient:Boolean = false;
      
      internal static var playbackClientShowSlash:Boolean = false;
      
      internal static var whipFlashInitialized:* = false;
      
      internal static var gameMode:int = MODE_TITLE;
      
      internal static var MODE_INIT:int = 0;
      
      internal static var MODE_TITLE:int = 1;
      
      internal static var MODE_OVERWORLDLOADING:int = 2;
      
      internal static var MODE_OVERWORLD:int = 3;
      
      internal static var MODE_BATTLELOADING:int = 4;
      
      internal static var MODE_BATTLELOADINGDONE_WAITINGFORCLICK:int = 5;
      
      internal static var MODE_TITLESTOP:int = 6;
      
      internal static var MODE_BATTLE:int = 7;
      
      internal static var MODE_BATTLEENDWIN:int = 8;
      
      internal static var MODE_BATTLEENDLOSE:int = 9;
      
      internal static var MODE_BATTLEENDWINDUEL:int = 10;
      
      internal static var MODE_BATTLEENDLOSEDUEL:int = 11;
      
      internal static var ACTION_NOTHING:int = 0;
      
      internal static var ACTION_FIGHT:int = 1;
      
      internal static var ACTION_ASSASSINATE:int = 2;
      
      internal static var ACTION_ESCORT:int = 3;
      
      internal static var ACTION_SURVIVE:int = 4;
      
      internal static var ACTION_REACHMARKER:int = 5;
      
      internal static var ACTION_DUEL:int = 6;
      
      internal static var ACTION_ADVENTURE:int = 7;
      
      internal static var ACTION_HARVEST:int = 8;
      
      internal static var ACTION_SURVIVALMODE:int = 9;
      
      internal static var ACTION_WARROOMBATTLE:int = 10;
      
      internal static var ACTION_PLAYBACK:int = 11;
      
      internal static var ACTION_PVPROOM:int = 12;
      
      internal static var ACTION_CUTSCENE:int = 13;
      
      internal static var ACTION_SURVIVECLEANUP:int = 14;
      
      internal static var counter:int = 0;
      
      public function GameEngine()
      {
         super();
      }
      
      public static function getGameMode() : int
      {
         return gameMode;
      }
      
      public static function setGameMode(num:int) : *
      {
         gameMode = num;
      }
      
      public static function isTitle() : Boolean
      {
         return gameMode == MODE_TITLE;
      }
      
      public static function isBattleMode() : Boolean
      {
         return gameMode == MODE_BATTLE;
      }
      
      public static function isOverworld() : Boolean
      {
         return gameMode == MODE_OVERWORLD;
      }
      
      public static function isPlayback() : Boolean
      {
         return action == ACTION_PLAYBACK || action == ACTION_CUTSCENE;
      }
      
      public static function setStageMC(stage:Stage) : *
      {
         stageMC = stage;
         stageMC.scaleMode = StageScaleMode.NO_SCALE;
         stageMC.align = StageAlign.TOP_LEFT;
         stageMC.addEventListener(Event.RESIZE,resizeHandler);
         stageMC.addEventListener(FullScreenEvent.FULL_SCREEN,fullScreenHandler);
         stageMC.showDefaultContextMenu = false;
         resizeHandler(null);
         loadingScreen.visible = false;
      }
      
      public static function setFullScreen() : *
      {
         var gameStage:GameStage;
         var newScale:Number = stageMC.fullScreenHeight / 800;
         if(titleScreenUI != null)
         {
            titleScreenUI.scaleX = newScale;
            titleScreenUI.scaleY = newScale;
         }
         if(titleScreenBG != null)
         {
            titleScreenBG.scaleX = newScale;
            titleScreenBG.scaleY = newScale;
         }
         if(OverworldHUD.instance != null)
         {
            OverworldHUD.instance.scaleX = newScale;
            OverworldHUD.instance.scaleY = newScale;
         }
         if(BattleUI.instance != null)
         {
            BattleUI.instance.scaleX = newScale;
            BattleUI.instance.scaleY = newScale;
         }
         gameStage = StageManager.getGameStage();
         if(gameStage != null)
         {
            gameStage.scaleX = newScale;
            gameStage.scaleY = newScale;
         }
         stageMC.fullScreenSourceRect = new Rectangle(0,0,800 * newScale,480 * newScale);
         StatsManager.stageScale = newScale;
         StatsManager.stageOffsetX = 0;
         StatsManager.stageOffsetY = 0;
         StatsManager.stageShowingFriendBar = false;
         try
         {
            stageMC.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
         }
         catch(error:Error)
         {
            trace("cannot fullscreen");
            unFullScreen();
         }
      }
      
      public static function leaveFullScreen() : *
      {
         if(StatsManager.isFullScreen && !StatsManager.isMobile)
         {
            stageMC.displayState = StageDisplayState.NORMAL;
         }
      }
      
      internal static function fullScreenHandler(event:FullScreenEvent) : *
      {
         if(event.fullScreen)
         {
            StatsManager.isFullScreen = true;
         }
         else
         {
            unFullScreen();
         }
      }
      
      internal static function unFullScreen() : *
      {
         StatsManager.isFullScreen = false;
         if(gameMode != MODE_TITLE)
         {
            StatsManager.doFullScreen = false;
            if(OverworldHUD.instance.optionsUI != null)
            {
               OverworldHUD.instance.optionsUI.fullscreencheck.setCheck(false);
            }
         }
         if(titleScreenUI != null)
         {
            titleScreenUI.scaleX = 1;
            titleScreenUI.scaleY = 1;
         }
         if(titleScreenBG != null)
         {
            titleScreenBG.scaleX = 1;
            titleScreenBG.scaleY = 1;
         }
         if(OverworldHUD.instance != null)
         {
            OverworldHUD.instance.scaleX = 1;
            OverworldHUD.instance.scaleY = 1;
         }
         if(BattleUI.instance != null)
         {
            BattleUI.instance.scaleX = 1;
            BattleUI.instance.scaleY = 1;
         }
         var gameStage:GameStage = StageManager.getGameStage();
         if(gameStage != null)
         {
            gameStage.scaleX = 1;
            gameStage.scaleY = 1;
         }
         StatsManager.stageScale = 1;
         resizeHandler(null);
      }
      
      internal static function resizeHandler(event:Event) : void
      {
         var originalWidth:int = 800;
         var originalHeight:int = 480;
         var originalHeightWithBar:int = 690;
         var originalAspectRatio:Number = originalWidth / originalHeight;
         var originalWithBarAspectRatio:Number = originalWidth / originalHeightWithBar;
         var newAspectRatio:Number = stageMC.stageWidth / stageMC.stageHeight;
         if(newAspectRatio <= originalWithBarAspectRatio)
         {
            originalAspectRatio = originalWithBarAspectRatio;
            originalHeight = originalHeightWithBar;
            StatsManager.stageShowingFriendBar = true;
            if(OverworldHUD.instance != null)
            {
               OverworldHUD.instance.friendpanel.init();
            }
         }
         else
         {
            StatsManager.stageShowingFriendBar = false;
         }
         var newScale:Number = 1;
         var offsetX:Number = 0;
         var offsetY:Number = 0;
         var fitWidth:Boolean = false;
         if(originalAspectRatio >= newAspectRatio)
         {
            newScale = stageMC.stageWidth / originalWidth;
            offsetX = 0;
            offsetY = (stageMC.stageHeight - originalHeight * newScale) / 2;
            fitWidth = true;
         }
         else
         {
            newScale = stageMC.stageHeight / originalHeight;
            offsetX = (stageMC.stageWidth - originalWidth * newScale) / 2;
            offsetY = 0;
            fitWidth = false;
         }
         StatsManager.stageScale = newScale;
         StatsManager.stageOffsetX = offsetX;
         StatsManager.stageOffsetY = offsetY;
         StatsManager.stageFitWidth = fitWidth;
         StatsManager.stageBaseWidth = originalWidth;
         StatsManager.stageBaseHeight = originalHeight;
         if(StatsManager.mainTimeLine.currentScene.name == "loading")
         {
            StatsManager.mainTimeLine.videocover.scaleX = newScale;
            StatsManager.mainTimeLine.videocover.scaleY = newScale;
            StatsManager.mainTimeLine.videocover.x = offsetX;
            StatsManager.mainTimeLine.videocover.y = offsetY;
            StatsManager.mainTimeLine.loadingScreen.scaleX = newScale;
            StatsManager.mainTimeLine.loadingScreen.scaleY = newScale;
            StatsManager.mainTimeLine.loadingScreen.x = offsetX;
            StatsManager.mainTimeLine.loadingScreen.y = offsetY;
            StatsManager.mainTimeLine.messageDialog.scaleX = newScale;
            StatsManager.mainTimeLine.messageDialog.scaleY = newScale;
            StatsManager.mainTimeLine.messageDialog.x = offsetX;
            StatsManager.mainTimeLine.messageDialog.y = offsetY;
            StatsManager.mainTimeLine.adloadertext.scaleX = newScale;
            StatsManager.mainTimeLine.adloadertext.scaleY = newScale;
            StatsManager.mainTimeLine.adloadertext.x = offsetX + 274 * newScale;
            StatsManager.mainTimeLine.adloadertext.y = offsetY + 355 * newScale;
            StatsManager.mainTimeLine.epicAds.scaleX = newScale;
            StatsManager.mainTimeLine.epicAds.scaleY = newScale;
            StatsManager.mainTimeLine.epicAds.x = offsetX + 234 * newScale;
            StatsManager.mainTimeLine.epicAds.y = offsetY + 67 * newScale;
            u_blocker = StatsManager.mainTimeLine.u_blocker;
            d_blocker = StatsManager.mainTimeLine.d_blocker;
            l_blocker = StatsManager.mainTimeLine.l_blocker;
            r_blocker = StatsManager.mainTimeLine.r_blocker;
            placeBlockers();
            return;
         }
         var gameStage:GameStage = StageManager.getGameStage();
         if(gameStage != null)
         {
            gameStage.doResize();
         }
         if(titleScreenUI != null)
         {
            titleScreenUI.doResize();
         }
         if(titleScreenBG != null)
         {
            titleScreenBG.scaleX = newScale;
            titleScreenBG.scaleY = newScale;
            titleScreenBG.x = offsetX;
            titleScreenBG.y = offsetY;
         }
         if(OverworldHUD.instance != null)
         {
            OverworldHUD.instance.doResize();
         }
         if(BattleUI.instance != null)
         {
            BattleUI.instance.doResize();
         }
      }
      
      public static function placeBlockers() : *
      {
         if(u_blocker == null)
         {
            u_blocker = new Blocker();
         }
         if(d_blocker == null)
         {
            d_blocker = new Blocker();
         }
         if(l_blocker == null)
         {
            l_blocker = new Blocker();
         }
         if(r_blocker == null)
         {
            r_blocker = new Blocker();
         }
         stageMC.addChild(u_blocker);
         stageMC.addChild(d_blocker);
         stageMC.addChild(l_blocker);
         stageMC.addChild(r_blocker);
         if(StatsManager.stageOffsetX == 0 && StatsManager.stageOffsetY == 0)
         {
            u_blocker.visible = false;
            d_blocker.visible = false;
            l_blocker.visible = false;
            r_blocker.visible = false;
            return;
         }
         if(StatsManager.stageFitWidth)
         {
            u_blocker.visible = true;
            d_blocker.visible = true;
            l_blocker.visible = false;
            r_blocker.visible = false;
         }
         else
         {
            u_blocker.visible = false;
            d_blocker.visible = false;
            l_blocker.visible = true;
            r_blocker.visible = true;
         }
         u_blocker.x = 0;
         u_blocker.y = 0;
         u_blocker.width = stageMC.stageWidth;
         u_blocker.height = StatsManager.stageOffsetY;
         d_blocker.x = 0;
         d_blocker.y = StatsManager.stageOffsetY + StatsManager.stageBaseHeight * StatsManager.stageScale;
         d_blocker.width = stageMC.stageWidth;
         d_blocker.height = StatsManager.stageOffsetY;
         l_blocker.x = 0;
         l_blocker.y = 0;
         l_blocker.width = StatsManager.stageOffsetX;
         l_blocker.height = stageMC.stageHeight;
         r_blocker.x = StatsManager.stageOffsetX + StatsManager.stageBaseWidth * StatsManager.stageScale;
         r_blocker.y = 0;
         r_blocker.width = StatsManager.stageOffsetX;
         r_blocker.height = stageMC.stageHeight;
      }
      
      public static function getStageMC() : Stage
      {
         return stageMC;
      }
      
      public static function startEngine() : *
      {
         if(stageMC == null)
         {
            trace("GameEngine.stageMC not set");
            return;
         }
         stageMC.addEventListener(Event.ENTER_FRAME,gameloop);
         new Tracker(stageMC);
         checkPlayBackMode();
         if(StatsManager.useExternalLang && !StatsManager.consoleEnabled)
         {
            checkSiteLock();
         }
         if(StatsManager.usePlayerIO)
         {
            checkFacebookLogin();
         }
         if(!whipFlashInitialized && !StatsManager.isMobile)
         {
            WhipFlash.initialize(stageMC,"a4c17b979682cb306cec1f5f177c748f6490c481",StatsManager.consoleEnabled);
            whipFlashInitialized = true;
         }
      }
      
      public static function stopEngine() : *
      {
         stageMC.removeEventListener(Event.ENTER_FRAME,gameloop);
         InputManager.disableInput();
      }
      
      public static function initTitleScreen() : *
      {
         titleScreenBG = new BG_BambooForest();
         MovieClip(titleScreenBG).redBG.visible = false;
         stageMC.addChild(titleScreenBG);
         titleScreenUI = new TitleUI();
         stageMC.addChild(titleScreenUI);
         titleMCS = createTitleMCS();
         titleMCS.x = 150;
         titleMCS.y = 400;
         titleMCS.startAnim(MCSActor.WALK_SHEATHED);
         MovieClip(titleScreenBG).playercanvas.addChild(titleMCS);
         titleScreenBG.scaleX = StatsManager.stageScale;
         titleScreenBG.scaleY = StatsManager.stageScale;
         gameMode = MODE_TITLE;
         SoundManager.instance.playMusic(MusicManager.MUSIC_QUIET);
         GameEngine.startEngine();
         resizeHandler(null);
      }
      
      internal static function createTitleMCS() : MCSCharacter
      {
         var mcs:MCSCharacter = null;
         var eqStr:String = QueryManager.instance.getLastCharacterEquipmentString();
         if(eqStr == "")
         {
            mcs = new MCSCharacter();
            mcs.initMCS(new Item(4017),new Item(0),new Item(6019),new Item(0),new Item(0),new Item(0),new Item(0),new Item(11017),new Item(12017),new Item(13002));
         }
         else
         {
            mcs = new MCSCharacter();
            StatsManager.parseEquipmentString(eqStr);
            mcs.initMCS(StatsManager.equipment[StatsManager.EQ_ARMOR],StatsManager.equipment[StatsManager.EQ_GLOVES],StatsManager.equipment[StatsManager.EQ_HAIR],StatsManager.equipment[StatsManager.EQ_HAT],StatsManager.equipment[StatsManager.EQ_HEAD],StatsManager.equipment[StatsManager.EQ_MASK],StatsManager.equipment[StatsManager.EQ_NECK],StatsManager.equipment[StatsManager.EQ_PANTS],StatsManager.equipment[StatsManager.EQ_SHOES],StatsManager.equipment[StatsManager.EQ_WEAPON],StatsManager.equipment[StatsManager.EQ_SCABBARD].getItemID());
         }
         return mcs;
      }
      
      public static function resetTitleMCS() : *
      {
         titleMCS.initMCS(new Item(4017),new Item(0),new Item(6019),new Item(0),new Item(0),new Item(0),new Item(0),new Item(11017),new Item(12017),new Item(13002));
         StatsManager.getPlayerBust().initMCS(new Item(4017),new Item(6019),new Item(0),new Item(0),new Item(0),new Item(0));
      }
      
      public static function leaveTitleScreen() : *
      {
         gameMode = MODE_INIT;
         QueryManager.instance.saveCharName();
         MovieClip(titleScreenBG).playercanvas.removeChild(titleMCS);
         titleMCS = null;
         stageMC.removeChild(titleScreenBG);
         titleScreenBG = null;
         stageMC.removeChild(titleScreenUI);
         titleScreenUI = null;
         showLoadingScreen();
         loadingScreen.setGameLoading();
         QueryManager.instance.loadCharData(StatsManager.charname);
      }
      
      public static function isLoadingScreen() : Boolean
      {
         return loadingScreen.visible;
      }
      
      public static function getRandomTip() : String
      {
         var str:String = null;
         var dice:int = Math.random() * 39;
         if(dice == 0)
         {
            str = "Tip: Select \"record duels\" in the options menu to record and rewatch your duels on Duels TV.";
         }
         else if(dice == 1)
         {
            str = "Tip: When not in battle, try saying \"/sit\".";
         }
         else if(dice == 2)
         {
            str = "Tip: When not in battle, try saying \"/bow\".";
         }
         else if(dice == 3)
         {
            str = "Tip: When not in battle, try saying \"/kneel\".";
         }
         else if(dice == 4)
         {
            str = "Tip: When sitting, say \"/stand\" to get back up.";
         }
         else if(dice == 5)
         {
            str = "Tip: Try saying \"/fart\".";
         }
         else if(dice == 6)
         {
            str = "Tip: When not in battle, try saying \"/gangnamstyle\".";
         }
         else if(dice == 7)
         {
            str = "Tip: A green border indicates that an item is special.";
         }
         else if(dice == 8)
         {
            str = "Tip: A blue border indicates that an item is rare.";
         }
         else if(dice == 9)
         {
            str = "Tip: A purple border indicates that an item is unique.";
         }
         else if(dice == 10)
         {
            str = "Tip: You can change whether your chat is broadcast the room, to your clan or to everyone.";
         }
         else if(dice == 11)
         {
            str = "Tip: Stables can be used to quickly travel from town to town.";
         }
         else if(dice == 12)
         {
            str = "Tip: In battle, you can use spacebar to change stance.";
         }
         else if(dice == 13)
         {
            str = "Tip: In battle, you can use the number keys to activate your skills.";
         }
         else if(dice == 14)
         {
            str = "Tip: In battle, you can drag and drop your skills to activate them at specific directions.";
         }
         else if(dice == 15)
         {
            str = "Tip: Your location is only saved at special locations like towns and dungeons.";
         }
         else if(dice == 16)
         {
            str = "Tip: You can tell which stance your opponent is using by the way he stands and runs.";
         }
         else if(dice == 17)
         {
            str = "Tip: The quests, shops and items found in a town are related to the level of that town.";
         }
         else if(dice == 18)
         {
            str = "Tip: Only the challenger is able to record duels.";
         }
         else if(dice == 19)
         {
            str = "Tip: When fighting undead, target their heads.";
         }
         else if(dice == 20)
         {
            str = "Tip: Complete quests for a village to help upgrade it to a town.";
         }
         else if(dice == 21)
         {
            str = "Tip: Complete quests for a town to help upgrade it to a city.";
         }
         else if(dice == 22)
         {
            str = "Tip: Complete quests for a city to help upgrade it to a castle.";
         }
         else if(dice == 23)
         {
            str = "Tip: You should check out the Straw Hat Samurai comic.";
         }
         else if(dice == 24)
         {
            str = "Tip: Wins are added to the leaderboards only when you defeat a live player in a duel.";
         }
         else if(dice == 25)
         {
            str = "Tip: You can make money easily by buying goods from a market and selling in another town.";
         }
         else if(dice == 26)
         {
            str = "Tip: When not in battle, you can hold down the mouse button to keep running in that direction.";
         }
         else if(dice == 27)
         {
            str = "Tip: Crops grown from 12-hour seeds do not rot.";
         }
         else if(dice == 28)
         {
            str = "Tip: Approach wildlife from behind to catch them without chasing them off.";
         }
         else if(dice == 29)
         {
            str = "Tip: If you see a Red Oni, run! (Unless you think that you can beat him...)";
         }
         else if(dice == 30)
         {
            str = "Tip: You can sneak pass Red Oni when they are napping.";
         }
         else if(dice == 31)
         {
            str = "Tip: Sometimes if you are really quiet, you can hear what the fox says.";
         }
         else if(dice == 32)
         {
            str = "Tip: If you do not seem to be doing much damage to an enemy, try using Heavy Stance.";
         }
         else if(dice == 33)
         {
            if(StatsManager.showChikakoAsNinja())
            {
               str = LangManager.getString(723);
            }
            else
            {
               str = "Tip: Play the story to unlock Chikako for special Ninja Services bonuses.";
            }
         }
         else if(dice == 34)
         {
            str = "Tip: Scavenging Skill Level 5 lets you see hidden paths to secret areas.";
         }
         else if(dice == 35)
         {
            str = "Tip: A higher speed stat will reduce skill cooldown times and also give you a longer slash line.";
         }
         else if(dice == 36)
         {
            str = "Tip: Click on the minimap to see the entire world map.";
         }
         else if(dice == 37)
         {
            str = "Tip: Converting a town through influence requires a team effort. You can\'t to do it alone.";
         }
         else if(dice == 38)
         {
            str = "Tip: When you are out of AP, go duel or fight in the war room until it replenishes.";
         }
         return str;
      }
      
      public static function showLoadingScreen() : *
      {
         if(loadingScreen.visible)
         {
            return;
         }
         stageMC.addChild(loadingScreen);
         loadingScreen.scaleX = StatsManager.stageScale;
         loadingScreen.scaleY = StatsManager.stageScale;
         loadingScreen.x = StatsManager.stageOffsetX;
         loadingScreen.y = StatsManager.stageOffsetY;
         loadingScreen.setGameLoading();
         loadingScreen.visible = true;
         var dice:int = Math.random() * 28;
         var str:String = getRandomTip();
         loadingScreen.tipstext.text = str;
         placeBlockers();
      }
      
      public static function hideLoadingScreen() : *
      {
         loadingScreen.visible = false;
      }
      
      public static function initOverworld() : *
      {
         var terrlvl:int = 0;
         var newScale:Number = NaN;
         overworld = new Overworld(stageMC);
         hideLoadingScreen();
         gameMode = MODE_OVERWORLD;
         var nodeid:int = StatsManager.getLocation();
         var newbieState:Boolean = false;
         if(StatsManager.getPlayerStats(StatsManager.STAT_XP) == 0 && !StatsManager.checkActiveQuest("0"))
         {
            nodeid = 8382465;
            StatsManager.saveLocation(nodeid);
            newbieState = true;
            Overworld.currentNode = nodeid;
         }
         var territory:Point = NodeGenerator.instance.getTerritory(nodeid);
         if(nodeid != 666 && !QuestEngine.hasTerritory(territory.x,territory.y))
         {
            trace("in non-territory, moving player",territory);
            terrlvl = NodeGenerator.instance.getNodeLevel(nodeid);
            if(terrlvl < 10)
            {
               nodeid = 8382465;
            }
            else if(terrlvl < 20)
            {
               nodeid = 8570879;
            }
            else if(terrlvl < 30)
            {
               nodeid = 8800254;
            }
            else if(terrlvl < 40)
            {
               nodeid = 9013236;
            }
            else if(terrlvl < 50)
            {
               nodeid = 9037756;
            }
            else if(terrlvl < 60)
            {
               nodeid = 9181094;
            }
            else if(terrlvl < 70)
            {
               nodeid = 9168748;
            }
            else if(terrlvl < 80)
            {
               nodeid = 9144102;
            }
            else
            {
               nodeid = 9365282;
            }
         }
         StageManager.setCurrentNode(nodeid);
         QuestEngine.refreshNodeQuests(nodeid);
         StatsManager.getPlayer().setScale(1);
         QuestEngine.startAdventureMode(nodeid,newbieState);
         StatsManager.parseGiftNotificationsString();
         var showingGetDailyPrize:Boolean = false;
         if(QueryManager.instance.offlineMode)
         {
            if(!StatsManager.consoleEnabled)
            {
               OverworldHUD.instance.showDialog(LangManager.getString(295),LangManager.getString(5));
            }
         }
         else
         {
            if(StatsManager.usePlayerIO)
            {
               NetworkManager.instance.connectGlobalChat();
            }
            if(StatsManager.getLevel() >= 3 && StatsManager.getStat(30018) - QueryManager.instance.getServerTime() < 0)
            {
               OverworldHUD.instance.showGetDailyPrize();
               showingGetDailyPrize = true;
            }
         }
         var lvldiff:int = NodeGenerator.instance.getNodeLevel(nodeid) - StatsManager.getLevel();
         if(!showingGetDailyPrize)
         {
            if(lvldiff < -3)
            {
               OverworldHUD.instance.showDialogBig(LangManager.getString(702),LangManager.getString(5));
            }
            else if(lvldiff > 3 && nodeid != 666)
            {
               OverworldHUD.instance.showDialog(LangManager.getString(703),LangManager.getString(5));
            }
         }
         StatsManager.parseActiveQuestString();
         QuestEngine.refreshNodeQuests(nodeid);
         StageManager.refreshRoomQuestObjects();
         if(StatsManager.activeQuestList.length > 0)
         {
            StatsManager.setStat(StatsManager.STAT_MARKEDNODE,0);
         }
         OverworldHUD.instance.territorymap.refresh();
         if(StatsManager.doFullScreen)
         {
            newScale = stageMC.fullScreenHeight / 800;
            OverworldHUD.instance.scaleX = newScale;
            OverworldHUD.instance.scaleY = newScale;
         }
         placeBlockers();
      }
      
      public static function overworldToTitle() : *
      {
         gameMode = MODE_INIT;
         showLoadingScreen();
         stageMC.removeChild(overworld);
         overworld.destroy();
         overworld = null;
         stopEngine();
         initTitleScreen();
         TitleUI.instance.switchToReady();
      }
      
      public static function battleModeToTitle() : *
      {
         gameMode = MODE_INIT;
         showLoadingScreen();
         StageManager.disposeStage();
         stopEngine();
         initTitleScreen();
         leaveFullScreen();
         if(!QueryManager.instance.offlineMode)
         {
            QueryManager.instance.saveModifiedCharData();
            TitleUI.instance.switchToReady();
         }
         else
         {
            QueryManager.instance.logout();
            TitleUI.instance.switchToLogin();
         }
         StatsManager.reset();
         TitleUI.instance.doResize();
         if(titleScreenBG != null)
         {
            titleScreenBG.scaleX = StatsManager.stageScale;
            titleScreenBG.scaleY = StatsManager.stageScale;
            titleScreenBG.x = StatsManager.stageOffsetX;
            titleScreenBG.y = StatsManager.stageOffsetY;
         }
         placeBlockers();
      }
      
      public static function setCounter(num:int) : *
      {
         counter = num;
      }
      
      internal static function gameloop(event:Event) : void
      {
         if(gameMode == MODE_TITLE)
         {
            titleScreenBG.scrollStage(-4);
            titleMCS.updateAnimation();
         }
         else if(gameMode == MODE_TITLESTOP)
         {
            titleScreenBG.scrollStage(-4);
            titleMCS.updateAnimation();
            ++counter;
            if(counter == 1)
            {
               TitleUI.instance.screenTransition.startClose(ScreenTransition.ACTION_NOTHING);
            }
            else if(counter == 25)
            {
               leaveTitleScreen();
               Tracker.instance.trackGameStart();
            }
         }
         else if(gameMode == MODE_OVERWORLD)
         {
            Overworld.update();
            StatsManager.update();
         }
         else if(gameMode == MODE_BATTLE && !isPaused)
         {
            StageManager.update();
            OverworldHUD.instance.screenTransition.update();
            if(action == ACTION_ADVENTURE || action == ACTION_PVPROOM)
            {
               StatsManager.update();
            }
            else if(action == ACTION_DUEL || action == ACTION_PLAYBACK || action == ACTION_CUTSCENE)
            {
               NetworkManager.instance.update();
            }
         }
         MusicManager.instance.update();
      }
      
      public static function togglePaused() : *
      {
         isPaused = !isPaused;
      }
      
      public static function setPaused(flag:Boolean) : *
      {
         isPaused = flag;
      }
      
      public static function setPvPRoomMode() : *
      {
         action = ACTION_PVPROOM;
      }
      
      public static function setAdventureMode() : *
      {
         action = ACTION_ADVENTURE;
      }
      
      public static function isSurviveCleanUp() : Boolean
      {
         return action == ACTION_SURVIVECLEANUP;
      }
      
      public static function isDuelMode() : Boolean
      {
         return gameMode != MODE_OVERWORLD && (action == ACTION_DUEL || action == ACTION_PLAYBACK || action == ACTION_CUTSCENE);
      }
      
      public static function isPvPRoomMode() : Boolean
      {
         return gameMode != MODE_OVERWORLD && action == ACTION_PVPROOM;
      }
      
      public static function isAdventureMode() : Boolean
      {
         return gameMode != MODE_OVERWORLD && action == ACTION_ADVENTURE;
      }
      
      public static function isPlayBack() : Boolean
      {
         return action == ACTION_PLAYBACK;
      }
      
      public static function isCutscene() : Boolean
      {
         return action == ACTION_CUTSCENE;
      }
      
      public static function shouldShowRespawn() : Boolean
      {
         if(isPvPRoomMode())
         {
            return false;
         }
         return !(questID == -1 && action == ACTION_DUEL) && action != ACTION_SURVIVALMODE && action != ACTION_WARROOMBATTLE;
      }
      
      public static function getAction() : int
      {
         return action;
      }
      
      public static function initBattleMode(quest:int, actionType:int, bg:int, gameStageWidth:int, time:int, wave:Vector.<XMLQuestWave>, startingPosX:int, roomData:Array = null, roomid:int = 0) : *
      {
         var bgparam:int = 0;
         var bgparam2:int = 0;
         if(!QueryManager.instance.checkCurrentSessionId() && !isPlayBackClient())
         {
            OverworldHUD.instance.showMultipleClients();
            return;
         }
         OverworldHUD.instance.closeOpenDialogs(actionType == ACTION_WARROOMBATTLE);
         if(StageManager.getGameStage() != null)
         {
            StageManager.getGameStage().visible = true;
         }
         var fromAdventureMode:Boolean = gameMode == MODE_BATTLE;
         if(fromAdventureMode)
         {
            StageManager.saveReturnPosX();
            StageManager.clearRoom();
            NetworkManager.instance.leaveRoom();
         }
         gameMode = MODE_BATTLELOADING;
         questID = quest;
         returnToAdventureMode = fromAdventureMode;
         action = actionType;
         if(action != ACTION_ADVENTURE && bg == GameStage.BG_BAMBOOFORESTTOWN)
         {
            bg = GameStage.BG_BAMBOOFOREST;
         }
         if(!fromAdventureMode || bg != -1 && StageManager.gameStageType != bg)
         {
            bgparam = 0;
            bgparam2 = 0;
            if(roomData != null && roomData[roomid] != null)
            {
               bgparam = int(roomData[roomid].getBGParam());
               bgparam2 = int(roomData[roomid].getBGParam2());
            }
            StageManager.initStage(action,stageMC,bg,gameStageWidth,time,bgparam,bgparam2);
            MCSPool.init();
            ProjectilePool.init();
            MCSCharacter.initAnimationData();
            ProjectileManager.init();
            InputManager.initBattleMode();
         }
         else if(action != ACTION_ADVENTURE)
         {
            StageManager.reinitStage(action,gameStageWidth,time);
            InputManager.initBattleMode();
         }
         StatsManager.initPlayer();
         var player:MCSPlayer = StatsManager.getPlayer();
         player.addToCanvas(StageManager.getGameStage().getPlayerCanvas());
         player.setPosition(startingPosX,StageManager.getGroundY());
         player.mcs.faceRight();
         if(action == ACTION_DUEL || action == ACTION_PLAYBACK)
         {
            SoundManager.instance.playMusic(MusicManager.MUSIC_TOUGHBATTLE);
            StageManager.initDuel(startingPosX < StatsManager.stageWidth / 2);
            player.faceScreenCenter();
            player.startAction(MCSActor.IDLE_STATE);
            player.startAnim(MCSActor.BOW2);
            if(action == ACTION_PLAYBACK)
            {
               player.getMCS().visible = false;
               StageManager.initUIForPlayback();
            }
         }
         else if(action == ACTION_CUTSCENE)
         {
            player.getMCS().visible = false;
            StageManager.initUIForPlayback();
         }
         else if(action == ACTION_ADVENTURE || action == ACTION_PVPROOM)
         {
            StageManager.initRooms(roomData,roomid,startingPosX);
         }
         else if(action == ACTION_WARROOMBATTLE)
         {
            SoundManager.instance.playMusic(MusicManager.MUSIC_PVP);
         }
         else if(action == ACTION_HARVEST)
         {
            SoundManager.instance.playMusic(MusicManager.MUSIC_DOJO);
         }
         else
         {
            SoundManager.instance.pickBattleMusic();
         }
         if(wave != null)
         {
            NPCManager.init(wave);
         }
         ParticleSystemManager.getInstance().init();
         startBattleMode();
         if(action == ACTION_ADVENTURE)
         {
            InputManager.setAdventureMode();
         }
         else if(action == ACTION_PLAYBACK || action == ACTION_CUTSCENE)
         {
            InputManager.disableInput();
         }
         if(action == ACTION_HARVEST)
         {
            StageManager.hideForeground();
         }
      }
      
      public static function startBattleMode() : *
      {
         gameMode = MODE_BATTLE;
         InputManager.setBattleMode();
      }
      
      public static function endBattleMode(win:Boolean) : *
      {
         var npcdata:XMLNpc = null;
         if(win || action == ACTION_SURVIVALMODE || action == ACTION_WARROOMBATTLE)
         {
            gameMode = MODE_BATTLEENDWIN;
            if(action == ACTION_SURVIVALMODE)
            {
               OverworldHUD.instance.lootDialog.setSurvivalModeLoot();
               QueryManager.instance.updateGlobalVar(50005,NPCManager.getTotalKilled());
               StatsManager.getPlayer().setHP(StatsManager.getStat(StatsManager.STAT_HP));
               StatsManager.getPlayer().setChi(StatsManager.getStat(StatsManager.STAT_CHI));
               Overworld.endQuestStepIntro();
            }
            else if(action == ACTION_WARROOMBATTLE)
            {
               OverworldHUD.instance.lootDialog.setSurvivalModeLoot();
               QueryManager.instance.updateGlobalVar(50006,NPCManager.getTotalKilled());
               StatsManager.getPlayer().setHP(StatsManager.getStat(StatsManager.STAT_HP));
               StatsManager.getPlayer().setChi(StatsManager.getStat(StatsManager.STAT_CHI));
               if(StatsManager.getStat(60018) < NPCManager.getTotalKilled())
               {
                  StatsManager.reportAchievementStat(60018,NPCManager.getTotalKilled(),true);
               }
               Overworld.endQuestStepIntro();
            }
            else if(action == ACTION_SURVIVE)
            {
               OverworldHUD.instance.lootDialog.halfXPMaxFourLoot();
               Overworld.endQuestStepIntro();
            }
            else if(action == ACTION_DUEL)
            {
               npcdata = QuestEngine.getNPCData(-1);
               if(npcdata != null && npcdata.nid != "" && Math.abs(StatsManager.getLevel() - npcdata.lvl) > 2)
               {
                  OverworldHUD.instance.lootDialog.clearLoot();
               }
               if(NetworkManager.instance.isDuellingP2P())
               {
                  if(!NetworkManager.instance.isRecording())
                  {
                     Overworld.endQuestStepIntro();
                  }
                  if(BattleUI.instance.getIsDraw())
                  {
                     QueryManager.instance.duelEnd(StatsManager.charname,"draw");
                     StatsManager.setPlayerStats(StatsManager.STAT_DRAW,StatsManager.getPlayerStats(StatsManager.STAT_DRAW) + 1);
                     NetworkManager.instance.stopRecording(2);
                  }
                  else if(win)
                  {
                     QueryManager.instance.duelEnd(StatsManager.charname,QuestEngine.getNPCName(-1));
                     StatsManager.setPlayerStats(StatsManager.STAT_WINS,StatsManager.getPlayerStats(StatsManager.STAT_WINS) + 1);
                     OverworldHUD.instance.friendpanel.refresh();
                     NetworkManager.instance.stopRecording(0);
                     StatsManager.reportAchievementStat(60000,1);
                  }
               }
               else if(action != ACTION_PLAYBACK && action != ACTION_CUTSCENE)
               {
                  Overworld.endQuestStepIntro();
               }
            }
            else if(action != ACTION_PLAYBACK && action != ACTION_CUTSCENE)
            {
               StatsManager.reportAchievementStat(60017,NPCManager.getTotalKilled());
               StatsManager.reportAchievementStat(60016,NPCManager.getTotalBeheading());
               Overworld.endQuestStepIntro();
            }
         }
         else
         {
            SoundManager.instance.playMusic(MusicManager.MUSIC_LOSE);
            gameMode = MODE_BATTLEENDLOSE;
            OverworldHUD.getInstance().lootDialog.clearLoot();
            if(isDuelMode())
            {
               OverworldHUD.instance.questDialogueUI.show(-1,DuelModeUI.instance.getTaunt());
               OverworldHUD.instance.questDialogueUI.disableClick();
               NetworkManager.instance.stopRecording(1);
            }
         }
      }
      
      public static function stopBattleMode() : *
      {
         var npcdata:XMLNpc = null;
         var npcdata2:XMLNpc = null;
         var mapid:int = 0;
         var territoryData:TerritoryData = null;
         var continueQuest:Boolean = false;
         var win:Boolean = gameMode == MODE_BATTLEENDWIN;
         if(action == ACTION_PLAYBACK || action == ACTION_CUTSCENE)
         {
            StatsManager.getPlayer().getMCS().visible = true;
         }
         else if(win || action == ACTION_SURVIVALMODE || action == ACTION_WARROOMBATTLE)
         {
            BattleUI.instance.hideWin();
            if(questID == -1 && action == ACTION_DUEL)
            {
               NetworkManager.instance.duelEnd();
            }
            else if(questID != -1)
            {
               continueQuest = true;
            }
            if(action != ACTION_HARVEST && action != ACTION_DUEL)
            {
               StatsManager.saveHealthAfterBattle();
            }
            else if(action == ACTION_DUEL)
            {
               npcdata = QuestEngine.getNPCData(-1);
               if(npcdata != null && (npcdata.nid != "" || npcdata.name != DuelModeUI.instance.selectedOpponentName))
               {
                  StatsManager.saveHealthAfterBattle();
               }
            }
         }
         else
         {
            if(questID == -1 && action == ACTION_DUEL)
            {
               NetworkManager.instance.duelEnd();
            }
            else
            {
               returnToAdventureMode = false;
            }
            if(LoseUI.instance.hasRespawn())
            {
               StatsManager.fullHealth();
            }
            else if(action == ACTION_DUEL)
            {
               npcdata2 = QuestEngine.getNPCData(-1);
               if(npcdata2 != null && (npcdata2.nid != "" || npcdata2.name != DuelModeUI.instance.selectedOpponentName))
               {
                  StatsManager.partialHealth();
               }
            }
            else
            {
               StatsManager.partialHealth();
            }
         }
         StageManager.clearFilter();
         var prevAction:int = action;
         var warRoomKills:int = NPCManager.getTotalKilled();
         var weaponUse:int = warRoomKills / 100;
         if(weaponUse <= 0)
         {
            weaponUse = 1;
         }
         StatsManager.updateWeaponUse(weaponUse);
         QueryManager.instance.saveModifiedCharData();
         action = ACTION_ADVENTURE;
         StatsManager.initPlayer();
         if(returnToAdventureMode || LoseUI.instance.hasRespawn())
         {
            StageManager.returnToRoom();
         }
         else
         {
            mapid = NodeGenerator.instance.getTerritoryId(StageManager.getCurrentNode());
            territoryData = NodeGenerator.instance.getTerritoryData(mapid >> 12 & 0x0FFF,mapid & 0x0FFF,false);
            if(Boolean(territoryData.isTown(StageManager.getCurrentNode()) && territoryData.territoryAtWar()) && Boolean(StageManager.getCurrentRoom() > 0) && StatsManager.getStat(30021) != 0)
            {
               StageManager.gotoRoom(0,150,StatsManager.getStat(30021));
               StatsManager.setStat(30021,0);
            }
            else
            {
               StageManager.gotoRoom(StatsManager.getPlayerStats(StatsManager.STAT_LOCATION_ROOM),150,StatsManager.getLocation());
            }
         }
         ParticleSystemManager.getInstance().init();
         returnToAdventureMode = false;
         startBattleMode();
         InputManager.setAdventureMode();
         if(prevAction == ACTION_WARROOMBATTLE)
         {
            OverworldHUD.instance.warUI.returnFromBattle(warRoomKills);
         }
         else
         {
            StatsManager.parseGiftNotificationsString();
         }
         if(StatsManager.equipment[StatsManager.EQ_WEAPON] != null && StatsManager.equipment[StatsManager.EQ_WEAPON].isBroken())
         {
            OverworldHUD.instance.showDialogRepairWeapon();
            StatsManager.reportAchievementStat(60004,1,true);
         }
      }
      
      public static function endCutscene(nextQuestId:int, nextQuestStep:int) : *
      {
         action = ACTION_ADVENTURE;
         StatsManager.initPlayer();
         StageManager.returnToRoom();
         ParticleSystemManager.getInstance().init();
         returnToAdventureMode = false;
         startBattleMode();
         InputManager.setAdventureMode();
         if(nextQuestId != -1)
         {
            Overworld.startQuestStepIntro(nextQuestId,nextQuestStep);
         }
      }
      
      public static function test() : *
      {
      }
      
      public static function checkPlayBackMode() : *
      {
         var flashVars:Object = getLoaderInfo(StatsManager.mainTimeLine).parameters;
         if(flashVars.playbackmode == null)
         {
            return;
         }
         playbackClient = true;
         if(OverworldHUD.instance)
         {
            OverworldHUD.instance.friendpanel.hideAll();
         }
         QueryManager.instance.offlineMode = true;
         if(NetworkManager.instance != null)
         {
            NetworkManager.instance.connected = false;
         }
         StatsManager.showFriends = false;
         StatsManager.charname = "guest";
         StatsManager.initNewPlayer();
         new Overworld(stageMC);
         new StageManager();
         new NetworkManager();
         StatsManager.createPlayer();
         StageManager.setPlayer(StatsManager.getPlayer());
         if(StatsManager.usePlayerIO)
         {
            showLoadingScreen();
            QueryManagerPIO.instance.playbackClientLogin(flashVars.playbackid,flashVars.playbackname);
            trace("checkPlayBackMode:",flashVars.playbackid,flashVars.playbackname);
         }
         else if(flashVars.playbackid != "")
         {
            QueryManager.instance.getReplay(flashVars.playbackid);
         }
         else if(flashVars.playbackname != "")
         {
            QueryManager.instance.getReplayByName(flashVars.playbackname);
         }
         else
         {
            QueryManager.instance.getReplay("0");
         }
         if(flashVars.showslash != null)
         {
            playbackClientShowSlash = true;
         }
      }
      
      public static function isPlayBackClient() : Boolean
      {
         return playbackClient;
      }
      
      public static function isPlaybackClientShowSlash() : Boolean
      {
         return playbackClientShowSlash;
      }
      
      internal static function getLoaderInfo(dispObj:DisplayObject) : LoaderInfo
      {
         var root:DisplayObject = getRootDisplayObject(dispObj);
         if(root != null)
         {
            return root.loaderInfo;
         }
         return null;
      }
      
      internal static function getRootDisplayObject(dispObj:DisplayObject) : DisplayObject
      {
         if(topParent == null)
         {
            if(dispObj.parent != null)
            {
               return getRootDisplayObject(dispObj.parent);
            }
            topParent = dispObj;
            return topParent;
         }
         return topParent;
      }
      
      internal static function checkSiteLock() : *
      {
         var msgbox:CorruptedMessage = null;
         if(StatsManager.isKongregate || StatsManager.isMobile)
         {
            return;
         }
         if(getLoaderInfo(StatsManager.mainTimeLine).url.indexOf("playerio") == -1 && getLoaderInfo(StatsManager.mainTimeLine).url.indexOf("strawhatsamuraiduels.com") == -1 && getLoaderInfo(StatsManager.mainTimeLine).url.indexOf("explosivebarrel.net") == -1)
         {
            msgbox = new CorruptedMessage();
            msgbox.prompt.text = "Error: Site-locked";
            msgbox.strtext.text = "";
            stageMC.addChild(msgbox);
            InputManager.disableInput();
            GameEngine.stopEngine();
         }
      }
      
      public static function checkFacebookLogin() : *
      {
         var flashVars:Object = getLoaderInfo(StatsManager.mainTimeLine).parameters;
         StatsManager.useFlashVarsLogin = true;
      }
      
      public static function checkKongregate() : *
      {
         if(getLoaderInfo(StatsManager.mainTimeLine).parameters.kongregate_api_path != null)
         {
            StatsManager.isKongregate = true;
         }
      }
      
      public static function getPublisherId() : String
      {
         if(StatsManager.isAndroid)
         {
            return "999998";
         }
         if(StatsManager.isIOS)
         {
            return "999999";
         }
         var flashVars:Object = getLoaderInfo(StatsManager.mainTimeLine).parameters;
         if(flashVars.pubid == null)
         {
            return "";
         }
         return flashVars.pubid;
      }
   }
}

