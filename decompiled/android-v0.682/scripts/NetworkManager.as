package
{
   import flash.geom.Point;
   import playerio.Connection;
   import playerio.Message;
   
   public class NetworkManager extends NetworkCoreP2P
   {
      
      public static var instance:NetworkManager;
      
      public static var MODE_IDLE:int = 0;
      
      public static var MODE_DUELSETUP_INITIATE:int = 1;
      
      public static var MODE_DUELSETUP_RESPONSE:int = 2;
      
      public static var MODE_DUELLING:int = 3;
      
      public static var MODE_DUELLINGP2P:int = 4;
      
      public static var MODE_ADVENTUREMODEP2P:int = 5;
      
      public static var OUTPUT:int = 0;
      
      public static var DISCONNECT:int = 1;
      
      public static var MSG_CONNECTOK:int = 2;
      
      public static var MSG_DUELREQUEST:int = 3;
      
      public static var MSG_DUELREQUESTCANCEL:int = 4;
      
      public static var MSG_DUELRESPONSE:int = 5;
      
      public static var MSG_DUELMOVE:int = 6;
      
      public static var MSG_DUELDAMAGE:int = 7;
      
      public static var MSG_DUELSETSTANCE:int = 8;
      
      public static var MSG_DUELSTARTANIM:int = 9;
      
      public static var MSG_DUELSTARTACTION:int = 10;
      
      public static var MSG_DUELCREATEPROJECTILE:int = 11;
      
      public static var MSG_DUELCHAT:int = 12;
      
      public static var MSG_DUELPING:int = 13;
      
      public static var MSG_DUELPONG:int = 14;
      
      public static var MSG_DUELPONG2:int = 15;
      
      public static var MSG_DUELANNOUNCEMENT:int = 16;
      
      public static var MSG_GIVEPVPKILLERLOOT:int = 17;
      
      public static var MSG_ENTERROOM:int = 100;
      
      public static var MSG_LEFTROOM:int = 101;
      
      public static var MSG_CHAT:int = 102;
      
      public static var MSG_PLAYERLIST:int = 103;
      
      public static var MSG_PLAYERUPDATEEQ:int = 104;
      
      public static var MSG_PLAYERUPDATELVL:int = 105;
      
      public static var MSG_PLAYERUPDATEBUSY:int = 106;
      
      public static var MSG_PLAYEREMOTE:* = 107;
      
      public static var MSG_CHECKNOTIFICATIONS:int = 108;
      
      public static var MSG_CONNECTEDTOCHAT:int = 109;
      
      public static var MSG_PINGMULTICLIENT:int = 110;
      
      public static var MSG_CREATEROOMOBJECT:int = 111;
      
      public static var MSG_REMOVEROOMOBJECT:int = 112;
      
      public static var MSG_ROOMCREATEPROJECTILE:int = 113;
      
      public static var MSG_GOTTELEPORTED:int = 114;
      
      public static var MSG_GOTBUFF:int = 115;
      
      public static var MSG_GOTKICKED:int = 116;
      
      public static var MSG_SETOBJECTSTATE:int = 117;
      
      public static var MSG_GIVEITEM:int = 118;
      
      public static var MSG_PLAYERTEACH:* = 119;
      
      internal var networkMode:int = 0;
      
      internal var recording:Boolean = false;
      
      internal var recordedList:Array;
      
      internal var playList:Array;
      
      internal var recordedPlayerList:Array;
      
      internal var recordStart:int;
      
      internal var recordedWin:int;
      
      internal var playTime:int = 0;
      
      internal var nextNetworkRecord:NetworkRecord;
      
      internal var playBack:Boolean = false;
      
      internal var cutsceneNextQuestId:int;
      
      internal var cutsceneNextQuestStep:int;
      
      internal var hasChatBot:Boolean = false;
      
      internal var serviceRoomId:String;
      
      internal var svcRoomMembers:Array = new Array();
      
      public function NetworkManager()
      {
         super();
         instance = this;
         init();
      }
      
      public static function getInstance() : NetworkManager
      {
         if(instance == null)
         {
            instance = new NetworkManager();
         }
         return instance;
      }
      
      public function setNetworkMode(num:int) : *
      {
         this.networkMode = num;
      }
      
      override internal function clientCanConnect(id:String) : Boolean
      {
         return true;
      }
      
      override internal function onConnectedToNode(id:String) : *
      {
         trace("connected to node");
         sendTo(id,MSG_CONNECTOK,null);
      }
      
      override internal function onConnectionRequestRejection(id:String) : *
      {
         trace("node connection request rejected");
      }
      
      override internal function onNodeDisconnection(id:String) : *
      {
         var npc:NPC = null;
         trace("node disconnected from me");
         if(this.networkMode == MODE_DUELSETUP_INITIATE)
         {
            this.networkMode = MODE_IDLE;
            OverworldHUD.instance.showDuelDeclinedDialog("3");
         }
         else if(this.networkMode == MODE_DUELLINGP2P && !StageManager.isRedFreeze())
         {
            npc = NPCManager.getNetworkPlayer(id);
            if(npc != null)
            {
               npc.die();
            }
            NPCManager.externalRedFreezeCheck();
         }
      }
      
      public function isGlobalPIOConnected() : Boolean
      {
         return connectionGlobalPIO != null && connectionGlobalPIO.connected;
      }
      
      override internal function processMsg(sender:String, msgType:int, msg:Object) : *
      {
         var npc:NPC = null;
         var obj:Object = null;
         var duelconnection:Connection = null;
         var latency:int = 0;
         var enemyplayer:EnemyPlayer = null;
         var distX:int = 0;
         var distY:int = 0;
         var duelconnection2:Connection = null;
         if(this.recording)
         {
            this.doRecord(msgType,msg,sender);
         }
         switch(msgType)
         {
            case OUTPUT:
               outputToConsole(msg);
               break;
            case MSG_CONNECTOK:
               if(this.networkMode == MODE_DUELSETUP_INITIATE)
               {
                  obj = new Object();
                  obj.charname = StatsManager.charname;
                  obj.charlvl = StatsManager.getLevel();
                  obj.stats = StatsManager.getPlayerStatsString();
                  obj.equip = StatsManager.getEquipmentString();
                  obj.skills = StatsManager.getSkillStatsString();
                  obj.taunt = StatsManager.getTaunt();
                  obj.bg = DuelModeUI.instance.initBG();
                  sendTo(sender,MSG_DUELREQUEST,obj);
                  DuelModeUI.instance.setSelectedOpponentNid(sender);
               }
               break;
            case MSG_DUELREQUEST:
               if(GameEngine.isPvPRoomMode())
               {
                  sendTo(sender,MSG_DUELRESPONSE,"2");
               }
               else if(GameEngine.isAdventureMode() && (this.networkMode == MODE_IDLE || this.networkMode == MODE_ADVENTUREMODEP2P))
               {
                  this.networkMode == MODE_DUELSETUP_RESPONSE;
                  OverworldHUD.instance.showDuelRequestDialog(msg,sender);
               }
               else
               {
                  sendTo(sender,MSG_DUELRESPONSE,"3");
               }
               break;
            case MSG_DUELREQUESTCANCEL:
               this.networkMode = MODE_IDLE;
               OverworldHUD.instance.cancelDuelRequestDialog();
               disconnect(sender);
               break;
            case MSG_DUELRESPONSE:
               if(!DuelModeUI.instance.isReadyForDuel())
               {
                  return;
               }
               if(msg == "1")
               {
                  trace("ok to duel");
                  this.networkMode = MODE_DUELLINGP2P;
                  this.startRecording();
                  DuelModeUI.instance.proceedWithHumanOpponent(sender,true);
               }
               else
               {
                  trace("AI duel");
                  OverworldHUD.instance.showDuelDeclinedDialog(String(msg));
                  disconnect(sender);
               }
               break;
            case MSG_DUELMOVE:
               InputManager.gotNetworkInput(msg.lineArrayStr,msg.nid,msg.posX);
               break;
            case MSG_DUELDAMAGE:
               if(!this.playBack && (msg.victim == nid || msg.victim == StatsManager.charname))
               {
                  StatsManager.getPlayer().gotNetworkDamage(msg.hp,msg.launched);
               }
               else
               {
                  npc = NPCManager.getNetworkPlayer(msg.victim);
                  if(npc != null)
                  {
                     EnemyPlayer(npc).gotNetworkDamage(msg.hp,msg.launched);
                  }
               }
               break;
            case MSG_DUELSETSTANCE:
               npc = NPCManager.getNetworkPlayer(sender);
               if(npc != null)
               {
                  EnemyPlayer(npc).setStance(msg.stance);
               }
               break;
            case MSG_DUELSTARTANIM:
               if(msg.anim == "fart")
               {
                  SoundManager.instance.playFart();
               }
               else
               {
                  npc = NPCManager.getNetworkPlayer(sender);
                  if(npc != null)
                  {
                     EnemyPlayer(npc).startAnim(msg.anim);
                  }
               }
               break;
            case MSG_DUELSTARTACTION:
               npc = NPCManager.getNetworkPlayer(sender);
               if(npc != null)
               {
                  enemyplayer = EnemyPlayer(npc);
                  distX = enemyplayer.getMapPosition() - msg.x;
                  distY = enemyplayer.getMCS().y - msg.y;
                  if(distX * distX > 10000 || distY * distY > 10000)
                  {
                     enemyplayer.setPosition(msg.x,msg.y);
                  }
                  if(msg.facingRight)
                  {
                     enemyplayer.getMCS().faceRight();
                  }
                  else
                  {
                     enemyplayer.getMCS().faceLeft();
                  }
                  enemyplayer.cancelStealth();
                  if(msg.actionState == MCSActor.SKILL_SHADOWCLONE_STATE || msg.actionState == MCSActor.SKILL_MASSCLONE_STATE)
                  {
                     enemyplayer.cloneIndex = int(msg.anim);
                     enemyplayer.startAction(msg.actionState);
                  }
                  else
                  {
                     if(msg.anim != "")
                     {
                        enemyplayer.startAnim(msg.anim);
                     }
                     enemyplayer.startAction(msg.actionState);
                  }
               }
               break;
            case MSG_DUELCREATEPROJECTILE:
               ProjectileManager.createProjectile(msg.ptype,msg.x,msg.y,msg.velX,msg.velY,msg.damage,msg.skilllevel,NPCManager.getNetworkPlayer(sender));
               break;
            case MSG_DUELCHAT:
               npc = NPCManager.getNetworkPlayer(sender);
               if(npc != null)
               {
                  EnemyPlayer(npc).say(msg.text);
               }
               BattleUI.instance.updateChatLog(EnemyPlayer(npc).charname,msg.text);
               break;
            case MSG_DUELPING:
               obj = new Object();
               obj.time = msg.time;
               obj.twoWay = msg.twoWay;
               duelconnection = ConnectionPIO.getDuelConnection();
               if(duelconnection != null && duelconnection.connected)
               {
                  duelconnection.send("private",MSG_DUELPONG,sender,obj.time,obj.twoWay);
               }
               else
               {
                  this.send(MSG_DUELPONG,obj);
               }
               break;
            case MSG_DUELPONG:
               latency = (int(new Date().valueOf() % 1000000) - msg.time) / 2;
               BattleUI.instance.setLatency(latency);
               if(msg.twoWay)
               {
                  obj = new Object();
                  obj.latency = latency;
                  duelconnection2 = ConnectionPIO.getDuelConnection();
                  if(duelconnection2 != null && duelconnection2.connected)
                  {
                     duelconnection2.send("private",MSG_DUELPONG2,sender,obj.latency);
                  }
                  else
                  {
                     this.send(MSG_DUELPONG2,obj);
                  }
               }
               break;
            case MSG_DUELPONG2:
               BattleUI.instance.setLatency(msg.latency);
         }
      }
      
      public function duelResponse(answer:Boolean, sender:String) : *
      {
         if(sender == null)
         {
            return;
         }
         var duelconnection:Connection = ConnectionPIO.getDuelConnection();
         if(answer)
         {
            if(duelconnection != null && duelconnection.connected)
            {
               duelconnection.send("private",MSG_DUELRESPONSE,sender,"1",StatsManager.getPlayerStatsString(),StatsManager.getEquipmentString());
            }
            else
            {
               sendTo(sender,MSG_DUELRESPONSE,"1");
            }
            this.networkMode = MODE_DUELLINGP2P;
         }
         else
         {
            if(duelconnection != null && duelconnection.connected)
            {
               duelconnection.send("private",MSG_DUELRESPONSE,sender,"0");
            }
            else
            {
               sendTo(sender,MSG_DUELRESPONSE,"0");
            }
            this.networkMode = MODE_IDLE;
         }
      }
      
      public function sendCancelDuelChallenge(nid:String) : *
      {
         var duelconnection:Connection = ConnectionPIO.getDuelConnection();
         if(duelconnection != null && duelconnection.connected)
         {
            duelconnection.send("private",MSG_DUELREQUESTCANCEL,nid);
         }
         else
         {
            sendTo(nid,MSG_DUELREQUESTCANCEL,null);
         }
         this.networkMode = MODE_IDLE;
      }
      
      public function duelEnd() : *
      {
         this.networkMode = MODE_IDLE;
         disconnectAll();
         ConnectionPIO.disconnectDuelConnection();
      }
      
      public function isP2P() : Boolean
      {
         return this.networkMode == MODE_DUELLINGP2P || this.networkMode == MODE_ADVENTUREMODEP2P;
      }
      
      public function isDuellingP2P() : Boolean
      {
         return this.networkMode == MODE_DUELLINGP2P;
      }
      
      public function sendMove(lineArray:Vector.<Point>, offset:int, posX:int, callerNid:String = "") : *
      {
         var pt:Point = null;
         var duelconnection:Connection = null;
         var lineArrayStr:String = "";
         var max:int = int(lineArray.length);
         for(var i:int = 0; i < max; i++)
         {
            pt = lineArray[i];
            lineArrayStr += pt.x + offset + "," + pt.y;
            if(i < max - 1)
            {
               lineArrayStr += "|";
            }
         }
         if(callerNid == "")
         {
            callerNid = StatsManager.charname;
         }
         var obj:Object = new Object();
         obj.lineArrayStr = lineArrayStr;
         obj.nid = callerNid;
         obj.posX = posX;
         if(this.networkMode == MODE_ADVENTUREMODEP2P && StatsManager.usePlayerIO)
         {
            if(connectionPIO != null && connectionPIO.connected)
            {
               connectionPIO.send("public",MSG_DUELMOVE,callerNid,obj.lineArrayStr,obj.posX);
            }
         }
         else
         {
            duelconnection = ConnectionPIO.getDuelConnection();
            if(duelconnection != null && duelconnection.connected)
            {
               duelconnection.send("public",MSG_DUELMOVE,callerNid,obj.lineArrayStr,obj.posX);
               if(this.recording)
               {
                  this.doRecord(MSG_DUELMOVE,obj,callerNid);
               }
            }
            else
            {
               this.send(MSG_DUELMOVE,obj);
            }
         }
      }
      
      public function sendDamage(nid:String, hp:int, damageObj:Damage) : *
      {
         var duelconnection:Connection = null;
         var obj:Object = new Object();
         obj.victim = nid;
         obj.hp = hp;
         obj.launched = damageObj.getLaunchedString();
         if(this.networkMode == MODE_ADVENTUREMODEP2P && StatsManager.usePlayerIO)
         {
            if(connectionPIO != null && connectionPIO.connected)
            {
               connectionPIO.send("public",MSG_DUELDAMAGE,StatsManager.charname,obj.victim,obj.hp,obj.launched);
            }
         }
         else
         {
            duelconnection = ConnectionPIO.getDuelConnection();
            if(duelconnection != null && duelconnection.connected)
            {
               duelconnection.send("public",MSG_DUELDAMAGE,StatsManager.charname,obj.victim,obj.hp,obj.launched);
               if(this.recording)
               {
                  this.doRecord(MSG_DUELDAMAGE,obj,nid);
               }
            }
            else
            {
               this.send(MSG_DUELDAMAGE,obj);
            }
         }
      }
      
      public function setStance(stance:int) : *
      {
         var duelconnection:Connection = null;
         var obj:Object = new Object();
         obj.stance = stance;
         if(this.networkMode == MODE_ADVENTUREMODEP2P && StatsManager.usePlayerIO)
         {
            if(connectionPIO != null && connectionPIO.connected)
            {
               connectionPIO.send("public",MSG_DUELSETSTANCE,StatsManager.charname,obj.stance);
            }
         }
         else
         {
            duelconnection = ConnectionPIO.getDuelConnection();
            if(duelconnection != null && duelconnection.connected)
            {
               duelconnection.send("public",MSG_DUELSETSTANCE,StatsManager.charname,obj.stance);
               if(this.recording)
               {
                  this.doRecord(MSG_DUELSETSTANCE,obj,nid);
               }
            }
            else
            {
               this.send(MSG_DUELSETSTANCE,obj);
            }
         }
      }
      
      public function startAnim(anim:String) : *
      {
         var duelconnection:Connection = null;
         var obj:Object = new Object();
         obj.anim = anim;
         if(this.networkMode == MODE_ADVENTUREMODEP2P && StatsManager.usePlayerIO)
         {
            if(connectionPIO != null && connectionPIO.connected)
            {
               connectionPIO.send("public",MSG_DUELSTARTANIM,StatsManager.charname,obj.anim);
            }
         }
         else
         {
            duelconnection = ConnectionPIO.getDuelConnection();
            if(duelconnection != null && duelconnection.connected)
            {
               duelconnection.send("public",MSG_DUELSTARTANIM,StatsManager.charname,obj.anim);
               if(this.recording)
               {
                  this.doRecord(MSG_DUELSTARTANIM,obj,nid);
               }
            }
            else
            {
               this.send(MSG_DUELSTARTANIM,obj);
            }
         }
      }
      
      public function duelChat(str:String) : *
      {
         var duelconnection:Connection = null;
         var obj:Object = new Object();
         obj.text = str;
         if(this.networkMode == MODE_ADVENTUREMODEP2P && StatsManager.usePlayerIO)
         {
            if(connectionPIO != null && connectionPIO.connected)
            {
               connectionPIO.send("public",MSG_DUELCHAT,StatsManager.charname,obj.text);
            }
         }
         else
         {
            duelconnection = ConnectionPIO.getDuelConnection();
            if(duelconnection != null && duelconnection.connected)
            {
               duelconnection.send("public",MSG_DUELCHAT,StatsManager.charname,obj.text);
               if(this.recording)
               {
                  this.doRecord(MSG_DUELCHAT,obj,nid);
               }
            }
            else
            {
               this.send(MSG_DUELCHAT,obj);
            }
         }
         StatsManager.getPlayer().say(str);
      }
      
      public function duelAnnouncement(str1:String, str2:String) : *
      {
         var duelconnection:Connection = null;
         var obj:Object = new Object();
         obj.str1 = str1;
         obj.str2 = str2;
         if(this.networkMode == MODE_ADVENTUREMODEP2P && StatsManager.usePlayerIO)
         {
            if(connectionChatPIO != null && connectionChatPIO.connected)
            {
               connectionChatPIO.send("public",MSG_DUELANNOUNCEMENT,obj.str1,obj.str2);
            }
         }
         else
         {
            duelconnection = ConnectionPIO.getDuelConnection();
            if(duelconnection != null && duelconnection.connected)
            {
               duelconnection.send("public",MSG_DUELANNOUNCEMENT,obj.str1,obj.str2);
               if(this.recording)
               {
                  this.doRecord(MSG_DUELANNOUNCEMENT,obj,nid);
               }
            }
            else
            {
               this.send(MSG_DUELANNOUNCEMENT,obj);
            }
         }
      }
      
      public function giveKillerLoot(killername:String, victimlvl:int) : *
      {
         var duelconnection:Connection = null;
         var obj:Object = new Object();
         obj.name = killername;
         obj.lvl = victimlvl;
         if(this.networkMode == MODE_ADVENTUREMODEP2P && StatsManager.usePlayerIO)
         {
            if(connectionPIO != null && connectionPIO.connected)
            {
               connectionPIO.send("public",MSG_GIVEPVPKILLERLOOT,obj.name,obj.lvl);
            }
         }
         else
         {
            duelconnection = ConnectionPIO.getDuelConnection();
            if(duelconnection != null && duelconnection.connected)
            {
               duelconnection.send("public",MSG_GIVEPVPKILLERLOOT,obj.name,obj.lvl);
            }
            else
            {
               this.send(MSG_GIVEPVPKILLERLOOT,obj);
            }
         }
      }
      
      public function duelPing(twoWay:Boolean) : *
      {
         var obj:Object = new Object();
         obj.time = int(new Date().valueOf() % 1000000);
         obj.twoWay = twoWay;
         var duelconnection:Connection = ConnectionPIO.getDuelConnection();
         if(duelconnection != null && duelconnection.connected)
         {
            duelconnection.send("private",MSG_DUELPING,ConnectionPIO.getDuelTarget(),obj.time,obj.twoWay);
            if(this.recording)
            {
               this.doRecord(MSG_DUELPING,obj,nid);
            }
         }
         else
         {
            this.send(MSG_DUELPING,obj);
         }
      }
      
      public function startAction(actionState:int, x:int, y:int, facingRight:Boolean, anim:String = "") : *
      {
         var duelconnection:Connection = null;
         var obj:Object = new Object();
         obj.actionState = actionState;
         obj.x = x;
         obj.y = y;
         obj.facingRight = facingRight;
         obj.anim = anim;
         if(this.networkMode == MODE_ADVENTUREMODEP2P && StatsManager.usePlayerIO)
         {
            if(connectionPIO != null && connectionPIO.connected)
            {
               connectionPIO.send("public",MSG_DUELSTARTACTION,StatsManager.charname,obj.actionState,obj.x,obj.y,obj.facingRight,obj.anim);
            }
         }
         else
         {
            duelconnection = ConnectionPIO.getDuelConnection();
            if(duelconnection != null && duelconnection.connected)
            {
               duelconnection.send("public",MSG_DUELSTARTACTION,StatsManager.charname,obj.actionState,obj.x,obj.y,obj.facingRight,obj.anim);
               if(this.recording)
               {
                  this.doRecord(MSG_DUELSTARTACTION,obj,nid);
               }
            }
            else
            {
               this.send(MSG_DUELSTARTACTION,obj);
            }
         }
      }
      
      public function createDuelProjectile(projectileType:int, x:int, y:int, velX:int, velY:int, damage:int, skilllevel:int) : *
      {
         var duelconnection:Connection = null;
         var obj:Object = new Object();
         obj.ptype = projectileType;
         obj.x = x;
         obj.y = y;
         obj.velX = velX;
         obj.velY = velY;
         obj.damage = damage;
         obj.skilllevel = skilllevel;
         if(this.networkMode == MODE_ADVENTUREMODEP2P && StatsManager.usePlayerIO)
         {
            if(connectionPIO != null && connectionPIO.connected)
            {
               connectionPIO.send("public",MSG_DUELCREATEPROJECTILE,StatsManager.charname,obj.ptype,obj.x,obj.y,obj.velX,obj.velY,obj.damage,obj.skilllevel);
            }
         }
         else
         {
            duelconnection = ConnectionPIO.getDuelConnection();
            if(duelconnection != null && duelconnection.connected)
            {
               duelconnection.send("public",MSG_DUELCREATEPROJECTILE,StatsManager.charname,obj.ptype,obj.x,obj.y,obj.velX,obj.velY,obj.damage,obj.skilllevel);
               if(this.recording)
               {
                  this.doRecord(MSG_DUELCREATEPROJECTILE,obj,nid);
               }
            }
            else
            {
               this.send(MSG_DUELCREATEPROJECTILE,obj);
            }
         }
      }
      
      override public function send(msgType:int, msg:Object) : void
      {
         if(StatsManager.usePlayerIO && StatsManager.usePlayerIOForDuels)
         {
            return;
         }
         if(!connected)
         {
            return;
         }
         if(this.networkMode == MODE_DUELLINGP2P)
         {
            sendStream.send("processMsg",msgType,msg);
         }
         else if(this.networkMode == MODE_ADVENTUREMODEP2P)
         {
            sendToGroup(msgType,msg);
         }
         if(this.recording)
         {
            this.doRecord(msgType,msg,nid);
         }
      }
      
      public function isRecording() : Boolean
      {
         return this.recording;
      }
      
      internal function startRecording() : *
      {
      }
      
      internal function doRecord(msgType:int, msg:Object, sender:String) : *
      {
         if(sender == this.recordedPlayerList[0])
         {
            sender = "0";
         }
         else if(sender == this.recordedPlayerList[1])
         {
            sender = "1";
         }
         else
         {
            sender = "?";
         }
         this.recordedList.push(new NetworkRecord(msgType,msg,sender,this.playTime));
      }
      
      public function stopRecording(win:int) : *
      {
         if(this.recording)
         {
            this.recording = false;
            this.recordedWin = win;
            if(win == 0)
            {
               this.recordedList[0].getMsg().win = true;
               this.recordedList[1].getMsg().win = false;
            }
            else if(win == 1)
            {
               this.recordedList[0].getMsg().win = false;
               this.recordedList[1].getMsg().win = true;
            }
            else
            {
               this.recordedList[0].getMsg().win = true;
               this.recordedList[1].getMsg().win = true;
            }
         }
      }
      
      internal function getRecordingStr() : String
      {
         var player1name:String = this.recordedList[0].getMsg().charname;
         var player2name:String = this.recordedList[1].getMsg().charname;
         if(StatsManager.usePlayerIO && StatsManager.usePlayerIOForDuels)
         {
            this.recordedList[0].getMsg().charname = "_player1charname_";
            this.recordedList[1].getMsg().charname = "_player2charname_";
         }
         var max:int = int(this.recordedList.length);
         var output:String = "";
         for(var i:int = 0; i < max; i++)
         {
            output += this.recordedList[i].toString() + NetworkRecord.DELIM3;
         }
         max = int(this.recordedPlayerList.length);
         for(i = 0; i < max; i++)
         {
            output = output.split(this.recordedPlayerList[i]).join(i.toString());
         }
         if(StatsManager.usePlayerIO && StatsManager.usePlayerIOForDuels)
         {
            output = output.split("_player1charname_").join(player1name);
            output = output.split("_player2charname_").join(player2name);
            this.recordedList[0].getMsg().charname = player1name;
            this.recordedList[1].getMsg().charname = player2name;
         }
         return output;
      }
      
      public function saveRecording() : *
      {
         var data:String = this.getRecordingStr();
         var player1name:String = this.recordedList[0].getMsg().charname;
         var player2name:String = this.recordedList[1].getMsg().charname;
         QueryManager.instance.saveReplay(player1name,player2name,data,this.recordedWin);
      }
      
      public function runRecording() : *
      {
         if(this.recordedList == null || this.recordedList.length == 0)
         {
            return;
         }
         this.playRecording(this.getRecordingStr());
      }
      
      public function playRecording(str:String) : *
      {
         this.playList = NetworkRecord.parse(str);
         var player1:NetworkRecord = this.playList.shift();
         var player2:NetworkRecord = this.playList.shift();
         if(player1 == null || player2 == null)
         {
            trace("recording data error, showing a random recording instead");
            QueryManagerPIO.instance.getReplay("0");
            return;
         }
         DuelModeUI.instance.proceedWithRecordedDuel(player1.msg,player2.msg);
         this.playTime = 0;
         this.playBack = true;
         this.nextNetworkRecord = this.playList.shift();
         if(player1.getMsg().win == false)
         {
            PlaybackEndUI.instance.setWinner(player2.getMsg().charname,player2.getMsg().taunt,701);
         }
         else if(player2.getMsg().win == false)
         {
            PlaybackEndUI.instance.setWinner(player1.getMsg().charname,player1.getMsg().taunt,700);
         }
         else
         {
            PlaybackEndUI.instance.setDraw();
         }
      }
      
      public function playCutscene(str:String, nextQuestId:int, nextQuestStep:int) : *
      {
         this.cutsceneNextQuestId = nextQuestId;
         this.cutsceneNextQuestStep = nextQuestStep;
         this.playList = NetworkRecord.parse(str);
         var playerArray:Array = new Array();
         while(this.playList[0].msgType == MSG_CONNECTOK)
         {
            playerArray.push(this.playList.shift().msg);
         }
         DuelModeUI.instance.proceedWithCutscene(playerArray);
         this.playTime = 0;
         this.playBack = true;
         this.nextNetworkRecord = this.playList.shift();
      }
      
      public function update() : *
      {
         if(this.recording)
         {
            ++this.playTime;
         }
         else if(this.playBack)
         {
            ++this.playTime;
            if(this.nextNetworkRecord == null)
            {
               this.playBack = false;
            }
            while(this.nextNetworkRecord != null && this.nextNetworkRecord.getTimeStamp() <= this.playTime)
            {
               this.processMsg(this.nextNetworkRecord.getSender(),this.nextNetworkRecord.getMsgType(),this.nextNetworkRecord.getMsg());
               if(this.playList.length == 0)
               {
                  this.nextNetworkRecord = null;
                  if(GameEngine.isCutscene())
                  {
                     GameEngine.endCutscene(this.cutsceneNextQuestId,this.cutsceneNextQuestStep);
                  }
                  else if(!StageManager.isRedFreeze())
                  {
                     if(PlaybackEndUI.instance.winner == 700)
                     {
                        EnemyPlayer(NPCManager.getNetworkPlayer("1")).gotNetworkDamage(0,"");
                     }
                     else
                     {
                        EnemyPlayer(NPCManager.getNetworkPlayer("0")).gotNetworkDamage(0,"");
                     }
                  }
               }
               else
               {
                  this.nextNetworkRecord = this.playList.shift();
               }
            }
         }
      }
      
      override public function processGroupMsg(msg:Object) : void
      {
         var npc:NPC = null;
         var max:int = 0;
         var playerStr:Array = null;
         var stepStat:int = 0;
         var stepPose:String = null;
         var stepName:String = null;
         var stagepos:int = 0;
         var obj:TriggeredStageObject = null;
         var color:String = null;
         var i:int = 0;
         var enemyPlayer:EnemyPlayer = null;
         var killer:EnemyPlayer = null;
         var enemyplayer:EnemyPlayer = null;
         switch(msg.msgType)
         {
            case OUTPUT:
               outputToConsole(msg);
               break;
            case MSG_ENTERROOM:
               NPCManager.createNetworkPlayer(msg.id,msg.charname,msg.charlvl,msg.equip,msg.nid,msg.x,msg.side,msg.facingRight,msg.pose,msg.stats,msg.skills,msg.taunt,true);
               break;
            case MSG_LEFTROOM:
               NPCManager.removeNetworkPlayer(msg.peerID);
               break;
            case MSG_CHAT:
               if(msg.side == 0 || msg.side == -1 || msg.side == StatsManager.getSide())
               {
                  NPCManager.networkPlayerChat(msg.nid,msg.text);
                  if(msg.side == 0)
                  {
                     color = "#FFFFFF";
                  }
                  else if(msg.side == -1)
                  {
                     color = "#CCCCCC";
                  }
                  else if(msg.side == 1)
                  {
                     color = "#FF0000";
                  }
                  else if(msg.side == 2)
                  {
                     color = "#00FF00";
                  }
                  else if(msg.side == 3)
                  {
                     color = "#00FFFF";
                  }
                  else if(msg.side == 4)
                  {
                     color = "#FFCC00";
                  }
                  else if(StatsManager.isCustomClan(msg.side))
                  {
                     color = "#FF9900";
                  }
                  if(GameEngine.isAdventureMode())
                  {
                     OverworldHUD.instance.updateChatLog(msg.charname,msg.text,color);
                  }
               }
               break;
            case MSG_PLAYERLIST:
               max = int(msg.playerList.length);
               for(i = 0; i < max; i++)
               {
                  playerStr = msg.playerList[i].split("$");
                  NPCManager.createNetworkPlayer(playerStr[0],playerStr[1],playerStr[2],playerStr[3],playerStr[4],playerStr[5],playerStr[6],playerStr[7],playerStr[8],playerStr[9],playerStr[10],playerStr[11],false);
               }
               break;
            case MSG_PLAYERUPDATEEQ:
               NPCManager.networkPlayerUpdateEq(msg.nid,msg.equip);
               break;
            case MSG_PLAYERUPDATELVL:
               NPCManager.networkPlayerUpdateLvl(msg.nid,msg.charlvl);
               break;
            case MSG_PLAYERUPDATEBUSY:
               NPCManager.networkPlayerUpdateBusy(msg.nid,msg.busy);
               break;
            case MSG_DUELSTARTANIM:
               NPCManager.networkPlayerEmote(msg.nid,msg.anim);
               break;
            case MSG_PLAYERTEACH:
               stepStat = -1;
               stepPose = "";
               stepName = "";
               switch(msg.step)
               {
                  case 1:
                     stepStat = 40008;
                     stepPose = MCSActor.POSE1;
                     stepName = LangManager.getString(6116);
                     break;
                  case 2:
                     stepStat = 40010;
                     stepPose = MCSActor.POSE1;
                     stepName = LangManager.getString(6124);
                     break;
                  case 3:
                     stepStat = 40004;
                     stepPose = MCSActor.POSE5;
                     stepName = LangManager.getString(6118);
                     break;
                  case 4:
                     stepStat = 40014;
                     stepPose = MCSActor.POSE5;
                     stepName = LangManager.getString(6126);
                     break;
                  case 5:
                     stepStat = 40003;
                     stepPose = MCSActor.POSE8;
                     stepName = LangManager.getString(6120);
                     break;
                  case 6:
                     stepStat = 40017;
                     stepPose = MCSActor.POSE8;
                     stepName = LangManager.getString(6128);
                     break;
                  case 7:
                     stepStat = 40006;
                     stepPose = MCSActor.POSE2;
                     stepName = LangManager.getString(6122);
                     break;
                  case 8:
                     stepStat = 40011;
                     stepPose = MCSActor.POSE2;
                     stepName = LangManager.getString(6130);
               }
               if(msg.target == nid && stepStat != -1 && GameEngine.isAdventureMode())
               {
                  enemyPlayer = NPCManager.getNetworkPlayer(msg.nid) as EnemyPlayer;
                  if(StatsManager.getStat(stepStat) == 0)
                  {
                     StatsManager.setStat(stepStat,1);
                     if(enemyPlayer != null)
                     {
                        OverworldHUD.instance.showDialog(LangManager.getString(756,[enemyPlayer.charname,stepName]),LangManager.getString(5));
                     }
                  }
                  else if(enemyPlayer != null)
                  {
                     OverworldHUD.instance.showDialog(LangManager.getString(757,[enemyPlayer.charname,stepName]),LangManager.getString(5));
                  }
                  QueryManager.instance.saveModifiedCharData();
               }
               if(stepPose != "")
               {
                  NPCManager.networkPlayerEmote(msg.nid,stepPose);
               }
               break;
            case MSG_PLAYEREMOTE:
               if(msg.anim == "fart")
               {
                  SoundManager.instance.playFart();
               }
               else
               {
                  NPCManager.networkPlayerEmote(msg.nid,msg.anim);
               }
               break;
            case MSG_PINGMULTICLIENT:
               if(msg.charname == StatsManager.charname)
               {
                  this.leaveRoom();
                  GameEngine.battleModeToTitle();
                  disconnectGlobalPIO();
               }
               break;
            case MSG_CREATEROOMOBJECT:
               StageManager.getGameStage().createRoomObject(msg.objid,msg.x,msg.y,msg.props,msg.objname);
               break;
            case MSG_REMOVEROOMOBJECT:
               StageManager.getGameStage().removeInteractiveRoomObject(msg.objname);
               break;
            case MSG_ROOMCREATEPROJECTILE:
               stagepos = StageManager.getGameStage().getStagePosition();
               ProjectileManager.createProjectile(msg.ptype,msg.x,msg.y,msg.velX,msg.velY,msg.damage,msg.skilllevel,NPCManager.getNetworkPlayer(msg.nid));
               break;
            case MSG_DUELMOVE:
               InputManager.gotNetworkInput(msg.lineArrayStr,msg.nid,msg.posX);
               break;
            case MSG_SETOBJECTSTATE:
               obj = StageManager.getGameStage().getRoomInteractiveObject(msg.name) as TriggeredStageObject;
               if(obj != null)
               {
                  obj.triggerObject(msg.flag,msg.flag2);
               }
               break;
            case MSG_DUELDAMAGE:
               if(!this.playBack && (msg.victim == nid || msg.victim == StatsManager.charname))
               {
                  StatsManager.getPlayer().gotNetworkDamage(msg.hp,msg.launched);
                  if(msg.hp <= 0)
                  {
                     npc = NPCManager.getNetworkPlayer(msg.nid);
                     if(npc != null)
                     {
                        killer = EnemyPlayer(npc);
                        DuelModeUI.instance.setOpponentTaunt(killer.tauntStr);
                        QuestEngine.putInDuelistHolder(XMLNpc.INDEX_DUELIST,killer.equipmentStr,killer.level,killer.charname);
                        this.globalAnnouncement("","[PvP]   " + LangManager.getString(806,[this.uppercaseFirstLetter(killer.charname),this.uppercaseFirstLetter(StatsManager.charname)]));
                     }
                  }
               }
               else
               {
                  npc = NPCManager.getNetworkPlayer(msg.victim);
                  if(npc != null)
                  {
                     EnemyPlayer(npc).gotNetworkDamage(msg.hp,msg.launched);
                  }
               }
               break;
            case MSG_DUELSETSTANCE:
               npc = NPCManager.getNetworkPlayer(msg.nid);
               if(npc != null)
               {
                  EnemyPlayer(npc).setStance(msg.stance);
               }
               break;
            case MSG_DUELSTARTANIM:
               if(msg.anim == "fart")
               {
                  SoundManager.instance.playFart();
               }
               else
               {
                  npc = NPCManager.getNetworkPlayer(msg.nid);
                  if(npc != null)
                  {
                     EnemyPlayer(npc).startAnim(msg.anim);
                  }
               }
               break;
            case MSG_DUELSTARTACTION:
               npc = NPCManager.getNetworkPlayer(msg.nid);
               if(npc != null)
               {
                  enemyplayer = EnemyPlayer(npc);
                  enemyplayer.setPosition(msg.x,msg.y);
                  if(msg.facingRight)
                  {
                     enemyplayer.getMCS().faceRight();
                  }
                  else
                  {
                     enemyplayer.getMCS().faceLeft();
                  }
                  if(msg.actionState == MCSActor.SKILL_SHADOWCLONE_STATE || msg.actionState == MCSActor.SKILL_MASSCLONE_STATE)
                  {
                     enemyplayer.cloneIndex = int(msg.anim);
                     enemyplayer.startAction(msg.actionState);
                  }
                  else
                  {
                     if(msg.anim != "")
                     {
                        enemyplayer.startAnim(msg.anim);
                     }
                     enemyplayer.startAction(msg.actionState);
                  }
                  enemyplayer.cancelStealth();
               }
               break;
            case MSG_DUELCREATEPROJECTILE:
               ProjectileManager.createProjectile(msg.ptype,msg.x,msg.y,msg.velX,msg.velY,msg.damage,msg.skilllevel,NPCManager.getNetworkPlayer(msg.nid));
               break;
            case MSG_DUELCHAT:
               npc = NPCManager.getNetworkPlayer(msg.nid);
               if(npc != null)
               {
                  EnemyPlayer(npc).say(msg.text);
               }
               BattleUI.instance.updateChatLog(EnemyPlayer(npc).charname,msg.text);
               break;
            case MSG_DUELANNOUNCEMENT:
               BattleUI.instance.updateChatLog(msg.str1,msg.str2);
               break;
            case MSG_GIVEPVPKILLERLOOT:
               if(!this.playBack && msg.name == StatsManager.charname && GameEngine.isPvPRoomMode())
               {
                  OverworldHUD.instance.lootDialog.addRandomLootItem(msg.lvl);
                  if(msg.lvl <= 10 || int(Math.random() * 3) == 0)
                  {
                     OverworldHUD.instance.lootDialog.addLootCoins(Math.random() * msg.lvl);
                  }
                  if(StatsManager.getLevel() < 10)
                  {
                     OverworldHUD.instance.lootDialog.addLootXP(NPC.calcXP(StatsManager.getLevel(),msg.lvl,msg.lvl * 5 + 45,false) * 3);
                  }
                  else
                  {
                     OverworldHUD.instance.lootDialog.addLootXP(NPC.calcXP(StatsManager.getLevel(),msg.lvl,msg.lvl * 5 + 45,true));
                  }
               }
         }
      }
      
      override public function processGlobalGroupMsg(msg:Object) : void
      {
         var color:String = null;
         switch(msg.msgType)
         {
            case OUTPUT:
               outputToConsole(msg);
               break;
            case MSG_CHAT:
               if(msg.side == 0)
               {
                  color = "#FFFFFF";
               }
               else if(msg.side == -1)
               {
                  color = "#CCCCCC";
               }
               else if(msg.side == 1)
               {
                  color = "#FF0000";
               }
               else if(msg.side == 2)
               {
                  color = "#00FF00";
               }
               else if(msg.side == 3)
               {
                  color = "#00FFFF";
               }
               else if(msg.side == 4)
               {
                  color = "#FFCC00";
               }
               else if(StatsManager.isCustomClan(msg.side))
               {
                  color = "#FF9900";
               }
               if(GameEngine.isAdventureMode())
               {
                  if(msg.side == 0 || msg.side == StatsManager.getSide())
                  {
                     OverworldHUD.instance.updateChatLog(msg.charname,msg.text,color);
                  }
               }
               else if(GameEngine.isPvPRoomMode())
               {
                  if(msg.side == 0 || msg.side == StatsManager.getSide())
                  {
                     BattleUI.instance.updateChatLog(msg.charname,msg.text,color);
                  }
               }
               break;
            case MSG_CONNECTEDTOCHAT:
               if(GameEngine.isAdventureMode())
               {
                  OverworldHUD.instance.updateChatLogConnected(msg.charname);
               }
               break;
            case MSG_CHECKNOTIFICATIONS:
               if(msg.charname == StatsManager.charname)
               {
                  QueryManager.instance.checkNotifications();
               }
               break;
            case MSG_GOTTELEPORTED:
               if(msg.charname.toLowerCase() == StatsManager.charname.toLowerCase())
               {
                  if(GameEngine.isAdventureMode())
                  {
                     OverworldHUD.getInstance().screenTransition.setTeleportTarget(msg.nodeid,msg.roomid,400);
                     OverworldHUD.getInstance().screenTransition.startClose(ScreenTransition.ACTION_TELEPORT);
                  }
                  else
                  {
                     StageManager.setCurrentNode(msg.nodeid);
                  }
               }
               break;
            case MSG_GOTBUFF:
               if(msg.charname.toLowerCase() == StatsManager.charname.toLowerCase())
               {
                  StatsManager.setBuff(msg.buff,msg.duration);
               }
               break;
            case MSG_GOTKICKED:
               if(msg.charname.toLowerCase() == StatsManager.charname.toLowerCase())
               {
                  if(GameEngine.isAdventureMode())
                  {
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
               }
         }
      }
      
      override internal function onNeighbourConnected(peerID:String) : *
      {
         var obj:Object = null;
         var networkPlayerList:Vector.<NPC> = null;
         var str:String = null;
         var npc:EnemyPlayer = null;
         var max:int = 0;
         var plArray:Array = null;
         var i:* = undefined;
         if(firstConnect)
         {
            this.networkMode = MODE_ADVENTUREMODEP2P;
            obj = new Object();
            obj.id = StatsManager.id;
            obj.charname = StatsManager.charname;
            obj.charlvl = StatsManager.getLevel();
            obj.equip = StatsManager.getEquipmentString();
            obj.x = StatsManager.getPlayer().getMapPosition();
            if(GameEngine.isPvPRoomMode())
            {
               obj.stats = StatsManager.getPlayerStatsString();
               obj.skills = StatsManager.getSkillStatsString();
               obj.taunt = StatsManager.getTaunt();
            }
            else
            {
               obj.stats = "";
               obj.skills = "";
               obj.taunt = "";
            }
            sendToGroup(MSG_ENTERROOM,obj);
            firstConnect = false;
         }
         else
         {
            networkPlayerList = NPCManager.getNetworkPlayerList();
            str = "";
            max = int(networkPlayerList.length);
            plArray = new Array();
            if(GameEngine.isPvPRoomMode())
            {
               plArray.push(StatsManager.id + "$" + StatsManager.charname + "$" + StatsManager.getLevel() + "$" + StatsManager.getEquipmentString() + "$" + nid + "$" + StatsManager.getPlayer().getMapPosition() + "$" + StatsManager.getPlayerStatsString() + "$" + StatsManager.getSkillStatsString() + "$" + StatsManager.getTaunt());
            }
            else
            {
               plArray.push(StatsManager.id + "$" + StatsManager.charname + "$" + StatsManager.getLevel() + "$" + StatsManager.getEquipmentString() + "$" + nid + "$" + StatsManager.getPlayer().getMapPosition());
            }
            for(i = 0; i < max; i++)
            {
               npc = networkPlayerList[i] as EnemyPlayer;
               str = npc.id + "$" + npc.charname + "$" + npc.level + "$" + npc.equipmentStr + "$" + npc.nid + "$" + npc.getMapPosition() + "$" + npc.statStr + "$" + npc.skillStr + "$" + npc.tauntStr;
               plArray.push(str);
            }
            obj = new Object();
            obj.playerList = plArray;
            sendToGroupPeer(peerID,MSG_PLAYERLIST,obj);
         }
      }
      
      override internal function onNeighbourDisconnect(peerID:String) : *
      {
         var obj:Object = new Object();
         obj.peerID = peerID;
         sendToGroup(MSG_LEFTROOM,obj);
         NPCManager.removeNetworkPlayer(peerID);
      }
      
      public function connectToRoom(node:int, room:int, roomtype:int, xpos:int) : *
      {
         var grpName:String = null;
         if(!connected)
         {
            return;
         }
         this.closeChatBot();
         if(roomtype == XMLRoomData.ROOMTYPE_DEFAULT || roomtype == 2 || roomtype == XMLRoomData.ROOMTYPE_HELL || roomtype == XMLRoomData.ROOMTYPE_PVP || roomtype == XMLRoomData.ROOMTYPE_PVPCLAN)
         {
            grpName = "net.explosivebarrel.duels.room_" + node + "_" + room + "." + LangManager.getLanguage();
         }
         else
         {
            if(roomtype == 1)
            {
               NetworkManager.getInstance().leaveRoom();
               return;
            }
            if(roomtype == XMLRoomData.ROOMTYPE_DOJO || roomtype == XMLRoomData.ROOMTYPE_PVPDOJO)
            {
               grpName = "net.explosivebarrel.duels.room_" + "dojo" + "_" + room + "." + LangManager.getLanguage();
            }
            else if(roomtype == 4)
            {
               grpName = "net.explosivebarrel.duels.room_" + "red" + "_" + room + "." + LangManager.getLanguage();
            }
            else if(roomtype == 5)
            {
               grpName = "net.explosivebarrel.duels.room_" + "green" + "_" + room + "." + LangManager.getLanguage();
            }
            else if(roomtype == 6)
            {
               grpName = "net.explosivebarrel.duels.room_" + "blue" + "_" + room + "." + LangManager.getLanguage();
            }
            else if(roomtype == 7)
            {
               grpName = "net.explosivebarrel.duels.room_" + "yellow" + "_" + room + "." + LangManager.getLanguage();
            }
         }
         trace("connect to " + grpName);
         if(currentGroup != grpName)
         {
            if(currentGroup != "")
            {
               if(!StatsManager.usePlayerIO)
               {
                  disconnectGroup();
               }
               else
               {
                  disconnectGroupPIO();
               }
            }
            if(!StatsManager.usePlayerIO)
            {
               connectGroup(grpName);
            }
            else
            {
               connectGroupPIO(grpName,xpos);
            }
         }
         else
         {
            trace("connecting to same netGroup");
         }
      }
      
      public function leaveRoom() : *
      {
         if(!StatsManager.usePlayerIO)
         {
            if(connected)
            {
               disconnectGroup();
            }
         }
         else
         {
            disconnectGroupPIO();
         }
         this.closeChatBot();
      }
      
      public function chat(str:String, chatMode:int, sayWords:String = "") : *
      {
         var obj:Object = new Object();
         obj.charname = StatsManager.charname;
         obj.text = str;
         obj.say = sayWords;
         if(chatMode == 0)
         {
            obj.side = 0;
         }
         else if(chatMode == 1)
         {
            obj.side = -1;
         }
         else if(chatMode == 2)
         {
            obj.side = StatsManager.getSide();
         }
         if(!StatsManager.usePlayerIO)
         {
            sendToGroup(MSG_CHAT,obj);
         }
         else if(connectionPIO != null && connectionPIO.connected)
         {
            connectionPIO.send("public",MSG_CHAT,obj.charname,obj.text,obj.side,obj.say);
         }
         if(sayWords == "")
         {
            StatsManager.getPlayer().say(str);
         }
         else
         {
            StatsManager.getPlayer().say(sayWords);
         }
      }
      
      public function globalChat(str:String, chatMode:int, sayWords:String = "") : *
      {
         var obj:Object = new Object();
         obj.charname = StatsManager.charname;
         obj.text = str;
         obj.say = sayWords;
         if(chatMode == 0)
         {
            obj.side = 0;
         }
         else if(chatMode == 1)
         {
            obj.side = -1;
         }
         else if(chatMode == 2)
         {
            obj.side = StatsManager.getSide();
         }
         if(chatMode != 1)
         {
            if(!StatsManager.usePlayerIO)
            {
               sendToGlobalGroup(MSG_CHAT,obj);
            }
            else if(connectionChatPIO != null && connectionChatPIO.connected)
            {
               connectionChatPIO.send("public",MSG_CHAT,obj.charname,obj.text,obj.side,obj.say);
            }
            else if(connectionPIO != null && connectionPIO.connected)
            {
               connectionPIO.send("public",MSG_CHAT,obj.charname,obj.text,obj.side,obj.say);
            }
         }
         this.chat(str,chatMode,sayWords);
      }
      
      public function globalAnnouncement(str1:String, str2:String, color:String = "") : *
      {
         var obj:Object = null;
         if(StatsManager.hasBuff(StatsManager.BUFF_MODERATOR))
         {
            return;
         }
         if(!StatsManager.usePlayerIO)
         {
            obj = new Object();
            obj.charname = str1;
            obj.text = str2;
            obj.side = 0;
            obj.color = color;
            sendToGlobalGroup(MSG_CHAT,obj);
         }
         else if(connectionChatPIO != null && connectionChatPIO.connected)
         {
            connectionChatPIO.send("public",MSG_CHAT,str1,str2,0,"");
         }
         OverworldHUD.instance.updateChatLog(str1,str2,color);
         QueryManager.instance.logMessage(str2);
      }
      
      public function itemAnnouncement(item:Item) : *
      {
         var obj:Object = null;
         if(StatsManager.hasBuff(StatsManager.BUFF_MODERATOR))
         {
            return;
         }
         var str:String = LangManager.getString(805,[StatsManager.getChatDisplayCharname(),"<b><u><a href=\'event:[ITM]" + item.toStringNoQty() + "\'>" + item.getNameBlackBGBrackets() + "</a></u></b>"]);
         if(!StatsManager.usePlayerIO)
         {
            obj = new Object();
            obj.charname = "";
            obj.text = str;
            obj.side = 0;
            sendToGlobalGroup(MSG_CHAT,obj);
         }
         else if(connectionChatPIO != null && connectionChatPIO.connected)
         {
            connectionChatPIO.send("public",MSG_CHAT,"",str,0,"");
         }
         OverworldHUD.instance.updateChatLog("",str);
         QueryManager.instance.logMessage(str);
      }
      
      public function globalCheckNotification(receiver:String) : *
      {
         var conn:ConnectionPIO = null;
         var obj:Object = new Object();
         obj.charname = receiver;
         if(!StatsManager.usePlayerIO)
         {
            sendToGlobalGroup(MSG_CHECKNOTIFICATIONS,obj);
         }
         else
         {
            conn = NetworkManager.getInstance().connectPIO(receiver,ConnectionPIO.PURPOSE_CHECKNOTIFICATIONS);
            conn.terminateConnection();
         }
      }
      
      public function teleportPlayer(playername:String, nodeid:int, roomid:int) : *
      {
         var conn:ConnectionPIO = null;
         conn = NetworkManager.getInstance().connectPIO(playername,ConnectionPIO.PURPOSE_TELEPORT,nodeid + "," + roomid);
      }
      
      public function kickPlayer(playername:String) : *
      {
         var conn:ConnectionPIO = null;
         conn = NetworkManager.getInstance().connectPIO(playername,ConnectionPIO.PURPOSE_KICK);
         conn.terminateConnection();
      }
      
      public function banPlayer(playername:String, pass:String) : *
      {
         if(connectionGlobalPIO != null && connectionGlobalPIO.connected)
         {
            connectionGlobalPIO.send("banplayer",playername,pass);
         }
         this.kickPlayer(playername);
      }
      
      public function buffPlayer(playername:String, buff:int, duration:int) : *
      {
         var conn:ConnectionPIO = null;
         conn = NetworkManager.getInstance().connectPIO(playername,ConnectionPIO.PURPOSE_BUFF,buff + "," + duration);
      }
      
      public function playerUpdateEq(equip:String) : *
      {
         var obj:Object = new Object();
         obj.equip = equip;
         if(!StatsManager.usePlayerIO)
         {
            sendToGroup(MSG_PLAYERUPDATEEQ,obj);
         }
         else if(connectionPIO != null && connectionPIO.connected)
         {
            connectionPIO.send("public",MSG_PLAYERUPDATEEQ,StatsManager.charname,obj.equip);
         }
      }
      
      public function playerUpdateLvl(charlvl:int) : *
      {
         var obj:Object = new Object();
         obj.charlvl = charlvl;
         if(!StatsManager.usePlayerIO)
         {
            sendToGroup(MSG_PLAYERUPDATELVL,obj);
         }
         else
         {
            if(connectionChatPIO != null && connectionPIO.connected)
            {
               connectionPIO.send("public",MSG_PLAYERUPDATELVL,StatsManager.charname,obj.charlvl);
            }
            if(connectionChatPIO != null && connectionChatPIO.connected)
            {
               connectionChatPIO.send("updatelevel",charlvl);
            }
         }
      }
      
      public function playerUpdateBusy(flag:Boolean) : *
      {
         if(firstConnect && !StatsManager.usePlayerIO)
         {
            return;
         }
         if(StatsManager.hasBuff(StatsManager.BUFF_MODERATOR))
         {
            return;
         }
         var obj:Object = new Object();
         obj.busy = flag;
         if(!StatsManager.usePlayerIO)
         {
            sendToGroup(MSG_PLAYERUPDATEBUSY,obj);
         }
         else if(connectionPIO != null && connectionPIO.connected)
         {
            connectionPIO.send("public",MSG_PLAYERUPDATEBUSY,StatsManager.charname,obj.busy);
         }
         StatsManager.getPlayer().stopMoving(false);
      }
      
      public function playerEmote(animName:String) : *
      {
         var obj:Object = new Object();
         obj.anim = animName;
         if(!StatsManager.usePlayerIO)
         {
            sendToGroup(MSG_PLAYEREMOTE,obj);
         }
         else if(connectionPIO != null && connectionPIO.connected)
         {
            connectionPIO.send("public",MSG_PLAYEREMOTE,StatsManager.charname,obj.anim);
         }
      }
      
      public function playerTeach(step:int, targetName:String) : *
      {
         var obj:Object = new Object();
         obj.step = step;
         obj.target = targetName;
         if(!StatsManager.usePlayerIO)
         {
            sendToGroup(MSG_PLAYERTEACH,obj);
         }
         else if(connectionPIO != null && connectionPIO.connected)
         {
            connectionPIO.send("public",MSG_PLAYERTEACH,StatsManager.charname,obj.step,obj.target);
         }
      }
      
      public function pingMultiClient(nid:String) : *
      {
         var obj:Object = new Object();
         obj.charname = StatsManager.charname;
         if(!StatsManager.usePlayerIO)
         {
            sendToGroupPeer(nid,MSG_PINGMULTICLIENT,obj);
         }
         else if(connectionPIO != null && connectionPIO.connected)
         {
            connectionPIO.send("private",MSG_PINGMULTICLIENT,nid,obj.charname);
         }
      }
      
      public function createRoomObject(objid:int, x:int, y:int, props:String, objname:String) : *
      {
         var obj:Object = new Object();
         obj.objid = objid;
         obj.x = x;
         obj.y = y;
         obj.props = props;
         obj.objname = objname;
         if(!StatsManager.usePlayerIO)
         {
            sendToGroup(MSG_CREATEROOMOBJECT,obj);
         }
         else if(connectionPIO != null && connectionPIO.connected)
         {
            connectionPIO.send("public",MSG_CREATEROOMOBJECT,obj.objid,obj.x,obj.y,obj.props,obj.objname);
         }
         StageManager.getGameStage().createRoomObject(objid,x,y,props,objname);
      }
      
      public function removeRoomObject(objname:String) : *
      {
         var obj:Object = new Object();
         obj.objname = objname;
         if(!StatsManager.usePlayerIO)
         {
            sendToGroup(MSG_REMOVEROOMOBJECT,obj);
         }
         else if(connectionPIO != null && connectionPIO.connected)
         {
            connectionPIO.send("public",MSG_REMOVEROOMOBJECT,obj.objname);
         }
         StageManager.getGameStage().removeInteractiveRoomObject(objname);
      }
      
      public function createRoomProjectile(ptype:int, x:int, y:int, velX:int, velY:int, damage:int, skilllevel:int) : *
      {
         var obj:Object = new Object();
         obj.ptype = ptype;
         obj.x = x;
         obj.y = y;
         obj.velX = velX;
         obj.velY = velY;
         obj.damage = damage;
         obj.skilllevel = skilllevel;
         if(!StatsManager.usePlayerIO)
         {
            sendToGroup(MSG_ROOMCREATEPROJECTILE,obj);
         }
         else if(connectionPIO != null && connectionPIO.connected)
         {
            connectionPIO.send("public",MSG_ROOMCREATEPROJECTILE,StatsManager.charname,obj.ptype,obj.x,obj.y,obj.velX,obj.velY,obj.damage,obj.skilllevel);
         }
      }
      
      public function setObjectState(objname:String, flag:Boolean, flag2:Boolean) : *
      {
         var obj:Object = new Object();
         obj.name = objname;
         obj.flag = flag;
         obj.flag2 = flag2;
         if(!StatsManager.usePlayerIO)
         {
            sendToGroup(MSG_SETOBJECTSTATE,obj);
         }
         else if(connectionPIO != null && connectionPIO.connected)
         {
            connectionPIO.send("public",MSG_SETOBJECTSTATE,obj.name,obj.flag,obj.flag2);
         }
      }
      
      public function saveUpdate(saveIndex:int, savedata:String) : *
      {
         if(connectionGlobalPIO != null && connectionGlobalPIO.connected)
         {
            connectionGlobalPIO.send("save",saveIndex,savedata);
         }
      }
      
      public function reportDuelEnd(loser:String) : *
      {
         if(connectionGlobalPIO != null && connectionGlobalPIO.connected)
         {
            connectionGlobalPIO.send("duelend",loser);
         }
      }
      
      public function setWarHex(mapid:int, xpos:int, ypos:int, side:int, val:int) : *
      {
         if(connectionGlobalPIO != null && connectionGlobalPIO.connected)
         {
            connectionGlobalPIO.send("setwarhex",mapid,xpos,ypos,side,val);
         }
      }
      
      public function addWarSentry(mapid:int, xpos:int, ypos:int) : *
      {
         if(connectionGlobalPIO != null && connectionGlobalPIO.connected)
         {
            connectionGlobalPIO.send("addwarsentry",mapid,xpos,ypos);
         }
      }
      
      public function delWarSentry(mapid:int, killedList:String) : *
      {
         if(connectionGlobalPIO != null && connectionGlobalPIO.connected)
         {
            connectionGlobalPIO.send("delwarsentry",mapid,killedList);
         }
      }
      
      public function startBuild(mapid:int, xpos:int, ypos:int, hextype:int) : *
      {
         if(connectionGlobalPIO != null && connectionGlobalPIO.connected)
         {
            connectionGlobalPIO.send("startbuild",mapid,xpos,ypos,hextype);
         }
      }
      
      public function doBuild(mapid:int, xpos:int, ypos:int, cost:int) : *
      {
         if(connectionGlobalPIO != null && connectionGlobalPIO.connected)
         {
            connectionGlobalPIO.send("dobuild",mapid,xpos,ypos,cost);
         }
      }
      
      public function createSpawnPoint(mapid:int, side:int, territoryx:int, territoryy:int, controlPointStr:String, hasTown:Boolean) : *
      {
         if(connectionGlobalPIO != null && connectionGlobalPIO.connected)
         {
            connectionGlobalPIO.send("addspawn",mapid,side,territoryx,territoryy,controlPointStr,hasTown);
         }
      }
      
      public function destroySpawnPoint(mapid:int, territoryx:int, territoryy:int) : *
      {
         if(connectionGlobalPIO != null && connectionGlobalPIO.connected)
         {
            connectionGlobalPIO.send("delspawn",mapid,territoryx,territoryy);
         }
      }
      
      public function updateGlobalVar(varid:int, value:int) : *
      {
         if(connectionGlobalPIO != null && connectionGlobalPIO.connected)
         {
            connectionGlobalPIO.send("updateglobalvar",varid,value);
         }
      }
      
      public function giveItem(receiver:String, items:String, coins:int) : *
      {
         if(items == "" && coins == 0)
         {
            return;
         }
         if(connectionGlobalPIO != null && connectionGlobalPIO.connected)
         {
            connectionGlobalPIO.send("giveitem",receiver,items,coins);
         }
      }
      
      public function changeName(newName:String) : *
      {
         if(connectionGlobalPIO != null && connectionGlobalPIO.connected)
         {
            connectionGlobalPIO.send("changename",newName);
         }
      }
      
      public function createClan(clanName:String, clanColor:int, clanLogo:int, logoColor:int, acronym:String, clanId:int) : *
      {
         if(connectionGlobalPIO != null && connectionGlobalPIO.connected)
         {
            connectionGlobalPIO.send("createclan",clanName,clanColor,clanLogo,logoColor,acronym,clanId);
         }
      }
      
      public function storeItem(item:Item) : *
      {
         var itemXML:XMLItem = QuestEngine.getItemData(item.itemID);
         if(itemXML == null || itemXML.unique != 0)
         {
            return;
         }
         var newitem:Item = Item.parseNoQty(item.toStringNoQty());
         newitem.setCreator(StatsManager.getChatDisplayCharname());
         if(connectionGlobalPIO != null && connectionGlobalPIO.connected)
         {
            connectionGlobalPIO.send("storeitem",newitem.getLevel(),newitem.toStringNoQty());
         }
      }
      
      public function redeemCode(code:String) : *
      {
         if(connectionGlobalPIO != null && connectionGlobalPIO.connected)
         {
            connectionGlobalPIO.send("redeem",code);
         }
      }
      
      public function createRedeemCode(item:int, redeemtimes:int, password:String) : *
      {
         if(connectionGlobalPIO != null && connectionGlobalPIO.connected)
         {
            connectionGlobalPIO.send("createredeem",item,redeemtimes,password);
         }
      }
      
      public function reportGoldPurchase() : *
      {
         if(connectionGlobalPIO != null && connectionGlobalPIO.connected)
         {
            connectionGlobalPIO.send("goldpurchase");
         }
      }
      
      public function reportHack(details:String) : *
      {
         if(connectionGlobalPIO != null && connectionGlobalPIO.connected)
         {
            connectionGlobalPIO.send("hack");
         }
         QueryManager.instance.logMessage("[hack reported] " + details);
      }
      
      public function triggerWarCron(pass:String) : *
      {
         if(connectionGlobalPIO != null && connectionGlobalPIO.connected)
         {
            connectionGlobalPIO.send("warcron",pass);
         }
      }
      
      public function triggerWorldSim(pass:String) : *
      {
         if(connectionGlobalPIO != null && connectionGlobalPIO.connected)
         {
            connectionGlobalPIO.send("worldsim",pass);
         }
      }
      
      public function updateTownProsperity(territoryid:int, side:int, num:int) : *
      {
         var terry:int = territoryid & 0x0FFF;
         var terrx:int = territoryid >> 12 & 0x0FFF;
         if(!QuestEngine.hasTerritory(terrx,terry))
         {
            trace("updateTownProsperity error: is non-territory");
         }
         if(connectionGlobalPIO != null && connectionGlobalPIO.connected)
         {
            connectionGlobalPIO.send("townpros",territoryid,side,num);
         }
      }
      
      public function sendRefundTry(num:uint) : *
      {
         if(connectionGlobalPIO != null && connectionGlobalPIO.connected)
         {
            connectionGlobalPIO.send("ref",num * 13,OverworldHUD.instance.interactUI.chikako.getLevel());
         }
      }
      
      public function reportWhipFlash(num:int) : *
      {
         if(connectionGlobalPIO != null && connectionGlobalPIO.connected)
         {
            connectionGlobalPIO.send("wf",num * 17);
         }
      }
      
      public function sendChatBot(str:String) : *
      {
         if(connectionChatPIO != null && connectionChatPIO.connected)
         {
            connectionChatPIO.send("chatbot",str);
            this.hasChatBot = true;
         }
      }
      
      public function closeChatBot() : *
      {
         if(this.hasChatBot && connectionChatPIO != null && connectionChatPIO.connected)
         {
            connectionChatPIO.send("chatbotclose");
            this.hasChatBot = false;
         }
      }
      
      public function sendWhoIsOnline() : *
      {
         if(connectionChatPIO != null && connectionChatPIO.connected)
         {
            connectionChatPIO.send("whoisonline");
         }
      }
      
      public function sendChatKick(target:String) : *
      {
         if(connectionChatPIO != null && connectionChatPIO.connected)
         {
            connectionChatPIO.send("kick",target);
         }
      }
      
      public function sendChatBan(target:String) : *
      {
         if(connectionChatPIO != null && connectionChatPIO.connected)
         {
            connectionChatPIO.send("ban",target);
         }
      }
      
      public function sendChatUnBan(target:String) : *
      {
         if(connectionChatPIO != null && connectionChatPIO.connected)
         {
            connectionChatPIO.send("unban",target);
         }
      }
      
      public function connectPIO(target:String, purpose:int = 0, params:String = "") : ConnectionPIO
      {
         var connectionPIO:ConnectionPIO = ConnectionPIO.createConnection(target,purpose,params);
         connectionPIO.initConnection(this.serviceRoomId);
         return connectionPIO;
      }
      
      public function isInSvcRoomMembers(charname:String) : *
      {
         return this.svcRoomMembers.indexOf(charname) != -1;
      }
      
      override internal function handleGlobalMessages(m:Message) : *
      {
         var obj:Object;
         var msgType:int;
         var msgbox:CorruptedMessage = null;
         var index:int = 0;
         var rmindex:int = 0;
         var dupRoomId:String = null;
         var str:String = null;
         var j:int = 0;
         var connectionPIO:ConnectionPIO = null;
         var territoryData:TerritoryData = null;
         var itemArray:Array = null;
         var item:Item = null;
         var i:* = undefined;
         var mcharname:* = undefined;
         var mtext:String = null;
         var mside:* = undefined;
         var color:String = null;
         if(m.type == "time")
         {
            QueryManager.instance.saveLastUpdate(m.getInt(0).toString());
            this.serviceRoomId = m.getString(1);
            QueryManagerPIO.instance.checkLoadComplete();
         }
         else if(m.type == "banned")
         {
            trace("banned");
            if(OverworldHUD.instance != null)
            {
               OverworldHUD.instance.showCorrupted();
            }
            else
            {
               msgbox = new CorruptedMessage();
               msgbox.prompt.text = "Error: Data corrupted";
               GameEngine.stageMC.addChild(msgbox);
               disconnectGlobalPIO();
            }
            StatsManager.hackReported = true;
         }
         else if(m.type == "notmodified")
         {
            index = m.getInt(0);
            if(index < 100)
            {
               QueryManager.instance.reportDataModified(index);
            }
            else if(index == 100)
            {
               ++QueryManager.instance.lastAPUpdate;
            }
            else if(index == 101)
            {
               ++QueryManager.instance.lastDTUpdate;
            }
            else if(index == 102)
            {
               ++QueryManager.instance.lastWarTurn;
            }
            else if(index == 103)
            {
               QueryManager.instance.reportDataModified(1);
            }
         }
         else if(m.type == "UserJoined")
         {
            this.svcRoomMembers.push(m.getString(0));
         }
         else if(m.type == "UserLeft")
         {
            rmindex = this.svcRoomMembers.indexOf(m.getString(0));
            if(rmindex != -1)
            {
               this.svcRoomMembers.splice(rmindex,1);
            }
         }
         else if(m.type == "ping")
         {
            connectionGlobalPIO.send("pong");
         }
         else if(m.type == "DuplicatePlayer")
         {
            disconnectGlobalPIO();
            disconnectGroupPIO();
            GameEngine.stageMC.addChild(new OverworldHUD());
            OverworldHUD.instance.showDuplicate();
         }
         else if(m.type == "FoundDuplicatePlayer")
         {
            dupRoomId = m.getString(0);
            ConnectionPIO.createConnection(StatsManager.charname,ConnectionPIO.PURPOSE_KICKDUPLICATEPLAYER).initConnection(dupRoomId);
         }
         else if(m.type == "whoisresp")
         {
            str = m.getString(0) + " is ";
            for(j = 1; j < m.length; j++)
            {
               str += m.getString(j);
               if(j != m.length - 1)
               {
                  str += ",";
               }
            }
            OverworldHUD.instance.updateChatLogWordsOnly(str);
         }
         else if(m.type == "whereisresp")
         {
            OverworldHUD.instance.chatText.words.text = m.getInt(0).toString();
         }
         else if(m.type == "ReqConn")
         {
            connectionPIO = ConnectionPIO.createConnection(m.getString(0),m.getInt(1),m.getString(2));
            connectionPIO.acceptConnection();
         }
         else if(m.type == "addspawnresponse")
         {
            OverworldHUD.instance.warUI.warHexUI.createSpawnPointCallBack(m.getInt(0));
         }
         else if(m.type == "delspawnresponse")
         {
            OverworldHUD.instance.warUI.warHexUI.delSpawnPointCallBack(m.getInt(0));
         }
         else if(m.type == "setwarhexresponse")
         {
            OverworldHUD.instance.warUI.warHexUI.setWarHexCallBack(m.getInt(0));
         }
         else if(m.type == "addwarsentryresponse")
         {
            OverworldHUD.instance.warUI.warHexUI.addWarSentryCallBack(m.getInt(0));
         }
         else if(m.type == "dobuildresponse")
         {
            OverworldHUD.instance.warUI.warHexUI.setWarHexCallBack(m.getInt(0));
         }
         else if(m.type == "townconverted")
         {
            territoryData = NodeGenerator.instance.findTerritoryData(m.getInt(0));
            if(territoryData != null)
            {
               territoryData.townSide = StatsManager.getSide();
            }
            OverworldHUD.instance.warUI.updateHexOwner(m.getInt(0),StatsManager.getSide());
            if(StatsManager.isCustomClan(StatsManager.getSide()))
            {
               ++StatsManager.customClanOwned;
            }
         }
         else if(m.type == "giveitemresponse")
         {
            if(m.getInt(0) == 0)
            {
               this.globalCheckNotification(m.getString(1));
            }
            else
            {
               OverworldHUD.instance.showDialog(LangManager.getString(679),LangManager.getString(5));
               if(m.getString(1) != "")
               {
                  itemArray = m.getString(1).split("|");
                  for(i = 0; i < itemArray.length; i++)
                  {
                     item = Item.parseNoQty(itemArray[i]);
                     StatsManager.addItemToInventory(item);
                  }
               }
               StatsManager.changeGold(m.getInt(2));
               QueryManager.instance.reportDataModified(StatsManager.ITEM);
               QueryManager.instance.reportDataModified(StatsManager.PLAYERSTAT);
               QueryManager.instance.saveModifiedCharData();
            }
         }
         else if(m.type == "refunded")
         {
            trace("chikako refund");
            QueryManagerPIO.instance.client.payVault.refresh(function():*
            {
               if(GameEngine.isAdventureMode())
               {
                  OverworldHUD.instance.updateHUD();
               }
               OverworldHUD.instance.showChikakoRefund();
               globalAnnouncement("",LangManager.getString(869,[StatsManager.getChatDisplayCharname()]));
            });
         }
         else if(m.type == "whipflashed")
         {
            OverworldHUD.instance.payUI.whipflashOK();
         }
         else if(m.type == "createclanresp")
         {
            if(OverworldHUD.instance.createClanDialog == null)
            {
               return;
            }
            if(m.getInt(0) == 0)
            {
               OverworldHUD.instance.createClanDialog.createClanSuccessful(m.getInt(1));
            }
            else
            {
               OverworldHUD.instance.createClanDialog.createClanError(m.getInt(0));
            }
         }
         else if(m.type == "changenameresp")
         {
            if(m.getInt(0) == 0)
            {
               OverworldHUD.instance.changeNameDialog.changeSuccessful();
            }
            else
            {
               OverworldHUD.instance.changeNameDialog.changeError(m.getInt(0));
            }
         }
         else if(m.type == "redeemed")
         {
            if(m.getInt(0) == 0)
            {
               QueryManager.instance.logMessage("[redeemed] " + OverworldHUD.instance.changeNameDialog.nametext2.text + ": " + m.getInt(1));
               OverworldHUD.instance.changeNameDialog.setRedeemedItem(m.getInt(1));
               OverworldHUD.instance.changeNameDialog.redeemSuccessful();
            }
            else
            {
               OverworldHUD.instance.changeNameDialog.changeError(m.getInt(0));
            }
         }
         else if(m.type == "redeemcreated")
         {
            OverworldHUD.instance.chatText.words.text = m.getString(0);
         }
         else if(m.type == "createchar")
         {
            NetworkManager.instance.disconnectGlobalPIO();
            QueryManagerPIO.instance.createCharacterResponse(m.getInt(0));
         }
         if(m.type != "public" && m.type != "private")
         {
            return;
         }
         obj = new Object();
         msgType = m.getInt(0);
         obj.msgType = msgType;
         switch(msgType)
         {
            case MSG_CHAT:
               mcharname = m.getString(1);
               if(mcharname == StatsManager.charname)
               {
                  return;
               }
               mtext = m.getString(2);
               mside = m.getInt(3);
               if(mside == 0)
               {
                  color = "#FFFFFF";
               }
               else if(mside == -1)
               {
                  color = "#CCCCCC";
               }
               else if(mside == 1)
               {
                  color = "#FF0000";
               }
               else if(mside == 2)
               {
                  color = "#00FF00";
               }
               else if(mside == 3)
               {
                  color = "#00FFFF";
               }
               else if(mside == 4)
               {
                  color = "#FFCC00";
               }
               else if(StatsManager.isCustomClan(mside))
               {
                  color = "#FF9900";
               }
               if(GameEngine.isAdventureMode())
               {
                  if(mside == 0 || mside == StatsManager.getSide())
                  {
                     OverworldHUD.instance.updateChatLog(mcharname,mtext,color);
                  }
               }
               else if(GameEngine.isPvPRoomMode())
               {
                  if(mside == 0 || mside == StatsManager.getSide())
                  {
                     BattleUI.instance.updateChatLog(mcharname,mtext,color);
                  }
               }
               break;
            case MSG_CONNECTEDTOCHAT:
               if(GameEngine.isAdventureMode())
               {
                  OverworldHUD.instance.updateChatLogConnected(m.getString(1));
               }
               break;
            case MSG_CHECKNOTIFICATIONS:
               if(m.getString(1) == StatsManager.charname)
               {
                  QueryManager.instance.checkNotifications();
               }
               break;
            case MSG_GOTTELEPORTED:
               if(m.getString(1).toLowerCase() == StatsManager.charname.toLowerCase())
               {
                  if(GameEngine.isAdventureMode())
                  {
                     OverworldHUD.getInstance().screenTransition.setTeleportTarget(m.getInt(2),m.getInt(3),400);
                     OverworldHUD.getInstance().screenTransition.startClose(ScreenTransition.ACTION_TELEPORT);
                  }
                  else
                  {
                     StageManager.setCurrentNode(m.getInt(2));
                  }
               }
               break;
            case MSG_GOTBUFF:
               if(m.getString(1).toLowerCase() == StatsManager.charname.toLowerCase())
               {
                  StatsManager.setBuff(m.getInt(2),m.getInt(3));
               }
               break;
            case MSG_GOTKICKED:
               if(m.getString(1).toLowerCase() == StatsManager.charname.toLowerCase())
               {
                  if(GameEngine.isAdventureMode())
                  {
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
               }
         }
      }
      
      override internal function handleJoinGroupPIO(connection:Connection) : *
      {
         connectionPIO = connection;
         trace("connected to groupPIO");
         connectionPIO.addDisconnectHandler(handleGroupDisconnect);
         connectionPIO.addMessageHandler("*",this.handleGroupMessages);
         this.networkMode = MODE_ADVENTUREMODEP2P;
      }
      
      override internal function handleGroupMessages(m:Message) : *
      {
         var id:String = null;
         var charname:String = null;
         var charlvl:int = 0;
         var equip:String = null;
         var nid:String = null;
         var xpos:int = 0;
         var side:int = 0;
         var facingRight:Boolean = false;
         var pose:String = null;
         var stats:String = null;
         var skills:String = null;
         var taunt:String = null;
         var obj:Object = null;
         var msgType:int = 0;
         var npc:EnemyPlayer = null;
         var mcharname:String = null;
         var mtext:String = null;
         var mside:int = 0;
         var manim:* = undefined;
         var mnid:String = null;
         var stepStat:int = 0;
         var stepPose:String = null;
         var stepName:String = null;
         var tobj:TriggeredStageObject = null;
         var victim:String = null;
         var hp:int = 0;
         var launched:String = null;
         var actionState:int = 0;
         var ypos:int = 0;
         var anim:String = null;
         var duelanim:String = null;
         var color:String = null;
         var enemyPlayer:EnemyPlayer = null;
         var killer:EnemyPlayer = null;
         var dist:int = 0;
         var lootlvl:int = 0;
         var max:int = 0;
         var playerStr:Array = null;
         var i:int = 0;
         if(currentGroup == "")
         {
            return;
         }
         if(m.type == "public" || m.type == "private")
         {
            obj = new Object();
            msgType = m.getInt(0);
            obj.msgType = msgType;
            switch(msgType)
            {
               case MSG_CHAT:
                  mcharname = m.getString(1);
                  mtext = m.getString(2);
                  mside = m.getInt(3);
                  if(mside == 0 || mside == -1 || mside == StatsManager.getSide())
                  {
                     if(m.length == 5 && m.getString(4) != "")
                     {
                        NPCManager.networkPlayerChat(mcharname,m.getString(4));
                     }
                     else
                     {
                        NPCManager.networkPlayerChat(mcharname,mtext);
                     }
                     if(GameEngine.isAdventureMode())
                     {
                        if(mside == 0)
                        {
                           color = "#FFFFFF";
                        }
                        else if(mside == -1)
                        {
                           color = "#CCCCCC";
                        }
                        else if(mside == 1)
                        {
                           color = "#FF0000";
                        }
                        else if(mside == 2)
                        {
                           color = "#00FF00";
                        }
                        else if(mside == 3)
                        {
                           color = "#00FFFF";
                        }
                        else if(mside == 4)
                        {
                           color = "#FFCC00";
                        }
                        else if(StatsManager.isCustomClan(mside))
                        {
                           color = "#FF9900";
                        }
                        OverworldHUD.instance.updateChatLog(mcharname,mtext,color);
                     }
                  }
                  break;
               case MSG_PLAYERUPDATEEQ:
                  NPCManager.networkPlayerUpdateEq(m.getString(1),m.getString(2));
                  break;
               case MSG_PLAYERUPDATELVL:
                  NPCManager.networkPlayerUpdateLvl(m.getString(1),m.getInt(2));
                  break;
               case MSG_PLAYERUPDATEBUSY:
                  NPCManager.networkPlayerUpdateBusy(m.getString(1),m.getBoolean(2));
                  break;
               case MSG_PLAYEREMOTE:
                  manim = m.getString(2);
                  if(manim == "fart")
                  {
                     SoundManager.instance.playFart();
                  }
                  else
                  {
                     NPCManager.networkPlayerEmote(m.getString(1),manim);
                  }
                  break;
               case MSG_PLAYERTEACH:
                  mnid = m.getString(1);
                  stepStat = -1;
                  stepPose = "";
                  stepName = "";
                  switch(m.getInt(2))
                  {
                     case 1:
                        stepStat = 40008;
                        stepPose = MCSActor.POSE1;
                        stepName = LangManager.getString(6116);
                        break;
                     case 2:
                        stepStat = 40010;
                        stepPose = MCSActor.POSE1;
                        stepName = LangManager.getString(6124);
                        break;
                     case 3:
                        stepStat = 40004;
                        stepPose = MCSActor.POSE5;
                        stepName = LangManager.getString(6118);
                        break;
                     case 4:
                        stepStat = 40014;
                        stepPose = MCSActor.POSE5;
                        stepName = LangManager.getString(6126);
                        break;
                     case 5:
                        stepStat = 40003;
                        stepPose = MCSActor.POSE8;
                        stepName = LangManager.getString(6120);
                        break;
                     case 6:
                        stepStat = 40017;
                        stepPose = MCSActor.POSE8;
                        stepName = LangManager.getString(6128);
                        break;
                     case 7:
                        stepStat = 40006;
                        stepPose = MCSActor.POSE2;
                        stepName = LangManager.getString(6122);
                        break;
                     case 8:
                        stepStat = 40011;
                        stepPose = MCSActor.POSE2;
                        stepName = LangManager.getString(6130);
                  }
                  if(m.getString(3) == StatsManager.charname && stepStat != -1 && GameEngine.isAdventureMode())
                  {
                     enemyPlayer = NPCManager.getNetworkPlayer(mnid) as EnemyPlayer;
                     if(StatsManager.getStat(stepStat) == 0)
                     {
                        StatsManager.setStat(stepStat,1);
                        if(enemyPlayer != null)
                        {
                           OverworldHUD.instance.showDialog(LangManager.getString(756,[enemyPlayer.charname,stepName]),LangManager.getString(5));
                        }
                     }
                     else if(enemyPlayer != null)
                     {
                        OverworldHUD.instance.showDialog(LangManager.getString(757,[enemyPlayer.charname,stepName]),LangManager.getString(5));
                     }
                     QueryManager.instance.saveModifiedCharData();
                  }
                  if(stepPose != "")
                  {
                     NPCManager.networkPlayerEmote(mnid,stepPose);
                  }
                  break;
               case MSG_PINGMULTICLIENT:
                  if(m.getString(2) == StatsManager.charname)
                  {
                     this.leaveRoom();
                     GameEngine.battleModeToTitle();
                     disconnectGlobalPIO();
                  }
                  break;
               case MSG_CREATEROOMOBJECT:
                  StageManager.getGameStage().createRoomObject(m.getInt(1),m.getInt(2),m.getInt(3),m.getString(4),m.getString(5));
                  break;
               case MSG_REMOVEROOMOBJECT:
                  StageManager.getGameStage().removeInteractiveRoomObject(m.getString(1));
                  break;
               case MSG_SETOBJECTSTATE:
                  tobj = StageManager.getGameStage().getRoomInteractiveObject(m.getString(1)) as TriggeredStageObject;
                  if(tobj != null)
                  {
                     tobj.triggerObject(m.getBoolean(2),m.getBoolean(3));
                  }
                  break;
               case MSG_DUELMOVE:
                  InputManager.gotNetworkInput(m.getString(2),m.getString(1),m.getInt(3));
                  break;
               case MSG_DUELDAMAGE:
                  victim = m.getString(2);
                  hp = m.getInt(3);
                  launched = m.getString(4);
                  if(!NetworkManager.instance.playBack && (victim == NetworkManager.instance.nid || victim == StatsManager.charname))
                  {
                     StatsManager.getPlayer().gotNetworkDamage(hp,launched);
                     if(hp <= 0)
                     {
                        killer = NPCManager.getNetworkEnemyPlayer(m.getString(1));
                        if(killer != null)
                        {
                           DuelModeUI.instance.setOpponentTaunt(killer.tauntStr);
                           QuestEngine.putInDuelistHolder(XMLNpc.INDEX_DUELIST,killer.equipmentStr,killer.level,killer.charname);
                           this.globalAnnouncement("","[PvP]   " + LangManager.getString(806,[this.uppercaseFirstLetter(killer.charname),this.uppercaseFirstLetter(StatsManager.charname)]));
                        }
                     }
                  }
                  else
                  {
                     npc = NPCManager.getNetworkEnemyPlayer(victim);
                     if(npc != null)
                     {
                        npc.gotNetworkDamage(hp,launched);
                     }
                  }
                  break;
               case MSG_DUELSETSTANCE:
                  npc = NPCManager.getNetworkEnemyPlayer(m.getString(1));
                  if(npc != null)
                  {
                     npc.setStance(m.getInt(2));
                  }
                  break;
               case MSG_DUELSTARTACTION:
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
               case MSG_DUELCREATEPROJECTILE:
                  ProjectileManager.createProjectile(m.getInt(2),m.getInt(3),m.getInt(4),m.getInt(5),m.getInt(6),m.getInt(7),m.getInt(8),NPCManager.getNetworkPlayer(m.getString(1)));
                  break;
               case MSG_DUELCHAT:
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
               case MSG_GIVEPVPKILLERLOOT:
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
         else if(m.type == "UserJoined")
         {
            if(m.getString(0) == currentGroup)
            {
               id = m.getString(1);
               charname = id;
               charlvl = int(m.getString(2));
               equip = m.getString(3);
               nid = id;
               xpos = int(m.getString(4));
               side = int(m.getString(5));
               facingRight = m.getString(6) == "1";
               pose = m.getString(7);
               if(m.length == 11)
               {
                  stats = m.getString(8);
                  skills = m.getString(9);
                  taunt = m.getString(10);
               }
               else
               {
                  stats = "";
                  skills = "";
                  taunt = "";
               }
               NPCManager.createNetworkPlayer(id,charname,charlvl,equip,nid,xpos,side,facingRight,pose,stats,skills,taunt,true);
            }
         }
         else if(m.type == "UserLeft")
         {
            NPCManager.removeNetworkPlayer(m.getString(0));
         }
         else if(m.type == "ping")
         {
            connectionPIO.send("pong");
         }
         else if(m.type == "PlayerList")
         {
            if(m.getString(0) == currentGroup)
            {
               max = m.length;
               for(i = 1; i < max; i++)
               {
                  playerStr = m.getString(i).split("$");
                  id = playerStr[0];
                  charname = id;
                  charlvl = int(playerStr[1]);
                  equip = playerStr[2];
                  nid = id;
                  xpos = int(playerStr[3]);
                  side = int(playerStr[4]);
                  facingRight = playerStr[5] == "1";
                  pose = playerStr[6];
                  if(playerStr.length == 10)
                  {
                     stats = playerStr[7];
                     skills = playerStr[8];
                     taunt = playerStr[9];
                  }
                  else
                  {
                     stats = "";
                     skills = "";
                     taunt = "";
                  }
                  NPCManager.createNetworkPlayer(id,charname,charlvl,equip,nid,xpos,side,facingRight,pose,stats,skills,taunt,false);
               }
            }
         }
      }
      
      override internal function handleJoinChatPIO(connection:Connection) : *
      {
         connectionChatPIO = connection;
         trace("connected to chatPIO");
         if(OverworldHUD.instance != null)
         {
            if(currentChat == "$service-room$")
            {
               OverworldHUD.instance.updateChatLogWordsOnly("Connected to channel: Global","#FFCC00");
            }
            else
            {
               OverworldHUD.instance.updateChatLogWordsOnly("Connected to channel: " + currentChat,"#FFCC00");
            }
         }
         connection.addDisconnectHandler(handleChatDisconnect);
         connection.addMessageHandler("*",this.handleChatMessages);
         this.sendWhoIsOnline();
      }
      
      override internal function handleChatMessages(m:Message) : *
      {
         var playercount:int = 0;
         var i:int = 0;
         var playername:String = null;
         var actor:NPC = null;
         var chatbottext:String = null;
         var actorname:String = null;
         var mcharname:* = undefined;
         var mtext:String = null;
         var mside:* = undefined;
         var color:String = null;
         if(m.type == "UserJoined")
         {
            if(GameEngine.isAdventureMode())
            {
               OverworldHUD.instance.updateChatLogWordsOnly(m.getString(0) + " has joined your channel!","#FFCC00");
            }
         }
         else if(m.type == "UserLeft")
         {
            if(GameEngine.isAdventureMode())
            {
               OverworldHUD.instance.updateChatLogWordsOnly(m.getString(0) + " has left your channel.","#FFCC00");
            }
         }
         else if(m.type == "ping")
         {
            connectionChatPIO.send("pong");
         }
         else if(m.type == "PlayersOnline")
         {
            playercount = m.length / 2;
            if(playercount == 1)
            {
               OverworldHUD.instance.updateChatLogWordsOnly("\n" + playercount + " player in channel:","#FFCC00");
            }
            else
            {
               OverworldHUD.instance.updateChatLogWordsOnly("\n" + playercount + " players in channel:","#FFCC00");
            }
            this.svcRoomMembers = new Array();
            for(i = 0; i < m.length; i += 2)
            {
               playername = m.getString(i);
               playername = playername.substr(0,1).toUpperCase() + playername.substr(1,playername.length);
               OverworldHUD.instance.updateChatLogWordsOnly("- " + playername + " (level " + m.getString(i + 1) + ")","#CCCCCC");
               this.svcRoomMembers.push(m.getString(i));
            }
            OverworldHUD.instance.updateChatLogWordsOnly("");
         }
         else if(m.type == "kicked")
         {
            if(currentChat == "$service-room$")
            {
               OverworldHUD.instance.updateChatLogWordsOnly("Kicked from channel: Global","#FFCC00");
            }
            else
            {
               OverworldHUD.instance.updateChatLogWordsOnly("Kicked from channel: " + currentChat,"#FFCC00");
            }
            disconnectChatPIO();
         }
         else if(m.type == "chatbot")
         {
            actor = NPCManager.getChatBot();
            if(actor != null && actor.getMCS() != null)
            {
               chatbottext = m.getString(0);
               chatbottext = chatbottext.toLowerCase();
               if(chatbottext.indexOf("chomsky") >= 0)
               {
                  if(actor.getMCS().displayName != null && actor.getMCS().displayName.visible)
                  {
                     actorname = actor.getMCS().displayName.nametext.text;
                     chatbottext = chatbottext.split("chomsky").join(actorname);
                  }
                  else
                  {
                     chatbottext = "I am just a villager.";
                  }
               }
               if(chatbottext.indexOf("peter") >= 0)
               {
                  chatbottext = chatbottext.split("peter").join(NameGenerator.getInstance().getCommonerName(new RNG(StageManager.getCurrentNode() + StageManager.getCurrentRoom() * 21),true));
               }
               if(chatbottext.indexOf("2004") >= 0)
               {
                  chatbottext = chatbottext.split("2004").join("1725");
               }
               if(chatbottext == "the price of gasoline is up.")
               {
                  if(int(Math.random() * 2) == 0)
                  {
                     chatbottext = "The sky is up.";
                  }
                  else
                  {
                     chatbottext = "Sup.";
                  }
               }
               else if(chatbottext.indexOf("i would like to talk about") >= 0)
               {
                  chatbottext = "I\'m bored! Let\'s talk about something else.";
               }
               else if(chatbottext.indexOf("can we talk about") >= 0)
               {
                  chatbottext = "Let\'s talk about something else.";
               }
               else if(chatbottext.indexOf("wow! what do you do when you arent watching star trek, playing world of warcraft, and thinking of questions like that?") >= 0)
               {
                  chatbottext = chatbottext.split("wow! what do you do when you arent watching star trek, playing world of warcraft, and thinking of questions like that?").join("wow! what do you do when you aren\'t killing bandits, fighting in the war room, and thinking of questions like that?");
               }
               else if(chatbottext.indexOf("100") >= 0)
               {
                  chatbottext = "Bye!";
               }
               else if(chatbottext.indexOf("bot") >= 0 || chatbottext.indexOf("pandora") >= 0 || chatbottext.indexOf(".com") >= 0 || chatbottext.indexOf("computer") >= 0 || chatbottext.indexOf("electronic") >= 0 || chatbottext.indexOf("artificial") >= 0 || chatbottext.indexOf("software") >= 0 || chatbottext.indexOf("http") >= 0 || chatbottext.indexOf("human") >= 0 || chatbottext.indexOf("link") >= 0 || chatbottext.indexOf("cyber") >= 0 || chatbottext.indexOf("wiki") >= 0 || chatbottext.indexOf("electricity") >= 0 || chatbottext.indexOf("internet") >= 0 || chatbottext.indexOf("<br>") >= 0 || chatbottext.indexOf("briefly") >= 0 || chatbottext.indexOf("click") >= 0)
               {
                  chatbottext = "Hmm...";
               }
               actor.getMCS().setSpeechText(chatbottext);
               QueryManager.instance.logMessage("[BOT]: " + chatbottext);
            }
         }
         if(m.type != "public" && m.type != "private")
         {
            return;
         }
         var obj:Object = new Object();
         var msgType:int = m.getInt(0);
         obj.msgType = msgType;
         switch(msgType)
         {
            case MSG_CHAT:
               mcharname = m.getString(1);
               if(mcharname == StatsManager.charname)
               {
                  return;
               }
               mtext = m.getString(2);
               mside = m.getInt(3);
               if(mside == 0)
               {
                  color = "#FFFFFF";
               }
               else if(mside == -1)
               {
                  color = "#CCCCCC";
               }
               else if(mside == 1)
               {
                  color = "#FF0000";
               }
               else if(mside == 2)
               {
                  color = "#00FF00";
               }
               else if(mside == 3)
               {
                  color = "#00FFFF";
               }
               else if(mside == 4)
               {
                  color = "#FFCC00";
               }
               else if(StatsManager.isCustomClan(mside))
               {
                  color = "#FF9900";
               }
               if(GameEngine.isAdventureMode())
               {
                  if(mside == 0 || mside == StatsManager.getSide())
                  {
                     OverworldHUD.instance.updateChatLog(mcharname,mtext,color);
                  }
               }
               else if(GameEngine.isPvPRoomMode())
               {
                  if(mside == 0 || mside == StatsManager.getSide())
                  {
                     BattleUI.instance.updateChatLog(mcharname,mtext,color);
                  }
               }
         }
      }
      
      public function uppercaseFirstLetter(displayname:String) : String
      {
         var firstChar:String = displayname.substr(0,1);
         var restOfString:String = displayname.substr(1,displayname.length);
         return firstChar.toUpperCase() + restOfString;
      }
   }
}

