package playerio.generated.messages
{
   import com.protobuf.§1t84s0§;
   
   public final class NotificationsDeleteEndpointsOutput extends §1t84s0§
   {
      
      public var version:String;
      
      public var endpoints:Array = [];
      
      public var endpointsDummy:NotificationsEndpoint = null;
      
      public function NotificationsDeleteEndpointsOutput()
      {
         super();
         registerField("version","",9,1,1);
         registerField("endpoints","playerio.generated.messages.NotificationsEndpoint",11,3,2);
      }
   }
}

