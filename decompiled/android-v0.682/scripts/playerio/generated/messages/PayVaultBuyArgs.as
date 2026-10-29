package playerio.generated.messages
{
   import com.protobuf.Message;
   
   public final class PayVaultBuyArgs extends Message
   {
      
      public var items:Array = [];
      
      public var itemsDummy:PayVaultBuyItemInfo = null;
      
      public var storeItems:Boolean;
      
      public function PayVaultBuyArgs(items:Array, storeItems:Boolean)
      {
         super();
         registerField("items","playerio.generated.messages.PayVaultBuyItemInfo",11,3,1);
         registerField("storeItems","",8,1,2);
         this.items = items;
         this.storeItems = storeItems;
      }
   }
}

