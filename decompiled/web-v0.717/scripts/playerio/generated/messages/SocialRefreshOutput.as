package playerio.generated.messages
{
   import com.protobuf.§1t84s0§;
   
   public final class SocialRefreshOutput extends §1t84s0§
   {
      
      public var myProfile:SocialProfile;
      
      public var myProfileDummy:SocialProfile = null;
      
      public var friends:Array = [];
      
      public var friendsDummy:SocialProfile = null;
      
      public var blocked:Array = [];
      
      public function SocialRefreshOutput()
      {
         super();
         registerField("myProfile","playerio.generated.messages.SocialProfile",11,1,1);
         registerField("friends","playerio.generated.messages.SocialProfile",11,3,2);
         registerField("blocked","",9,3,3);
      }
   }
}

