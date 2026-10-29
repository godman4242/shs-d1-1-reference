package playerio.generated.messages
{
   import com.protobuf.§1t84s0§;
   
   public final class AchievementsProgressSetArgs extends §1t84s0§
   {
      
      public var achievementId:String;
      
      public var progress:int;
      
      public function AchievementsProgressSetArgs(param1:String, param2:int)
      {
         super();
         registerField("achievementId","",9,1,1);
         registerField("progress","",5,1,2);
         this.achievementId = param1;
         this.progress = param2;
      }
   }
}

