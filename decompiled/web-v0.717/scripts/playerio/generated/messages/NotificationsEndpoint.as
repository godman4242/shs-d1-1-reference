package playerio.generated.messages
{
   import com.protobuf.§1t84s0§;
   
   public final class NotificationsEndpoint extends §1t84s0§
   {
      
      public var type:String;
      
      public var identifier:String;
      
      public var configuration:Array = [];
      
      public var configurationDummy:KeyValuePair = null;
      
      public var enabled:Boolean;
      
      public function NotificationsEndpoint()
      {
         super();
         registerField("type","",9,1,1);
         registerField("identifier","",9,1,2);
         registerField("configuration","playerio.generated.messages.KeyValuePair",11,3,3);
         registerField("enabled","",8,1,4);
      }
   }
}

