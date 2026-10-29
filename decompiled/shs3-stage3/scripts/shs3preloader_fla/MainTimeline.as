package shs3preloader_fla
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
      
      public var §1t35s0§:§1t61s0§;
      
      public var §1t115s0§:MovieClip;
      
      public var version:Number;
      
      public var §1t118s0§:String;
      
      public var §1t119s0§:NumberFormatter;
      
      public var loader:Loader;
      
      public var §1t125s0§:URLLoader;
      
      public var §1t127s0§:URLLoader;
      
      public var §1t128s0§:§1t12s0§;
      
      public function MainTimeline()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function §1t122s0§(param1:Event) : *
      {
         this.§1t124s0§("http://www.explosivebarrel.com");
      }
      
      public function §1t123s0§(param1:Event) : *
      {
         this.§1t124s0§("http://www.strawhatsamuraiduels.com/comic.php");
      }
      
      public function §1t124s0§(param1:String) : *
      {
         var url:String = param1;
         var request:URLRequest = new URLRequest(url);
         try
         {
            navigateToURL(request,"_blank");
         }
         catch(e:Error)
         {
            trace("Error occurred!");
         }
      }
      
      public function §1t129s0§(param1:Event) : *
      {
         this.§1t125s0§.removeEventListener(Event.COMPLETE,this.§1t129s0§);
         if(param1.target.data.tinyloaderversion * 1000 > this.version * 1000)
         {
            this.§1t131s0§();
            return;
         }
         var _loc2_:int = param1.target.data.version * 1000;
         var _loc3_:Boolean = param1.target.data.forceupdate == "true";
         var _loc4_:String = param1.target.data.payload;
         this.§1t132s0§(_loc4_);
         this.§1t128s0§ = new §1t12s0§(stage,this.loader,this.§1t35s0§,this.§1t138s0§);
      }
      
      public function §1t130s0§(param1:Error) : *
      {
         this.§1t115s0§.visible = true;
         this.§1t115s0§.gotoAndStop(2);
         this.§1t35s0§.§1t89s0§.visible = false;
      }
      
      public function §1t131s0§() : *
      {
         this.§1t115s0§.visible = true;
         this.§1t115s0§.gotoAndStop(1);
         this.§1t35s0§.§1t89s0§.visible = false;
      }
      
      public function §1t132s0§(param1:String) : *
      {
         addChild(this.loader);
         this.§1t127s0§.addEventListener(ProgressEvent.PROGRESS,this.onProgress);
         this.§1t127s0§.addEventListener(IOErrorEvent.IO_ERROR,this.§1t133s0§);
         this.§1t127s0§.addEventListener(Event.COMPLETE,this.onComplete);
         this.§1t127s0§.load(new URLRequest(param1));
      }
      
      public function §1t133s0§(param1:IOErrorEvent) : *
      {
      }
      
      public function onProgress(param1:ProgressEvent) : void
      {
         var _loc2_:int = param1.bytesLoaded / param1.bytesTotal * 100;
         this.§1t35s0§.§1t89s0§.text = "Loading game files... " + _loc2_ + "%";
      }
      
      public function onComplete(param1:Event) : void
      {
         var _loc2_:ByteArray = ByteArray(param1.target.data);
         _loc2_ = this.§1t136s0§(_loc2_,104);
         this.loader.contentLoaderInfo.addEventListener(Event.INIT,this.§1t137s0§);
         var _loc3_:LoaderContext = new LoaderContext();
         _loc3_.applicationDomain = new ApplicationDomain();
         _loc3_.allowCodeImport = true;
         this.loader.loadBytes(_loc2_,_loc3_);
      }
      
      public function §1t136s0§(param1:ByteArray, param2:int) : ByteArray
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
      
      public function §1t137s0§(param1:Event) : void
      {
         this.§1t35s0§.§1t90s0§.removeEventListener(MouseEvent.CLICK,this.§1t122s0§);
         removeChild(this.§1t35s0§);
         MovieClip(this.loader.content).setTinyLoader(MovieClip(this));
         if(!this.§1t128s0§.hasStarted())
         {
            this.§1t128s0§.videoEnded();
         }
      }
      
      public function hasEnded() : *
      {
         if(this.§1t128s0§ == null)
         {
            return false;
         }
         return this.§1t128s0§.hasEnded();
      }
      
      public function §1t138s0§() : *
      {
         this.§1t35s0§.§1t64s0§.visible = true;
         this.§1t35s0§.§1t62s0§.visible = true;
         if(this.loader.content != null)
         {
            MovieClip(this.loader.content).tinyLoaderEnded();
         }
      }
      
      internal function frame1() : *
      {
         this.version = 1.1;
         this.§1t118s0§ = "http://r.playerio.com/r/shsd-server1-eckroutikmljozkzitvg/liveupdate/shs3_payload_version.swf";
         this.§1t119s0§ = new NumberFormatter("en-US");
         this.§1t119s0§.fractionalDigits = 1;
         this.§1t35s0§.§1t106s0§.text = "L" + this.§1t119s0§.formatNumber(this.version);
         this.§1t35s0§.§1t90s0§.addEventListener(MouseEvent.CLICK,this.§1t122s0§);
         this.§1t35s0§.§1t62s0§.addEventListener(MouseEvent.CLICK,this.§1t123s0§);
         this.§1t35s0§.§1t62s0§.§1t108s0§.mouseEnabled = false;
         this.§1t35s0§.§1t64s0§.visible = false;
         this.§1t35s0§.§1t62s0§.visible = false;
         this.§1t35s0§.§1t62s0§.§1t108s0§.text = "Read the SHS Comic";
         this.§1t115s0§.visible = false;
         this.loader = new Loader();
         this.§1t125s0§ = new URLLoader();
         this.§1t127s0§ = new URLLoader();
         this.§1t127s0§.dataFormat = URLLoaderDataFormat.BINARY;
         this.§1t125s0§.addEventListener(Event.COMPLETE,this.§1t129s0§);
         this.§1t125s0§.addEventListener(ErrorEvent.ERROR,this.§1t130s0§);
         this.§1t125s0§.dataFormat = URLLoaderDataFormat.VARIABLES;
         this.§1t125s0§.load(new URLRequest(this.§1t118s0§));
      }
   }
}

