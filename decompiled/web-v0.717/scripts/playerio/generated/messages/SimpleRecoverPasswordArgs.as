package playerio.generated.messages
{
   import com.protobuf.§1t84s0§;
   
   public final class SimpleRecoverPasswordArgs extends §1t84s0§
   {
      
      public var gameId:String;
      
      public var usernameOrEmail:String;
      
      public function SimpleRecoverPasswordArgs(param1:String, param2:String)
      {
         super();
         registerField("gameId","",9,1,1);
         registerField("usernameOrEmail","",9,1,2);
         this.gameId = param1;
         this.usernameOrEmail = param2;
      }
   }
}

