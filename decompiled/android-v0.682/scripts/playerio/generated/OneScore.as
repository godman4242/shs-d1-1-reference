package playerio.generated
{
   import flash.events.EventDispatcher;
   import playerio.Client;
   import playerio.generated.messages.OneScoreAddArgs;
   import playerio.generated.messages.OneScoreAddError;
   import playerio.generated.messages.OneScoreAddOutput;
   import playerio.generated.messages.OneScoreLoadArgs;
   import playerio.generated.messages.OneScoreLoadError;
   import playerio.generated.messages.OneScoreLoadOutput;
   import playerio.generated.messages.OneScoreRefreshArgs;
   import playerio.generated.messages.OneScoreRefreshError;
   import playerio.generated.messages.OneScoreRefreshOutput;
   import playerio.generated.messages.OneScoreSetArgs;
   import playerio.generated.messages.OneScoreSetError;
   import playerio.generated.messages.OneScoreSetOutput;
   import playerio.utils.HTTPChannel;
   
   public class OneScore extends EventDispatcher
   {
      
      protected var channel:HTTPChannel;
      
      protected var client:Client;
      
      public function OneScore(channel:HTTPChannel, client:Client)
      {
         super();
         this.channel = channel;
         this.client = client;
      }
      
      public function oneScoreRefresh(callback:Function = null, errorHandler:Function = null) : void
      {
         var input:OneScoreRefreshArgs = new OneScoreRefreshArgs();
         var output:OneScoreRefreshOutput = new OneScoreRefreshOutput();
         channel.Request(360,input,output,new OneScoreRefreshError(),function(output:OneScoreRefreshOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback(output.oneScore);
               }
               catch(e:Error)
               {
                  client.handleCallbackError("OneScore.oneScoreRefresh",e);
                  throw e;
               }
            }
         },function(error:OneScoreRefreshError):void
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
      
      public function oneScoreSet(score:int, callback:Function = null, errorHandler:Function = null) : void
      {
         var input:OneScoreSetArgs = new OneScoreSetArgs(score);
         var output:OneScoreSetOutput = new OneScoreSetOutput();
         channel.Request(354,input,output,new OneScoreSetError(),function(output:OneScoreSetOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback(output.oneScore);
               }
               catch(e:Error)
               {
                  client.handleCallbackError("OneScore.oneScoreSet",e);
                  throw e;
               }
            }
         },function(error:OneScoreSetError):void
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
      
      public function oneScoreAdd(score:int, callback:Function = null, errorHandler:Function = null) : void
      {
         var input:OneScoreAddArgs = new OneScoreAddArgs(score);
         var output:OneScoreAddOutput = new OneScoreAddOutput();
         channel.Request(357,input,output,new OneScoreAddError(),function(output:OneScoreAddOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback(output.oneScore);
               }
               catch(e:Error)
               {
                  client.handleCallbackError("OneScore.oneScoreAdd",e);
                  throw e;
               }
            }
         },function(error:OneScoreAddError):void
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
      
      public function oneScoreLoad(userIds:Array, callback:Function = null, errorHandler:Function = null) : void
      {
         var input:OneScoreLoadArgs = new OneScoreLoadArgs(userIds);
         var output:OneScoreLoadOutput = new OneScoreLoadOutput();
         channel.Request(351,input,output,new OneScoreLoadError(),function(output:OneScoreLoadOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback(output.oneScores);
               }
               catch(e:Error)
               {
                  client.handleCallbackError("OneScore.oneScoreLoad",e);
                  throw e;
               }
            }
         },function(error:OneScoreLoadError):void
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

