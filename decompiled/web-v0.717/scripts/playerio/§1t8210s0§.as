package playerio
{
   import §1t51s0§.§1t51s1§.§1t52s0§;
   import §1t51s0§.§1t51s1§.Utilities;
   import flash.display.Stage;
   import playerio.generated.§1t8210s0§;
   import playerio.generated.PlayerIOError;
   import playerio.generated.messages.AuthenticateStartDialog;
   import playerio.generated.messages.KeyValuePair;
   import playerio.generated.messages.PlayerInsightState;
   
   public final class §1t8210s0§ extends playerio.generated.§1t8210s0§
   {
      
      public namespace inside = "http://playerio.com/inside/";
      
      public static var useSecureApiRequests:Boolean = false;
      
      public function §1t8210s0§()
      {
         super();
      }
      
      internal static function getChannel() : §1t52s0§
      {
         return new §1t52s0§(useSecureApiRequests);
      }
      
      public static function connect(param1:Stage, param2:String, param3:String, param4:String, param5:String, param6:* = null, param7:* = null, param8:* = null, param9:* = null) : void
      {
         new playerio.§1t8210s0§().connect(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public static function authenticate(param1:Stage, param2:String, param3:String, param4:Object, param5:* = null, param6:* = null, param7:* = null) : void
      {
         new playerio.§1t8210s0§().authenticate(param1,param2,param3,param4,param5,param6,param7);
      }
      
      private static function authSuccess(param1:§1t150s0§, param2:§1t52s0§, param3:Array, param4:Function) : void
      {
         var §1t6486s0§:AuthenticateStartDialog;
         var dialogArgs:Object;
         var a:int;
         var kvp:KeyValuePair;
         var client:§1t150s0§ = param1;
         var channel:§1t52s0§ = param2;
         var dialogs:Array = param3;
         var §1t9313s0§:Function = param4;
         if(dialogs == null || dialogs.length == 0)
         {
            if(§1t9313s0§ != null)
            {
               §1t9313s0§(client);
            }
         }
         else
         {
            §1t6486s0§ = dialogs[0];
            dialogArgs = {};
            if(§1t6486s0§.arguments != null)
            {
               a = 0;
               while(a < §1t6486s0§.arguments.length)
               {
                  kvp = §1t6486s0§.arguments[a] as KeyValuePair;
                  dialogArgs[kvp.key] = kvp.value;
                  a = a + 1;
               }
            }
            §1t2768s0§.§1t6527s0§(§1t6486s0§.name,dialogArgs,channel,function(param1:Object):void
            {
               dialogs.shift();
               authSuccess(client,channel,dialogs,§1t9313s0§);
            });
         }
      }
      
      public static function get quickConnect() : §1t430s0§
      {
         return new §1t430s0§(getChannel());
      }
      
      public static function gameFS(param1:String) : §1t43s0§
      {
         return new §1t43s0§(param1,null);
      }
      
      private function connect(param1:Stage, param2:String, param3:String, param4:String, param5:String, param6:* = null, param7:* = null, param8:* = null, param9:* = null) : void
      {
         var stage:Stage = param1;
         var gameId:String = param2;
         var connectionId:String = param3;
         var userId:String = param4;
         var auth:String = param5;
         var partnerId:* = param6;
         var playerInsightSegments:* = param7;
         var callback:* = param8;
         var errorHandler:* = param9;
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
         _connect(getChannel(),gameId,connectionId,userId,auth,partnerId,playerInsightSegments,Utilities.clientAPI,Utilities.getSystemInfo(),function(param1:String, param2:String, param3:Boolean, param4:String, param5:String, param6:PlayerInsightState):void
         {
            if(stage && param3 && §1t8214s0§.§1t12608s0§)
            {
               stage.addChild(new §1t8214s0§());
            }
            var _loc7_:§1t52s0§ = getChannel();
            _loc7_.token = param1;
            callback(new §1t150s0§(stage,_loc7_,gameId,param4,param1,userId,param3,param6));
         },errorHandler);
      }
      
      private function authenticate(param1:Stage, param2:String, param3:String, param4:Object, param5:Array, param6:Function, param7:Function) : void
      {
         var stage:Stage = param1;
         var gameId:String = param2;
         var connectionId:String = param3;
         var authenticationArguments:Object = param4;
         var playerInsightSegments:Array = param5;
         var callback:Function = param6;
         var errorHandler:Function = param7;
         if(authenticationArguments["yahoologin"] != undefined && authenticationArguments["yahoologin"] == "auto")
         {
            §1t2768s0§.§1t6527s0§("login",{
               "gameId":gameId,
               "connectionId":connectionId,
               "__use_usertoken__":"true"
            },null,function(param1:Object):void
            {
               if(param1["error"] != undefined)
               {
                  errorHandler(new playerio.generated.PlayerIOError(param1["error"],playerio.PlayerIOError.GeneralError.errorID));
               }
               else if(param1["userToken"] == undefined)
               {
                  errorHandler(new playerio.generated.PlayerIOError("Missing userToken value in result, but no error message given.",playerio.PlayerIOError.GeneralError.errorID));
               }
               else
               {
                  authenticate(stage,gameId,connectionId,{"userToken":param1["userToken"]},playerInsightSegments,callback,errorHandler);
               }
            });
            return;
         }
         §1t8213s0§(getChannel(),gameId,connectionId,authenticationArguments,playerInsightSegments,Utilities.clientAPI,Utilities.getSystemInfo(),null,function(param1:String, param2:String, param3:Boolean, param4:String, param5:PlayerInsightState, param6:Array, param7:Boolean, param8:Array, param9:String):void
         {
            var _loc10_:§1t52s0§ = new §1t52s0§(useSecureApiRequests);
            _loc10_.token = param1;
            authSuccess(new §1t150s0§(stage,_loc10_,gameId,param4,param1,param2,param3,param5),_loc10_,param6,callback);
         },errorHandler);
      }
   }
}

