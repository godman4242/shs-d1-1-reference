package playerio.generated.messages
{
   import com.protobuf.§1t84s0§;
   
   public final class PayVaultCreditArgs extends §1t84s0§
   {
      
      public var amount:uint;
      
      public var reason:String;
      
      public function PayVaultCreditArgs(param1:uint, param2:String)
      {
         super();
         registerField("amount","",13,1,1);
         registerField("reason","",9,1,2);
         this.amount = param1;
         this.reason = param2;
      }
   }
}

