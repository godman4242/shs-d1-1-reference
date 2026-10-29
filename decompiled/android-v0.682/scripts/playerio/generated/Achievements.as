package playerio.generated
{
   import flash.events.EventDispatcher;
   import playerio.Client;
   import playerio.generated.messages.AchievementsLoadArgs;
   import playerio.generated.messages.AchievementsLoadError;
   import playerio.generated.messages.AchievementsLoadOutput;
   import playerio.generated.messages.AchievementsProgressAddArgs;
   import playerio.generated.messages.AchievementsProgressAddError;
   import playerio.generated.messages.AchievementsProgressAddOutput;
   import playerio.generated.messages.AchievementsProgressCompleteArgs;
   import playerio.generated.messages.AchievementsProgressCompleteError;
   import playerio.generated.messages.AchievementsProgressCompleteOutput;
   import playerio.generated.messages.AchievementsProgressMaxArgs;
   import playerio.generated.messages.AchievementsProgressMaxError;
   import playerio.generated.messages.AchievementsProgressMaxOutput;
   import playerio.generated.messages.AchievementsProgressSetArgs;
   import playerio.generated.messages.AchievementsProgressSetError;
   import playerio.generated.messages.AchievementsProgressSetOutput;
   import playerio.generated.messages.AchievementsRefreshArgs;
   import playerio.generated.messages.AchievementsRefreshError;
   import playerio.generated.messages.AchievementsRefreshOutput;
   import playerio.utils.HTTPChannel;
   
   public class Achievements extends EventDispatcher
   {
      
      protected var channel:HTTPChannel;
      
      protected var client:Client;
      
      public function Achievements(channel:HTTPChannel, client:Client)
      {
         super();
         this.channel = channel;
         this.client = client;
      }
      
      protected function _achievementsRefresh(lastVersion:String, callback:Function = null, errorHandler:Function = null) : void
      {
         var input:AchievementsRefreshArgs = new AchievementsRefreshArgs(lastVersion);
         var output:AchievementsRefreshOutput = new AchievementsRefreshOutput();
         channel.Request(271,input,output,new AchievementsRefreshError(),function(output:AchievementsRefreshOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback(output.version,output.achievements);
               }
               catch(e:Error)
               {
                  client.handleCallbackError("Achievements.achievementsRefresh",e);
                  throw e;
               }
            }
         },function(error:AchievementsRefreshError):void
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
      
      protected function _achievementsLoad(userIds:Array, callback:Function = null, errorHandler:Function = null) : void
      {
         var input:AchievementsLoadArgs = new AchievementsLoadArgs(userIds);
         var output:AchievementsLoadOutput = new AchievementsLoadOutput();
         channel.Request(274,input,output,new AchievementsLoadError(),function(output:AchievementsLoadOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback(output.userAchievements);
               }
               catch(e:Error)
               {
                  client.handleCallbackError("Achievements.achievementsLoad",e);
                  throw e;
               }
            }
         },function(error:AchievementsLoadError):void
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
      
      protected function _achievementsProgressSet(achievementId:String, progress:int, callback:Function = null, errorHandler:Function = null) : void
      {
         var input:AchievementsProgressSetArgs = new AchievementsProgressSetArgs(achievementId,progress);
         var output:AchievementsProgressSetOutput = new AchievementsProgressSetOutput();
         channel.Request(277,input,output,new AchievementsProgressSetError(),function(output:AchievementsProgressSetOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback(output.achievement,output.completedNow);
               }
               catch(e:Error)
               {
                  client.handleCallbackError("Achievements.achievementsProgressSet",e);
                  throw e;
               }
            }
         },function(error:AchievementsProgressSetError):void
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
      
      protected function _achievementsProgressAdd(achievementId:String, progressDelta:int, callback:Function = null, errorHandler:Function = null) : void
      {
         var input:AchievementsProgressAddArgs = new AchievementsProgressAddArgs(achievementId,progressDelta);
         var output:AchievementsProgressAddOutput = new AchievementsProgressAddOutput();
         channel.Request(280,input,output,new AchievementsProgressAddError(),function(output:AchievementsProgressAddOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback(output.achievement,output.completedNow);
               }
               catch(e:Error)
               {
                  client.handleCallbackError("Achievements.achievementsProgressAdd",e);
                  throw e;
               }
            }
         },function(error:AchievementsProgressAddError):void
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
      
      protected function _achievementsProgressMax(achievementId:String, progress:int, callback:Function = null, errorHandler:Function = null) : void
      {
         var input:AchievementsProgressMaxArgs = new AchievementsProgressMaxArgs(achievementId,progress);
         var output:AchievementsProgressMaxOutput = new AchievementsProgressMaxOutput();
         channel.Request(283,input,output,new AchievementsProgressMaxError(),function(output:AchievementsProgressMaxOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback(output.achievement,output.completedNow);
               }
               catch(e:Error)
               {
                  client.handleCallbackError("Achievements.achievementsProgressMax",e);
                  throw e;
               }
            }
         },function(error:AchievementsProgressMaxError):void
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
      
      protected function _achievementsProgressComplete(achievementId:String, callback:Function = null, errorHandler:Function = null) : void
      {
         var input:AchievementsProgressCompleteArgs = new AchievementsProgressCompleteArgs(achievementId);
         var output:AchievementsProgressCompleteOutput = new AchievementsProgressCompleteOutput();
         channel.Request(286,input,output,new AchievementsProgressCompleteError(),function(output:AchievementsProgressCompleteOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback(output.achievement,output.completedNow);
               }
               catch(e:Error)
               {
                  client.handleCallbackError("Achievements.achievementsProgressComplete",e);
                  throw e;
               }
            }
         },function(error:AchievementsProgressCompleteError):void
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

