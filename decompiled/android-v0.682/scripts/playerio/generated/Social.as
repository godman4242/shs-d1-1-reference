package playerio.generated
{
   import flash.events.EventDispatcher;
   import playerio.Client;
   import playerio.generated.messages.SocialLoadProfilesArgs;
   import playerio.generated.messages.SocialLoadProfilesError;
   import playerio.generated.messages.SocialLoadProfilesOutput;
   import playerio.generated.messages.SocialRefreshArgs;
   import playerio.generated.messages.SocialRefreshError;
   import playerio.generated.messages.SocialRefreshOutput;
   import playerio.utils.HTTPChannel;
   
   public class Social extends EventDispatcher
   {
      
      protected var channel:HTTPChannel;
      
      protected var client:Client;
      
      public function Social(channel:HTTPChannel, client:Client)
      {
         super();
         this.channel = channel;
         this.client = client;
      }
      
      protected function _socialRefresh(callback:Function = null, errorHandler:Function = null) : void
      {
         var input:SocialRefreshArgs = new SocialRefreshArgs();
         var output:SocialRefreshOutput = new SocialRefreshOutput();
         channel.Request(601,input,output,new SocialRefreshError(),function(output:SocialRefreshOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback(output.myProfile,output.friends,output.blocked);
               }
               catch(e:Error)
               {
                  client.handleCallbackError("Social.socialRefresh",e);
                  throw e;
               }
            }
         },function(error:SocialRefreshError):void
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
      
      protected function _socialLoadProfiles(userIds:Array, callback:Function = null, errorHandler:Function = null) : void
      {
         var input:SocialLoadProfilesArgs = new SocialLoadProfilesArgs(userIds);
         var output:SocialLoadProfilesOutput = new SocialLoadProfilesOutput();
         channel.Request(604,input,output,new SocialLoadProfilesError(),function(output:SocialLoadProfilesOutput):void
         {
            if(callback != null)
            {
               try
               {
                  callback(output.profiles);
               }
               catch(e:Error)
               {
                  client.handleCallbackError("Social.socialLoadProfiles",e);
                  throw e;
               }
            }
         },function(error:SocialLoadProfilesError):void
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

