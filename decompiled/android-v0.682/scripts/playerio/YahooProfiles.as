package playerio
{
   import playerio.generated.PlayerIOError;
   
   internal class YahooProfiles
   {
      
      private var _client:Client;
      
      private var _myProfile:YahooProfile;
      
      public function YahooProfiles(client:Client)
      {
         super();
         _client = client;
      }
      
      public function get myProfile() : YahooProfile
      {
         if(_myProfile == null)
         {
            throw new playerio.generated.PlayerIOError("Cannot access profile before Yahoo has loaded. Please call client.Yahoo.Refresh() first",playerio.PlayerIOError.YahooNotLoaded.errorID);
         }
         return _myProfile;
      }
      
      internal function _internal_refreshed(p:YahooProfile) : void
      {
         this._myProfile = p;
      }
      
      public function showProfile(userId:String, callback:Function) : void
      {
         Yahoo._internal_showDialog("profile",{"userId":userId},_client.channel,callback);
      }
      
      public function loadProfiles(userIds:Array, callback:Function, errorCallback:Function) : void
      {
         _client._internal_social.loadProfile(userIds,callback,errorCallback);
      }
   }
}

