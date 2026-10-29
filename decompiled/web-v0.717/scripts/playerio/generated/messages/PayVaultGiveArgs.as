package playerio.generated.messages
{
   import com.protobuf.§1t84s0§;
   
   public final class PayVaultGiveArgs extends §1t84s0§
   {
      
      public var items:Array = [];
      
      public var itemsDummy:PayVaultBuyItemInfo = null;
      
      public function PayVaultGiveArgs(param1:Array)
      {
         super();
         registerField("items","playerio.generated.messages.PayVaultBuyItemInfo",11,3,1);
         this.items = param1;
      }
   }
}

