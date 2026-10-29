package playerio.utils
{
   import com.protobuf.Message;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestHeader;
   import flash.utils.ByteArray;
   
   public class HTTPChannel
   {
      
      private var useSSL:Boolean = false;
      
      private var _token:String = "";
      
      private var _headers:Array = [];
      
      public function HTTPChannel(useSecureApiRequests:Boolean = false)
      {
         super();
         this.useSSL = useSecureApiRequests;
      }
      
      private function get endpoint() : String
      {
         return this.useSSL ? "https://api.playerio.com/api" : "http://api.playerio.com/api";
      }
      
      public function set headers(urlRequestHeaders:Array) : void
      {
         _headers = urlRequestHeaders;
      }
      
      public function Request(RPCMethod:int, messageInput:Message, messageOutput:Message, messageError:Message, success:Function, error:Function) : void
      {
         var r:URLRequest;
         var b:ByteArray;
         var tba:ByteArray;
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = "binary";
         loader.addEventListener("complete",function(e:Event):void
         {
            var length:int = 0;
            var data:ByteArray = loader.data;
            data.position = 0;
            if(data.readUnsignedByte() != 0)
            {
               length = int(data.readUnsignedShort());
               _token = data.readUTFBytes(length);
            }
            var status:int = int(data.readUnsignedByte());
            if(status == 0)
            {
               messageError.readFromDataOutput(data);
               error(messageError);
            }
            else if(status == 1)
            {
               messageOutput.readFromDataOutput(data);
               success(messageOutput);
            }
         });
         loader.addEventListener("ioError",function(e:IOErrorEvent):void
         {
            try
            {
               (messageError as Object).message = "[PlayerIOError] " + e.text;
            }
            catch(e:Error)
            {
            }
            error(messageError);
         });
         loader.addEventListener("securityError",function(e:SecurityError):void
         {
            try
            {
               (messageError as Object).message = "[PlayerIOError] " + e.message;
            }
            catch(e:Error)
            {
            }
            error(messageError);
         });
         r = new URLRequest(this.endpoint + "/" + RPCMethod);
         r.requestHeaders = _headers;
         r.method = "POST";
         if(_token != "")
         {
            r.requestHeaders = [new URLRequestHeader("playertoken",_token)];
         }
         b = new ByteArray();
         messageInput.writeToDataOutput(b);
         if(b.length == 0)
         {
            tba = new ByteArray();
            tba.writeByte(8);
            tba.writeByte(0);
            r.data = tba;
         }
         else
         {
            r.data = b;
         }
         loader.load(r);
      }
      
      public function set token(t:String) : void
      {
         _token = t;
      }
      
      public function get token() : String
      {
         return _token;
      }
   }
}

