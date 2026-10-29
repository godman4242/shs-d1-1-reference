package
{
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import playerio.*;
   
   public class ConnectionPIO
   {
      
      internal static var duelConnection:ConnectionPIO;
      
      internal static var STATUS_INITIALIZING:int = -1;
      
      internal static var STATUS_CONNECTED:int = 0;
      
      internal static var STATUS_NETWORKERROR:int = 1;
      
      internal static var STATUS_TARGETOFFLINE:int = 2;
      
      internal static var STATUS_CLOSED:int = 3;
      
      internal static var PURPOSE_DUEL:int = 0;
      
      internal static var PURPOSE_INVITE:int = 1;
      
      internal static var PURPOSE_CHECKNOTIFICATIONS:int = 2;
      
      internal static var PURPOSE_BUFF:int = 3;
      
      internal static var PURPOSE_TELEPORT:int = 4;
      
      internal static var PURPOSE_KICK:int = 5;
      
      internal static var PURPOSE_KICKDUPLICATEPLAYER:int = 6;
      
      internal var target:String = "";
      
      internal var purpose:int;
      
      internal var params:String = "";
      
      internal var status:int = STATUS_INITIALIZING;
      
      internal var initiator:Boolean = false;
      
      internal var connection:Connection;
      
      internal var sessionLength:int = 0;
      
      internal var connectedToConnectionRoom:Boolean = false;
      
      internal var timer:Timer = new Timer(1000);
      
      public function ConnectionPIO()
      {
         super();
      }
      
      public static function createConnection(target:String, purpose:int, params:String = "") : ConnectionPIO
      {
         var connectionPIO:ConnectionPIO = new ConnectionPIO();
         connectionPIO.target = target;
         connectionPIO.purpose = purpose;
         connectionPIO.params = params;
         return connectionPIO;
      }
      
      internal static function setDuelConnection(conn:ConnectionPIO) : *
      {
         disconnectDuelConnection();
         duelConnection = conn;
      }
      
      public static function disconnectDuelConnection() : *
      {
         if(duelConnection != null && duelConnection.connection != null && duelConnection.connection.connected)
         {
            duelConnection.terminateConnection();
            duelConnection.setStatus(STATUS_CLOSED);
         }
      }
      
      public static function getDuelConnection() : Connection
      {
         if(duelConnection == null)
         {
            return null;
         }
         if(!duelConnection.isConnected())
         {
            return null;
         }
         return duelConnection.connection;
      }
      
      public static function getDuelTarget() : String
      {
         if(duelConnection == null)
         {
            return null;
         }
         return duelConnection.target;
      }
      
      public function initConnection(myserviceroom:String) : *
      {
         this.initiator = true;
         if(this.purpose == PURPOSE_DUEL)
         {
            setDuelConnection(this);
         }
         else if(this.purpose == PURPOSE_KICKDUPLICATEPLAYER)
         {
            this.joinTargetServiceRoom(myserviceroom,false);
            return;
         }
         if(NetworkManager.instance.isInSvcRoomMembers(this.target))
         {
            this.joinTargetServiceRoom(myserviceroom,true);
            return;
         }
         QueryManagerPIO.instance.client.bigDB.load("OnlinePlayers",this.target,function(o:DatabaseObject):*
         {
            if(o == null || o.roomid == null || o.roomid == "")
            {
               setStatus(STATUS_TARGETOFFLINE);
            }
            else
            {
               joinTargetServiceRoom(o.roomid,o.roomid == myserviceroom);
            }
         },function(e:PlayerIOError):*
         {
            setStatus(STATUS_NETWORKERROR);
         });
      }
      
      internal function timerListener(e:TimerEvent) : *
      {
         ++this.sessionLength;
         if(this.sessionLength >= 60 && this.status != STATUS_CONNECTED)
         {
            this.terminateConnection();
            this.setStatus(STATUS_CLOSED);
         }
      }
      
      public function terminateConnection() : *
      {
         if(!this.connectedToConnectionRoom)
         {
            this.disconnectSvc();
         }
         else
         {
            this.disconnectConn();
         }
      }
      
      public function acceptConnection() : *
      {
         var strArray:Array = this.params.split(",");
         this.initiator = false;
         if(this.purpose == PURPOSE_DUEL)
         {
            if(duelConnection != null && duelConnection.status == STATUS_CONNECTED)
            {
               NetworkManager.instance.connectionGlobalPIO.send("ReqConnResponse",1,this.target,this.purpose);
               this.terminateConnection();
            }
            else
            {
               setDuelConnection(this);
               this.joinConnectionRoom(this.target,StatsManager.charname);
               this.timer.start();
               this.timer.addEventListener(TimerEvent.TIMER,this.timerListener,false,0,true);
            }
         }
         else if(this.purpose == PURPOSE_INVITE)
         {
            OverworldHUD.instance.updateChatLogWordsOnly(this.target + " invited you to join channel: " + this.params,"#FFCC00");
         }
         else if(this.purpose == PURPOSE_CHECKNOTIFICATIONS)
         {
            trace("check notifications");
            QueryManager.instance.checkNotifications();
         }
         else if(this.purpose == PURPOSE_BUFF)
         {
            trace("got buff");
            StatsManager.setBuff(strArray[0],strArray[1]);
            NetworkManager.instance.connectionGlobalPIO.send("ReqConnResponse",0,this.target,this.purpose);
         }
         else if(this.purpose == PURPOSE_TELEPORT)
         {
            trace("got teleport");
            if(GameEngine.isAdventureMode())
            {
               OverworldHUD.getInstance().screenTransition.setTeleportTarget(strArray[0],strArray[1],400);
               OverworldHUD.getInstance().screenTransition.startClose(ScreenTransition.ACTION_TELEPORT);
            }
            else
            {
               StageManager.setCurrentNode(strArray[0]);
            }
            NetworkManager.instance.connectionGlobalPIO.send("ReqConnResponse",0,this.target,this.purpose);
         }
         else if(this.purpose == PURPOSE_KICK)
         {
            trace("got kicked");
            if(GameEngine.isAdventureMode())
            {
               NetworkManager.instance.connectionGlobalPIO.send("ReqConnResponse",0,this.target,this.purpose);
               NetworkManager.instance.leaveRoom();
               GameEngine.battleModeToTitle();
               if(StatsManager.usePlayerIO)
               {
                  NetworkManager.instance.disconnectGlobalPIO();
               }
               QueryManager.instance.logout();
               TitleUI.instance.switchToLogin();
               TitleUI.instance.login.errormessage.text = LangManager.getString(31);
               TitleUI.instance.loadingScreenOn();
               TitleUI.instance.setLoadingScreenTextBig(LangManager.getString(674));
            }
            else
            {
               NetworkManager.instance.connectionGlobalPIO.send("ReqConnResponse",1,this.target,this.purpose);
            }
         }
         else if(this.purpose == PURPOSE_KICKDUPLICATEPLAYER)
         {
            trace("got duplicate kicked");
            if(!this.initiator)
            {
               NetworkManager.instance.connectionGlobalPIO.send("ReqConnResponse",0,this.target,this.purpose);
               OverworldHUD.instance.showDuplicate();
            }
         }
      }
      
      internal function setStatus(num:int) : *
      {
         this.status = num;
         if(this.status != STATUS_CONNECTED)
         {
            this.timer.stop();
            this.timer.removeEventListener(TimerEvent.TIMER,this.timerListener);
         }
      }
      
      public function getStatus() : int
      {
         return this.status;
      }
      
      internal function joinTargetServiceRoom(roomid:String, isMyServiceRoom:Boolean) : *
      {
         var userJoinObj:* = undefined;
         if(!isMyServiceRoom)
         {
            userJoinObj = new Object();
            userJoinObj.Name = StatsManager.charname;
            userJoinObj.invis = "3";
            QueryManagerPIO.instance.client.multiplayer.joinRoom(roomid,userJoinObj,this.handleSvcJoin,this.handleSvcError);
         }
         else
         {
            NetworkManager.instance.connectionGlobalPIO.send("ReqConn",this.target,this.purpose,this.params);
            NetworkManager.instance.connectionGlobalPIO.addMessageHandler("ReqConnStatus",this.handleSvcMessages);
         }
         this.timer.start();
         this.timer.addEventListener(TimerEvent.TIMER,this.timerListener,false,0,true);
      }
      
      internal function handleSvcJoin(connection:Connection) : *
      {
         this.connection = connection;
         connection.addDisconnectHandler(this.handleSvcDisconnect);
         connection.addMessageHandler("*",this.handleSvcMessages);
         this.connectedToConnectionRoom = false;
         connection.send("ReqConn",this.target,this.purpose,this.params);
      }
      
      internal function disconnectSvc() : *
      {
         if(this.connection != null && this.connection.connected)
         {
            this.connection.disconnect();
            this.connection.removeDisconnectHandler(this.handleSvcDisconnect);
            this.connection.removeMessageHandler("*",this.handleSvcMessages);
         }
         NetworkManager.instance.connectionGlobalPIO.removeMessageHandler("ReqConnStatus",this.handleSvcMessages);
         this.timer.stop();
         this.timer.removeEventListener(TimerEvent.TIMER,this.timerListener);
      }
      
      internal function handleSvcMessages(m:Message) : *
      {
         var response:int = 0;
         var mname:String = null;
         var mpurpose:int = 0;
         try
         {
            switch(m.type)
            {
               case "ReqConnStatus":
                  response = m.getInt(0);
                  if(response == 1)
                  {
                     if(this.purpose == PURPOSE_DUEL)
                     {
                        this.setStatus(STATUS_TARGETOFFLINE);
                        OverworldHUD.instance.showDuelDeclinedDialog("3");
                     }
                     else if(this.purpose == PURPOSE_BUFF || this.purpose == PURPOSE_TELEPORT || this.purpose == PURPOSE_KICK)
                     {
                        OverworldHUD.instance.chatText.words.text = "Failed";
                        this.terminateConnection();
                     }
                     else if(this.purpose == PURPOSE_KICKDUPLICATEPLAYER)
                     {
                        this.terminateConnection();
                     }
                  }
                  else if(response == 0)
                  {
                     if(this.purpose == PURPOSE_DUEL)
                     {
                        mname = m.getString(1);
                        mpurpose = m.getInt(2);
                        if(mname == this.target && mpurpose == this.purpose)
                        {
                           this.disconnectSvc();
                           this.joinConnectionRoom(StatsManager.charname,this.target);
                        }
                     }
                     else if(this.purpose == PURPOSE_BUFF || this.purpose == PURPOSE_TELEPORT || this.purpose == PURPOSE_KICK)
                     {
                        OverworldHUD.instance.chatText.words.text = "Success";
                        this.terminateConnection();
                     }
                     else if(this.purpose == PURPOSE_KICKDUPLICATEPLAYER)
                     {
                        this.terminateConnection();
                     }
                  }
            }
         }
         catch(e:Error)
         {
            QueryManagerPIO.instance.client.errorLog.writeError(e.message,"svc:" + m.toString(),e.getStackTrace(),e.errorID);
         }
      }
      
      internal function handleSvcDisconnect() : void
      {
         this.setStatus(STATUS_NETWORKERROR);
      }
      
      internal function handleSvcError(e:PlayerIOError) : *
      {
         this.setStatus(STATUS_NETWORKERROR);
      }
      
      internal function joinConnectionRoom(initname:String, targetname:String) : *
      {
         var userJoinObj:* = new Object();
         userJoinObj.charname = StatsManager.charname;
         var roomname:String = initname + "_" + targetname;
         var connType:String = "SHS3Connection";
         if(this.purpose == PURPOSE_DUEL && StatsManager.serverSideDuel)
         {
            connType = "SHS3DuelConnection";
         }
         QueryManagerPIO.instance.client.multiplayer.createJoinRoom(roomname,connType,true,{},userJoinObj,this.handleConnJoin,this.handleConnError);
         this.connectedToConnectionRoom = true;
      }
      
      internal function handleConnJoin(connection:Connection) : *
      {
         this.connection = connection;
         connection.addDisconnectHandler(this.handleConnDisconnect);
         connection.addMessageHandler("*",this.handleConnMessages);
         if(!this.initiator)
         {
            NetworkManager.instance.connectionGlobalPIO.send("ReqConnResponse",0,this.target,this.purpose);
         }
         else
         {
            this.setStatus(STATUS_CONNECTED);
         }
      }
      
      internal function disconnectConn() : *
      {
         if(this.connection != null && this.connection.connected)
         {
            this.connection.disconnect();
            this.connection.removeDisconnectHandler(this.handleConnDisconnect);
            this.connection.removeMessageHandler("*",this.handleConnMessages);
            this.timer.stop();
            this.timer.removeEventListener(TimerEvent.TIMER,this.timerListener);
         }
      }
      
      internal function handleConnDisconnect() : void
      {
         this.setStatus(STATUS_CLOSED);
      }
      
      internal function handleConnError(e:PlayerIOError) : *
      {
         this.setStatus(STATUS_NETWORKERROR);
      }
      
      public function isConnected() : Boolean
      {
         return this.connectedToConnectionRoom && this.status == STATUS_CONNECTED;
      }
      
      internal function handleConnMessages(m:Message) : *
      {
         var obj:Object = null;
         var latency:int = 0;
         var msgType:int = 0;
         var npc:EnemyPlayer = null;
         var victim:String = null;
         var actionState:int = 0;
         var xpos:int = 0;
         var ypos:int = 0;
         var facingRight:Boolean = false;
         var anim:String = null;
         var duelanim:String = null;
         var dist:int = 0;
         var lootlvl:int = 0;
         if(m.type == "UserJoined")
         {
            if(!this.initiator && this.status != STATUS_CONNECTED)
            {
               this.setStatus(STATUS_CONNECTED);
               this.connection.send("private",NetworkManager.MSG_CONNECTOK,this.target);
            }
         }
         else if(m.type == "UserLeft")
         {
            this.terminateConnection();
            this.setStatus(STATUS_CLOSED);
            if(this.purpose == PURPOSE_DUEL)
            {
               NetworkManager.instance.onNodeDisconnection(this.target);
            }
         }
         else if(m.type == "ping")
         {
            this.connection.send("pong");
         }
         else if(m.type == "private")
         {
            switch(m.getInt(0))
            {
               case NetworkManager.MSG_CONNECTOK:
                  if(NetworkManager.instance.networkMode == NetworkManager.MODE_DUELSETUP_INITIATE)
                  {
                     this.connection.send("private",NetworkManager.MSG_DUELREQUEST,this.target,StatsManager.charname,StatsManager.getLevel(),StatsManager.getPlayerStatsString(),StatsManager.getEquipmentString(),StatsManager.getSkillStatsString(),StatsManager.getTaunt(),DuelModeUI.instance.initBG());
                     DuelModeUI.instance.setSelectedOpponentNid(this.target);
                  }
                  break;
               case NetworkManager.MSG_DUELREQUEST:
                  if(GameEngine.isPvPRoomMode())
                  {
                     this.connection.send("private",NetworkManager.MSG_DUELRESPONSE,this.target,"2");
                  }
                  else if(GameEngine.isAdventureMode() && (NetworkManager.instance.networkMode == NetworkManager.MODE_IDLE || NetworkManager.instance.networkMode == NetworkManager.MODE_ADVENTUREMODEP2P))
                  {
                     NetworkManager.instance.networkMode = NetworkManager.MODE_DUELSETUP_RESPONSE;
                     obj = new Object();
                     obj.charname = m.getString(2);
                     obj.charlvl = m.getInt(3);
                     obj.stats = m.getString(4);
                     obj.equip = m.getString(5);
                     obj.skills = m.getString(6);
                     obj.taunt = m.getString(7);
                     obj.bg = m.getInt(8);
                     OverworldHUD.instance.showDuelRequestDialog(obj,this.target);
                  }
                  else
                  {
                     this.connection.send("private",NetworkManager.MSG_DUELRESPONSE,this.target,"3");
                  }
                  break;
               case NetworkManager.MSG_DUELREQUESTCANCEL:
                  NetworkManager.instance.networkMode = NetworkManager.MODE_IDLE;
                  OverworldHUD.instance.cancelDuelRequestDialog();
                  this.terminateConnection();
                  this.setStatus(STATUS_CLOSED);
                  break;
               case NetworkManager.MSG_DUELRESPONSE:
                  if(!DuelModeUI.instance.isReadyForDuel())
                  {
                     return;
                  }
                  if(m.getString(2) == "1")
                  {
                     trace("ok to duel");
                     DuelModeUI.instance.updateOpponentData(m.getString(3),m.getString(4));
                     NetworkManager.instance.networkMode = NetworkManager.MODE_DUELLINGP2P;
                     NetworkManager.instance.startRecording();
                     DuelModeUI.instance.proceedWithHumanOpponent(this.target,true);
                  }
                  else
                  {
                     trace("AI duel");
                     OverworldHUD.instance.showDuelDeclinedDialog(m.getString(2));
                     this.terminateConnection();
                     this.setStatus(STATUS_CLOSED);
                  }
                  break;
               case NetworkManager.MSG_DUELPING:
                  this.connection.send("private",NetworkManager.MSG_DUELPONG,this.target,m.getInt(2),m.getBoolean(3));
                  break;
               case NetworkManager.MSG_DUELPONG:
                  latency = (int(new Date().valueOf() % 1000000) - m.getNumber(2)) / 2;
                  BattleUI.instance.setLatency(latency);
                  if(m.getBoolean(3))
                  {
                     this.connection.send("private",NetworkManager.MSG_DUELPONG2,this.target,latency);
                  }
                  break;
               case NetworkManager.MSG_DUELPONG2:
                  BattleUI.instance.setLatency(m.getInt(2));
            }
         }
         else if(m.type == "public")
         {
            obj = new Object();
            msgType = m.getInt(0);
            switch(msgType)
            {
               case NetworkManager.MSG_DUELMOVE:
                  InputManager.gotNetworkInput(m.getString(2),m.getString(1),m.getInt(3));
                  break;
               case NetworkManager.MSG_DUELDAMAGE:
                  victim = m.getString(2);
                  if(!NetworkManager.instance.playBack && (victim == NetworkManager.instance.nid || victim == StatsManager.charname))
                  {
                     StatsManager.getPlayer().gotNetworkDamage(m.getInt(3),m.getString(4));
                  }
                  else
                  {
                     npc = NPCManager.getNetworkEnemyPlayer(victim);
                     if(npc != null)
                     {
                        npc.gotNetworkDamage(m.getInt(3),m.getString(4));
                     }
                  }
                  break;
               case NetworkManager.MSG_DUELSETSTANCE:
                  npc = NPCManager.getNetworkEnemyPlayer(m.getString(1));
                  if(npc != null)
                  {
                     npc.setStance(m.getInt(2));
                  }
                  break;
               case NetworkManager.MSG_DUELSTARTACTION:
                  actionState = m.getInt(2);
                  xpos = m.getInt(3);
                  ypos = m.getInt(4);
                  facingRight = m.getBoolean(5);
                  anim = m.getString(6);
                  npc = NPCManager.getNetworkEnemyPlayer(m.getString(1));
                  if(npc != null)
                  {
                     dist = npc.getMapPosition() - xpos;
                     if(dist * dist > 10000)
                     {
                        npc.setPosition(xpos,ypos);
                     }
                     if(facingRight)
                     {
                        npc.getMCS().faceRight();
                     }
                     else
                     {
                        npc.getMCS().faceLeft();
                     }
                     npc.cancelStealth();
                     if(actionState == MCSActor.SKILL_SHADOWCLONE_STATE || actionState == MCSActor.SKILL_MASSCLONE_STATE)
                     {
                        npc.cloneIndex = int(anim);
                        npc.startAction(actionState);
                     }
                     else
                     {
                        if(anim != "")
                        {
                           npc.startAnim(anim);
                        }
                        npc.startAction(actionState);
                     }
                  }
                  break;
               case NetworkManager.MSG_DUELCREATEPROJECTILE:
                  ProjectileManager.createProjectile(m.getInt(2),m.getInt(3),m.getInt(4),m.getInt(5),m.getInt(6),m.getInt(7),m.getInt(8),NPCManager.getNetworkPlayer(m.getString(1)));
                  break;
               case NetworkManager.MSG_DUELCHAT:
                  npc = NPCManager.getNetworkEnemyPlayer(m.getString(1));
                  if(npc != null)
                  {
                     npc.say(m.getString(2));
                  }
                  BattleUI.instance.updateChatLog(npc.charname,m.getString(2));
                  break;
               case NetworkManager.MSG_DUELSTARTANIM:
                  duelanim = m.getString(2);
                  if(duelanim == "fart")
                  {
                     SoundManager.instance.playFart();
                  }
                  else
                  {
                     npc = NPCManager.getNetworkEnemyPlayer(m.getString(1));
                     if(npc != null)
                     {
                        npc.startAnim(duelanim);
                     }
                  }
                  break;
               case NetworkManager.MSG_DUELANNOUNCEMENT:
                  BattleUI.instance.updateChatLog(m.getString(1),m.getString(2));
                  break;
               case NetworkManager.MSG_GIVEPVPKILLERLOOT:
                  if(!NetworkManager.instance.playBack && m.getString(1) == StatsManager.charname && GameEngine.isPvPRoomMode())
                  {
                     lootlvl = m.getInt(2);
                     OverworldHUD.instance.lootDialog.addRandomLootItem(lootlvl);
                     if(lootlvl <= 10 || int(Math.random() * 3) == 0)
                     {
                        OverworldHUD.instance.lootDialog.addLootCoins(Math.random() * lootlvl);
                     }
                     if(StatsManager.getLevel() < 10)
                     {
                        OverworldHUD.instance.lootDialog.addLootXP(NPC.calcXP(StatsManager.getLevel(),lootlvl,lootlvl * 5 + 45,false) * 3);
                     }
                     else
                     {
                        OverworldHUD.instance.lootDialog.addLootXP(NPC.calcXP(StatsManager.getLevel(),lootlvl,lootlvl * 5 + 45,true));
                     }
                  }
            }
         }
      }
   }
}

