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
   
   public class §1t33s0§
   {
      
      internal var §1t47s0§:StageVideo;
      
      internal var §1t48s0§:NetConnection;
      
      internal var netStream:NetStream;
      
      internal var stage:Stage;
      
      internal var §1t53s0§:§1t12s0§;
      
      public function §1t33s0§(param1:§1t12s0§)
      {
         super();
         this.§1t53s0§ = param1;
         if(this.§1t53s0§.stage.stageVideos != null && this.§1t53s0§.stage.stageVideos.length > 0)
         {
            this.§1t54s0§(this.§1t53s0§.stage.stageVideos[0]);
         }
         else
         {
            this.§1t53s0§.videoEnded();
         }
      }
      
      internal function §1t54s0§(param1:StageVideo) : *
      {
         this.§1t47s0§ = param1;
         var _loc2_:NetConnection = new NetConnection();
         _loc2_.connect(null);
         this.netStream = new NetStream(_loc2_);
         var _loc3_:Object = new Object();
         _loc3_.onMetaData = this.§1t55s0§;
         this.netStream.client = _loc3_;
         this.netStream.addEventListener(NetStatusEvent.NET_STATUS,this.§1t57s0§);
         param1.attachNetStream(this.netStream);
         param1.addEventListener(StageVideoEvent.RENDER_STATE,this.§1t56s0§);
         this.netStream.play("http://r.playerio.com/r/shsd-server1-eckroutikmljozkzitvg/intro.mp4");
         this.§1t53s0§.§1t29s0§ = new §1t60s0§();
         this.§1t53s0§.§1t29s0§.visible = false;
         this.§1t53s0§.stage.addChild(this.§1t53s0§.§1t29s0§);
         this.§1t53s0§.§1t29s0§.addEventListener(MouseEvent.CLICK,this.§1t53s0§.§1t43s0§);
      }
      
      internal function §1t55s0§(param1:Object) : *
      {
      }
      
      internal function §1t56s0§(param1:StageVideoEvent) : *
      {
      }
      
      internal function §1t57s0§(param1:NetStatusEvent) : void
      {
         trace(param1.info.code);
         switch(param1.info.code)
         {
            case "NetStream.Buffer.Empty":
            case "NetStream.Buffer.Full":
               break;
            case "NetStream.Play.Start":
               this.§1t53s0§.started = true;
               this.§1t53s0§.ended = false;
               this.resize();
               this.§1t53s0§.payload.visible = false;
               this.§1t53s0§.loader.visible = false;
               this.§1t53s0§.§1t29s0§.visible = true;
               if(this.§1t53s0§.§1t35s0§ != null)
               {
                  this.§1t53s0§.§1t35s0§.visible = false;
               }
               break;
            case "NetStream.Play.Stop":
               this.§1t53s0§.videoEnded();
               break;
            case "StreamNotFound":
         }
      }
      
      public function videoEnded() : *
      {
         if(this.netStream == null || this.§1t47s0§ == null)
         {
            return;
         }
         this.netStream.removeEventListener(NetStatusEvent.NET_STATUS,this.§1t57s0§);
         this.§1t47s0§.removeEventListener(StageVideoEvent.RENDER_STATE,this.§1t56s0§);
         this.§1t47s0§ = null;
         this.netStream.close();
         this.netStream = null;
         this.§1t48s0§ = null;
         this.§1t53s0§.payload.visible = true;
      }
      
      public function resize() : *
      {
         var _loc1_:int = this.§1t53s0§.stage.stageWidth;
         var _loc2_:int = this.§1t53s0§.stage.stageWidth / 640 * 360;
         var _loc3_:Rectangle = new Rectangle(0,16,this.§1t53s0§.stage.stageWidth,this.§1t53s0§.stage.stageWidth / 640 * 360);
         this.§1t47s0§.viewPort = _loc3_;
      }
   }
}

