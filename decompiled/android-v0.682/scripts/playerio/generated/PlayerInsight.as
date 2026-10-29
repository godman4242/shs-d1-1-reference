package playerio.generated
{
   import flash.events.EventDispatcher;
   import playerio.Client;
   import playerio.generated.messages.PlayerInsightRefreshArgs;
   import playerio.generated.messages.PlayerInsightRefreshError;
   import playerio.generated.messages.PlayerInsightRefreshOutput;
   import playerio.generated.messages.PlayerInsightSessionKeepAliveArgs;
   import playerio.generated.messages.PlayerInsightSessionKeepAliveError;
   import playerio.generated.messages.PlayerInsightSessionKeepAliveOutput;
   import playerio.generated.messages.PlayerInsightSetSegmentsArgs;
   import playerio.generated.messages.PlayerInsightSetSegmentsError;
   import playerio.generated.messages.PlayerInsightSetSegmentsOutput;
   import playerio.generated.messages.PlayerInsightTrackEventsArgs;
   import playerio.generated.messages.PlayerInsightTrackEventsError;
   import playerio.generated.messages.PlayerInsightTrackEventsOutput;
   import playerio.generated.messages.PlayerInsightTrackExternalPaymentArgs;
   import playerio.generated.messages.PlayerInsightTrackExternalPaymentError;
   import playerio.generated.messages.PlayerInsightTrackExternalPaymentOutput;
   import playerio.generated.messages.PlayerInsightTrackInvitedByArgs;
   import playerio.generated.messages.PlayerInsightTrackInvitedByError;
   import playerio.generated.messages.PlayerInsightTrackInvitedByOutput;
   import playerio.utils.HTTPChannel;
   
   public class PlayerInsight extends EventDispatcher
   {
      
      protected var channel:HTTPChannel;
      
      protected var client:Client;
      
      public function PlayerInsight(channel:HTTPChannel, client:Client)
      {
         super();
         this.channel = channel;
         this.client = client;
      }
      
      protected function _playerInsightRefresh(callback:Function = null, errorHandler:Function = null) : void
      {
         var input:PlayerInsightRefreshArgs = new PlayerInsightRefreshArgs();
         var output:PlayerInsightRefreshOutput = new PlayerInsightRefreshOutput();
         channel.Request(301,input,output,new PlayerInsightRefreshError(),function(output:PlayerInsightRefreshOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback(output.state);
               }
               catch(e:Error)
               {
                  client.handleCallbackError("PlayerInsight.playerInsightRefresh",e);
                  throw e;
               }
            }
         },function(error:PlayerInsightRefreshError):void
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
      
      protected function _playerInsightSetSegments(segments:Array, callback:Function = null, errorHandler:Function = null) : void
      {
         var input:PlayerInsightSetSegmentsArgs = new PlayerInsightSetSegmentsArgs(segments);
         var output:PlayerInsightSetSegmentsOutput = new PlayerInsightSetSegmentsOutput();
         channel.Request(304,input,output,new PlayerInsightSetSegmentsError(),function(output:PlayerInsightSetSegmentsOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback(output.state);
               }
               catch(e:Error)
               {
                  client.handleCallbackError("PlayerInsight.playerInsightSetSegments",e);
                  throw e;
               }
            }
         },function(error:PlayerInsightSetSegmentsError):void
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
      
      protected function _playerInsightTrackInvitedBy(invitingUserId:String, invitationChannel:String, callback:Function = null, errorHandler:Function = null) : void
      {
         var input:PlayerInsightTrackInvitedByArgs = new PlayerInsightTrackInvitedByArgs(invitingUserId,invitationChannel);
         var output:PlayerInsightTrackInvitedByOutput = new PlayerInsightTrackInvitedByOutput();
         channel.Request(307,input,output,new PlayerInsightTrackInvitedByError(),function(output:PlayerInsightTrackInvitedByOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback();
               }
               catch(e:Error)
               {
                  client.handleCallbackError("PlayerInsight.playerInsightTrackInvitedBy",e);
                  throw e;
               }
            }
         },function(error:PlayerInsightTrackInvitedByError):void
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
      
      protected function _playerInsightTrackEvents(events:Array, callback:Function = null, errorHandler:Function = null) : void
      {
         var input:PlayerInsightTrackEventsArgs = new PlayerInsightTrackEventsArgs(events);
         var output:PlayerInsightTrackEventsOutput = new PlayerInsightTrackEventsOutput();
         channel.Request(311,input,output,new PlayerInsightTrackEventsError(),function(output:PlayerInsightTrackEventsOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback();
               }
               catch(e:Error)
               {
                  client.handleCallbackError("PlayerInsight.playerInsightTrackEvents",e);
                  throw e;
               }
            }
         },function(error:PlayerInsightTrackEventsError):void
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
      
      protected function _playerInsightTrackExternalPayment(currency:String, amount:int, callback:Function = null, errorHandler:Function = null) : void
      {
         var input:PlayerInsightTrackExternalPaymentArgs = new PlayerInsightTrackExternalPaymentArgs(currency,amount);
         var output:PlayerInsightTrackExternalPaymentOutput = new PlayerInsightTrackExternalPaymentOutput();
         channel.Request(314,input,output,new PlayerInsightTrackExternalPaymentError(),function(output:PlayerInsightTrackExternalPaymentOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback();
               }
               catch(e:Error)
               {
                  client.handleCallbackError("PlayerInsight.playerInsightTrackExternalPayment",e);
                  throw e;
               }
            }
         },function(error:PlayerInsightTrackExternalPaymentError):void
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
      
      public function playerInsightSessionKeepAlive(callback:Function = null, errorHandler:Function = null) : void
      {
         var input:PlayerInsightSessionKeepAliveArgs = new PlayerInsightSessionKeepAliveArgs();
         var output:PlayerInsightSessionKeepAliveOutput = new PlayerInsightSessionKeepAliveOutput();
         channel.Request(317,input,output,new PlayerInsightSessionKeepAliveError(),function(output:PlayerInsightSessionKeepAliveOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback();
               }
               catch(e:Error)
               {
                  client.handleCallbackError("PlayerInsight.playerInsightSessionKeepAlive",e);
                  throw e;
               }
            }
         },function(error:PlayerInsightSessionKeepAliveError):void
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

