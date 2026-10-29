package
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.geom.Rectangle;
   import flash.net.URLRequest;
   import flash.system.Security;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol65")]
   public class EpicAds extends MovieClip
   {
      
      internal var myEpicGameAdsPublisherCode:String = "TKZlICHmLc";
      
      internal var myEpicGameAdsGameID:String = "18";
      
      internal var myEpicGameAdsBgSolid:int = 0;
      
      internal var myEpicGameAdsBgColor:uint = 0;
      
      internal var myEpicGameAdsFadeIn:int = 1;
      
      internal var myEpicGameAdsFadeFrames:int = 24;
      
      internal var epicXPos:int = 0;
      
      internal var epicYPos:int = 0;
      
      internal var sEpicRefURL:String = loaderInfo.loaderURL;
      
      internal var oEpicUserInfo:Object = {
         "publisherCode":this.myEpicGameAdsPublisherCode,
         "gameId":this.myEpicGameAdsGameID,
         "refURL":this.sEpicRefURL,
         "bgSolid":this.myEpicGameAdsBgSolid,
         "bgColor":this.myEpicGameAdsBgColor,
         "fadeIN":this.myEpicGameAdsFadeIn,
         "fadeFrames":this.myEpicGameAdsFadeFrames
      };
      
      internal var oEpicContent:Object;
      
      internal var oEpicDisplay:DisplayObject;
      
      internal var epicGameAds:Loader;
      
      public function EpicAds()
      {
         super();
         this.setRegPoint(this,this.epicXPos,this.epicYPos);
         var i:* = this.numChildren;
         while(i--)
         {
            this.removeChildAt(i);
         }
      }
      
      public function epicInit() : void
      {
         Security.allowDomain("http://www.epicgameads.com","http://epicgameads.com");
         if(Security.sandboxType != "remote")
         {
            trace("Notice:Running EpicGameAds InGameAd in local security sandbox (domain)");
            trace("Ads may not be visible when in local sandbox");
            trace("Publish the SWF and run it in a REMOTE security sandbox (from a internet URL)");
         }
         var swfUrl:String = "http://www.epicgameads.com/epicgameads-as3-v2.swf";
         var request:URLRequest = new URLRequest(swfUrl);
         var loader:Loader = new Loader();
         this.epicGameAds = loader;
         loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.onEpicConIOError);
         loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,this.epicLoadProgress,false,0,true);
         loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.epicLoadComplete,false,0,true);
         loader.load(request);
         this.oEpicDisplay = this.addChild(loader);
      }
      
      public function unloadEpicGameAds() : *
      {
         this.epicGameAds.unloadAndStop();
      }
      
      internal function onEpicConIOError(e:IOErrorEvent) : *
      {
         trace(e.text);
      }
      
      internal function epicLoadProgress(e:ProgressEvent) : *
      {
         var percentLoaded:Number = e.bytesLoaded / e.bytesTotal;
         percentLoaded = Math.round(percentLoaded * 100);
      }
      
      internal function epicLoadComplete(e:Event) : *
      {
         this.oEpicDisplay.x = this.epicXPos;
         this.oEpicDisplay.y = this.epicYPos;
         this.oEpicContent = Object(e.target.content);
         this.oEpicContent.adServerConnect(this.oEpicUserInfo);
      }
      
      internal function setRegPoint(obj:DisplayObjectContainer, newX:Number, newY:Number) : void
      {
         var yOffset:Number = NaN;
         var i:int = 0;
         var bounds:Rectangle = obj.getBounds(obj.parent);
         var currentRegX:Number = obj.x - bounds.left;
         var currentRegY:Number = obj.y - bounds.top;
         var xOffset:Number = newX - currentRegX;
         yOffset = newY - currentRegY;
         obj.x += xOffset;
         obj.y += yOffset;
         for(i = 0; i < obj.numChildren; i++)
         {
            obj.getChildAt(i).x = obj.getChildAt(i).x - xOffset;
            obj.getChildAt(i).y = obj.getChildAt(i).y - yOffset;
         }
      }
   }
}

