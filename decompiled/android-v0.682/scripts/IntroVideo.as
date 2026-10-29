package
{
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.utils.setTimeout;
   
   public class IntroVideo
   {
      
      internal var player:Object;
      
      internal var started:Boolean = false;
      
      internal var ended:Boolean = false;
      
      internal var loader:Loader = new Loader();
      
      internal var canvas:MovieClip;
      
      internal var videoCover:MovieClip;
      
      internal var dontUpdate:Boolean;
      
      internal var loadingScreen:LoadingScreen;
      
      public function IntroVideo(canvas:MovieClip, dontUpdate:Boolean = false)
      {
         super();
         QuestEngine.setIntroVideo(this);
         this.canvas = canvas;
         this.dontUpdate = dontUpdate;
         this.loader.contentLoaderInfo.addEventListener(Event.INIT,this.onLoaderInit);
         this.loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.onLoaderError);
         this.loader.load(new URLRequest("http://www.youtube.com/apiplayer?version=3"));
         this.videoCover = new IntroVideoCover();
         if(dontUpdate)
         {
            this.loadingScreen = new LoadingScreen();
            this.loadingScreen.setGameLoading();
            canvas.addChild(this.loadingScreen);
            this.videoCover.visible = false;
         }
         else
         {
            this.videoCover.visible = false;
         }
      }
      
      internal function onLoaderInit(event:Event) : void
      {
         if(this.ended)
         {
            trace("onLoaderInit but ended");
            this.dontUpdate = true;
            this.videoEnded();
            return;
         }
         this.canvas.addChild(this.loader);
         this.canvas.addChild(this.videoCover);
         this.videoCover.visible = false;
         this.loader.y = -49;
         this.loader.visible = false;
         this.loader.content.addEventListener("onReady",this.onPlayerReady);
         this.loader.content.addEventListener("onError",this.onPlayerError);
         this.loader.content.addEventListener(IOErrorEvent.IO_ERROR,this.onPlayerError);
         this.loader.content.addEventListener("onStateChange",this.onPlayerStateChange);
         this.loader.content.addEventListener("onPlaybackQualityChange",this.onVideoPlaybackQualityChange);
         this.loader.addEventListener(MouseEvent.CLICK,this.onPlayerClick);
         this.videoCover.addEventListener(MouseEvent.CLICK,this.onPlayerClick);
      }
      
      internal function onLoaderError(event:Event) : *
      {
         trace("onLoaderError");
         this.videoEnded();
      }
      
      internal function removeEventListeners() : *
      {
         this.loader.contentLoaderInfo.removeEventListener(Event.INIT,this.onLoaderInit);
         this.loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.onLoaderError);
         if(this.loader.content != null)
         {
            this.loader.content.removeEventListener("onReady",this.onPlayerReady);
            this.loader.content.removeEventListener("onError",this.onPlayerError);
            this.loader.content.removeEventListener("onStateChange",this.onPlayerStateChange);
            this.loader.content.removeEventListener("onPlaybackQualityChange",this.onVideoPlaybackQualityChange);
            this.loader.removeEventListener(MouseEvent.CLICK,this.onPlayerClick);
         }
         this.videoCover.removeEventListener(MouseEvent.CLICK,this.onPlayerClick);
      }
      
      internal function onPlayerReady(event:Event) : void
      {
         trace("player ready:",Object(event).data);
         this.player = this.loader.content;
         this.player.loadVideoById("zrZP8R1oVd4",0,"large");
         this.player.setSize(800,580);
      }
      
      internal function onPlayerError(event:Event) : void
      {
         trace("player error:",Object(event).data);
      }
      
      internal function onPlayerStateChange(event:Event) : void
      {
         trace("player state:",Object(event).data);
         var playerstate:int = int(Object(event).data);
         if(playerstate == 2 || playerstate == 0)
         {
            this.videoEnded();
         }
         else if(playerstate == 1)
         {
            this.started = true;
            this.ended = false;
            this.loader.visible = true;
            this.videoCover.visible = true;
            if(this.loadingScreen != null)
            {
               this.loadingScreen.visible = false;
            }
            if(this.dontUpdate)
            {
               GameEngine.titleScreenBG.visible = false;
               GameEngine.titleScreenUI.hideForIntroVideo();
            }
         }
      }
      
      internal function onVideoPlaybackQualityChange(event:Event) : void
      {
         trace("video quality:",Object(event).data);
      }
      
      internal function onPlayerClick(event:MouseEvent) : *
      {
         this.videoCover.visible = false;
         this.loader.visible = false;
         if(this.loadingScreen != null)
         {
            this.loadingScreen.visible = true;
         }
         if(StatsManager.isMobile)
         {
            setTimeout(this.videoEnded,100);
         }
         else
         {
            this.videoEnded();
         }
      }
      
      public function dontUpdateQuestEngine() : *
      {
         this.dontUpdate = true;
      }
      
      internal function videoEnded() : *
      {
         trace("intro ended");
         this.ended = true;
         if(this.canvas.contains(this.loader))
         {
            this.canvas.removeChild(this.loader);
         }
         if(this.canvas.contains(this.videoCover))
         {
            this.canvas.removeChild(this.videoCover);
         }
         this.removeEventListeners();
         if(this.player != null)
         {
            this.player.destroy();
         }
         if(!this.dontUpdate)
         {
            QuestEngine.reportIntroVideoEnded();
         }
         else
         {
            GameEngine.titleScreenBG.visible = true;
            GameEngine.titleScreenUI.showForIntroVideo();
         }
         if(this.loadingScreen != null)
         {
            this.loadingScreen.visible = false;
         }
         this.loader.unloadAndStop();
      }
      
      public function hasStarted() : Boolean
      {
         return this.started;
      }
      
      public function hasEnded() : Boolean
      {
         return this.ended;
      }
   }
}

