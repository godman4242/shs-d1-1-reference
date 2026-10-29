package playerio.generated.messages
{
   import com.protobuf.§1t84s0§;
   
   public final class PayVaultUsePaymentInfoOutput extends §1t84s0§
   {
      
      public var providerResults:Array = [];
      
      public var providerResultsDummy:KeyValuePair = null;
      
      public var vaultContents:PayVaultContents;
      
      public var vaultContentsDummy:PayVaultContents = null;
      
      public function PayVaultUsePaymentInfoOutput()
      {
         super();
         registerField("providerResults","playerio.generated.messages.KeyValuePair",11,3,1);
         registerField("vaultContents","playerio.generated.messages.PayVaultContents",11,1,2);
      }
   }
}

