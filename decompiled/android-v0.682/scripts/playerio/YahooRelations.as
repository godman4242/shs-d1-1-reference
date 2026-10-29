package playerio
{
   import playerio.generated.PlayerIOError;
   import playerio.generated.messages.SocialProfile;
   import playerio.utils.Utilities;
   
   internal class YahooRelations
   {
      
      private var _client:Client;
      
      private var _friends:Array;
      
      private var _friendLookup:Object;
      
      private var _blockedLookup:Object;
      
      private var _yahoo:Yahoo;
      
      public function YahooRelations(client:Client, yahoo:Yahoo)
      {
         super();
         this._client = client;
         this._yahoo = yahoo;
      }
      
      internal function _internal_refreshed(myProfile:SocialProfile, friends:Array, blocked:Array) : void
      {
         var friend:YahooProfile;
         var ignored:String;
         this._friends = Utilities.converter(friends,function(p:SocialProfile):YahooProfile
         {
            var yp:YahooProfile = new YahooProfile();
            yp._internal_initialize(p);
            return yp;
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
      
      public function isFiend(userId:String) : Boolean
      {
         if(_friendLookup == null)
         {
            throw new playerio.generated.PlayerIOError("Cannot access friends before Yahoo has loaded. Please call client.Yahoo.Refresh() first.",playerio.PlayerIOError.YahooNotLoaded.errorID);
         }
         return _friendLookup[userId] != undefined;
      }
      
      public function isBlocked(userId:String) : Boolean
      {
         if(_blockedLookup == null)
         {
            throw new playerio.generated.PlayerIOError("Cannot access friends before Yahoo has loaded. Please call client.Yahoo.Refresh() first.",playerio.PlayerIOError.YahooNotLoaded.errorID);
         }
         return _blockedLookup[userId] != undefined;
      }
      
      public function showRequestFriendshipDialog(userId:String, closedCallback:Function) : void
      {
         Yahoo._internal_showDialog("requestfriendship",{"userId":userId},_client.channel,function():void
         {
            if(closedCallback != null)
            {
               closedCallback();
            }
         });
      }
      
      public function showRequestBlockUserDialog(userId:String, closedCallback:Function) : void
      {
         Yahoo._internal_showDialog("requestblockuser",{"userId":userId},_client.channel,function():void
         {
            _yahoo.refresh(function():void
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
      
      public function showFriendsManager(closedCallback:Function) : void
      {
         Yahoo._internal_showDialog("friendsmanager",{},_client.channel,function(result:Object):void
         {
            if(result["updated"] != undefined)
            {
               _yahoo.refresh(function():void
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
      
      public function showBlockedUsersManager(closedCallback:Function) : void
      {
         Yahoo._internal_showDialog("blockedusersmanager",{},_client.channel,function(result:Object):void
         {
            if(result["updated"] != undefined)
            {
               _yahoo.refresh(function():void
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

