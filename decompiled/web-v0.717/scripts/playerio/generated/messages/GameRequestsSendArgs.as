package playerio.generated.messages
{
   import com.protobuf.§1t84s0§;
   
   public final class GameRequestsSendArgs extends §1t84s0§
   {
      
      public var requestType:String;
      
      public var requestData:Array = [];
      
      public var requestDataDummy:KeyValuePair = null;
      
      public var requestRecipients:Array = [];
      
      public function GameRequestsSendArgs(param1:String, param2:Array, param3:Array)
      {
         super();
         registerField("requestType","",9,1,1);
         registerField("requestData","playerio.generated.messages.KeyValuePair",11,3,2);
         registerField("requestRecipients","",9,3,3);
         this.requestType = param1;
         this.requestData = param2;
         this.requestRecipients = param3;
      }
   }
}

