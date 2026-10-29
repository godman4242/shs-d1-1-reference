package
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   
   public class QuestEngine
   {
      
      public static var itemList:Vector.<XMLItem>;
      
      public static var mapList:Vector.<XMLWorldMap>;
      
      public static var nodeList:Vector.<XMLWorldNode>;
      
      public static var questList:Vector.<XMLQuest>;
      
      public static var npcList:Vector.<XMLNpc>;
      
      public static var bgList:Vector.<XMLBG>;
      
      public static var skillList:Array;
      
      public static var achievementList:Vector.<XMLAchievement>;
      
      public static var premiumDefaultList:Array;
      
      public static var premiumSpecialList:Array;
      
      public static var premiumRotationList:Array;
      
      public static var mapBitmapData:BitmapData;
      
      internal static var warMarkerList:Array;
      
      internal static var introVideo:IntroVideo;
      
      internal static var procGenQuestXML:XMLQuest;
      
      internal static var cachedQuestActions:Vector.<QuestAction> = new Vector.<QuestAction>();
      
      internal static var cachedRandomQuestActions:Vector.<QuestAction> = new Vector.<QuestAction>();
      
      public static var xmlURL:String = "./data/";
      
      internal static const TrapRoomData:Class = QuestEngine_TrapRoomData;
      
      public static var trapRoomData:XML = null;
      
      public static var townsData:String = "";
      
      internal static var xmlCompleted:int = 0;
      
      internal static var xmlCompletedMax:int = 10;
      
      public function QuestEngine()
      {
         super();
         init();
      }
      
      public static function init() : void
      {
         if(StatsManager.language == LangManager.CHINESE)
         {
            StatsManager.mainTimeLine.loadingScreen.loadertext.text = "载入中...0%";
         }
         else
         {
            StatsManager.mainTimeLine.loadingScreen.loadertext.text = "Loading game data...";
         }
         mapList = new Vector.<XMLWorldMap>();
         nodeList = new Vector.<XMLWorldNode>();
         questList = new Vector.<XMLQuest>();
         itemList = new Vector.<XMLItem>();
         npcList = new Vector.<XMLNpc>();
         bgList = new Vector.<XMLBG>();
         skillList = new Array();
         premiumDefaultList = new Array();
         premiumSpecialList = new Array();
         premiumRotationList = new Array();
         achievementList = new Vector.<XMLAchievement>();
         xmlCompleted = 0;
         if(StatsManager.isMobile)
         {
            Mobile.instance.loadXML();
         }
         else
         {
            loadExternalXML();
         }
         StatsManager.initQuestLog();
         loadExternalTrapRoomDataXML();
      }
      
      public static function loadMapData(xml:XML) : void
      {
         mapList.fixed = false;
         var max:int = xml.map.length();
         for(var i:int = 0; i < max; i++)
         {
            mapList.push(new XMLWorldMap(xml.map[i]));
         }
         mapList.fixed = true;
      }
      
      public static function loadNodeData(xml:XML) : void
      {
         var nodeXML:XMLWorldNode = null;
         nodeList.fixed = false;
         var max:* = xml.node.length();
         for(var i:int = 0; i < max; i++)
         {
            nodeXML = new XMLWorldNode(xml.node[i]);
            if(nodeXML.overwrite != XMLWorldNode.OVERWRITE_NONE)
            {
               nodeXML.isGenerated = false;
            }
            nodeList.push(nodeXML);
         }
         nodeList.fixed = true;
      }
      
      public static function loadQuestData(xml:XML) : void
      {
         questList.fixed = false;
         var max:int = xml.quest.length();
         for(var i:int = 0; i < max; i++)
         {
            questList.push(new XMLQuest(xml.quest[i]));
         }
         questList.fixed = true;
      }
      
      public static function loadItemData(xml:XML) : void
      {
         itemList.fixed = false;
         var max:int = xml.item.length();
         for(var i:int = 0; i < max; i++)
         {
            itemList.push(new XMLItem(xml.item[i]));
         }
         itemList.fixed = true;
      }
      
      public static function loadNpcData(xml:XML) : void
      {
         npcList.fixed = false;
         var max:int = xml.npc.length();
         for(var i:int = 0; i < max; i++)
         {
            npcList.push(new XMLNpc(xml.npc[i]));
         }
         npcList.fixed = true;
      }
      
      public static function loadBGData(xml:XML) : void
      {
         bgList.fixed = false;
         var max:int = xml.bg.length();
         for(var i:int = 0; i < max; i++)
         {
            bgList.push(new XMLBG(xml.bg[i]));
         }
         bgList.fixed = true;
      }
      
      public static function loadSkillData(xml:XML) : void
      {
         var max:int = xml.skill.length();
         for(var i:int = 0; i < max; i++)
         {
            skillList.push(new XMLSkill(xml.skill[i]));
         }
         skillList.sortOn("order",Array.NUMERIC);
      }
      
      public static function loadAchievementData(xml:XML) : void
      {
         achievementList.fixed = false;
         var max:int = xml.achievement.length();
         for(var i:int = 0; i < max; i++)
         {
            achievementList.push(new XMLAchievement(xml.achievement[i]));
         }
         achievementList.fixed = true;
      }
      
      public static function loadPremiumData(xml:XML) : void
      {
         var max:int = int(xml.§default§.item.length());
         for(var i:int = 0; i < max; i++)
         {
            premiumDefaultList.push(xml.§default§.item[i]);
         }
         max = int(xml.special.item.length());
         for(i = 0; i < max; i++)
         {
            premiumSpecialList.push(xml.special.item[i]);
         }
         max = int(xml.rotation.set.length());
         for(i = 0; i < max; i++)
         {
            premiumRotationList.push(xml.rotation.set[i]);
         }
      }
      
      public static function loadExternalXML() : void
      {
         loadExternalMapDataXML();
         loadExternalNodeDataXML();
         loadExternalQuestDataXML();
         loadExternalItemDataXML();
         loadExternalNpcDataXML();
         loadExternalSkillDataXML();
         loadExternalBGDataXML();
         loadExternalAchievementDataXML();
         loadExternalPremiumDataXML();
         loadExternalMapBitmapData();
      }
      
      public static function loadExternalMapDataXML() : void
      {
         var myLoader:URLLoader = new URLLoader();
         if(StatsManager.useLocalXML)
         {
            myLoader.load(new URLRequest(xmlURL + "mapdata.xml"));
         }
         else
         {
            myLoader.load(new URLRequest(QueryManagerPIO.instance.getDataXML("mapdata.xml")));
         }
         myLoader.addEventListener(Event.COMPLETE,processMapDataXML);
         myLoader.addEventListener(IOErrorEvent.IO_ERROR,loadingError);
      }
      
      public static function processMapDataXML(e:Event) : void
      {
         var xml:XML = new XML(e.target.data);
         loadMapData(xml);
         checkALLXMLCompleted();
         if(StatsManager.isMobile)
         {
            Mobile.instance.writeXMLFile(e.target.data,StatsManager.FILE_MAPDATA);
         }
      }
      
      public static function loadExternalNodeDataXML() : void
      {
         var myLoader:URLLoader = new URLLoader();
         if(StatsManager.useLocalXML)
         {
            myLoader.load(new URLRequest(xmlURL + "nodedata.xml"));
         }
         else
         {
            myLoader.load(new URLRequest(QueryManagerPIO.instance.getDataXML("nodedata.xml")));
         }
         myLoader.addEventListener(Event.COMPLETE,processNodeDataXML);
         myLoader.addEventListener(IOErrorEvent.IO_ERROR,loadingError);
      }
      
      public static function processNodeDataXML(e:Event) : void
      {
         var xml:XML = new XML(e.target.data);
         loadNodeData(xml);
         checkALLXMLCompleted();
         if(StatsManager.isMobile)
         {
            Mobile.instance.writeXMLFile(e.target.data,StatsManager.FILE_NODEDATA);
         }
      }
      
      public static function loadExternalQuestDataXML() : void
      {
         var myLoader:URLLoader = new URLLoader();
         if(StatsManager.useLocalXML)
         {
            myLoader.load(new URLRequest(xmlURL + "questdata.xml"));
         }
         else
         {
            myLoader.load(new URLRequest(QueryManagerPIO.instance.getDataXML("questdata.xml")));
         }
         myLoader.addEventListener(Event.COMPLETE,processQuestDataXML);
         myLoader.addEventListener(IOErrorEvent.IO_ERROR,loadingError);
      }
      
      public static function processQuestDataXML(e:Event) : void
      {
         var xml:XML = new XML(e.target.data);
         loadQuestData(xml);
         checkALLXMLCompleted();
         if(StatsManager.isMobile)
         {
            Mobile.instance.writeXMLFile(e.target.data,StatsManager.FILE_QUESTDATA);
         }
      }
      
      public static function loadExternalItemDataXML() : void
      {
         var myLoader:URLLoader = new URLLoader();
         if(StatsManager.useLocalXML)
         {
            myLoader.load(new URLRequest(xmlURL + "itemdata.xml"));
         }
         else
         {
            myLoader.load(new URLRequest(QueryManagerPIO.instance.getDataXML("itemdata.xml")));
         }
         myLoader.addEventListener(Event.COMPLETE,processItemDataXML);
         myLoader.addEventListener(IOErrorEvent.IO_ERROR,loadingError);
      }
      
      public static function processItemDataXML(e:Event) : void
      {
         var xml:XML = new XML(e.target.data);
         loadItemData(xml);
         checkALLXMLCompleted();
         if(StatsManager.isMobile)
         {
            Mobile.instance.writeXMLFile(e.target.data,StatsManager.FILE_ITEMDATA);
         }
      }
      
      public static function loadExternalNpcDataXML() : void
      {
         var myLoader:URLLoader = new URLLoader();
         if(StatsManager.useLocalXML)
         {
            myLoader.load(new URLRequest(xmlURL + "npcdata.xml"));
         }
         else
         {
            myLoader.load(new URLRequest(QueryManagerPIO.instance.getDataXML("npcdata.xml")));
         }
         myLoader.addEventListener(Event.COMPLETE,processNpcDataXML);
         myLoader.addEventListener(IOErrorEvent.IO_ERROR,loadingError);
      }
      
      public static function processNpcDataXML(e:Event) : void
      {
         var xml:XML = new XML(e.target.data);
         loadNpcData(xml);
         checkALLXMLCompleted();
         if(StatsManager.isMobile)
         {
            Mobile.instance.writeXMLFile(e.target.data,StatsManager.FILE_NPCDATA);
         }
      }
      
      public static function loadExternalBGDataXML() : void
      {
         var myLoader:URLLoader = new URLLoader();
         if(StatsManager.useLocalXML)
         {
            myLoader.load(new URLRequest(xmlURL + "bgdata.xml"));
         }
         else
         {
            myLoader.load(new URLRequest(QueryManagerPIO.instance.getDataXML("bgdata.xml")));
         }
         myLoader.addEventListener(Event.COMPLETE,processBGDataXML);
         myLoader.addEventListener(IOErrorEvent.IO_ERROR,loadingError);
      }
      
      public static function processBGDataXML(e:Event) : void
      {
         var xml:XML = new XML(e.target.data);
         loadBGData(xml);
         checkALLXMLCompleted();
         if(StatsManager.isMobile)
         {
            Mobile.instance.writeXMLFile(e.target.data,StatsManager.FILE_BGDATA);
         }
      }
      
      public static function loadExternalSkillDataXML() : void
      {
         var myLoader:URLLoader = new URLLoader();
         if(StatsManager.useLocalXML)
         {
            myLoader.load(new URLRequest(xmlURL + "skilldata.xml"));
         }
         else
         {
            myLoader.load(new URLRequest(QueryManagerPIO.instance.getDataXML("skilldata.xml")));
         }
         myLoader.addEventListener(Event.COMPLETE,processSkillDataXML);
         myLoader.addEventListener(IOErrorEvent.IO_ERROR,loadingError);
      }
      
      public static function processSkillDataXML(e:Event) : void
      {
         var xml:XML = new XML(e.target.data);
         loadSkillData(xml);
         checkALLXMLCompleted();
         if(StatsManager.isMobile)
         {
            Mobile.instance.writeXMLFile(e.target.data,StatsManager.FILE_SKILLDATA);
         }
      }
      
      public static function loadExternalAchievementDataXML() : void
      {
         var myLoader:URLLoader = new URLLoader();
         if(StatsManager.useLocalXML)
         {
            myLoader.load(new URLRequest(xmlURL + "achievementdata.xml"));
         }
         else
         {
            myLoader.load(new URLRequest(QueryManagerPIO.instance.getDataXML("achievementdata.xml")));
         }
         myLoader.addEventListener(Event.COMPLETE,processAchievementDataXML);
         myLoader.addEventListener(IOErrorEvent.IO_ERROR,loadingError);
      }
      
      public static function processAchievementDataXML(e:Event) : void
      {
         var xml:XML = new XML(e.target.data);
         loadAchievementData(xml);
         checkALLXMLCompleted();
         if(StatsManager.isMobile)
         {
            Mobile.instance.writeXMLFile(e.target.data,StatsManager.FILE_ACHIEVEMENTDATA);
         }
      }
      
      public static function loadExternalPremiumDataXML() : void
      {
         var myLoader:URLLoader = new URLLoader();
         if(StatsManager.useLocalXML)
         {
            myLoader.load(new URLRequest(xmlURL + "premiumdata.xml"));
         }
         else
         {
            myLoader.load(new URLRequest(QueryManagerPIO.instance.getDataXML("premiumdata.xml")));
         }
         myLoader.addEventListener(Event.COMPLETE,processPremiumDataXML);
         myLoader.addEventListener(IOErrorEvent.IO_ERROR,loadingError);
      }
      
      public static function processPremiumDataXML(e:Event) : void
      {
         var xml:XML = new XML(e.target.data);
         loadPremiumData(xml);
         checkALLXMLCompleted();
         if(StatsManager.isMobile)
         {
            Mobile.instance.writeXMLFile(e.target.data,StatsManager.FILE_PREMIUMDATA);
         }
      }
      
      private static function loadExternalTrapRoomDataXML() : void
      {
         var myLoader:URLLoader = new URLLoader();
         if(StatsManager.useLocalXML)
         {
            myLoader.load(new URLRequest(xmlURL + "traproomdata.xml"));
            myLoader.addEventListener(Event.COMPLETE,processTrapRoomDataXML);
         }
         else
         {
            trapRoomData = new XML(new TrapRoomData());
         }
      }
      
      private static function processTrapRoomDataXML(e:Event) : void
      {
         trapRoomData = new XML(e.target.data);
      }
      
      public static function loadExternalMapBitmapData() : *
      {
         var myLoader:URLLoader = new URLLoader();
         myLoader.dataFormat = URLLoaderDataFormat.BINARY;
         myLoader.addEventListener(Event.COMPLETE,mapBitmapDataLoaded);
         if(StatsManager.useLocalXML)
         {
            myLoader.load(new URLRequest("map.gif"));
         }
         else
         {
            myLoader.load(new URLRequest(QueryManagerPIO.instance.getDataXML("map.gif")));
         }
      }
      
      public static function mapBitmapDataLoaded(e:Event) : *
      {
         var ba:ByteArray = e.target.data;
         if(StatsManager.isMobile)
         {
            Mobile.instance.writeFile(ba,StatsManager.FILE_MAPBITMAPDATA);
         }
         var loader:Loader = new Loader();
         loader.contentLoaderInfo.addEventListener(Event.COMPLETE,processMapBitmapData);
         loader.loadBytes(ba);
      }
      
      public static function processMapBitmapData(e:Event) : *
      {
         var terrX:int = 0;
         var terrY:int = 0;
         var j:int = 0;
         mapBitmapData = Bitmap(LoaderInfo(e.target).content).bitmapData;
         warMarkerList = new Array();
         var mapWidth:int = mapBitmapData.width;
         var mapHeight:int = mapBitmapData.height;
         for(var i:int = 0; i < mapWidth; i++)
         {
            for(j = 0; j < mapHeight; j++)
            {
               if(mapBitmapData.getPixel(i,j) != 0)
               {
                  terrX = i - WorldMapUI.TERRSHIFTX + WorldMapUI.WARMARKERSHIFTX;
                  terrY = j - WorldMapUI.TERRSHIFTY;
                  warMarkerList.push(terrX + 341 << 12 | terrY + 341);
               }
            }
         }
         checkALLXMLCompleted();
      }
      
      public static function getWarMarkerList() : Array
      {
         return warMarkerList;
      }
      
      public static function gotTownsData(str:String) : *
      {
         townsData = str;
      }
      
      public static function getTownsData() : String
      {
         return townsData;
      }
      
      public static function getTownState(mapid:int) : int
      {
         var output:int = 0;
         var lvl:int = 0;
         var max:int = int(warMarkerList.length);
         for(var i:int = 0; i < max; i++)
         {
            if(warMarkerList[i] == mapid)
            {
               if(i < townsData.length)
               {
                  output = int(townsData.charAt(i));
                  if(output == 0 && NodeGenerator.instance.isStoryQuestTown(mapid))
                  {
                     return 1;
                  }
                  if(NodeGenerator.instance.isNoChangeTown(mapid))
                  {
                     lvl = NodeGenerator.instance.getNoChangeTownLevel(mapid);
                     if(lvl != -1)
                     {
                        return lvl;
                     }
                     return output;
                  }
                  return output;
               }
               return 0;
            }
         }
         return 0;
      }
      
      public static function checkALLXMLCompleted() : *
      {
         ++xmlCompleted;
         var pcent:int = Math.floor(xmlCompleted * 100 / xmlCompletedMax);
         if(pcent == 100)
         {
            if(StatsManager.language == LangManager.CHINESE)
            {
               StatsManager.mainTimeLine.loadingScreen.loadertext.text = "载入中...";
            }
            else
            {
               StatsManager.mainTimeLine.loadingScreen.loadertext.text = "Processing game data...";
            }
         }
         else if(StatsManager.language == LangManager.CHINESE)
         {
            StatsManager.mainTimeLine.loadingScreen.loadertext.text = "载入中..." + pcent + "%";
         }
         else
         {
            StatsManager.mainTimeLine.loadingScreen.loadertext.text = "Loading game data... " + pcent + "%";
         }
         if(xmlCompleted == xmlCompletedMax)
         {
            trace("quest engine loaded");
            if(introVideo == null || introVideo.hasEnded())
            {
               QuestEngine.clearIntroVideo();
               StatsManager.mainTimeLine.startGame();
            }
            else if(!introVideo.hasStarted())
            {
               trace("data loaded before intro video");
            }
         }
      }
      
      public static function setIntroVideo(_introVideo:IntroVideo) : *
      {
         introVideo = _introVideo;
      }
      
      public static function clearIntroVideo() : *
      {
         introVideo = null;
      }
      
      public static function reportIntroVideoEnded() : *
      {
         if(xmlCompleted == xmlCompletedMax)
         {
            clearIntroVideo();
            StatsManager.mainTimeLine.startGame();
         }
      }
      
      public static function loadingError(event:IOErrorEvent) : *
      {
         if(StatsManager.mainTimeLine.currentScene.name == "loading" && !StatsManager.mainTimeLine.messageDialog.visible)
         {
            StatsManager.mainTimeLine.messageDialog.showYesNoDialog("Network error. Please check that you are connected to the Internet.",function():*
            {
               init();
            },null,"Retry");
         }
      }
      
      public static function getItemData(itemID:int) : XMLItem
      {
         var itemXML:XMLItem = null;
         var max:int = int(itemList.length);
         for(var i:int = 0; i < max; i++)
         {
            itemXML = itemList[i];
            if(itemXML.id == itemID)
            {
               return itemXML;
            }
         }
         return null;
      }
      
      public static function getSkillData(skillID:int) : XMLSkill
      {
         var skillXML:XMLSkill = null;
         var max:int = int(skillList.length);
         for(var i:int = 0; i < max; i++)
         {
            skillXML = skillList[i];
            if(skillXML.id == skillID)
            {
               return skillXML;
            }
         }
         return null;
      }
      
      public static function getBGData(BGID:int) : XMLBG
      {
         var bgXML:XMLBG = null;
         var max:int = int(bgList.length);
         for(var i:int = 0; i < max; i++)
         {
            bgXML = bgList[i];
            if(bgXML.id == BGID)
            {
               return bgXML;
            }
         }
         return new XMLBG(null);
      }
      
      public static function getSkillDataByCategory(category:int) : Vector.<XMLSkill>
      {
         var skillXML:XMLSkill = null;
         var output:Vector.<XMLSkill> = new Vector.<XMLSkill>();
         var max:int = int(skillList.length);
         for(var i:int = 0; i < max; i++)
         {
            skillXML = skillList[i];
            if(skillXML.category == category)
            {
               output.push(skillXML);
            }
         }
         return output;
      }
      
      public static function refreshNodeQuests(nodeID:int, getRandomQuests:Boolean = true) : *
      {
         var questData:XMLQuest = null;
         var questID:int = 0;
         var step:int = 0;
         var type:int = 0;
         var level:int = 0;
         var playerLevel:int = 0;
         var dice:int = 0;
         trace("cache quests");
         cachedQuestActions.length = 0;
         var newQuestActions:Vector.<QuestAction> = new Vector.<QuestAction>();
         var actionList:Vector.<XMLQuestStep> = new Vector.<XMLQuestStep>();
         var totalQuestCount:* = int(questList.length);
         var maxlevel:int = StatsManager.getLevel() + 2;
         var minlevel:int = StatsManager.getLevel() - 2;
         for(var i:int = 0; i < totalQuestCount; i++)
         {
            questData = questList[i];
            actionList = questData.getStepList();
            questID = questData.id;
            step = StatsManager.getActiveQuestStep(questID);
            if(step >= 0 && step < actionList.length)
            {
               if(actionList[step].teleportNodeID == nodeID)
               {
                  cachedQuestActions.push(new QuestAction(questData,step,QuestType.OngoingQuest));
               }
            }
            else if(questData.startin != -1 && actionList.length > 0 && actionList[0].nodeID == nodeID && (questData.type == 1 || !StatsManager.checkCompletedQuest(questID)) && StatsManager.checkConditions(actionList[0].condition))
            {
               type = questData.type;
               level = questData.level;
               playerLevel = StatsManager.getLevel();
               if(type == QuestType.StoryQuest || type == QuestType.Dialogue || type == QuestType.ClanQuest)
               {
                  cachedQuestActions.push(new QuestAction(questData,0,type));
               }
               else
               {
                  if(level == 0 || level >= playerLevel - 1 && level <= playerLevel + 1)
                  {
                     type = QuestType.NormalSideQuest;
                  }
                  else if(level == playerLevel + 2)
                  {
                     type = QuestType.HighLvlQuest;
                  }
                  else if(level == playerLevel - 2)
                  {
                     type = QuestType.LowLvlQuest;
                  }
                  else
                  {
                     type = -1;
                  }
                  if(type != -1)
                  {
                     newQuestActions.push(new QuestAction(questData,0,type));
                  }
               }
            }
         }
         if(getRandomQuests)
         {
            cachedRandomQuestActions.length = 0;
            totalQuestCount = int(newQuestActions.length);
            if(totalQuestCount <= 3)
            {
               cachedRandomQuestActions = newQuestActions;
            }
            else
            {
               for(i = 0; i < 3; i++)
               {
                  dice = Math.random() * totalQuestCount;
                  cachedRandomQuestActions.push(newQuestActions[dice]);
                  newQuestActions.splice(dice,1);
                  totalQuestCount--;
               }
            }
         }
      }
      
      public static function getCachedQuestActions() : Vector.<QuestAction>
      {
         return cachedQuestActions.concat(cachedRandomQuestActions);
      }
      
      public static function removeQuestStepFromCache(questID:int, questStep:int) : *
      {
         var questAction:QuestAction = null;
         var max:int = int(cachedRandomQuestActions.length);
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            questAction = cachedRandomQuestActions[i];
            if(questAction.id == questID && questAction.stepNo == questStep)
            {
               cachedRandomQuestActions.splice(i,1);
               break;
            }
         }
      }
      
      public static function getQuestActions(nodeID:int, mapID:int = -1) : Vector.<QuestAction>
      {
         var questData:XMLQuest = null;
         var questID:int = 0;
         var step:int = 0;
         var type:int = 0;
         var level:int = 0;
         var playerLevel:int = 0;
         var questAction:Vector.<QuestAction> = new Vector.<QuestAction>();
         var actionList:Vector.<XMLQuestStep> = new Vector.<XMLQuestStep>();
         var length:int = int(questList.length);
         var maxlevel:int = StatsManager.getLevel() + 2;
         var minlevel:int = StatsManager.getLevel() - 2;
         for(var i:int = 0; i < length; i++)
         {
            questData = questList[i];
            actionList = questData.getStepList();
            questID = questData.id;
            if(questData.startin != -1 && (mapID == -1 || questData.startin == mapID))
            {
               if(questData.level <= maxlevel && questData.level >= minlevel && (questData.type == 1 || !StatsManager.checkCompletedQuest(questID)))
               {
                  step = StatsManager.getActiveQuestStep(questID);
                  if(step >= 0 && step < actionList.length)
                  {
                     if(actionList[step].nodeID == nodeID)
                     {
                        questAction.push(new QuestAction(questData,step,QuestType.OngoingQuest));
                     }
                  }
                  else if(actionList.length > 0 && actionList[0].nodeID == nodeID && StatsManager.checkConditions(actionList[0].condition))
                  {
                     type = questData.type;
                     level = questData.level;
                     playerLevel = StatsManager.getLevel();
                     if(type != QuestType.Dialogue)
                     {
                        if(level > playerLevel + 3)
                        {
                           type = QuestType.HighLvlQuest;
                        }
                        else if(level < playerLevel + 3)
                        {
                           type = QuestType.LowLvlQuest;
                        }
                     }
                     questAction.push(new QuestAction(questData,0,type));
                  }
               }
            }
            else
            {
               step = StatsManager.getActiveQuestStep(questID);
               if(step != -1)
               {
                  if(actionList[step].nodeID == nodeID)
                  {
                     if(StatsManager.checkConditions(actionList[step].condition) == true)
                     {
                        questAction.push(new QuestAction(questData,step,QuestType.OngoingQuest));
                     }
                  }
               }
            }
         }
         return questAction;
      }
      
      public static function getQuestData(questID:int) : XMLQuest
      {
         var questXML:XMLQuest = null;
         if(questID == QuestGenerator.PROCGENQUEST)
         {
            return procGenQuestXML;
         }
         var max:int = int(questList.length);
         for(var i:int = 0; i < max; i++)
         {
            questXML = questList[i];
            if(questXML.id == questID)
            {
               return questXML;
            }
         }
         return null;
      }
      
      public static function getQuestStepDetails(questID:int, step:int) : XMLQuestStep
      {
         var questXML:XMLQuest = null;
         if(questID == QuestGenerator.PROCGENQUEST)
         {
            questXML = procGenQuestXML;
         }
         else
         {
            questXML = getQuestData(questID);
         }
         if(questXML != null)
         {
            return questXML.getStep(step);
         }
         return null;
      }
      
      public static function insertQuestData(questXML:XMLQuest) : *
      {
         if(questXML.id == QuestGenerator.PROCGENQUEST)
         {
            procGenQuestXML = questXML;
            return;
         }
         var max:int = int(questList.length);
         for(var i:int = 0; i < max; i++)
         {
            if(questList[i].id == questXML.id)
            {
               questList[i] = questXML;
               return;
            }
         }
         questList.fixed = false;
         questList.push(questXML);
         questList.fixed = true;
      }
      
      public static function getNPCData(npcID:int) : XMLNpc
      {
         var npc:XMLNpc = null;
         var max:int = int(npcList.length);
         for(var i:int = 0; i < max; i++)
         {
            npc = npcList[i];
            if(npc.id == npcID)
            {
               return npc;
            }
         }
         return null;
      }
      
      public static function removeNPCData(removeid:int) : *
      {
         var max:int = int(npcList.length);
         npcList.fixed = false;
         for(var i:int = 0; i < max; i++)
         {
            if(npcList[i].id == removeid)
            {
               npcList.splice(i,1);
               return;
            }
         }
         npcList.fixed = true;
      }
      
      public static function insertNPCData(npcXML:XMLNpc) : *
      {
         var max:int = int(npcList.length);
         for(var i:int = 0; i < max; i++)
         {
            if(npcList[i].id == npcXML.id)
            {
               npcList[i] = npcXML;
               return;
            }
         }
         npcList.fixed = false;
         npcList.push(npcXML);
         npcList.fixed = true;
      }
      
      public static function putInNPCHolder(npcid:int, mcsStr:String, lvl:int = 0) : *
      {
         var npcxml:XMLNpc = getNPCData(npcid);
         if(npcxml == null)
         {
            npcxml = new XMLNpc(null);
         }
         if(npcxml.isAnimal())
         {
            return;
         }
         npcxml = npcxml.getClone();
         npcxml.id = XMLNpc.INDEX_NPCHOLDER;
         npcxml.lvl = lvl;
         npcxml.replaceMCS(mcsStr);
         insertNPCData(npcxml);
      }
      
      public static function putInDuelistHolder(npcid:int, mcsStr:String, lvl:int, charname:String = "") : *
      {
         var npcxml:XMLNpc = null;
         if(npcid != XMLNpc.INDEX_DUELIST)
         {
            npcxml = getNPCData(npcid);
         }
         if(npcxml == null)
         {
            npcxml = new XMLNpc(null);
         }
         npcxml = npcxml.getClone();
         npcxml.id = XMLNpc.INDEX_DUELIST;
         npcxml.lvl = lvl;
         if(charname != "")
         {
            npcxml.name = charname;
         }
         npcxml.replaceMCS(mcsStr);
         insertNPCData(npcxml);
      }
      
      public static function putProcGenInNPCHolder(mcsStr:String, npcname:String) : *
      {
         var npcxml:XMLNpc = new XMLNpc(null);
         npcxml.id = XMLNpc.INDEX_NPCHOLDER;
         npcxml.name = npcname;
         npcxml.replaceMCS(mcsStr);
         insertNPCData(npcxml);
      }
      
      public static function clearPlayersInNPCData() : *
      {
         npcList.fixed = false;
         var max:int = int(npcList.length);
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            if(npcList[i].id >= 700 && npcList[i].id <= 710 || npcList[i].id == XMLNpc.INDEX_NPCHOLDER)
            {
               npcList.splice(i,1);
            }
         }
         npcList.fixed = true;
      }
      
      public static function getNPCName(npcID:int) : String
      {
         var npc:XMLNpc = getNPCData(npcID);
         if(npc != null)
         {
            return npc.name;
         }
         return "?";
      }
      
      public static function getNPCBust(npcID:int) : MCSBust
      {
         var npc:XMLNpc = getNPCData(npcID);
         if(npc != null)
         {
            return npc.createBust();
         }
         return null;
      }
      
      public static function getNPCMCS(npcID:int) : MCSCharacter
      {
         var npc:XMLNpc = getNPCData(npcID);
         if(npc != null)
         {
            return npc.createMCS();
         }
         return null;
      }
      
      public static function getMapNodeData(mapID:int) : Vector.<XMLWorldNode>
      {
         var xmlWorldNode:XMLWorldNode = null;
         var list:Vector.<XMLWorldNode> = new Vector.<XMLWorldNode>();
         var max:int = int(nodeList.length);
         var lvl:int = StatsManager.getLevel();
         for(var i:int = 0; i < max; i++)
         {
            xmlWorldNode = nodeList[i];
            if(xmlWorldNode.map == mapID && xmlWorldNode.level <= lvl)
            {
               list.push(xmlWorldNode);
            }
         }
         return list;
      }
      
      public static function hasNodeData(nodeID:int) : XMLWorldNode
      {
         var xmlWorldNode:XMLWorldNode = null;
         var max:int = int(nodeList.length);
         for(var i:int = 0; i < max; i++)
         {
            xmlWorldNode = nodeList[i];
            if(xmlWorldNode.id == nodeID)
            {
               return xmlWorldNode;
            }
         }
         return null;
      }
      
      public static function getNodeData(nodeID:int) : XMLWorldNode
      {
         var xmlWorldNode:XMLWorldNode = null;
         var max:int = int(nodeList.length);
         for(var i:int = 0; i < max; i++)
         {
            xmlWorldNode = nodeList[i];
            if(xmlWorldNode.id == nodeID)
            {
               return xmlWorldNode;
            }
         }
         return NodeGenerator.getInstance().generateNode(nodeID >> 12 & 0x0FFF,nodeID & 0x0FFF);
      }
      
      public static function getShopData(nodeID:int) : XMLShopData
      {
         var nodeData:XMLWorldNode = getNodeData(nodeID);
         if(nodeData != null)
         {
            return nodeData.getShopData();
         }
         return null;
      }
      
      public static function getMapSquareID(x:int = 0, y:int = 0) : int
      {
         var xmlWorldMap:XMLWorldMap = null;
         var max:int = int(mapList.length);
         for(var i:int = 0; i < max; i++)
         {
            xmlWorldMap = mapList[i];
            if(xmlWorldMap.x == x && xmlWorldMap.y == y)
            {
               return mapList[i].id;
            }
         }
         return -1;
      }
      
      public static function getMapSquareData(mapID:int) : XMLWorldMap
      {
         var xmlWorldMap:XMLWorldMap = null;
         var max:int = int(mapList.length);
         for(var i:int = 0; i < max; i++)
         {
            xmlWorldMap = mapList[i];
            if(xmlWorldMap.id == mapID)
            {
               return xmlWorldMap;
            }
         }
         return null;
      }
      
      public static function getAchievement(achievementID:int) : XMLAchievement
      {
         if(achievementID >= achievementList.length)
         {
            return null;
         }
         return achievementList[achievementID];
      }
      
      public static function getAchievementScore() : int
      {
         var xmlAchievement:XMLAchievement = null;
         var score:int = 0;
         var max:int = int(achievementList.length);
         for(var i:int = 0; i < max; i++)
         {
            score += achievementList[i].getScore();
         }
         return score;
      }
      
      public static function getAchievementCompletedArray() : Array
      {
         var xmlAchievement:XMLAchievement = null;
         var output:Array = new Array();
         var max:int = int(achievementList.length);
         for(var i:int = 0; i < max; i++)
         {
            output[i] = achievementList[i].getScore();
         }
         return output;
      }
      
      public static function getMapBitmapData() : BitmapData
      {
         return mapBitmapData;
      }
      
      public static function hasTerritory(x:int, y:int) : *
      {
         return mapBitmapData.getPixel(x + WarSelectUI.TERRSHIFTX - 341 - WarSelectUI.WARMARKERSHIFTX,y + WarSelectUI.TERRSHIFTY - 341) != 0;
      }
      
      public static function startBattleMode(questStepData:XMLQuestStep, quest:int) : *
      {
         trace("startBattleMode()");
         Overworld.showOverworldMap(false);
         var startingPosX:int = 400;
         if(questStepData.action == 6)
         {
            startingPosX = 150;
         }
         GameEngine.initBattleMode(quest,questStepData.action,questStepData.bg,questStepData.stagewidth,questStepData.time,questStepData.wave,startingPosX);
      }
      
      public static function stopBattleMode() : void
      {
         trace("endBattleMode()");
         Overworld.endQuestStepIntro();
      }
      
      public static function startAdventureMode(currentID:int, newbieState:Boolean) : *
      {
         var roomData:Array = null;
         var action:int = 0;
         var roomPrivate:int = 0;
         trace("startExploreMode()");
         Overworld.showOverworldMap(false);
         var roomid:int = StatsManager.getStat(StatsManager.STAT_LOCATION_ROOM);
         var currentNode:XMLWorldNode = getNodeData(currentID);
         if(currentNode != null)
         {
            roomData = currentNode.getRoomData();
            action = GameEngine.ACTION_ADVENTURE;
            roomPrivate = int(roomData[roomid].isPrivate);
            if(roomPrivate == 9)
            {
               action = GameEngine.ACTION_PVPROOM;
            }
            if(roomData != null)
            {
               if(newbieState)
               {
                  GameEngine.initBattleMode(-1,action,roomData[roomid].getBG(),roomData[roomid].getWidth(),0,null,151,roomData);
               }
               else
               {
                  GameEngine.initBattleMode(-1,action,roomData[roomid].getBG(),roomData[roomid].getWidth(),0,null,roomData[roomid].enterx,roomData,roomid);
               }
            }
            if(newbieState && StatsManager.getStat(40000) == 0)
            {
               Overworld.startQuestStepIntro(0,0);
            }
            if(roomid == 0)
            {
               OverworldHUD.instance.showBigMap(true);
               OverworldHUD.instance.territorymap.setNodeId(currentID);
            }
            else
            {
               OverworldHUD.instance.showBigMap(false);
               Minimap.instance.setRoomId(currentID,roomid,roomData);
            }
         }
         else
         {
            trace("Error: QuestEngine.startExploreMode - node " + currentID + " not found");
         }
      }
   }
}

