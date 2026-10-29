package com.omniture
{
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   
   public dynamic class ActionSource_Module_Media
   {
      
      public var trackEvents:String;
      
      public var playerName:String;
      
      public var trackVars:String;
      
      private var _autoTrack:Boolean;
      
      private var list:Object;
      
      private var s:Object;
      
      private var autoTrackDone:Boolean;
      
      public function ActionSource_Module_Media(param1:Object)
      {
         var _loc2_:Object = null;
         super();
         _loc2_ = this;
         _loc2_.s = param1;
      }
      
      public function listenerMedia_scrubbing(param1:*) : *
      {
         this.listenerMedia.scrubbing(param1);
      }
      
      public function stop(param1:String, param2:Number) : *
      {
         this.event(param1,2,param2);
      }
      
      private function attach(param1:Object) : *
      {
         var m:Object = null;
         var member:String = null;
         var childNum:Number = NaN;
         var monitor:Object = null;
         var node:Object = param1;
         m = this;
         if(m.s.isSet(node))
         {
            if(Boolean(m.s.isSet(node,"addEventListener")) && Boolean(m.s.isSet(node,"isFLVCuePointEnabled")))
            {
               if(!m.s.isSet(m.listenerFLVPlayback))
               {
                  m.listenerFLVPlayback = new Object();
                  m.listenerFLVPlayback.m = m;
                  m.listenerFLVPlayback.playerName = "Flash FLVPlayback";
                  m.listenerFLVPlayback.handleEvent = function(param1:Object, param2:Number):*
                  {
                     var _loc3_:Object = null;
                     var _loc4_:String = null;
                     var _loc5_:Number = NaN;
                     var _loc6_:Number = NaN;
                     _loc3_ = this.m;
                     if(Boolean(_loc3_.s.isSet(_loc3_.autoTrack)) && Boolean(_loc3_.s.isSet(param1)))
                     {
                        if(_loc3_.s.flashASVersion > 2)
                        {
                           _loc4_ = param1.source;
                        }
                        else
                        {
                           _loc4_ = param1.contentPath;
                        }
                        _loc5_ = Number(param1.totalTime);
                        _loc6_ = Number(param1.playheadTime);
                        _loc3_.autoEvent(_loc4_,_loc5_,this.playerName,param2,_loc6_,param1);
                     }
                  };
                  m.listenerFLVPlayback.stateChange = function(param1:*):*
                  {
                     var _loc2_:Object = null;
                     var _loc3_:Number = NaN;
                     var _loc4_:Object = null;
                     _loc2_ = this.m;
                     _loc3_ = -1;
                     if(Boolean(_loc2_.s.isSet(param1)) && Boolean(_loc2_.s.isSet(param1.target)))
                     {
                        _loc4_ = param1.target;
                        if(_loc2_.s.isSet(_loc4_,"state"))
                        {
                           if(_loc4_.state == "playing")
                           {
                              _loc3_ = 1;
                           }
                           else if(_loc4_.state == "stopped" || _loc4_.state == "paused" || _loc4_.state == "buffering" || _loc4_.state == "rewinding" || _loc4_.state == "seeking")
                           {
                              _loc3_ = 2;
                           }
                           if(_loc3_ >= 0)
                           {
                              this.handleEvent(param1.target,_loc3_);
                           }
                        }
                     }
                  };
                  m.listenerFLVPlayback.complete = function(param1:*):*
                  {
                     if(this.m.s.isSet(param1))
                     {
                        this.handleEvent(param1.target,0);
                     }
                  };
               }
               if(m.s.flashASVersion > 2)
               {
                  node.addEventListener("complete",m.listenerFLVPlayback_complete);
                  node.addEventListener("stateChange",m.listenerFLVPlayback_stateChange);
               }
               else
               {
                  node.addEventListener("complete",m.listenerFLVPlayback);
                  node.addEventListener("stateChange",m.listenerFLVPlayback);
               }
               monitor = new Object();
               monitor.m = m;
               monitor.node = node;
               monitor.watch = function():*
               {
                  var _loc1_:Object = null;
                  var _loc2_:Object = null;
                  _loc1_ = this.m;
                  _loc2_ = this.node;
                  if(Boolean(_loc1_.s.isSet(_loc2_.state)) && _loc2_.state == "playing")
                  {
                     this.m.listenerFLVPlayback.handleEvent(_loc2_,3);
                  }
               };
               m.startMonitor(monitor);
            }
            else if(Boolean(m.s.isSet(node,"addEventListener")) && Boolean(m.s.isSet(node,"addCuePoint")))
            {
               if(!m.s.isSet(m.listenerMedia))
               {
                  m.listenerMedia = new Object();
                  m.listenerMedia.m = m;
                  m.listenerMedia.playerName = "Flash Media";
                  m.listenerMedia.handleEvent = function(param1:Object, param2:Number):*
                  {
                     var _loc3_:Object = null;
                     var _loc4_:String = null;
                     var _loc5_:Number = NaN;
                     var _loc6_:Number = NaN;
                     _loc3_ = this.m;
                     if(Boolean(_loc3_.s.isSet(_loc3_.autoTrack)) && Boolean(_loc3_.s.isSet(param1)))
                     {
                        _loc4_ = param1.contentPath;
                        _loc5_ = Number(param1.totalTime);
                        _loc6_ = Number(param1.playheadTime);
                        _loc3_.autoEvent(_loc4_,_loc5_,this.playerName,param2,_loc6_,param1);
                     }
                  };
                  m.listenerMedia.complete = function(param1:*):*
                  {
                     if(this.m.s.isSet(param1))
                     {
                        this.handleEvent(param1.target,0);
                     }
                  };
                  m.listenerMedia.click = function(param1:*):*
                  {
                     if(Boolean(this.m.s.isSet(param1)) && Boolean(this.m.s.isSet(param1.target)))
                     {
                        this.handleEvent(param1.target,this.m.s.isSet(param1.target.playing) ? 1 : 2);
                     }
                  };
                  m.listenerMedia.change = function(param1:*):*
                  {
                     if(Boolean(this.m.s.isSet(param1)) && Boolean(this.m.s.isSet(param1.target)))
                     {
                        this.handleEvent(param1.target,this.m.s.isSet(param1.target.playing) ? 1 : 2);
                     }
                  };
                  m.listenerMedia.scrubbing = function(param1:*):*
                  {
                     if(this.m.s.isSet(param1))
                     {
                        this.handleEvent(param1.target,2);
                     }
                  };
               }
               if(m.s.flashASVersion > 2)
               {
                  node.addEventListener("complete",m.listenerMedia_complete);
                  node.addEventListener("click",m.listenerMedia_click);
                  node.addEventListener("change",m.listenerMedia_change);
                  node.addEventListener("scrubbing",m.listenerMedia_scrubbing);
               }
               else
               {
                  node.addEventListener("complete",m.listenerMedia);
                  node.addEventListener("click",m.listenerMedia);
                  node.addEventListener("change",m.listenerMedia);
                  node.addEventListener("scrubbing",m.listenerMedia);
               }
               monitor = new Object();
               monitor.m = m;
               monitor.node = node;
               monitor.watch = function():*
               {
                  var _loc1_:Object = null;
                  var _loc2_:Object = null;
                  _loc1_ = this.m;
                  _loc2_ = this.node;
                  if(_loc1_.s.isSet(_loc2_.playing))
                  {
                     this.m.listenerMedia.handleEvent(_loc2_,3);
                  }
               };
               m.startMonitor(monitor);
            }
            else if(m.s.flashASVersion > 2)
            {
               if(Boolean(m.s.isSet(node,"numChildren")) && Boolean(m.s.isSet(node,"getChildAt")))
               {
                  childNum = 0;
                  while(childNum < node.numChildren)
                  {
                     m.attach(node.getChildAt(childNum));
                     childNum++;
                  }
               }
            }
            else
            {
               for(member in node)
               {
                  if(Boolean(m.s.isSet(node[member]) && m.s.isSet(node[member]._name)) && Boolean(node[member]._name == member) && "" + node + "." + member == "" + node[member])
                  {
                     m.attach(node[member]);
                  }
               }
            }
         }
      }
      
      public function listenerMedia_change(param1:*) : *
      {
         this.listenerMedia.change(param1);
      }
      
      public function open(param1:String, param2:Number, param3:String, param4:Object = null) : *
      {
         this._open(param1,param2,param3,param4);
      }
      
      public function listenerMedia_click(param1:*) : *
      {
         this.listenerMedia.click(param1);
      }
      
      private function event(param1:String, param2:Number, param3:Number) : *
      {
         var _loc4_:Object = null;
         var _loc5_:Object = null;
         var _loc6_:Date = null;
         var _loc7_:Number = NaN;
         var _loc8_:String = null;
         _loc4_ = this;
         _loc6_ = new Date();
         _loc7_ = Math.floor(_loc6_.getTime() / 1000);
         _loc8_ = "--**--";
         param1 = _loc4_.cleanName(param1);
         _loc5_ = Boolean(_loc4_.s.isSet(param1)) && Boolean(_loc4_.s.isSet(_loc4_.list)) && Boolean(_loc4_.s.isSet(_loc4_.list[param1])) ? _loc4_.list[param1] : null;
         if(_loc4_.s.isSet(_loc5_))
         {
            if(param2 == 3 || param2 != _loc5_.lastEventType && (param2 != 2 || _loc5_.lastEventType == 1))
            {
               if(_loc4_.s.isSet(param2))
               {
                  if(param3 < 0 && _loc5_.lastEventTimestamp > 0)
                  {
                     param3 = _loc7_ - _loc5_.lastEventTimestamp + _loc5_.lastEventOffset;
                     param3 = param3 < _loc5_.length ? param3 : _loc5_.length - 1;
                  }
                  param3 = Math.floor(param3);
                  if((param2 == 2 || param2 == 3) && _loc5_.lastEventOffset < param3)
                  {
                     _loc5_.timePlayed += param3 - _loc5_.lastEventOffset;
                  }
                  if(param2 != 3)
                  {
                     _loc5_.session += (param2 == 1 ? "S" : "E") + param3;
                     _loc5_.lastEventType = param2;
                  }
                  else if(_loc5_.lastEventType != 1)
                  {
                     _loc4_.event(param1,1,param3);
                  }
                  _loc5_.lastEventTimestamp = _loc7_;
                  _loc5_.lastEventOffset = param3;
                  _loc4_.s.pe = "media";
                  _loc4_.s.pev3 = "" + escape(_loc5_.name) + _loc8_ + _loc5_.length + _loc8_ + escape(_loc5_.playerName) + _loc8_ + _loc5_.timePlayed + _loc8_ + _loc5_.timestamp + _loc8_ + _loc5_.session + (param2 == 3 ? "E" + param3 : "");
                  _loc4_.s.track(null,"Media." + param1);
               }
               else
               {
                  _loc4_.event(param1,2,-1);
                  _loc4_.list[param1] = 0;
                  _loc4_.s.flushBufferedRequest(_loc4_.s.account,"Media." + param1);
               }
            }
         }
      }
      
      public function get autoTrack() : Boolean
      {
         return this._autoTrack;
      }
      
      private function startMonitor(param1:Object) : *
      {
         var monitor:Object = param1;
         monitor.update = function(param1:*):*
         {
            if(param1.m == null || param1.m == undefined || param1.m.s == null || param1.m.s == undefined || param1.node == null || param1.node == undefined)
            {
               clearInterval(param1.interval);
            }
            else
            {
               param1.watch();
            }
         };
         monitor.interval = setInterval(monitor.update,5000,monitor);
      }
      
      public function listenerMedia_complete(param1:*) : *
      {
         this.listenerMedia.complete(param1);
      }
      
      public function listenerFLVPlayback_complete(param1:*) : *
      {
         this.listenerFLVPlayback.complete(param1);
      }
      
      private function _open(param1:String, param2:Number, param3:String, param4:Object) : *
      {
         var _loc5_:Object = null;
         var _loc6_:Object = null;
         var _loc7_:Date = null;
         var _loc8_:String = null;
         var _loc9_:String = null;
         _loc5_ = this;
         _loc6_ = new Object();
         _loc7_ = new Date();
         _loc8_ = "";
         param1 = _loc5_.cleanName(param1);
         param2 = Math.floor(param2);
         if(!_loc5_.s.isSet(param2))
         {
            param2 = 1;
         }
         if(Boolean(_loc5_.s.isSet(param1)) && Boolean(_loc5_.s.isSet(param2)) && Boolean(_loc5_.s.isSet(param3)))
         {
            if(!_loc5_.s.isSet(_loc5_.list))
            {
               _loc5_.list = new Object();
            }
            if(_loc5_.s.isSet(_loc5_.list[param1]))
            {
               _loc5_.close(param1);
            }
            if(_loc5_.s.isSet(param4))
            {
               _loc8_ = "" + param4;
            }
            for(_loc9_ in _loc5_.list)
            {
               if(Boolean(_loc5_.s.isSet(_loc5_.list[_loc9_])) && _loc5_.list[_loc9_].playerID == _loc8_)
               {
                  _loc5_.close(_loc5_.list[_loc9_].name);
               }
            }
            _loc6_.name = param1;
            _loc6_.length = param2;
            _loc6_.playerName = _loc5_.cleanName(_loc5_.s.isSet(_loc5_.playerName) ? _loc5_.playerName : param3);
            _loc6_.playerID = _loc8_;
            _loc6_.timePlayed = 0;
            _loc6_.timestamp = Math.floor(_loc7_.getTime() / 1000);
            _loc6_.lastEventType = 0;
            _loc6_.lastEventTimestamp = _loc6_.timestamp;
            _loc6_.lastEventOffset = 0;
            _loc6_.session = "";
            _loc6_.eventList = new Object();
            _loc5_.list[param1] = _loc6_;
         }
      }
      
      private function autoEvent(param1:String, param2:Number, param3:String, param4:Number, param5:Number, param6:Object) : *
      {
         var _loc7_:Object = null;
         _loc7_ = this;
         param1 = _loc7_.cleanName(param1);
         if(Boolean(_loc7_.s.isSet(param1)) && Boolean(_loc7_.s.isSet(param2)) && Boolean(_loc7_.s.isSet(param3)))
         {
            if(!_loc7_.s.isSet(_loc7_.list) || !_loc7_.s.isSet(_loc7_.list[param1]))
            {
               _loc7_.open(param1,param2,param3,param6);
            }
            _loc7_.event(param1,param4,param5);
         }
      }
      
      private function cleanName(param1:String) : String
      {
         var _loc2_:Object = null;
         _loc2_ = this;
         return _loc2_.s.replace(_loc2_.s.replace(_loc2_.s.replace(param1,"\n",""),"\r",""),"--**--","");
      }
      
      public function set autoTrack(param1:Boolean) : *
      {
         this._autoTrack = param1;
         if(this._autoTrack && !this.autoTrackDone && Boolean(this.s.isSet(this.s.movie)))
         {
            this.autoTrackDone = true;
            this.attach(this.s.movie);
         }
      }
      
      public function listenerFLVPlayback_stateChange(param1:*) : *
      {
         this.listenerFLVPlayback.stateChange(param1);
      }
      
      public function play(param1:String, param2:Number) : *
      {
         var m:Object = null;
         var media:Object = null;
         var monitor:Object = null;
         var name:String = param1;
         var offset:Number = param2;
         m = this;
         m.event(name,1,offset);
         monitor = new Object();
         monitor.m = m;
         monitor.node = m.cleanName(name);
         monitor.watch = function():*
         {
            var _loc1_:Object = null;
            var _loc2_:Object = null;
            var _loc3_:Object = null;
            _loc1_ = this.m;
            _loc2_ = this.node;
            _loc3_ = Boolean(_loc1_.s.isSet(_loc2_)) && Boolean(_loc1_.s.isSet(_loc1_.list)) && Boolean(_loc1_.s.isSet(_loc1_.list[_loc2_])) ? _loc1_.list[_loc2_] : null;
            if(_loc1_.s.isSet(_loc3_))
            {
               if(_loc3_.lastEventType == 1)
               {
                  _loc1_.event(_loc3_.name,3,-1);
               }
            }
            else
            {
               this.node = null;
            }
         };
         m.startMonitor(monitor);
      }
      
      public function close(param1:String) : *
      {
         this.event(param1,0,-1);
      }
   }
}

