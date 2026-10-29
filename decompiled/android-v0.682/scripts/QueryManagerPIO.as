package
{
   import Facebook.*;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.net.SharedObject;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import playerio.*;
   
   public class QueryManagerPIO extends QueryManagerBase
   {
      
      public static var instance:QueryManagerPIO;
      
      internal static var WAR_TERRITORYOWNERS:int = 0;
      
      internal static var WAR_SELFSENTRY:int = 1;
      
      internal static var WAR_SPAWNPOINTS:int = 2;
      
      internal static var WAR_NEXTUPDATE:int = 3;
      
      internal static var WAR_MAINTENANCE:int = 4;
      
      public static var WORLDSTATESTR_ASCIIADD:int = 32;
      
      internal var client:Client;
      
      internal var playerObj:DatabaseObject = null;
      
      internal var playerData:DatabaseObject = null;
      
      internal var battleData:DatabaseObject = null;
      
      public var gameid:String = "straw-hat-samurai-duels-5nsekxalfuoiuqdxrmtxw";
      
      internal var needEmailVerification:Boolean = false;
      
      internal var partnerPay:String = "";
      
      internal var doMigration:Boolean = false;
      
      internal var isMigrator:Boolean = false;
      
      public var facebookTokenLogin:Boolean = false;
      
      internal var noPayVault:Boolean = false;
      
      internal var charDataString:String;
      
      internal var sqlLastUpdate:String;
      
      internal var migrationSaveCheckNum:int = 0;
      
      internal var piolastAPUpdate:int;
      
      internal var piolastDTUpdate:int;
      
      internal var piolastWarTurn:int;
      
      internal var loadChecks:int;
      
      internal var opponentCache:Array = null;
      
      internal var opponentCacheCreated:int = 0;
      
      internal var currentPage:int = 0;
      
      internal var nextStart:int;
      
      internal var hasNextPage:Boolean;
      
      internal var hasPrevPage:Boolean;
      
      internal var pages:Array;
      
      internal var warmapData:Array = new Array();
      
      internal var warmapDataCounter:int = 0;
      
      internal var clanDataCache:IntMap = new IntMap();
      
      public function QueryManagerPIO()
      {
         super();
         server = StatsManager.server;
         instance = this;
         if(StatsManager.usePlayerIODevServer)
         {
            this.gameid = "straw-hat-samurai-duels-no1ygg8lk6xmk5txblnwa";
         }
      }
      
      public function getResourceURL(str:String) : String
      {
         if(StatsManager.useTestData)
         {
            return PlayerIO.gameFS(this.gameid).getUrl("/testres/" + str);
         }
         return PlayerIO.gameFS(this.gameid).getUrl("/res/" + str);
      }
      
      public function getStringsDir() : String
      {
         if(StatsManager.useTestData)
         {
            return PlayerIO.gameFS(this.gameid).getUrl("/testlang/");
         }
         return PlayerIO.gameFS(this.gameid).getUrl("/lang/");
      }
      
      public function getDataXML(str:String) : String
      {
         if(StatsManager.useTestData)
         {
            return PlayerIO.gameFS(this.gameid).getUrl("/testdata/" + str);
         }
         return PlayerIO.gameFS(this.gameid).getUrl("/data/" + str);
      }
      
      override public function registerUser(user:String, pass:String, email:String, facebookid:String = "") : *
      {
         if(!this.needEmailVerification)
         {
            this.registerPIOUser(user,pass,email,facebookid);
            return;
         }
         var request:URLRequest = new URLRequest(server + "/playerio/registeruser.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.username = user;
         variables.password = pass;
         variables.email = email;
         variables.facebookid = facebookid;
         if(debug)
         {
            variables.debug = 1;
         }
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.registerComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,registerIOError,false,0,true);
         loader.load(request);
      }
      
      override internal function registerComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         switch(vars.status)
         {
            case "0":
               trace("server register ok");
               this.registerPIOUser(TitleUI.instance.register.usernamefield.text,TitleUI.instance.register.password1field.text,TitleUI.instance.register.emailfield.text);
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
      
      public function registerPIOUser(user:String, pass:String, email:String, facebookid:String = "") : *
      {
         PlayerIO.quickConnect.simpleRegister(StatsManager.mainTimeLine.stage,this.gameid,user,pass,email,null,null,null,this.partnerPay,this.registerCompletePIO,this.registerErrorPIO);
         username = user;
      }
      
      internal function registerCompletePIO(client:Client) : *
      {
         if(this.needEmailVerification)
         {
            trace("pio register ok, sending email");
            sendVerify(TitleUI.instance.register.emailfield.text);
            client.bigDB.loadMyPlayerObject(this.gotRegisteredPlayerObj);
         }
         else
         {
            this.handleConnect(client);
         }
      }
      
      internal function gotRegisteredPlayerObj(o:DatabaseObject) : *
      {
         o.emailverified = false;
         o.save();
         TitleUI.instance.register.serverResponse(0);
      }
      
      internal function registerErrorPIO(e:PlayerIORegistrationError) : *
      {
         var str:String = "Error";
         if(e.captchaError != null)
         {
            str = e.captchaError;
         }
         else if(e.emailError != null)
         {
            str = e.emailError;
         }
         else if(e.passwordError != null)
         {
            str = e.passwordError;
         }
         else if(e.usernameError != null)
         {
            str = e.usernameError;
         }
         TitleUI.instance.register.serverErrorMessage(str);
         username = "";
      }
      
      override public function login(user:String, pass:String) : *
      {
         var request:URLRequest = null;
         var loader:URLLoader = null;
         var variables:URLVariables = null;
         if(!this.doMigration)
         {
            this.piologin(user,pass);
            return;
         }
         if(!offlineMode)
         {
            request = new URLRequest(server + "/playerio/getcharmigrationdata.php");
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
            if(debug)
            {
               variables.debug = 1;
            }
            request.data = variables;
            request.method = URLRequestMethod.POST;
            loader.addEventListener(Event.COMPLETE,this.migrationloginComplete,false,0,true);
            loader.addEventListener(IOErrorEvent.IO_ERROR,this.migrationloginIOError,false,0,true);
            loader.load(request);
         }
         else
         {
            this.migrationloginFail();
         }
      }
      
      internal function facebookMigration(_client:Client) : *
      {
         var request:URLRequest = null;
         var loader:URLLoader = null;
         var variables:URLVariables = null;
         trace("facebook migration start");
         this.client = _client;
         if(!offlineMode)
         {
            request = new URLRequest(server + "/playerio/getcharmigrationdata.php");
            loader = new URLLoader();
            loader.dataFormat = URLLoaderDataFormat.VARIABLES;
            variables = new URLVariables();
            variables.fbid = StatsManager.facebookid;
            variables.lang = LangManager.getLanguage();
            variables.ver = StatsManager.clientVersion;
            if(debug)
            {
               variables.debug = 1;
            }
            request.data = variables;
            request.method = URLRequestMethod.POST;
            loader.addEventListener(Event.COMPLETE,this.migrationloginComplete,false,0,true);
            loader.addEventListener(IOErrorEvent.IO_ERROR,this.migrationloginIOError,false,0,true);
            loader.load(request);
         }
         else
         {
            this.migrationloginFail();
         }
      }
      
      internal function migrationloginFail(e:PlayerIOError = null) : *
      {
         if(e != null)
         {
            trace("migrationloginFail: " + e);
         }
         this.isMigrator = false;
         if(StatsManager.facebookid == "")
         {
            this.piologin(TitleUI.instance.login.usernamefield.text,TitleUI.instance.login.passwordfield.text);
         }
         else
         {
            this.handleConnect(this.client);
         }
      }
      
      internal function migrationloginComplete(event:Event) : void
      {
         var vars:URLVariables = null;
         var loader:URLLoader = URLLoader(event.target);
         vars = new URLVariables(loader.data);
         if(debug)
         {
            trace(vars.debug);
         }
         switch(vars.status)
         {
            case "0":
               trace("migration stage 1");
               this.isMigrator = true;
               magicnum = vars.magicnum;
               this.sqlLastUpdate = vars.lastupdate;
               loggedIn = true;
               if(StatsManager.facebookid == "")
               {
                  username = TitleUI.instance.login.usernamefield.text;
               }
               this.charDataString = vars.chars;
               if(StatsManager.facebookid != "")
               {
                  this.migrationPIOConnect(this.client);
               }
               else
               {
                  PlayerIO.quickConnect.simpleConnect(StatsManager.mainTimeLine.stage,this.gameid,TitleUI.instance.login.usernamefield.text,TitleUI.instance.login.passwordfield.text,this.migrationPIOConnect,function(e:PlayerIOError):*
                  {
                     trace("registering new user for migrator");
                     PlayerIO.quickConnect.simpleRegister(StatsManager.mainTimeLine.stage,gameid,TitleUI.instance.login.usernamefield.text,TitleUI.instance.login.passwordfield.text,vars.email,null,null,null,partnerPay,migrationPIOConnect,migrationloginFail);
                  });
               }
               break;
            default:
               this.migrationloginFail();
         }
      }
      
      internal function migrationPIOConnect(_client:Client) : *
      {
         var strArray:Array;
         var charname:String = null;
         var playerlevel:int = 0;
         var equipment:String = null;
         var battlestats:String = null;
         var skillstats:String = null;
         var taunt:String = null;
         var playerdan:int = 0;
         var side:int = 0;
         var apupdate:int = 0;
         var playerstats:String = null;
         var warupdate:int = 0;
         var dtupdate:int = 0;
         var inventory:String = null;
         var intstats:String = null;
         var skillslots:String = null;
         var booleanstats:String = null;
         var questitems:String = null;
         var friends:String = null;
         var activequest:String = null;
         var created:String = null;
         var completedquest:String = null;
         var purchases:int = 0;
         var location:String = null;
         var type:String = null;
         this.client = _client;
         trace("migration stage 2");
         strArray = this.charDataString.split("$");
         if(strArray.length != 23)
         {
            this.migrationloginFail();
            return;
         }
         trace("migration stage 3");
         charname = strArray[0];
         playerlevel = int(strArray[1]);
         equipment = strArray[2];
         battlestats = strArray[3];
         skillstats = strArray[4];
         taunt = strArray[5];
         playerdan = int(strArray[6]);
         side = int(strArray[7]);
         apupdate = int(strArray[8]);
         playerstats = strArray[9];
         warupdate = int(strArray[10]);
         dtupdate = int(strArray[11]);
         inventory = strArray[12];
         intstats = strArray[13];
         skillslots = strArray[14];
         booleanstats = strArray[15];
         questitems = strArray[16];
         friends = strArray[17];
         activequest = strArray[18];
         created = strArray[19];
         completedquest = strArray[20];
         purchases = int(strArray[21]);
         location = strArray[22];
         type = "migrator";
         this.migrationSaveCheckNum = 0;
         this.client.bigDB.loadMyPlayerObject(function(po:DatabaseObject):*
         {
            trace("migration stage 4");
            if(po.lastupdate == null && po.charname != null || po.lastupdate != null)
            {
               if(true || po.lastupdate > int(sqlLastUpdate) - 120)
               {
                  trace("migration not needed");
                  handleConnect(client);
                  return;
               }
            }
            po.charname = charname;
            po.playerlevel = playerlevel;
            po.equipment = equipment;
            po.skillstats = skillstats;
            po.taunt = taunt;
            po.playerdan = playerdan;
            po.side = side;
            po.apupdate = apupdate;
            po.playerstats = playerstats;
            po.warupdate = warupdate;
            po.dtupdate = dtupdate;
            po.inventory = inventory;
            po.intstats = intstats;
            po.skillslots = skillslots;
            po.booleanstats = booleanstats;
            po.questitems = questitems;
            po.friends = friends;
            po.activequest = activequest;
            po.created = created;
            po.completedquest = completedquest;
            po.purchases = purchases;
            po.location = location;
            po.type = type;
            po.save(false,false,migrationSaveCheck,migrationloginFail);
            client.bigDB.loadKeysOrCreate("playerdata",[charname],function(array:Array):*
            {
               trace("migration stage 5");
               var pdo:DatabaseObject = array[0];
               pdo.playerlevel = playerlevel;
               pdo.equipment = equipment;
               pdo.playerdan = playerdan;
               pdo.side = side;
               pdo.wins = 0;
               pdo.randomindex1 = int(Math.random() * 1000);
               pdo.randomindex2 = int(Math.random() * 1000);
               pdo.type = type;
               pdo.save(false,false,migrationSaveCheck,migrationloginFail);
            },migrationloginFail);
            client.bigDB.loadKeysOrCreate("battledata",[charname],function(array:Array):*
            {
               trace("migration stage 6");
               var bdo:DatabaseObject = array[0];
               bdo.battlestats = battlestats;
               bdo.skillstats = skillstats;
               bdo.taunt = taunt;
               bdo.type = type;
               bdo.save(false,false,migrationSaveCheck,migrationloginFail);
            },migrationloginFail);
         },this.migrationloginFail);
      }
      
      internal function migrationSaveCheck() : *
      {
         ++this.migrationSaveCheckNum;
         if(this.migrationSaveCheckNum == 3)
         {
            trace("migration successful");
            this.handleConnect(this.client);
         }
      }
      
      internal function migrationloginIOError(event:IOErrorEvent) : void
      {
         trace("migration login IO error");
         this.migrationloginFail();
      }
      
      public function spilLogin(spiltoken:String) : *
      {
         var url:String = null;
         var request:URLRequest = null;
         var loader:URLLoader = null;
         if(!offlineMode)
         {
            spiltoken = "UwAB_wAxBAEDhRtDbGgAeQQAUX3mJwgBAAAAAleAc2dpZF8wNDAxMDM4NTFiNDM2YzY4kvrsARwJV1Bva82yQxZeVrvt3GL4qHH5pENmolbKo3eLRQKTBrD3ug";
            url = "http://api.playerio.com/clientintegrations/spilgames/auth?gameid=" + this.gameid + "&token=" + spiltoken;
            request = new URLRequest(url);
            loader = new URLLoader();
            loader.addEventListener(Event.COMPLETE,this.spilLoginComplete,false,0,true);
            loader.addEventListener(IOErrorEvent.IO_ERROR,this.spilLoginIOError,false,0,true);
            loader.load(request);
         }
      }
      
      internal function spilLoginComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var str:String = loader.data;
         var strArray:Array = str.split(/\n/);
         var spilid:String = strArray[0];
         var spiltoken:String = strArray[1];
         PlayerIO.connect(StatsManager.mainTimeLine.stage,this.gameid,"public",strArray[0],strArray[1],this.partnerPay,this.loginCompletePIO,this.loginErrorPIO);
      }
      
      internal function spilLoginIOError(event:Event) : void
      {
         trace("spil login error");
         TitleUI.instance.login.serverResponse(7);
      }
      
      public function piologin(user:String, pass:String) : *
      {
         if(!offlineMode)
         {
            if(StatsManager.impersonateUser)
            {
               PlayerIO.connect(StatsManager.mainTimeLine.stage,this.gameid,"public",user,"",this.partnerPay,this.loginCompletePIO,this.loginErrorPIO);
            }
            else
            {
               PlayerIO.quickConnect.simpleConnect(StatsManager.mainTimeLine.stage,this.gameid,user,pass,this.loginCompletePIO,this.loginErrorPIO);
            }
            username = user;
         }
         else
         {
            loggedIn = true;
            username = "Guest";
            charstring = "";
            TitleUI.instance.login.serverResponse(0);
            saveLastUpdate("1000000");
            NetworkManager.getInstance();
         }
      }
      
      internal function loginCompletePIO(client:Client) : *
      {
         trace("login ok");
         StatsManager.facebookid = "";
         StatsManager.facebookFriends = "";
         this.handleConnect(client);
      }
      
      internal function loginErrorPIO(e:PlayerIOError) : *
      {
         if(!TitleUI.instance.login.visible)
         {
            TitleUI.instance.switchToLogin();
         }
         TitleUI.instance.login.serverErrorMessage(e.message);
         username = "";
         if(e.message == "The user does not exist")
         {
            TitleUI.instance.login.reregistertext.visible = true;
         }
      }
      
      public function loginKongregate(userid:Number, auth:String) : *
      {
         username = "kong" + userid.toString();
         PlayerIO.quickConnect.kongregateConnect(StatsManager.mainTimeLine.stage,this.gameid,userid.toString(),auth,this.loginCompletePIO,this.loginErrorPIO);
      }
      
      internal function loginFacebook() : *
      {
         if(StatsManager.isMobile)
         {
            Mobile.instance.loginFacebook();
            return;
         }
         PlayerIO.quickConnect.facebookOAuthConnectPopup(StatsManager.mainTimeLine.stage,this.gameid,"_blank",["publish_stream","offline_access"],this.partnerPay,function(client:Client, access_token:String, facebookUserId:String):void
         {
            StatsManager.facebookid = facebookUserId;
            var sharedObject:SharedObject = SharedObject.getLocal(StatsManager.cookieName);
            sharedObject.data.saved = true;
            sharedObject.data.accesstoken = access_token;
            sharedObject.flush();
            FB.init({
               "access_token":access_token,
               "app_id":"197461360314820",
               "debug":false
            });
            getFBName(client,access_token);
         });
      }
      
      internal function tokenLoginFacebook(access_token:String) : *
      {
         PlayerIO.quickConnect.facebookOAuthConnect(StatsManager.mainTimeLine.stage,this.gameid,access_token,this.partnerPay,function(client:Client, facebookUserId:String):void
         {
            StatsManager.facebookid = facebookUserId;
            FB.init({
               "access_token":access_token,
               "app_id":"197461360314820",
               "debug":false
            });
            getFBName(client,access_token);
         });
      }
      
      internal function fbLoginError() : *
      {
         trace("facebook login error");
         if(!TitleUI.instance.login.visible)
         {
            TitleUI.instance.switchToLogin();
         }
         clearAutoLogin();
      }
      
      internal function facebookAPI(str:String, access_token:String, successCallback:Function, failCallback:Function) : *
      {
         var request:URLRequest = new URLRequest("https://graph.facebook.com/" + str + "&access_token=" + access_token);
         var loader:URLLoader = new URLLoader();
         request.method = URLRequestMethod.GET;
         loader.addEventListener(Event.COMPLETE,function(event:Event):*
         {
            var loader:URLLoader = URLLoader(event.target);
            var object:Object = FBJSON.deserialize(loader.data);
            successCallback(object);
         },false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,failCallback,false,0,true);
         loader.load(request);
      }
      
      internal function getFBName(client:Client, access_token:String) : *
      {
         this.facebookAPI("me?fields=name",access_token,function(o:Object):*
         {
            username = o.name;
            getFBFriends(client,access_token);
         },function(event:Event):*
         {
            fbLoginError();
         });
      }
      
      internal function getFBFriends(client:Client, access_token:String) : *
      {
         TitleUI.instance.loadingScreenOn();
         StatsManager.facebookFriends = "";
         if(this.doMigration)
         {
            this.facebookMigration(client);
         }
         else
         {
            this.handleConnect(client);
         }
         this.facebookAPI("fql?q=SELECT uid, first_name FROM user WHERE is_app_user = \'1\' AND uid IN (SELECT uid2 FROM friend WHERE uid1=me())",access_token,this.getFBFriendsComplete,function(event:Event):*
         {
            StatsManager.facebookFriends = "";
         });
      }
      
      internal function getFBFriendsComplete(rows:Object) : *
      {
         var i:int;
         var fbnames:Array = null;
         var fbwinscallback:Function = null;
         var fbwinserror:Function = null;
         fbwinscallback = function(array:Array):*
         {
            var o:DatabaseObject = null;
            var amax:int = int(array.length);
            var fbfriendstr:String = "";
            for(var i:* = 0; i < amax; i++)
            {
               o = array[i];
               fbfriendstr += o.key + "," + fbnames[o.key] + "," + o.wins + "," + o.charname + "|";
            }
            StatsManager.facebookFriends = fbfriendstr;
         };
         fbwinserror = function(e:PlayerIOError):*
         {
            trace(e);
            StatsManager.facebookFriends = "";
         };
         var fbwinskeys:Array = new Array();
         fbnames = new Array();
         var max:int = int(rows.data.length);
         for(i = 0; i < max; i++)
         {
            fbwinskeys.push(rows.data[i].uid.toString());
            fbnames[rows.data[i].uid.toString()] = rows.data[i].first_name;
         }
         this.client.bigDB.loadKeys("FBwins",fbwinskeys,fbwinscallback,fbwinserror);
      }
      
      override public function autoLogin() : Boolean
      {
         if(StatsManager.offlineModeOnly)
         {
            return false;
         }
         if(offlineMode)
         {
            this.login("Guest","pass");
            return true;
         }
         var flashVars:Object = GameEngine.getLoaderInfo(StatsManager.mainTimeLine).parameters;
         if(flashVars.fb_access_token != null && flashVars.fb_access_token != "")
         {
            this.tokenLoginFacebook(flashVars.fb_access_token);
            this.facebookTokenLogin = true;
            return true;
         }
         var sharedObject:SharedObject = SharedObject.getLocal(StatsManager.cookieName);
         if(sharedObject.data.saved != true)
         {
            return false;
         }
         var accesstoken:String = sharedObject.data.accesstoken;
         if(accesstoken != null && accesstoken != "")
         {
            this.tokenLoginFacebook(accesstoken);
            return true;
         }
         var user:String = sharedObject.data.user;
         var pass:String = sharedObject.data.pass;
         if(user != null && pass != null && user != "" && pass != "")
         {
            TitleUI.instance.login.usernamefield.text = user;
            TitleUI.instance.login.passwordfield.text = pass;
            this.login(user,pass);
            return true;
         }
         return false;
      }
      
      override public function checkFlashVarsLogin() : *
      {
         var flashVars:Object = GameEngine.getLoaderInfo(StatsManager.mainTimeLine).parameters;
         if(flashVars.fb_access_token != null)
         {
            this.tokenLoginFacebook(flashVars.fb_access_token);
            return;
         }
         trace("no flash vars");
         TitleUI.instance.login.serverResponse(6);
      }
      
      public function checkEmailVerified(username:String) : *
      {
         var request:URLRequest = new URLRequest(server + "/playerio/checkemailverified.php");
         var loader:URLLoader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.VARIABLES;
         var variables:URLVariables = new URLVariables();
         variables.username = username;
         request.data = variables;
         request.method = URLRequestMethod.POST;
         loader.addEventListener(Event.COMPLETE,this.checkEmailVerifiedComplete,false,0,true);
         loader.addEventListener(IOErrorEvent.IO_ERROR,this.checkEmailVerifiedIOError,false,0,true);
         loader.load(request);
      }
      
      internal function checkEmailVerifiedComplete(event:Event) : void
      {
         var loader:URLLoader = URLLoader(event.target);
         var vars:URLVariables = new URLVariables(loader.data);
         switch(vars.status)
         {
            case "0":
               trace("email verified");
               this.playerObj.emailverified = true;
               this.playerObj.save();
               this.gotplayerObj(this.playerObj);
               break;
            case "1":
               trace("email not verified");
               if(StatsManager.useExternalLogin || StatsManager.useFlashVarsLogin)
               {
                  return;
               }
               TitleUI.instance.login.serverResponse(2);
         }
      }
      
      internal function checkEmailVerifiedIOError(event:IOErrorEvent) : void
      {
         trace("Unable to reach server");
         TitleUI.instance.login.serverResponse(3);
      }
      
      internal function handleConnect(client:Client) : *
      {
         if(StatsManager.usePlayerIODevServer)
         {
            client.multiplayer.developmentServer = "localhost:8184";
         }
         this.client = client;
         userid = client.connectUserId;
         client.bigDB.load("GeneralData","motd",function(o:DatabaseObject):*
         {
            if(o.motd != null && o.motd != "")
            {
               TitleUI.instance.showMOTD(o.motd);
            }
            if(!StatsManager.consoleEnabled && o.maintenance != null && Boolean(o.maintenance))
            {
               TitleUI.instance.setLoadingScreenTextBig(LangManager.getString(674));
               return;
            }
            if(o.minversion != null && int(o.minversion * 1000) > int(StatsManager.clientVersion * 1000))
            {
               TitleUI.instance.setLoadingScreenTextBig(LangManager.getString(646));
               return;
            }
            client.bigDB.loadMyPlayerObject(gotplayerObj);
         });
      }
      
      internal function gotplayerObj(obj:DatabaseObject) : *
      {
         this.playerObj = obj;
         if(this.needEmailVerification && this.playerObj.emailverified != null && this.playerObj.emailverified == false)
         {
            this.checkEmailVerified(username);
            return;
         }
         loggedIn = true;
         if(obj.charname == null || obj.charname == "")
         {
            charstring = "";
         }
         else
         {
            charstring = obj.charname + "," + obj.playerlevel;
         }
         if(!this.isMigrator && this.doMigration)
         {
            this.sqlLogin();
         }
         else if(StatsManager.useCirrus && !NetworkManager.getInstance().connected)
         {
            NetworkManager.getInstance();
         }
         else
         {
            TitleUI.instance.login.serverResponse(0);
         }
      }
      
      public function sqlLogin() : *
      {
         var sqlloginComplete:Function = null;
         var sqlloginIOError:Function = null;
         var request:URLRequest = null;
         var loader:URLLoader = null;
         var variables:URLVariables = null;
         sqlloginComplete = function(event:Event):void
         {
            var loader:URLLoader = URLLoader(event.target);
            var vars:URLVariables = new URLVariables(loader.data);
            if(debug)
            {
               trace(vars.debug);
            }
            switch(vars.status)
            {
               case "0":
                  magicnum = vars.magicnum;
                  if(StatsManager.useCirrus && !NetworkManager.getInstance().connected)
                  {
                     NetworkManager.getInstance();
                  }
                  else
                  {
                     TitleUI.instance.login.serverResponse(0);
                  }
                  break;
               default:
                  trace("Unable to reach server: " + vars.status);
                  if(isMigrator)
                  {
                     TitleUI.instance.login.serverResponse(3);
                  }
                  else if(StatsManager.useCirrus && !NetworkManager.getInstance().connected)
                  {
                     NetworkManager.getInstance();
                  }
                  else
                  {
                     TitleUI.instance.login.serverResponse(0);
                  }
            }
         };
         sqlloginIOError = function(event:IOErrorEvent):*
         {
            if(isMigrator)
            {
               TitleUI.instance.login.serverResponse(3);
            }
            else if(StatsManager.useCirrus && !NetworkManager.getInstance().connected)
            {
               NetworkManager.getInstance();
            }
            else
            {
               TitleUI.instance.login.serverResponse(0);
            }
         };
         if(!offlineMode)
         {
            request = new URLRequest(server + "/playerio/login_pio.php");
            loader = new URLLoader();
            loader.dataFormat = URLLoaderDataFormat.VARIABLES;
            variables = new URLVariables();
            variables.username = username;
            variables.userid = userid;
            variables.lang = LangManager.getLanguage();
            if(debug)
            {
               variables.debug = 1;
            }
            request.data = variables;
            request.method = URLRequestMethod.POST;
            loader.addEventListener(Event.COMPLETE,sqlloginComplete,false,0,true);
            loader.addEventListener(IOErrorEvent.IO_ERROR,sqlloginIOError,false,0,true);
            loader.load(request);
         }
      }
      
      override public function logout() : *
      {
         clearAutoLogin();
         loggedIn = false;
         this.playerObj = null;
         this.playerData = null;
         this.battleData = null;
         this.isMigrator = false;
         StatsManager.facebookid = "";
         StatsManager.facebookFriends = "";
         StatsManager.stash = new Vector.<Item>();
         this.isMigrator = false;
         NetworkManager.instance.disconnectGlobalPIO();
      }
      
      override public function createCharacter(charname:String) : *
      {
         if(this.isMigrator)
         {
            TitleUI.instance.charcreate.serverResponse(3);
            TitleUI.instance.charcreate.errormessage.text = "Cannot create character when logged in with this user";
            return;
         }
         if(offlineMode)
         {
            saveAllCharData();
            saveCharName();
            charstring = charname + ",1";
            TitleUI.instance.charcreate.serverResponse(0);
            return;
         }
         this.playerObj.charname = charname;
         this.playerObj.type = "piotester";
         this.playerObj.save();
         NetworkManager.instance.connectGlobalGroupPIO(true);
      }
      
      internal function createCharacterResponse(response:int) : *
      {
         var o:* = undefined;
         if(StatsManager.consoleEnabled && response == 5)
         {
            response = 0;
         }
         if(response != 0)
         {
            TitleUI.instance.charcreate.serverResponse(response);
            this.playerObj.charname = "";
            this.playerObj.save();
         }
         else
         {
            this.playerObj.created = new Date().toUTCString();
            if(StatsManager.facebookid != "" && (this.playerObj.facebookid == null || this.playerObj.facebookid == ""))
            {
               this.playerObj.facebookid = StatsManager.facebookid;
            }
            saveAllCharData();
            charstring = this.playerObj.charname + ",1";
            o = new Object();
            o.playerlevel = 1;
            o.type = "piotester";
            o.equipment = StatsManager.getEquipmentString();
            this.client.bigDB.createObject("PlayerData",this.playerObj.charname,o);
            TitleUI.instance.charcreate.serverResponse(0);
         }
      }
      
      override public function saveModifiedCharData(saveAll:Boolean = false) : *
      {
         var flag:Boolean = false;
         var i:* = undefined;
         if(!checkCurrentSessionId())
         {
            OverworldHUD.instance.showMultipleClients();
            return;
         }
         StatsManager.resetPingCounter();
         saveCharCookieData();
         if(offlineMode)
         {
            trace("offline save user data complete.");
            resetDataModified();
         }
         else
         {
            flag = false;
            for(i = 0; i < DATASLOTS; i++)
            {
               if(dataModified[i])
               {
                  flag = true;
               }
            }
            if(!flag)
            {
               return;
            }
            trace("saving data");
            if(dataModified[0])
            {
               NetworkManager.instance.saveUpdate(0,StatsManager.getPlayerLevelString());
               this.playerObj.playerlevel = StatsManager.getLevel();
               if(this.playerData != null)
               {
                  this.playerData.playerlevel = StatsManager.getLevel();
               }
            }
            if(dataModified[1])
            {
               NetworkManager.instance.saveUpdate(1,StatsManager.getPlayerStatsString());
               NetworkManager.instance.saveUpdate(103,StatsManager.getBattleStatsString());
               this.playerObj.playerstats = StatsManager.getPlayerStatsString();
               if(this.battleData != null)
               {
                  this.battleData.battlestats = StatsManager.getBattleStatsString();
               }
            }
            if(dataModified[2])
            {
               NetworkManager.instance.saveUpdate(2,StatsManager.getEquipmentString());
               this.playerObj.equipment = StatsManager.getEquipmentString();
               if(this.playerData != null)
               {
                  this.playerData.equipment = StatsManager.getEquipmentString();
               }
            }
            if(dataModified[3])
            {
               NetworkManager.instance.saveUpdate(3,StatsManager.getSkillStatsString());
               this.playerObj.skillstats = StatsManager.getSkillStatsString();
               if(this.battleData != null)
               {
                  this.battleData.skillstats = StatsManager.getSkillStatsString();
               }
            }
            if(dataModified[4])
            {
               NetworkManager.instance.saveUpdate(4,StatsManager.getInventoryString());
               this.playerObj.inventory = StatsManager.getInventoryString();
            }
            if(dataModified[5])
            {
               NetworkManager.instance.saveUpdate(5,StatsManager.getQuestItemsString());
               this.playerObj.questitems = StatsManager.getQuestItemsString();
            }
            if(dataModified[6])
            {
               NetworkManager.instance.saveUpdate(6,StatsManager.getIntStatsString());
               this.playerObj.intstats = StatsManager.getIntStatsString();
            }
            if(dataModified[7])
            {
               NetworkManager.instance.saveUpdate(7,StatsManager.getBooleanStatsString());
               this.playerObj.booleanstats = StatsManager.getBooleanStatsString();
            }
            if(dataModified[8])
            {
               NetworkManager.instance.saveUpdate(8,StatsManager.getActiveQuestString());
               this.playerObj.activequest = StatsManager.getActiveQuestString();
            }
            if(dataModified[9])
            {
               NetworkManager.instance.saveUpdate(9,StatsManager.getCompletedQuestString());
               this.playerObj.completedquest = StatsManager.getCompletedQuestString();
            }
            if(dataModified[10])
            {
               NetworkManager.instance.saveUpdate(10,StatsManager.getLocationString());
               this.playerObj.location = StatsManager.getLocationString();
               if(this.playerData != null)
               {
                  this.playerData.location = StatsManager.getLocationString();
               }
            }
            if(dataModified[11])
            {
               NetworkManager.instance.saveUpdate(11,StatsManager.getTaunt());
               this.playerObj.taunt = StatsManager.getTaunt();
               if(this.battleData != null)
               {
                  this.battleData.taunt = StatsManager.getTaunt();
               }
            }
            if(dataModified[12])
            {
               NetworkManager.instance.saveUpdate(12,StatsManager.getFriendListString());
               this.playerObj.friends = StatsManager.getFriendListString();
            }
            if(dataModified[14])
            {
               NetworkManager.instance.saveUpdate(14,StatsManager.getSkillSlotsString());
               this.playerObj.skillslots = StatsManager.getSkillSlotsString();
            }
            if(dataModified[15])
            {
               NetworkManager.instance.saveUpdate(15,StatsManager.getSide().toString());
               this.playerObj.side = StatsManager.getSide();
               if(this.playerData != null)
               {
                  this.playerData.side = StatsManager.getSide();
               }
            }
            if(dataModified[16])
            {
               NetworkManager.instance.saveUpdate(16,StatsManager.getPlayerDanString());
               this.playerObj.playerdan = StatsManager.getPlayerDanString();
               if(this.playerData != null)
               {
                  this.playerData.playerdan = StatsManager.getPlayerStats(StatsManager.STAT_DAN);
               }
            }
            if(dataModified[17])
            {
               NetworkManager.instance.saveUpdate(17,StatsManager.getStashString());
               this.playerObj.stash = StatsManager.getStashString();
            }
            if(dataModified[18])
            {
               NetworkManager.instance.saveUpdate(18,StatsManager.getOptionsString());
               this.playerObj.options = StatsManager.getOptionsString();
            }
            if(dataModified[19])
            {
               NetworkManager.instance.saveUpdate(19,StatsManager.getAchievementStatsString());
               this.playerObj.achievementstats = StatsManager.getAchievementStatsString();
            }
            if(StatsManager.nextAPUpdate != this.piolastAPUpdate)
            {
               NetworkManager.instance.saveUpdate(100,StatsManager.nextAPUpdate.toString());
               this.playerObj.apupdate = StatsManager.nextAPUpdate;
               this.piolastAPUpdate = StatsManager.nextAPUpdate;
            }
            if(StatsManager.nextDTUpdate != this.piolastDTUpdate)
            {
               NetworkManager.instance.saveUpdate(101,StatsManager.nextDTUpdate.toString());
               this.playerObj.dtupdate = StatsManager.nextDTUpdate;
               this.piolastDTUpdate = StatsManager.nextDTUpdate;
            }
            if(StatsManager.nextWarTurn != this.piolastWarTurn)
            {
               NetworkManager.instance.saveUpdate(102,StatsManager.nextWarTurn.toString());
               this.playerObj.warupdate = StatsManager.nextWarTurn;
               this.piolastWarTurn = StatsManager.nextWarTurn;
            }
            saveLastUpdate();
            if(this.isMigrator)
            {
               super.saveModifiedCharData(saveAll);
            }
            resetDataModified();
            if(saveAll)
            {
               this.playerObj.save();
            }
         }
      }
      
      override public function loadCharData(charname:String, forceServerLoad:Boolean = false) : *
      {
         StatsManager.charname = charname;
         if(StatsManager.usePlayerIO && StatsManager.usePlayerIOForDuels)
         {
            NetworkManager.instance.nid = charname;
         }
         if(forceServerLoad)
         {
            lastUpdate = 0;
         }
         if(offlineMode)
         {
            trace("offline load user data complete");
            loadCharCookieData();
            StatsManager.refreshMCS();
            NodeGenerator.instance.initSurroundingTerrCache(StatsManager.getLocation(),false);
         }
         else
         {
            StatsManager.id = charname;
            storeCurrentSessionId();
            this.loadChecks = 0;
            this.client.payVault.refresh(this.loadPayVaultCallBack,this.loadPayVaultError);
            this.client.bigDB.loadKeysOrCreate("PlayerData",[charname],this.loadPlayerDataCallBack,this.loadError);
            this.client.bigDB.loadKeysOrCreate("BattleData",[charname],this.loadBattleDataCallBack,this.loadError);
            this.client.bigDB.load("Notifications",charname,this.loadNotificationsCallBack,this.loadError);
            this.loadTowns();
            NetworkManager.instance.connectGlobalGroupPIO();
         }
      }
      
      internal function loadPayVaultCallBack() : *
      {
         trace("payvault loaded");
         this.checkLoadComplete();
      }
      
      internal function loadPayVaultError(e:PlayerIOError) : *
      {
         this.noPayVault = true;
         this.checkLoadComplete();
      }
      
      internal function loadPlayerDataCallBack(array:Array) : *
      {
         trace("playerdata loaded");
         this.playerData = array[0];
         this.checkLoadComplete();
      }
      
      internal function loadBattleDataCallBack(array:Array) : *
      {
         trace("battledata loaded");
         this.battleData = array[0];
         if(StatsManager.useCirrus)
         {
            this.battleData.stratusid = NetworkManager.getInstance().getNid();
         }
         else
         {
            this.battleData.stratusid = "";
         }
         this.battleData.save();
         this.checkLoadComplete();
      }
      
      internal function loadNotificationsCallBack(o:DatabaseObject) : *
      {
         trace("notifications loaded");
         if(o != null)
         {
            StatsManager.giftNotification = o.notif;
            this.client.bigDB.deleteKeys("Notifications",[StatsManager.charname]);
         }
         this.checkLoadComplete();
      }
      
      internal function loadTowns() : *
      {
         this.client.bigDB.load("GeneralData","TownState",function(o:DatabaseObject):*
         {
            trace("towns data loaded");
            QuestEngine.gotTownsData(o.towns);
            checkLoadComplete();
         },function(e:PlayerIOError):*
         {
            trace(e);
         });
      }
      
      public function checkLoadComplete() : *
      {
         ++this.loadChecks;
         if(this.loadChecks == 6)
         {
            this.client.bigDB.loadMyPlayerObject(this.loadPlayerObjAgainCallBack,this.loadError);
         }
      }
      
      internal function loadPlayerObjAgainCallBack(obj:DatabaseObject) : *
      {
         var sharedObject:SharedObject = null;
         try
         {
            trace("playerobject loaded");
            this.playerObj = obj;
            if(this.playerObj.charname == null)
            {
               NetworkManager.instance.disconnectGlobalPIO();
               NetworkManager.instance.disconnectChatPIO();
               return;
            }
            if(this.playerObj != null && this.playerObj.playerstats == null && this.playerObj.equipment == null)
            {
               NetworkManager.instance.disconnectGlobalPIO();
               NetworkManager.instance.disconnectChatPIO();
               GameEngine.hideLoadingScreen();
               GameEngine.initTitleScreen();
               this.deleteCharacter(this.playerObj.charname);
               TitleUI.instance.switchToCharacterCreate();
               return;
            }
            if(this.playerObj.apupdate != "")
            {
               StatsManager.nextAPUpdate = this.playerObj.apupdate;
            }
            if(this.playerObj.dtupdate != "")
            {
               StatsManager.nextDTUpdate = this.playerObj.dtupdate;
            }
            if(this.playerObj.warupdate != "")
            {
               StatsManager.nextWarTurn = this.playerObj.warupdate;
            }
            if(this.playerObj.playerstats != null)
            {
               StatsManager.parsePlayerStatsString(this.playerObj.playerstats);
            }
            if(this.playerObj.equipment != null)
            {
               StatsManager.parseEquipmentString(this.playerObj.equipment);
            }
            if(this.playerObj.skillstats != null)
            {
               StatsManager.parseSkillStatsString(this.playerObj.skillstats);
            }
            if(this.playerObj.skillslots != null)
            {
               StatsManager.parseSkillSlotsString(this.playerObj.skillslots);
            }
            if(this.playerObj.inventory != null)
            {
               StatsManager.parseInventoryString(this.playerObj.inventory);
            }
            if(this.playerObj.questitems != null)
            {
               StatsManager.parseQuestItemsString(this.playerObj.questitems);
            }
            if(this.playerObj.stash != null)
            {
               StatsManager.parseStashString(this.playerObj.stash);
            }
            if(this.playerObj.intstats != null)
            {
               StatsManager.parseIntStatsString(this.playerObj.intstats);
            }
            if(this.playerObj.achievementstats != null)
            {
               StatsManager.parseAchievementStatsString(this.playerObj.achievementstats);
            }
            if(this.playerObj.booleanstats != null)
            {
               StatsManager.parseBooleanStatsString(this.playerObj.booleanstats);
            }
            if(this.playerObj.activequest != null)
            {
               StatsManager.setActiveQuestString(this.playerObj.activequest);
            }
            if(this.playerObj.completedquest != null)
            {
               StatsManager.parseCompletedQuestString(this.playerObj.completedquest);
            }
            if(this.playerObj.taunt != null)
            {
               StatsManager.setTaunt(this.playerObj.taunt);
            }
            if(this.playerObj.wins != null)
            {
               StatsManager.setPlayerStats(StatsManager.STAT_WINS,this.playerObj.wins);
            }
            if(this.playerObj.bounty != null)
            {
               StatsManager.bounty = this.playerObj.bounty;
            }
            if(this.playerObj.friends != null)
            {
               StatsManager.parseFriendListString(this.playerObj.friends);
            }
            if(this.playerObj.purchases != null)
            {
               StatsManager.purchasesMade.setIntValue(this.playerObj.purchases);
            }
            if(this.playerObj.options != null)
            {
               sharedObject = SharedObject.getLocal(StatsManager.cookieName);
               if(sharedObject.data.saved != true)
               {
                  StatsManager.parseOptionsString(this.playerObj.options);
               }
            }
            StatsManager.refreshMCS();
            if(StatsManager.isCustomClan(StatsManager.getSide()))
            {
               this.loadCustomClanData(StatsManager.getSide(),this.gotMyCustomClanData);
            }
            else
            {
               this.gotMyCustomClanData();
            }
            if(this.playerObj.hackreported != null)
            {
               StatsManager.hackReported = true;
            }
            StatsManager.bonusPrizeCollected = false;
            StatsManager.didRebirth = false;
         }
         catch(e:Error)
         {
            QueryManagerPIO.instance.client.errorLog.writeError(e.message,"loadPlayerObjAgainCallBack " + StatsManager.charname,e.getStackTrace(),e.errorID);
         }
      }
      
      internal function gotMyCustomClanData(o:DatabaseObject = null) : *
      {
         trace("online load user data complete");
         if(o != null)
         {
            StatsManager.initCustomClan(o.clanname,o.color,o.logo,o.logocolor,o.acronym,o.founder,o.owned);
         }
         NodeGenerator.instance.initSurroundingTerrCache(StatsManager.getLocation(),false);
      }
      
      internal function loadError(e:PlayerIOError) : *
      {
         trace(e);
         this.client.errorLog.writeError(e.name,e.message,e.getStackTrace(),e.errorID);
      }
      
      override public function deleteCharacter(charname:String) : *
      {
         if(this.isMigrator)
         {
            TitleUI.instance.charselect.chardeleteform.serverResponse(3);
            TitleUI.instance.charselect.chardeleteform.errormessage.text = "Cannot delete character when logged in with this user";
            return;
         }
         deleteCharCookieData(charname);
         clearCharName();
         charstring = "";
         this.client.bigDB.deleteKeys("PlayerData",[charname]);
         this.client.bigDB.deleteKeys("BattleData",[charname]);
         this.client.bigDB.deleteKeys("GlobalHighScore",[charname]);
         this.client.bigDB.deleteKeys("WeeklyHighScore",[charname]);
         this.client.bigDB.deleteKeys("Notifications",[charname]);
         this.client.bigDB.deleteKeys("WarSentryData",[charname]);
         this.playerObj.prevname = this.playerObj.charname;
         delete this.playerObj.apupdate;
         delete this.playerObj.charname;
         delete this.playerObj.playerstats;
         delete this.playerObj.taunt;
         delete this.playerObj.warupdate;
         delete this.playerObj.skillstats;
         delete this.playerObj.equipment;
         delete this.playerObj.dtupdate;
         delete this.playerObj.inventory;
         delete this.playerObj.stash;
         delete this.playerObj.intstats;
         delete this.playerObj.achievementstats;
         delete this.playerObj.side;
         delete this.playerObj.skillslots;
         delete this.playerObj.booleanstats;
         delete this.playerObj.questitems;
         delete this.playerObj.activequest;
         delete this.playerObj.created;
         delete this.playerObj.playerlevel;
         delete this.playerObj.playerdan;
         delete this.playerObj.completedquest;
         delete this.playerObj.location;
         delete this.playerObj.options;
         this.playerObj.save();
         TitleUI.instance.charselect.chardeleteform.serverResponse(0);
      }
      
      override public function getOpponents() : *
      {
         var playerlevel:int = 0;
         var dbindex:String = null;
         var dice:int = 0;
         if(offlineMode)
         {
            DuelModeUI.instance.setDuelList("");
            return;
         }
         if(this.opponentCache == null || getServerTime() - this.opponentCacheCreated > 60 * 2)
         {
            playerlevel = StatsManager.getLevel();
            this.opponentCacheCreated = getServerTime();
            dice = Math.random() * 3;
            if(dice == 0)
            {
               dbindex = "ByLevelRandomA";
            }
            else if(dice == 1)
            {
               dbindex = "ByLevelRandomB";
            }
            else if(dice == 2)
            {
               dbindex = "ByLevelRandomC";
            }
            this.client.bigDB.loadRange("PlayerData",dbindex,[],playerlevel,null,20,this.getOpponentsCompletePIO,this.getOpponentsErrorPIO);
         }
         else
         {
            this.getOpponentsCompletePIO(this.opponentCache);
         }
      }
      
      internal function getOpponentsCompletePIO(array:Array) : void
      {
         var o:DatabaseObject = null;
         var timeSince:int = 0;
         for(var i:* = int(array.length - 1); i >= 0; i--)
         {
            o = array[i];
            if(o.key == StatsManager.charname || o.key == "admin" || o.key == "RyuKanji" || o.key == "kageyoshi" || o.key == "MasaruKanji")
            {
               array.splice(i,1);
            }
         }
         this.opponentCache = array.slice(0,array.length);
         var str:String = "";
         i = 0;
         while(i < 6 && array.length > 0)
         {
            o = array.splice(int(Math.random() * array.length),1)[0];
            if(o.online != null && Boolean(o.online))
            {
               timeSince = 0;
            }
            else
            {
               timeSince = 10000;
            }
            if(o.equipment == null)
            {
               o.equipment = XMLNpc.DEFAULT_EQSTRING;
            }
            str += o.key + "$" + o.playerlevel + "$" + o.equipment + "$" + timeSince + "^";
            i++;
         }
         DuelModeUI.instance.setDuelList(str);
      }
      
      internal function getOpponentsErrorPIO(e:PlayerIOError) : void
      {
         trace("getOpponents IO error:" + e);
         DuelModeUI.instance.onLeave(null);
      }
      
      override public function getOpponentData(charname:String) : *
      {
         this.client.bigDB.load("BattleData",charname,this.getOpponentDataCompletePIO,this.getOpponentDataErrorPIO);
      }
      
      internal function getOpponentDataCompletePIO(o:DatabaseObject) : void
      {
         var timeSince:* = undefined;
         if(o == null)
         {
            DuelModeUI.instance.onLeave(null);
         }
         else
         {
            if(o.battlestats == null)
            {
               this.getOpponentDataErrorPIO(null);
               return;
            }
            if(o.skillstats == null)
            {
               o.skillstats = "";
            }
            if(o.stratusid == null)
            {
               o.stratusid = "";
            }
            if(o.battlestats == null)
            {
               o.battlestats = "5|10|10|10|1|1|1|0|0|0|0|0|0|0";
            }
            if(o.online != null && Boolean(o.online))
            {
               timeSince = 0;
            }
            else
            {
               timeSince = 10000;
            }
            if(o.taunt == null)
            {
               o.taunt = "";
            }
            DuelModeUI.instance.gotOpponentData(o.battlestats,o.skillstats,o.stratusid,timeSince,o.taunt);
         }
      }
      
      internal function getOpponentDataErrorPIO(event:PlayerIOError) : void
      {
         trace("getOpponentData IO error");
         DuelModeUI.instance.onLeave(null);
      }
      
      override public function duelEnd(winner:String, loser:String) : *
      {
         if(this.isMigrator)
         {
            super.duelEnd(winner,loser);
         }
         NetworkManager.instance.reportDuelEnd(loser);
      }
      
      override public function getLeaderboards(page:int = 0, weekly:Boolean = false) : *
      {
         var startObj:Object = null;
         if(page == 0)
         {
            this.currentPage = 0;
            startObj = null;
            this.hasNextPage = false;
            this.hasPrevPage = false;
            this.pages = new Array();
         }
         else
         {
            if(!(this.hasNextPage && page > this.currentPage))
            {
               if(this.hasPrevPage && page < this.currentPage)
               {
                  --this.currentPage;
                  this.getLeaderboardsCompletePIO(this.pages[this.currentPage]);
                  return;
               }
               return;
            }
            ++this.currentPage;
            startObj = this.nextStart;
         }
         if(weekly)
         {
            this.client.bigDB.loadRange("WeeklyHighScore","ByRating",null,startObj,null,11,this.getLeaderboardsCompletePIO,this.getLeaderboardsErrorPIO);
         }
         else
         {
            this.client.bigDB.loadRange("GlobalHighScore","ByRating",null,startObj,null,11,this.getLeaderboardsCompletePIO,this.getLeaderboardsErrorPIO);
         }
      }
      
      internal function getLeaderboardsCompletePIO(array:Array) : void
      {
         var o:DatabaseObject = null;
         this.pages[this.currentPage] = array;
         this.hasNextPage = array.length == 11;
         this.hasPrevPage = this.currentPage > 0;
         if(this.hasNextPage)
         {
            this.nextStart = array[10].rating;
         }
         var str:String = "";
         var i:int = 0;
         while(i < array.length && i < 10)
         {
            o = array[i];
            if(o.wins == null)
            {
               o.wins = 0;
            }
            if(o.loss == null)
            {
               o.loss = 0;
            }
            if(o.draw == null)
            {
               o.draw = 0;
            }
            str += o.key + "#" + "0" + "#" + o.wins + "#" + o.loss + "#" + o.draw + "#" + "0" + "^";
            i++;
         }
         if(GameEngine.isTitle())
         {
            LeaderboardUI.instance.setLeaderboard(str);
         }
         else
         {
            DuelModeUI.instance.setLeaderboard(str);
         }
      }
      
      internal function getLeaderboardsErrorPIO(e:PlayerIOError) : void
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
      
      override public function giveItem(receiver:String, giver:String, items:String, coins:int) : *
      {
         if(items == "" && coins == 0)
         {
            return;
         }
         NetworkManager.instance.giveItem(receiver,items,coins);
      }
      
      override public function checkNotifications() : *
      {
         this.client.bigDB.load("Notifications",StatsManager.charname,this.checkNotificationsCallBack);
      }
      
      internal function checkNotificationsCallBack(o:DatabaseObject) : *
      {
         if(o == null)
         {
            return;
         }
         if(StatsManager.giftNotification == "")
         {
            StatsManager.giftNotification = o.notif;
         }
         else
         {
            StatsManager.giftNotification = StatsManager.giftNotification + "^" + o.notif;
         }
         if(GameEngine.isAdventureMode() && !OverworldHUD.instance.duelmodeUI.visible && !OverworldHUD.instance.warUI.visible)
         {
            StatsManager.parseGiftNotificationsString();
         }
         this.client.bigDB.deleteKeys("Notifications",[StatsManager.charname]);
      }
      
      public function getPayVaultCoins() : int
      {
         if(this.noPayVault)
         {
            return 0;
         }
         try
         {
            return this.client.payVault.coins;
         }
         catch(e:Error)
         {
            trace("payvault coins not loaded, need to refresh");
            client.payVault.refresh(function():*
            {
               if(GameEngine.isAdventureMode())
               {
                  OverworldHUD.instance.updateHUD();
               }
            });
         }
         return 0;
      }
      
      public function refreshPayVaultCoins() : *
      {
         if(this.noPayVault)
         {
            return;
         }
         this.client.payVault.refresh(function():*
         {
            if(GameEngine.isAdventureMode())
            {
               OverworldHUD.instance.updateHUD();
            }
         });
      }
      
      public function debitPayVaultCoins(num:int, callbackSuccess:Function, callbackError:Function) : *
      {
         if(this.noPayVault)
         {
            return;
         }
         this.client.payVault.debit(num,"",function():*
         {
            NetworkManager.instance.sendRefundTry(num);
            callbackSuccess.call();
         },function():*
         {
            trace("unable to reach server");
            callbackError();
         });
      }
      
      public function buyFBGold(num:int) : *
      {
         this.client.payVault.getBuyCoinsInfo("facebookv2",{
            "coinamount":num.toString(),
            "title":num.toString() + " " + LangManager.getString(64),
            "description":LangManager.getString(687),
            "image":"http://www.explosivebarrel.com/duels/facebook/FacebookCredits/gold.png",
            "currencies":"USD"
         },function(info:Object):void
         {
            try
            {
               FB.ui(info,function(data:Object):void
               {
                  if(data.status == "completed")
                  {
                     trace("FB Purchase completed!");
                     OverworldHUD.instance.payUI.FBCallback(FacebookCredits.PAYMENT_SUCCEEDED);
                  }
                  else
                  {
                     trace("FB Purchase cancelled.");
                     OverworldHUD.instance.payUI.FBCallback(FacebookCredits.PAYMENT_CANCELLED,data.status);
                  }
               });
            }
            catch(error:Error)
            {
               trace("use paypal instead");
               OverworldHUD.instance.payUI.paymentselect.hide();
               OverworldHUD.instance.payUI.paymentselect.show(num,OverworldHUD.instance.payUI);
            }
         },function(e:PlayerIOError):void
         {
            trace("Unable to buy FB coins",e);
            OverworldHUD.instance.payUI.FBCallback(FacebookCredits.PAYMENT_FAILED);
         });
      }
      
      public function fbRequest(msg:String) : *
      {
         FB.ui({
            "method":"apprequests",
            "message":msg
         },function(data:Object):void
         {
            trace("fbRequest ok");
         });
      }
      
      override internal function shareDuelTV() : *
      {
         var link:String = "http://www.strawhatsamuraiduels.com/watch?name=" + StatsManager.charname;
         FB.ui({
            "method":"feed",
            "name":"Straw Hat Samurai: Duels",
            "link":"http://www.facebook.com/strawhatsamuraiduels",
            "picture":"http://strawhatsamuraiduels.com/facebook/shareimage.gif",
            "caption":"Watch me kick some ass!",
            "description":"Check out my duel on Straw Hat Samurai: Duels TV!",
            "actions":"[{\"name\": \"Watch duel\", \"link\": \"" + link + "\"}]"
         },function(data:Object):void
         {
            trace("fbShareDuelsTV ok");
         });
      }
      
      override public function reportHack(details:String) : *
      {
         if(offlineMode)
         {
            return;
         }
         if(hackReported)
         {
            return;
         }
         hackReported = true;
         if(StatsManager.hackReported)
         {
            StatsManager.saveLocation(666);
            StatsManager.setBuff(StatsManager.BUFF_HELL,86400);
         }
         NetworkManager.instance.reportHack(details);
         OverworldHUD.instance.showCorrupted();
         StatsManager.hackReported = true;
      }
      
      override public function getTerritoryData(terrX:int, terrY:int) : *
      {
         var territoryId:int;
         if(offlineMode)
         {
            NodeGenerator.instance.gotTerritoryData(terrX,terrY,"0");
            return;
         }
         territoryId = terrX << 12 | terrY;
         this.client.bigDB.load("TerritoryData",territoryId.toString(),function(o:DatabaseObject):*
         {
            var terrdata:String = null;
            var warstr:String = null;
            var townname:String = null;
            if(o == null)
            {
               NodeGenerator.instance.gotTerritoryData(terrX,terrY,"0");
            }
            else
            {
               warstr = "0";
               if(o.war)
               {
                  warstr = "1";
               }
               townname = "";
               if(o.name != null && o.name != "")
               {
                  townname = o.name;
               }
               terrdata = o.prosperity + "," + o.side + "," + townname + "," + warstr + "," + o.questdata + "," + o.encounterdata + "," + o.battlereports;
               NodeGenerator.instance.gotTerritoryData(terrX,terrY,terrdata);
            }
         });
      }
      
      override public function getTerritoryGroupData(terrX:int, terrY:int) : *
      {
         var keys:Array;
         var territoryId:int;
         var i:int = 0;
         var j:int = 0;
         if(offlineMode)
         {
            NodeGenerator.instance.gotTerritoryGroupData(terrX,terrY,"0|0|0|0|0|0|0|0|0");
            return;
         }
         keys = new Array();
         for(i = terrX - 1; i <= terrX + 1; i++)
         {
            for(j = terrY - 1; j <= terrY + 1; j++)
            {
               keys.push((i << 12 | j).toString());
            }
         }
         territoryId = terrX << 12 | terrY;
         this.client.bigDB.loadKeys("TerritoryData",keys,function(array:Array):*
         {
            var o:DatabaseObject = null;
            var warstr:String = null;
            var townname:String = null;
            var tx:int = 0;
            var ty:int = 0;
            var terrdata:String = "";
            var max:int = int(array.length);
            for(i = 0; i < max; ++i)
            {
               o = array[i];
               warstr = "0";
               if(o.war)
               {
                  warstr = "1";
               }
               townname = "";
               if(o.name != null && o.name != "")
               {
                  townname = o.name;
               }
               terrdata = o.prosperity + "," + o.side + "," + townname + "," + warstr + "," + o.questdata + "," + o.encounterdata + "," + o.battlereports;
               tx = int(o.key) >> 12 & 0x0FFF;
               ty = int(o.key) & 0x0FFF;
               NodeGenerator.instance.gotTerritoryData(tx,ty,terrdata);
            }
            GameEngine.initOverworld();
         },function(e:PlayerIOError):*
         {
            trace(e);
            client.errorLog.writeError(e.name,e.message,e.getStackTrace(),e.errorID);
         });
      }
      
      override public function getTownData(territoryx:int, territoryy:int) : *
      {
         var territoryId:int;
         if(offlineMode)
         {
            return;
         }
         territoryId = territoryx << 12 | territoryy;
         this.client.bigDB.load("TerritoryExtraData",territoryId.toString(),function(o:DatabaseObject):*
         {
            var territoryData:TerritoryData = null;
            territoryData = NodeGenerator.instance.getTerritoryData(territoryx,territoryy,true);
            if(StatsManager.isCustomClan(territoryData.getTownSide()))
            {
               loadCustomClanData(territoryData.getTownSide(),function(clanData:DatabaseObject):*
               {
                  territoryData.gotCustomClanData(clanData);
                  if(o == null)
                  {
                     o = new DatabaseObject(null,null,null,null,null,null);
                  }
                  o.founder = clanData.founder;
                  gotTownData(territoryData,o);
               });
            }
            else
            {
               gotTownData(territoryData,o);
            }
         });
      }
      
      internal function gotTownData(territoryData:TerritoryData, o:DatabaseObject) : *
      {
         var towndata:String = null;
         var founder:String = null;
         if(o == null)
         {
            territoryData.setTerrExtraData(",,",null);
         }
         else
         {
            founder = "";
            if(o.founder != null && o.founder != "")
            {
               founder = o.founder;
            }
            towndata = founder + "," + "" + "," + "";
            territoryData.setTerrExtraData(towndata,o.influence);
         }
         territoryData.showTownData();
      }
      
      public function getCustomClanTownOwnerName(territoryx:int, territoryy:int) : *
      {
         var territoryData:TerritoryData = null;
         territoryData = NodeGenerator.instance.getTerritoryData(territoryx,territoryy,true);
         if(StatsManager.isCustomClan(territoryData.getTownSide()))
         {
            this.loadCustomClanData(territoryData.getTownSide(),function(clanData:DatabaseObject):*
            {
               territoryData.gotCustomClanData(clanData);
            });
         }
      }
      
      override public function updateTownProsperity(value:int) : *
      {
         var territory:Point = NodeGenerator.instance.getTerritory(QuestGenerator.instance.currentNPCNodeId);
         var side:int = StatsManager.getSide();
         OverworldHUD.instance.globalVarDialog.updateTownProsperity(value,side,territory.x,territory.y);
         if(StatsManager.skipUpdateGlobalVar || offlineMode || NodeGenerator.instance.isNoChangeTown(territory.x << 12 | territory.y))
         {
            trace("skipping town prosperity update: (" + (territory.x - 341) + "," + (territory.y - 341) + ") " + value);
            return;
         }
         NetworkManager.instance.updateTownProsperity(NodeGenerator.instance.getTerritoryId(QuestGenerator.instance.currentNPCNodeId),side,value);
      }
      
      override public function addWarMessage(mapid:int, side:int, charside:int, charname:String, msg:String) : *
      {
         var o:Object = new Object();
         o.mapid = mapid;
         o.side = side;
         o.charside = charside;
         o.charname = charname;
         o.msg = msg;
         o.created = getServerTime();
         this.client.bigDB.createObject("WarMessageData",null,o);
      }
      
      override public function getWarMessage(mapid:int, side:int) : *
      {
         var msgArray:Array = null;
         var startTime:int = 0;
         msgArray = new Array();
         startTime = getServerTime() - 60 * 60 * 24 * 7;
         this.client.bigDB.loadRange("WarMessageData","ByMapIdSideCreated",[mapid,side],startTime,null,1000,function(array:Array):*
         {
            msgArray = msgArray.concat(array);
            client.bigDB.loadRange("WarMessageData","ByMapIdSideCreated",[mapid,0],startTime,null,1000,function(array:Array):*
            {
               msgArray = msgArray.concat(array);
               OverworldHUD.instance.warUI.warHexUI.initMessagesPIO(msgArray);
            },function(e:PlayerIOError):*
            {
               OverworldHUD.instance.warUI.warHexUI.initMessagesPIO(msgArray);
            });
         });
      }
      
      override public function addWarSentry(mapid:int, side:int, xpos:int, ypos:int, charid:String) : *
      {
         NetworkManager.instance.addWarSentry(mapid,xpos,ypos);
      }
      
      override public function delWarSentry(mapid:int, killedList:String) : *
      {
         NetworkManager.instance.delWarSentry(mapid,killedList);
      }
      
      override public function getWarEnemySentry(mapid:int, xpos:int, ypos:int, side:int) : *
      {
         var mapid_x_y:String = mapid + "_" + xpos + "_" + ypos;
         this.client.bigDB.loadRange("WarSentryData","ByMapIdXYSide",[mapid_x_y,side],null,null,10,function(array:Array):*
         {
            OverworldHUD.instance.warUI.warHexUI.startBattlePIO(array);
         },function(e:PlayerIOError):*
         {
            trace(e);
         });
      }
      
      override public function getWarMaps(side:int, getWorld:Boolean = true) : *
      {
         var checkGotWarMaps:Function = null;
         checkGotWarMaps = function():*
         {
            ++warmapDataCounter;
            if(warmapDataCounter == 4)
            {
               OverworldHUD.instance.warUI.initWarMarkers(warmapData[WAR_TERRITORYOWNERS],warmapData[WAR_SELFSENTRY],warmapData[WAR_SPAWNPOINTS],warmapData[WAR_NEXTUPDATE],warmapData[WAR_MAINTENANCE]);
               warmapDataCounter = 0;
            }
         };
         if(this.warmapDataCounter > 0)
         {
            trace("getWarMaps already in progress");
            return;
         }
         ++this.warmapDataCounter;
         if(getWorld)
         {
            this.client.bigDB.load("GeneralData","WarRoomState",function(o:DatabaseObject):*
            {
               var side:int = 0;
               warmapData[WAR_TERRITORYOWNERS] = o.territoryowners;
               warmapData[WAR_NEXTUPDATE] = o.nextupdate;
               warmapData[WAR_MAINTENANCE] = o.maintenance;
               var worldState:String = o.territoryowners;
               var max:int = worldState.length;
               var customSides:IntMap = new IntMap();
               for(var i:int = 0; i < max; i++)
               {
                  side = worldState.charAt(i).charCodeAt(0) - WORLDSTATESTR_ASCIIADD;
                  if(StatsManager.isCustomClan(side))
                  {
                     customSides.put(side,side.toString(),true);
                  }
               }
               var keys:Array = customSides.getValues();
               loadCustomClanDataRange(keys,checkGotWarMaps);
               OverworldHUD.instance.worldMapUI.setWorldState(warmapData[WAR_TERRITORYOWNERS]);
            },function(e:PlayerIOError):*
            {
               trace(e);
            });
         }
         else
         {
            this.warmapData[WAR_TERRITORYOWNERS] = "";
            this.warmapData[WAR_NEXTUPDATE] = "";
            checkGotWarMaps();
         }
         this.client.bigDB.load("WarSentryData",StatsManager.charname,function(o:DatabaseObject):*
         {
            if(o != null && o.mapid_x_y != null)
            {
               warmapData[WAR_SELFSENTRY] = o.mapid_x_y.split("_").join(",");
            }
            else
            {
               warmapData[WAR_SELFSENTRY] = "";
            }
            checkGotWarMaps();
         },function(e:PlayerIOError):*
         {
            trace(e);
         });
         this.client.bigDB.loadRange("WarSpawnPointData","ByMapId",null,null,null,1000,function(array:Array):*
         {
            var o:DatabaseObject = null;
            var data:String = null;
            var max:int = int(array.length);
            var str:String = "";
            for(var i:int = 0; i < max; i++)
            {
               o = array[i];
               data = o.mapid + "," + o.side + "," + o.state + "," + o.x + "," + o.y;
               if(str == "")
               {
                  str = data;
               }
               else
               {
                  str = str + "|" + data;
               }
            }
            warmapData[WAR_SPAWNPOINTS] = str;
            checkGotWarMaps();
         },function(e:PlayerIOError):*
         {
            trace(e);
         });
      }
      
      public function getSpawnPoints() : *
      {
         this.client.bigDB.loadRange("WarSpawnPointData","ByMapId",null,null,null,1000,function(array:Array):*
         {
            var o:DatabaseObject = null;
            var data:String = null;
            var max:int = int(array.length);
            var str:String = "";
            for(var i:int = 0; i < max; i++)
            {
               o = array[i];
               data = o.mapid + "," + o.side + "," + o.state + "," + o.x + "," + o.y;
               if(str == "")
               {
                  str = data;
               }
               else
               {
                  str = str + "|" + data;
               }
            }
            OverworldHUD.instance.warUI.updateSpawnPoints(str);
         },function(e:PlayerIOError):*
         {
            trace(e);
         });
      }
      
      public function getCrops(side:int, callback:Function) : *
      {
         var key:String = null;
         if(side == 1)
         {
            key = "50000";
         }
         else if(side == 2)
         {
            key = "50001";
         }
         else if(side == 3)
         {
            key = "50002";
         }
         else
         {
            if(side != 4)
            {
               callback(0);
               return;
            }
            key = "50003";
         }
         this.client.bigDB.load("GeneralData",key,function(o:DatabaseObject):*
         {
            var val:int = 0;
            if(o != null)
            {
               val = int(o.value);
            }
            callback(val);
         },function(e:PlayerIOError):*
         {
            trace(e);
         });
      }
      
      public function getAllCrops(callback:Function) : *
      {
         this.client.bigDB.loadKeys("GeneralData",["50000","50001","50002","50003"],function(array:Array):*
         {
            var o:DatabaseObject = null;
            var max:int = int(array.length);
            var output:Array = [0,0,0,0];
            for(var i:int = 0; i < max; i++)
            {
               o = array[i];
               if(o.key == "50000")
               {
                  output[0] = o.value;
               }
               else if(o.key == "50001")
               {
                  output[1] = o.value;
               }
               else if(o.key == "50002")
               {
                  output[2] = o.value;
               }
               else if(o.key == "50003")
               {
                  output[3] = o.value;
               }
            }
            callback(output);
         });
      }
      
      public function getWorldMapTerritoryOwners() : *
      {
         this.client.bigDB.load("GeneralData","WarRoomState",function(o:DatabaseObject):*
         {
            var side:int = 0;
            warmapData[WAR_TERRITORYOWNERS] = o.territoryowners;
            warmapData[WAR_NEXTUPDATE] = o.nextupdate;
            warmapData[WAR_MAINTENANCE] = o.maintenance;
            var worldState:String = o.territoryowners;
            var max:int = worldState.length;
            var customSides:IntMap = new IntMap();
            for(var i:int = 0; i < max; i++)
            {
               side = worldState.charAt(i).charCodeAt(0) - WORLDSTATESTR_ASCIIADD;
               if(StatsManager.isCustomClan(side))
               {
                  customSides.put(side,side.toString(),true);
               }
            }
            var keys:Array = customSides.getValues();
            loadCustomClanDataRange(keys,gotWorldMapTerritoryOwners);
         },function(e:PlayerIOError):*
         {
            trace(e);
         });
      }
      
      internal function gotWorldMapTerritoryOwners() : *
      {
         OverworldHUD.instance.worldMapUI.initWorldMapMarkers(this.warmapData[WAR_TERRITORYOWNERS]);
      }
      
      override public function getWarHexMap(mapid:int, side:int) : *
      {
         this.client.bigDB.load("TerritoryData",mapid.toString(),function(o:DatabaseObject):*
         {
            var townname:String = null;
            var tdata:String = null;
            if(o == null)
            {
               OverworldHUD.instance.warUI.initWarHexMap("","0");
            }
            else
            {
               townname = "";
               if(o.name != null && o.name != "")
               {
                  townname = o.name;
               }
               tdata = o.prosperity + "," + o.side + "," + townname + ",";
               if(o.war)
               {
                  tdata += "1";
               }
               else
               {
                  tdata += "0";
               }
               if(!o.war)
               {
                  OverworldHUD.instance.warUI.initWarHexMap("",tdata);
               }
               else
               {
                  client.bigDB.loadRange("WarHexData","ByMapId",[mapid],null,null,1000,function(array:Array):*
                  {
                     var i:int;
                     var max:int;
                     var troops:Array = null;
                     var hexstr:String = null;
                     var o:DatabaseObject = null;
                     var str:String = null;
                     troops = new Array(6);
                     for(i = 0; i < 6; i++)
                     {
                        troops[i] = new Array(6);
                     }
                     hexstr = "";
                     max = int(array.length);
                     for(i = 0; i < max; i++)
                     {
                        o = array[i];
                        str = o.x + "," + o.y + "," + o.owner + "," + "" + "," + o.type + "," + o.cost + ",";
                        if(o.troops[side] != null)
                        {
                           str += o.troops[side];
                        }
                        else
                        {
                           str += "0";
                        }
                        if(hexstr == "")
                        {
                           hexstr = str;
                        }
                        else
                        {
                           hexstr += "|" + str;
                        }
                        troops[o.x][o.y] = o.troops;
                     }
                     client.bigDB.load("CastleGates",mapid.toString(),function(cgo:DatabaseObject):*
                     {
                        var castleGateTime:int = 0;
                        if(cgo != null && cgo.opened != null)
                        {
                           castleGateTime = int(cgo.opened);
                        }
                        OverworldHUD.instance.warUI.initWarHexMap(hexstr,tdata,troops,castleGateTime);
                     });
                  },function(e:PlayerIOError):*
                  {
                     trace(e);
                     tdata = o.prosperity + "," + o.side + "," + o.townname + ",0";
                     OverworldHUD.instance.warUI.initWarHexMap("",tdata);
                  });
               }
            }
         },function(e:PlayerIOError):*
         {
            trace(e);
            OverworldHUD.instance.warUI.initWarHexMap("","0");
         });
      }
      
      override public function getWarHexData(mapid:int, xpos:int, ypos:int, side:int) : *
      {
         var key:String = mapid + "_" + xpos + "_" + ypos;
         this.client.bigDB.loadRange("WarSentryData","ByMapIdXYSide",[key,side],null,null,1000,function(array:Array):*
         {
            var o:DatabaseObject = null;
            var sentryname:String = null;
            var strArray:Array = null;
            var max:int = int(array.length);
            var sentrystr:String = "";
            for(var i:int = 0; i < max; i++)
            {
               o = array[i];
               sentryname = o.key;
               if(sentryname.substr(0,4) == "bot_")
               {
                  strArray = sentryname.split("_");
                  sentryname = NameGenerator.getInstance().getSentryBotName(new RNG(int(strArray[1]) * 130 + int(strArray[2]) * 11));
               }
               sentrystr += sentryname + "," + o.playerlevel + "|";
            }
            OverworldHUD.instance.warUI.warHexUI.initWarHexDataPIO(sentrystr);
         },function(e:PlayerIOError):*
         {
            trace(e);
            OverworldHUD.instance.warUI.warHexUI.initWarHexDataPIO("");
         });
      }
      
      override public function setWarHex(mapid:int, xpos:int, ypos:int, side:int, val:int) : *
      {
         NetworkManager.instance.setWarHex(mapid,xpos,ypos,side,val);
      }
      
      override public function startBuild(mapid:int, xpos:int, ypos:int, hextype:int) : *
      {
         NetworkManager.instance.startBuild(mapid,xpos,ypos,hextype);
      }
      
      override public function doBuild(mapid:int, xpos:int, ypos:int, cost:int) : *
      {
         NetworkManager.instance.doBuild(mapid,xpos,ypos,cost);
      }
      
      override public function createSpawnPoint(mapid:int, side:int, territoryx:int, territoryy:int, controlPointStr:String, hasTown:Boolean) : *
      {
         NetworkManager.instance.createSpawnPoint(mapid,side,territoryx,territoryy,controlPointStr,hasTown);
      }
      
      override public function destroySpawnPoint(mapid:int, territoryx:int, territoryy:int) : *
      {
         NetworkManager.instance.destroySpawnPoint(mapid,territoryx,territoryy);
      }
      
      public function getCastleGateOpened(territoryId:int, callback:Function) : *
      {
         this.client.bigDB.load("CastleGates",territoryId.toString(),function(o:DatabaseObject):*
         {
            if(o == null)
            {
               callback(0);
            }
            else if(o.opened != null)
            {
               callback(o.opened);
            }
            else
            {
               callback(0);
            }
         });
      }
      
      public function setCastleGateOpened(territoryId:int) : *
      {
         this.client.bigDB.loadKeysOrCreate("CastleGates",[territoryId.toString()],function(array:Array):*
         {
            var o:DatabaseObject = array[0];
            o.opened = getServerTime();
            o.save();
         });
      }
      
      override public function saveReplay(name1:String, name2:String, data:String, win:int) : *
      {
         var newo:Object = new Object();
         newo.player1 = name1;
         newo.player2 = name2;
         newo.data = data;
         newo.created = getServerTime();
         newo.win = win;
         newo.views = 0;
         newo.randomindex = int(Math.random() * 30000);
         this.client.bigDB.createObject("ReplayData",null,newo,function(o:DatabaseObject):*
         {
            WinUI.instance.replaySaved();
            LoseUI.instance.replaySaved();
            if(StatsManager.isFacebook() && QueryManagerPIO.instance.facebookTokenLogin)
            {
               shareDuelTV();
            }
         });
      }
      
      public function playbackClientLogin(pbid:String, pbname:String) : *
      {
         PlayerIO.quickConnect.simpleConnect(StatsManager.mainTimeLine.stage,this.gameid,"guest","password",function(_client:Client):void
         {
            client = _client;
            if(pbid != null && pbid != "")
            {
               getReplay(pbid);
            }
            else if(pbname != null && pbname != "")
            {
               getReplayByName(pbname);
            }
            else
            {
               getReplay("0");
            }
         },function(e:PlayerIOError):void
         {
            trace("Error: ",e);
         });
      }
      
      internal function informWatchPage(o:DatabaseObject) : *
      {
         ExternalInterface.call("informWatchPage",o.key,o.views,o.player1,o.player2);
      }
      
      override public function getReplay(id:String) : *
      {
         if(id == "0")
         {
            this.client.bigDB.loadRange("ReplayData","ByRandom",null,int(Math.random() * 30000),null,1,function(array:Array):*
            {
               if(array.length == 0)
               {
                  if(GameEngine.isPlayBackClient())
                  {
                     getReplay("0");
                  }
                  else
                  {
                     OverworldHUD.instance.showDialog(LangManager.getString(484),LangManager.getString(5));
                  }
               }
               else
               {
                  GameEngine.hideLoadingScreen();
                  NetworkManager.instance.playRecording(array[0].data);
                  array[0].views += 1;
                  array[0].save();
                  if(GameEngine.isPlayBackClient() && !StatsManager.skipUpdateGlobalVar)
                  {
                     informWatchPage(array[0]);
                  }
               }
            },function(e:PlayerIOError):*
            {
               trace(e);
               if(!GameEngine.isPlayBackClient())
               {
                  GameEngine.hideLoadingScreen();
               }
            });
         }
         else
         {
            this.client.bigDB.load("ReplayData",id,function(o:DatabaseObject):*
            {
               if(o == null)
               {
                  if(GameEngine.isPlayBackClient())
                  {
                     getReplay("0");
                  }
                  else
                  {
                     OverworldHUD.instance.showDialog(LangManager.getString(484),LangManager.getString(5));
                  }
               }
               else
               {
                  GameEngine.hideLoadingScreen();
                  NetworkManager.instance.playRecording(o.data);
                  o.views += 1;
                  o.save();
                  if(GameEngine.isPlayBackClient() && !StatsManager.skipUpdateGlobalVar)
                  {
                     informWatchPage(o);
                  }
               }
            },function(e:PlayerIOError):*
            {
               trace(e);
               if(!GameEngine.isPlayBackClient())
               {
                  GameEngine.hideLoadingScreen();
               }
            });
         }
      }
      
      override public function getReplayByName(charname:String) : *
      {
         this.client.bigDB.loadRange("ReplayData","ByCharnameCreated",[charname],null,null,1,function(array:Array):*
         {
            if(array.length == 0)
            {
               if(GameEngine.isPlayBackClient())
               {
                  getReplay("0");
               }
               else
               {
                  OverworldHUD.instance.showDialog(LangManager.getString(484),LangManager.getString(5));
               }
            }
            else
            {
               trace(array[0].key);
               GameEngine.hideLoadingScreen();
               NetworkManager.instance.playRecording(array[0].data);
               array[0].views += 1;
               array[0].save();
               if(GameEngine.isPlayBackClient())
               {
                  informWatchPage(array[0]);
               }
            }
         },function(e:PlayerIOError):*
         {
            trace(e);
            if(!GameEngine.isPlayBackClient())
            {
               GameEngine.hideLoadingScreen();
            }
         });
      }
      
      override public function updateGlobalVar(varid:int, value:int) : *
      {
         OverworldHUD.instance.globalVarDialog.addGlobalVar(varid,value);
         if(StatsManager.skipUpdateGlobalVar || offlineMode)
         {
            trace("skipping global var update: " + varid + " " + value);
            return;
         }
         if(varid == 50005 || varid == 50006)
         {
            return;
         }
         NetworkManager.instance.updateGlobalVar(varid,value);
      }
      
      override public function getGlobalVar(varid:int) : *
      {
         this.client.bigDB.load("GeneralData",varid.toString(),function(o:DatabaseObject):*
         {
            trace(o.value);
         },function(e:PlayerIOError):*
         {
            trace(0);
         });
      }
      
      public function getRecentEvents(mapid:int) : *
      {
         var tx:int = 0;
         var ty:int = 0;
         this.client.bigDB.loadRange("WorldSimHistory","ByMapId",[mapid],null,null,3,function(array:Array):*
         {
            tx = mapid >> 12 & 0x0FFF;
            ty = mapid & 0x0FFF;
            NodeGenerator.instance.getTerritoryData(tx,ty,false).gotRecentEvents(array);
         },function(e:PlayerIOError):*
         {
            trace(e);
            tx = mapid >> 12 & 0x0FFF;
            ty = mapid & 0x0FFF;
            NodeGenerator.instance.getTerritoryData(tx,ty,false).gotRecentEvents(null);
         });
      }
      
      override public function whois(charname:String) : *
      {
         if(offlineMode)
         {
            return;
         }
         NetworkManager.instance.connectionGlobalPIO.send("whois",charname);
      }
      
      override public function getPlayerLocation(charname:String) : *
      {
         if(offlineMode)
         {
            return;
         }
         NetworkManager.instance.connectionGlobalPIO.send("whereis",charname);
      }
      
      public function showAllOnline() : *
      {
         this.client.bigDB.loadRange("OnlinePlayers","ByRoomId",null,null,null,100,function(array:Array):*
         {
            if(array.length == 100)
            {
               OverworldHUD.instance.updateChatLogWordsOnly(">100 players found","#FFCC00");
            }
            else
            {
               OverworldHUD.instance.updateChatLogWordsOnly(array.length + " player(s) found","#FFCC00");
            }
            for(var i:int = 0; i < array.length; i++)
            {
               OverworldHUD.instance.updateChatLogWordsOnly(array[i].key,"#FFFFFF");
            }
         },function(e:PlayerIOError):*
         {
            trace(e);
         });
      }
      
      override internal function checkTimeSkip() : *
      {
         if(StatsManager.nextWarTurn - serverTime > StatsManager.WARMOVEINTERVAL)
         {
            StatsManager.nextWarTurn = serverTime;
            this.playerObj.warupdate = StatsManager.nextWarTurn;
         }
         if(StatsManager.nextAPUpdate - serverTime > StatsManager.APINTERVAL)
         {
            StatsManager.nextAPUpdate = serverTime;
            this.playerObj.apupdate = StatsManager.nextAPUpdate;
         }
         if(StatsManager.nextDTUpdate - serverTime > StatsManager.DTINTERVAL)
         {
            StatsManager.nextDTUpdate = serverTime;
            this.playerObj.dtupdate = StatsManager.nextDTUpdate;
         }
         this.playerObj.save();
      }
      
      override public function changeName(newname:String) : *
      {
         if(offlineMode)
         {
            return;
         }
         NetworkManager.instance.changeName(newname);
      }
      
      public function loadCustomClanData(clanId:int, callback:Function = null) : *
      {
         if(callback != null && this.clanDataCache.contains(clanId))
         {
            callback(this.clanDataCache.get(clanId));
            return;
         }
         this.client.bigDB.load("ClanData",clanId.toString(),function(o:DatabaseObject):*
         {
            if(o == null)
            {
               o = new DatabaseObject(null,null,null,null,null,null);
               o.clanname = "?";
               o.color = 3355443;
               o.logo = 1;
               o.logocolor = 13421772;
               o.acronym = "???";
               o.owned = 0;
               o.founder = "?";
            }
            if(clanId == StatsManager.getSide())
            {
               StatsManager.initCustomClan(o.clanname,o.color,o.logo,o.logocolor,o.acronym,o.founder,o.owned);
            }
            clanDataCache.put(clanId,o);
            if(callback != null)
            {
               callback(o);
            }
         });
      }
      
      public function loadCustomClanDataRange(keys:Array, callback:Function) : *
      {
         if(keys == null || keys.length == 0)
         {
            callback();
            return;
         }
         this.client.bigDB.loadKeys("ClanData",keys,function(array:Array):*
         {
            var o:DatabaseObject = null;
            var max:int = int(array.length);
            for(var i:int = 0; i < max; i++)
            {
               o = array[i];
               clanDataCache.put(int(o.key),o,true);
            }
            callback();
         },function(error:PlayerIOError):*
         {
            callback();
         });
      }
      
      public function hasCustomClanData(clanId:int) : Boolean
      {
         return this.clanDataCache.contains(clanId);
      }
      
      public function getCustomClanData(clanId:int) : DatabaseObject
      {
         return this.clanDataCache.get(clanId);
      }
      
      public function updateCustomClanData(clanId:int, _customClanName:String, _customClanColor:int, _customClanLogoId:int, _customClanLogoColor:int, _customClanAcronym:String, _customClanFounder:String, _customClanOwned:int) : *
      {
         var o:DatabaseObject = this.clanDataCache.get(clanId);
         if(o != null)
         {
            o.clanname = _customClanName;
            o.color = _customClanColor;
            o.logo = _customClanLogoId;
            o.logocolor = _customClanLogoColor;
            o.acronym = _customClanAcronym;
            o.founder = _customClanFounder;
            o.owned = _customClanOwned;
         }
      }
      
      public function getStoredLegendaryItem(level:int, callback:Function) : *
      {
         this.client.bigDB.loadRange("ItemData","ByLevel",null,[level],[level + 3],100,function(array:Array):*
         {
            if(array.length == 0)
            {
               callback(new Item(2128));
            }
            var index:int = Math.random() * array.length;
            callback(Item.parseNoQty(array[index].itemdata));
         });
      }
      
      override public function reportGotGold(num:int, method:String) : *
      {
         if(StatsManager.skipUpdateGlobalVar || offlineMode)
         {
            return;
         }
         super.reportGotGold(num,method);
         var o:Object = new Object();
         o.publisherId = GameEngine.getPublisherId();
         var amt:Number = 0;
         if(num == 10)
         {
            amt = 5;
         }
         else if(num == 25)
         {
            amt = 5;
         }
         else if(num == 40)
         {
            amt = 15;
         }
         else if(num == 55)
         {
            amt = 20;
         }
         else if(num == 75)
         {
            amt = 50;
         }
         o.amount = amt;
         var dateTime:Number = new Date().getTime();
         o.dateTime = dateTime;
         o.processed = false;
         this.client.bigDB.createObject("EpicPayHistory",null,o);
      }
   }
}

