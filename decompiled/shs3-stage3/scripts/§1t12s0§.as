package
{
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   
   public class §1t12s0§
   {
      
      internal var player:Object;
      
      internal var started:Boolean = false;
      
      internal var ended:Boolean = false;
      
      internal var loader:Loader = new Loader();
      
      internal var §1t29s0§:MovieClip;
      
      internal var stage:Stage;
      
      internal var callback:Function;
      
      internal var §1t32s0§:§1t33s0§;
      
      internal var payload:Loader;
      
      internal var §1t35s0§:MovieClip;
      
      public function §1t12s0§(param1:Stage, param2:Loader, param3:MovieClip, param4:Function)
      {
         super();
         this.stage = param1;
         this.callback = param4;
         this.§1t29s0§ = new §1t60s0§();
         this.§1t29s0§.visible = false;
         this.payload = param2;
         this.§1t35s0§ = param3;
         this.§1t32s0§ = new §1t33s0§(this);
      }
      
      internal function §1t36s0§(param1:Event) : void
      {
         this.stage.addChild(this.loader);
         this.stage.addChild(this.§1t29s0§);
         this.loader.y = -49;
         this.loader.visible = false;
         this.loader.content.addEventListener("onReady",this.§1t39s0§);
         this.loader.content.addEventListener("1t133s0",this.§1t40s0§);
         this.loader.content.addEventListener(IOErrorEvent.IO_ERROR,this.§1t40s0§);
         this.loader.content.addEventListener("onStateChange",this.§1t41s0§);
         this.loader.content.addEventListener("onPlaybackQualityChange",this.§1t42s0§);
         this.§1t29s0§.addEventListener(MouseEvent.CLICK,this.§1t43s0§);
      }
      
      internal function §1t37s0§(param1:Event) : *
      {
         this.videoEnded();
      }
      
      internal function §1t38s0§() : *
      {
         this.loader.contentLoaderInfo.removeEventListener(Event.INIT,this.§1t36s0§);
         this.loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.§1t37s0§);
         if(this.loader.content != null)
         {
            this.loader.content.removeEventListener("onReady",this.§1t39s0§);
            this.loader.content.removeEventListener("1t133s0",this.§1t40s0§);
            this.loader.content.removeEventListener("onStateChange",this.§1t41s0§);
            this.loader.content.removeEventListener("onPlaybackQualityChange",this.§1t42s0§);
            this.loader.removeEventListener(MouseEvent.CLICK,this.§1t43s0§);
         }
         this.§1t29s0§.removeEventListener(MouseEvent.CLICK,this.§1t43s0§);
      }
      
      internal function §1t39s0§(param1:Event) : void
      {
         this.player = this.loader.content;
         this.player.loadVideoById("zrZP8R1oVd4",0,"large");
         this.player.setSize(800,580);
      }
      
      internal function §1t40s0§(param1:Event) : void
      {
      }
      
      internal function §1t41s0§(param1:Event) : void
      {
         var _loc2_:int = int(Object(param1).data);
         if(_loc2_ == 2 || _loc2_ == 0)
         {
            this.videoEnded();
         }
         else if(_loc2_ == 1)
         {
            this.started = true;
            this.ended = false;
            this.loader.visible = true;
            this.§1t29s0§.visible = true;
         }
      }
      
      internal function §1t42s0§(param1:Event) : void
      {
      }
      
      internal function §1t43s0§(param1:MouseEvent) : *
      {
         this.§1t29s0§.visible = false;
         this.payload.visible = true;
         this.§1t35s0§.visible = true;
         this.videoEnded();
      }
      
      public function videoEnded() : *
      {
         if(this.§1t32s0§ != null)
         {
            this.§1t32s0§.videoEnded();
         }
         this.ended = true;
         this.§1t38s0§();
         if(this.stage.contains(this.loader))
         {
            this.stage.removeChild(this.loader);
            this.loader.unloadAndStop();
         }
         if(this.stage.contains(this.§1t29s0§))
         {
            this.stage.removeChild(this.§1t29s0§);
         }
         if(this.player != null)
         {
            this.player.destroy();
         }
         trace("ended");
         this.callback();
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

