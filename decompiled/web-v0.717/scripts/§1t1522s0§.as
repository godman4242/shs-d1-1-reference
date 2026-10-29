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
   
   public class §1t1522s0§
   {
      
      internal static var §1t9293s0§:int = 6;
      
      internal static var §1t9294s0§:Array = new Array(§1t9293s0§);
      
      internal static var §1t9295s0§:Array = new Array(§1t9293s0§);
      
      internal static var §1t9296s0§:Array = new Array(§1t9293s0§);
      
      internal static var §1t9297s0§:Array = new Array();
      
      internal static var §1t9298s0§:int = 0;
      
      internal static var §1t9299s0§:int = 1;
      
      internal static var §1t9300s0§:int = 2;
      
      internal static var §1t9301s0§:int = 3;
      
      internal static var §1t9302s0§:int = 4;
      
      internal static var §1t9303s0§:int = 5;
      
      internal static var §1t9304s0§:int = 6;
      
      internal static var §1t9305s0§:int = 7;
      
      internal static var §1t9306s0§:Array = [§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8976s0§),§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8977s0§),§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8978s0§),§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8979s0§),§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8980s0§),§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8981s0§),§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8982s0§),§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9061s0§)];
      
      public function §1t1522s0§()
      {
         super();
      }
      
      public static function init() : *
      {
         if(§1t1523s0§.§1t9528s0§)
         {
            §1t135s0§.instance.§1t1792s0§();
         }
         else
         {
            §1t1792s0§(§1t9298s0§);
            §1t1792s0§(§1t9302s0§);
            §1t1792s0§(§1t9301s0§);
            §1t1792s0§(§1t9303s0§);
         }
      }
      
      public static function §1t9307s0§() : *
      {
         if(!§1t9295s0§[§1t9299s0§])
         {
            §1t1792s0§(§1t9299s0§);
         }
      }
      
      public static function §1t9308s0§() : *
      {
         if(!§1t9295s0§[§1t9300s0§])
         {
            §1t1792s0§(§1t9300s0§);
         }
      }
      
      public static function §1t1792s0§(param1:int) : *
      {
         var _loc6_:URLVariables = null;
         var _loc2_:String = "";
         var _loc3_:String = §1t9306s0§[param1];
         if(§1t1521s0§.getLanguage() != §1t1521s0§.§1t9271s0§)
         {
            if(param1 == §1t9301s0§)
            {
               _loc3_ = §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8983s0§) + §1t1521s0§.getLanguage() + §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8984s0§);
            }
         }
         if(§1t1523s0§.§1t9495s0§)
         {
            if(§1t1523s0§.§1t9503s0§)
            {
               _loc3_ = §1t3318s0§.instance.§1t3329s0§(_loc3_);
            }
            else
            {
               _loc3_ = §1t3317s0§.instance.server + "getresource.php";
            }
         }
         var _loc4_:URLLoader = new URLLoader();
         _loc4_.dataFormat = URLLoaderDataFormat.BINARY;
         var _loc5_:URLRequest = new URLRequest(_loc3_);
         _loc5_.method = URLRequestMethod.POST;
         if(param1 == §1t9302s0§)
         {
            _loc4_.addEventListener(ProgressEvent.PROGRESS,§1t9310s0§);
         }
         §1t9294s0§[param1] = §1t9311s0§(param1,_loc4_);
         _loc4_.addEventListener(Event.COMPLETE,§1t9294s0§[param1]);
         _loc4_.addEventListener(IOErrorEvent.IO_ERROR,§1t9309s0§);
         if(§1t1523s0§.§1t9495s0§ && §1t1523s0§.§1t9503s0§)
         {
            _loc4_.load(_loc5_);
         }
         else
         {
            _loc6_ = new URLVariables();
            _loc6_.pass = "12345";
            _loc6_.num = param1;
            _loc5_.data = _loc6_;
            _loc4_.load(_loc5_);
         }
      }
      
      internal static function §1t9309s0§(param1:IOErrorEvent) : void
      {
         var e:IOErrorEvent = param1;
         if(§1t1523s0§.§1t9365s0§.currentScene.name == "loading" && !§1t1523s0§.§1t9365s0§.§1t8078s0§.visible)
         {
            §1t1523s0§.§1t9365s0§.§1t8078s0§.§1t5481s0§("Network error. Please check that you are connected to the Internet or try again later.",function():*
            {
               init();
            },null,"Retry");
         }
      }
      
      internal static function §1t9310s0§(param1:ProgressEvent) : *
      {
         var _loc2_:int = Math.floor(param1.bytesLoaded * 100 / param1.bytesTotal);
         §1t1523s0§.§1t9365s0§.§1t1039s0§.§1t6113s0§.text = §1t1521s0§.getString(11068,[_loc2_.toString()]);
      }
      
      internal static function §1t9311s0§(param1:int, param2:URLLoader) : Function
      {
         var num:int = param1;
         var loader:URLLoader = param2;
         return function(param1:Event):void
         {
            var ba:*;
            var payloadLoader:*;
            var loadercontext:*;
            var fileIndex:* = undefined;
            var event:Event = param1;
            loader.removeEventListener(ProgressEvent.PROGRESS,§1t9310s0§);
            loader.removeEventListener(IOErrorEvent.IO_ERROR,§1t9309s0§);
            loader.removeEventListener(Event.COMPLETE,§1t9294s0§[num]);
            §1t9294s0§[num] = null;
            ba = ByteArray(event.target.data);
            if(§1t1523s0§.§1t9528s0§)
            {
               if(num == §1t9298s0§)
               {
                  fileIndex = §1t1523s0§.§1t9338s0§;
               }
               else if(num == §1t9299s0§)
               {
                  fileIndex = §1t1523s0§.§1t9337s0§;
               }
               else if(num == §1t9300s0§)
               {
                  fileIndex = §1t1523s0§.§1t9339s0§;
               }
               else if(num == §1t9301s0§)
               {
                  fileIndex = §1t1523s0§.§1t9336s0§;
               }
               else if(num == §1t9303s0§)
               {
                  fileIndex = §1t1523s0§.§1t9340s0§;
               }
               else if(num == §1t9302s0§)
               {
                  fileIndex = §1t1523s0§.§1t9335s0§;
               }
               else if(num == §1t9305s0§)
               {
                  fileIndex = §1t1523s0§.§1t9346s0§;
               }
               §1t135s0§.instance.§1t1795s0§(ba,fileIndex);
            }
            if(§1t1523s0§.§1t9507s0§ && num != §1t9304s0§)
            {
               ba = §1t9312s0§(ba,§1t9306s0§[num].charCodeAt(1));
            }
            payloadLoader = new Loader();
            loadercontext = new LoaderContext();
            if(§1t1523s0§.§1t9527s0§)
            {
               loadercontext.applicationDomain = ApplicationDomain.currentDomain;
            }
            else
            {
               loadercontext.applicationDomain = new ApplicationDomain();
            }
            loadercontext.allowCodeImport = true;
            payloadLoader.loadBytes(ba,loadercontext);
            payloadLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,function(param1:Event):*
            {
               §1t9313s0§(num,param1.target.content.loaderInfo.applicationDomain);
            });
         };
      }
      
      internal static function §1t9312s0§(param1:ByteArray, param2:int) : ByteArray
      {
         var _loc5_:int = 0;
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeBytes(param1);
         var _loc4_:int = 3;
         while(_loc4_ < 256)
         {
            if(_loc4_ % 11 == 0)
            {
               _loc5_ = int(_loc3_[_loc4_]);
               _loc3_[_loc4_] = _loc3_[_loc4_ + 256];
               _loc3_[_loc4_ + 256] = _loc5_;
            }
            _loc3_[_loc4_] ^= param2;
            _loc4_++;
         }
         _loc3_.position = 0;
         return _loc3_;
      }
      
      internal static function §1t9313s0§(param1:int, param2:ApplicationDomain) : *
      {
         §1t9296s0§[param1] = param2;
         §1t9295s0§[param1] = true;
         if((Boolean(param1 == §1t9298s0§ || param1 == §1t9302s0§ || param1 == §1t9301s0§)) && Boolean(§1t9295s0§[§1t9298s0§]) && Boolean(§1t9295s0§[§1t9302s0§]) && Boolean(§1t9295s0§[§1t9301s0§]) && §1t1524s0§.§1t9856s0§ == 0)
         {
            §1t1524s0§.init();
         }
         else if(param1 == §1t9299s0§)
         {
            §1t133s0§.§1t9190s0§().init();
         }
         else if(param1 == §1t9300s0§)
         {
            §1t88s0§.§1t9190s0§().init();
         }
         else if(param1 == §1t9304s0§)
         {
            §1t406s0§.§1t9190s0§().§1t6650s0§(§1t9321s0§());
         }
         else if(param1 == §1t9305s0§)
         {
            §1t24s0§.§1t8794s0§();
         }
      }
      
      public static function §1t6238s0§(param1:String, param2:int) : MovieClip
      {
         if(!§1t9295s0§[§1t9298s0§])
         {
            return null;
         }
         var _loc3_:ApplicationDomain = §1t9296s0§[§1t9298s0§];
         var _loc4_:String = param1 + param2.toString();
         if(!_loc3_.hasDefinition(_loc4_))
         {
            return null;
         }
         var _loc5_:Class = _loc3_.getDefinition(_loc4_) as Class;
         return new _loc5_() as MovieClip;
      }
      
      public static function §1t9314s0§(param1:int) : MovieClip
      {
         if(!§1t9295s0§[§1t9298s0§])
         {
            return null;
         }
         var _loc2_:ApplicationDomain = §1t9296s0§[§1t9298s0§];
         var _loc3_:String = "achievement" + param1.toString();
         if(!_loc2_.hasDefinition(_loc3_))
         {
            _loc3_ = "achievement1";
         }
         var _loc4_:Class = _loc2_.getDefinition(_loc3_) as Class;
         return new _loc4_() as MovieClip;
      }
      
      public static function §1t9315s0§(param1:String) : MovieClip
      {
         if(!§1t9295s0§[§1t9301s0§])
         {
            return null;
         }
         var _loc2_:ApplicationDomain = §1t9296s0§[§1t9301s0§];
         var _loc3_:String = "image" + param1;
         if(!_loc2_.hasDefinition(_loc3_))
         {
            return null;
         }
         var _loc4_:Class = _loc2_.getDefinition(_loc3_) as Class;
         return new _loc4_() as MovieClip;
      }
      
      public static function §1t9316s0§(param1:String) : MovieClip
      {
         if(!§1t9295s0§[§1t9303s0§])
         {
            return null;
         }
         var _loc2_:ApplicationDomain = §1t9296s0§[§1t9303s0§];
         var _loc3_:String = "portrait_" + param1;
         if(!_loc2_.hasDefinition(_loc3_))
         {
            return null;
         }
         var _loc4_:Class = _loc2_.getDefinition(_loc3_) as Class;
         return new _loc4_() as MovieClip;
      }
      
      public static function §1t9317s0§(param1:int) : MovieClip
      {
         if(!§1t9295s0§[§1t9298s0§])
         {
            return null;
         }
         var _loc2_:ApplicationDomain = §1t9296s0§[§1t9298s0§];
         var _loc3_:String = "skill" + param1.toString();
         if(!_loc2_.hasDefinition(_loc3_))
         {
            return null;
         }
         var _loc4_:Class = _loc2_.getDefinition(_loc3_) as Class;
         return new _loc4_() as MovieClip;
      }
      
      public static function §1t9318s0§(param1:int) : MovieClip
      {
         var _loc4_:Class = null;
         var _loc5_:MovieClip = null;
         if(!§1t9295s0§[§1t9298s0§])
         {
            return null;
         }
         var _loc2_:ApplicationDomain = §1t9296s0§[§1t9298s0§];
         var _loc3_:String = "Map" + param1.toString();
         if(!_loc2_.hasDefinition(_loc3_))
         {
            _loc3_ = "CloudsMap";
         }
         _loc4_ = _loc2_.getDefinition(_loc3_) as Class;
         return new _loc4_() as MovieClip;
      }
      
      public static function getBG(param1:String) : MovieClip
      {
         var _loc3_:Class = null;
         if(!§1t9295s0§[§1t9302s0§])
         {
            return null;
         }
         var _loc2_:ApplicationDomain = §1t9296s0§[§1t9302s0§];
         if(!_loc2_.hasDefinition(param1))
         {
            param1 = "BG_Forest";
         }
         _loc3_ = _loc2_.getDefinition(param1) as Class;
         return new _loc3_() as MovieClip;
      }
      
      public static function §1t9319s0§(param1:String) : Sound
      {
         var _loc3_:Class = null;
         if(!§1t9295s0§[§1t9299s0§])
         {
            return null;
         }
         var _loc2_:ApplicationDomain = §1t9296s0§[§1t9299s0§];
         if(!_loc2_.hasDefinition(param1))
         {
            return null;
         }
         _loc3_ = _loc2_.getDefinition(param1) as Class;
         return new _loc3_() as Sound;
      }
      
      public static function §1t9320s0§(param1:String) : Sound
      {
         var _loc3_:Class = null;
         if(!§1t9295s0§[§1t9300s0§])
         {
            return null;
         }
         var _loc2_:ApplicationDomain = §1t9296s0§[§1t9300s0§];
         if(!_loc2_.hasDefinition(param1))
         {
            return null;
         }
         _loc3_ = _loc2_.getDefinition(param1) as Class;
         return new _loc3_() as Sound;
      }
      
      public static function §1t9321s0§() : MovieClip
      {
         var _loc2_:Class = null;
         if(!§1t9295s0§[§1t9304s0§])
         {
            return null;
         }
         var _loc1_:ApplicationDomain = §1t9296s0§[§1t9304s0§];
         if(!_loc1_.hasDefinition("GuestModePromo"))
         {
            return null;
         }
         _loc2_ = _loc1_.getDefinition("GuestModePromo") as Class;
         var _loc3_:MovieClip = new _loc2_() as MovieClip;
         _loc3_.setLanguage(§1t1521s0§.getLanguage(),[§1t1521s0§.getString(11061),§1t1521s0§.getString(11062),§1t1521s0§.getString(11063),§1t1521s0§.getString(11064),§1t1521s0§.getString(11065),§1t1521s0§.getString(11066)]);
         return _loc3_;
      }
      
      public static function §1t9322s0§(param1:String) : MovieClip
      {
         var _loc3_:Class = null;
         if(!§1t9295s0§[§1t9305s0§])
         {
            return null;
         }
         var _loc2_:ApplicationDomain = §1t9296s0§[§1t9305s0§];
         if(!_loc2_.hasDefinition(param1))
         {
            return null;
         }
         _loc3_ = _loc2_.getDefinition(param1) as Class;
         return new _loc3_() as MovieClip;
      }
   }
}

