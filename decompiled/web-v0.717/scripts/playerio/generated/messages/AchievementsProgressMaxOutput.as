package playerio.generated.messages
{
   import com.protobuf.§1t84s0§;
   
   public final class AchievementsProgressMaxOutput extends §1t84s0§
   {
      
      public var achievement:§1t216s0§;
      
      public var achievementDummy:§1t216s0§ = null;
      
      public var completedNow:Boolean;
      
      public function AchievementsProgressMaxOutput()
      {
         super();
         registerField("achievement","playerio.generated.messages.Achievement",11,1,1);
         registerField("completedNow","",8,1,2);
      }
   }
}

