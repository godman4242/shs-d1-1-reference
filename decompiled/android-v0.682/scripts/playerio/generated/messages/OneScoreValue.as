package playerio.generated.messages
{
   import com.protobuf.Message;
   
   public final class OneScoreValue extends Message
   {
      
      public var score:int;
      
      public var rank:Number;
      
      public function OneScoreValue()
      {
         super();
         registerField("score","",5,1,1);
         registerField("rank","",2,1,2);
      }
   }
}

