package playerio.generated.messages
{
   import com.protobuf.Message;
   
   public final class PayVaultRefreshArgs extends Message
   {
      
      public var lastVersion:String;
      
      public function PayVaultRefreshArgs(lastVersion:String)
      {
         super();
         registerField("lastVersion","",9,1,1);
         this.lastVersion = lastVersion;
      }
   }
}

