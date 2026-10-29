package shs3_fla
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
      
      public var adloadertext:TextField;
      
      public var bg:§1t8074s0§;
      
      public var d_blocker:§1t5267s0§;
      
      public var epicAds:§1t5673s0§;
      
      public var l_blocker:§1t5267s0§;
      
      public var §1t1039s0§:§1t1040s0§;
      
      public var §1t8078s0§:§1t5474s0§;
      
      public var r_blocker:§1t5267s0§;
      
      public var §1t6473s0§:§1t6980s0§;
      
      public var u_blocker:§1t5267s0§;
      
      public var videocover:§1t5956s0§;
      
      public var §1t8082s0§:§1t1056s0§;
      
      public var lang:String;
      
      public var §1t2097s0§:§1t103s0§;
      
      public var sharedObject:SharedObject;
      
      public var loadCompleted:Boolean;
      
      public var tinyLoader:MovieClip;
      
      public var waitingForTinyLoader:Boolean;
      
      public function MainTimeline()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,2,this.frame3,3,this.frame4,4,this.frame5);
      }
      
      public function §1t7029s0§(param1:Event) : *
      {
         §1t3317s0§.instance.§1t2014s0§();
      }
      
      public function gameLoaded(param1:ProgressEvent) : *
      {
         var _loc2_:Number = Math.floor(param1.bytesLoaded * 100 / param1.bytesTotal);
         if(§1t1523s0§.language == §1t1521s0§.CHINESE)
         {
            this.§1t1039s0§.§1t6113s0§.text = "载入中..." + int(_loc2_) + "%";
         }
         else if(§1t1523s0§.language == §1t1521s0§.§1t9277s0§)
         {
            this.§1t1039s0§.§1t6113s0§.text = "Chargement fichiers jeu... " + int(_loc2_) + "%";
         }
         else if(§1t1523s0§.language == §1t1521s0§.§1t9279s0§)
         {
            this.§1t1039s0§.§1t6113s0§.text = "Carga de archivos de juego... " + int(_loc2_) + "%";
         }
         else
         {
            this.§1t1039s0§.§1t6113s0§.text = "Loading game files... " + int(_loc2_) + "%";
         }
         if(int(_loc2_) == 100)
         {
            this.gameLoadCompleted(null);
         }
      }
      
      public function gameLoadCompleted(param1:Event) : *
      {
         if(this.loadCompleted)
         {
            return;
         }
         this.loadCompleted = true;
         this.loaderInfo.removeEventListener(ProgressEvent.PROGRESS,this.gameLoaded);
         this.loaderInfo.removeEventListener(Event.COMPLETE,this.gameLoadCompleted);
         §1t1521s0§.setLanguage(§1t1523s0§.language);
      }
      
      public function §1t5355s0§() : *
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
               epicAds.§1t5690s0§();
            }
            §1t2097s0§ = null;
            §1t1039s0§.lutbutton.removeEventListener(MouseEvent.CLICK,§1t7029s0§);
            §1t1540s0§.§1t10070s0§();
            gotoAndStop(1,"init");
         },delay);
      }
      
      public function initBridge(param1:MovieClip) : MovieClip
      {
         return null;
      }
      
      public function setTinyLoader(param1:MovieClip) : *
      {
         this.tinyLoader = param1;
      }
      
      public function tinyLoaderEnded() : *
      {
         if(this.waitingForTinyLoader)
         {
            §1t1540s0§.§1t10028s0§();
         }
      }
      
      internal function frame1() : *
      {
         stop();
         this.§1t8082s0§ = new §1t1056s0§();
         this.§1t8078s0§.visible = false;
         §1t1523s0§.init();
         §1t1523s0§.§1t9365s0§ = this;
         §1t1540s0§.§1t10016s0§(stage);
         new §1t3317s0§();
         if(§1t1523s0§.§1t9528s0§)
         {
            §1t135s0§.§1t9190s0§().init();
         }
         else
         {
            §1t1540s0§.§1t10069s0§();
            §1t1540s0§.§1t10071s0§();
         }
         this.lang = §1t3317s0§.instance.§1t2021s0§();
         if(this.lang != "" && §1t1521s0§.§1t9281s0§(this.lang))
         {
            §1t1523s0§.language = this.lang;
            §1t1521s0§.language = this.lang;
         }
         this.§1t1039s0§.comicbutton.§1t5829s0§.text = "Read the SHS Comic";
         this.videocover.visible = false;
         this.sharedObject = SharedObject.getLocal(§1t1523s0§.§1t2501s0§);
         this.§1t1039s0§.init(§1t1040s0§.§1t12375s0§);
         this.adloadertext.visible = false;
         this.epicAds.visible = false;
         if(!§1t1523s0§.§1t9477s0§ && (§1t1523s0§.§1t9528s0§ || !this.sharedObject.data.saved))
         {
            this.§1t2097s0§ = new §1t103s0§();
         }
         else if(!§1t1523s0§.§1t9528s0§ && §1t3317s0§.instance.§1t2006s0§())
         {
            this.epicAds.visible = true;
            this.adloadertext.visible = true;
            this.§1t1039s0§.§1t6113s0§.visible = false;
            this.epicAds.§1t5689s0§();
         }
         this.loaderInfo.addEventListener(ProgressEvent.PROGRESS,this.gameLoaded);
         this.loaderInfo.addEventListener(Event.COMPLETE,this.gameLoadCompleted);
         this.§1t1039s0§.lutbutton.addEventListener(MouseEvent.CLICK,this.§1t7029s0§);
         this.loadCompleted = false;
         if(§1t1523s0§.§1t9502s0§)
         {
            this.gameLoadCompleted(null);
         }
         this.waitingForTinyLoader = false;
      }
      
      internal function frame2() : *
      {
      }
      
      internal function frame3() : *
      {
         §1t88s0§.§1t9190s0§();
         new §1t70s0§();
         new §1t123s0§();
         this.waitingForTinyLoader = true;
         if(this.tinyLoader != null)
         {
            if(this.tinyLoader.hasEnded())
            {
               §1t1540s0§.§1t10028s0§();
            }
         }
         else
         {
            §1t1540s0§.§1t10028s0§();
         }
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

