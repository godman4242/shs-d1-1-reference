package com.omniture
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.InteractiveObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   
   public dynamic class ActionSource_Module_ClickMap
   {
      
      private static var isExternalSet:Boolean = false;
      
      public var index:String;
      
      private var s:Object;
      
      public function ActionSource_Module_ClickMap(param1:Object)
      {
         var m:Object = null;
         var e:Object = null;
         var s:Object = param1;
         super();
         m = this;
         m.s = s;
         m.s.addEventListener(Event.ADDED_TO_STAGE,m.onAddedToStage,false,0,true);
         if(ExternalInterface.available && !m.isExternalSet)
         {
            m.isExternalSet = true;
            try
            {
               ExternalInterface.addCallback("s_getDOMIndex",m.getDOMIndex);
               ExternalInterface.addCallback("s_getTrackClickMap",m.getTrackClickMap);
               ExternalInterface.addCallback("s_getAccount",m.getAccount);
               ExternalInterface.addCallback("s_getPageName",m.getPageName);
               ExternalInterface.addCallback("s_getPageURL",m.getPageURL);
               ExternalInterface.addCallback("s_getMovieID",m.getMovieID);
               ExternalInterface.addCallback("s_getVersion",m.getVersion);
               ExternalInterface.addCallback("s_getCharSet",m.getCharSet);
               ExternalInterface.addCallback("s_getSWFURL",m.getSWFURL);
            }
            catch(e:*)
            {
            }
         }
      }
      
      public function getSWFURL() : *
      {
         var _loc1_:Object = null;
         _loc1_ = this;
         if(_loc1_.s.isSet(s.movie))
         {
            if(Boolean(_loc1_.s.isSet(_loc1_.s.movie.loaderInfo)) && Boolean(_loc1_.s.isSet(_loc1_.s.movie.loaderInfo.loaderURL)))
            {
               return _loc1_.s.movie.loaderInfo.loaderURL;
            }
            if(_loc1_.s.isSet(_loc1_.s.movie._url))
            {
               return _loc1_.s.movie._url;
            }
         }
         return "";
      }
      
      public function getVersion() : *
      {
         var _loc1_:Object = null;
         _loc1_ = this;
         return _loc1_.s.version;
      }
      
      public function getPageName() : *
      {
         var _loc1_:Object = null;
         _loc1_ = this;
         return _loc1_.s.pageName;
      }
      
      private function getFullPath(param1:DisplayObject) : *
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:Array = null;
         _loc4_ = new Array();
         do
         {
            _loc4_.splice(0,0,param1.name);
            param1 = param1.parent;
         }
         while(param1.parent != null);
         _loc2_ = _loc4_.join(".");
         _loc3_ = _loc2_.substr(_loc2_.length - 4,4);
         if(_loc3_ == ".frs" || _loc3_ == ".fds")
         {
            _loc2_ = _loc2_.substr(0,_loc2_.length - 4);
         }
         return _loc2_;
      }
      
      private function getObjectID(param1:Object) : *
      {
         var _loc2_:Object = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         _loc2_ = this;
         _loc3_ = _loc2_.getMovieID();
         _loc4_ = "";
         _loc4_ = _loc2_.getFullPath(param1);
         if(_loc2_.s.isSet(_loc4_))
         {
            _loc4_ = (_loc2_.s.isSet(_loc3_) ? _loc3_ : "") + ":" + _loc4_;
         }
         return _loc4_;
      }
      
      public function getMovieID() : *
      {
         var _loc1_:Object = null;
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         _loc1_ = this;
         _loc2_ = _loc1_.getSWFURL();
         _loc3_ = s.movieID;
         if(!_loc1_.s.isSet(_loc3_) && Boolean(_loc1_.s.isSet(_loc2_)))
         {
            _loc4_ = _loc2_.lastIndexOf("/");
            _loc5_ = _loc2_.lastIndexOf(".");
            if(_loc4_ >= 0)
            {
               _loc4_++;
            }
            else
            {
               _loc4_ = 0;
            }
            if(_loc5_ >= 0)
            {
               _loc5_ -= _loc4_;
            }
            else
            {
               _loc5_ = _loc2_.length;
            }
            _loc3_ = _loc2_.substr(_loc4_,_loc5_);
         }
         if(!_loc1_.s.isSet(_loc3_))
         {
            _loc3_ = "movieID undefined";
         }
         return _loc3_;
      }
      
      public function getIndex() : *
      {
         var _loc1_:Object = null;
         var _loc2_:String = null;
         _loc1_ = this;
         if(_loc1_.s.isSet(_loc1_.s.movie))
         {
            _loc2_ = _loc1_.s.movie.stage.stageWidth + "," + _loc1_.s.movie.stage.stageHeight + _loc1_.indexChildren(_loc1_.s.movie);
            _loc1_.index = _loc2_;
            return _loc2_;
         }
         return "";
      }
      
      private function sendClickMapEvent(param1:Object) : *
      {
         var _loc2_:Object = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:Number = NaN;
         _loc2_ = this;
         _loc3_ = _loc2_.s.getMovieURL();
         _loc4_ = _loc2_.getMovieID();
         if(_loc2_.s.isSet(_loc2_.s.trackClickMap))
         {
            _loc2_.s.objectID = _loc2_.getObjectID(param1);
         }
         if(_loc2_.s.autoTrack)
         {
            _loc5_ = _loc3_;
            _loc6_ = _loc5_.indexOf("?");
            if(_loc6_ >= 0)
            {
               _loc5_ = _loc5_.substr(0,_loc6_);
            }
            if(_loc5_.length > 100 - 23)
            {
               _loc5_ = _loc5_.substr(-(100 - 23));
            }
            _loc2_.s.trackLink(_loc3_,"o","ActionSource.AutoTrack:" + _loc5_);
         }
      }
      
      private function nodeShift(param1:DisplayObject, param2:Number, param3:Number) : *
      {
         param1.x = param2;
         param1.y = param3;
      }
      
      private function parentGetBounds(param1:DisplayObject) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         _loc2_ = param1.parent.getBounds(param1.parent);
         _loc3_ = new Object();
         _loc3_.xMin = _loc2_.x;
         _loc3_.yMin = _loc2_.y;
         _loc3_.xMax = _loc2_.x + _loc2_.width;
         _loc3_.yMax = _loc2_.y + _loc2_.height;
         return _loc3_;
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this;
         _loc2_.s.root.addEventListener(MouseEvent.CLICK,_loc2_.onMouseClick,true,0,true);
      }
      
      private function getDOMID(param1:Object) : *
      {
         var _loc2_:Object = null;
         var _loc3_:Object = null;
         _loc2_ = this;
         if(_loc2_.s.isSet(param1))
         {
            _loc3_ = _loc2_.getGeom(param1);
            return _loc2_.getFullPath(param1) + "," + _loc3_.x + "," + _loc3_.y + "," + _loc3_.w + "," + _loc3_.h;
         }
         return "";
      }
      
      private function onMouseClick(param1:MouseEvent) : void
      {
         var m:Object = null;
         var e:Object = null;
         var event:MouseEvent = param1;
         m = this;
         try
         {
            m.sendClickMapEvent(InteractiveObject(event.target));
         }
         catch(e:*)
         {
         }
      }
      
      public function getPageURL() : *
      {
         var _loc1_:Object = null;
         _loc1_ = this;
         return _loc1_.s.pageURL;
      }
      
      public function getDOMIndex() : *
      {
         var _loc1_:Object = null;
         _loc1_ = this;
         return _loc1_.getIndex();
      }
      
      public function getTrackClickMap() : *
      {
         var _loc1_:Object = null;
         _loc1_ = this;
         return _loc1_.s.trackClickMap.toString();
      }
      
      private function indexChildren(param1:DisplayObjectContainer) : String
      {
         var _loc2_:Object = null;
         var _loc3_:String = null;
         var _loc4_:Number = NaN;
         var _loc5_:DisplayObject = null;
         _loc2_ = this;
         _loc3_ = new String();
         _loc4_ = 0;
         while(_loc4_ < param1.numChildren)
         {
            _loc5_ = param1.getChildAt(_loc4_);
            if(_loc2_.s.isSet(_loc5_))
            {
               _loc3_ += "|" + _loc2_.getDOMID(_loc5_);
               if(_loc5_ is DisplayObjectContainer)
               {
                  _loc3_ += _loc2_.indexChildren(DisplayObjectContainer(_loc5_));
               }
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      private function nodePos(param1:DisplayObject) : *
      {
         var _loc2_:* = undefined;
         _loc2_ = new Object();
         _loc2_.x = param1.x;
         _loc2_.y = param1.y;
         return _loc2_;
      }
      
      public function getCharSet() : *
      {
         var _loc1_:Object = null;
         _loc1_ = this;
         return _loc1_.s.charSet;
      }
      
      public function getAccount() : *
      {
         var _loc1_:Object = null;
         _loc1_ = this;
         return _loc1_.s.account;
      }
      
      private function getGeom(param1:Object) : *
      {
         var _loc2_:Object = null;
         var _loc3_:Object = null;
         var _loc4_:Object = null;
         var _loc5_:Object = null;
         var _loc6_:Object = null;
         var _loc7_:Object = null;
         var _loc8_:Object = null;
         _loc2_ = this;
         _loc3_ = new Object();
         _loc6_ = _loc2_.parentGetBounds(param1);
         _loc4_ = _loc2_.nodePos(param1);
         _loc5_ = _loc2_.nodePos(param1);
         _loc2_.nodeShift(param1,_loc6_.xMin,_loc6_.yMin);
         _loc7_ = _loc2_.parentGetBounds(param1);
         _loc2_.nodeShift(param1,_loc6_.xMax,_loc6_.yMax);
         _loc8_ = _loc2_.parentGetBounds(param1);
         _loc2_.nodeShift(param1,_loc4_.x,_loc4_.y);
         _loc4_.x += _loc7_.xMin - _loc6_.xMin;
         _loc4_.y += _loc7_.yMin - _loc6_.yMin;
         _loc5_.x += _loc8_.xMax - _loc6_.xMax;
         _loc5_.y += _loc8_.yMax - _loc6_.yMax;
         _loc2_.parentLocalToGlobal(param1,_loc4_);
         _loc2_.parentLocalToGlobal(param1,_loc5_);
         _loc3_.x = Math.round(_loc4_.x);
         _loc3_.y = Math.round(_loc4_.y);
         _loc3_.w = Math.ceil(_loc5_.x - _loc4_.x);
         _loc3_.h = Math.ceil(_loc5_.y - _loc4_.y);
         return _loc3_;
      }
      
      private function parentLocalToGlobal(param1:DisplayObject, param2:Object) : *
      {
         var _loc3_:* = undefined;
         _loc3_ = new Point(param2.x,param2.y);
         param1.parent.localToGlobal(_loc3_);
         param2.x = _loc3_.x;
         param2.y = _loc3_.y;
      }
   }
}

