package com.omniture
{
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.external.ExternalInterface;
   import flash.net.SharedObject;
   import flash.net.URLRequest;
   import flash.net.sendToURL;
   import flash.system.Capabilities;
   import flash.utils.clearInterval;
   import flash.utils.getQualifiedClassName;
   import flash.utils.setInterval;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2047")]
   public dynamic class ActionSource extends Sprite
   {
      
      private var onLoadTracked:Boolean = false;
      
      public var account:String;
      
      public var _movie:Object;
      
      private var delayTrackingInterval:Number;
      
      public var movieID:String;
      
      public var debugTracking:Boolean = false;
      
      public var flashASVersion:Number = 3;
      
      private var _moduleMediaVariables:Object;
      
      public var otherVariables:Object;
      
      public var pageURL:String;
      
      private var requestNum:Number;
      
      public var dc:Number;
      
      public var visitorNamespace:String;
      
      private var trackCalled:Boolean = false;
      
      public var flashVersion:Number;
      
      private var _trackOnLoad:Boolean = false;
      
      public var ClickMap:ActionSource_Module_ClickMap;
      
      public var version:String;
      
      public var trackingServer:String;
      
      public var autoTrack:Boolean;
      
      public var trackLocal:Boolean = true;
      
      public var trackingServerSecure:String;
      
      private var flashRoot:Object;
      
      private var accountConfigList:Array;
      
      public var lastRequest:String;
      
      public var trackClickMap:Boolean;
      
      private var flashLivePreview:Boolean = false;
      
      public var charSet:String;
      
      public var delayTracking:Number;
      
      private var trackOnLoadInterval:Number;
      
      private var accountVarList:Array;
      
      public var pageName:String;
      
      private var _root:Object;
      
      private var requiredVarList:Array;
      
      private var delayTrackingStage:Number;
      
      public var requestList:Array;
      
      public var Media:ActionSource_Module_Media;
      
      public function ActionSource()
      {
         var _loc1_:Object = null;
         var _loc2_:Number = NaN;
         var _loc3_:String = null;
         var _loc4_:Array = null;
         flashASVersion = 3;
         flashLivePreview = false;
         trackLocal = true;
         debugTracking = false;
         _trackOnLoad = false;
         onLoadTracked = false;
         trackCalled = false;
         super();
         _loc1_ = this;
         _loc1_.initPre();
         _loc1_.version = "FAS-2.2";
         if(_loc1_.isSet(_root))
         {
            _loc1_.movie = _root;
         }
         else if(_loc1_.isSet(root))
         {
            _loc1_.movie = root;
         }
         _loc3_ = getVersion();
         _loc4_ = _loc3_.split(" ");
         _loc1_.flashVersion = parseInt(_loc4_[1].substr(0,1));
         _loc1_.requestNum = 0;
         _loc1_.requestList = new Array();
         _loc1_.lastRequest = "";
         _loc1_.requiredVarList = ["visitorID","vmk","charSet","visitorNamespace","cookieDomainPeriods","cookieLifetime","pageName","pageURL","referrer","currencyCode"];
         _loc1_.accountVarList = ["purchaseID","variableProvider","channel","server","pageType","transactionID","campaign","state","zip","events","products"];
         _loc2_ = _loc1_.requiredVarList.length - 1;
         while(_loc2_ >= 0)
         {
            _loc1_.accountVarList.unshift(_loc1_.requiredVarList[_loc2_]);
            _loc2_--;
         }
         _loc2_ = 1;
         while(_loc2_ <= 50)
         {
            _loc1_.accountVarList.push("prop" + _loc2_);
            _loc1_.accountVarList.push("eVar" + _loc2_);
            _loc1_.accountVarList.push("hier" + _loc2_);
            _loc2_++;
         }
         _loc1_.accountVarList.push("pe");
         _loc1_.accountVarList.push("pev1");
         _loc1_.accountVarList.push("pev2");
         _loc1_.accountVarList.push("pev3");
         _loc1_.requiredVarList.push("pe");
         _loc1_.requiredVarList.push("pev1");
         _loc1_.requiredVarList.push("pev2");
         _loc1_.requiredVarList.push("pev3");
         _loc1_.accountConfigList = ["trackDownloadLinks","trackExternalLinks","trackClickMap","linkLeaveQueryString","linkTrackVars","linkTrackEvents","trackingServer","trackingServerSecure","dc","movieID","autoTrack","delayTracking","trackLocal","debugTracking"];
         _loc1_.modulesInit();
         _loc1_.initPost();
      }
      
      public function clearVars() : *
      {
         var _loc1_:Object = null;
         var _loc2_:Number = NaN;
         var _loc3_:String = null;
         _loc1_ = this;
         _loc2_ = 0;
         while(_loc2_ < accountVarList.length)
         {
            _loc3_ = _loc1_.accountVarList[_loc2_];
            if(_loc3_.substr(0,4) == "prop" || _loc3_.substr(0,4) == "eVar" || _loc3_.substr(0,4) == "hier" || _loc3_ == "channel" || _loc3_ == "events" || _loc3_ == "purchaseID" || _loc3_ == "transactionID" || _loc3_ == "products" || _loc3_ == "state" || _loc3_ == "zip" || _loc3_ == "campaign")
            {
               _loc1_[_loc3_] = undefined;
            }
            _loc2_++;
         }
      }
      
      private function variableOverridesBuild(param1:Object) : *
      {
         var _loc2_:Object = null;
         var _loc3_:Number = NaN;
         var _loc4_:String = null;
         _loc2_ = this;
         _loc3_ = 0;
         while(_loc3_ < _loc2_.accountVarList.length)
         {
            _loc4_ = _loc2_.accountVarList[_loc3_];
            if(!_loc2_.isSet(param1[_loc4_]))
            {
               param1[_loc4_] = _loc2_[_loc4_];
               if(!_loc2_.isSet(param1[_loc4_]))
               {
                  param1["!" + _loc4_] = 1;
               }
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < _loc2_.accountConfigList.length)
         {
            _loc4_ = _loc2_.accountConfigList[_loc3_];
            if(!_loc2_.isSet(param1[_loc4_]))
            {
               param1[_loc4_] = _loc2_[_loc4_];
               if(!_loc2_.isSet(param1[_loc4_]))
               {
                  param1["!" + _loc4_] = 1;
               }
            }
            _loc3_++;
         }
      }
      
      private function flushRequestList() : *
      {
         var _loc1_:Object = null;
         var _loc2_:String = null;
         var _loc3_:Array = null;
         var _loc4_:Number = NaN;
         _loc1_ = this;
         while(_loc1_.requestNum < _loc1_.requestList.length)
         {
            if(_loc1_.isSet(_loc1_.debugTracking))
            {
               _loc2_ = "ActionSource Debug: " + _loc1_.requestList[_loc1_.requestNum];
               _loc3_ = _loc1_.requestList[_loc1_.requestNum].split("&");
               _loc4_ = 0;
               while(_loc4_ < _loc3_.length)
               {
                  _loc2_ += "\n\t" + unescape(_loc3_[_loc4_]);
                  _loc4_++;
               }
               trace(_loc2_);
            }
            _loc1_.requestURL(_loc1_.requestList[_loc1_.requestNum]);
            _loc1_.lastRequest = _loc1_.requestList[_loc1_.requestNum];
            ++_loc1_.requestNum;
         }
      }
      
      private function bufferRequest(param1:String, param2:String, param3:String) : *
      {
         var _loc4_:Object = null;
         var _loc5_:Object = null;
         var _loc6_:Object = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         _loc4_ = this;
         _loc5_ = _loc4_.getBufferedRequests();
         if(_loc4_.isSet(_loc5_))
         {
            _loc8_ = -1;
            _loc7_ = 0;
            while(_loc7_ < _loc5_.data.list.length)
            {
               if(_loc5_.data.list[_loc7_].id == param2)
               {
                  _loc5_.data.list[_loc7_].request = param3;
                  param3 = "";
               }
               else if(!_loc4_.isSet(_loc5_.data.list[_loc7_].id))
               {
                  _loc8_ = _loc7_;
               }
               _loc7_++;
            }
            if(_loc4_.isSet(param3))
            {
               _loc6_ = new Object();
               _loc6_.account = param1;
               _loc6_.id = param2;
               _loc6_.request = param3;
               if(_loc8_ >= 0)
               {
                  _loc5_.data.list[_loc8_] = _loc6_;
               }
               else
               {
                  _loc5_.data.list.push(_loc6_);
               }
            }
            _loc5_.flush();
         }
      }
      
      private function requestURL(param1:*) : *
      {
         var _loc2_:URLRequest = null;
         _loc2_ = new URLRequest(param1);
         sendToURL(_loc2_);
      }
      
      private function _trackLink(param1:String, param2:String, param3:String, param4:Object) : *
      {
         var _loc5_:Object = null;
         _loc5_ = this;
         _loc5_.linkURL = param1;
         _loc5_.linkType = param2;
         _loc5_.linkName = param3;
         _loc5_.track(param4);
      }
      
      public function set movie(param1:Object) : *
      {
         this._movie = param1;
         if(this.isSet(this._movie))
         {
            if(!this.flashLivePreview)
            {
               if(this.flashASVersion < 3)
               {
                  this._movie.s_s = this;
               }
               this.modulesUpdate();
            }
         }
      }
      
      private function queryStringLinkTracking() : String
      {
         var _loc1_:Object = null;
         var _loc2_:String = null;
         var _loc3_:Number = NaN;
         _loc1_ = this;
         _loc2_ = "";
         if(Boolean(_loc1_.isSet(_loc1_.linkType)) && (Boolean(_loc1_.isSet(_loc1_.linkURL)) || Boolean(_loc1_.isSet(_loc1_.linkName))))
         {
            _loc1_.linkType = _loc1_.linkType.toLowerCase();
            if(_loc1_.linkType != "d" && _loc1_.linkType != "e")
            {
               _loc1_.linkType = "o";
            }
            if(Boolean(_loc1_.isSet(_loc1_.linkURL)) && !_loc1_.isSet(_loc1_.linkLeaveQueryString))
            {
               _loc3_ = Number(_loc1_.linkURL.indexOf("?"));
               if(_loc3_ >= 0)
               {
                  _loc1_.linkURL = _loc1_.linkURL.substr(0,_loc3_);
               }
            }
            _loc2_ += "&pe=lnk_" + escape(_loc1_.linkType.toLowerCase());
            _loc2_ += _loc1_.isSet(_loc1_.linkURL) ? "&pev1=" + escape(_loc1_.linkURL) : "";
            _loc2_ += _loc1_.isSet(_loc1_.linkName) ? "&pev2=" + escape(_loc1_.linkName) : "";
         }
         return _loc2_;
      }
      
      private function _track(param1:Object, param2:String) : *
      {
         var _loc3_:Object = null;
         var _loc4_:Object = null;
         var _loc5_:Date = null;
         var _loc6_:Number = NaN;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc10_:Number = NaN;
         var _loc11_:String = null;
         _loc3_ = this;
         _loc5_ = new Date();
         _loc6_ = Math.floor(Math.random() * 10000000000000);
         _loc7_ = "s" + Math.floor(_loc5_.getTime() / 10800000) % 10 + _loc6_;
         _loc8_ = "" + _loc5_.getDate() + "/" + _loc5_.getMonth() + "/" + _loc5_.getFullYear() + " " + _loc5_.getHours() + ":" + _loc5_.getMinutes() + ":" + _loc5_.getSeconds() + " " + _loc5_.getDay() + " " + _loc5_.getTimezoneOffset();
         _loc9_ = "t=" + escape(_loc8_);
         if(_loc3_.isSet(_loc3_.flashLivePreview))
         {
            return;
         }
         if(_loc3_.isSet(_loc3_.otherVariables))
         {
            _loc10_ = 0;
            while(_loc10_ < _loc3_.accountVarList.length)
            {
               _loc11_ = _loc3_.accountVarList[_loc10_];
               if(_loc3_.isSet(_loc3_.otherVariables[_loc11_]))
               {
                  _loc3_[_loc11_] = _loc3_.otherVariables[_loc11_];
               }
               _loc10_++;
            }
            _loc10_ = 0;
            while(_loc10_ < _loc3_.accountConfigList.length)
            {
               _loc11_ = _loc3_.accountConfigList[_loc10_];
               if(_loc3_.isSet(_loc3_.otherVariables[_loc11_]))
               {
                  _loc3_[_loc11_] = _loc3_.otherVariables[_loc11_];
               }
               _loc10_++;
            }
         }
         if(_loc3_.isSet(param1))
         {
            _loc4_ = new Object();
            _loc3_.variableOverridesBuild(_loc4_);
            _loc3_.variableOverridesApply(param1);
         }
         if(Boolean(_loc3_.isSet(_loc3_.usePlugins)) && Boolean(_loc3_.isSet(_loc3_.doPlugins)))
         {
            _loc3_.doPlugins(_loc3_);
         }
         if(_loc3_.isSet(_loc3_.account))
         {
            if(!_loc3_.isSet(_loc3_.pageURL))
            {
               _loc3_.pageURL = _loc3_.getMovieURL();
            }
            if(!_loc3_.isSet(_loc3_.referrer))
            {
               _loc3_.referrer = _loc3_.getMovieReferrer();
            }
            _loc9_ += _loc3_.queryStringAccountVariables();
            _loc9_ = _loc9_ + _loc3_.queryStringLinkTracking();
            _loc9_ = _loc9_ + _loc3_.queryStringClickMap();
            _loc9_ = _loc9_ + _loc3_.queryStringTechnology();
            _loc3_.makeRequest(_loc7_,_loc9_,"",param2);
         }
         if(_loc3_.isSet(param1))
         {
            _loc3_.variableOverridesApply(_loc4_);
         }
         _loc3_.pe = undefined;
         _loc3_.pev1 = undefined;
         _loc3_.pev2 = undefined;
         _loc3_.pev3 = undefined;
         _loc3_.linkURL = undefined;
         _loc3_.linkName = undefined;
         _loc3_.linkType = undefined;
         _loc3_.objectID = undefined;
         if(_loc3_.isSet(_loc3_.account))
         {
            if(!_loc3_.isSet(param2) && !_loc3_.isSet(_loc3_.trackCalled))
            {
               _loc3_.trackCalled = true;
               _loc3_.flushBufferedRequests();
            }
         }
      }
      
      public function get trackOnLoad() : Boolean
      {
         return this._trackOnLoad;
      }
      
      private function callJavaScript(param1:String) : *
      {
         var s:Object = null;
         var e:Object = null;
         var script:String = param1;
         s = this;
         try
         {
            if(Boolean(s.isSet(ExternalInterface)) && Boolean(s.isSet(ExternalInterface.available)) && Boolean(s.isSet(ExternalInterface.call)))
            {
               return ExternalInterface.call(script);
            }
         }
         catch(e:*)
         {
         }
         return null;
      }
      
      private function getVersion() : String
      {
         return Capabilities.version;
      }
      
      private function makeRequest(param1:String, param2:String, param3:String, param4:String) : *
      {
         var _loc5_:Object = null;
         var _loc6_:* = undefined;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:Number = NaN;
         _loc5_ = this;
         _loc6_ = _loc5_.getMovieURL();
         if(!_loc5_.isSet(param3))
         {
            if(_loc5_.isSet(_loc5_.trackingServer))
            {
               _loc7_ = _loc5_.trackingServer;
               if(Boolean(_loc5_.isSet(_loc5_.trackingServerSecure)) && _loc6_.toLowerCase().substr(0,6) == "https:")
               {
                  _loc7_ = _loc5_.trackingServerSecure;
               }
            }
            else
            {
               _loc8_ = _loc5_.visitorNamespace;
               if(!_loc5_.isSet(_loc8_))
               {
                  _loc8_ = _loc5_.account;
                  _loc9_ = _loc8_.indexOf(",");
                  if(_loc9_ >= 0)
                  {
                     _loc8_ = _loc8_.substr(0,_loc9_);
                  }
                  _loc8_ = _loc8_.split("_").join("-");
               }
               _loc7_ = _loc8_ + "." + (_loc5_.isSet(_loc5_.dc) ? _loc5_.dc : 112) + ".2o7.net";
            }
            if(_loc6_.toLowerCase().substr(0,6) == "https:")
            {
               param3 = "https://";
            }
            else
            {
               param3 = "http://";
            }
            param3 += _loc7_ + "/b/ss/" + _loc5_.account + "/0/" + _loc5_.version + "-AS" + _loc5_.flashASVersion + "/" + param1 + "?[AQB]&ndh=1&" + param2 + "&[AQE]";
            if(_loc5_.isSet(param4))
            {
               _loc5_.bufferRequest(_loc5_.account,param4,param3);
               return;
            }
         }
         if(_loc6_.toLowerCase().substr(0,6) == "https:" && param3.toLowerCase().substr(0,5) == "http:")
         {
            param3 = "https:" + param3.substr(5);
         }
         if(Boolean(_loc5_.isSet(_loc5_.trackLocal) || _loc5_.flashVersion < 8) || Boolean(!_loc5_.isSet(_loc6_)) || _loc6_.toLowerCase().substr(0,4) == "http")
         {
            _loc5_.requestList.push(param3);
            if(!_loc5_.isSet(_loc5_.delayTracking) || Boolean(_loc5_.isSet(_loc5_.delayTrackingStage)) && Boolean(_loc5_.delayTrackingStage == 2))
            {
               _loc5_.flushRequestList();
            }
            else if(Boolean(_loc5_.isSet(_loc5_.delayTracking)) && !_loc5_.isSet(_loc5_.delayTrackingStage))
            {
               _loc5_.delayTrackingStage = 1;
               _loc5_.startDelayTrackingInterval();
            }
         }
      }
      
      public function replace(param1:String, param2:String, param3:String) : String
      {
         if(this.isSet(param1))
         {
            if(param1.indexOf(param2) >= 0)
            {
               return param1.split(param2).join(param3);
            }
         }
         return param1;
      }
      
      private function queryStringClickMap() : String
      {
         var _loc1_:Object = null;
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:Number = NaN;
         var _loc5_:String = null;
         var _loc6_:Number = NaN;
         var _loc7_:String = null;
         _loc1_ = this;
         _loc2_ = "";
         _loc3_ = _loc1_.pageName;
         _loc4_ = 1;
         _loc5_ = _loc1_.objectID;
         _loc6_ = 1;
         _loc7_ = "FLASH";
         if(!_loc1_.isSet(_loc3_))
         {
            _loc3_ = _loc1_.pageURL;
            _loc4_ = 0;
         }
         if(Boolean(_loc1_.isSet(_loc1_.trackClickMap)) && Boolean(_loc1_.isSet(_loc3_)) && Boolean(_loc1_.isSet(_loc5_)) && Boolean(_loc1_.isSet(_loc7_)))
         {
            _loc2_ += "&pid=" + escape(_loc3_);
            _loc2_ += _loc1_.isSet(_loc4_) ? "&pidt=" + escape("" + _loc4_) : "";
            _loc2_ += "&oid=" + escape(_loc5_.substr(0,100));
            _loc2_ += _loc1_.isSet(_loc6_) ? "&oidt=" + escape("" + _loc6_) : "";
            _loc2_ += "&ot=" + escape(_loc7_);
         }
         return _loc2_;
      }
      
      private function queryStringTechnology() : String
      {
         var _loc1_:Object = null;
         var _loc2_:String = null;
         var _loc3_:Object = null;
         _loc1_ = this;
         _loc2_ = "";
         _loc3_ = Capabilities;
         if(Boolean(_loc1_.isSet(_loc3_)) && Boolean(_loc1_.isSet(_loc3_.screenResolutionX)) && Boolean(_loc1_.isSet(_loc3_.screenResolutionY)))
         {
            _loc2_ += "&s=" + _loc3_.screenResolutionX + "x" + _loc3_.screenResolutionY;
         }
         return _loc2_;
      }
      
      public function isSet(param1:*, param2:String = null) : Boolean
      {
         var e:Object = null;
         var val:* = param1;
         var mbr:String = param2;
         try
         {
            if(mbr != null)
            {
               val = val[mbr];
            }
            return val != null && val != undefined && "" + val != "NaN" && val != false && val != "" && val != 0;
         }
         catch(e:*)
         {
         }
         return false;
      }
      
      public function flushBufferedRequests() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = this;
         if(_loc1_.isSet(_loc1_.account))
         {
            _loc1_._flushBufferedRequests(_loc1_.account);
         }
      }
      
      private function startDelayTrackingInterval() : *
      {
         var _loc1_:Object = null;
         _loc1_ = this;
         _loc1_.delayTrackingInterval = setInterval(delayTrackingDone,_loc1_.delayTracking);
      }
      
      private function doTrackOnLoad() : *
      {
         var _loc1_:Object = null;
         _loc1_ = this;
         if(!_loc1_.isSet(_loc1_.account) || !_loc1_.isSet(_loc1_.movie))
         {
            return;
         }
         clearInterval(_loc1_.trackOnLoadInterval);
         if(Boolean(_loc1_._trackOnLoad) && !_loc1_.onLoadTracked)
         {
            _loc1_.onLoadTracked = true;
            _loc1_.track();
         }
      }
      
      private function queryStringAccountVariables() : String
      {
         var _loc1_:Object = null;
         var _loc2_:String = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:* = undefined;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc10_:* = undefined;
         var _loc11_:* = undefined;
         var _loc12_:* = undefined;
         _loc1_ = this;
         _loc2_ = "";
         _loc10_ = "";
         _loc11_ = "";
         _loc12_ = "";
         if(_loc1_.isSet(_loc1_.linkType))
         {
            _loc10_ = _loc1_.linkTrackVars;
            _loc11_ = _loc1_.linkTrackEvents;
         }
         else if(_loc1_.isSet(_loc1_.pe))
         {
            _loc12_ = _loc1_.pe.substr(0,1).toUpperCase() + _loc1_.pe.substr(1);
            if(_loc1_.isSet(_loc1_[_loc12_]))
            {
               _loc10_ = _loc1_[_loc12_].trackVars;
               _loc11_ = _loc1_[_loc12_].trackEvents;
            }
         }
         if(_loc1_.isSet(_loc10_))
         {
            _loc10_ = "," + _loc10_ + "," + _loc1_.requiredVarList.join(",") + ",";
         }
         if(_loc1_.isSet(_loc11_))
         {
            _loc11_ = "," + _loc11_ + ",";
         }
         _loc3_ = 0;
         while(_loc3_ < _loc1_.accountVarList.length)
         {
            _loc5_ = _loc1_.accountVarList[_loc3_];
            _loc6_ = _loc1_[_loc5_];
            _loc8_ = _loc5_.substr(0,4);
            _loc9_ = _loc5_.substr(4);
            if(Boolean(_loc1_.isSet(_loc6_)) && (!_loc1_.isSet(_loc10_) || _loc10_.indexOf("," + _loc5_ + ",") >= 0))
            {
               switch(_loc5_)
               {
                  case "visitorID":
                     _loc5_ = "vid";
                     break;
                  case "pageURL":
                     _loc5_ = "g";
                     break;
                  case "referrer":
                     _loc5_ = "r";
                     break;
                  case "vmk":
                     _loc5_ = "vmt";
                     break;
                  case "charSet":
                     _loc5_ = "ce";
                     break;
                  case "visitorNamespace":
                     _loc5_ = "ns";
                     break;
                  case "cookieDomainPeriods":
                     _loc5_ = "cdp";
                     break;
                  case "cookieLifetime":
                     _loc5_ = "cl";
                     break;
                  case "currencyCode":
                     _loc5_ = "cc";
                     break;
                  case "channel":
                     _loc5_ = "ch";
                     break;
                  case "transactionID":
                     _loc5_ = "xact";
                     break;
                  case "campaign":
                     _loc5_ = "v0";
                     break;
                  case "events":
                     if(_loc1_.isSet(_loc11_))
                     {
                        _loc7_ = _loc6_.split(",");
                        _loc6_ = "";
                        _loc4_ = 0;
                        while(_loc4_ < _loc7_.length)
                        {
                           if(_loc11_.indexOf("," + _loc7_[_loc4_] + ",") >= 0)
                           {
                              _loc6_ += (_loc1_.isSet(_loc6_) ? "," : "") + _loc7_[_loc4_];
                           }
                           _loc4_++;
                        }
                     }
                     break;
                  default:
                     if(_loc1_.isNumber(_loc9_))
                     {
                        if(_loc8_ == "prop")
                        {
                           _loc5_ = "c" + _loc9_;
                        }
                        else if(_loc8_ == "eVar")
                        {
                           _loc5_ = "v" + _loc9_;
                        }
                        else if(_loc8_ == "hier")
                        {
                           _loc5_ = "h" + _loc9_;
                           _loc6_ = _loc6_.substr(0,255);
                        }
                     }
               }
               if(_loc1_.isSet(_loc6_))
               {
                  _loc2_ += "&" + escape(_loc5_) + "=" + (_loc5_.substr(0,3) != "pev" ? escape(_loc6_) : _loc6_);
               }
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function isNumber(param1:*) : Boolean
      {
         return !isNaN(parseInt(param1));
      }
      
      public function flushBufferedRequest(param1:String, param2:String) : *
      {
         var _loc3_:Object = null;
         var _loc4_:Object = null;
         var _loc5_:Object = null;
         var _loc6_:Number = NaN;
         var _loc7_:String = null;
         _loc3_ = this;
         _loc4_ = _loc3_.getBufferedRequests();
         if(_loc3_.isSet(_loc4_))
         {
            _loc6_ = 0;
            while(_loc6_ < _loc4_.data.list.length)
            {
               _loc5_ = _loc4_.data.list[_loc6_];
               if(_loc5_.account == param1 && _loc5_.id == param2)
               {
                  _loc7_ = _loc4_.data.list[_loc6_].request;
                  _loc4_.data.list[_loc6_].account = "";
                  _loc4_.data.list[_loc6_].id = "";
                  _loc4_.data.list[_loc6_].request = "";
                  _loc4_.flush();
                  _loc3_.makeRequest("","",_loc7_,"");
               }
               _loc6_++;
            }
         }
      }
      
      public function set trackOnLoad(param1:Boolean) : *
      {
         this._trackOnLoad = param1;
         if(this._trackOnLoad)
         {
            this.setTrackOnLoadInterval();
         }
      }
      
      private function variableOverridesApply(param1:Object) : *
      {
         var _loc2_:Object = null;
         var _loc3_:Number = NaN;
         var _loc4_:String = null;
         _loc2_ = this;
         _loc3_ = 0;
         while(_loc3_ < _loc2_.accountVarList.length)
         {
            _loc4_ = _loc2_.accountVarList[_loc3_];
            if(Boolean(_loc2_.isSet(param1[_loc4_])) || Boolean(_loc2_.isSet(param1["!" + _loc4_])))
            {
               _loc2_[_loc4_] = param1[_loc4_];
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < _loc2_.accountConfigList.length)
         {
            _loc4_ = _loc2_.accountConfigList[_loc3_];
            if(Boolean(_loc2_.isSet(param1[_loc4_])) || Boolean(_loc2_.isSet(param1["!" + _loc4_])))
            {
               _loc2_[_loc4_] = param1[_loc4_];
            }
            _loc3_++;
         }
      }
      
      public function get movie() : Object
      {
         return this._movie;
      }
      
      private function getBufferedRequests() : *
      {
         var s:Object = null;
         var bufferedRequests:Object = null;
         s = this;
         if(!s.isSet(s.disableBufferedRequests))
         {
            bufferedRequests = SharedObject.getLocal("s_br","/");
         }
         if(!s.isSet(bufferedRequests))
         {
            bufferedRequests = s.bufferedRequests;
            if(!s.isSet(bufferedRequests))
            {
               s.bufferedRequests = new Object();
               s.bufferedRequests.flush = function():*
               {
               };
               bufferedRequests = s.bufferedRequests;
            }
         }
         if(!s.isSet(bufferedRequests.data))
         {
            bufferedRequests.data = new Object();
         }
         if(!s.isSet(bufferedRequests.data.list))
         {
            bufferedRequests.data.list = new Array();
         }
         return bufferedRequests;
      }
      
      private function modulesInit() : *
      {
         var _loc1_:Object = null;
         _loc1_ = this;
         _loc1_.ClickMap = new ActionSource_Module_ClickMap(_loc1_);
         _loc1_.Media = new ActionSource_Module_Media(_loc1_);
         _loc1_.modulesUpdate();
      }
      
      private function modulesUpdate() : *
      {
         var _loc1_:Object = null;
         var _loc2_:String = null;
         _loc1_ = this;
         if(Boolean(_loc1_.isSet(_loc1_.ClickMap)) && _loc1_.flashASVersion < 3)
         {
            _loc1_.index = _loc1_.ClickMap.getIndex();
         }
         if(_loc1_.isSet(_loc1_.Media))
         {
            if(_loc1_.isSet(_loc1_._moduleMediaVariables))
            {
               for(_loc2_ in _loc1_._moduleMediaVariables)
               {
                  if(_loc1_.isSet(_loc1_._moduleMediaVariables[_loc2_]))
                  {
                     if(_loc2_ == "autoTrack")
                     {
                        if(("" + _loc1_._moduleMediaVariables[_loc2_]).toLowerCase() == "true")
                        {
                           _loc1_._moduleMediaVariables[_loc2_] = true;
                        }
                        else
                        {
                           _loc1_._moduleMediaVariables[_loc2_] = false;
                        }
                     }
                     _loc1_.Media[_loc2_] = _loc1_._moduleMediaVariables[_loc2_];
                  }
               }
            }
            _loc1_.Media.autoTrack = _loc1_.Media.autoTrack;
         }
      }
      
      public function set moduleMediaVariables(param1:Object) : *
      {
         this._moduleMediaVariables = param1;
         this.modulesUpdate();
      }
      
      public function track(param1:Object = null, param2:String = "") : *
      {
         this._track(param1,param2);
      }
      
      private function initPre() : *
      {
         if(parent == null || getQualifiedClassName(parent) != "fl.livepreview::LivePreviewParent")
         {
            this.visible = false;
         }
         else
         {
            this.flashLivePreview = true;
         }
         this.addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
      }
      
      public function get moduleMediaVariables() : Object
      {
         return this._moduleMediaVariables;
      }
      
      public function getMovieURL() : String
      {
         var _loc1_:Object = null;
         var _loc2_:String = null;
         _loc1_ = this;
         _loc2_ = _loc1_.callJavaScript("function s_ActionSource_wl(){return window.location.href;}");
         if(_loc1_.isSet(_loc2_))
         {
            return _loc2_;
         }
         if(_loc1_.isSet(_loc1_.movie))
         {
            if(Boolean(_loc1_.flashASVersion > 2) && Boolean(_loc1_.isSet(_loc1_.movie.loaderInfo)) && Boolean(_loc1_.isSet(_loc1_.movie.loaderInfo.loaderURL)))
            {
               return _loc1_.movie.loaderInfo.loaderURL;
            }
            if(_loc1_.isSet(_loc1_.movie._url))
            {
               return _loc1_.movie._url;
            }
         }
         return "";
      }
      
      private function onAddedToStage(param1:Event) : *
      {
         this.movie = root;
      }
      
      private function setTrackOnLoadInterval() : void
      {
         this.trackOnLoadInterval = setInterval(this.doTrackOnLoad,50);
      }
      
      private function getMovieReferrer() : String
      {
         var _loc1_:Object = null;
         _loc1_ = this;
         return _loc1_.callJavaScript("" + "function s_ActionSource_r(){" + "\tvar " + "\t\tr = \'\'," + "\t\tw = window," + "\t\te," + "\t\tp," + "\t\tl," + "\t\te;" + "\tif ((w) && (w.document)) {" + "\t\tr = w.document.referrer;" + "\t\ttry {" + "\t\t\tp = w.parent;" + "\t\t\tl = w.location;" + "\t\t\twhile ((p) && (p.location) && (p.location != l) && (p.location.host == l.host)) {" + "\t\t\t\tw = p;" + "\t\t\t\tp = w.parent;" + "\t\t\t}" + "\t\t} catch (e) {}" + "\t\tif ((w) && (w.document)) {" + "\t\t\tr = w.document.referrer;" + "\t\t}" + "\t}" + "\treturn r;" + "}");
      }
      
      private function initPost() : *
      {
      }
      
      public function trackLink(param1:String, param2:String, param3:String, param4:Object = null) : *
      {
         this._trackLink(param1,param2,param3,param4);
      }
      
      private function _flushBufferedRequests(param1:String) : *
      {
         var _loc2_:Object = null;
         var _loc3_:Object = null;
         var _loc4_:Object = null;
         var _loc5_:Number = NaN;
         _loc2_ = this;
         _loc3_ = _loc2_.getBufferedRequests();
         if(_loc2_.isSet(_loc3_))
         {
            _loc5_ = 0;
            while(_loc5_ < _loc3_.data.list.length)
            {
               _loc4_ = _loc3_.data.list[_loc5_];
               if(_loc4_.account == param1)
               {
                  _loc2_.flushBufferedRequest(param1,_loc4_.id);
               }
               _loc5_++;
            }
         }
      }
      
      private function delayTrackingDone() : *
      {
         var _loc1_:Object = null;
         _loc1_ = this;
         clearInterval(_loc1_.delayTrackingInterval);
         _loc1_.delayTrackingStage = 2;
         _loc1_.flushRequestList();
      }
   }
}

