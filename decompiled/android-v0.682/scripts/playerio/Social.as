package playerio
{
   import playerio.generated.Social;
   import playerio.generated.messages.SocialProfile;
   import playerio.utils.HTTPChannel;
   import playerio.utils.Utilities;
   
   internal class Social extends playerio.generated.Social
   {
      
      public function Social(channel:HTTPChannel, client:Client)
      {
         super(channel,client);
      }
      
      public function refresh(callback:Function, errorCallback:Function) : void
      {
         _socialRefresh(function(myProfile:SocialProfile, friends:Array, blocked:Array):void
         {
            if(callback != null)
            {
               callback(myProfile,friends,blocked);
            }
         },errorCallback);
      }
      
      public function loadProfile(userIds:Array, callback:Function, errorCallback:Function) : void
      {
         if(callback != null)
         {
            _socialLoadProfiles(userIds,function(profiles:Array):void
            {
               var i:int;
               var found:SocialProfile;
               var yp:YahooProfile;
               var resultProfile:Array = [];
               for(i = 0; i < userIds.length; )
               {
                  found = (profiles != null ? Utilities.find(profiles,function(p:SocialProfile):Boolean
                  {
                     return p.userId == userIds[i];
                  }) : null) as SocialProfile;
                  if(found != null)
                  {
                     yp = new YahooProfile();
                     yp._internal_initialize(found);
                     resultProfile.push(yp);
                  }
                  i = i + 1;
               }
               callback(resultProfile);
            },errorCallback);
         }
         else
         {
            callback([]);
         }
      }
   }
}

