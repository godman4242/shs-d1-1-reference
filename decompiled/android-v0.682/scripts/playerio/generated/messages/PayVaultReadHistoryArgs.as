package playerio.generated.messages
{
   import com.protobuf.Message;
   
   public final class PayVaultReadHistoryArgs extends Message
   {
      
      public var page:uint;
      
      public var pageSize:uint;
      
      public function PayVaultReadHistoryArgs(page:uint, pageSize:uint)
      {
         super();
         registerField("page","",13,1,1);
         registerField("pageSize","",13,1,2);
         this.page = page;
         this.pageSize = pageSize;
      }
   }
}

