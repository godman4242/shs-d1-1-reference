package
{
   public class QuestItem
   {
      
      public static var RONINSIM:int = 0;
      
      public static var WILDLIFESIM:int = 1;
      
      public static var MERCSIM:int = 2;
      
      public static var BANDITSIM:int = 3;
      
      public static var ONISIM:int = 4;
      
      public static var UNDEADSIM:int = 5;
      
      public static var VILLAGESIM:int = 6;
      
      public static var NINJASIM:int = 7;
      
      public static var CLANSIM:int = 8;
      
      public static var PLAYERSIM:int = 9;
      
      public static var QUEST_KILLWILDLIFE:int = 0;
      
      public static var QUEST_KILLBANDIT:int = 1;
      
      public static var QUEST_KILLONI:int = 2;
      
      public static var QUEST_KILLUNDEAD:int = 3;
      
      public static var QUEST_GIVEWEAPONS:int = 4;
      
      public static var QUEST_GIVEORE:int = 5;
      
      public static var QUEST_SUMMONONI:int = 6;
      
      public static var QUEST_SUMMONMERC:int = 7;
      
      public static var QUEST_SUMMONNINJA:int = 8;
      
      public static var QUEST_UNWANTEDMERC:int = 9;
      
      public static var QUEST_GRAVEYARD:int = 10;
      
      public static var QUEST_DUEL:int = 11;
      
      public static var QUEST_GUIDE:int = 12;
      
      public static var QUEST_ITEM:int = 13;
      
      public static var QUEST_TRADE:int = 14;
      
      public static var QUEST_BOUNTYBOARD:int = 15;
      
      public static var QUEST_GIVECROPS:int = 16;
      
      public static var REASON_EATINGCROPS_PREEMPTIVE:int = 0;
      
      public static var REASON_EATINGCROPS:int = 1;
      
      public static var REASON_POACHERS:int = 2;
      
      public static var REASON_KILLINGTOOMANYWILDLIFE:int = 3;
      
      public static var REASON_FORITEMS:int = 4;
      
      public static var REASON_TOOMUCHROBBERY:int = 5;
      
      public static var REASON_TOOMANY:int = 6;
      
      public static var REASON_BANDITSATTACKINGTOWN:int = 7;
      
      public static var REASON_BANDITSATTACKINGTOWN_PREEMPTIVE:int = 8;
      
      public static var REASON_ONIATTACKINGTOWN:int = 9;
      
      public static var REASON_ONIATTACKINGTOWN_PREEMPTIVE:int = 10;
      
      public static var REASON_UNDEADATTACKINGTOWN:int = 11;
      
      public static var REASON_UNDEADATTACKINGTOWN_PREEMPTIVE:int = 12;
      
      public static var REASON_REDUCESOURCE:int = 13;
      
      public static var REASON_BUILDINGTOWN:int = 14;
      
      public static var REASON_TOOMANYATTACKS:int = 15;
      
      public static var REASON_INCREASECROPS:int = 16;
      
      public static var REASON_IDLE:int = 17;
      
      public static var REASON_RONIN:int = 18;
      
      public static var REASON_MERC:int = 19;
      
      internal var questGiver:int;
      
      internal var questType:int;
      
      internal var targetLocation:int;
      
      internal var reason:int;
      
      public function QuestItem(questGiver:int, questType:int, reason:int, targetLocation:int = -1)
      {
         super();
         this.questGiver = questGiver;
         this.questType = questType;
         this.reason = reason;
         this.targetLocation = targetLocation;
      }
   }
}

