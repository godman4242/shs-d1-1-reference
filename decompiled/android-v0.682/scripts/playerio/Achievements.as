package playerio
{
   import flash.utils.Dictionary;
   import playerio.generated.Achievements;
   import playerio.generated.PlayerIOError;
   import playerio.generated.messages.Achievement;
   import playerio.utils.HTTPChannel;
   
   public class Achievements extends playerio.generated.Achievements
   {
      
      private var _version:String = null;
      
      private var _myAchievements:Array = null;
      
      private var _onCompletedHandler:Function = null;
      
      public function Achievements(channel:HTTPChannel, client:Client)
      {
         super(channel,client);
      }
      
      public function set onCompletedHandler(completedHanlder:Function) : void
      {
         _onCompletedHandler = completedHanlder;
      }
      
      public function get myAchievements() : Array
      {
         if(_myAchievements != null)
         {
            return _myAchievements;
         }
         throw new playerio.generated.PlayerIOError("Cannot access myAchievements before \'achievements\' has been loaded. Please refresh the achievements first",playerio.PlayerIOError.AchievementsNotLoaded.errorID);
      }
      
      public function get(achievementId:String) : playerio.Achievement
      {
         for each(var achievement in _myAchievements)
         {
            if(achievement.id == achievementId)
            {
               return achievement;
            }
         }
         return null;
      }
      
      public function refresh(callback:Function = null, errorHandler:Function = null) : void
      {
         _achievementsRefresh(_version,function(version:String, achievements:Array):void
         {
            refreshAchiemeventsHelper(version,achievements);
            if(callback != null)
            {
               callback();
            }
         },errorHandler);
      }
      
      public function load(userIds:Array, callback:Function = null, errorHandler:Function = null) : void
      {
         _achievementsLoad(userIds,function(achievements:Array):void
         {
            var userAchievements:Dictionary = null;
            if(callback != null)
            {
               userAchievements = parseUserAchievements(achievements);
               callback(userAchievements);
            }
         },errorHandler);
      }
      
      public function progressSet(achievementId:String, progress:int, callback:Function, errorHandler:Function) : void
      {
         _achievementsProgressSet(achievementId,progress,function(achievement:playerio.generated.messages.Achievement, completedNow:Boolean):void
         {
            processResults(achievement,completedNow,callback);
         },errorHandler);
      }
      
      public function progressAdd(achievementId:String, progressDelta:int, callback:Function, errorHandler:Function) : void
      {
         _achievementsProgressAdd(achievementId,progressDelta,function(achievement:playerio.generated.messages.Achievement, completedNow:Boolean):void
         {
            processResults(achievement,completedNow,callback);
         },errorHandler);
      }
      
      public function progressMax(achievementId:String, progress:int, callback:Function, errorHandler:Function) : void
      {
         _achievementsProgressMax(achievementId,progress,function(achievement:playerio.generated.messages.Achievement, completedNow:Boolean):void
         {
            processResults(achievement,completedNow,callback);
         },errorHandler);
      }
      
      public function progressComplete(achievementId:String, callback:Function, errorHandler:Function) : void
      {
         _achievementsProgressComplete(achievementId,function(achievement:playerio.generated.messages.Achievement, completedNow:Boolean):void
         {
            processResults(achievement,completedNow,callback);
         },errorHandler);
      }
      
      private function refreshAchiemeventsHelper(version:String, achievements:Array) : void
      {
         _version = version;
         _myAchievements = parseAchievements(achievements);
      }
      
      private function parseUserAchievements(userAchievements:Array) : Dictionary
      {
         var i:int = 0;
         var resultUserAchievments:Dictionary = new Dictionary();
         for(i = 0; i < userAchievements.length; )
         {
            resultUserAchievments[userAchievements[i].userId] = new UserAchievement(userAchievements[i].userId,parseAchievements(userAchievements[i].achievements)).achievements;
            i++;
         }
         return resultUserAchievments;
      }
      
      private function parseAchievements(achievements:Array) : Array
      {
         var i:int = 0;
         var ach:playerio.Achievement = null;
         var resultAchievements:Array = [];
         for(i = 0; i < achievements.length; )
         {
            ach = new playerio.Achievement();
            ach._internal_initialize(achievements[i] as playerio.generated.messages.Achievement);
            resultAchievements.push(ach);
            i++;
         }
         return resultAchievements;
      }
      
      private function processResults(achievement:playerio.generated.messages.Achievement, completedNow:Boolean, callback:Function) : void
      {
         var i:int = 0;
         var impl:playerio.Achievement = null;
         if(_myAchievements != null)
         {
            for(i = 0; i < _myAchievements.length; )
            {
               if(_myAchievements[i].id == achievement.identifier)
               {
                  impl = _myAchievements[i];
                  impl._internal_initialize(achievement);
                  break;
               }
               i++;
            }
            if(impl == null)
            {
               impl = new playerio.Achievement();
               impl._internal_initialize(achievement);
               _myAchievements.push(impl);
            }
         }
         else
         {
            impl = new playerio.Achievement();
            impl._internal_initialize(achievement);
         }
         if(completedNow && _onCompletedHandler != null)
         {
            _onCompletedHandler(impl);
         }
         if(callback != null)
         {
            callback(impl);
         }
      }
   }
}

