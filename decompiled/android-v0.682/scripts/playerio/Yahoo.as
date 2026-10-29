package playerio
{
   import flash.events.EventDispatcher;
   import playerio.generated.messages.SocialProfile;
   import playerio.utils.HTTPChannel;
   
   public class Yahoo extends EventDispatcher
   {
      
      private var _client:Client;
      
      private var _profiles:YahooProfiles;
      
      private var _payments:YahooPayments;
      
      private var _relations:YahooRelations;
      
      public function Yahoo(client:Client)
      {
         super();
         this._client = client;
         _profiles = new YahooProfiles(client);
         _relations = new YahooRelations(client,this);
         _payments = new YahooPayments(client);
      }
      
      internal static function _internal_showDialog(dialog:String, arguments:Object, channel:HTTPChannel, callback:Function) : void
      {
         YahooDialog.showDialog(dialog,arguments,channel,callback);
      }
      
      public function get profiles() : YahooProfiles
      {
         return _profiles;
      }
      
      public function get payments() : YahooPayments
      {
         return _payments;
      }
      
      public function get relations() : YahooRelations
      {
         return _relations;
      }
      
      public function refresh(callback:Function, errorCallback:Function) : void
      {
         _client._internal_social.refresh(function(myProfile:SocialProfile, friends:Array, blocked:Array):void
         {
            var yp:YahooProfile = new YahooProfile();
            yp._internal_initialize(myProfile);
            _profiles._internal_refreshed(yp);
            _relations._internal_refreshed(myProfile,friends,blocked);
            if(callback != null)
            {
               callback();
            }
         },errorCallback);
      }
   }
}

