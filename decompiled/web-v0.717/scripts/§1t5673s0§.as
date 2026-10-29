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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol73")]
   public class §1t5673s0§ extends MovieClip
   {
      
      internal var §1t5674s0§:String = "TKZlICHmLc";
      
      internal var §1t5676s0§:String = "18";
      
      internal var §1t5678s0§:int = 0;
      
      internal var §1t5679s0§:uint = 0;
      
      internal var §1t5680s0§:int = 1;
      
      internal var §1t5681s0§:int = 24;
      
      internal var §1t5682s0§:int = 0;
      
      internal var §1t5683s0§:int = 0;
      
      internal var §1t5684s0§:String = loaderInfo.loaderURL;
      
      internal var §1t5685s0§:Object = {
         "publisherCode":this.§1t5674s0§,
         "gameId":this.§1t5676s0§,
         "refURL":this.§1t5684s0§,
         "bgSolid":this.§1t5678s0§,
         "bgColor":this.§1t5679s0§,
         "fadeIN":this.§1t5680s0§,
         "fadeFrames":this.§1t5681s0§
      };
      
      internal var §1t5686s0§:Object;
      
      internal var §1t5687s0§:DisplayObject;
      
      internal var §1t5688s0§:Loader;
      
      public function §1t5673s0§()
      {
         super();
         this.§1t5694s0§(this,this.§1t5682s0§,this.§1t5683s0§);
         var _loc1_:* = this.numChildren;
         while(_loc1_--)
         {
            this.removeChildAt(_loc1_);
         }
      }
      
      public function §1t5689s0§() : void
      {
         Security.allowDomain("http://www.epicgameads.com","http://epicgameads.com");
         if(Security.sandboxType != "remote")
         {
         }
         var _loc1_:String = "http://www.epicgameads.com/epicgameads-as3-v2.swf";
         var _loc2_:URLRequest = new URLRequest(_loc1_);
         var _loc3_:Loader = new Loader();
         this.§1t5688s0§ = _loc3_;
         _loc3_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.§1t5691s0§);
         _loc3_.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,this.§1t5692s0§,false,0,true);
         _loc3_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.§1t5693s0§,false,0,true);
         _loc3_.load(_loc2_);
         this.§1t5687s0§ = this.addChild(_loc3_);
      }
      
      public function §1t5690s0§() : *
      {
         this.§1t5688s0§.unloadAndStop();
      }
      
      internal function §1t5691s0§(param1:IOErrorEvent) : *
      {
      }
      
      internal function §1t5692s0§(param1:ProgressEvent) : *
      {
         var _loc2_:Number = param1.bytesLoaded / param1.bytesTotal;
         _loc2_ = Math.round(_loc2_ * 100);
      }
      
      internal function §1t5693s0§(param1:Event) : *
      {
         this.§1t5687s0§.x = this.§1t5682s0§;
         this.§1t5687s0§.y = this.§1t5683s0§;
         this.§1t5686s0§ = Object(param1.target.content);
         this.§1t5686s0§.adServerConnect(this.§1t5685s0§);
      }
      
      internal function §1t5694s0§(param1:DisplayObjectContainer, param2:Number, param3:Number) : void
      {
         var _loc8_:Number = NaN;
         var _loc9_:int = 0;
         var _loc4_:Rectangle = param1.getBounds(param1.parent);
         var _loc5_:Number = param1.x - _loc4_.left;
         var _loc6_:Number = param1.y - _loc4_.top;
         var _loc7_:Number = param2 - _loc5_;
         _loc8_ = param3 - _loc6_;
         param1.x += _loc7_;
         param1.y += _loc8_;
         _loc9_ = 0;
         while(_loc9_ < param1.numChildren)
         {
            param1.getChildAt(_loc9_).x = param1.getChildAt(_loc9_).x - _loc7_;
            param1.getChildAt(_loc9_).y = param1.getChildAt(_loc9_).y - _loc8_;
            _loc9_++;
         }
      }
   }
}

