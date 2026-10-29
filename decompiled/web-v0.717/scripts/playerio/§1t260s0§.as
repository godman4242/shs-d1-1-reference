package playerio
{
   import §1t51s0§.§1t51s1§.Utilities;
   import playerio.generated.PlayerIOError;
   import playerio.generated.messages.SocialProfile;
   
   internal class §1t260s0§
   {
      
      private var _client:§1t150s0§;
      
      private var _friends:Array;
      
      private var _friendLookup:Object;
      
      private var _blockedLookup:Object;
      
      private var _yahoo:playerio.§1t49s0§;
      
      public function §1t260s0§(param1:§1t150s0§, param2:playerio.§1t49s0§)
      {
         super();
         this._client = param1;
         this._yahoo = param2;
      }
      
      internal function _internal_refreshed(param1:SocialProfile, param2:Array, param3:Array) : void
      {
         var friend:§1t196s0§;
         var ignored:String;
         var myProfile:SocialProfile = param1;
         var friends:Array = param2;
         var blocked:Array = param3;
         this._friends = Utilities.converter(friends,function(param1:SocialProfile):§1t196s0§
         {
            var _loc2_:§1t196s0§ = new §1t196s0§();
            _loc2_._internal_initialize(param1);
            return _loc2_;
         });
         _friendLookup = {};
         for each(friend in this._friends)
         {
            _friendLookup[friend.userId] = true;
         }
         _blockedLookup = {};
         if(blocked != null)
         {
            for each(ignored in blocked)
            {
               _blockedLookup[ignored] = true;
            }
         }
      }
      
      public function get friends() : Array
      {
         if(_friends == null)
         {
            throw new playerio.generated.PlayerIOError("Cannot access friends before Yahoo has loaded. Please call client.Yahoo.Refresh() first.",playerio.PlayerIOError.YahooNotLoaded.errorID);
         }
         return _friends;
      }
      
      public function isFiend(param1:String) : Boolean
      {
         if(_friendLookup == null)
         {
            throw new playerio.generated.PlayerIOError("Cannot access friends before Yahoo has loaded. Please call client.Yahoo.Refresh() first.",playerio.PlayerIOError.YahooNotLoaded.errorID);
         }
         return _friendLookup[param1] != undefined;
      }
      
      public function isBlocked(param1:String) : Boolean
      {
         if(_blockedLookup == null)
         {
            throw new playerio.generated.PlayerIOError("Cannot access friends before Yahoo has loaded. Please call client.Yahoo.Refresh() first.",playerio.PlayerIOError.YahooNotLoaded.errorID);
         }
         return _blockedLookup[param1] != undefined;
      }
      
      public function showRequestFriendshipDialog(param1:String, param2:Function) : void
      {
         var userId:String = param1;
         var closedCallback:Function = param2;
         playerio.§1t49s0§._internal_showDialog("requestfriendship",{"userId":userId},_client.channel,function():void
         {
            if(closedCallback != null)
            {
               closedCallback();
            }
         });
      }
      
      public function showRequestBlockUserDialog(param1:String, param2:Function) : void
      {
         var userId:String = param1;
         var closedCallback:Function = param2;
         playerio.§1t49s0§._internal_showDialog("requestblockuser",{"userId":userId},_client.channel,function():void
         {
            _yahoo.§1t4235s0§(function():void
            {
               if(closedCallback != null)
               {
                  closedCallback();
               }
            },function():void
            {
               if(closedCallback != null)
               {
                  closedCallback();
               }
            });
         });
      }
      
      public function showFriendsManager(param1:Function) : void
      {
         var closedCallback:Function = param1;
         playerio.§1t49s0§._internal_showDialog("friendsmanager",{},_client.channel,function(param1:Object):void
         {
            var result:Object = param1;
            if(result["updated"] != undefined)
            {
               _yahoo.§1t4235s0§(function():void
               {
                  if(closedCallback != null)
                  {
                     closedCallback();
                  }
               },function():void
               {
                  if(closedCallback != null)
                  {
                     closedCallback();
                  }
               });
            }
            else if(closedCallback != null)
            {
               closedCallback();
            }
         });
      }
      
      public function showBlockedUsersManager(param1:Function) : void
      {
         var closedCallback:Function = param1;
         playerio.§1t49s0§._internal_showDialog("blockedusersmanager",{},_client.channel,function(param1:Object):void
         {
            var result:Object = param1;
            if(result["updated"] != undefined)
            {
               _yahoo.§1t4235s0§(function():void
               {
                  if(closedCallback != null)
                  {
                     closedCallback();
                  }
               },function():void
               {
                  if(closedCallback != null)
                  {
                     closedCallback();
                  }
               });
            }
            else if(closedCallback != null)
            {
               closedCallback();
            }
         });
      }
   }
}

