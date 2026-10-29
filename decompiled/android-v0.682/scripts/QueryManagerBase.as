package
{
   import flash.errors.*;
   import flash.events.*;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.net.*;
   import flash.utils.Timer;
   
   public class QueryManagerBase
   {
      
      public static var instance:QueryManagerBase;
      
      internal static var DATASLOTS:int = 20;
      
      public var offlineMode:Boolean = false;
      
      public var loggedIn:Boolean = false;
      
      public var magicnum:int = 0;
      
      internal var username:String = "";
      
      internal var userid:String = "";
      
      internal var charstring:String = "";
      
      internal var lastUpdate:int = 0;
      
      internal var serverTime:int = 0;
      
      internal var serverDate:int = 0;
      
      internal var serverDateYesterday:int = 0;
      
      internal var serverTimerStarted:Boolean = false;
      
      internal var serverTimer:Timer = new Timer(1000);
      
      internal var dataModified:Vector.<Boolean> = new Vector.<Boolean>(DATASLOTS);
      
      internal var debug:Boolean = false;
      
      internal var server:String;
      
      internal var giveItemReceiver:String;
      
      internal var lastAPUpdate:int;
      
      internal var lastDTUpdate:int;
      
      internal var lastWarTurn:int;
      
      internal var hackReported:Boolean = false;
      
      internal var sessionID:int;
      
      public function QueryManagerBase()
      {
         super();
      }
      
      internal function resetDataModified() : *
      {
         for(var i:int = 0; i < DATASLOTS; i++)
         {
            this.dataModified[i] = false;
         }
      }
      
      internal function markAllDataModified() : *
      {
         for(var i:int = 0; i < DATASLOTS; i++)
         {
            this.dataModified[i] = true;
         }
      }
      
      internal function reportDataModified(num:int) : *
      {
         this.dataModified[num] = true;
      }
      
      internal function saveLastUpdate(str:String = "") : *
      {
         if(str != "")
         {
            this.lastUpdate = int(str);
            this.serverTime = this.lastUpdate;
         }
         else
         {
            this.lastUpdate = this.serverTime;
            this.checkTimeSkip();
         }
         var sharedObject:SharedObject = SharedObject.getLocal(StatsManager.cookieName);
         sharedObject.data.lastUpdate = this.lastUpdate;
         if(!this.serverTimerStarted)
         {
            this.serverTimerStarted = true;
            this.serverTimer.start();
            this.serverTimer.addEventListener(TimerEvent.TIMER,this.timerListener,false,0,true);
            this.serverDate = new Date(this.serverTime * 1000).getDate();
            this.serverDateYesterday = new Date(this.serverTime * 1000 - 24 * 60 * 60 * 1000).getDate();
         }
      }
      
      internal function timerListener(e:TimerEvent) : void
      {
         this.serverTime += 1;
      }
      
      internal function checkTimeSkip() : *
      {
      }
      
      public function getServerTime() : int
      {
         if(this.serverTimerStarted)
         {
            return this.serverTime;
         }
         return 0;
      }
      
      public function getServerDate() : int
      {
         return this.serverDate;
      }
      
      public function getServerDateYesterday() : int
      {
         return this.serverDateYesterday;
      }
      
      public function login(user:String, pass:String) : *
      {
         var request:URLRequest = null;
         var loader:URLLoader = null;
         var variables:URLVariables = null;
         this.username = user;
         if(!this.offlineMode)
         {
            request = new URLRequest(this.server + "login_internal.php");
            loader = new URLLoader();
            loader.dataFormat = URLLoaderDataFormat.VARIABLES;
            variables = new URLVariables();
            variables.username = user;
            variables.password = pass;
            variables.lang = LangManager.getLanguage();
            variables.ver = StatsManager.clientVersion;
            if(StatsManager.impersonateUser)
            {
               variables.impers = "onate";
            }
            if(this.debug)
            {
               variables.debug = 1;
            }
            request.data = variables;
            request.method = URLRequestMethod.POST;
            loader.addEventListener(Event.COMPLETE,this.loginComplete,false,0,true);
            loader.addEventListener(IOErrorEvent.IO_ERROR,this.loginIOError,false,0,true);
            loader.load(request);
         }
         else
         {
            this.loggedIn = true;
            this.username = "Guest";
            this.charstring = "";
            TitleUI.instance.login.serverResponse(0);
            this.saveLastUpdate("1000000");
            NetworkManager.getInstance();
         }
      }
      
      public function checkExternalLogin() : *
      {
         var request:URLRequest = null;
         var loader:URLLoader = null;
         var variables:URLVariables = null;
         if(!this.offlineMode)
         {
            request = new URLRequest(this.server + "login_external.php");
            loader = new URLLoader();
            loader.dataFormat = URLLoaderDataFormat.VARIABLES;
            variables = new URLVariables();
            variables.ver = StatsManager.clientVersion;
            variables.lang = LangManager.getLanguage();
            if(this.debug)
            {
               variables.debug = 1;
            }
            request.data = variables;
            request.method = URLRequestMethod.POST;
            loader.addEventListener(Event.COMPLETE,this.loginComplete,false,0,true);
            loader.addEventListener(IOErrorEvent.IO_ERROR,this.loginIOError,false,0,true);
            loader.load(request);
         }
      }
      
      public function hasFlashVars() : Boolean
      {
         if(!StatsManager.useFlashVarsLogin)
         {
            return false;
         }
         var flashVars:Object = GameEngine.getLoaderInfo(StatsManager.mainTimeLine).parameters;
         return flashVars.username;
      }
      
      public function checkFlashVarsLogin() : *
      {
         var request:URLRequest = null;
         var loader:URLLoader = null;
         var variables:URLVariables = null;
         var flashVars:Object = GameEngine.getLoaderInfo(StatsManager.mainTimeLine).parameters;
         if(!flashVars.username)
         {
            trace("no flash vars");
            TitleUI.instance.login.serverResponse(6);
            return;
         }
         if(flashVars.facebookid)
         {
            StatsManager.facebookid = flashVars.facebookid;
         }
         if(flashVars.fbfriends)
         {
            StatsManager.facebookFriends = flashVars.fbfriends;
         }
         if(!this.offlineMode)
         {
            request = new URLRequest(this.server + "login_flashvars.php");
            loader = new URLLoader();
            loader.dataFormat = URLLoaderDataFormat.VARIABLES;
            variables = new URLVariables();
            variables.username = flashVars.username;
            variables.userid = flashVars.userid;
            variables.ver = StatsManager.clientVersion;
            variables.lang = LangManager.getLanguage();
            if(this.debug)
            {
               variables.debug = 1;
            }
            request.data = variables;
            request.method = URLRequestMethod.POST;
            loader.addEventListener(Event.COMPLETE,this.loginComplete,false,0,true);
            loader.addEventListener(IOErrorEvent.IO_ERROR,this.loginIOError,false,0,true);
            loader.load(request);
         }
      }
      
      internal function loginComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               trace("password ok");
               this.magicnum = vars.magicnum;
               this.loggedIn = true;
               this.charstring = vars.chars;
               if(vars.username != null && vars.username != "")
               {
                  this.username = vars.username;
               }
               this.userid = vars.id;
               TitleUI.instance.showMOTD(vars.motd);
               if(StatsManager.useCirrus && !NetworkManager.getInstance().connected)
               {
                  NetworkManager.getInstance();
               }
               else
               {
                  TitleUI.instance.login.serverResponse(0);
               }
               break;
            case "1":
               trace("login error a");
               if(StatsManager.useExternalLogin || StatsManager.useFlashVarsLogin)
               {
                  TitleUI.instance.login.serverResponse(5);
               }
               else
               {
                  TitleUI.instance.login.serverResponse(1);
               }
               break;
            case "2":
               trace("user not verified");
               if(StatsManager.useExternalLogin || StatsManager.useFlashVarsLogin)
               {
                  return;
               }
               TitleUI.instance.login.serverResponse(2);
               break;
            case "4":
               trace("update game client");
               TitleUI.instance.login.serverResponse(4);
               break;
            case "5":
               trace("flash vars error");
               TitleUI.instance.login.serverResponse(5);
         }
      }
      
      internal function loginIOError(event:IOErrorEvent) : void
      {
         trace("login IO error");
         if(!TitleUI.instance.login.visible)
         {
            TitleUI.instance.switchToLogin();
         }
         TitleUI.instance.login.serverResponse(3);
      }
      
      public function logout() : *
      {
         var request:URLRequest = null;
         var loader:URLLoader = null;
         var variables:URLVariables = null;
         if(!this.offlineMode)
         {
            request = new URLRequest(this.server + "logout.php");
            loader = new URLLoader();
            loader.dataFormat = URLLoaderDataFormat.VARIABLES;
            variables = new URLVariables();
            variables.charname = StatsManager.charname;
            request.data = variables;
            request.method = URLRequestMethod.POST;
            loader.load(request);
         }
         this.clearAutoLogin();
         this.loggedIn = false;
      }
      
      public function registerUser(user:String, pass:String, email:String, facebookid:String = "") : *
      {
         var request:URLRequest = new URLRequest(this.server + "registeruser.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.username = user;
         variables.password = pass;
         variables.email = email;
         variables.facebookid = facebookid;
         if(this.debug)
         {
            variables.debug = 1;
         }
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.registerComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.registerIOError,false,0,true);
         loader.load(request);
      }
      
      internal function registerComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         switch(vars.status)
         {
            case "0":
               trace("register ok");
               TitleUI.instance.register.serverResponse(0);
               break;
            case "1":
               trace("username exists");
               TitleUI.instance.register.serverResponse(1);
               break;
            case "2":
               trace("email exists");
               TitleUI.instance.register.serverResponse(2);
               break;
            case "3":
               trace("facebookid exists");
               TitleUI.instance.register.serverResponse(3);
               break;
            case "4":
               trace("sql error");
               TitleUI.instance.register.serverResponse(4);
         }
      }
      
      internal function registerIOError(event:IOErrorEvent) : void
      {
         trace("register IO error");
         TitleUI.instance.register.serverResponse(5);
      }
      
      public function getEmail(id:String) : *
      {
         var request:URLRequest = new URLRequest(this.server + "getemail.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.id = id;
         if(this.debug)
         {
            variables.debug = 1;
         }
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.getEmailComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.getEmailIOError,false,0,true);
         loader.load(request);
      }
      
      internal function getEmailComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         switch(vars.status)
         {
            case "0":
               trace("get email ok");
               TitleUI.instance.edit.gotEmail(vars.email);
               break;
            case "1":
               trace("username does not exist");
               TitleUI.instance.edit.back(null);
         }
      }
      
      internal function getEmailIOError(event:IOErrorEvent) : void
      {
         trace("get email IO error");
         TitleUI.instance.edit.back(null);
      }
      
      public function editUser(user:String, pass:String, email:String) : *
      {
         var request:URLRequest = new URLRequest(this.server + "edituser.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.username = user;
         variables.password = pass;
         variables.email = email;
         variables.debug = 1;
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.editUserComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.editUserIOError,false,0,true);
         loader.load(request);
      }
      
      internal function editUserComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         trace(vars.debug);
         switch(vars.status)
         {
            case "0":
               trace("register ok");
               TitleUI.instance.edit.serverResponse(0);
               break;
            case "1":
               trace("username exists");
               TitleUI.instance.edit.serverResponse(1);
               break;
            case "2":
               trace("email exists");
               TitleUI.instance.edit.serverResponse(2);
               break;
            case "3":
               trace("facebookid exists");
               TitleUI.instance.edit.serverResponse(3);
               break;
            case "4":
               trace("sql error");
               TitleUI.instance.edit.serverResponse(4);
         }
      }
      
      internal function editUserIOError(event:IOErrorEvent) : void
      {
         trace("edit user IO error");
         TitleUI.instance.edit.serverResponse(5);
      }
      
      public function sendVerify(email:String) : *
      {
         var request:URLRequest = new URLRequest(this.server + "sendverify.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.email = email;
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.sendVerifyComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.sendVerifyIOError,false,0,true);
         loader.load(request);
      }
      
      internal function sendVerifyComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         switch(vars.status)
         {
            case "0":
               trace("resend ok");
               TitleUI.instance.resend.serverResponse(0);
               break;
            case "1":
               trace("did not enter correct username/password");
               TitleUI.instance.resend.serverResponse(1);
               break;
            case "2":
               trace("user does not exist");
               TitleUI.instance.resend.serverResponse(2);
         }
      }
      
      internal function sendVerifyIOError(event:IOErrorEvent) : void
      {
         trace("sendVerify IO error");
         TitleUI.instance.resend.serverResponse(3);
      }
      
      public function createCharacter(charname:String) : *
      {
         if(this.offlineMode)
         {
            this.saveAllCharData();
            this.saveCharName();
            this.charstring = charname + ",1";
            TitleUI.instance.charcreate.serverResponse(0);
            return;
         }
         var request:URLRequest = new URLRequest(this.server + "createcharacter.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.charname = charname;
         variables.magicnum = this.magicnum;
         variables.stratusid = "12345";
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.createCharacterComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.createCharacterIOError,false,0,true);
         loader.load(request);
      }
      
      internal function createCharacterComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               trace("character created");
               this.saveAllCharData();
               this.charstring = vars.chars;
               TitleUI.instance.charcreate.serverResponse(0);
               break;
            case "1":
               trace("not logged in");
               TitleUI.instance.charcreate.serverResponse(1);
               break;
            case "2":
               trace("wrong magic number");
               TitleUI.instance.charcreate.serverResponse(2);
               break;
            case "3":
               trace("charname exists");
               TitleUI.instance.charcreate.serverResponse(3);
               break;
            case "4":
               trace("sql error");
               TitleUI.instance.charcreate.serverResponse(4);
         }
      }
      
      internal function createCharacterIOError(event:IOErrorEvent) : void
      {
         trace("sendVerify IO error");
         TitleUI.instance.charcreate.serverResponse(5);
      }
      
      public function deleteCharacter(charname:String) : *
      {
         this.deleteCharCookieData(charname);
         if(this.offlineMode)
         {
            this.clearCharName();
            this.charstring = "";
            TitleUI.instance.charselect.chardeleteform.serverResponse(0);
            return;
         }
         var request:URLRequest = new URLRequest(this.server + "deletecharacter.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.charname = charname;
         variables.magicnum = this.magicnum;
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.deleteCharacterComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.deleteCharacterIOError,false,0,true);
         loader.load(request);
      }
      
      internal function deleteCharacterComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               trace("character deleted");
               this.charstring = vars.chars;
               TitleUI.instance.charselect.chardeleteform.serverResponse(0);
               break;
            case "1":
               trace("not logged in");
               TitleUI.instance.charselect.chardeleteform.serverResponse(1);
               break;
            case "2":
               trace("wrong magic number");
               TitleUI.instance.charselect.chardeleteform.serverResponse(2);
               break;
            case "3":
               trace("sql error");
               TitleUI.instance.charselect.chardeleteform.serverResponse(3);
         }
      }
      
      internal function deleteCharacterIOError(event:IOErrorEvent) : void
      {
         trace("deleteCharacter IO error");
         TitleUI.instance.charselect.chardeleteform.serverResponse(4);
      }
      
      public function whoIsHere(node:int) : *
      {
         var request:URLRequest = new URLRequest(this.server + "whoishere.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.node = node.toString();
         variables.magicnum = this.magicnum;
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.whoIsHereComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.whoIsHereIOError,false,0,true);
         loader.load(request);
      }
      
      internal function whoIsHereComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               trace("whoishere: " + vars.chars);
               break;
            case "1":
               trace("not logged in");
               break;
            case "2":
               trace("incorrect magic number");
         }
      }
      
      internal function whoIsHereIOError(event:IOErrorEvent) : void
      {
         trace("whoIsHere IO error");
      }
      
      public function getOpponents() : *
      {
         if(this.offlineMode)
         {
            DuelModeUI.instance.setDuelList("");
            return;
         }
         var request:URLRequest = new URLRequest(this.server + "getopponents.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.charname = StatsManager.charname;
         variables.lvl = StatsManager.getPlayerLevelString();
         variables.magicnum = this.magicnum;
         if(this.debug)
         {
            variables.debug = 1;
         }
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.getOpponentsComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.getOpponentsIOError,false,0,true);
         loader.load(request);
      }
      
      internal function getOpponentsComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               DuelModeUI.instance.setDuelList(vars.chars);
               break;
            case "1":
               trace("not logged in");
               DuelModeUI.instance.onLeave(null);
               break;
            case "2":
               trace("incorrect magic number");
               DuelModeUI.instance.onLeave(null);
         }
      }
      
      internal function getOpponentsIOError(event:IOErrorEvent) : void
      {
         trace("getOpponents IO error");
         DuelModeUI.instance.onLeave(null);
      }
      
      public function getOpponentData(charname:String) : *
      {
         var request:URLRequest = new URLRequest(this.server + "getopponentdata.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.charname = charname;
         variables.magicnum = this.magicnum;
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.getOpponentDataComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.getOpponentDataIOError,false,0,true);
         loader.load(request);
      }
      
      internal function getOpponentDataComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               DuelModeUI.instance.gotOpponentData(vars.playerstats,vars.skillstats,vars.stratusid,int(vars.lastping),vars.taunt);
               break;
            case "1":
               trace("not logged in");
               DuelModeUI.instance.onLeave(null);
               break;
            case "2":
               trace("incorrect magic number");
               DuelModeUI.instance.onLeave(null);
         }
      }
      
      internal function getOpponentDataIOError(event:IOErrorEvent) : void
      {
         trace("getOpponentData IO error");
         DuelModeUI.instance.onLeave(null);
      }
      
      public function getLeaderboards(page:int = 0, weekly:Boolean = false) : *
      {
         var request:URLRequest = new URLRequest(this.server + "getleaderboards.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.page = page;
         variables.magicnum = this.magicnum;
         if(weekly)
         {
            variables.weekly = "1";
         }
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.getLeaderboardsComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.getLeaderboardsIOError,false,0,true);
         loader.load(request);
      }
      
      internal function getLeaderboardsComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               if(GameEngine.isTitle())
               {
                  LeaderboardUI.instance.setLeaderboard(vars.chars);
               }
               else
               {
                  DuelModeUI.instance.setLeaderboard(vars.chars);
               }
               break;
            case "1":
               trace("not logged in");
               break;
            case "2":
               trace("incorrect magic number");
         }
      }
      
      internal function getLeaderboardsIOError(event:IOErrorEvent) : void
      {
         trace("getLeaderboards IO error");
         if(GameEngine.isTitle())
         {
            LeaderboardUI.instance.ioError();
         }
         else
         {
            DuelModeUI.instance.ioError();
         }
      }
      
      public function giveItem(receiver:String, giver:String, items:String, coins:int) : *
      {
         if(items == "" && coins == 0)
         {
            return;
         }
         var request:URLRequest = new URLRequest(this.server + "giveitem.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.receiver = receiver;
         variables.giver = giver;
         variables.items = items;
         variables.coins = coins;
         variables.magicnum = this.magicnum;
         this.giveItemReceiver = receiver;
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.giveItemComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.giveItemIOError,false,0,true);
         loader.load(request);
      }
      
      internal function giveItemComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               trace("give ok");
               NetworkManager.instance.globalCheckNotification(this.giveItemReceiver);
               break;
            case "1":
               trace("not logged in");
               break;
            case "2":
               trace("incorrect magic number");
               break;
            case "3":
               trace("giving nothing");
         }
      }
      
      internal function giveItemIOError(event:IOErrorEvent) : void
      {
         trace("giveItem IO error");
      }
      
      public function checkNotifications() : *
      {
         var request:URLRequest = new URLRequest(this.server + "getnotifications.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.magicnum = this.magicnum;
         variables.charname = StatsManager.charname;
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.checkNotificationsComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.checkNotificationsIOError,false,0,true);
         loader.load(request);
      }
      
      internal function checkNotificationsComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               trace("check notifications ok");
               if(StatsManager.giftNotification == "")
               {
                  StatsManager.giftNotification = vars.notif;
               }
               else
               {
                  StatsManager.giftNotification = StatsManager.giftNotification + "^" + vars.notif;
               }
               if(GameEngine.isAdventureMode() && !OverworldHUD.instance.duelmodeUI.visible && !OverworldHUD.instance.warUI.visible)
               {
                  StatsManager.parseGiftNotificationsString();
               }
               break;
            case "1":
               trace("not logged in");
               break;
            case "2":
               trace("incorrect magic number");
         }
      }
      
      internal function checkNotificationsIOError(event:IOErrorEvent) : void
      {
         trace("check notifications IO error");
      }
      
      public function duelEnd(winner:String, loser:String) : *
      {
         var request:URLRequest = new URLRequest(this.server + "duelend.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.winner = winner;
         variables.loser = loser;
         variables.magicnum = this.magicnum;
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.duelEndComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.duelEndIOError,false,0,true);
         loader.load(request);
      }
      
      internal function duelEndComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               trace("duel results submitted");
               break;
            case "1":
               trace("not logged in");
               break;
            case "2":
               trace("incorrect magic number");
         }
      }
      
      internal function duelEndIOError(event:IOErrorEvent) : void
      {
         trace("duelEnd IO error");
      }
      
      public function getClanMemberCount() : *
      {
         if(this.offlineMode)
         {
            return;
         }
         var request:URLRequest = new URLRequest(this.server + "/war/getclanmembercount.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.magicnum = this.magicnum;
         if(this.debug)
         {
            variables.debug = 1;
         }
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.getClanMemberCountComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.getClanMemberCountIOError,false,0,true);
         loader.load(request);
      }
      
      internal function getClanMemberCountComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               trace("get war maps complete");
               OverworldHUD.instance.warUI.warChooseUI.gotClanMemberCount(vars.red,vars.green,vars.blue,vars.yellow);
               break;
            case "1":
               trace("not logged in");
               OverworldHUD.instance.warUI.loading.visible = false;
               break;
            case "2":
               trace("incorrect magic number");
               OverworldHUD.instance.warUI.loading.visible = false;
         }
      }
      
      internal function getClanMemberCountIOError(event:IOErrorEvent) : void
      {
         trace("Error get clan member count.");
         OverworldHUD.instance.warUI.loading.visible = false;
      }
      
      public function getWarMaps(side:int, getWorld:Boolean = true) : *
      {
         if(this.offlineMode)
         {
            return;
         }
         var request:URLRequest = new URLRequest(this.server + "/war/getwarmaps.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.magicnum = this.magicnum;
         variables.charid = StatsManager.id;
         variables.side = side;
         if(getWorld)
         {
            variables.getworld = 1;
         }
         else
         {
            variables.getworld = 0;
         }
         if(this.debug)
         {
            variables.debug = 1;
         }
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.getWarMapsComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.getWarMapsIOError,false,0,true);
         loader.load(request);
      }
      
      internal function getWarMapsComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               trace("get war maps complete");
               OverworldHUD.instance.warUI.initWarMarkers(vars.maps,vars.sentry,vars.activebattles,vars.nextupdate,vars.maintenance);
               break;
            case "1":
               trace("not logged in");
               break;
            case "2":
               trace("incorrect magic number");
         }
      }
      
      internal function getWarMapsIOError(event:IOErrorEvent) : void
      {
         trace("Error get war maps.");
      }
      
      public function getWarHexMap(mapid:int, side:int) : *
      {
         if(this.offlineMode)
         {
            return;
         }
         var request:URLRequest = new URLRequest(this.server + "/war/getwarhex.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.magicnum = this.magicnum;
         variables.map = mapid;
         variables.side = side;
         if(this.debug)
         {
            variables.debug = 1;
         }
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.getWarHexMapComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.getWarHexMapIOError,false,0,true);
         loader.load(request);
      }
      
      internal function getWarHexMapComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               trace("get war hex map complete");
               OverworldHUD.instance.warUI.initWarHexMap(vars.hex,vars.tdata);
               break;
            case "1":
               trace("not logged in");
               break;
            case "2":
               trace("incorrect magic number");
         }
      }
      
      internal function getWarHexMapIOError(event:IOErrorEvent) : void
      {
         trace("Error get war hex map.");
      }
      
      public function getWarMessage(mapid:int, side:int) : *
      {
         if(this.offlineMode)
         {
            return;
         }
         var request:URLRequest = new URLRequest(this.server + "/war/warmessage.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.magicnum = this.magicnum;
         variables.map = mapid;
         variables.side = side;
         variables.op = "get";
         if(this.debug)
         {
            variables.debug = 1;
         }
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.getWarMessageComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.getWarMessageIOError,false,0,true);
         loader.load(request);
      }
      
      internal function getWarMessageComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               trace("get war message complete");
               OverworldHUD.instance.warUI.warHexUI.initMessages(vars.msg);
               break;
            case "1":
               trace("not logged in");
               break;
            case "2":
               trace("incorrect magic number");
         }
      }
      
      internal function getWarMessageIOError(event:IOErrorEvent) : void
      {
         trace("Error get war message.");
      }
      
      public function addWarMessage(mapid:int, side:int, charside:int, charname:String, msg:String) : *
      {
         if(this.offlineMode)
         {
            return;
         }
         var request:URLRequest = new URLRequest(this.server + "/war/warmessage.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.magicnum = this.magicnum;
         variables.map = mapid;
         variables.side = side;
         variables.charside = charside;
         variables.charname = charname;
         variables.msg = msg;
         variables.op = "add";
         if(this.debug)
         {
            variables.debug = 1;
         }
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.addWarMessageComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.addWarMessageIOError,false,0,true);
         loader.load(request);
      }
      
      internal function addWarMessageComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               trace("add war message complete");
               break;
            case "1":
               trace("not logged in");
               break;
            case "2":
               trace("incorrect magic number");
         }
      }
      
      internal function addWarMessageIOError(event:IOErrorEvent) : void
      {
         trace("Error add war message.");
      }
      
      public function getWarHexData(mapid:int, xpos:int, ypos:int, side:int) : *
      {
         if(this.offlineMode)
         {
            return;
         }
         var request:URLRequest = new URLRequest(this.server + "/war/getwarhexdata.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.magicnum = this.magicnum;
         variables.map = mapid;
         variables.x = xpos;
         variables.y = ypos;
         variables.side = side;
         if(this.debug)
         {
            variables.debug = 1;
         }
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.getWarHexDataComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.getWarHexDataIOError,false,0,true);
         loader.load(request);
      }
      
      internal function getWarHexDataComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               trace("get war hex data complete");
               OverworldHUD.instance.warUI.warHexUI.initWarHexData(vars.hex,vars.sentry);
               break;
            case "1":
               trace("not logged in");
               break;
            case "2":
               trace("incorrect magic number");
         }
      }
      
      internal function getWarHexDataIOError(event:IOErrorEvent) : void
      {
         trace("Error get hex data.");
      }
      
      public function addWarSentry(mapid:int, side:int, xpos:int, ypos:int, charid:String) : *
      {
         if(this.offlineMode)
         {
            return;
         }
         var request:URLRequest = new URLRequest(this.server + "/war/warsentry.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.magicnum = this.magicnum;
         variables.map = mapid;
         variables.side = side;
         variables.charid = charid;
         variables.x = xpos;
         variables.y = ypos;
         variables.op = "add";
         if(this.debug)
         {
            variables.debug = 1;
         }
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.addWarSentryComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.addWarSentryIOError,false,0,true);
         loader.load(request);
      }
      
      internal function addWarSentryComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               trace("get add war sentry complete");
               break;
            case "1":
               trace("not logged in");
               break;
            case "2":
               trace("incorrect magic number");
         }
      }
      
      internal function addWarSentryIOError(event:IOErrorEvent) : void
      {
         trace("Error add war sentry.");
      }
      
      public function delWarSentry(mapid:int, killedList:String) : *
      {
         if(this.offlineMode)
         {
            return;
         }
         var request:URLRequest = new URLRequest(this.server + "/war/warsentry.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.magicnum = this.magicnum;
         variables.charid = killedList;
         variables.op = "del";
         if(this.debug)
         {
            variables.debug = 1;
         }
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.delWarSentryComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.delWarSentryIOError,false,0,true);
         loader.load(request);
      }
      
      internal function delWarSentryComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               trace("del war sentry complete");
               break;
            case "1":
               trace("not logged in");
               break;
            case "2":
               trace("incorrect magic number");
         }
      }
      
      internal function delWarSentryIOError(event:IOErrorEvent) : void
      {
         trace("Error del war sentry.");
      }
      
      public function getWarEnemySentry(mapid:int, xpos:int, ypos:int, side:int) : *
      {
         if(this.offlineMode)
         {
            return;
         }
         var request:URLRequest = new URLRequest(this.server + "/war/getwarenemysentry.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.magicnum = this.magicnum;
         variables.map = mapid;
         variables.side = side;
         variables.x = xpos;
         variables.y = ypos;
         if(this.debug)
         {
            variables.debug = 1;
         }
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.getWarEnemySentryComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.getWarEnemySentryIOError,false,0,true);
         loader.load(request);
      }
      
      internal function getWarEnemySentryComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               trace("get war enemy sentry complete");
               OverworldHUD.instance.warUI.warHexUI.startBattle(vars.char);
               break;
            case "1":
               trace("not logged in");
               break;
            case "2":
               trace("incorrect magic number");
         }
      }
      
      internal function getWarEnemySentryIOError(event:IOErrorEvent) : void
      {
         trace("Error get war enemy sentry.");
      }
      
      public function setWarHex(mapid:int, xpos:int, ypos:int, side:int, val:int) : *
      {
         if(this.offlineMode)
         {
            return;
         }
         var request:URLRequest = new URLRequest(this.server + "/war/setwarhex.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.magicnum = this.magicnum;
         variables.map = mapid;
         variables.x = xpos;
         variables.y = ypos;
         variables.side = side;
         variables.value = val;
         if(this.debug)
         {
            variables.debug = 1;
         }
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.setWarHexComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.setWarHexIOError,false,0,true);
         loader.load(request);
      }
      
      internal function setWarHexComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               trace("set war hex complete");
               break;
            case "1":
               trace("not logged in");
               break;
            case "2":
               trace("incorrect magic number");
         }
      }
      
      internal function setWarHexIOError(event:IOErrorEvent) : void
      {
         trace("Error set war hex.");
      }
      
      public function startBuild(mapid:int, xpos:int, ypos:int, hextype:int) : *
      {
         if(this.offlineMode)
         {
            return;
         }
         var request:URLRequest = new URLRequest(this.server + "/war/startbuild.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.magicnum = this.magicnum;
         variables.map = mapid;
         variables.x = xpos;
         variables.y = ypos;
         variables.type = hextype;
         if(this.debug)
         {
            variables.debug = 1;
         }
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.startBuildComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.startBuildIOError,false,0,true);
         loader.load(request);
      }
      
      internal function startBuildComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               trace("start build complete");
               break;
            case "1":
               trace("not logged in");
               break;
            case "2":
               trace("incorrect magic number");
         }
      }
      
      internal function startBuildIOError(event:IOErrorEvent) : void
      {
         trace("Error start build.");
      }
      
      public function doBuild(mapid:int, xpos:int, ypos:int, cost:int) : *
      {
         if(this.offlineMode)
         {
            return;
         }
         var request:URLRequest = new URLRequest(this.server + "/war/dobuild.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.magicnum = this.magicnum;
         variables.map = mapid;
         variables.x = xpos;
         variables.y = ypos;
         variables.cost = cost;
         if(this.debug)
         {
            variables.debug = 1;
         }
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.doBuildComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.doBuildIOError,false,0,true);
         loader.load(request);
      }
      
      internal function doBuildComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               trace("do build complete");
               break;
            case "1":
               trace("not logged in");
               break;
            case "2":
               trace("incorrect magic number");
         }
      }
      
      internal function doBuildIOError(event:IOErrorEvent) : void
      {
         trace("Error do build.");
      }
      
      public function logMessage(msg:String) : *
      {
         if(this.offlineMode)
         {
            return;
         }
         var request:URLRequest = new URLRequest(this.server + "/logmessage.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.magicnum = this.magicnum;
         variables.charname = StatsManager.charname;
         variables.msg = escape(msg);
         if(this.debug)
         {
            variables.debug = 1;
         }
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.logMessageError,false,0,true);
         loader.load(request);
      }
      
      internal function logMessageError(event:IOErrorEvent) : void
      {
         trace("log message error");
      }
      
      public function loadCharData(charname:String, forceServerLoad:Boolean = false) : *
      {
         var request:URLRequest = null;
         var loader:URLLoader = null;
         var variables:URLVariables = null;
         StatsManager.charname = charname;
         if(forceServerLoad)
         {
            this.lastUpdate = 0;
         }
         if(this.offlineMode)
         {
            trace("offline load user data complete");
            this.loadCharCookieData();
            StatsManager.refreshMCS();
            NodeGenerator.instance.initSurroundingTerrCache(StatsManager.getLocation(),false);
         }
         else
         {
            request = new URLRequest(this.server + "loaddata.php");
            loader = new URLLoader();
            loader.dataFormat = URLLoaderDataFormat.VARIABLES;
            variables = new URLVariables();
            variables.lastupdate = this.lastUpdate;
            variables.charname = charname;
            variables.magicnum = this.magicnum;
            if(StatsManager.useCirrus)
            {
               variables.stratusid = NetworkManager.getInstance().getNid();
            }
            else
            {
               variables.stratusid = "";
            }
            if(this.debug)
            {
               variables.debug = 1;
            }
            request.data = variables;
            request.method = URLRequestMethod.POST;
            loader.addEventListener(Event.COMPLETE,this.loadCharDataComplete,false,0,true);
            loader.addEventListener(IOErrorEvent.IO_ERROR,this.loadCharDataIOError,false,0,true);
            loader.load(request);
         }
         this.resetDataModified();
      }
      
      internal function loadCharDataComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               this.saveLastUpdate(vars.lastupdate);
               StatsManager.id = vars.id;
               if(vars.apupdate != "")
               {
                  StatsManager.nextAPUpdate = vars.apupdate;
               }
               if(vars.dtupdate != "")
               {
                  StatsManager.nextDTUpdate = vars.dtupdate;
               }
               if(vars.warupdate != "")
               {
                  StatsManager.nextWarTurn = vars.warupdate;
               }
               if(vars.playerstats != null)
               {
                  StatsManager.parsePlayerStatsString(vars.playerstats);
               }
               if(vars.equipment != null)
               {
                  StatsManager.parseEquipmentString(vars.equipment);
               }
               if(vars.skillstats != null)
               {
                  StatsManager.parseSkillStatsString(vars.skillstats);
               }
               if(vars.skillslots != null)
               {
                  StatsManager.parseSkillSlotsString(vars.skillslots);
               }
               if(vars.inventory != null)
               {
                  StatsManager.parseInventoryString(vars.inventory);
               }
               if(vars.stash != null)
               {
                  StatsManager.parseStashString(vars.stash);
               }
               if(vars.questitems != null)
               {
                  StatsManager.parseQuestItemsString(vars.questitems);
               }
               if(vars.intstats != null)
               {
                  StatsManager.parseIntStatsString(vars.intstats);
               }
               if(vars.achievementstats != null)
               {
                  StatsManager.parseAchievementStatsString(vars.achievementstats);
               }
               if(vars.booleanstats != null)
               {
                  StatsManager.parseBooleanStatsString(vars.booleanstats);
               }
               if(vars.activequest != null)
               {
                  StatsManager.setActiveQuestString(vars.activequest);
               }
               if(vars.completedquest != null)
               {
                  StatsManager.parseCompletedQuestString(vars.completedquest);
               }
               if(vars.taunt != null)
               {
                  StatsManager.setTaunt(vars.taunt);
               }
               if(vars.rank != null)
               {
                  StatsManager.rank = vars.rank;
               }
               if(vars.wins != null)
               {
                  StatsManager.setPlayerStats(StatsManager.STAT_WINS,vars.wins);
               }
               if(vars.bounty != null)
               {
                  StatsManager.bounty = vars.bounty;
               }
               if(vars.notif != null)
               {
                  StatsManager.giftNotification = vars.notif;
               }
               if(vars.friends != null)
               {
                  StatsManager.parseFriendListString(vars.friends);
               }
               if(vars.purchases != null)
               {
                  StatsManager.purchasesMade.setIntValue(vars.purchases);
               }
               trace("online load user data complete");
               StatsManager.refreshMCS();
               NodeGenerator.instance.initSurroundingTerrCache(StatsManager.getLocation(),false);
               this.storeCurrentSessionId();
               break;
            case "1":
               trace("not logged in");
               GameEngine.initTitleScreen();
               break;
            case "2":
               trace("incorrect magic number");
               GameEngine.initTitleScreen();
               break;
            case "3":
               trace("character not found on server");
               GameEngine.initTitleScreen();
               TitleUI.instance.switchToReady();
         }
      }
      
      internal function loadCharDataIOError(event:IOErrorEvent) : void
      {
         trace("Error loading user data.");
         GameEngine.initTitleScreen();
         TitleUI.instance.switchToReady();
      }
      
      public function saveAllCharData() : *
      {
         this.saveCharCookieData();
         if(this.offlineMode)
         {
            trace("offline save user data complete");
            this.resetDataModified();
         }
         else
         {
            this.markAllDataModified();
            this.saveModifiedCharData(true);
         }
      }
      
      public function saveModifiedCharData(saveAll:Boolean = false) : *
      {
         var flag:Boolean = false;
         var i:* = undefined;
         var request:URLRequest = null;
         var loader:URLLoader = null;
         var variables:URLVariables = null;
         if(!this.checkCurrentSessionId())
         {
            OverworldHUD.instance.showMultipleClients();
            return;
         }
         StatsManager.resetPingCounter();
         this.saveCharCookieData();
         if(this.offlineMode)
         {
            trace("offline save user data complete.");
            this.resetDataModified();
         }
         else
         {
            flag = false;
            for(i = 0; i < DATASLOTS; i++)
            {
               if(this.dataModified[i])
               {
                  flag = true;
               }
            }
            if(!flag)
            {
               return;
            }
            trace("saving data");
            request = new URLRequest(this.server + "savedata.php");
            loader = new URLLoader();
            loader.dataFormat = URLLoaderDataFormat.VARIABLES;
            variables = new URLVariables();
            variables.charname = StatsManager.charname;
            variables.magicnum = this.magicnum;
            if(this.dataModified[0])
            {
               variables.playerlevel = StatsManager.getPlayerLevelString();
            }
            if(this.dataModified[1])
            {
               variables.playerstats = StatsManager.getPlayerStatsString();
               variables.battlestats = StatsManager.getBattleStatsString();
            }
            if(this.dataModified[2])
            {
               variables.equipment = StatsManager.getEquipmentString();
            }
            if(this.dataModified[3])
            {
               variables.skillstats = StatsManager.getSkillStatsString();
            }
            if(this.dataModified[4])
            {
               variables.inventory = StatsManager.getInventoryString();
            }
            if(this.dataModified[5])
            {
               variables.questitems = StatsManager.getQuestItemsString();
            }
            if(this.dataModified[6])
            {
               variables.intstats = StatsManager.getIntStatsString();
            }
            if(this.dataModified[7])
            {
               variables.booleanstats = StatsManager.getBooleanStatsString();
            }
            if(this.dataModified[8])
            {
               variables.activequest = StatsManager.getActiveQuestString();
            }
            if(this.dataModified[9])
            {
               variables.completedquest = StatsManager.getCompletedQuestString();
            }
            if(this.dataModified[10])
            {
               variables.playerlocation = StatsManager.getLocationString();
            }
            if(this.dataModified[11])
            {
               variables.taunt = StatsManager.getTaunt();
            }
            if(this.dataModified[12] && StatsManager.usePlayerIO && !QueryManagerPIO.instance.isMigrator)
            {
               variables.friends = StatsManager.getFriendListString();
            }
            if(this.dataModified[14])
            {
               variables.skillslots = StatsManager.getSkillSlotsString();
            }
            if(this.dataModified[15])
            {
               variables.side = StatsManager.getSide();
            }
            if(this.dataModified[16])
            {
               variables.playerdan = StatsManager.getPlayerDanString();
            }
            if(this.dataModified[17])
            {
               variables.stash = StatsManager.getStashString();
            }
            if(this.dataModified[19])
            {
               variables.achievementstats = StatsManager.getAchievementStatsString();
            }
            if(StatsManager.nextAPUpdate != this.lastAPUpdate)
            {
               variables.apupdate = StatsManager.nextAPUpdate;
               this.lastAPUpdate = StatsManager.nextAPUpdate;
            }
            if(StatsManager.nextDTUpdate != this.lastDTUpdate)
            {
               variables.dtupdate = StatsManager.nextDTUpdate;
               this.lastDTUpdate = StatsManager.nextDTUpdate;
            }
            if(StatsManager.nextWarTurn != this.lastWarTurn)
            {
               variables.warupdate = StatsManager.nextWarTurn;
               this.lastWarTurn = StatsManager.nextWarTurn;
            }
            if(this.debug)
            {
               variables.debug = 1;
            }
            this.resetDataModified();
            request.data = variables;
            request.method = URLRequestMethod.POST;
            loader.addEventListener(IOErrorEvent.IO_ERROR,this.saveCharDataIOError,false,0,true);
            loader.load(request);
            this.saveLastUpdate();
         }
      }
      
      internal function saveCharDataIOError(event:IOErrorEvent) : void
      {
         trace("Error saving user data.");
         this.markAllDataModified();
      }
      
      public function saveReplay(name1:String, name2:String, data:String, win:int) : *
      {
         var request:URLRequest = new URLRequest(this.server + "savereplay.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.name1 = name1;
         variables.name2 = name2;
         variables.magicnum = this.magicnum;
         variables.data = data;
         variables.win = win;
         if(this.debug)
         {
            variables.debug = 1;
         }
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.saveReplayComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.saveReplayIOError,false,0,true);
         loader.load(request);
      }
      
      internal function saveReplayComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               trace("save replay complete");
               WinUI.instance.replaySaved();
               LoseUI.instance.replaySaved();
               if(StatsManager.isFacebook())
               {
                  this.shareDuelTV();
               }
               break;
            case "1":
               trace("not logged in");
               break;
            case "2":
               trace("incorrect magic number");
         }
      }
      
      internal function saveReplayIOError(event:IOErrorEvent) : void
      {
         trace("Error saving replay.");
      }
      
      public function getReplay(id:String) : *
      {
         GameEngine.showLoadingScreen();
         var request:URLRequest = new URLRequest(this.server + "getreplay.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.magicnum = this.magicnum;
         variables.id = id;
         if(this.debug)
         {
            variables.debug = 1;
         }
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.getReplayComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.getReplayIOError,false,0,true);
         loader.load(request);
      }
      
      public function getReplayByName(charname:String) : *
      {
         GameEngine.showLoadingScreen();
         var request:URLRequest = new URLRequest(this.server + "getreplay.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.magicnum = this.magicnum;
         variables.name = charname;
         if(this.debug)
         {
            variables.debug = 1;
         }
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.getReplayComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.getReplayIOError,false,0,true);
         loader.load(request);
      }
      
      internal function getReplayComplete(event:Event) : void
      {
         GameEngine.hideLoadingScreen();
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               trace("get replay complete");
               NetworkManager.instance.playRecording(vars.data);
               break;
            case "1":
               trace("not logged in");
               if(GameEngine.isPlayBackClient())
               {
                  this.getReplay("0");
               }
               break;
            case "2":
               trace("incorrect magic number");
               if(GameEngine.isPlayBackClient())
               {
                  this.getReplay("0");
               }
               break;
            case "3":
               trace("not found");
               if(GameEngine.isPlayBackClient())
               {
                  this.getReplay("0");
               }
               else
               {
                  OverworldHUD.instance.showDialog(LangManager.getString(484),LangManager.getString(5));
               }
         }
      }
      
      internal function getReplayIOError(event:IOErrorEvent) : void
      {
         GameEngine.hideLoadingScreen();
         trace("Error get replay.");
      }
      
      public function updateGlobalVar(varid:int, value:int) : *
      {
         OverworldHUD.instance.globalVarDialog.addGlobalVar(varid,value);
         if(StatsManager.skipUpdateGlobalVar || this.offlineMode)
         {
            trace("skipping global var update: " + varid + " " + value);
            return;
         }
         if(varid == 50005 || varid == 50006)
         {
            return;
         }
         var request:URLRequest = new URLRequest(this.server + "updateglobalvar.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.charid = StatsManager.id;
         variables.magicnum = this.magicnum;
         variables.varid = varid;
         variables.value = value;
         if(this.debug)
         {
            variables.debug = 1;
         }
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.updateGlobalVarComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.updateGlobalVarIOError,false,0,true);
         loader.load(request);
      }
      
      internal function updateGlobalVarComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               trace("update global var complete");
               break;
            case "1":
               trace("not logged in");
               break;
            case "2":
               trace("incorrect magic number");
         }
      }
      
      internal function updateGlobalVarIOError(event:IOErrorEvent) : void
      {
         trace("Error saving updating global var.");
      }
      
      public function getGlobalVar(varid:int) : *
      {
         if(this.offlineMode)
         {
            return;
         }
         var request:URLRequest = new URLRequest(this.server + "getglobalvar.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.magicnum = this.magicnum;
         variables.varid = varid;
         if(this.debug)
         {
            variables.debug = 1;
         }
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.getGlobalVarComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.getGlobalVarIOError,false,0,true);
         loader.load(request);
      }
      
      internal function getGlobalVarComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               trace("get global var complete");
               trace(vars.key + vars.value);
               break;
            case "1":
               trace("not logged in");
               break;
            case "2":
               trace("incorrect magic number");
         }
      }
      
      internal function getGlobalVarIOError(event:IOErrorEvent) : void
      {
         trace("Error get global var.");
      }
      
      public function updateTownProsperity(value:int) : *
      {
         var territory:Point = NodeGenerator.instance.getTerritory(QuestGenerator.instance.currentNPCNodeId);
         var side:int = StatsManager.getSide();
         OverworldHUD.instance.globalVarDialog.updateTownProsperity(value,side,territory.x,territory.y);
         if(StatsManager.skipUpdateGlobalVar || this.offlineMode || NodeGenerator.instance.isNoChangeTown(territory.x << 12 | territory.y))
         {
            trace("skipping town prosperity update: (" + (territory.x - 341) + "," + (territory.y - 341) + ") " + value);
            return;
         }
         var request:URLRequest = new URLRequest(this.server + "/town/updatetownprosperity.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.charid = StatsManager.id;
         variables.magicnum = this.magicnum;
         variables.tx = territory.x;
         variables.ty = territory.y;
         variables.side = side;
         variables.value = value;
         if(this.debug)
         {
            variables.debug = 1;
         }
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.updateTownProsperityComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.updateTownProsperityIOError,false,0,true);
         loader.load(request);
      }
      
      internal function updateTownProsperityComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               trace("update town prosperity complete");
               break;
            case "1":
               trace("not logged in");
               break;
            case "2":
               trace("incorrect magic number");
         }
      }
      
      internal function updateTownProsperityIOError(event:IOErrorEvent) : void
      {
         trace("Error updating town prosperity.");
      }
      
      public function createTown(territoryx:int, territoryy:int, townname:String = "") : *
      {
         if(this.offlineMode)
         {
            return;
         }
         var request:URLRequest = new URLRequest(this.server + "/town/createtown.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.charid = StatsManager.id;
         variables.magicnum = this.magicnum;
         variables.x = territoryx;
         variables.y = territoryy;
         variables.name = townname;
         variables.founder = StatsManager.charname;
         variables.side = StatsManager.getSide();
         if(this.debug)
         {
            variables.debug = 1;
         }
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.createTownComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.createTownIOError,false,0,true);
         loader.load(request);
      }
      
      internal function createTownComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               trace("create town complete");
               break;
            case "1":
               trace("not logged in");
               break;
            case "2":
               trace("incorrect magic number");
         }
      }
      
      internal function createTownIOError(event:IOErrorEvent) : void
      {
         trace("Error create town.");
      }
      
      public function getTownData(territoryx:int, territoryy:int) : *
      {
         if(this.offlineMode)
         {
            return;
         }
         var request:URLRequest = new URLRequest(this.server + "/town/gettowndata.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.magicnum = this.magicnum;
         variables.x = territoryx;
         variables.y = territoryy;
         if(this.debug)
         {
            variables.debug = 1;
         }
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.getTownDataComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.getTownDataIOError,false,0,true);
         loader.load(request);
      }
      
      internal function getTownDataComplete(event:Event) : void
      {
         var territory:Point = null;
         var territoryData:TerritoryData = null;
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               trace("get town data complete");
               territory = NodeGenerator.instance.getTerritory(StageManager.getCurrentNode());
               territoryData = NodeGenerator.instance.getTerritoryData(territory.x,territory.y,true);
               territoryData.setTerrExtraData(vars.data,null);
               territoryData.showTownData();
               break;
            case "1":
               trace("not logged in");
               break;
            case "2":
               trace("incorrect magic number");
         }
      }
      
      internal function getTownDataIOError(event:IOErrorEvent) : void
      {
         trace("Error get town data.");
      }
      
      public function createSpawnPoint(mapid:int, side:int, territoryx:int, territoryy:int, controlPointStr:String, hasTown:Boolean) : *
      {
         if(this.offlineMode)
         {
            return;
         }
         var request:URLRequest = new URLRequest(this.server + "/war/spawnpointcreate.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.magicnum = this.magicnum;
         variables.x = territoryx;
         variables.y = territoryy;
         variables.side = side;
         variables.mapid = mapid;
         variables.cp = controlPointStr;
         variables.hasTown = hasTown;
         if(this.debug)
         {
            variables.debug = 1;
         }
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.createSpawnPointComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.createSpawnPointIOError,false,0,true);
         loader.load(request);
      }
      
      internal function createSpawnPointComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               trace("create spawn point complete");
               break;
            case "1":
               trace("not logged in");
               break;
            case "2":
               trace("incorrect magic number");
         }
         OverworldHUD.instance.warUI.warHexUI.createSpawnPointCallBack(vars.status);
      }
      
      internal function createSpawnPointIOError(event:IOErrorEvent) : void
      {
         trace("Error create spawn point.");
      }
      
      public function destroySpawnPoint(mapid:int, territoryx:int, territoryy:int) : *
      {
         if(this.offlineMode)
         {
            return;
         }
         var request:URLRequest = new URLRequest(this.server + "/war/spawnpointdestroy.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.magicnum = this.magicnum;
         variables.x = territoryx;
         variables.y = territoryy;
         variables.mapid = mapid;
         if(this.debug)
         {
            variables.debug = 1;
         }
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.destroySpawnPointComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.destroySpawnPointIOError,false,0,true);
         loader.load(request);
      }
      
      internal function destroySpawnPointComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               trace("destroy spawn point complete");
               OverworldHUD.instance.warUI.warHexUI.createSpawnPointCallBack(10);
               break;
            case "1":
               trace("not logged in");
               break;
            case "2":
               trace("incorrect magic number");
         }
      }
      
      internal function destroySpawnPointIOError(event:IOErrorEvent) : void
      {
         trace("Error destroy spawn point.");
      }
      
      public function getTerritoryData(terrX:int, terrY:int) : *
      {
         if(this.offlineMode)
         {
            NodeGenerator.instance.gotTerritoryData(terrX,terrY,"0");
            return;
         }
         var request:URLRequest = new URLRequest(this.server + "/town/getterritorydata.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.magicnum = this.magicnum;
         variables.x = terrX;
         variables.y = terrY;
         if(this.debug)
         {
            variables.debug = 1;
         }
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.getTerritoryDataComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.getTerritoryDataIOError,false,0,true);
         loader.load(request);
      }
      
      internal function getTerritoryDataComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               trace("get territory data complete:" + vars.x + "," + vars.y);
               NodeGenerator.instance.gotTerritoryData(vars.x,vars.y,vars.data);
               break;
            case "1":
               trace("not logged in");
               break;
            case "2":
               trace("incorrect magic number");
         }
      }
      
      internal function getTerritoryDataIOError(event:IOErrorEvent) : void
      {
         trace("Error get territory data");
      }
      
      public function getTerritoryGroupData(terrX:int, terrY:int) : *
      {
         if(this.offlineMode)
         {
            NodeGenerator.instance.gotTerritoryGroupData(terrX,terrY,"0|0|0|0|0|0|0|0|0");
            return;
         }
         var request:URLRequest = new URLRequest(this.server + "/town/getterritorygroupdata.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.magicnum = this.magicnum;
         variables.x = terrX;
         variables.y = terrY;
         if(this.debug)
         {
            variables.debug = 1;
         }
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.getTerritoryGroupDataComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.getTerritoryGroupDataIOError,false,0,true);
         loader.load(request);
      }
      
      internal function getTerritoryGroupDataComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               trace("get territory group data complete:" + vars.x + "," + vars.y);
               NodeGenerator.instance.gotTerritoryGroupData(vars.x,vars.y,vars.data);
               break;
            case "1":
               trace("not logged in");
               break;
            case "2":
               trace("incorrect magic number");
         }
      }
      
      internal function getTerritoryGroupDataIOError(event:IOErrorEvent) : void
      {
         trace("Error get territory group data");
      }
      
      public function reportHack(details:String) : *
      {
         if(this.offlineMode)
         {
            return;
         }
         if(this.hackReported)
         {
            return;
         }
         OverworldHUD.instance.showCorrupted();
         var request:URLRequest = new URLRequest(this.server + "rh.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.magicnum = this.magicnum;
         variables.charname = StatsManager.charname;
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.reportHackComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.reportHackIOError,false,0,true);
         loader.load(request);
      }
      
      internal function reportHackComplete(event:Event) : void
      {
         this.hackReported = true;
      }
      
      internal function reportHackIOError(event:IOErrorEvent) : void
      {
         trace("Error r h");
      }
      
      public function reportGotGold(num:int, method:String) : *
      {
         if(StatsManager.skipUpdateGlobalVar || this.offlineMode)
         {
            return;
         }
         var request:URLRequest = new URLRequest(this.server + "/playerio/reportgotgold.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.charname = StatsManager.charname;
         variables.num = num;
         variables.method = method;
         variables.level = StatsManager.getLevel() + StatsManager.getPlayerStats(StatsManager.STAT_DAN) * 80;
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.load(request);
      }
      
      public function reportPremiumBuy(id:int, str:String, cost:int) : *
      {
         if(StatsManager.skipUpdateGlobalVar || this.offlineMode || StatsManager.consoleEnabled)
         {
            return;
         }
         var request:URLRequest = new URLRequest(this.server + "reportpremiumbuy.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.magicnum = this.magicnum;
         variables.charname = StatsManager.charname;
         variables.id = id;
         variables.str = str;
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.reportPremiumBuyComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.reportPremiumBuyIOError,false,0,true);
         loader.load(request);
      }
      
      internal function reportPremiumBuyComplete(event:Event) : void
      {
         trace("report premium buy complete");
      }
      
      internal function reportPremiumBuyIOError(event:IOErrorEvent) : void
      {
         trace("Error report premium buy");
      }
      
      public function getDiscount() : *
      {
         if(this.offlineMode)
         {
            return;
         }
         var request:URLRequest = new URLRequest(this.server + "getdiscount.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.magicnum = this.magicnum;
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.getDiscountComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.getDiscountIOError,false,0,true);
         loader.load(request);
      }
      
      internal function getDiscountComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               OverworldHUD.instance.payUI.gotDiscount(vars.discount,vars.expire);
               break;
            case "1":
               trace("not logged in");
               break;
            case "2":
               trace("incorrect magic number");
         }
      }
      
      internal function getDiscountIOError(event:IOErrorEvent) : void
      {
         trace("Error get discount");
      }
      
      public function whois(charname:String) : *
      {
         if(this.offlineMode)
         {
            return;
         }
         var request:URLRequest = new URLRequest(this.server + "whois.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.magicnum = this.magicnum;
         variables.charname = charname;
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.whoisComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.whoisIOError,false,0,true);
         loader.load(request);
      }
      
      internal function whoisComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               OverworldHUD.instance.updateChatLogWordsOnly(vars.char + " is " + vars.alts);
               break;
            case "1":
               trace("not logged in");
               break;
            case "2":
               trace("incorrect magic number");
         }
      }
      
      internal function whoisIOError(event:IOErrorEvent) : void
      {
         trace("Error whois");
      }
      
      public function changeName(newname:String) : *
      {
         if(this.offlineMode)
         {
            return;
         }
         var request:URLRequest = new URLRequest(this.server + "changename.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.magicnum = this.magicnum;
         variables.oldname = StatsManager.charname;
         variables.newname = newname;
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.changeNameComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.changeNameIOError,false,0,true);
         loader.load(request);
      }
      
      internal function changeNameComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               OverworldHUD.instance.changeNameDialog.changeSuccessful();
               break;
            case "3":
               OverworldHUD.instance.changeNameDialog.changeError(3);
               break;
            case "1":
               trace("not logged in");
               break;
            case "2":
               trace("incorrect magic number");
         }
      }
      
      internal function changeNameIOError(event:IOErrorEvent) : void
      {
         trace("Error changename");
      }
      
      public function getPlayerLocation(charname:String) : *
      {
         if(this.offlineMode)
         {
            return;
         }
         var request:URLRequest = new URLRequest(this.server + "getplayerlocation.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.magicnum = this.magicnum;
         variables.charname = charname;
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.getPlayerLocationComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.getPlayerLocationIOError,false,0,true);
         loader.load(request);
      }
      
      internal function getPlayerLocationComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         if(this.debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               OverworldHUD.instance.chatText.words.text = vars.location;
               break;
            case "1":
               trace("not logged in");
               break;
            case "2":
               trace("incorrect magic number");
         }
      }
      
      internal function getPlayerLocationIOError(event:IOErrorEvent) : void
      {
         trace("Error getPlayerLocation");
      }
      
      internal function saveCharCookieData() : *
      {
         trace("save cookie data");
         var adSharedObject:SharedObject = SharedObject.getLocal(StatsManager.cookieName);
         adSharedObject.data.playerlevel = StatsManager.getPlayerLevelString();
         adSharedObject.data.dan = StatsManager.getPlayerStats(StatsManager.STAT_DAN);
         adSharedObject.data.purchases = StatsManager.purchasesMade.getIntValue();
         adSharedObject.data.saved = true;
         adSharedObject.flush();
         var sharedObject:SharedObject = SharedObject.getLocal(StatsManager.cookieName + "_" + StatsManager.charname);
         sharedObject.data.saved = true;
         if(!this.offlineMode)
         {
            sharedObject.data.equipment = StatsManager.getEquipmentString();
            sharedObject.data.playerlevel = StatsManager.getPlayerLevelString();
         }
         else
         {
            sharedObject.data.nextAPUpdate = StatsManager.nextAPUpdate;
            sharedObject.data.nextDTUpdate = StatsManager.nextDTUpdate;
            sharedObject.data.lastUpdate = this.lastUpdate;
            sharedObject.data.playerlevel = StatsManager.getPlayerLevelString();
            sharedObject.data.playerStats = StatsManager.getPlayerStatsString();
            sharedObject.data.equipment = StatsManager.getEquipmentString();
            sharedObject.data.skillStats = StatsManager.getSkillStatsString();
            sharedObject.data.skillSlots = StatsManager.getSkillSlotsString();
            sharedObject.data.inventory = StatsManager.getInventoryString();
            sharedObject.data.stash = StatsManager.getStashString();
            sharedObject.data.questItems = StatsManager.getQuestItemsString();
            sharedObject.data.intStats = StatsManager.getIntStatsString();
            sharedObject.data.achievementStats = StatsManager.getAchievementStatsString();
            sharedObject.data.booleanStats = StatsManager.getBooleanStatsString();
            sharedObject.data.activeQuestList = StatsManager.getActiveQuestString();
            sharedObject.data.completedQuestList = StatsManager.getCompletedQuestString();
            sharedObject.data.playerlocation = StatsManager.getLocationString();
            sharedObject.data.taunt = StatsManager.getTaunt();
            sharedObject.data.friends = StatsManager.getFriendListString();
         }
         sharedObject.flush();
         this.saveCharName();
      }
      
      internal function deleteCharCookieData(charname:String) : *
      {
         trace("delete cookie data");
         var sharedObject:SharedObject = SharedObject.getLocal(StatsManager.cookieName + "_" + charname);
         sharedObject.data.saved = false;
         sharedObject.data.nextAPUpdate = "";
         sharedObject.data.nextDTUpdate = "";
         sharedObject.data.lastUpdate = "";
         sharedObject.data.playerLevel = "";
         sharedObject.data.playerStats = "";
         sharedObject.data.equipment = "";
         sharedObject.data.skillStats = "";
         sharedObject.data.skillSlots = "";
         sharedObject.data.inventory = "";
         sharedObject.data.stash = "";
         sharedObject.data.questItems = "";
         sharedObject.data.intStats = "";
         sharedObject.data.achievementStats = "";
         sharedObject.data.booleanStats = "";
         sharedObject.data.activeQuestList = "";
         sharedObject.data.completedQuestList = "";
         sharedObject.data.playerlocation = "";
         sharedObject.data.taunt = "";
         sharedObject.data.friends = "";
         sharedObject.flush();
      }
      
      internal function loadCharCookieData() : *
      {
         trace("load cookie data");
         var sharedObject:SharedObject = SharedObject.getLocal(StatsManager.cookieName + "_" + StatsManager.charname);
         if(sharedObject.data.saved != true)
         {
            return;
         }
         StatsManager.nextAPUpdate = sharedObject.data.nextAPUpdate;
         StatsManager.nextDTUpdate = sharedObject.data.nextDTUpdate;
         this.lastUpdate = sharedObject.data.lastUpdate;
         if(sharedObject.data.playerStats != "")
         {
            StatsManager.parsePlayerStatsString(sharedObject.data.playerStats);
         }
         if(sharedObject.data.equipment != "")
         {
            StatsManager.parseEquipmentString(sharedObject.data.equipment);
         }
         if(sharedObject.data.skillStats != "")
         {
            StatsManager.parseSkillStatsString(sharedObject.data.skillStats);
         }
         if(sharedObject.data.skillSlots != "")
         {
            StatsManager.parseSkillSlotsString(sharedObject.data.skillSlots);
         }
         if(sharedObject.data.inventory != "")
         {
            StatsManager.parseInventoryString(sharedObject.data.inventory);
         }
         if(sharedObject.data.stash != "")
         {
            StatsManager.parseStashString(sharedObject.data.stash);
         }
         if(sharedObject.data.questItems != "")
         {
            StatsManager.parseQuestItemsString(sharedObject.data.questItems);
         }
         if(sharedObject.data.intStats != "")
         {
            StatsManager.parseIntStatsString(sharedObject.data.intStats);
         }
         if(sharedObject.data.achievementStats != "")
         {
            StatsManager.parseAchievementStatsString(sharedObject.data.achievementStats);
         }
         if(sharedObject.data.booleanStats != "")
         {
            StatsManager.parseBooleanStatsString(sharedObject.data.booleanStats);
         }
         if(sharedObject.data.activeQuestList != "")
         {
            StatsManager.setActiveQuestString(sharedObject.data.activeQuestList);
         }
         if(sharedObject.data.completedQuestList != "")
         {
            StatsManager.parseCompletedQuestString(sharedObject.data.completedQuestList);
         }
         if(sharedObject.data.taunt != "")
         {
            StatsManager.setTaunt(sharedObject.data.taunt);
         }
         StatsManager.parseFriendListString(sharedObject.data.friends);
      }
      
      internal function saveLogin(user:String, pass:String) : *
      {
         if(user == "" || user == "guest" || pass == "")
         {
            return;
         }
         var sharedObject:SharedObject = SharedObject.getLocal(StatsManager.cookieName);
         sharedObject.data.saved = true;
         sharedObject.data.user = user;
         sharedObject.data.pass = pass;
         sharedObject.flush();
      }
      
      internal function clearAutoLogin() : *
      {
         var sharedObject:SharedObject = SharedObject.getLocal(StatsManager.cookieName);
         sharedObject.data.saved = true;
         sharedObject.data.user = "";
         sharedObject.data.pass = "";
         sharedObject.data.accesstoken = "";
         sharedObject.flush();
      }
      
      public function getSavedOptions() : *
      {
         var sharedObject:SharedObject = SharedObject.getLocal(StatsManager.cookieName);
         if(sharedObject.data.saved != true)
         {
            ResourceManager.loadMusicResource();
            SoundManager.instance.playMusic(MusicManager.MUSIC_QUIET);
            ResourceManager.loadSoundResource();
            return false;
         }
         if(sharedObject.data.hasMusic != undefined)
         {
            SoundManager.instance.hasMusic = sharedObject.data.hasMusic;
         }
         if(SoundManager.instance.hasMusic)
         {
            ResourceManager.loadMusicResource();
         }
         SoundManager.instance.playMusic(MusicManager.MUSIC_QUIET);
         if(sharedObject.data.hasSound != undefined)
         {
            SoundManager.instance.hasSound = sharedObject.data.hasSound;
         }
         if(SoundManager.instance.hasSound)
         {
            ResourceManager.loadSoundResource();
         }
         if(sharedObject.data.censored != undefined)
         {
            StatsManager.censored = sharedObject.data.censored;
         }
         if(sharedObject.data.hasChatNotification != undefined)
         {
            StatsManager.hasChatNotification = sharedObject.data.hasChatNotification;
         }
         if(sharedObject.data.recordDuels != undefined)
         {
            StatsManager.recordDuels = sharedObject.data.recordDuels;
         }
         if(sharedObject.data.autoAssignStats != undefined)
         {
            StatsManager.autoAssignStats = sharedObject.data.autoAssignStats;
         }
         if(sharedObject.data.showNinjaServant != undefined)
         {
            StatsManager.showNinjaServant = sharedObject.data.showNinjaServant;
         }
      }
      
      public function showAds() : Boolean
      {
         if(StatsManager.isKongregate || StatsManager.consoleEnabled)
         {
            return false;
         }
         var sharedObject:SharedObject = SharedObject.getLocal(StatsManager.cookieName);
         if(sharedObject.data.saved != true)
         {
            return false;
         }
         if((sharedObject.data.playerlevel >= 10 || sharedObject.data.dan > 0) && sharedObject.data.purchases == 0)
         {
            return true;
         }
         return false;
      }
      
      public function autoLogin() : Boolean
      {
         if(StatsManager.offlineModeOnly)
         {
            return false;
         }
         if(this.offlineMode)
         {
            this.login("Guest","pass");
            return true;
         }
         var sharedObject:SharedObject = SharedObject.getLocal(StatsManager.cookieName);
         if(sharedObject.data.saved != true)
         {
            return false;
         }
         var user:String = sharedObject.data.user;
         var pass:String = sharedObject.data.pass;
         if(user != "" && pass != "")
         {
            this.login(user,pass);
            return true;
         }
         return false;
      }
      
      internal function saveCharName() : *
      {
         var sharedObject:SharedObject = SharedObject.getLocal(StatsManager.cookieName);
         sharedObject.data.saved = true;
         sharedObject.data.charname = StatsManager.charname;
         sharedObject.flush();
      }
      
      internal function clearCharName() : *
      {
         var sharedObject:SharedObject = SharedObject.getLocal(StatsManager.cookieName);
         sharedObject.data.saved = true;
         sharedObject.data.charname = "";
         sharedObject.flush();
      }
      
      internal function saveOptions() : *
      {
         var sharedObject:SharedObject = SharedObject.getLocal(StatsManager.cookieName);
         sharedObject.data.saved = true;
         sharedObject.data.hasMusic = SoundManager.instance.hasMusic;
         sharedObject.data.hasSound = SoundManager.instance.hasSound;
         sharedObject.data.censored = StatsManager.censored;
         sharedObject.data.hasChatNotification = StatsManager.hasChatNotification;
         sharedObject.data.recordDuels = StatsManager.recordDuels;
         sharedObject.data.autoSlash = StatsManager.autoSlash;
         sharedObject.data.autoAssignStats = StatsManager.autoAssignStats;
         sharedObject.data.showNinjaServant = StatsManager.showNinjaServant;
         sharedObject.data.doFullScreen = StatsManager.doFullScreen;
         sharedObject.flush();
         QueryManager.instance.reportDataModified(StatsManager.OPTIONS);
      }
      
      internal function getLastCharacterEquipmentString() : String
      {
         var sharedObject:SharedObject = null;
         var charname:String = null;
         try
         {
            sharedObject = SharedObject.getLocal(StatsManager.cookieName);
            if(sharedObject.data.saved != true)
            {
               return "";
            }
            charname = sharedObject.data.charname;
            sharedObject = SharedObject.getLocal(StatsManager.cookieName + "_" + charname);
            if(sharedObject.data.saved != true)
            {
               return "";
            }
            return sharedObject.data.equipment;
         }
         catch(errObject:Error)
         {
            trace("getLastCharacterEquipmentString error");
            return "";
         }
      }
      
      internal function showWebsite(url:String) : *
      {
         var request:URLRequest = new URLRequest(url);
         try
         {
            navigateToURL(request,"_blank");
         }
         catch(e:Error)
         {
            trace("Error occurred!");
         }
      }
      
      internal function showWebsiteOnThisPage(url:String) : *
      {
         var request:URLRequest = new URLRequest(url);
         try
         {
            navigateToURL(request);
         }
         catch(e:Error)
         {
            trace("Error occurred!");
         }
      }
      
      public function showEBWebsite() : *
      {
         this.showWebsite("http://www.explosivebarrel.net");
      }
      
      public function showPlayOnlineWebsite() : *
      {
         if(LangManager.getLanguage() == LangManager.CHINESE)
         {
            this.showWebsite("http://gamebox.catv.net/");
         }
         else
         {
            this.showWebsite("http://www.facebook.com/strawhatsamuraiduels/");
         }
      }
      
      internal function storeCurrentSessionId() : *
      {
         if(StatsManager.canMultiClient || GameEngine.isPlayBackClient() || this.offlineMode)
         {
            return;
         }
         var sharedObject:SharedObject = SharedObject.getLocal(StatsManager.cookieName,"/");
         this.sessionID = Math.random() * 10000;
         sharedObject.data.current = this.sessionID;
         sharedObject.flush();
      }
      
      internal function checkCurrentSessionId() : Boolean
      {
         if(StatsManager.canMultiClient || GameEngine.isPlayBackClient() || this.offlineMode)
         {
            return true;
         }
         if(OverworldHUD.instance == null)
         {
            return true;
         }
         var sharedObject:SharedObject = SharedObject.getLocal(StatsManager.cookieName,"/");
         return sharedObject.data.current == this.sessionID;
      }
      
      internal function shareDuelTV() : *
      {
         ExternalInterface.call("shareDuelTVOnWall",StatsManager.charname);
      }
   }
}

