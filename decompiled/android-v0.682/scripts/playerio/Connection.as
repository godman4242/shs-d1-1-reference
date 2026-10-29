package playerio
{
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.Socket;
   import flash.utils.ByteArray;
   import playerio.generated.PlayerIOError;
   import playerio.generated.messages.ServerEndpoint;
   import playerio.utils.BinarySerializer;
   
   public class Connection
   {
      
      private static var connections:Array = [];
      
      private static const encodeChars:Array = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9","+","/"];
      
      private static const decodeChars:Array = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,62,-1,-1,-1,63,52,53,54,55,56,57,58,59,60,61,-1,-1,-1,-1,-1,-1,-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,-1,-1,-1,-1,-1,-1,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,-1,-1,-1,-1,-1];
      
      private var socket:Socket;
      
      private var serializer:BinarySerializer;
      
      private var messageHandlers:Array = [];
      
      private var disconnectHandlers:Array = [];
      
      private var errorHandler:Function;
      
      private var client:Client;
      
      private var devserver:String;
      
      private var callback:Function;
      
      public var roomId:String;
      
      private var debugArr:ByteArray = new ByteArray();
      
      private var sendDebugInfo:Boolean = true;
      
      private var messagesReceived:int = 0;
      
      public function Connection(client:Client, roomId:String, key:String, endpoints:Array, joinData:Object, callback:Function, errorHandler:Function, devserver:String)
      {
         super();
         connections.push(this);
         this.client = client;
         this.roomId = roomId;
         this.errorHandler = errorHandler;
         this.devserver = devserver;
         this.callback = callback;
         serializer = new BinarySerializer();
         serializer.addEventListener("onMessage",handleMessage);
         if(endpoints.length > 1 && endpoints[0].port == 80)
         {
            endpoints.push(endpoints.shift());
         }
         doConnect(key,joinData,endpoints);
      }
      
      public static function encode(data:ByteArray) : String
      {
         var c:int = 0;
         var out:Array = [];
         var i:int = 0;
         var j:int = 0;
         var r:int = data.length % 3;
         var len:int = data.length - r;
         while(i < len)
         {
            c = data[i++] << 16 | data[i++] << 8 | data[i++];
            out[j++] = encodeChars[c >> 18] + encodeChars[c >> 12 & 0x3F] + encodeChars[c >> 6 & 0x3F] + encodeChars[c & 0x3F];
         }
         if(r == 1)
         {
            c = int(data[i++]);
            out[j++] = encodeChars[c >> 2] + encodeChars[(c & 3) << 4] + "==";
         }
         else if(r == 2)
         {
            c = data[i++] << 8 | data[i++];
            out[j++] = encodeChars[c >> 10] + encodeChars[c >> 4 & 0x3F] + encodeChars[(c & 0x0F) << 2] + "=";
         }
         return out.join("");
      }
      
      private function doConnect(key:String, joinData:Object, endpoints:Array) : void
      {
         var tempSS:Socket;
         var serverInfo:Array;
         var endpoint:ServerEndpoint = endpoints.shift() as ServerEndpoint;
         var hadConnection:Boolean = false;
         var disposed:Boolean = false;
         if(devserver != null)
         {
            serverInfo = devserver.split(":");
            tempSS = new Socket(serverInfo[0],serverInfo[1]);
         }
         else
         {
            tempSS = new Socket(endpoint.address,endpoint.port);
         }
         tempSS.addEventListener("close",function():void
         {
            if(disposed)
            {
               return;
            }
            for each(var handler in disconnectHandlers)
            {
               try
               {
                  handler();
               }
               catch(e:Error)
               {
                  client.handleCallbackError("Connection.addDisconnectHandler",e);
                  throw e;
               }
            }
         });
         tempSS.addEventListener("connect",function(e:Event):void
         {
            if(disposed)
            {
               try
               {
                  tempSS.close();
               }
               catch(e:Error)
               {
               }
               return;
            }
            socket = tempSS;
            hadConnection = true;
            tempSS.writeByte(0);
            tempSS.flush();
            var m:Message = createMessage("join",key);
            for(var elm in joinData)
            {
               m.add(elm.toString());
               m.add(joinData[elm].toString());
            }
            sendMessage(m);
         });
         tempSS.addEventListener("ioError",function(e:IOErrorEvent):void
         {
            disposed = true;
            try
            {
               tempSS.close();
            }
            catch(e:Error)
            {
            }
            if(devserver)
            {
               throwError("Unable to connect to development server on " + devserver + ". Is the development server running?",1);
            }
            else if(endpoints.length != 0 && !hadConnection)
            {
               doConnect(key,joinData,endpoints);
            }
            else
            {
               throwError("Unable to connect to player.io multiplayer server due to IO Error [" + e.text + "]",1);
            }
         });
         tempSS.addEventListener("securityError",function(e:SecurityErrorEvent):void
         {
            disposed = true;
            try
            {
               tempSS.close();
            }
            catch(e:Error)
            {
            }
            if(!hadConnection)
            {
               if(endpoints.length != 0 && !hadConnection)
               {
                  doConnect(key,joinData,endpoints);
               }
               else
               {
                  throwError("Unable to connect to player.io multiplayer server due to Security Error [" + e.text + "]",1);
               }
            }
         });
         tempSS.addEventListener("socketData",function():void
         {
            var a:int = 0;
            var b:int = 0;
            if(disposed)
            {
               try
               {
                  tempSS.close();
               }
               catch(e:Error)
               {
               }
               return;
            }
            var l:int = int(tempSS.bytesAvailable);
            for(a = 0; a < l; )
            {
               b = int(tempSS.readUnsignedByte());
               if(debugArr.length < 102400)
               {
                  debugArr.writeByte(b);
               }
               else
               {
                  sendDebugInfo = false;
               }
               try
               {
                  serializer.AddByte(b);
               }
               catch(e:Error)
               {
                  if(sendDebugInfo)
                  {
                     client.handleSystemError("Unable to deserialize multiplayer message",e,{"binary":encode(debugArr)});
                  }
                  throw e;
               }
               a++;
            }
         });
      }
      
      public function addMessageHandler(type:String, handler:Function) : void
      {
         messageHandlers.push(new MessageHandler(type,handler));
      }
      
      public function removeMessageHandler(type:String, handler:Function) : void
      {
         var a:int = 0;
         var mh:MessageHandler = null;
         for(a = 0; a < messageHandlers.length; )
         {
            mh = messageHandlers[a] as MessageHandler;
            if(mh.type == type && mh.handler == handler)
            {
               messageHandlers.splice(a,1);
               return;
            }
            a++;
         }
      }
      
      public function disconnect() : void
      {
         if(socket && socket.connected)
         {
            socket.close();
         }
      }
      
      public function addDisconnectHandler(handler:Function) : void
      {
         disconnectHandlers.push(handler);
      }
      
      public function removeDisconnectHandler(handler:Function) : void
      {
         var a:int = 0;
         for(a = 0; a < disconnectHandlers.length; )
         {
            if(disconnectHandlers[a] == handler)
            {
               disconnectHandlers.splice(a,1);
               return;
            }
            a++;
         }
      }
      
      public function get connected() : Boolean
      {
         return socket.connected;
      }
      
      public function createMessage(type:String, ... args) : Message
      {
         var a:int = 0;
         var m:Message = new Message(type);
         for(a = 0; a < args.length; )
         {
            m.add(args[a]);
            a++;
         }
         return m;
      }
      
      public function send(type:String, ... args) : void
      {
         var a:int = 0;
         var m:Message = new Message(type);
         for(a = 0; a < args.length; )
         {
            m.add(args[a]);
            a++;
         }
         sendMessage(m);
      }
      
      public function sendMessage(m:Message) : void
      {
         var mbytes:ByteArray = null;
         if(socket && socket.connected)
         {
            mbytes = serializer.SerializeMessage(m as Message);
            mbytes.position = 0;
            socket.writeBytes(mbytes,0,mbytes.length);
            socket.flush();
         }
         else
         {
            throwError("Unable to send data to server when disconnected from server",2);
         }
      }
      
      private function handleMessage(e:MessageEvent) : void
      {
         var err:playerio.generated.PlayerIOError = null;
         var a:int = 0;
         var m:MessageHandler = null;
         var args:Array = null;
         var b:int = 0;
         messagesReceived++;
         if(e.message.type == "playerio.joinresult")
         {
            if(e.message.getBoolean(0))
            {
               try
               {
                  callback(this);
               }
               catch(e:Error)
               {
                  client.handleCallbackError("Connection.connect",e);
                  throw e;
               }
            }
            else
            {
               err = new playerio.generated.PlayerIOError(e.message.getString(2),e.message.getInt(1));
               if(errorHandler == null)
               {
                  throw err;
               }
               errorHandler(err);
            }
         }
         else
         {
            for(a = 0; a < messageHandlers.length; )
            {
               m = messageHandlers[a] as MessageHandler;
               if(m.type == e.message.type || m.type == null || m.type == "*")
               {
                  args = [e.message];
                  b = 0;
                  while(b < e.message.length && b < m.handler.length - 1)
                  {
                     args.push(e.message.getObject(b));
                     b++;
                  }
                  try
                  {
                     m.handler.apply(m.handler,args);
                  }
                  catch(e:Error)
                  {
                     client.handleCallbackError("Connection.addMessageHandler(\"" + m.type + "\")",e);
                     throw e;
                  }
               }
               a++;
            }
         }
      }
      
      private function throwError(error:String, type:int) : void
      {
         var e:playerio.generated.PlayerIOError = new playerio.generated.PlayerIOError(error,type);
         if(errorHandler != null)
         {
            errorHandler(e);
            return;
         }
         client.handleCallbackErrorVerbose("Error occurred while talking to player.io multiplayer servers.",e);
         throw e;
      }
   }
}

class MessageHandler
{
   
   public var type:String;
   
   public var handler:Function;
   
   public function MessageHandler(type:String, handler:Function)
   {
      super();
      this.type = type;
      this.handler = handler;
   }
}
