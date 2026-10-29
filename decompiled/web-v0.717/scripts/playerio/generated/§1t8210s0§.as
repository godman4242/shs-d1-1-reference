package playerio.generated
{
   import §1t51s0§.§1t51s1§.§1t52s0§;
   import §1t51s0§.§1t51s1§.Converter;
   import flash.display.MovieClip;
   import playerio.generated.messages.AuthenticateArgs;
   import playerio.generated.messages.AuthenticateError;
   import playerio.generated.messages.AuthenticateOutput;
   import playerio.generated.messages.ConnectArgs;
   import playerio.generated.messages.ConnectError;
   import playerio.generated.messages.ConnectOutput;
   
   public class §1t8210s0§ extends MovieClip
   {
      
      public function §1t8210s0§()
      {
         super();
      }
      
      protected function _connect(param1:§1t52s0§, param2:String, param3:String, param4:String, param5:String, param6:String, param7:Array, param8:String, param9:Object, param10:Function = null, param11:Function = null) : void
      {
         var channel:§1t52s0§ = param1;
         var gameId:String = param2;
         var connectionId:String = param3;
         var userId:String = param4;
         var auth:String = param5;
         var partnerId:String = param6;
         var playerInsightSegments:Array = param7;
         var clientAPI:String = param8;
         var clientInfo:Object = param9;
         var callback:Function = param10;
         var errorHandler:Function = param11;
         var input:ConnectArgs = new ConnectArgs(gameId,connectionId,userId,auth,partnerId,playerInsightSegments,clientAPI,Converter.§1t11524s0§(clientInfo));
         var output:ConnectOutput = new ConnectOutput();
         channel.Request(10,input,output,new ConnectError(),function(param1:ConnectOutput):void
         {
            if(callback != null)
            {
               callback(param1.token,param1.userId,param1.showBranding,param1.gameFSRedirectMap,param1.partnerId,param1.playerInsightState);
            }
         },function(param1:ConnectError):void
         {
            var _loc2_:PlayerIOError = new PlayerIOError(param1.message,param1.errorCode);
            if(errorHandler != null)
            {
               errorHandler(_loc2_);
               return;
            }
            throw _loc2_;
         });
      }
      
      protected function §1t8213s0§(param1:§1t52s0§, param2:String, param3:String, param4:Object, param5:Array, param6:String, param7:Object, param8:Array, param9:Function = null, param10:Function = null) : void
      {
         var channel:§1t52s0§ = param1;
         var gameId:String = param2;
         var connectionId:String = param3;
         var authenticationArguments:Object = param4;
         var playerInsightSegments:Array = param5;
         var clientAPI:String = param6;
         var clientInfo:Object = param7;
         var playCodes:Array = param8;
         var callback:Function = param9;
         var errorHandler:Function = param10;
         var input:AuthenticateArgs = new AuthenticateArgs(gameId,connectionId,Converter.§1t11524s0§(authenticationArguments),playerInsightSegments,clientAPI,Converter.§1t11524s0§(clientInfo),playCodes);
         var output:AuthenticateOutput = new AuthenticateOutput();
         channel.Request(13,input,output,new AuthenticateError(),function(param1:AuthenticateOutput):void
         {
            if(callback != null)
            {
               callback(param1.token,param1.userId,param1.showBranding,param1.gameFSRedirectMap,param1.playerInsightState,param1.startDialogs,param1.isSocialNetworkUser,param1.newPlayCodes,param1.notificationClickPayload);
            }
         },function(param1:AuthenticateError):void
         {
            var _loc2_:PlayerIOError = new PlayerIOError(param1.message,param1.errorCode);
            if(errorHandler != null)
            {
               errorHandler(_loc2_);
               return;
            }
            throw _loc2_;
         });
      }
   }
}

