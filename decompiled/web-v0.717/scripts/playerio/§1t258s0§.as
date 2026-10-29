package playerio
{
   import playerio.generated.PlayerIOError;
   
   internal class §1t258s0§
   {
      
      private var _client:§1t150s0§;
      
      private var _myProfile:§1t196s0§;
      
      public function §1t258s0§(param1:§1t150s0§)
      {
         super();
         _client = param1;
      }
      
      public function get myProfile() : §1t196s0§
      {
         if(_myProfile == null)
         {
            throw new playerio.generated.PlayerIOError("Cannot access profile before Yahoo has loaded. Please call client.Yahoo.Refresh() first",playerio.PlayerIOError.YahooNotLoaded.errorID);
         }
         return _myProfile;
      }
      
      internal function _internal_refreshed(param1:§1t196s0§) : void
      {
         this._myProfile = param1;
      }
      
      public function showProfile(param1:String, param2:Function) : void
      {
         §1t49s0§._internal_showDialog("profile",{"userId":param1},_client.channel,param2);
      }
      
      public function loadProfiles(param1:Array, param2:Function, param3:Function) : void
      {
         _client._internal_social.loadProfile(param1,param2,param3);
      }
   }
}

