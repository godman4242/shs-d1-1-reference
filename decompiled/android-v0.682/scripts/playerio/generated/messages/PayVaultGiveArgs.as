package playerio.generated.messages
{
   import com.protobuf.Message;
   
   public final class PayVaultGiveArgs extends Message
   {
      
      public var items:Array = [];
      
      public var itemsDummy:PayVaultBuyItemInfo = null;
      
      public function PayVaultGiveArgs(items:Array)
      {
         super();
         registerField("items","playerio.generated.messages.PayVaultBuyItemInfo",11,3,1);
         this.items = items;
      }
   }
}

