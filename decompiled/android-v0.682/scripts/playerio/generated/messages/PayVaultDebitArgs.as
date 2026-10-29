package playerio.generated.messages
{
   import com.protobuf.Message;
   
   public final class PayVaultDebitArgs extends Message
   {
      
      public var amount:uint;
      
      public var reason:String;
      
      public function PayVaultDebitArgs(amount:uint, reason:String)
      {
         super();
         registerField("amount","",13,1,1);
         registerField("reason","",9,1,2);
         this.amount = amount;
         this.reason = reason;
      }
   }
}

