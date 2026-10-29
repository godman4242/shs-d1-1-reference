package shs3_android_fla
{
   import adobe.utils.*;
   import flash.accessibility.*;
   import flash.desktop.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.globalization.*;
   import flash.media.*;
   import flash.net.*;
   import flash.net.drm.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.sampler.*;
   import flash.sensors.*;
   import flash.system.*;
   import flash.text.*;
   import flash.text.engine.*;
   import flash.text.ime.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   
   public dynamic class MainTimeline extends MovieClip
   {
      
      public var d_blocker:Blocker;
      
      public var r_blocker:Blocker;
      
      public var videocover:IntroVideoCover;
      
      public var epicAds:EpicAds;
      
      public var adloadertext:TextField;
      
      public var skillUI:SkillUI;
      
      public var bg:BG_BambooForest;
      
      public var loadingScreen:LoadingScreen;
      
      public var l_blocker:Blocker;
      
      public var messageDialog:DialogBox;
      
      public var u_blocker:Blocker;
      
      public var introVideo:IntroVideo;
      
      public var sharedObject:SharedObject;
      
      public var loadCompleted:Boolean;
      
      public function MainTimeline()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,2,this.frame3,3,this.frame4,4,this.frame5);
      }
      
      public function logoClick(event:Event) : *
      {
         QueryManager.instance.showEBWebsite();
      }
      
      public function gameLoaded(e:ProgressEvent) : *
      {
         var pcent:Number = Math.floor(e.bytesLoaded * 100 / e.bytesTotal);
         if(StatsManager.language == LangManager.CHINESE)
         {
            this.loadingScreen.loadertext.text = "载入中..." + int(pcent) + "%";
         }
         else
         {
            this.loadingScreen.loadertext.text = "Loading game files... " + int(pcent) + "%";
         }
         if(int(pcent) == 100)
         {
            this.gameLoadCompleted(null);
         }
      }
      
      public function gameLoadCompleted(e:Event) : *
      {
         if(this.loadCompleted)
         {
            trace("gameLoadCompleted called second time");
            return;
         }
         trace("game loaded");
         this.loadCompleted = true;
         this.loaderInfo.removeEventListener(ProgressEvent.PROGRESS,this.gameLoaded);
         this.loaderInfo.removeEventListener(Event.COMPLETE,this.gameLoadCompleted);
         if(StatsManager.useExternalResource)
         {
            ResourceManager.init();
         }
         else
         {
            LangManager.setLanguage(StatsManager.language);
         }
      }
      
      public function startGame() : *
      {
         var delayStart:* = undefined;
         var delay:int = 0;
         if(this.epicAds.visible)
         {
            delay = 10000;
         }
         delayStart = setInterval(function():*
         {
            clearInterval(delayStart);
            if(epicAds.visible)
            {
               epicAds.unloadEpicGameAds();
            }
            introVideo = null;
            loadingScreen.lutbutton.removeEventListener(MouseEvent.CLICK,logoClick);
            if(StatsManager.isKongregate)
            {
               new Kongregate();
            }
            gotoAndStop(1,"init");
         },delay);
      }
      
      public function initBridge(mc:MovieClip) : MovieClip
      {
         return null;
      }
      
      internal function frame1() : *
      {
         stop();
         this.messageDialog.visible = false;
         StatsManager.mainTimeLine = this;
         GameEngine.setStageMC(stage);
         new QueryManager();
         if(StatsManager.isMobile)
         {
            Mobile.getInstance().init();
         }
         GameEngine.checkKongregate();
         this.videocover.visible = false;
         this.sharedObject = SharedObject.getLocal(StatsManager.cookieName);
         this.loadingScreen.setTitleLoading();
         this.adloadertext.visible = false;
         this.epicAds.visible = false;
         if(!StatsManager.skipIntro && this.sharedObject.data.saved != true)
         {
            this.introVideo = new IntroVideo(this.loadingScreen);
         }
         else if(!StatsManager.isMobile && QueryManager.instance.showAds())
         {
            this.epicAds.visible = true;
            this.adloadertext.visible = true;
            this.loadingScreen.loadertext.visible = false;
            this.epicAds.epicInit();
         }
         this.loaderInfo.addEventListener(ProgressEvent.PROGRESS,this.gameLoaded);
         this.loaderInfo.addEventListener(Event.COMPLETE,this.gameLoadCompleted);
         this.loadingScreen.lutbutton.addEventListener(MouseEvent.CLICK,this.logoClick);
         this.loadCompleted = false;
         if(StatsManager.offlineModeOnly)
         {
            this.gameLoadCompleted(null);
         }
      }
      
      internal function frame2() : *
      {
      }
      
      internal function frame3() : *
      {
         SoundManager.getInstance();
         new NodeGenerator();
         new QuestGenerator();
         GameEngine.initTitleScreen();
         stop();
      }
      
      internal function frame4() : *
      {
      }
      
      internal function frame5() : *
      {
         stop();
      }
   }
}

