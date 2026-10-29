package
{
   import com.google.analytics.AnalyticsTracker;
   import com.google.analytics.GATracker;
   import com.google.analytics.core.EventTracker;
   import flash.display.Stage;
   
   public class Tracker
   {
      
      public static var instance:Tracker;
      
      internal var tracker:AnalyticsTracker;
      
      internal var eventTracker:EventTracker;
      
      public function Tracker(stageMC:Stage)
      {
         super();
         instance = this;
         this.tracker = new GATracker(stageMC,"UA-22392484-1","AS3",false);
         this.tracker.trackPageview("/SwfStart");
         this.eventTracker = this.tracker.createEventTracker("SHS:Duels");
         this.eventTracker.trackEvent("SwfStart");
      }
      
      public function trackCharDelete() : *
      {
         if(StatsManager.offlineModeOnly || QueryManager.instance.offlineMode)
         {
            return;
         }
         this.eventTracker.trackEvent("DeleteCharacter",StatsManager.charname);
      }
      
      public function trackDuelUIChallenge() : *
      {
         if(StatsManager.offlineModeOnly || QueryManager.instance.offlineMode)
         {
            return;
         }
         this.eventTracker.trackEvent("DuelUIChallenge",StatsManager.charname);
      }
      
      public function trackShowRankings() : *
      {
         if(StatsManager.offlineModeOnly || QueryManager.instance.offlineMode)
         {
            return;
         }
         this.eventTracker.trackEvent("ShowRankings",StatsManager.charname);
      }
      
      public function trackShowInventoryUI() : *
      {
         if(StatsManager.offlineModeOnly || QueryManager.instance.offlineMode)
         {
            return;
         }
         this.eventTracker.trackEvent("ShowInventoryUI",StatsManager.charname);
      }
      
      public function trackShowQuestLogUI() : *
      {
         if(StatsManager.offlineModeOnly || QueryManager.instance.offlineMode)
         {
            return;
         }
         this.eventTracker.trackEvent("ShowQuesTLogUI",StatsManager.charname);
      }
      
      public function trackAbandonQuest(questID:int) : *
      {
         if(StatsManager.offlineModeOnly || QueryManager.instance.offlineMode)
         {
            return;
         }
         this.eventTracker.trackEvent("AbandonQuest",StatsManager.charname);
      }
      
      public function trackShowSkillUI() : *
      {
         if(StatsManager.offlineModeOnly || QueryManager.instance.offlineMode)
         {
            return;
         }
         this.eventTracker.trackEvent("ShowSkillUI",StatsManager.charname);
      }
      
      public function trackShowWarUI() : *
      {
         if(StatsManager.offlineModeOnly || QueryManager.instance.offlineMode)
         {
            return;
         }
         this.eventTracker.trackEvent("ShowWarUI",StatsManager.charname);
      }
      
      public function trackGameStart() : *
      {
         if(StatsManager.offlineModeOnly || QueryManager.instance.offlineMode)
         {
            return;
         }
         this.eventTracker.trackEvent("GameStart",StatsManager.charname);
      }
      
      public function trackPlaybackClient() : *
      {
         if(StatsManager.offlineModeOnly || QueryManager.instance.offlineMode)
         {
            return;
         }
         this.eventTracker.trackEvent("PlaybackClient",StatsManager.charname);
      }
      
      public function trackCreateCharacter() : *
      {
         if(StatsManager.offlineModeOnly || QueryManager.instance.offlineMode)
         {
            return;
         }
         this.eventTracker.trackEvent("CreateCharacter",StatsManager.charname);
      }
      
      public function trackShowDuelUI() : *
      {
         if(StatsManager.offlineModeOnly || QueryManager.instance.offlineMode)
         {
            return;
         }
         this.eventTracker.trackEvent("ShowDuelUI",StatsManager.charname);
      }
      
      public function trackAIDuelStart() : *
      {
         if(StatsManager.offlineModeOnly || QueryManager.instance.offlineMode)
         {
            return;
         }
         this.eventTracker.trackEvent("AIDuelStart",StatsManager.charname);
      }
      
      public function trackPvPDuelStart() : *
      {
         if(StatsManager.offlineModeOnly || QueryManager.instance.offlineMode)
         {
            return;
         }
         this.eventTracker.trackEvent("PvPDuelStart",StatsManager.charname);
      }
      
      public function trackAcceptedDuelChallenge() : *
      {
         if(StatsManager.offlineModeOnly || QueryManager.instance.offlineMode)
         {
            return;
         }
         this.eventTracker.trackEvent("AcceptedDuelChallenge",StatsManager.charname);
      }
      
      public function trackDeclinedDuelChallenge() : *
      {
         if(StatsManager.offlineModeOnly || QueryManager.instance.offlineMode)
         {
            return;
         }
         this.eventTracker.trackEvent("DeclinedDuelChallenge",StatsManager.charname);
      }
   }
}

