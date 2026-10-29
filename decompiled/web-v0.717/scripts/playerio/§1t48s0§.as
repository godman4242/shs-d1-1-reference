package playerio
{
   import §1t51s0§.§1t51s1§.§1t52s0§;
   import §1t51s0§.§1t51s1§.Utilities;
   import playerio.generated.§1t48s0§;
   import playerio.generated.messages.SocialProfile;
   
   internal class §1t48s0§ extends playerio.generated.§1t48s0§
   {
      
      public function §1t48s0§(param1:§1t52s0§, param2:§1t150s0§)
      {
         super(param1,param2);
      }
      
      public function §1t4235s0§(param1:Function, param2:Function) : void
      {
         var callback:Function = param1;
         var errorCallback:Function = param2;
         _socialRefresh(function(param1:SocialProfile, param2:Array, param3:Array):void
         {
            if(callback != null)
            {
               callback(param1,param2,param3);
            }
         },errorCallback);
      }
      
      public function loadProfile(param1:Array, param2:Function, param3:Function) : void
      {
         var userIds:Array = param1;
         var callback:Function = param2;
         var errorCallback:Function = param3;
         if(callback != null)
         {
            _socialLoadProfiles(userIds,function(param1:Array):void
            {
               var found:SocialProfile;
               var yp:§1t196s0§;
               var profiles:Array = param1;
               var resultProfile:Array = [];
               var i:int = 0;
               while(i < userIds.length)
               {
                  found = (profiles != null ? Utilities.find(profiles,function(param1:SocialProfile):Boolean
                  {
                     return param1.userId == userIds[i];
                  }) : null) as SocialProfile;
                  if(found != null)
                  {
                     yp = new §1t196s0§();
                     yp._internal_initialize(found);
                     resultProfile.push(yp);
                  }
                  else
                  {
                     resultProfile.push(null);
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

