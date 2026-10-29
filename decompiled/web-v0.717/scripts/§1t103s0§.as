package
{
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.utils.setTimeout;
   
   public class §1t103s0§
   {
      
      internal var player:Object;
      
      internal var started:Boolean = false;
      
      internal var ended:Boolean = false;
      
      internal var loader:Loader = new Loader();
      
      internal var §1t1037s0§:MovieClip;
      
      internal var §1t1038s0§:Boolean;
      
      internal var §1t1039s0§:§1t1040s0§;
      
      internal var stage:Stage;
      
      internal var canvas:MovieClip;
      
      internal var §1t1042s0§:§1t1043s0§;
      
      public function §1t103s0§(param1:Boolean = false)
      {
         super();
         this.§1t1038s0§ = param1;
         this.stage = §1t1523s0§.§1t9365s0§.stage;
         this.canvas = new §1t5016s0§();
         this.stage.addChild(this.canvas);
         if(true || §1t1523s0§.§1t9528s0§)
         {
            this.§1t1042s0§ = new §1t1043s0§(this);
            return;
         }
         §1t1524s0§.§1t9859s0§(this);
         this.loader.contentLoaderInfo.addEventListener(Event.INIT,this.§1t1045s0§);
         this.loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1046s0§);
         this.loader.load(new URLRequest("http://www.youtube.com/apiplayer?version=3"));
         this.§1t1037s0§ = new §1t5956s0§();
         if(param1)
         {
            this.§1t1039s0§ = new §1t1040s0§();
            this.§1t1039s0§.init(§1t1040s0§.§1t12374s0§);
            this.canvas.addChild(this.§1t1039s0§);
            this.§1t1037s0§.visible = false;
            this.resize();
            §1t1540s0§.§1t10022s0§();
         }
         else
         {
            this.§1t1039s0§ = §1t1523s0§.§1t9365s0§.§1t1039s0§;
            this.§1t1037s0§.visible = false;
         }
      }
      
      internal function resize() : *
      {
         this.canvas.scaleX = §1t1523s0§.§1t9358s0§;
         this.canvas.scaleY = §1t1523s0§.§1t9358s0§;
         this.canvas.x = §1t1523s0§.§1t9359s0§;
         this.canvas.y = §1t1523s0§.§1t9360s0§;
         if(§1t1523s0§.§1t9528s0§ && !this.§1t1038s0§)
         {
            this.§1t1042s0§.resize();
         }
      }
      
      internal function §1t1045s0§(param1:Event) : void
      {
         if(this.ended)
         {
            this.§1t1038s0§ = true;
            this.§1t1054s0§();
            return;
         }
         this.canvas.addChild(this.loader);
         this.canvas.addChild(this.§1t1037s0§);
         this.stage.addChild(this.canvas);
         §1t1540s0§.§1t10022s0§();
         this.§1t1037s0§.visible = false;
         this.loader.y = -49;
         this.loader.visible = false;
         this.loader.content.addEventListener("onReady",this.§1t1048s0§);
         this.loader.content.addEventListener("onError",this.§1t1049s0§);
         this.loader.content.addEventListener(IOErrorEvent.IO_ERROR,this.§1t1049s0§);
         this.loader.content.addEventListener("onStateChange",this.§1t1050s0§);
         this.loader.content.addEventListener("onPlaybackQualityChange",this.§1t1051s0§);
         this.§1t1037s0§.hitArea = this.§1t1039s0§;
         this.§1t1037s0§.addEventListener(MouseEvent.CLICK,this.§1t1052s0§);
      }
      
      internal function §1t1046s0§(param1:Event) : *
      {
         this.§1t1054s0§();
      }
      
      internal function removeEventListeners() : *
      {
         if(this.loader != null)
         {
            this.loader.contentLoaderInfo.removeEventListener(Event.INIT,this.§1t1045s0§);
            this.loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.§1t1046s0§);
            if(this.loader.content != null)
            {
               this.loader.content.removeEventListener("onReady",this.§1t1048s0§);
               this.loader.content.removeEventListener("onError",this.§1t1049s0§);
               this.loader.content.removeEventListener("onStateChange",this.§1t1050s0§);
               this.loader.content.removeEventListener("onPlaybackQualityChange",this.§1t1051s0§);
               this.loader.removeEventListener(MouseEvent.CLICK,this.§1t1052s0§);
            }
         }
         if(this.§1t1037s0§ != null)
         {
            this.§1t1037s0§.removeEventListener(MouseEvent.CLICK,this.§1t1052s0§);
         }
      }
      
      internal function §1t1048s0§(param1:Event) : void
      {
         this.player = this.loader.content;
         this.player.loadVideoById("zrZP8R1oVd4",0,"large");
         this.player.setSize(800,580);
      }
      
      internal function §1t1049s0§(param1:Event) : void
      {
      }
      
      internal function §1t1050s0§(param1:Event) : void
      {
         var _loc2_:int = int(Object(param1).data);
         if(_loc2_ == 2 || _loc2_ == 0)
         {
            this.§1t1054s0§();
         }
         else if(_loc2_ == 1)
         {
            this.started = true;
            this.ended = false;
            this.loader.visible = true;
            this.§1t1037s0§.visible = true;
            if(!this.§1t1038s0§)
            {
               this.resize();
            }
            if(this.§1t1039s0§ != null)
            {
               this.§1t1039s0§.visible = false;
            }
            if(this.§1t1038s0§)
            {
               §1t1540s0§.§1t9974s0§.visible = false;
               §1t1540s0§.§1t9975s0§.visible = false;
            }
         }
      }
      
      internal function §1t1051s0§(param1:Event) : void
      {
      }
      
      internal function §1t1052s0§(param1:MouseEvent) : *
      {
         this.§1t1037s0§.visible = false;
         if(this.loader != null)
         {
            this.loader.visible = false;
         }
         if(this.§1t1039s0§ != null)
         {
            this.§1t1039s0§.visible = true;
         }
         if(§1t1523s0§.§1t9528s0§)
         {
            setTimeout(this.§1t1054s0§,10);
         }
         else
         {
            this.§1t1054s0§();
         }
      }
      
      public function §1t1053s0§() : *
      {
         this.§1t1038s0§ = true;
      }
      
      internal function §1t1054s0§() : *
      {
         if(this.§1t1042s0§ != null)
         {
            this.§1t1042s0§.§1t1054s0§();
         }
         this.ended = true;
         this.removeEventListeners();
         if(this.loader != null && this.canvas.contains(this.loader))
         {
            this.canvas.removeChild(this.loader);
            this.loader.unloadAndStop();
         }
         if(this.§1t1037s0§ != null && this.canvas.contains(this.§1t1037s0§))
         {
            this.canvas.removeChild(this.§1t1037s0§);
         }
         this.stage.removeChild(this.canvas);
         this.canvas = null;
         if(this.player != null)
         {
            this.player.destroy();
         }
         if(!this.§1t1038s0§)
         {
            §1t1524s0§.§1t9861s0§();
         }
         else
         {
            §1t1540s0§.§1t9974s0§.visible = true;
            §1t1540s0§.§1t9975s0§.visible = true;
            if(this.§1t1039s0§ != null)
            {
               this.§1t1039s0§.visible = false;
            }
         }
      }
      
      public function §1t1055s0§() : Boolean
      {
         return this.started;
      }
      
      public function hasEnded() : Boolean
      {
         return this.ended;
      }
   }
}

