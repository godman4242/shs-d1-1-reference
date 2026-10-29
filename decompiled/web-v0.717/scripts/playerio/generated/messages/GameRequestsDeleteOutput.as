package playerio.generated.messages
{
   import com.protobuf.§1t84s0§;
   
   public final class GameRequestsDeleteOutput extends §1t84s0§
   {
      
      public var requests:Array = [];
      
      public var requestsDummy:WaitingGameRequest = null;
      
      public var moreRequestsWaiting:Boolean;
      
      public function GameRequestsDeleteOutput()
      {
         super();
         registerField("requests","playerio.generated.messages.WaitingGameRequest",11,3,1);
         registerField("moreRequestsWaiting","",8,1,2);
      }
   }
}

