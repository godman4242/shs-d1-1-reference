package playerio.generated.messages
{
   import com.protobuf.§1t84s0§;
   
   public final class UserAchievements extends §1t84s0§
   {
      
      public var userId:String;
      
      public var achievements:Array = [];
      
      public var achievementsDummy:§1t216s0§ = null;
      
      public function UserAchievements()
      {
         super();
         registerField("userId","",9,1,1);
         registerField("achievements","playerio.generated.messages.Achievement",11,3,2);
      }
   }
}

