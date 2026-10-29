package playerio
{
   import §1t51s0§.§1t51s1§.Converter;
   import playerio.generated.messages.NotificationsEndpoint;
   
   public class §1t384s0§
   {
      
      private var _type:String;
      
      private var _identifier:String;
      
      private var _data:Object;
      
      private var _enabled:Boolean;
      
      public function §1t384s0§()
      {
         super();
      }
      
      internal function _internal_initialize(param1:NotificationsEndpoint) : void
      {
         this._type = param1.type;
         this._identifier = param1.identifier;
         this._enabled = param1.enabled;
         this._data = Converter.§1t11525s0§(param1.configuration);
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get identifier() : String
      {
         return _identifier;
      }
      
      public function get configuration() : Object
      {
         return _data;
      }
      
      public function get endabled() : Boolean
      {
         return _enabled;
      }
   }
}

