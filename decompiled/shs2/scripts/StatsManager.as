package
{
   import com.kongregate.as3.client.KongregateAPI;
   import flash.net.SharedObject;
   
   public class StatsManager
   {
      
      public static var enemiesStabbed:int;
      
      public static var kills2:int;
      
      public static var kills1:int;
      
      public static var enemiesLaunched1:int;
      
      public static var enemiesLaunched3:int;
      
      public static var enemiesLaunched4:int;
      
      public static var enemiesStabbed1:int;
      
      public static var enemiesStabbed2:int;
      
      public static var enemiesLaunched2:int;
      
      public static var enemiesStabbed4:int;
      
      public static var hitsTaken:int;
      
      public static var enemiesStabbed3:int;
      
      public static var timeTaken1:int;
      
      public static var timeTaken2:int;
      
      public static var headshots2:int;
      
      public static var headshots3:int;
      
      public static var headshots4:int;
      
      public static var deaths:int;
      
      public static var timeTaken3:int;
      
      public static var timeTaken4:int;
      
      public static var headshots1:int;
      
      public static var maxCombo:int;
      
      public static var score:int;
      
      public static var deaths2:int;
      
      public static var deaths3:int;
      
      public static var deaths4:int;
      
      public static var deaths1:int;
      
      public static var slashes1:int;
      
      public static var slashes2:int;
      
      public static var slashes3:int;
      
      public static var slashes4:int;
      
      public static var hitsTaken1:int;
      
      public static var hitsTaken2:int;
      
      public static var hitsTaken3:int;
      
      public static var hitsTaken4:int;
      
      public static var kills:int;
      
      public static var enemiesLaunched:int;
      
      public static var headshots:int;
      
      public static var score1:int;
      
      public static var score2:int;
      
      public static var score3:int;
      
      public static var score4:int;
      
      public static var maxCombo1:int;
      
      public static var maxCombo2:int;
      
      public static var maxCombo3:int;
      
      public static var maxCombo4:int;
      
      public static var slashes:int;
      
      public static var timeTaken:int;
      
      public static var kills3:int;
      
      public static var kills4:int;
      
      public static var maxhp:int = 50;
      
      public static var stage1completed:Boolean = false;
      
      public static var stage2completed:Boolean = false;
      
      public static var stage3completed:Boolean = false;
      
      public static var stage4completed:Boolean = false;
      
      public static var accessAllStages:Boolean = false;
      
      public static var skipToBoss:Boolean = false;
      
      public static var bossNoLife:Boolean = false;
      
      public function StatsManager()
      {
         super();
      }
      
      public static function getTotalTimeTaken() : String
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         _loc1_ = (timeTaken1 + timeTaken2 + timeTaken3 + timeTaken4) / 24;
         _loc2_ = _loc1_ / 60;
         _loc3_ = _loc2_ / 60;
         _loc1_ -= _loc2_ * 60;
         _loc2_ -= _loc3_ * 60;
         if(_loc1_ < 10)
         {
            _loc4_ = "0" + _loc1_;
         }
         else
         {
            _loc4_ = _loc1_.toString();
         }
         if(_loc2_ < 10)
         {
            _loc5_ = "0" + _loc2_;
         }
         else
         {
            _loc5_ = _loc2_.toString();
         }
         return _loc3_ + ":" + _loc5_ + ":" + _loc4_;
      }
      
      public static function getTimeTaken() : String
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         _loc1_ = timeTaken / 24;
         _loc2_ = _loc1_ / 60;
         _loc3_ = _loc2_ / 60;
         _loc1_ -= _loc2_ * 60;
         _loc2_ -= _loc3_ * 60;
         if(_loc1_ < 10)
         {
            _loc4_ = "0" + _loc1_;
         }
         else
         {
            _loc4_ = _loc1_.toString();
         }
         if(_loc2_ < 10)
         {
            _loc5_ = "0" + _loc2_;
         }
         else
         {
            _loc5_ = _loc2_.toString();
         }
         return _loc3_ + ":" + _loc5_ + ":" + _loc4_;
      }
      
      public static function reset() : *
      {
         timeTaken = 0;
         hitsTaken = 0;
         slashes = 0;
         kills = 0;
         headshots = 0;
         deaths = 0;
         maxCombo = 0;
         enemiesLaunched = 0;
         enemiesStabbed = 0;
         if(GameStage.currentStage == 1)
         {
            score = 0;
         }
         else if(GameStage.currentStage == 2)
         {
            score = score1;
         }
         else if(GameStage.currentStage == 3)
         {
            score = score2;
         }
         else if(GameStage.currentStage == 4)
         {
            score = score3;
         }
      }
      
      public static function stageComplete() : *
      {
         if(Player.instance.combo > maxCombo)
         {
            maxCombo = Player.instance.combo;
         }
         if(GameStage.currentStage == 1)
         {
            completeStage1();
         }
         else if(GameStage.currentStage == 2)
         {
            completeStage2();
         }
         else if(GameStage.currentStage == 3)
         {
            completeStage3();
         }
         else if(GameStage.currentStage == 4)
         {
            completeStage4();
         }
         saveData();
      }
      
      public static function completeStage1() : *
      {
         var _loc1_:KongregateAPI = null;
         stage1completed = true;
         timeTaken1 = timeTaken;
         hitsTaken1 = hitsTaken;
         slashes1 = slashes;
         kills1 = kills;
         headshots1 = headshots;
         deaths1 = deaths;
         maxCombo1 = maxCombo;
         enemiesLaunched1 = enemiesLaunched;
         enemiesStabbed1 = enemiesStabbed;
         score1 = score;
         _loc1_ = KongregateAPI.getInstance();
         _loc1_.stats.submit("Total Kills",kills1);
         _loc1_.stats.submit("Total Headshots",headshots1);
         _loc1_.stats.submit("Max Combo",maxCombo);
         _loc1_.stats.submit("Total Launches",enemiesLaunched1);
         _loc1_.stats.submit("Total Stabs",enemiesStabbed1);
         _loc1_.stats.submit("Total Score",score1);
      }
      
      public static function completeStage2() : *
      {
         var _loc1_:KongregateAPI = null;
         stage2completed = true;
         timeTaken2 = timeTaken;
         hitsTaken2 = hitsTaken;
         slashes2 = slashes;
         kills2 = kills;
         headshots2 = headshots;
         deaths2 = deaths;
         maxCombo2 = maxCombo;
         enemiesLaunched2 = enemiesLaunched;
         enemiesStabbed2 = enemiesStabbed;
         score2 = score;
         _loc1_ = KongregateAPI.getInstance();
         _loc1_.stats.submit("Total Kills",kills1 + kills2);
         _loc1_.stats.submit("Total Headshots",headshots1 + headshots2);
         _loc1_.stats.submit("Max Combo",maxCombo);
         _loc1_.stats.submit("Total Launches",enemiesLaunched1 + enemiesLaunched2);
         _loc1_.stats.submit("Total Stabs",enemiesStabbed1 + enemiesStabbed2);
         _loc1_.stats.submit("Total Score",score1 + score2);
      }
      
      public static function completeStage3() : *
      {
         var _loc1_:KongregateAPI = null;
         stage3completed = true;
         timeTaken3 = timeTaken;
         hitsTaken3 = hitsTaken;
         slashes3 = slashes;
         kills3 = kills;
         headshots3 = headshots;
         deaths3 = deaths;
         maxCombo3 = maxCombo;
         enemiesLaunched3 = enemiesLaunched;
         enemiesStabbed3 = enemiesStabbed;
         score3 = score;
         _loc1_ = KongregateAPI.getInstance();
         _loc1_.stats.submit("Total Kills",kills1 + kills2 + kills3);
         _loc1_.stats.submit("Total Headshots",headshots1 + headshots2 + headshots3);
         _loc1_.stats.submit("Max Combo",maxCombo);
         _loc1_.stats.submit("Total Launches",enemiesLaunched1 + enemiesLaunched2 + enemiesLaunched3);
         _loc1_.stats.submit("Total Stabs",enemiesStabbed1 + enemiesStabbed2 + enemiesStabbed3);
         _loc1_.stats.submit("Total Score",score1 + score2 + score3);
      }
      
      public static function completeStage4() : *
      {
         var _loc1_:KongregateAPI = null;
         stage4completed = true;
         timeTaken4 = timeTaken;
         hitsTaken4 = hitsTaken;
         slashes4 = slashes;
         kills4 = kills;
         headshots4 = headshots;
         deaths4 = deaths;
         maxCombo4 = maxCombo;
         enemiesLaunched4 = enemiesLaunched;
         enemiesStabbed4 = enemiesStabbed;
         score4 = score;
         _loc1_ = KongregateAPI.getInstance();
         _loc1_.stats.submit("Total Kills",kills1 + kills2 + kills3 + kills4);
         _loc1_.stats.submit("Total Headshots",headshots1 + headshots2 + headshots3 + headshots4);
         _loc1_.stats.submit("Max Combo",maxCombo);
         _loc1_.stats.submit("Total Launches",enemiesLaunched1 + enemiesLaunched2 + enemiesLaunched3 + enemiesLaunched4);
         _loc1_.stats.submit("Total Stabs",enemiesStabbed1 + enemiesStabbed2 + enemiesStabbed3 + enemiesStabbed4);
         _loc1_.stats.submit("Total Score",score1 + score2 + score3 + score4);
         _loc1_.stats.submit("Game Completed",1);
      }
      
      public static function getTotalScore() : int
      {
         return score1 + score2 + score3 + score4;
      }
      
      public static function getTotalTimeTakenSec() : String
      {
         var _loc1_:int = 0;
         _loc1_ = (timeTaken1 + timeTaken2 + timeTaken3 + timeTaken4) / 24;
         return _loc1_.toString();
      }
      
      public static function saveData() : *
      {
         var _loc1_:SharedObject = null;
         trace("save data");
         _loc1_ = SharedObject.getLocal("strawhatsamurai_2_0");
         _loc1_.data.saved = true;
         _loc1_.data.stage1completed = stage1completed;
         _loc1_.data.timeTaken1 = timeTaken1;
         _loc1_.data.hitsTaken1 = hitsTaken1;
         _loc1_.data.slashes1 = slashes1;
         _loc1_.data.kills1 = kills1;
         _loc1_.data.headshots1 = headshots1;
         _loc1_.data.deaths1 = deaths1;
         _loc1_.data.maxCombo1 = maxCombo1;
         _loc1_.data.enemiesLaunched1 = enemiesLaunched1;
         _loc1_.data.enemiesStabbed1 = enemiesStabbed1;
         _loc1_.data.score1 = score1;
         _loc1_.data.stage2completed = stage2completed;
         _loc1_.data.timeTaken2 = timeTaken2;
         _loc1_.data.hitsTaken2 = hitsTaken2;
         _loc1_.data.slashes2 = slashes2;
         _loc1_.data.kills2 = kills2;
         _loc1_.data.headshots2 = headshots2;
         _loc1_.data.deaths2 = deaths2;
         _loc1_.data.maxCombo2 = maxCombo2;
         _loc1_.data.enemiesLaunched2 = enemiesLaunched2;
         _loc1_.data.enemiesStabbed2 = enemiesStabbed2;
         _loc1_.data.score2 = score2;
         _loc1_.data.stage3completed = stage3completed;
         _loc1_.data.timeTaken3 = timeTaken3;
         _loc1_.data.hitsTaken3 = hitsTaken3;
         _loc1_.data.slashes3 = slashes3;
         _loc1_.data.kills3 = kills3;
         _loc1_.data.headshots3 = headshots3;
         _loc1_.data.deaths3 = deaths3;
         _loc1_.data.maxCombo3 = maxCombo3;
         _loc1_.data.enemiesLaunched3 = enemiesLaunched3;
         _loc1_.data.enemiesStabbed3 = enemiesStabbed3;
         _loc1_.data.score3 = score3;
         _loc1_.data.stage4completed = stage4completed;
         _loc1_.data.timeTaken4 = timeTaken4;
         _loc1_.data.hitsTaken4 = hitsTaken4;
         _loc1_.data.slashes4 = slashes4;
         _loc1_.data.kills4 = kills4;
         _loc1_.data.headshots4 = headshots4;
         _loc1_.data.deaths4 = deaths4;
         _loc1_.data.maxCombo4 = maxCombo4;
         _loc1_.data.enemiesLaunched4 = enemiesLaunched4;
         _loc1_.data.enemiesStabbed4 = enemiesStabbed4;
         _loc1_.data.score4 = score4;
         _loc1_.flush();
      }
      
      public static function loadData() : *
      {
         var _loc1_:SharedObject = null;
         trace("load data");
         _loc1_ = SharedObject.getLocal("strawhatsamurai_2_0");
         if(_loc1_.data.saved != true)
         {
            return;
         }
         stage1completed = _loc1_.data.stage1completed;
         timeTaken1 = _loc1_.data.timeTaken1;
         hitsTaken1 = _loc1_.data.hitsTaken1;
         slashes1 = _loc1_.data.slashes1;
         kills1 = _loc1_.data.kills1;
         headshots1 = _loc1_.data.headshots1;
         deaths1 = _loc1_.data.deaths1;
         maxCombo1 = _loc1_.data.maxCombo1;
         enemiesLaunched1 = _loc1_.data.enemiesLaunched1;
         enemiesStabbed1 = _loc1_.data.enemiesStabbed1;
         score1 = _loc1_.data.score1;
         stage2completed = _loc1_.data.stage2completed;
         timeTaken2 = _loc1_.data.timeTaken2;
         hitsTaken2 = _loc1_.data.hitsTaken2;
         slashes2 = _loc1_.data.slashes2;
         kills2 = _loc1_.data.kills2;
         headshots2 = _loc1_.data.headshots2;
         deaths2 = _loc1_.data.deaths2;
         maxCombo2 = _loc1_.data.maxCombo2;
         enemiesLaunched2 = _loc1_.data.enemiesLaunched2;
         enemiesStabbed2 = _loc1_.data.enemiesStabbed2;
         score2 = _loc1_.data.score2;
         stage3completed = _loc1_.data.stage3completed;
         timeTaken3 = _loc1_.data.timeTaken3;
         hitsTaken3 = _loc1_.data.hitsTaken3;
         slashes3 = _loc1_.data.slashes3;
         kills3 = _loc1_.data.kills3;
         headshots3 = _loc1_.data.headshots3;
         deaths3 = _loc1_.data.deaths3;
         maxCombo3 = _loc1_.data.maxCombo3;
         enemiesLaunched3 = _loc1_.data.enemiesLaunched3;
         enemiesStabbed3 = _loc1_.data.enemiesStabbed3;
         score3 = _loc1_.data.score3;
         stage4completed = _loc1_.data.stage4completed;
         timeTaken4 = _loc1_.data.timeTaken4;
         hitsTaken4 = _loc1_.data.hitsTaken4;
         slashes4 = _loc1_.data.slashes4;
         kills4 = _loc1_.data.kills4;
         headshots4 = _loc1_.data.headshots4;
         deaths4 = _loc1_.data.deaths4;
         maxCombo4 = _loc1_.data.maxCombo4;
         enemiesLaunched4 = _loc1_.data.enemiesLaunched4;
         enemiesStabbed4 = _loc1_.data.enemiesStabbed4;
         score4 = _loc1_.data.score4;
      }
   }
}

