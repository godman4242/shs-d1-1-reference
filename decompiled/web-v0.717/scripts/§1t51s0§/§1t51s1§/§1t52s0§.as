package §1t51s0§.§1t51s1§
{
   import com.protobuf.§1t84s0§;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestHeader;
   import flash.utils.ByteArray;
   
   public class §1t52s0§
   {
      
      private var useSSL:Boolean = false;
      
      private var _token:String = "";
      
      private var _headers:Array = [];
      
      public function §1t52s0§(param1:Boolean = false)
      {
         super();
         this.useSSL = param1;
      }
      
      private function get endpoint() : String
      {
         return this.useSSL ? "https://api.playerio.com/api" : "http://api.playerio.com/api";
      }
      
      public function set headers(param1:Array) : void
      {
         _headers = param1;
      }
      
      public function Request(param1:int, param2:§1t84s0§, param3:§1t84s0§, param4:§1t84s0§, param5:Function, param6:Function) : void
      {
         var r:URLRequest;
         var b:ByteArray;
         var tba:ByteArray;
         var RPCMethod:int = param1;
         var messageInput:§1t84s0§ = param2;
         var messageOutput:§1t84s0§ = param3;
         var messageError:§1t84s0§ = param4;
         var success:Function = param5;
         var error:Function = param6;
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = "binary";
         loader.addEventListener("complete",function(param1:Event):void
         {
            var _loc3_:int = 0;
            var _loc4_:ByteArray = loader.data;
            _loc4_.position = 0;
            if(_loc4_.readUnsignedByte() != 0)
            {
               _loc3_ = int(_loc4_.readUnsignedShort());
               _token = _loc4_.readUTFBytes(_loc3_);
            }
            var _loc2_:int = int(_loc4_.readUnsignedByte());
            if(_loc2_ == 0)
            {
               messageError.readFromDataOutput(_loc4_);
               error(messageError);
            }
            else if(_loc2_ == 1)
            {
               messageOutput.readFromDataOutput(_loc4_);
               success(messageOutput);
            }
         });
         loader.addEventListener("ioError",function(param1:IOErrorEvent):void
         {
            try
            {
               (messageError as Object).message = "[PlayerIOError] " + param1.text;
            }
            catch(e:Error)
            {
            }
            error(messageError);
         });
         loader.addEventListener("securityError",function(param1:SecurityError):void
         {
            try
            {
               (messageError as Object).message = "[PlayerIOError] " + param1.message;
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
      
      public function set token(param1:String) : void
      {
         _token = param1;
      }
      
      public function get token() : String
      {
         return _token;
      }
   }
}

