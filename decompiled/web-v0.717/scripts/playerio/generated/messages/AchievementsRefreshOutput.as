package playerio.generated.messages
{
   import com.protobuf.§1t84s0§;
   
   public final class AchievementsRefreshOutput extends §1t84s0§
   {
      
      public var version:String;
      
      public var achievements:Array = [];
      
      public var achievementsDummy:§1t216s0§ = null;
      
      public function AchievementsRefreshOutput()
      {
         super();
         registerField("version","",9,1,1);
         registerField("achievements","playerio.generated.messages.Achievement",11,3,2);
      }
   }
}

