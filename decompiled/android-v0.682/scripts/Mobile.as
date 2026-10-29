package
{
   import fl.lang.Locale;
   import flash.desktop.NativeApplication;
   import flash.desktop.SystemIdleMode;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.filesystem.*;
   import flash.net.SharedObject;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   
   public class Mobile extends MovieClip
   {
      
      internal static var instance:Mobile;
      
      internal static const MapData:Class = Mobile_MapData;
      
      internal static const AchievementData:Class = Mobile_AchievementData;
      
      internal static const NodeData:Class = Mobile_NodeData;
      
      internal static const QuestData:Class = Mobile_QuestData;
      
      internal static const ItemData:Class = Mobile_ItemData;
      
      internal static const NpcData:Class = Mobile_NpcData;
      
      internal static const SkillData:Class = Mobile_SkillData;
      
      internal static const BGData:Class = Mobile_BGData;
      
      internal static const PremiumData:Class = Mobile_PremiumData;
      
      internal static const MapBitmapData:Class = Mobile_MapBitmapData;
      
      internal static const BGResource:Class = Mobile_BGResource;
      
      internal static const ImageResource:Class = Mobile_ImageResource;
      
      internal static const MusicResource:Class = Mobile_MusicResource;
      
      internal static const SHS3Resource:Class = Mobile_SHS3Resource;
      
      internal static const SoundResource:Class = Mobile_SoundResource;
      
      internal static const Lang_EN:Class = Mobile_Lang_EN;
      
      internal var parentMobile:MovieClip;
      
      internal var localVersionArray:Array;
      
      internal var versionArray:Array;
      
      internal var fileNameArray:Array;
      
      internal var versionLoader:URLLoader;
      
      internal var hasUpdateVersionInfo:Boolean = false;
      
      public function Mobile()
      {
         super();
         instance = this;
      }
      
      public static function getInstance() : Mobile
      {
         if(instance == null)
         {
            new Mobile();
         }
         return instance;
      }
      
      public function init() : *
      {
         this.parentMobile = MovieClip(StatsManager.mainTimeLine.stage.getChildAt(0)).initBridge(this);
         NativeApplication.nativeApplication.addEventListener(Event.ACTIVATE,this.handleMobileActivate,false,0,true);
         NativeApplication.nativeApplication.addEventListener(Event.DEACTIVATE,this.handleMobileDeactivate,false,0,true);
         NativeApplication.nativeApplication.systemIdleMode = SystemIdleMode.KEEP_AWAKE;
      }
      
      public function handleMobileDeactivate(event:Event) : *
      {
         trace("Mobile.handleMobileDeactivate");
         if(!(OverworldHUD.instance != null && OverworldHUD.instance.payUI.visible))
         {
            if(!(this.parentMobile != null && Boolean(this.parentMobile.FBloggingIn)))
            {
               trace("Mobile.handleMobileDeactivate_run");
               GameEngine.stopEngine();
               if(StatsManager.usePlayerIO && NetworkManager.instance != null)
               {
                  NetworkManager.instance.disconnectGlobalPIO();
                  NetworkManager.instance.disconnectChatPIO();
               }
               NativeApplication.nativeApplication.exit();
            }
         }
      }
      
      internal function handleMobileActivate(event:Event) : *
      {
         trace("Mobile.handleMobileActivate");
         if(GameEngine.getStageMC().frameRate == 0)
         {
            trace("Mobile.handleMobileActivate_run");
            NativeApplication.nativeApplication.systemIdleMode = SystemIdleMode.KEEP_AWAKE;
            GameEngine.getStageMC().frameRate = 24;
            SoundManager.instance.continueMusic();
         }
      }
      
      public function getOverworldHUD() : OverworldHUD
      {
         return OverworldHUD.instance;
      }
      
      public function getQueryManagerPIO() : QueryManagerPIO
      {
         return QueryManagerPIO.instance;
      }
      
      public function loginFacebook() : *
      {
         if(this.parentMobile != null)
         {
            this.parentMobile.loginFacebook();
         }
      }
      
      public function initIAP() : *
      {
         if(this.parentMobile != null)
         {
            this.parentMobile.initIAP();
         }
      }
      
      public function makePurchase(option:int) : *
      {
         if(this.parentMobile != null)
         {
            this.parentMobile.makePurchase(option);
         }
      }
      
      public function updateDataFileVersionInfo() : *
      {
         var i:int = 0;
         var changed:Boolean = false;
         var versionInfoArray:Array = null;
         this.fileNameArray = new Array();
         this.fileNameArray[StatsManager.FILE_MAPDATA] = "mapdata.xml";
         this.fileNameArray[StatsManager.FILE_ACHIEVEMENTDATA] = "achievementdata.xml";
         this.fileNameArray[StatsManager.FILE_NODEDATA] = "nodedata.xml";
         this.fileNameArray[StatsManager.FILE_QUESTDATA] = "questdata.xml";
         this.fileNameArray[StatsManager.FILE_ITEMDATA] = "itemdata.xml";
         this.fileNameArray[StatsManager.FILE_NPCDATA] = "npcdata.xml";
         this.fileNameArray[StatsManager.FILE_SKILLDATA] = "skilldata.xml";
         this.fileNameArray[StatsManager.FILE_BGDATA] = "bgdata.xml";
         this.fileNameArray[StatsManager.FILE_PREMIUMDATA] = "premiumdata.xml";
         this.fileNameArray[StatsManager.FILE_MAPBITMAPDATA] = "map.gif";
         this.fileNameArray[StatsManager.FILE_BGRESOURCE] = "bgresource.swf";
         this.fileNameArray[StatsManager.FILE_IMAGERESOURCE] = "imageresource.swf";
         this.fileNameArray[StatsManager.FILE_MUSICRESOURCE] = "musicresource.swf";
         this.fileNameArray[StatsManager.FILE_SHS3RESOURCE] = "shs3resource.swf";
         this.fileNameArray[StatsManager.FILE_SOUNDRESOURCE] = "soundresource.swf";
         this.fileNameArray[StatsManager.FILE_LANG_EN] = "shs3_en.xml";
         this.fileNameArray[StatsManager.FILE_LANG_ZHCN] = "shs3_zh-CN.xml";
         this.fileNameArray[StatsManager.FILE_LANG_JA] = "shs3_ja.xml";
         this.versionArray = new Array();
         this.localVersionArray = new Array();
         for(i = 0; i < StatsManager.TOTALFILECOUNT; i++)
         {
            this.versionArray[i] = 0;
            this.localVersionArray[i] = StatsManager.embeddedVersionArray[i];
         }
         var sharedObject:SharedObject = SharedObject.getLocal(StatsManager.cookieName);
         if(sharedObject.data.versionInfo != undefined)
         {
            changed = false;
            versionInfoArray = sharedObject.data.versionInfo;
            for(i = 0; i < StatsManager.TOTALFILECOUNT; i++)
            {
               if(versionInfoArray[this.fileNameArray[i]] > StatsManager.embeddedVersionArray[i] && !File.applicationStorageDirectory.resolvePath(this.fileNameArray[i]).exists)
               {
                  trace("Mobile.updateDataFileVersionInfo:file missing",i);
                  versionInfoArray[this.fileNameArray[i]] = StatsManager.embeddedVersionArray[i];
                  changed = true;
               }
               this.localVersionArray[i] = versionInfoArray[this.fileNameArray[i]];
            }
            if(changed)
            {
               sharedObject.data.versionInfo = versionInfoArray;
               sharedObject.flush();
            }
         }
         else
         {
            trace("Mobile.updateDataFileVersionInfo:version cookie undefined");
            for(i = 0; i < StatsManager.TOTALFILECOUNT; i++)
            {
               this.localVersionArray[i] = StatsManager.embeddedVersionArray[i];
            }
         }
         var versionUrl:String = "http://r.playerio.com/r/straw-hat-samurai-duels-5nsekxalfuoiuqdxrmtxw/liveupdate/shs3_data_version.swf";
         this.versionLoader = new URLLoader();
         this.versionLoader.addEventListener(Event.COMPLETE,this.loadVersion);
         this.versionLoader.addEventListener(IOErrorEvent.IO_ERROR,this.loadVersionError);
         this.versionLoader.dataFormat = URLLoaderDataFormat.TEXT;
         this.versionLoader.load(new URLRequest(versionUrl));
      }
      
      internal function loadVersion(e:Event) : *
      {
         var innerStrArray:Array = null;
         this.versionLoader.removeEventListener(Event.COMPLETE,this.loadVersion);
         this.versionLoader.removeEventListener(IOErrorEvent.IO_ERROR,this.loadVersionError);
         this.versionLoader = null;
         var versionInfo:Object = new Object();
         var strArray:Array = e.target.data.split("\n");
         var max:int = int(strArray.length);
         for(var i:int = 0; i < max; i++)
         {
            innerStrArray = strArray[i].split("=");
            if(innerStrArray.length == 2)
            {
               versionInfo[innerStrArray[0]] = Number(innerStrArray[1]);
            }
         }
         this.versionArray[StatsManager.FILE_MAPDATA] = versionInfo.mapdata;
         this.versionArray[StatsManager.FILE_ACHIEVEMENTDATA] = versionInfo.achievementdata;
         this.versionArray[StatsManager.FILE_NODEDATA] = versionInfo.nodedata;
         this.versionArray[StatsManager.FILE_QUESTDATA] = versionInfo.questdata;
         this.versionArray[StatsManager.FILE_ITEMDATA] = versionInfo.itemdata;
         this.versionArray[StatsManager.FILE_NPCDATA] = versionInfo.npcdata;
         this.versionArray[StatsManager.FILE_SKILLDATA] = versionInfo.skilldata;
         this.versionArray[StatsManager.FILE_BGDATA] = versionInfo.bgdata;
         this.versionArray[StatsManager.FILE_PREMIUMDATA] = versionInfo.premiumdata;
         this.versionArray[StatsManager.FILE_MAPBITMAPDATA] = versionInfo.mapbitmapdata;
         this.versionArray[StatsManager.FILE_BGRESOURCE] = versionInfo.bgresource;
         this.versionArray[StatsManager.FILE_IMAGERESOURCE] = versionInfo.imageresource;
         this.versionArray[StatsManager.FILE_MUSICRESOURCE] = versionInfo.musicresource;
         this.versionArray[StatsManager.FILE_SHS3RESOURCE] = versionInfo.shs3resource;
         this.versionArray[StatsManager.FILE_SOUNDRESOURCE] = versionInfo.soundresource;
         this.versionArray[StatsManager.FILE_LANG_EN] = versionInfo.lang_en;
         this.versionArray[StatsManager.FILE_LANG_ZHCN] = versionInfo.lang_zhcn;
         this.versionArray[StatsManager.FILE_LANG_JA] = versionInfo.lang_ja;
         this.hasUpdateVersionInfo = true;
         this.loadResource();
      }
      
      internal function loadVersionError(e:Event) : *
      {
         this.versionLoader.removeEventListener(Event.COMPLETE,this.loadVersion);
         this.versionLoader.removeEventListener(IOErrorEvent.IO_ERROR,this.loadVersionError);
         this.versionLoader = null;
         ResourceManager.ioErrorHandler(null);
      }
      
      public function loadResource() : *
      {
         var fileId:int = 0;
         var resourceIndex:int = 0;
         var filename:String = null;
         if(!this.hasUpdateVersionInfo)
         {
            this.updateDataFileVersionInfo();
            return;
         }
         var max:int = int(StatsManager.resourceFileIdArray.length);
         for(var j:int = 0; j < max; j++)
         {
            fileId = int(StatsManager.resourceFileIdArray[j]);
            if(fileId == StatsManager.FILE_BGRESOURCE)
            {
               resourceIndex = ResourceManager.RESOURCE_BG;
            }
            else if(fileId == StatsManager.FILE_IMAGERESOURCE)
            {
               resourceIndex = ResourceManager.RESOURCE_IMAGE;
            }
            else if(fileId == StatsManager.FILE_MUSICRESOURCE)
            {
               resourceIndex = ResourceManager.RESOURCE_MUSIC;
            }
            else if(fileId == StatsManager.FILE_SHS3RESOURCE)
            {
               resourceIndex = ResourceManager.RESOURCE_BASE;
            }
            else if(fileId == StatsManager.FILE_SOUNDRESOURCE)
            {
               resourceIndex = ResourceManager.RESOURCE_SOUND;
            }
            if(this.localVersionArray[fileId] >= this.versionArray[fileId])
            {
               filename = this.fileNameArray[fileId];
               if(File.applicationStorageDirectory.resolvePath(filename).exists)
               {
                  trace("Mobile.loadResource:cached",fileId);
                  this.processResource(this.readFile(filename),resourceIndex);
               }
               else
               {
                  trace("Mobile.loadResource:embedded",fileId);
                  if(fileId == StatsManager.FILE_BGRESOURCE)
                  {
                     this.processResource(ByteArray(new BGResource()),resourceIndex);
                  }
                  else if(fileId == StatsManager.FILE_IMAGERESOURCE)
                  {
                     this.processResource(ByteArray(new ImageResource()),resourceIndex);
                  }
                  else if(fileId == StatsManager.FILE_MUSICRESOURCE)
                  {
                     this.processResource(ByteArray(new MusicResource()),resourceIndex);
                  }
                  else if(fileId == StatsManager.FILE_SHS3RESOURCE)
                  {
                     this.processResource(ByteArray(new SHS3Resource()),resourceIndex);
                  }
                  else if(fileId == StatsManager.FILE_SOUNDRESOURCE)
                  {
                     this.processResource(ByteArray(new SoundResource()),resourceIndex);
                  }
               }
            }
            else
            {
               trace("Mobile.loadResource:download",fileId);
               ResourceManager.loadResource(resourceIndex);
            }
         }
      }
      
      internal function processResource(ba:ByteArray, resourceIndex:int) : *
      {
         var payloadLoader:Loader;
         var loadercontext:LoaderContext;
         if(StatsManager.encryptedResource)
         {
            ba = ResourceManager.decryptByteArray(ba,ResourceManager.resourceFileNameArray[resourceIndex].charCodeAt(1));
         }
         payloadLoader = new Loader();
         loadercontext = new LoaderContext();
         loadercontext.applicationDomain = new ApplicationDomain();
         loadercontext.allowCodeImport = true;
         payloadLoader.loadBytes(ba,loadercontext);
         payloadLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,function(event:Event):*
         {
            ResourceManager.successCallback(resourceIndex,event.target.content.loaderInfo.applicationDomain);
         });
      }
      
      public function loadXML() : *
      {
         var fileId:int = 0;
         var filename:String = null;
         var myLoader:Loader = null;
         var max:int = int(StatsManager.xmlFileIdArray.length);
         for(var j:int = 0; j < max; j++)
         {
            fileId = int(StatsManager.xmlFileIdArray[j]);
            if(this.localVersionArray[fileId] >= this.versionArray[fileId])
            {
               filename = this.fileNameArray[fileId];
               if(File.applicationStorageDirectory.resolvePath(filename).exists)
               {
                  trace("Mobile.loadXML:cached",fileId);
                  if(fileId == StatsManager.FILE_MAPDATA)
                  {
                     QuestEngine.loadMapData(this.readXMLFile(filename));
                  }
                  else if(fileId == StatsManager.FILE_ACHIEVEMENTDATA)
                  {
                     QuestEngine.loadAchievementData(this.readXMLFile(filename));
                  }
                  else if(fileId == StatsManager.FILE_NODEDATA)
                  {
                     QuestEngine.loadNodeData(this.readXMLFile(filename));
                  }
                  else if(fileId == StatsManager.FILE_QUESTDATA)
                  {
                     QuestEngine.loadQuestData(this.readXMLFile(filename));
                  }
                  else if(fileId == StatsManager.FILE_ITEMDATA)
                  {
                     QuestEngine.loadItemData(this.readXMLFile(filename));
                  }
                  else if(fileId == StatsManager.FILE_NPCDATA)
                  {
                     QuestEngine.loadNpcData(this.readXMLFile(filename));
                  }
                  else if(fileId == StatsManager.FILE_SKILLDATA)
                  {
                     QuestEngine.loadSkillData(this.readXMLFile(filename));
                  }
                  else if(fileId == StatsManager.FILE_BGDATA)
                  {
                     QuestEngine.loadBGData(this.readXMLFile(filename));
                  }
                  else if(fileId == StatsManager.FILE_PREMIUMDATA)
                  {
                     QuestEngine.loadPremiumData(this.readXMLFile(filename));
                  }
                  else if(fileId == StatsManager.FILE_MAPBITMAPDATA)
                  {
                     myLoader = new Loader();
                     myLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,QuestEngine.processMapBitmapData);
                     myLoader.loadBytes(this.readFile(filename));
                  }
               }
               else
               {
                  trace("Mobile.loadXML:embedded",fileId);
                  if(fileId == StatsManager.FILE_MAPDATA)
                  {
                     QuestEngine.loadMapData(XML(new MapData()));
                  }
                  else if(fileId == StatsManager.FILE_ACHIEVEMENTDATA)
                  {
                     QuestEngine.loadAchievementData(XML(new AchievementData()));
                  }
                  else if(fileId == StatsManager.FILE_NODEDATA)
                  {
                     QuestEngine.loadNodeData(XML(new NodeData()));
                  }
                  else if(fileId == StatsManager.FILE_QUESTDATA)
                  {
                     QuestEngine.loadQuestData(XML(new QuestData()));
                  }
                  else if(fileId == StatsManager.FILE_ITEMDATA)
                  {
                     QuestEngine.loadItemData(XML(new ItemData()));
                  }
                  else if(fileId == StatsManager.FILE_NPCDATA)
                  {
                     QuestEngine.loadNpcData(XML(new NpcData()));
                  }
                  else if(fileId == StatsManager.FILE_SKILLDATA)
                  {
                     QuestEngine.loadSkillData(XML(new SkillData()));
                  }
                  else if(fileId == StatsManager.FILE_BGDATA)
                  {
                     QuestEngine.loadBGData(XML(new BGData()));
                  }
                  else if(fileId == StatsManager.FILE_PREMIUMDATA)
                  {
                     QuestEngine.loadPremiumData(XML(new PremiumData()));
                  }
                  else if(fileId == StatsManager.FILE_MAPBITMAPDATA)
                  {
                     myLoader = new Loader();
                     myLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,QuestEngine.processMapBitmapData);
                     myLoader.loadBytes(new MapBitmapData());
                  }
               }
               if(fileId != StatsManager.FILE_MAPBITMAPDATA)
               {
                  QuestEngine.checkALLXMLCompleted();
               }
            }
            else
            {
               trace("Mobile.loadXML:download",fileId);
               if(fileId == StatsManager.FILE_MAPDATA)
               {
                  QuestEngine.loadExternalMapDataXML();
               }
               else if(fileId == StatsManager.FILE_ACHIEVEMENTDATA)
               {
                  QuestEngine.loadExternalAchievementDataXML();
               }
               else if(fileId == StatsManager.FILE_NODEDATA)
               {
                  QuestEngine.loadExternalNodeDataXML();
               }
               else if(fileId == StatsManager.FILE_QUESTDATA)
               {
                  QuestEngine.loadExternalQuestDataXML();
               }
               else if(fileId == StatsManager.FILE_ITEMDATA)
               {
                  QuestEngine.loadExternalItemDataXML();
               }
               else if(fileId == StatsManager.FILE_NPCDATA)
               {
                  QuestEngine.loadExternalNpcDataXML();
               }
               else if(fileId == StatsManager.FILE_SKILLDATA)
               {
                  QuestEngine.loadExternalSkillDataXML();
               }
               else if(fileId == StatsManager.FILE_BGDATA)
               {
                  QuestEngine.loadExternalBGDataXML();
               }
               else if(fileId == StatsManager.FILE_PREMIUMDATA)
               {
                  QuestEngine.loadExternalPremiumDataXML();
               }
               else if(fileId == StatsManager.FILE_MAPBITMAPDATA)
               {
                  QuestEngine.loadExternalMapBitmapData();
               }
            }
         }
      }
      
      public function loadLanguage(id:String, server:String) : *
      {
         var fileId:int = 0;
         var loader:URLLoader = null;
         var needToDownload:Boolean = true;
         if(id == LangManager.ENGLISH)
         {
            fileId = StatsManager.FILE_LANG_EN;
         }
         else if(id == LangManager.CHINESE)
         {
            fileId = StatsManager.FILE_LANG_ZHCN;
         }
         else if(id == LangManager.JAPANESE)
         {
            fileId = StatsManager.FILE_LANG_JA;
         }
         if(this.localVersionArray[fileId] >= this.versionArray[fileId])
         {
            if(File.applicationStorageDirectory.resolvePath(this.fileNameArray[fileId]).exists)
            {
               trace("loadLanguage: cached");
               Locale.addXMLPath(id,File.applicationStorageDirectory.resolvePath(this.fileNameArray[fileId]).nativePath);
               Locale.loadLanguageXML(id,LangManager.onLanguageLoad);
               needToDownload = false;
            }
            else if(id == LangManager.ENGLISH)
            {
               trace("loadLanguage: cache embedded");
               this.writeFile(ByteArray(new Lang_EN()),fileId);
               Locale.addXMLPath(id,File.applicationStorageDirectory.resolvePath(this.fileNameArray[fileId]).nativePath);
               Locale.loadLanguageXML(id,LangManager.onLanguageLoad);
               needToDownload = false;
            }
         }
         if(needToDownload)
         {
            trace("loadLanguage: download");
            loader = new URLLoader();
            loader.dataFormat = URLLoaderDataFormat.BINARY;
            loader.addEventListener(Event.COMPLETE,function(e:Event):*
            {
               writeFile(ByteArray(e.target.data),fileId);
               Locale.addXMLPath(id,File.applicationStorageDirectory.resolvePath(fileNameArray[fileId]).nativePath);
               Locale.loadLanguageXML(id,LangManager.onLanguageLoad);
            });
            loader.addEventListener(IOErrorEvent.IO_ERROR,function(e:Error):*
            {
               trace("loadLanguage: error, using embedded EN");
               writeFile(ByteArray(new Lang_EN()),fileId);
               Locale.addXMLPath(id,File.applicationStorageDirectory.resolvePath(fileNameArray[fileId]).nativePath);
               Locale.loadLanguageXML(id,LangManager.onLanguageLoad);
            });
            loader.load(new URLRequest(server + this.fileNameArray[fileId]));
         }
      }
      
      public function writeFile(fileData:ByteArray, fileIndex:int, xmlData:String = "") : *
      {
         var array:Array = null;
         var i:int = 0;
         var file:File = File.applicationStorageDirectory.resolvePath(this.fileNameArray[fileIndex]);
         trace("Mobile.writeFile",fileIndex,file.nativePath);
         var fileStream:FileStream = new FileStream();
         fileStream.open(file,FileMode.WRITE);
         if(xmlData == "")
         {
            fileStream.writeBytes(fileData,0,fileData.length);
         }
         else
         {
            fileStream.writeUTFBytes(xmlData);
         }
         fileStream.close();
         var sharedObject:SharedObject = SharedObject.getLocal(StatsManager.cookieName);
         if(sharedObject.data.versionInfo == undefined)
         {
            array = new Array();
            for(i = 0; i < StatsManager.TOTALFILECOUNT; i++)
            {
               array[this.fileNameArray[i]] = StatsManager.embeddedVersionArray[i];
            }
            sharedObject.data.versionInfo = array;
         }
         sharedObject.data.versionInfo[this.fileNameArray[fileIndex]] = this.versionArray[fileIndex];
         sharedObject.flush();
      }
      
      public function writeXMLFile(fileData:String, fileIndex:int) : *
      {
         this.writeFile(null,fileIndex,fileData);
      }
      
      internal function readFile(filename:String) : ByteArray
      {
         var file:File = File.applicationStorageDirectory.resolvePath(filename);
         var fileStream:FileStream = new FileStream();
         fileStream.open(file,FileMode.READ);
         var fileData:ByteArray = new ByteArray();
         fileStream.readBytes(fileData);
         fileStream.close();
         return fileData;
      }
      
      internal function readXMLFile(filename:String) : XML
      {
         var byteArray:ByteArray = this.readFile(filename);
         return XML(byteArray.readUTFBytes(byteArray.length));
      }
      
      public function whipFlashReport(engagementId:int) : *
      {
         if(this.parentMobile != null)
         {
            this.parentMobile.whipFlashReport(engagementId);
         }
      }
   }
}

