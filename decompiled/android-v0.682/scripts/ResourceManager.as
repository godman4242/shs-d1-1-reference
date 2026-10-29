package
{
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.media.Sound;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   
   public class ResourceManager
   {
      
      internal static var RESOURCECOUNT:int = 5;
      
      internal static var resourceLoadCompletedFunctionArray:Array = new Array(RESOURCECOUNT);
      
      internal static var loadedArray:Array = new Array(RESOURCECOUNT);
      
      internal static var applicationDomainArray:Array = new Array(RESOURCECOUNT);
      
      internal static var loadQueue:Array = new Array();
      
      internal static var RESOURCE_BASE:int = 0;
      
      internal static var RESOURCE_MUSIC:int = 1;
      
      internal static var RESOURCE_SOUND:int = 2;
      
      internal static var RESOURCE_IMAGE:int = 3;
      
      internal static var RESOURCE_BG:int = 4;
      
      internal static var resourceFileNameArray:Array = ["shs3resource.swf","musicresource.swf","soundresource.swf","imageresource.swf","bgresource.swf"];
      
      public function ResourceManager()
      {
         super();
      }
      
      public static function init() : *
      {
         if(StatsManager.isMobile)
         {
            Mobile.instance.loadResource();
         }
         else
         {
            loadResource(RESOURCE_BASE);
            loadResource(RESOURCE_BG);
            loadResource(RESOURCE_IMAGE);
         }
      }
      
      public static function loadMusicResource() : *
      {
         if(!loadedArray[RESOURCE_MUSIC])
         {
            loadResource(RESOURCE_MUSIC);
         }
      }
      
      public static function loadSoundResource() : *
      {
         if(!loadedArray[RESOURCE_SOUND])
         {
            loadResource(RESOURCE_SOUND);
         }
      }
      
      public static function loadResource(num:int) : *
      {
         var variables:URLVariables = null;
         var server:String = "";
         var url:String = resourceFileNameArray[num];
         if(StatsManager.useExternalLang)
         {
            if(StatsManager.usePlayerIO)
            {
               url = QueryManagerPIO.instance.getResourceURL(url);
            }
            else
            {
               url = QueryManager.instance.server + "getresource.php";
            }
         }
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.BINARY;
         var urlrequest:URLRequest = new URLRequest(url);
         urlrequest.method = URLRequestMethod.POST;
         if(StatsManager.useExternalLang && StatsManager.usePlayerIO)
         {
            loader.load(urlrequest);
         }
         else
         {
            variables = new URLVariables();
            variables.pass = "12345";
            variables.num = num;
            urlrequest.data = variables;
            loader.load(urlrequest);
         }
         if(num == RESOURCE_BG)
         {
            loader.addEventListener(ProgressEvent.PROGRESS,loadProgress);
         }
         resourceLoadCompletedFunctionArray[num] = resourceLoadCompleted(num,loader);
         loader.addEventListener(Event.COMPLETE,resourceLoadCompletedFunctionArray[num]);
         loader.addEventListener(IOErrorEvent.IO_ERROR,ioErrorHandler);
      }
      
      internal static function ioErrorHandler(e:IOErrorEvent) : void
      {
         if(StatsManager.mainTimeLine.currentScene.name == "loading" && !StatsManager.mainTimeLine.messageDialog.visible)
         {
            StatsManager.mainTimeLine.messageDialog.showYesNoDialog("Network error. Please check that you are connected to the Internet.",function():*
            {
               init();
            },null,"Retry");
         }
      }
      
      internal static function loadProgress(e:ProgressEvent) : *
      {
         var pcent:int = Math.floor(e.bytesLoaded * 100 / e.bytesTotal);
         if(StatsManager.language == LangManager.CHINESE)
         {
            StatsManager.mainTimeLine.loadingScreen.loadertext.text = "载入中...";
         }
         else
         {
            StatsManager.mainTimeLine.loadingScreen.loadertext.text = "Loading art assets... ";
         }
         if(StatsManager.usePlayerIO)
         {
            StatsManager.mainTimeLine.loadingScreen.loadertext.appendText(pcent + "%");
         }
      }
      
      internal static function resourceLoadCompleted(num:int, loader:URLLoader) : Function
      {
         return function(event:Event):void
         {
            var ba:*;
            var payloadLoader:*;
            var loadercontext:*;
            var fileIndex:* = undefined;
            loader.removeEventListener(ProgressEvent.PROGRESS,loadProgress);
            loader.removeEventListener(IOErrorEvent.IO_ERROR,ioErrorHandler);
            loader.removeEventListener(Event.COMPLETE,resourceLoadCompletedFunctionArray[num]);
            resourceLoadCompletedFunctionArray[num] = null;
            ba = ByteArray(event.target.data);
            if(StatsManager.isMobile)
            {
               if(num == RESOURCE_BASE)
               {
                  fileIndex = StatsManager.FILE_SHS3RESOURCE;
               }
               else if(num == RESOURCE_MUSIC)
               {
                  fileIndex = StatsManager.FILE_MUSICRESOURCE;
               }
               else if(num == RESOURCE_SOUND)
               {
                  fileIndex = StatsManager.FILE_SOUNDRESOURCE;
               }
               else if(num == RESOURCE_IMAGE)
               {
                  fileIndex = StatsManager.FILE_IMAGERESOURCE;
               }
               else if(num == RESOURCE_BG)
               {
                  fileIndex = StatsManager.FILE_BGRESOURCE;
               }
               Mobile.instance.writeFile(ba,fileIndex);
            }
            if(StatsManager.encryptedResource)
            {
               ba = decryptByteArray(ba,resourceFileNameArray[num].charCodeAt(1));
            }
            payloadLoader = new Loader();
            loadercontext = new LoaderContext();
            loadercontext.applicationDomain = new ApplicationDomain();
            loadercontext.allowCodeImport = true;
            payloadLoader.loadBytes(ba,loadercontext);
            payloadLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,function(event:Event):*
            {
               successCallback(num,event.target.content.loaderInfo.applicationDomain);
            });
         };
      }
      
      internal static function decryptByteArray(source:ByteArray, key:int) : ByteArray
      {
         var temp:int = 0;
         var ba:ByteArray = new ByteArray();
         ba.writeBytes(source);
         for(var i:int = 3; i < 256; i++)
         {
            if(i % 11 == 0)
            {
               temp = int(ba[i]);
               ba[i] = ba[i + 256];
               ba[i + 256] = temp;
            }
            ba[i] ^= key;
         }
         ba.position = 0;
         return ba;
      }
      
      internal static function successCallback(num:int, applicationDomain:ApplicationDomain) : *
      {
         applicationDomainArray[num] = applicationDomain;
         loadedArray[num] = true;
         trace("resource library " + num.toString() + " loaded");
         if((Boolean(num == RESOURCE_BASE || num == RESOURCE_BG)) && Boolean(loadedArray[RESOURCE_BASE]) && Boolean(loadedArray[RESOURCE_BG]))
         {
            LangManager.setLanguage(StatsManager.language);
         }
         else if(num == RESOURCE_MUSIC)
         {
            MusicManager.getInstance().init();
         }
         else if(num == RESOURCE_SOUND)
         {
            SoundManager.getInstance().init();
         }
      }
      
      public static function getMCSComponent(partType:String, id:int) : MovieClip
      {
         if(!loadedArray[RESOURCE_BASE])
         {
            return null;
         }
         var applicationDomain:ApplicationDomain = applicationDomainArray[RESOURCE_BASE];
         var mcname:String = partType + id.toString();
         if(!applicationDomain.hasDefinition(mcname))
         {
            return null;
         }
         var cls:Class = applicationDomain.getDefinition(mcname) as Class;
         return new cls() as MovieClip;
      }
      
      public static function getAchievementImage(id:int) : MovieClip
      {
         if(!loadedArray[RESOURCE_BASE])
         {
            return null;
         }
         var applicationDomain:ApplicationDomain = applicationDomainArray[RESOURCE_BASE];
         var mcname:String = "achievement" + id.toString();
         if(!applicationDomain.hasDefinition(mcname))
         {
            mcname = "achievement1";
         }
         var cls:Class = applicationDomain.getDefinition(mcname) as Class;
         return new cls() as MovieClip;
      }
      
      public static function getCutsceneImage(id:String) : MovieClip
      {
         if(!loadedArray[RESOURCE_IMAGE])
         {
            return null;
         }
         var applicationDomain:ApplicationDomain = applicationDomainArray[RESOURCE_IMAGE];
         var mcname:String = "image" + id;
         if(!applicationDomain.hasDefinition(mcname))
         {
            return null;
         }
         var cls:Class = applicationDomain.getDefinition(mcname) as Class;
         return new cls() as MovieClip;
      }
      
      public static function getPortrait(id:String) : MovieClip
      {
         if(!loadedArray[RESOURCE_IMAGE])
         {
            return null;
         }
         var applicationDomain:ApplicationDomain = applicationDomainArray[RESOURCE_IMAGE];
         var mcname:String = "portrait_" + id;
         if(!applicationDomain.hasDefinition(mcname))
         {
            return null;
         }
         var cls:Class = applicationDomain.getDefinition(mcname) as Class;
         return new cls() as MovieClip;
      }
      
      public static function getSkillImage(id:int) : MovieClip
      {
         if(!loadedArray[RESOURCE_BASE])
         {
            return null;
         }
         var applicationDomain:ApplicationDomain = applicationDomainArray[RESOURCE_BASE];
         var mcname:String = "skill" + id.toString();
         if(!applicationDomain.hasDefinition(mcname))
         {
            return null;
         }
         var cls:Class = applicationDomain.getDefinition(mcname) as Class;
         return new cls() as MovieClip;
      }
      
      public static function getMap(num:int) : MovieClip
      {
         var cls:Class = null;
         var clsObj:MovieClip = null;
         if(!loadedArray[RESOURCE_BASE])
         {
            return null;
         }
         var applicationDomain:ApplicationDomain = applicationDomainArray[RESOURCE_BASE];
         var id:String = "Map" + num.toString();
         if(!applicationDomain.hasDefinition(id))
         {
            id = "CloudsMap";
         }
         cls = applicationDomain.getDefinition(id) as Class;
         return new cls() as MovieClip;
      }
      
      public static function getBG(id:String) : MovieClip
      {
         var cls:Class = null;
         if(!loadedArray[RESOURCE_BG])
         {
            return null;
         }
         var applicationDomain:ApplicationDomain = applicationDomainArray[RESOURCE_BG];
         if(!applicationDomain.hasDefinition(id))
         {
            id = "BG_Forest";
         }
         cls = applicationDomain.getDefinition(id) as Class;
         return new cls() as MovieClip;
      }
      
      public static function getMusic(id:String) : Sound
      {
         var cls:Class = null;
         if(!loadedArray[RESOURCE_MUSIC])
         {
            return null;
         }
         var applicationDomain:ApplicationDomain = applicationDomainArray[RESOURCE_MUSIC];
         if(!applicationDomain.hasDefinition(id))
         {
            return null;
         }
         cls = applicationDomain.getDefinition(id) as Class;
         return new cls() as Sound;
      }
      
      public static function getSound(id:String) : Sound
      {
         var cls:Class = null;
         if(!loadedArray[RESOURCE_SOUND])
         {
            return null;
         }
         var applicationDomain:ApplicationDomain = applicationDomainArray[RESOURCE_SOUND];
         if(!applicationDomain.hasDefinition(id))
         {
            return null;
         }
         cls = applicationDomain.getDefinition(id) as Class;
         return new cls() as Sound;
      }
   }
}

