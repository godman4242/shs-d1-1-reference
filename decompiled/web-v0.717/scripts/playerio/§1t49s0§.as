package playerio
{
   import §1t51s0§.§1t51s1§.§1t52s0§;
   import flash.events.EventDispatcher;
   import playerio.generated.messages.SocialProfile;
   
   public class §1t49s0§ extends EventDispatcher
   {
      
      private var _client:§1t150s0§;
      
      private var _profiles:§1t258s0§;
      
      private var _payments:§1t259s0§;
      
      private var _relations:§1t260s0§;
      
      public function §1t49s0§(param1:§1t150s0§)
      {
         super();
         this._client = param1;
         _profiles = new §1t258s0§(param1);
         _relations = new §1t260s0§(param1,this);
         _payments = new §1t259s0§(param1);
      }
      
      internal static function _internal_showDialog(param1:String, param2:Object, param3:§1t52s0§, param4:Function) : void
      {
         §1t2768s0§.§1t6527s0§(param1,param2,param3,param4);
      }
      
      public function get profiles() : §1t258s0§
      {
         return _profiles;
      }
      
      public function get payments() : §1t259s0§
      {
         return _payments;
      }
      
      public function get relations() : §1t260s0§
      {
         return _relations;
      }
      
      public function §1t4235s0§(param1:Function, param2:Function) : void
      {
         var callback:Function = param1;
         var errorCallback:Function = param2;
         _client._internal_social.§1t4235s0§(function(param1:SocialProfile, param2:Array, param3:Array):void
         {
            var _loc4_:§1t196s0§ = new §1t196s0§();
            _loc4_._internal_initialize(param1);
            _profiles._internal_refreshed(_loc4_);
            _relations._internal_refreshed(param1,param2,param3);
            if(callback != null)
            {
               callback();
            }
         },errorCallback);
      }
   }
}

