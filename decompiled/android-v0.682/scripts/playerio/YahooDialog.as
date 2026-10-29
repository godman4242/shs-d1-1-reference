package playerio
{
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import mx.utils.UIDUtil;
   import playerio.generated.PlayerIOError;
   import playerio.utils.HTTPChannel;
   
   internal class YahooDialog
   {
      
      private static var _addedCallbackGlue:Boolean = false;
      
      private static var _savedCallbacks:Object = {};
      
      public function YahooDialog()
      {
         super();
      }
      
      public static function showDialog(dialog:String, arguments:Object, channel:HTTPChannel, callback:Function) : void
      {
         switch(Capabilities.playerType)
         {
            case "ActiveX":
            case "PlugIn":
               break;
            default:
               throw new playerio.generated.PlayerIOError("Cannot show the \'" + dialog + "\' dialog. Dialogs aren\'t supported in the current runtime environment:" + Capabilities.playerType,playerio.PlayerIOError.GeneralError.errorID);
         }
         javascriptDialog(dialog,arguments,channel == null ? null : channel.token,callback);
      }
      
      private static function javascriptDialog(dialog:String, arguments:Object, apiToken:String, callback:Function) : void
      {
         var cb:String = null;
         if(!ExternalInterface.available)
         {
            throw new playerio.generated.PlayerIOError("ExternalInterface is not available!",0);
         }
         var callbackId:String = UIDUtil.createUID().replace("-","").toLowerCase();
         _savedCallbacks[callbackId] = callback;
         if(!_addedCallbackGlue)
         {
            ExternalInterface.addCallback("JavascriptPlayerIOCallback",javascriptPlayerIOCallback);
            cb = "";
            cb = cb + "window.__PlayerIO_Flash_Callback__ = function(callbackId, result){";
            cb = cb + "\nvar resultStr = \'A\';";
            cb = cb + "\nresult[\'__PlayerIO_Flash_CallbackId__\'] = callbackId;";
            cb = cb + "\nfor(var x in result){resultStr+=\':\'+x.length+\':\'+x+\':\'+result[x].length+\':\'+result[x]};";
            cb = cb + "\n\tfor(var tag in {embed:1,object:1}){";
            cb = cb + "\n\t\tvar list=document.getElementsByTagName(tag);";
            cb = cb + "\n\t\tfor(var i=0;i!=list.length;i++){";
            cb = cb + "\n\t\t\ttry{list[i].JavascriptPlayerIOCallback(resultStr)}catch(e){};";
            cb = cb + "\n\t\t}";
            cb = cb + "\n\t}";
            cb = cb + "\n}";
            ExternalInterface.call("eval",cb);
            _addedCallbackGlue = true;
         }
         var js:String = "";
         var jsCallback:String = "function(r){window.__PlayerIO_Flash_Callback__(\'" + callbackId + "\',r)}";
         js += "if(!document.getElementById(\'yahooscript\')){alert(\'When using yahoologin:auto, the containing html page must include the yahoo.js script\')};";
         js = js + "\nif(window.Yahoo){";
         js = js + ("\n\twindow.Yahoo._.dialog(" + jsonEncode(dialog) + "," + getJavascriptLiteral(arguments) + "," + jsonEncode(apiToken) + "," + jsCallback + ");");
         js = js + "\n}else{";
         js = js + "\n\tif(!window.Yahoo_WaitingCalls){window.Yahoo_WaitingCalls=[]};";
         js = js + ("\n\twindow.Yahoo_WaitingCalls.push([\'_.dialog\'," + jsonEncode(dialog) + "," + getJavascriptLiteral(arguments) + "," + jsonEncode(apiToken) + "," + jsCallback + "])");
         js = js + "\n}";
         ExternalInterface.call("eval",js);
      }
      
      private static function getJavascriptLiteral(options:Object) : String
      {
         var jsOptions:String = "{";
         if(options != null)
         {
            for(var key in options)
            {
               jsOptions += jsOptions.length == 1 ? "" : ",";
               jsOptions += jsonEncode(key);
               jsOptions += ":";
               jsOptions += jsonEncode(options[key]);
            }
         }
         return jsOptions + "}";
      }
      
      private static function jsonEncode(input:String) : String
      {
         var writer:String = null;
         var i:int = 0;
         var isValidSequence:Boolean = false;
         var hex:Array = null;
         var intValue:int = 0;
         var x:int = 0;
         var num:int = 0;
         if(input == null)
         {
            return "null";
         }
         writer = "";
         writer = writer + "\"";
         for(i = 0; i < input.length; )
         {
            switch(input.charAt(i))
            {
               case "\n":
                  writer += "\\n";
                  break;
               case "\r":
                  writer += "\\r";
                  break;
               case "\t":
                  writer += "\\t";
                  break;
               case "\"":
               case "\\":
                  writer += "\\";
                  writer = writer + input[i];
                  break;
               case "\f":
                  writer += "\\f";
                  break;
               case "\b":
                  writer += "\\b";
                  break;
               default:
                  if(input.charCodeAt(i) >= 32 && input.charCodeAt(i) <= 126)
                  {
                     writer += input.charAt(i);
                  }
                  else
                  {
                     isValidSequence = input.charCodeAt(i) < 55296 || input.charCodeAt(i) > 57343;
                     if(isValidSequence)
                     {
                        hex = [];
                        intValue = input.charCodeAt(i);
                        for(x = 0; x < 4; )
                        {
                           num = intValue % 16;
                           hex[3 - x] = num < 10 ? String.fromCharCode("0".charCodeAt(0) + num) : String.fromCharCode("A".charCodeAt(0) + (num - 10));
                           intValue >>= 4;
                           x++;
                        }
                        writer += "\\u";
                        writer = writer + hex.join();
                     }
                  }
            }
            i++;
         }
         return writer + "\"";
      }
      
      private static function javascriptPlayerIOCallback(input:String) : void
      {
         var callback:Function = null;
         var args:Object = StringForm.decodeStringDictionary(input);
         var callbackId:String = args["__PlayerIO_Flash_CallbackId__"];
         if(_savedCallbacks[callbackId] != undefined)
         {
            callback = _savedCallbacks[callbackId];
            delete args["__PlayerIO_Flash_CallbackId__"];
            delete _savedCallbacks[callbackId];
            callback(args);
         }
      }
   }
}

