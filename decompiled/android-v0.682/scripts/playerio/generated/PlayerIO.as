package playerio.generated
{
   import flash.display.MovieClip;
   import playerio.generated.messages.AuthenticateArgs;
   import playerio.generated.messages.AuthenticateError;
   import playerio.generated.messages.AuthenticateOutput;
   import playerio.generated.messages.ConnectArgs;
   import playerio.generated.messages.ConnectError;
   import playerio.generated.messages.ConnectOutput;
   import playerio.utils.Converter;
   import playerio.utils.HTTPChannel;
   
   public class PlayerIO extends MovieClip
   {
      
      public function PlayerIO()
      {
         super();
      }
      
      protected function _connect(channel:HTTPChannel, gameId:String, connectionId:String, userId:String, auth:String, partnerId:String, playerInsightSegments:Array, clientAPI:String, clientInfo:Object, callback:Function = null, errorHandler:Function = null) : void
      {
         var input:ConnectArgs = new ConnectArgs(gameId,connectionId,userId,auth,partnerId,playerInsightSegments,clientAPI,Converter.toKeyValueArray(clientInfo));
         var output:ConnectOutput = new ConnectOutput();
         channel.Request(10,input,output,new ConnectError(),function(output:ConnectOutput):void
         {
            if(callback != null)
            {
               callback(output.token,output.userId,output.showBranding,output.gameFSRedirectMap,output.partnerId,output.playerInsightState);
            }
         },function(error:ConnectError):void
         {
            var e:PlayerIOError = new PlayerIOError(error.message,error.errorCode);
            if(errorHandler != null)
            {
               errorHandler(e);
               return;
            }
            throw e;
         });
      }
      
      protected function _authenticate(channel:HTTPChannel, gameId:String, connectionId:String, authenticationArguments:Object, playerInsightSegments:Array, clientAPI:String, clientInfo:Object, playCodes:Array, callback:Function = null, errorHandler:Function = null) : void
      {
         var input:AuthenticateArgs = new AuthenticateArgs(gameId,connectionId,Converter.toKeyValueArray(authenticationArguments),playerInsightSegments,clientAPI,Converter.toKeyValueArray(clientInfo),playCodes);
         var output:AuthenticateOutput = new AuthenticateOutput();
         channel.Request(13,input,output,new AuthenticateError(),function(output:AuthenticateOutput):void
         {
            if(callback != null)
            {
               callback(output.token,output.userId,output.showBranding,output.gameFSRedirectMap,output.playerInsightState,output.startDialogs,output.isSocialNetworkUser,output.newPlayCodes,output.notificationClickPayload);
            }
         },function(error:AuthenticateError):void
         {
            var e:PlayerIOError = new PlayerIOError(error.message,error.errorCode);
            if(errorHandler != null)
            {
               errorHandler(e);
               return;
            }
            throw e;
         });
      }
   }
}

