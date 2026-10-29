package playerio.generated.messages
{
   import com.protobuf.§1t84s0§;
   
   public final class CreateObjectsArgs extends §1t84s0§
   {
      
      public var objects:Array = [];
      
      public var objectsDummy:NewBigDBObject = null;
      
      public var loadExisting:Boolean;
      
      public function CreateObjectsArgs(param1:Array, param2:Boolean)
      {
         super();
         registerField("objects","playerio.generated.messages.NewBigDBObject",11,3,1);
         registerField("loadExisting","",8,1,2);
         this.objects = param1;
         this.loadExisting = param2;
      }
   }
}

