package
{
   import flash.events.NetStatusEvent;
   import flash.net.GroupSpecifier;
   import flash.net.NetConnection;
   import flash.net.NetGroup;
   import flash.net.NetStream;
   
   public class §1t2027s0§
   {
      
      public static var §1t11503s0§:* = 0;
      
      public static var §1t11504s0§:* = 1;
      
      public var nid:String = "";
      
      internal var §1t2028s0§:NetStream;
      
      internal var §1t2029s0§:NetStream;
      
      internal var §1t2030s0§:NetConnection;
      
      internal var §1t2032s0§:Array;
      
      internal var §1t2033s0§:Array;
      
      internal var connected:Boolean = false;
      
      internal var §1t2035s0§:String;
      
      private const §1t2036s0§:String = "93accddc6b621b1c8a286e1c-f013531a246f";
      
      internal const maxPeerConnections:int = 8;
      
      internal var §1t2056s0§:NetGroup;
      
      internal var §1t2058s0§:String = "";
      
      internal var §1t2059s0§:Boolean = true;
      
      internal var §1t2060s0§:int = 0;
      
      internal var §1t2070s0§:NetGroup;
      
      internal var §1t2071s0§:String = "";
      
      internal var §1t2072s0§:Boolean = true;
      
      internal var §1t2073s0§:int = 0;
      
      public function §1t2027s0§()
      {
         super();
      }
      
      public function init() : *
      {
         this.§1t2030s0§ = new NetConnection();
         this.§1t2030s0§.addEventListener(NetStatusEvent.NET_STATUS,this.§1t2040s0§);
         this.§1t2030s0§.maxPeerConnections = this.maxPeerConnections;
         this.§1t2030s0§.connect(this.§1t2035s0§,this.§1t2036s0§);
         this.§1t2032s0§ = new Array();
         this.§1t2033s0§ = new Array();
      }
      
      internal function §1t2039s0§(param1:Object) : *
      {
      }
      
      internal function §1t2040s0§(param1:NetStatusEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = undefined;
         this.§1t2039s0§("netConnectionHandler: " + param1.info.code);
         switch(param1.info.code)
         {
            case "NetConnection.Connect.Success":
               this.§1t2039s0§("nearID is " + this.§1t2030s0§.nearID);
               this.nid = this.§1t2030s0§.nearID;
               this.§1t2041s0§();
               this.connected = true;
               break;
            case "NetConnection.Connect.Failed":
               this.§1t2039s0§("Unable to connect to " + this.§1t2035s0§);
               this.connected = false;
               break;
            case "NetConnection.Connect.Closed":
               break;
            case "NetStream.Connect.Success":
               this.§1t2039s0§("Connection from: " + param1.info.stream.farID);
               break;
            case "NetStream.Connect.Closed":
               this.§1t2039s0§("Connection closed from: " + param1.info.stream.farID);
               _loc2_ = -1;
               _loc3_ = 0;
               while(_loc3_ < this.§1t2032s0§.length)
               {
                  if(this.§1t2032s0§[_loc3_].farID == param1.info.stream.farID)
                  {
                     this.§1t2032s0§[_loc3_].close();
                     _loc2_ = _loc3_;
                  }
                  _loc3_++;
               }
               if(_loc2_ != -1)
               {
                  this.§1t2032s0§.splice(_loc2_,1);
               }
               break;
            case "NetGroup.Connect.Success":
               this.§1t2039s0§("connected to netgroup");
               break;
            case "NetGroup.Connect.Rejected":
               this.§1t2039s0§("rejected by netgroup");
               this.§1t2069s0§();
               this.§1t2062s0§();
         }
      }
      
      internal function §1t2041s0§() : void
      {
         var clientObj:Object;
         this.§1t2028s0§ = new NetStream(this.§1t2030s0§,NetStream.DIRECT_CONNECTIONS);
         this.§1t2028s0§.addEventListener(NetStatusEvent.NET_STATUS,this.netSendStreamHandler);
         this.§1t2028s0§.publish("gamestream");
         clientObj = new Object();
         clientObj.onPeerConnect = function(param1:NetStream):Boolean
         {
            var _loc2_:* = 0;
            while(_loc2_ < §1t2028s0§.peerStreams.length)
            {
               if(§1t2028s0§.peerStreams[_loc2_].farID == param1.farID)
               {
                  §1t2039s0§("reject: connecting peer already exists");
                  return false;
               }
               _loc2_++;
            }
            if(!§1t2050s0§(param1.farID))
            {
               return false;
            }
            connect(param1.farID);
            return true;
         };
         this.§1t2028s0§.client = clientObj;
      }
      
      internal function trim(param1:String) : String
      {
         var _loc2_:int = 0;
         while(param1.charCodeAt(_loc2_) < 33)
         {
            _loc2_++;
         }
         var _loc3_:* = int(param1.length - 1);
         while(param1.charCodeAt(_loc3_) < 33)
         {
            _loc3_--;
         }
         return param1.substring(_loc2_,_loc3_ + 1);
      }
      
      public function connect(param1:String, param2:§1t142s0§ = null) : void
      {
         var i:*;
         var netRecv:Function = null;
         var clientObj:Object = null;
         var ID:String = param1;
         var §1t1423s0§:§1t142s0§ = param2;
         netRecv = function(param1:NetStatusEvent):*
         {
            netRecvStreamHandler(param1,ID);
         };
         if(!this.§1t2030s0§.connected)
         {
            return;
         }
         ID = this.trim(ID);
         i = 0;
         while(i < this.§1t2032s0§.length)
         {
            if(this.§1t2032s0§[i].farID == ID)
            {
               this.§1t2039s0§("Already connected to " + ID);
               return;
            }
            i++;
         }
         this.§1t2039s0§("opening receiving stream " + "id: " + ID);
         this.§1t2029s0§ = new NetStream(this.§1t2030s0§,ID);
         this.§1t2029s0§.addEventListener(NetStatusEvent.NET_STATUS,netRecv,false,0,true);
         this.§1t2029s0§.play("gamestream");
         if(§1t1423s0§ == null)
         {
            §1t1423s0§ = §1t142s0§.§1t11519s0§(ID);
         }
         if(§1t1423s0§ != null)
         {
            this.§1t2029s0§.client = §1t1423s0§;
         }
         else
         {
            clientObj = new Object();
            clientObj.senderID = ID;
            clientObj.processMsg = function(param1:int, param2:Object):void
            {
               processMsg(this.senderID,param1,param2);
            };
            this.§1t2029s0§.client = clientObj;
         }
         this.§1t2032s0§.push(this.§1t2029s0§);
      }
      
      public function disconnect(param1:String) : *
      {
         param1 = this.trim(param1);
         var _loc2_:int = -1;
         var _loc3_:* = 0;
         while(_loc3_ < this.§1t2032s0§.length)
         {
            if(this.§1t2032s0§[_loc3_].farID == param1)
            {
               this.§1t2032s0§[_loc3_].close();
               _loc2_ = _loc3_;
            }
            _loc3_++;
         }
         if(_loc2_ != -1)
         {
            this.§1t2032s0§.splice(_loc2_,1);
         }
      }
      
      public function disconnectAll() : *
      {
         if(this.§1t2032s0§ == null)
         {
            return;
         }
         var _loc1_:* = 0;
         while(_loc1_ < this.§1t2032s0§.length)
         {
            this.§1t2032s0§[_loc1_].close();
            _loc1_++;
         }
         this.§1t2032s0§ = new Array();
      }
      
      internal function netRecvStreamHandler(param1:NetStatusEvent, param2:String) : void
      {
         this.§1t2039s0§("netRecvStreamHandler = " + param1.info.code);
         switch(param1.info.code)
         {
            case "NetStream.Play.Stop":
               this.§1t2053s0§(param2);
               break;
            case "NetStream.Play.Failed":
               this.§1t2052s0§(param2);
               break;
            case "NetStream.Play.Start":
               this.§1t2051s0§(param2);
         }
      }
      
      internal function netSendStreamHandler(param1:NetStatusEvent) : void
      {
         this.§1t2039s0§("netSendStreamHandler = " + param1.info.code);
      }
      
      public function send(param1:int, param2:Object) : void
      {
         if(!this.connected || this.§1t2028s0§ == null)
         {
            return;
         }
         this.§1t2028s0§.send("processMsg",param1,param2);
      }
      
      public function sendTo(param1:String, param2:int, param3:Object) : void
      {
         if(!this.connected || this.§1t2028s0§ == null)
         {
            return;
         }
         var _loc4_:* = 0;
         while(_loc4_ < this.§1t2028s0§.peerStreams.length)
         {
            if(this.§1t2028s0§.peerStreams[_loc4_].farID == param1)
            {
               this.§1t2028s0§.peerStreams[_loc4_].send("processMsg",param2,param3);
            }
            _loc4_++;
         }
      }
      
      internal function §1t2050s0§(param1:String) : Boolean
      {
         return true;
      }
      
      internal function §1t2051s0§(param1:String) : *
      {
      }
      
      internal function §1t2052s0§(param1:String) : *
      {
      }
      
      internal function §1t2053s0§(param1:String) : *
      {
      }
      
      internal function processMsg(param1:String, param2:int, param3:Object) : *
      {
         switch(param2)
         {
            case §1t11503s0§:
               this.§1t2039s0§(param3);
               break;
            case §1t11504s0§:
               this.disconnect(param1);
         }
      }
      
      public function §1t2055s0§() : String
      {
         return this.nid;
      }
      
      public function §1t2061s0§(param1:String) : void
      {
         var _loc2_:GroupSpecifier = new GroupSpecifier(param1);
         _loc2_.serverChannelEnabled = true;
         _loc2_.postingEnabled = true;
         _loc2_.routingEnabled = true;
         this.§1t2056s0§ = new NetGroup(this.§1t2030s0§,_loc2_.groupspecWithAuthorizations());
         this.§1t2056s0§.addEventListener(NetStatusEvent.NET_STATUS,this.§1t2063s0§);
         this.§1t2058s0§ = param1;
      }
      
      internal function §1t2062s0§() : *
      {
         if(this.§1t2058s0§ != "")
         {
            this.§1t2056s0§.close();
         }
         this.§1t2058s0§ = "";
         this.§1t2059s0§ = true;
      }
      
      internal function §1t2063s0§(param1:NetStatusEvent) : void
      {
         switch(param1.info.code)
         {
            case "NetGroup.Neighbor.Connect":
               this.§1t2067s0§(param1.info.peerID);
               break;
            case "NetGroup.Neighbor.Disconnect":
               this.§1t2068s0§(param1.info.peerID);
               break;
            case "NetGroup.Posting.Notify":
               this.§1t2066s0§(param1.info.message);
               break;
            case "NetGroup.SendTo.Notify":
               if(param1.info.fromLocal != true)
               {
                  this.§1t2056s0§.sendToNearest(param1.info.message,param1.info.message.destination);
               }
               else
               {
                  this.§1t2066s0§(param1.info.message);
               }
         }
      }
      
      public function §1t2064s0§(param1:int, param2:Object) : void
      {
         var §1t1702s0§:int = param1;
         var message:Object = param2;
         if(this.§1t2058s0§ == "" || this.§1t2030s0§ == null)
         {
            return;
         }
         message.nid = this.§1t2030s0§.nearID;
         message.§1t1702s0§ = §1t1702s0§;
         message.seq = this.§1t2060s0§++;
         try
         {
            this.§1t2056s0§.post(message);
         }
         catch(e:Error)
         {
         }
      }
      
      public function §1t2065s0§(param1:String, param2:int, param3:Object) : *
      {
         if(this.§1t2058s0§ == "" || this.§1t2030s0§ == null)
         {
            return;
         }
         param3.destination = this.§1t2056s0§.convertPeerIDToGroupAddress(param1);
         param3.nid = this.§1t2030s0§.nearID;
         param3.§1t1702s0§ = param2;
         param3.seq = this.§1t2060s0§++;
         this.§1t2056s0§.sendToNearest(param3,param3.destination);
      }
      
      public function §1t2066s0§(param1:Object) : void
      {
         switch(param1.§1t1702s0§)
         {
            case §1t11503s0§:
               this.§1t2039s0§(param1);
         }
      }
      
      internal function §1t2067s0§(param1:String) : *
      {
      }
      
      internal function §1t2068s0§(param1:String) : *
      {
      }
      
      internal function §1t2069s0§() : *
      {
         this.§1t2062s0§();
      }
      
      public function §1t2074s0§(param1:String) : void
      {
         var _loc2_:GroupSpecifier = new GroupSpecifier(param1);
         _loc2_.serverChannelEnabled = true;
         _loc2_.postingEnabled = true;
         _loc2_.routingEnabled = true;
         this.§1t2070s0§ = new NetGroup(this.§1t2030s0§,_loc2_.groupspecWithAuthorizations());
         this.§1t2070s0§.addEventListener(NetStatusEvent.NET_STATUS,this.§1t2076s0§);
         this.§1t2071s0§ = param1;
      }
      
      internal function §1t2075s0§() : *
      {
         if(this.§1t2071s0§ != "")
         {
            this.§1t2070s0§.close();
         }
         this.§1t2071s0§ = "";
      }
      
      internal function §1t2076s0§(param1:NetStatusEvent) : void
      {
         switch(param1.info.code)
         {
            case "NetGroup.Neighbor.Connect":
               this.§1t2080s0§(param1.info.peerID);
               break;
            case "NetGroup.Neighbor.Disconnect":
               this.§1t2081s0§(param1.info.peerID);
               break;
            case "NetGroup.Posting.Notify":
               this.§1t2079s0§(param1.info.message);
               break;
            case "NetGroup.SendTo.Notify":
               if(param1.info.fromLocal != true)
               {
                  this.§1t2070s0§.sendToNearest(param1.info.message,param1.info.message.destination);
               }
               else
               {
                  this.§1t2079s0§(param1.info.message);
               }
         }
      }
      
      public function §1t2077s0§(param1:int, param2:Object) : void
      {
         var §1t1702s0§:int = param1;
         var message:Object = param2;
         if(this.§1t2071s0§ == "" || this.§1t2070s0§ == null)
         {
            return;
         }
         message.nid = this.§1t2030s0§.nearID;
         message.§1t1702s0§ = §1t1702s0§;
         message.seq = this.§1t2060s0§++;
         try
         {
            this.§1t2070s0§.post(message);
         }
         catch(e:Error)
         {
         }
      }
      
      public function §1t2078s0§(param1:String, param2:int, param3:Object) : *
      {
         if(this.§1t2071s0§ == "" || this.§1t2056s0§ != null)
         {
            return;
         }
         param3.destination = this.§1t2056s0§.convertPeerIDToGroupAddress(param1);
         param3.nid = this.§1t2030s0§.nearID;
         param3.§1t1702s0§ = param2;
         param3.seq = this.§1t2060s0§++;
         this.§1t2056s0§.sendToNearest(param3,param3.destination);
      }
      
      public function §1t2079s0§(param1:Object) : void
      {
         switch(param1.§1t1702s0§)
         {
            case §1t11503s0§:
               this.§1t2039s0§(param1);
         }
      }
      
      internal function §1t2080s0§(param1:String) : *
      {
      }
      
      internal function §1t2081s0§(param1:String) : *
      {
      }
      
      internal function §1t2082s0§() : *
      {
         this.§1t2075s0§();
      }
   }
}

