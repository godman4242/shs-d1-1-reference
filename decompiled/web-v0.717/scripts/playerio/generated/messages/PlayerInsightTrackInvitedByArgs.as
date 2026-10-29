package playerio.generated.messages
{
   import com.protobuf.§1t84s0§;
   
   public final class PlayerInsightTrackInvitedByArgs extends §1t84s0§
   {
      
      public var invitingUserId:String;
      
      public var invitationChannel:String;
      
      public function PlayerInsightTrackInvitedByArgs(param1:String, param2:String)
      {
         super();
         registerField("invitingUserId","",9,1,1);
         registerField("invitationChannel","",9,1,2);
         this.invitingUserId = param1;
         this.invitationChannel = param2;
      }
   }
}

