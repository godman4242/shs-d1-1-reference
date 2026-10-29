package playerio.generated.messages
{
   import com.protobuf.§1t84s0§;
   
   public final class PayVaultBuyArgs extends §1t84s0§
   {
      
      public var items:Array = [];
      
      public var itemsDummy:PayVaultBuyItemInfo = null;
      
      public var storeItems:Boolean;
      
      public function PayVaultBuyArgs(param1:Array, param2:Boolean)
      {
         super();
         registerField("items","playerio.generated.messages.PayVaultBuyItemInfo",11,3,1);
         registerField("storeItems","",8,1,2);
         this.items = param1;
         this.storeItems = param2;
      }
   }
}

