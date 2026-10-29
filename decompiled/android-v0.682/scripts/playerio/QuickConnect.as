package playerio
{
   import flash.display.Stage;
   import flash.net.LocalConnection;
   import flash.net.URLRequest;
   import flash.net.URLVariables;
   import flash.net.navigateToURL;
   import playerio.generated.PlayerIOError;
   import playerio.generated.QuickConnect;
   import playerio.generated.messages.KeyValuePair;
   import playerio.generated.messages.PlayerInsightState;
   import playerio.utils.HTTPChannel;
   import playerio.utils.Utilities;
   
   public class QuickConnect extends playerio.generated.QuickConnect
   {
      
      private var connections:Array = [];
      
      public function QuickConnect(channel:HTTPChannel)
      {
         super(channel);
      }
      
      public function simpleConnect(stage:Stage, gameId:String, usernameOrEmail:String, password:String, playerInsightSegments:* = null, callback:* = null, errorHandler:* = null) : void
      {
         if(stage == null || stage.stage == null)
         {
            throw new Error("Parsed stage is not attached to document stage",2);
         }
         if(playerInsightSegments is Function)
         {
            simpleConnect(stage,gameId,usernameOrEmail,password,null,playerInsightSegments,callback);
            return;
         }
         _simpleConnect(gameId,usernameOrEmail,password,playerInsightSegments,Utilities.clientAPI,Utilities.getSystemInfo(),function(t:String, userId:String, showBranding:Boolean, fsmap:String, partnerId:String, state:PlayerInsightState):void
         {
            if(showBranding && Minilogo.showLogo)
            {
               stage.addChild(new Minilogo());
            }
            var nc:HTTPChannel = PlayerIO.getChannel();
            nc.token = t;
            callback(new Client(stage,nc,gameId,fsmap,t,userId,showBranding,state));
         },errorHandler);
      }
      
      public function simpleRegister(stage:Stage, gameId:String, usernameOrEmail:String, password:String, email:String, captchaKey:String, captchaValue:String, extraData:Object, partnerId:* = null, playerInsightSegments:* = null, callback:* = null, errorHandler:* = null) : void
      {
         if(stage == null || stage.stage == null)
         {
            throw new Error("Parsed stage is not attached to document stage",2);
         }
         if(partnerId is Function)
         {
            simpleRegister(stage,gameId,usernameOrEmail,password,email,captchaKey,captchaValue,extraData,null,null,partnerId,playerInsightSegments);
            return;
         }
         if(playerInsightSegments is Function)
         {
            simpleRegister(stage,gameId,usernameOrEmail,password,email,captchaKey,captchaValue,extraData,partnerId,null,playerInsightSegments,callback);
            return;
         }
         _simpleRegister(gameId,usernameOrEmail,password,email,captchaKey,captchaValue,extraData,partnerId,playerInsightSegments,Utilities.clientAPI,Utilities.getSystemInfo(),function(t:String, userId:String, showBranding:Boolean, fsmap:String, partnerId:String, state:PlayerInsightState):void
         {
            if(showBranding && Minilogo.showLogo)
            {
               stage.addChild(new Minilogo());
            }
            var nc:HTTPChannel = PlayerIO.getChannel();
            nc.token = t;
            callback(new Client(stage,nc,gameId,fsmap,t,userId,showBranding,state));
         },errorHandler);
      }
      
      override public function simpleGetCaptcha(gameId:String, width:int, height:int, callback:Function = null, errorHandler:Function = null) : void
      {
         super.simpleGetCaptcha(gameId,width,height,callback,errorHandler);
      }
      
      override public function simpleRecoverPassword(gameId:String, usernameOrEmail:String, callback:Function = null, errorHandler:Function = null) : void
      {
         super.simpleRecoverPassword(gameId,usernameOrEmail,callback,errorHandler);
      }
      
      public function facebookConnect(stage:Stage, gameId:String, uid:String, sessionKey:String, partnerid:* = null, playerInsightSegments:* = null, callback:* = null, errorHandler:* = null) : void
      {
         throw new Error("ERROR: facebookConnect is deprecated as Facebook is switching to OAuth. Please use facebookOAuthConnect instead.");
      }
      
      public function facebookOAuthConnect(stage:Stage, gameId:String, accessToken:String, partnerId:* = null, playerInsightSegments:* = null, callback:* = null, errorHandler:* = null) : void
      {
         if(stage == null || stage.stage == null)
         {
            throw new Error("Parsed stage is not attached to document stage",2);
         }
         if(partnerId is Function)
         {
            facebookOAuthConnect(stage,gameId,accessToken,null,null,partnerId,playerInsightSegments);
            return;
         }
         if(playerInsightSegments is Function)
         {
            facebookOAuthConnect(stage,gameId,accessToken,partnerId,null,playerInsightSegments,callback);
            return;
         }
         _facebookOAuthConnect(gameId,accessToken,partnerId,playerInsightSegments,Utilities.clientAPI,Utilities.getSystemInfo(),function(t:String, userId:String, showBranding:Boolean, fsmap:String, fbuserid:String, partnerId:String, state:PlayerInsightState):void
         {
            if(showBranding && Minilogo.showLogo)
            {
               stage.addChild(new Minilogo());
            }
            var nc:HTTPChannel = PlayerIO.getChannel();
            nc.token = t;
            callback(new Client(stage,nc,gameId,fsmap,t,userId,showBranding,state),fbuserid);
         },errorHandler);
      }
      
      public function kongregateConnect(stage:Stage, gameId:String, userId:String, gameAuthToken:String, playerInsightSegments:* = null, callback:* = null, errorHandler:* = null) : void
      {
         if(stage == null || stage.stage == null)
         {
            throw new Error("Parsed stage is not attached to document stage",2);
         }
         if(playerInsightSegments is Function)
         {
            kongregateConnect(stage,gameId,userId,gameAuthToken,null,playerInsightSegments,callback);
            return;
         }
         _kongregateConnect(gameId,userId,gameAuthToken,playerInsightSegments,Utilities.clientAPI,Utilities.getSystemInfo(),function(t:String, userId:String, showBranding:Boolean, fsmap:String, state:PlayerInsightState):void
         {
            if(showBranding && Minilogo.showLogo)
            {
               stage.addChild(new Minilogo());
            }
            var nc:HTTPChannel = PlayerIO.getChannel();
            nc.token = t;
            callback(new Client(stage,nc,gameId,fsmap,t,userId,showBranding,state));
         },errorHandler);
      }
      
      public function facebookOAuthConnectPopup(stage:Stage, gameId:String, window:String, permissions:Array = null, partnerId:* = null, playerInsightSegments:* = null, callback:* = null, errorHandler:* = null) : void
      {
         var legacy:Boolean;
         var e:playerio.generated.PlayerIOError;
         var url:String;
         var variables:URLVariables;
         var commid:String;
         var request:URLRequest;
         var receivingLC:LocalConnection;
         if(stage == null || stage.stage == null)
         {
            throw new Error("Parsed stage is not attached to document stage",2);
         }
         if(partnerId is Function)
         {
            facebookOAuthConnectPopup(stage,gameId,window,permissions,null,partnerId,playerInsightSegments);
            return;
         }
         if(playerInsightSegments is Function)
         {
            facebookOAuthConnectPopup(stage,gameId,window,permissions,partnerId,null,playerInsightSegments,callback);
            return;
         }
         legacy = false;
         if(gameId.substring(0,1) == "@")
         {
            legacy = true;
            gameId = gameId.substring(1);
         }
         if(/\[|\]/gi.test(gameId))
         {
            e = new playerio.generated.PlayerIOError("The Player.IO Game id \"" + gameId + "\" contains invalid characters, did you insert your game id?",1);
            if(errorHandler != null)
            {
               errorHandler(e);
               return;
            }
            throw e;
         }
         if(legacy)
         {
            url = "http://fb.playerio.com/fb/" + gameId + "/_fb_quickconnect_oauth";
         }
         else
         {
            url = "http://" + gameId + ".fb.playerio.com/fb/_fb_quickconnect_oauth";
         }
         variables = new URLVariables();
         commid = Math.floor(new Date().getTime()).toString() + (Math.random() * 999999 >> 0).toString();
         variables.req_perms = permissions ? permissions.join(",") : "";
         variables.communicationId = commid;
         variables.partnerId = partnerId;
         variables.clientapi = Utilities.clientAPI;
         variables.clientinfo = Utilities.getSystemInfoString();
         variables.playerinsightsegments = (playerInsightSegments || []).join(",");
         request = new URLRequest(url);
         request.data = variables;
         request.method = "POST";
         try
         {
            navigateToURL(request,window);
         }
         catch(e:Error)
         {
            trace("Error occurred!");
         }
         receivingLC = new LocalConnection();
         connections.push(receivingLC);
         receivingLC.client = {"oauth2":function(token:String, access_token:String, uid:String, userId:String = "", showBranding:Boolean = true, fsmap:String = "", partnerId:String = null, playersOnline:String = "-1", segments:String = ""):void
         {
            var a:int = 0;
            var cs:Array = null;
            var insightSegment:KeyValuePair = null;
            if(showBranding && Minilogo.showLogo)
            {
               stage.addChild(new Minilogo());
            }
            var nc:HTTPChannel = PlayerIO.getChannel();
            nc.token = token;
            var state:PlayerInsightState = new PlayerInsightState();
            state.playersOnline = parseInt(playersOnline || "-1");
            var seg:Array = (segments || "").split(",");
            for(a = 0; a < seg.length; )
            {
               cs = seg[a].split(":");
               insightSegment = new KeyValuePair();
               insightSegment.key = cs[0];
               insightSegment.value = cs[1];
               state.segments.push(insightSegment);
               a++;
            }
            callback(new Client(stage,nc,gameId,fsmap,token,userId,showBranding,state),access_token,uid);
         }};
         receivingLC.allowDomain("*");
         receivingLC.connect("_facebook_" + commid);
      }
      
      public function facebookConnectPopup(stage:Stage, gameId:String, window:String, permissions:Array = null, partnerId:* = null, callback:* = null, errorHandler:* = null) : void
      {
         throw new Error("FacebookConnectPopup is no longer supported by Facebook. Please use FacebookConnectOAuthPopup");
      }
   }
}

