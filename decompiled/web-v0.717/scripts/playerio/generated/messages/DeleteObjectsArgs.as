package playerio.generated.messages
{
   import com.protobuf.§1t84s0§;
   
   public final class DeleteObjectsArgs extends §1t84s0§
   {
      
      public var objectIds:Array = [];
      
      public var objectIdsDummy:BigDBObjectId = null;
      
      public function DeleteObjectsArgs(param1:Array)
      {
         super();
         registerField("objectIds","playerio.generated.messages.BigDBObjectId",11,3,1);
         this.objectIds = param1;
      }
   }
}

