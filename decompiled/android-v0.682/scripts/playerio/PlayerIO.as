package playerio
{
   import flash.display.Stage;
   import playerio.generated.PlayerIO;
   import playerio.generated.PlayerIOError;
   import playerio.generated.messages.AuthenticateStartDialog;
   import playerio.generated.messages.KeyValuePair;
   import playerio.generated.messages.PlayerInsightState;
   import playerio.utils.HTTPChannel;
   import playerio.utils.Utilities;
   
   public final class PlayerIO extends playerio.generated.PlayerIO
   {
      
      public namespace inside = "http://playerio.com/inside/";
      
      public static var useSecureApiRequests:Boolean = false;
      
      public function PlayerIO()
      {
         super();
      }
      
      internal static function getChannel() : HTTPChannel
      {
         return new HTTPChannel(useSecureApiRequests);
      }
      
      public static function connect(stage:Stage, gameId:String, connectionId:String, userId:String, auth:String, partnerId:* = null, playerInsightSegments:* = null, callback:* = null, errorHandler:* = null) : void
      {
         new playerio.PlayerIO().connect(stage,gameId,connectionId,userId,auth,partnerId,playerInsightSegments,callback,errorHandler);
      }
      
      public static function authenticate(stage:Stage, gameId:String, connectionId:String, authenticationArguments:Object, playerInsightSegments:* = null, callback:* = null, errorHandler:* = null) : void
      {
         new playerio.PlayerIO().authenticate(stage,gameId,connectionId,authenticationArguments,playerInsightSegments,callback,errorHandler);
      }
      
      private static function authSuccess(client:Client, channel:HTTPChannel, dialogs:Array, successCallback:Function) : void
      {
         var dialog:AuthenticateStartDialog;
         var dialogArgs:Object;
         var a:int;
         var kvp:KeyValuePair;
         if(dialogs == null || dialogs.length == 0)
         {
            if(successCallback != null)
            {
               successCallback(client);
            }
         }
         else
         {
            dialog = dialogs[0];
            dialogArgs = {};
            if(dialog.arguments != null)
            {
               for(a = 0; a < dialog.arguments.length; )
               {
                  kvp = dialog.arguments[a] as KeyValuePair;
                  dialogArgs[kvp.key] = kvp.value;
                  a = a + 1;
               }
            }
            YahooDialog.showDialog(dialog.name,dialogArgs,channel,function(result:Object):void
            {
               dialogs.shift();
               authSuccess(client,channel,dialogs,successCallback);
            });
         }
      }
      
      public static function get quickConnect() : QuickConnect
      {
         return new QuickConnect(getChannel());
      }
      
      public static function gameFS(gameId:String) : GameFS
      {
         return new GameFS(gameId,null);
      }
      
      private function connect(stage:Stage, gameId:String, connectionId:String, userId:String, auth:String, partnerId:* = null, playerInsightSegments:* = null, callback:* = null, errorHandler:* = null) : void
      {
         if(partnerId is Function)
         {
            connect(stage,gameId,connectionId,userId,auth,null,null,partnerId,playerInsightSegments);
            return;
         }
         if(playerInsightSegments is Function)
         {
            connect(stage,gameId,connectionId,userId,auth,partnerId,null,playerInsightSegments,callback);
            return;
         }
         _connect(getChannel(),gameId,connectionId,userId,auth,partnerId,playerInsightSegments,Utilities.clientAPI,Utilities.getSystemInfo(),function(token:String, userid:String, showBranding:Boolean, fsmap:String, partnerId:String, playerInsightState:PlayerInsightState):void
         {
            if(stage && showBranding && Minilogo.showLogo)
            {
               stage.addChild(new Minilogo());
            }
            var nc:HTTPChannel = getChannel();
            nc.token = token;
            callback(new Client(stage,nc,gameId,fsmap,token,userId,showBranding,playerInsightState));
         },errorHandler);
      }
      
      private function authenticate(stage:Stage, gameId:String, connectionId:String, authenticationArguments:Object, playerInsightSegments:Array, callback:Function, errorHandler:Function) : void
      {
         if(authenticationArguments["yahoologin"] != undefined && authenticationArguments["yahoologin"] == "auto")
         {
            YahooDialog.showDialog("login",{
               "gameId":gameId,
               "connectionId":connectionId,
               "__use_usertoken__":"true"
            },null,function(response:Object):void
            {
               if(response["error"] != undefined)
               {
                  errorHandler(new playerio.generated.PlayerIOError(response["error"],playerio.PlayerIOError.GeneralError.errorID));
               }
               else if(response["userToken"] == undefined)
               {
                  errorHandler(new playerio.generated.PlayerIOError("Missing userToken value in result, but no error message given.",playerio.PlayerIOError.GeneralError.errorID));
               }
               else
               {
                  authenticate(stage,gameId,connectionId,{"userToken":response["userToken"]},playerInsightSegments,callback,errorHandler);
               }
            });
            return;
         }
         _authenticate(getChannel(),gameId,connectionId,authenticationArguments,playerInsightSegments,Utilities.clientAPI,Utilities.getSystemInfo(),null,function(token:String, userId:String, showBranding:Boolean, gameFSRedirectMap:String, playerInsightState:PlayerInsightState, startDialogs:Array, isSocialNetworkUser:Boolean, newPlayCodes:Array, notificationClickedPayload:String):void
         {
            var nc:HTTPChannel = new HTTPChannel(useSecureApiRequests);
            nc.token = token;
            authSuccess(new Client(stage,nc,gameId,gameFSRedirectMap,token,userId,showBranding,playerInsightState),nc,startDialogs,callback);
         },errorHandler);
      }
   }
}

