package
{
   import flash.display.Stage;
   import flash.events.MouseEvent;
   import flash.events.NetStatusEvent;
   import flash.events.StageVideoEvent;
   import flash.geom.Rectangle;
   import flash.media.StageVideo;
   import flash.net.NetConnection;
   import flash.net.NetStream;
   
   public class §1t1043s0§
   {
      
      internal var §1t2094s0§:StageVideo;
      
      internal var §1t2095s0§:NetConnection;
      
      internal var netStream:NetStream;
      
      internal var stage:Stage;
      
      internal var §1t2097s0§:§1t103s0§;
      
      public function §1t1043s0§(param1:§1t103s0§)
      {
         super();
         this.§1t2097s0§ = param1;
         if(this.§1t2097s0§.stage.stageVideos != null && this.§1t2097s0§.stage.stageVideos.length > 0)
         {
            this.§1t2098s0§(this.§1t2097s0§.stage.stageVideos[0]);
         }
         else
         {
            this.§1t2097s0§.§1t1054s0§();
         }
      }
      
      internal function §1t2098s0§(param1:StageVideo) : *
      {
         this.§1t2094s0§ = param1;
         var _loc2_:NetConnection = new NetConnection();
         _loc2_.connect(null);
         this.netStream = new NetStream(_loc2_);
         var _loc3_:Object = new Object();
         _loc3_.onMetaData = this.§1t2099s0§;
         this.netStream.client = _loc3_;
         this.netStream.addEventListener(NetStatusEvent.NET_STATUS,this.§1t2101s0§);
         param1.attachNetStream(this.netStream);
         param1.addEventListener(StageVideoEvent.RENDER_STATE,this.§1t2100s0§);
         this.netStream.play("http://r.playerio.com/r/shsd-server1-eckroutikmljozkzitvg/intro.mp4");
         §1t1524s0§.§1t9859s0§(this.§1t2097s0§);
         this.§1t2097s0§.§1t1037s0§ = new §1t5956s0§();
         if(this.§1t2097s0§.§1t1038s0§)
         {
            this.§1t2097s0§.§1t1039s0§ = new §1t1040s0§();
            this.§1t2097s0§.§1t1039s0§.init(§1t1040s0§.§1t12374s0§);
            this.§1t2097s0§.canvas.addChild(this.§1t2097s0§.§1t1039s0§);
            this.§1t2097s0§.§1t1037s0§.visible = false;
            this.resize();
            §1t1540s0§.§1t10022s0§();
         }
         else
         {
            this.§1t2097s0§.§1t1039s0§ = §1t1523s0§.§1t9365s0§.§1t1039s0§;
            this.§1t2097s0§.§1t1037s0§.visible = false;
         }
         this.§1t2097s0§.§1t1037s0§.visible = false;
         this.§1t2097s0§.canvas.addChild(this.§1t2097s0§.§1t1037s0§);
         this.§1t2097s0§.§1t1037s0§.hitArea = this.§1t2097s0§.§1t1039s0§;
         this.§1t2097s0§.§1t1037s0§.addEventListener(MouseEvent.CLICK,this.§1t2097s0§.§1t1052s0§);
      }
      
      internal function §1t2099s0§(param1:Object) : *
      {
      }
      
      internal function §1t2100s0§(param1:StageVideoEvent) : *
      {
      }
      
      internal function §1t2101s0§(param1:NetStatusEvent) : void
      {
         switch(param1.info.code)
         {
            case "NetStream.Buffer.Empty":
            case "NetStream.Buffer.Full":
               break;
            case "NetStream.Play.Start":
               this.§1t2097s0§.started = true;
               this.§1t2097s0§.ended = false;
               this.resize();
               this.§1t2097s0§.loader.visible = true;
               this.§1t2097s0§.§1t1037s0§.visible = true;
               if(this.§1t2097s0§.§1t1039s0§ != null)
               {
                  this.§1t2097s0§.§1t1039s0§.visible = false;
               }
               if(this.§1t2097s0§.§1t1038s0§)
               {
                  §1t1540s0§.§1t9974s0§.visible = false;
                  §1t1540s0§.§1t9975s0§.visible = false;
               }
               break;
            case "NetStream.Play.Stop":
               this.§1t2097s0§.§1t1054s0§();
               break;
            case "StreamNotFound":
         }
      }
      
      public function §1t1054s0§() : *
      {
         this.netStream.removeEventListener(NetStatusEvent.NET_STATUS,this.§1t2101s0§);
         this.§1t2094s0§.removeEventListener(StageVideoEvent.RENDER_STATE,this.§1t2100s0§);
         this.§1t2094s0§ = null;
         this.netStream.close();
         this.netStream = null;
         this.§1t2095s0§ = null;
      }
      
      public function resize() : *
      {
         var _loc1_:int = this.§1t2097s0§.stage.stageWidth;
         var _loc2_:int = this.§1t2097s0§.stage.stageWidth / 640 * 360;
         var _loc3_:Rectangle = new Rectangle(0,16,this.§1t2097s0§.stage.stageWidth,this.§1t2097s0§.stage.stageWidth / 640 * 360);
         this.§1t2094s0§.viewPort = _loc3_;
         this.§1t2097s0§.canvas.x = §1t1523s0§.§1t9359s0§;
         this.§1t2097s0§.canvas.y = §1t1523s0§.§1t9360s0§;
         this.§1t2097s0§.canvas.scaleX = §1t1523s0§.§1t9358s0§;
         this.§1t2097s0§.canvas.scaleY = §1t1523s0§.§1t9358s0§;
      }
   }
}

