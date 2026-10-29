package playerio
{
   import §1t51s0§.§1t51s1§.§1t52s0§;
   import flash.display.Stage;
   import playerio.generated.messages.PlayerInsightState;
   
   public class §1t150s0§
   {
      
      private var _connectUserId:String;
      
      private var _gameId:String;
      
      private var _showBranding:Boolean;
      
      private var _multiplayer:§1t39s0§;
      
      private var _bigDB:§1t40s0§;
      
      private var _errorLog:§1t41s0§;
      
      private var _notifications:§1t42s0§;
      
      private var _gameFS:§1t43s0§;
      
      private var _payVault:§1t44s0§;
      
      private var _playerInsight:§1t45s0§;
      
      private var _gameRequests:§1t46s0§;
      
      private var _achievements:§1t47s0§;
      
      private var _social:§1t48s0§;
      
      private var _yahoo:§1t49s0§;
      
      private var _oneScore:§1t50s0§;
      
      private var _stage:Stage;
      
      private var _channel:§1t52s0§;
      
      private var _isSocialNetworkuser:Boolean;
      
      public function §1t150s0§(param1:Stage, param2:§1t52s0§, param3:String, param4:String, param5:String, param6:String, param7:Boolean, param8:PlayerInsightState)
      {
         super();
         _multiplayer = new §1t39s0§(param2,this);
         _errorLog = new §1t41s0§(param2,this);
         _bigDB = new §1t40s0§(param2,this);
         _payVault = new §1t44s0§(param2,this);
         _achievements = new §1t47s0§(param2,this);
         _gameFS = new §1t43s0§(param3,param4);
         _playerInsight = new §1t45s0§(param2,this,param8);
         _gameRequests = new §1t46s0§(param2,this);
         _notifications = new §1t42s0§(param2,this);
         _yahoo = new §1t49s0§(this);
         _social = new §1t48s0§(param2,this);
         _oneScore = new §1t50s0§(param2,this);
         _connectUserId = param6;
         _stage = param1;
         _channel = param2;
      }
      
      public function get connectUserId() : String
      {
         return _connectUserId;
      }
      
      public function get gameId() : String
      {
         return _gameId;
      }
      
      public function get showBranding() : Boolean
      {
         return _showBranding;
      }
      
      public function get multiplayer() : §1t39s0§
      {
         return _multiplayer;
      }
      
      public function get §1t729s0§() : §1t40s0§
      {
         return _bigDB;
      }
      
      public function get §1t731s0§() : §1t41s0§
      {
         return _errorLog;
      }
      
      public function get notifications() : §1t42s0§
      {
         return _notifications;
      }
      
      public function get gameFS() : §1t43s0§
      {
         return _gameFS;
      }
      
      public function get §1t737s0§() : §1t44s0§
      {
         return _payVault;
      }
      
      public function get playerInsight() : §1t45s0§
      {
         return _playerInsight;
      }
      
      public function get gameRequests() : §1t46s0§
      {
         return _gameRequests;
      }
      
      public function get achievements() : §1t47s0§
      {
         return _achievements;
      }
      
      internal function get _internal_social() : §1t48s0§
      {
         return _social;
      }
      
      public function get yahoo() : §1t49s0§
      {
         return _yahoo;
      }
      
      public function get oneScore() : §1t50s0§
      {
         return _oneScore;
      }
      
      public function get channel() : §1t52s0§
      {
         return _channel;
      }
      
      public function handleCallbackError(param1:String, param2:Error) : void
      {
         if(multiplayer.developmentServer == null)
         {
            §1t731s0§.§1t4655s0§(param2.name,param2.message,(param2.getStackTrace() == null ? "I" : param2.getStackTrace() + "\n i") + "n callback handler for " + param1,{});
         }
      }
      
      public function handleCallbackErrorVerbose(param1:String, param2:Error) : void
      {
         if(multiplayer.developmentServer == null)
         {
            §1t731s0§.§1t4655s0§(param2.message,param1,param2.getStackTrace() == null ? "" : param2.getStackTrace(),{});
         }
      }
      
      public function handleSystemError(param1:String, param2:Error, param3:Object) : void
      {
         §1t731s0§.§1t4655s0§(param2.message,param1,param2.getStackTrace() == null ? "" : param2.getStackTrace(),param3);
      }
      
      public function get stage() : Stage
      {
         return _stage;
      }
      
      public function toString() : String
      {
         return "[Player.IO Client]";
      }
   }
}

