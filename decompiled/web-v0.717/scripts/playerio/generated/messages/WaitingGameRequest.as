package playerio.generated.messages
{
   import com.protobuf.§1t84s0§;
   
   public final class WaitingGameRequest extends §1t84s0§
   {
      
      public var id:String;
      
      public var type:String;
      
      public var senderUserId:String;
      
      public var created:Number;
      
      public var data:Array = [];
      
      public var dataDummy:KeyValuePair = null;
      
      public function WaitingGameRequest()
      {
         super();
         registerField("id","",9,1,1);
         registerField("type","",9,1,2);
         registerField("senderUserId","",9,1,3);
         registerField("created","",3,1,4);
         registerField("data","playerio.generated.messages.KeyValuePair",11,3,5);
      }
   }
}

