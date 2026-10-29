package
{
   import flash.events.NetStatusEvent;
   import flash.events.TimerEvent;
   import flash.net.GroupSpecifier;
   import flash.net.NetConnection;
   import flash.net.NetGroup;
   import flash.net.NetStream;
   import flash.utils.Timer;
   import playerio.Connection;
   import playerio.Message;
   import playerio.PlayerIOError;
   import playerio.RoomInfo;
   
   public class NetworkCoreP2P
   {
      
      public static var OUTPUT:* = 0;
      
      public static var DISCONNECT:* = 1;
      
      public var nid:String = "";
      
      internal var sendStream:NetStream;
      
      internal var recvStream:NetStream;
      
      internal var netConnection:NetConnection;
      
      internal var subscriptionArray:Array;
      
      internal var recvArray:Array;
      
      internal var connected:Boolean = false;
      
      internal var CirrusAddress:String;
      
      private const DeveloperKey:String = "93accddc6b621b1c8a286e1c-f013531a246f";
      
      internal const maxPeerConnections:int = 8;
      
      internal var netGroup:NetGroup;
      
      internal var currentGroup:String = "";
      
      internal var firstConnect:Boolean = true;
      
      internal var msgSeq:int = 0;
      
      internal var globalNetGroup:NetGroup;
      
      internal var currentGlobalGroup:String = "";
      
      internal var globalFirstConnect:Boolean = true;
      
      internal var globalMsgSeq:int = 0;
      
      internal var connectionPIO:Connection;
      
      internal var connectionChatPIO:Connection;
      
      internal var connectionGlobalPIO:Connection;
      
      internal var tryCount:int = 10;
      
      internal var timer:Timer = new Timer(5000);
      
      internal var currentChat:String = "";
      
      public function NetworkCoreP2P()
      {
         super();
      }
      
      public function init() : *
      {
         if(QueryManager.instance.offlineMode)
         {
            this.connected = false;
            return;
         }
         if(StatsManager.usePlayerIO && StatsManager.usePlayerIOForDuels)
         {
            this.connected = true;
            return;
         }
         if(StatsManager.useFMS)
         {
            this.CirrusAddress = "rtmfp://218.99.12.19/shs3/";
         }
         else
         {
            this.CirrusAddress = "rtmfp://p2p.rtmfp.net";
         }
         this.netConnection = new NetConnection();
         this.netConnection.addEventListener(NetStatusEvent.NET_STATUS,this.netConnectionHandler);
         this.netConnection.maxPeerConnections = this.maxPeerConnections;
         this.netConnection.connect(this.CirrusAddress,this.DeveloperKey);
         this.subscriptionArray = new Array();
         this.recvArray = new Array();
      }
      
      internal function outputToConsole(str:Object) : *
      {
         trace(str.toString());
      }
      
      internal function netConnectionHandler(event:NetStatusEvent) : void
      {
         var index:int = 0;
         var i:* = undefined;
         this.outputToConsole("netConnectionHandler: " + event.info.code);
         switch(event.info.code)
         {
            case "NetConnection.Connect.Success":
               this.outputToConsole("nearID is " + this.netConnection.nearID);
               this.nid = this.netConnection.nearID;
               this.setupSendStream();
               this.connected = true;
               TitleUI.instance.login.serverResponse(0);
               this.connectGlobalGroup("net.explosivebarrel.duels.chat_" + LangManager.getLanguage());
               break;
            case "NetConnection.Connect.Failed":
               this.outputToConsole("Unable to connect to " + this.CirrusAddress);
               this.connected = false;
               if(StatsManager.useFMS)
               {
                  StatsManager.useFMS = !StatsManager.useFMS;
                  trace("trying Cirrus instead");
                  this.init();
               }
               else
               {
                  TitleUI.instance.motd.visible = true;
                  TitleUI.instance.motd.title.text = "Unable to connect to server";
                  TitleUI.instance.motd.msgText.htmlText = "Please try again later or check that you have the <u><font color=\"#FFFFFF\"><a href=\"http://get.adobe.com/flashplayer/\" target=\"_blank\">latest Adobe Flash Player</a></font></u> installed.";
                  TitleUI.instance.motd.button.visible = false;
                  TitleUI.instance.loadingscreen.visible = false;
               }
               break;
            case "NetConnection.Connect.Closed":
               trace("error: this shouldn\'t happen");
               break;
            case "NetStream.Connect.Success":
               this.outputToConsole("Connection from: " + event.info.stream.farID);
               break;
            case "NetStream.Connect.Closed":
               this.outputToConsole("Connection closed from: " + event.info.stream.farID);
               index = -1;
               for(i = 0; i < this.subscriptionArray.length; i++)
               {
                  if(this.subscriptionArray[i].farID == event.info.stream.farID)
                  {
                     this.subscriptionArray[i].close();
                     index = i;
                  }
               }
               if(index != -1)
               {
                  this.subscriptionArray.splice(index,1);
               }
               break;
            case "NetGroup.Connect.Success":
               this.outputToConsole("connected to netgroup");
               break;
            case "NetGroup.Connect.Rejected":
               this.outputToConsole("rejected by netgroup");
               this.onRejectedByGroup();
               this.disconnectGroup();
         }
      }
      
      internal function setupSendStream() : void
      {
         var clientObj:Object;
         this.sendStream = new NetStream(this.netConnection,NetStream.DIRECT_CONNECTIONS);
         this.sendStream.addEventListener(NetStatusEvent.NET_STATUS,this.netSendStreamHandler);
         this.sendStream.publish("gamestream");
         clientObj = new Object();
         clientObj.onPeerConnect = function(subscriber:NetStream):Boolean
         {
            for(var i:* = 0; i < sendStream.peerStreams.length; i++)
            {
               if(sendStream.peerStreams[i].farID == subscriber.farID)
               {
                  outputToConsole("reject: connecting peer already exists");
                  return false;
               }
            }
            if(!clientCanConnect(subscriber.farID))
            {
               return false;
            }
            connect(subscriber.farID);
            return true;
         };
         this.sendStream.client = clientObj;
      }
      
      internal function trim(str:String) : String
      {
         for(var i:int = 0; str.charCodeAt(i) < 33; )
         {
            i++;
         }
         for(var j:* = int(str.length - 1); str.charCodeAt(j) < 33; )
         {
            j--;
         }
         return str.substring(i,j + 1);
      }
      
      public function connect(ID:String) : void
      {
         var i:*;
         var clientObj:Object;
         var netRecv:Function = null;
         netRecv = function(evt:NetStatusEvent):*
         {
            netRecvStreamHandler(evt,ID);
         };
         ID = this.trim(ID);
         for(i = 0; i < this.subscriptionArray.length; i++)
         {
            if(this.subscriptionArray[i].farID == ID)
            {
               this.outputToConsole("Already connected to " + ID);
               return;
            }
         }
         this.outputToConsole("opening receiving stream " + "id: " + ID);
         this.recvStream = new NetStream(this.netConnection,ID);
         this.recvStream.addEventListener(NetStatusEvent.NET_STATUS,netRecv,false,0,true);
         this.recvStream.play("gamestream");
         clientObj = new Object();
         clientObj.senderID = ID;
         clientObj.processMsg = function(msgType:int, msg:Object):void
         {
            processMsg(this.senderID,msgType,msg);
         };
         this.recvStream.client = clientObj;
         this.subscriptionArray.push(this.recvStream);
      }
      
      public function disconnect(ID:String) : *
      {
         ID = this.trim(ID);
         var index:int = -1;
         for(var i:* = 0; i < this.subscriptionArray.length; i++)
         {
            if(this.subscriptionArray[i].farID == ID)
            {
               this.subscriptionArray[i].close();
               index = i;
            }
         }
         if(index != -1)
         {
            this.subscriptionArray.splice(index,1);
         }
      }
      
      public function disconnectAll() : *
      {
         if(this.subscriptionArray == null)
         {
            return;
         }
         for(var i:* = 0; i < this.subscriptionArray.length; i++)
         {
            this.subscriptionArray[i].close();
         }
         this.subscriptionArray = new Array();
      }
      
      internal function netRecvStreamHandler(event:NetStatusEvent, senderID:String) : void
      {
         this.outputToConsole("netRecvStreamHandler = " + event.info.code);
         switch(event.info.code)
         {
            case "NetStream.Play.Stop":
               this.onNodeDisconnection(senderID);
               break;
            case "NetStream.Play.Failed":
               this.onConnectionRequestRejection(senderID);
               break;
            case "NetStream.Play.Start":
               this.onConnectedToNode(senderID);
         }
      }
      
      internal function netSendStreamHandler(event:NetStatusEvent) : void
      {
         this.outputToConsole("netSendStreamHandler = " + event.info.code);
      }
      
      public function send(msgType:int, msg:Object) : void
      {
         if(!this.connected || this.sendStream == null)
         {
            return;
         }
         this.sendStream.send("processMsg",msgType,msg);
      }
      
      public function sendTo(id:String, msgType:int, msg:Object) : void
      {
         if(!this.connected || this.sendStream == null)
         {
            return;
         }
         for(var i:* = 0; i < this.sendStream.peerStreams.length; i++)
         {
            if(this.sendStream.peerStreams[i].farID == id)
            {
               this.sendStream.peerStreams[i].send("processMsg",msgType,msg);
            }
         }
      }
      
      internal function clientCanConnect(id:String) : Boolean
      {
         return true;
      }
      
      internal function onConnectedToNode(id:String) : *
      {
      }
      
      internal function onConnectionRequestRejection(id:String) : *
      {
      }
      
      internal function onNodeDisconnection(id:String) : *
      {
      }
      
      internal function processMsg(sender:String, msgType:int, msg:Object) : *
      {
         switch(msgType)
         {
            case OUTPUT:
               this.outputToConsole(msg);
               break;
            case DISCONNECT:
               this.disconnect(sender);
         }
      }
      
      public function getNid() : String
      {
         return this.nid;
      }
      
      public function connectGroup(groupname:String) : void
      {
         var groupspec:GroupSpecifier = new GroupSpecifier(groupname);
         groupspec.serverChannelEnabled = true;
         groupspec.postingEnabled = true;
         groupspec.routingEnabled = true;
         this.netGroup = new NetGroup(this.netConnection,groupspec.groupspecWithAuthorizations());
         this.netGroup.addEventListener(NetStatusEvent.NET_STATUS,this.netGroupHandler);
         this.currentGroup = groupname;
      }
      
      internal function disconnectGroup() : *
      {
         if(!StatsManager.usePlayerIO)
         {
            if(this.currentGroup != "")
            {
               this.netGroup.close();
            }
            this.currentGroup = "";
            this.firstConnect = true;
         }
         else
         {
            this.disconnectGroupPIO();
         }
      }
      
      internal function netGroupHandler(event:NetStatusEvent) : void
      {
         trace("netGroupHandler: " + event.info.code);
         switch(event.info.code)
         {
            case "NetGroup.Neighbor.Connect":
               this.onNeighbourConnected(event.info.peerID);
               break;
            case "NetGroup.Neighbor.Disconnect":
               this.onNeighbourDisconnect(event.info.peerID);
               break;
            case "NetGroup.Posting.Notify":
               this.processGroupMsg(event.info.message);
               break;
            case "NetGroup.SendTo.Notify":
               if(event.info.fromLocal != true)
               {
                  this.netGroup.sendToNearest(event.info.message,event.info.message.destination);
               }
               else
               {
                  this.processGroupMsg(event.info.message);
               }
         }
      }
      
      public function sendToGroup(msgType:int, message:Object) : void
      {
         if(this.currentGroup == "" || this.netConnection == null)
         {
            return;
         }
         message.nid = this.netConnection.nearID;
         message.msgType = msgType;
         message.seq = this.msgSeq++;
         try
         {
            this.netGroup.post(message);
         }
         catch(e:Error)
         {
            trace(e);
         }
      }
      
      public function sendToGroupPeer(id:String, msgType:int, message:Object) : *
      {
         if(this.currentGroup == "" || this.netConnection == null)
         {
            return;
         }
         message.destination = this.netGroup.convertPeerIDToGroupAddress(id);
         message.nid = this.netConnection.nearID;
         message.msgType = msgType;
         message.seq = this.msgSeq++;
         this.netGroup.sendToNearest(message,message.destination);
      }
      
      public function processGroupMsg(msg:Object) : void
      {
         switch(msg.msgType)
         {
            case OUTPUT:
               this.outputToConsole(msg);
         }
      }
      
      internal function onNeighbourConnected(peerID:String) : *
      {
      }
      
      internal function onNeighbourDisconnect(peerID:String) : *
      {
      }
      
      internal function onRejectedByGroup() : *
      {
         this.disconnectGroup();
      }
      
      public function connectGlobalGroup(groupname:String) : void
      {
         if(StatsManager.usePlayerIO)
         {
            return;
         }
         var groupspec:GroupSpecifier = new GroupSpecifier(groupname);
         groupspec.serverChannelEnabled = true;
         groupspec.postingEnabled = true;
         groupspec.routingEnabled = true;
         this.globalNetGroup = new NetGroup(this.netConnection,groupspec.groupspecWithAuthorizations());
         this.globalNetGroup.addEventListener(NetStatusEvent.NET_STATUS,this.globalNetGroupHandler);
         this.currentGlobalGroup = groupname;
      }
      
      internal function disconnectGlobalGroup() : *
      {
         if(this.currentGlobalGroup != "")
         {
            this.globalNetGroup.close();
         }
         this.currentGlobalGroup = "";
      }
      
      internal function globalNetGroupHandler(event:NetStatusEvent) : void
      {
         trace("globalNetGroupHandler: " + event.info.code);
         switch(event.info.code)
         {
            case "NetGroup.Neighbor.Connect":
               this.onGlobalNeighbourConnected(event.info.peerID);
               break;
            case "NetGroup.Neighbor.Disconnect":
               this.onGlobalNeighbourDisconnect(event.info.peerID);
               break;
            case "NetGroup.Posting.Notify":
               this.processGlobalGroupMsg(event.info.message);
               break;
            case "NetGroup.SendTo.Notify":
               if(event.info.fromLocal != true)
               {
                  this.globalNetGroup.sendToNearest(event.info.message,event.info.message.destination);
               }
               else
               {
                  this.processGlobalGroupMsg(event.info.message);
               }
         }
      }
      
      public function sendToGlobalGroup(msgType:int, message:Object) : void
      {
         if(this.currentGlobalGroup == "" || this.globalNetGroup == null)
         {
            return;
         }
         message.nid = this.netConnection.nearID;
         message.msgType = msgType;
         message.seq = this.msgSeq++;
         try
         {
            this.globalNetGroup.post(message);
         }
         catch(e:Error)
         {
            trace(e);
         }
      }
      
      public function sendToGlobalGroupPeer(id:String, msgType:int, message:Object) : *
      {
         if(this.currentGlobalGroup == "" || this.netGroup != null)
         {
            return;
         }
         message.destination = this.netGroup.convertPeerIDToGroupAddress(id);
         message.nid = this.netConnection.nearID;
         message.msgType = msgType;
         message.seq = this.msgSeq++;
         this.netGroup.sendToNearest(message,message.destination);
      }
      
      public function processGlobalGroupMsg(msg:Object) : void
      {
         switch(msg.msgType)
         {
            case OUTPUT:
               this.outputToConsole(msg);
         }
      }
      
      internal function onGlobalNeighbourConnected(peerID:String) : *
      {
      }
      
      internal function onGlobalNeighbourDisconnect(peerID:String) : *
      {
      }
      
      internal function onRejectedByGlobalGroup() : *
      {
         this.disconnectGlobalGroup();
      }
      
      public function connectGlobalGroupPIO(createCharacter:Boolean = false) : *
      {
         if(this.connectionGlobalPIO != null && this.connectionGlobalPIO.connected)
         {
            return;
         }
         var userJoinObj:* = new Object();
         userJoinObj.Name = StatsManager.charname;
         var roomid:String = "$service-room$";
         if(createCharacter)
         {
            userJoinObj.invis = "4";
         }
         QueryManagerPIO.instance.client.multiplayer.createJoinRoom(roomid,"SHS3Service",true,{},userJoinObj,this.handleJoinGlobalPIO,this.handleErrorGlobalPIO);
      }
      
      internal function handleJoinGlobalPIO(connection:Connection) : *
      {
         this.connectionGlobalPIO = connection;
         trace("connected to global PIO");
         connection.addDisconnectHandler(this.handleGlobalDisconnect);
         connection.addMessageHandler("*",this.handleGlobalMessages);
         this.tryCount = 10;
      }
      
      public function disconnectGlobalPIO() : *
      {
         if(this.connectionGlobalPIO != null && this.connectionGlobalPIO.connected)
         {
            this.connectionGlobalPIO.disconnect();
            this.connectionGlobalPIO.removeDisconnectHandler(this.handleGlobalDisconnect);
            this.connectionGlobalPIO.removeMessageHandler("*",this.handleGlobalMessages);
         }
      }
      
      internal function handleGlobalMessages(m:Message) : *
      {
      }
      
      internal function handleGlobalDisconnect() : void
      {
         trace("Disconnected from global PIO");
         if(this.tryCount <= 0)
         {
            NetworkManager.instance.leaveRoom();
            OverworldHUD.instance.updateChatLogWordsOnly("Error: Unable to reconnect to server","#FFCC00");
            GameEngine.battleModeToTitle();
            return;
         }
         OverworldHUD.instance.updateChatLogWordsOnly("Reconnecting to server...","#FFCC00");
         this.timedConnectGlobalGroupPIO();
         --this.tryCount;
      }
      
      internal function handleErrorGlobalPIO(e:PlayerIOError) : *
      {
         trace("error connecting to global PIO: " + e);
         if(this.tryCount > 0)
         {
            if(OverworldHUD.instance != null)
            {
               OverworldHUD.instance.updateChatLogWordsOnly("Reconnecting to server after error...","#FFCC00");
            }
            this.timedConnectGlobalGroupPIO();
            --this.tryCount;
            return;
         }
         NetworkManager.instance.leaveRoom();
         OverworldHUD.instance.updateChatLogWordsOnly("Error: Unable to reconnect to server","#FFCC00");
         GameEngine.battleModeToTitle();
      }
      
      internal function timedConnectGlobalGroupPIO() : *
      {
         this.timer.start();
         this.timer.addEventListener(TimerEvent.TIMER,this.timerListener,false,0,true);
      }
      
      internal function timerListener(e:TimerEvent) : *
      {
         this.timer.stop();
         this.timer.removeEventListener(TimerEvent.TIMER,this.timerListener);
         this.connectGlobalGroupPIO();
      }
      
      public function connectGroupPIO(groupname:String, xpos:int) : *
      {
         if(this.connectionPIO != null && this.connectionPIO.connected)
         {
            trace("Error: connectGroupPIO needed to do disconnectGroupPIO");
            this.disconnectGroupPIO();
         }
         var userJoinObj:* = new Object();
         var roomDataObj:* = new Object();
         userJoinObj.charname = StatsManager.charname;
         userJoinObj.level = StatsManager.getLevel();
         userJoinObj.equip = StatsManager.getEquipmentString();
         userJoinObj.x = xpos;
         userJoinObj.side = StatsManager.getSide();
         if(GameEngine.isPvPRoomMode())
         {
            userJoinObj.stats = StatsManager.getBattleStatsString();
            userJoinObj.skills = StatsManager.getSkillStatsString();
            userJoinObj.taunt = StatsManager.getTaunt();
            roomDataObj.pvp = "1";
         }
         else
         {
            userJoinObj.stats = "";
            userJoinObj.skills = "";
            userJoinObj.taunt = "";
            roomDataObj.pvp = "0";
         }
         roomDataObj.roomwidth = StageManager.getGameStageWidth();
         QueryManagerPIO.instance.client.multiplayer.createJoinRoom(groupname,"SHS3Room",true,roomDataObj,userJoinObj,this.handleJoinGroupPIO,this.handleErrorGroupPIO);
         this.currentGroup = groupname;
      }
      
      internal function handleJoinGroupPIO(connection:Connection) : *
      {
      }
      
      public function disconnectGroupPIO() : *
      {
         trace("disconnect group pio " + this.currentGroup);
         if(this.connectionPIO != null && this.connectionPIO.connected)
         {
            this.connectionPIO.disconnect();
            this.connectionPIO.removeDisconnectHandler(this.handleGroupDisconnect);
            this.connectionPIO.removeMessageHandler("*",this.handleGroupMessages);
         }
         this.currentGroup = "";
      }
      
      internal function handleGroupMessages(m:Message) : *
      {
      }
      
      internal function handleGroupDisconnect() : void
      {
         trace("Disconnected from groupPIO");
         this.currentGroup = "";
      }
      
      internal function handleErrorGroupPIO(error:PlayerIOError) : *
      {
         trace("error connecting to groupPIO: " + error);
         this.currentGroup = "";
      }
      
      public function connectGlobalChat() : *
      {
         this.connectChatPIO("$service-room$");
      }
      
      public function listChannels() : *
      {
         QueryManagerPIO.instance.client.multiplayer.listRooms("SHS3Chat",null,10000,0,function(array:Array):*
         {
            var roomInfo:RoomInfo = null;
            var str:String = null;
            var max:int = int(array.length);
            OverworldHUD.instance.updateChatLogWordsOnly("\nAvailable channels:","#FFCC00");
            OverworldHUD.instance.updateChatLogWordsOnly("- Global","#CCCCCC");
            for(var i:int = 0; i < max; i++)
            {
               roomInfo = array[i];
               str = "- " + roomInfo.id + " (" + roomInfo.onlineUsers + "/45)\n";
               OverworldHUD.instance.updateChatLogWordsOnly(str,"#CCCCCC");
            }
            OverworldHUD.instance.updateChatLogWordsOnly("");
         },function(e:PlayerIOError):*
         {
            trace(e);
         });
      }
      
      public function connectChatPIO(roomname:String, isPublic:Boolean = true) : *
      {
         if(this.connectionChatPIO != null && this.connectionChatPIO.connected)
         {
            if(this.currentChat == "$service-room$")
            {
               OverworldHUD.instance.updateChatLogWordsOnly("Leaving channel: Global","#FFCC00");
            }
            else
            {
               OverworldHUD.instance.updateChatLogWordsOnly("Leaving channel: " + this.currentChat,"#FFCC00");
            }
            this.disconnectChatPIO();
         }
         if(roomname == "global" || roomname == "Global")
         {
            roomname = "$service-room$";
         }
         var userJoinObj:* = new Object();
         userJoinObj.charname = StatsManager.charname;
         userJoinObj.level = StatsManager.getLevel();
         if(!StatsManager.hasChatNotification)
         {
            userJoinObj.invis = "1";
         }
         if(StatsManager.consoleEnabled || StatsManager.hasBuff(StatsManager.BUFF_MODERATOR))
         {
            userJoinObj.invis = "2";
         }
         if(StatsManager.charname == "RyuKanji")
         {
            userJoinObj.invis = "2";
         }
         var roomDataObj:* = new Object();
         if(roomname == "$service-room$")
         {
            userJoinObj.service = "1";
         }
         QueryManagerPIO.instance.client.multiplayer.createJoinRoom(roomname,"SHS3Chat",isPublic,roomDataObj,userJoinObj,this.handleJoinChatPIO,this.handleErrorChatPIO);
         this.currentChat = roomname;
      }
      
      internal function handleJoinChatPIO(connection:Connection) : *
      {
      }
      
      public function disconnectChatPIO() : *
      {
         trace("disconnect chat pio " + this.currentChat);
         if(this.connectionChatPIO != null && this.connectionChatPIO.connected)
         {
            this.connectionChatPIO.disconnect();
            this.connectionChatPIO.removeDisconnectHandler(this.handleChatDisconnect);
            this.connectionChatPIO.removeMessageHandler("*",this.handleChatMessages);
         }
         this.currentChat = "";
      }
      
      internal function handleChatMessages(m:Message) : *
      {
      }
      
      internal function handleChatDisconnect() : void
      {
         trace("Disconnected from chatPIO");
         this.currentChat = "";
      }
      
      internal function handleErrorChatPIO(error:PlayerIOError) : *
      {
         trace("error connecting to chatPIO: " + error);
         this.currentChat = "";
      }
   }
}

