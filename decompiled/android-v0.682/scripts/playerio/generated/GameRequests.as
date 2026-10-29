package playerio.generated
{
   import flash.events.EventDispatcher;
   import playerio.Client;
   import playerio.generated.messages.GameRequestsDeleteArgs;
   import playerio.generated.messages.GameRequestsDeleteError;
   import playerio.generated.messages.GameRequestsDeleteOutput;
   import playerio.generated.messages.GameRequestsRefreshArgs;
   import playerio.generated.messages.GameRequestsRefreshError;
   import playerio.generated.messages.GameRequestsRefreshOutput;
   import playerio.generated.messages.GameRequestsSendArgs;
   import playerio.generated.messages.GameRequestsSendError;
   import playerio.generated.messages.GameRequestsSendOutput;
   import playerio.utils.Converter;
   import playerio.utils.HTTPChannel;
   
   public class GameRequests extends EventDispatcher
   {
      
      protected var channel:HTTPChannel;
      
      protected var client:Client;
      
      public function GameRequests(channel:HTTPChannel, client:Client)
      {
         super();
         this.channel = channel;
         this.client = client;
      }
      
      protected function _gameRequestsSend(requestType:String, requestData:Object, requestRecipients:Array, callback:Function = null, errorHandler:Function = null) : void
      {
         var input:GameRequestsSendArgs = new GameRequestsSendArgs(requestType,Converter.toKeyValueArray(requestData),requestRecipients);
         var output:GameRequestsSendOutput = new GameRequestsSendOutput();
         channel.Request(241,input,output,new GameRequestsSendError(),function(output:GameRequestsSendOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback();
               }
               catch(e:Error)
               {
                  client.handleCallbackError("GameRequests.gameRequestsSend",e);
                  throw e;
               }
            }
         },function(error:GameRequestsSendError):void
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
      
      protected function _gameRequestsRefresh(playCodes:Array, callback:Function = null, errorHandler:Function = null) : void
      {
         var input:GameRequestsRefreshArgs = new GameRequestsRefreshArgs(playCodes);
         var output:GameRequestsRefreshOutput = new GameRequestsRefreshOutput();
         channel.Request(244,input,output,new GameRequestsRefreshError(),function(output:GameRequestsRefreshOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback(output.requests,output.moreRequestsWaiting,output.newPlayCodes);
               }
               catch(e:Error)
               {
                  client.handleCallbackError("GameRequests.gameRequestsRefresh",e);
                  throw e;
               }
            }
         },function(error:GameRequestsRefreshError):void
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
      
      protected function _gameRequestsDelete(requestIds:Array, callback:Function = null, errorHandler:Function = null) : void
      {
         var input:GameRequestsDeleteArgs = new GameRequestsDeleteArgs(requestIds);
         var output:GameRequestsDeleteOutput = new GameRequestsDeleteOutput();
         channel.Request(247,input,output,new GameRequestsDeleteError(),function(output:GameRequestsDeleteOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback(output.requests,output.moreRequestsWaiting);
               }
               catch(e:Error)
               {
                  client.handleCallbackError("GameRequests.gameRequestsDelete",e);
                  throw e;
               }
            }
         },function(error:GameRequestsDeleteError):void
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

