package Facebook
{
   import flash.events.*;
   import flash.external.*;
   import flash.net.*;
   import flash.system.*;
   
   public class FB
   {
      
      private static var allowedMethods:Object = {
         "GET":1,
         "POST":1,
         "DELETE":1,
         "PUT":1
      };
      
      private static var readOnlyCalls:Object = {
         "fql_query":1,
         "fql_multiquery":1,
         "friends_get":1,
         "notifications_get":1,
         "stream_get":1,
         "users_getinfo":1
      };
      
      private static var access_token:String = null;
      
      private static var app_id:String = null;
      
      private static var debug:Boolean = false;
      
      private static var uiFlashId:String = null;
      
      private static var uiCallbackId:Number = 0;
      
      private static var data:FBData = new FBData();
      
      private static var _formatRE:RegExp = /(\{[^\}^\{]+\})/g;
      
      private static var _trimRE:RegExp = /^\s*|\s*$/g;
      
      private static var _quoteRE:RegExp = /["\\\x00-\x1f\x7f-\x9f]/g;
      
      public function FB()
      {
         super();
      }
      
      public static function get Data() : FBData
      {
         return data;
      }
      
      public static function init(params:*) : void
      {
         debug = !!params.debug;
         app_id = params.app_id;
         if((params.access_token + "").length < 3)
         {
            error("You must supply the init method with an not-null access_token string.");
         }
         else
         {
            access_token = params.access_token;
            log("Initializing with access_token: " + access_token);
         }
      }
      
      public static function api(... args) : void
      {
         requireAccessToken("api");
         if(typeof args[0] == "string")
         {
            graphCall.apply(null,args);
         }
         else
         {
            restCall.apply(null,args);
         }
      }
      
      public static function get uiAvailable() : Boolean
      {
         return initUI() == null;
      }
      
      public static function ui(params:*, cb:Function) : void
      {
         var callbackId:String;
         var err:String = initUI();
         if(err != null)
         {
            error(err);
         }
         if(!params.method)
         {
            error("\"method\" is a required parameter for FB.ui().");
         }
         callbackId = "as_ui_callback_" + uiCallbackId++;
         ExternalInterface.addCallback(callbackId,function(response:*):void
         {
            log("Got response from Javascript FB.ui: " + toString(response));
            cb(response);
         });
         ExternalInterface.call("__doFBUICall",uiFlashId,params,callbackId);
      }
      
      private static function initUI() : String
      {
         var allowsExternalInterface:Boolean = false;
         var hasJavascript:Boolean = false;
         var source:String = null;
         if(uiFlashId == null)
         {
            Security.allowDomain("*");
            allowsExternalInterface = false;
            try
            {
               allowsExternalInterface = ExternalInterface.call("eval","true");
            }
            catch(e:*)
            {
            }
            if(!allowsExternalInterface)
            {
               return "The flash element must not have allowNetworking = \'none\' in the containing page in order to call the FB.ui() method.";
            }
            hasJavascript = ExternalInterface.call("eval","typeof(FB)!=\'undefined\' && typeof(FB.ui)!=\'undefined\'");
            if(!hasJavascript)
            {
               return "The FB.ui() method can only be used when the containing page includes the Facebook Javascript SDK. Read more here: http://developers.facebook.com/docs/reference/javascript/FB.init";
            }
            uiFlashId = "flash_" + new Date().getTime() + Math.round(Math.random() * 9999999);
            ExternalInterface.addCallback("getFlashId",function():String
            {
               return uiFlashId;
            });
            source = "";
            source += "__doFBUICall = function(uiFlashId,params,callbackId){";
            source += " var find = function(tag){var list=document.getElementsByTagName(tag);for(var i=0;i!=list.length;i++){if(list[i].getFlashId&&list[i].getFlashId()==\"" + uiFlashId + "\"){return list[i]}}};";
            source += " var flashObj = find(\"embed\") || find(\"object\");";
            source += " if(flashObj != null){";
            source += "  FB.ui(params, function(response){";
            source += "   flashObj[callbackId](response);";
            source += "  })";
            source += " }else{alert(\"could not find flash element on the page w/ uiFlashId: " + uiFlashId + "\")}";
            source += "};";
            ExternalInterface.call("eval",source);
         }
         return null;
      }
      
      private static function graphCall(... args) : void
      {
         var type:String = null;
         var m:String = null;
         var method:String = null;
         var params:* = null;
         var cb:Function = null;
         var path:String = args.shift();
         var next:* = args.shift();
         while(next)
         {
            type = typeof next;
            if(type === "string" && method == null)
            {
               m = next.toUpperCase();
               if(allowedMethods[m])
               {
                  method = m;
               }
               else
               {
                  error("Invalid method passed to FB.api(" + path + "): " + next);
               }
            }
            else if(type === "function" && cb == null)
            {
               cb = next;
            }
            else if(type === "object" && params == null)
            {
               params = next;
            }
            else
            {
               error("Invalid argument passed to FB.api(" + path + "): " + next);
            }
            next = args.shift();
         }
         method ||= "GET";
         params ||= {};
         log("Graph call: path=" + path + ", method=" + method + ", params=" + toString(params));
         oauthRequest("https://graph.facebook.com" + path,method,params,cb);
      }
      
      private static function restCall(params:*, cb:Function) : void
      {
         var method:String = (params.method + "").toLowerCase().replace(".","_");
         params.format = "json-strings";
         params.api_key = app_id;
         log("REST call: method=" + method + ", params=" + toString(params));
         oauthRequest("https://" + (readOnlyCalls[method] ? "api-read" : "api") + ".facebook.com/restserver.php","get",params,cb);
      }
      
      private static function oauthRequest(url:String, method:String, params:*, cb:Function) : void
      {
         var x:* = undefined;
         var loader:URLLoader = null;
         var request:URLRequest = new URLRequest(url);
         request.method = method;
         request.data = new URLVariables();
         request.data.access_token = access_token;
         for(x in params)
         {
            request.data[x] = params[x];
         }
         request.data.callback = "c";
         loader = new URLLoader();
         loader.addEventListener(Event.COMPLETE,function(e:Event):void
         {
            var json:String = loader.data;
            if(json.length > 2 && json.substring(0,2) == "c(")
            {
               json = loader.data.substring(loader.data.indexOf("(") + 1,loader.data.lastIndexOf(")"));
            }
            trace(json);
            var obj:* = FBJSON.deserialize(json);
            if(url.substring(0,11) == "https://api")
            {
               log("REST call result, method=" + params.method + " => " + toString(obj));
            }
            else
            {
               log("Graph call result, path=" + url + " => " + toString(obj));
            }
            cb(obj);
         });
         loader.addEventListener(IOErrorEvent.IO_ERROR,function(e:IOErrorEvent):void
         {
            error("Error in response from Facebook api servers, most likely cause is expired or invalid access_token. Error message: " + e.text);
         });
         loader.load(request);
      }
      
      private static function requireAccessToken(callerName:String) : void
      {
         if(access_token == null)
         {
            error("You must call FB.init({access_token:\"...\") before attempting to call FB." + callerName + "()");
         }
      }
      
      private static function error(msg:String) : void
      {
         if(debug)
         {
            trace("FB Error: " + msg);
         }
         throw new Error(msg);
      }
      
      private static function log(msg:String) : void
      {
         if(debug)
         {
            trace("FB: " + msg);
         }
      }
      
      public static function toString(obj:*) : String
      {
         var objOut:String = null;
         var arrayOut:String = null;
         var allNumeric:Boolean = false;
         var anyAtAll:Boolean = false;
         var prop:* = undefined;
         if(obj == null)
         {
            return "[null]";
         }
         switch(typeof obj)
         {
            case "object":
               objOut = "{";
               arrayOut = "[";
               allNumeric = true;
               anyAtAll = false;
               for(prop in obj)
               {
                  objOut += (objOut == "{" ? "" : ", ") + prop + "=" + toString(obj[prop]);
                  arrayOut += (arrayOut == "[" ? "" : ", ") + toString(obj[prop]);
                  if(typeof prop != "number")
                  {
                     allNumeric = false;
                  }
                  anyAtAll = true;
               }
               return allNumeric && anyAtAll ? arrayOut + "]" : objOut + "}";
            case "string":
               return "\"" + obj.replace("\n","\\n").replace("\r","\\r") + "\"";
            default:
               return obj + "";
         }
      }
      
      internal static function stringTrim(s:String) : String
      {
         return s.replace(_trimRE,"");
      }
      
      internal static function stringFormat(format:String, ... args) : String
      {
         return format.replace(_formatRE,function(str:String, m:String, index:int, completeString:String):String
         {
            index = parseInt(m.substr(1),10);
            var value:* = args[index];
            if(value === null || typeof value == "undefined")
            {
               return "";
            }
            return value.toString();
         });
      }
      
      internal static function stringQuote(value:String) : String
      {
         var subst:Object = null;
         subst = {
            "\b":"\\b",
            "\t":"\\t",
            "\n":"\\n",
            "\f":"\\f",
            "\r":"\\r",
            "\"":"\\\"",
            "\\":"\\\\"
         };
         return _quoteRE.test(value) ? "\"" + value.replace(_quoteRE,function(a:String):String
         {
            var c:* = subst[a];
            if(c)
            {
               return c;
            }
            c = a.charCodeAt();
            return "\\u00" + Math.floor(c / 16).toString(16) + (c % 16).toString(16);
         }) + "\"" : "\"" + value + "\"";
      }
      
      internal static function arrayIndexOf(arr:Array, item:*) : int
      {
         var index:int = 0;
         var length:uint = arr.length;
         if(length)
         {
            for(index = 0; index < length; index++)
            {
               if(arr[index] === item)
               {
                  return index;
               }
            }
         }
         return -1;
      }
      
      internal static function arrayMerge(target:Array, source:Array) : Array
      {
         for(var i:int = 0; i < source.length; i++)
         {
            if(arrayIndexOf(target,source[i]) < 0)
            {
               target.push(source[i]);
            }
         }
         return target;
      }
      
      internal static function arrayMap(arr:Array, transform:Function) : Array
      {
         var ret:Array = [];
         for(var i:int = 0; i < arr.length; i++)
         {
            ret.push(transform(arr[i]));
         }
         return ret;
      }
      
      internal static function arrayFilter(arr:Array, fn:Function) : Array
      {
         var b:Array = [];
         for(var i:int = 0; i < arr.length; i++)
         {
            if(fn(arr[i]))
            {
               b.push(arr[i]);
            }
         }
         return b;
      }
      
      internal static function objCopy(target:Object, source:Object, overwrite:Boolean, transform:Function) : Object
      {
         var key:String = null;
         for(key in source)
         {
            if(overwrite || typeof target[key] == "undefined")
            {
               target[key] = typeof transform == "function" ? transform(source[key]) : source[key];
            }
         }
         return target;
      }
      
      internal static function forEach(item:*, fn:Function) : void
      {
         var i:uint = 0;
         var x:* = undefined;
         if(!item)
         {
            return;
         }
         if(item is Array)
         {
            for(i = 0; i != item.length; i++)
            {
               fn(item[i],i,item);
            }
         }
         else if(item is Object)
         {
            for(x in item)
            {
               fn(item[x],x,item);
            }
         }
      }
   }
}

