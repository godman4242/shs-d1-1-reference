package playerio.generated.messages
{
   import com.protobuf.§1t84s0§;
   
   public final class PayVaultUsePaymentInfoArgs extends §1t84s0§
   {
      
      public var provider:String;
      
      public var providerArguments:Array = [];
      
      public var providerArgumentsDummy:KeyValuePair = null;
      
      public function PayVaultUsePaymentInfoArgs(param1:String, param2:Array)
      {
         super();
         registerField("provider","",9,1,1);
         registerField("providerArguments","playerio.generated.messages.KeyValuePair",11,3,2);
         this.provider = param1;
         this.providerArguments = param2;
      }
   }
}

