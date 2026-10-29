package
{
   import com.google.analytics.AnalyticsTracker;
   import com.google.analytics.GATracker;
   import com.google.analytics.core.EventTracker;
   import flash.display.Stage;
   
   public class §1t1623s0§
   {
      
      public static var instance:§1t1623s0§;
      
      internal var §1t1624s0§:AnalyticsTracker;
      
      internal var §1t1625s0§:EventTracker;
      
      public function §1t1623s0§(param1:Stage)
      {
         var §1t9973s0§:Stage = param1;
         super();
         instance = this;
         if(§1t1523s0§.§1t9528s0§)
         {
            return;
         }
         try
         {
            this.§1t1624s0§ = new GATracker(§1t9973s0§,"UA-22392484-1","AS3",false);
            this.§1t1624s0§.trackPageview("/SwfStart");
            this.§1t1625s0§ = this.§1t1624s0§.createEventTracker("SHS:Duels");
            this.§1t1625s0§.trackEvent("SwfStart");
         }
         catch(e:Error)
         {
         }
      }
      
      public function §1t1626s0§() : *
      {
         if(this.§1t1625s0§ == null || §1t1523s0§.§1t9502s0§ || §1t3317s0§.instance.§1t1833s0§)
         {
            return;
         }
         this.§1t1625s0§.trackEvent("DeleteCharacter",§1t1523s0§.charname);
      }
      
      public function §1t1627s0§() : *
      {
         if(this.§1t1625s0§ == null || §1t1523s0§.§1t9502s0§ || §1t3317s0§.instance.§1t1833s0§)
         {
            return;
         }
         this.§1t1625s0§.trackEvent("DuelUIChallenge",§1t1523s0§.charname);
      }
      
      public function §1t1628s0§() : *
      {
         if(this.§1t1625s0§ == null || §1t1523s0§.§1t9502s0§ || §1t3317s0§.instance.§1t1833s0§)
         {
            return;
         }
         this.§1t1625s0§.trackEvent("Trade",§1t1523s0§.charname);
      }
      
      public function §1t1629s0§() : *
      {
         if(this.§1t1625s0§ == null || §1t1523s0§.§1t9502s0§ || §1t3317s0§.instance.§1t1833s0§)
         {
            return;
         }
         this.§1t1625s0§.trackEvent("ShowRankings",§1t1523s0§.charname);
      }
      
      public function §1t1630s0§() : *
      {
         if(this.§1t1625s0§ == null || §1t1523s0§.§1t9502s0§ || §1t3317s0§.instance.§1t1833s0§)
         {
            return;
         }
         this.§1t1625s0§.trackEvent("ShowInventoryUI",§1t1523s0§.charname);
      }
      
      public function §1t1631s0§() : *
      {
         if(this.§1t1625s0§ == null || §1t1523s0§.§1t9502s0§ || §1t3317s0§.instance.§1t1833s0§)
         {
            return;
         }
         this.§1t1625s0§.trackEvent("ShowQuesTLogUI",§1t1523s0§.charname);
      }
      
      public function §1t1632s0§(param1:int) : *
      {
         if(this.§1t1625s0§ == null || §1t1523s0§.§1t9502s0§ || §1t3317s0§.instance.§1t1833s0§)
         {
            return;
         }
         this.§1t1625s0§.trackEvent("AbandonQuest",§1t1523s0§.charname);
      }
      
      public function §1t1633s0§() : *
      {
         if(this.§1t1625s0§ == null || §1t1523s0§.§1t9502s0§ || §1t3317s0§.instance.§1t1833s0§)
         {
            return;
         }
         this.§1t1625s0§.trackEvent("ShowSkillUI",§1t1523s0§.charname);
      }
      
      public function §1t1634s0§() : *
      {
         if(this.§1t1625s0§ == null || §1t1523s0§.§1t9502s0§ || §1t3317s0§.instance.§1t1833s0§)
         {
            return;
         }
         this.§1t1625s0§.trackEvent("ShowWarUI",§1t1523s0§.charname);
      }
      
      public function §1t1635s0§() : *
      {
         if(this.§1t1625s0§ == null || §1t1523s0§.§1t9502s0§ || §1t3317s0§.instance.§1t1833s0§)
         {
            return;
         }
         this.§1t1625s0§.trackEvent("GameStart",§1t1523s0§.charname);
      }
      
      public function §1t1636s0§() : *
      {
         if(§1t1523s0§.§1t9502s0§ || §1t3317s0§.instance.§1t1833s0§)
         {
            return;
         }
         this.§1t1625s0§.trackEvent("PlaybackClient",§1t1523s0§.charname);
      }
      
      public function §1t1637s0§() : *
      {
         if(this.§1t1625s0§ == null || §1t1523s0§.§1t9502s0§ || §1t3317s0§.instance.§1t1833s0§)
         {
            return;
         }
         this.§1t1625s0§.trackEvent("CreateCharacter",§1t1523s0§.charname);
      }
      
      public function §1t1638s0§() : *
      {
         if(this.§1t1625s0§ == null || §1t1523s0§.§1t9502s0§ || §1t3317s0§.instance.§1t1833s0§)
         {
            return;
         }
         this.§1t1625s0§.trackEvent("ShowDuelUI",§1t1523s0§.charname);
      }
      
      public function §1t1639s0§() : *
      {
         if(this.§1t1625s0§ == null || §1t1523s0§.§1t9502s0§ || §1t3317s0§.instance.§1t1833s0§)
         {
            return;
         }
         this.§1t1625s0§.trackEvent("AIDuelStart",§1t1523s0§.charname);
      }
      
      public function §1t1640s0§() : *
      {
         if(this.§1t1625s0§ == null || §1t1523s0§.§1t9502s0§ || §1t3317s0§.instance.§1t1833s0§)
         {
            return;
         }
         this.§1t1625s0§.trackEvent("PvPDuelStart",§1t1523s0§.charname);
      }
      
      public function §1t1641s0§() : *
      {
         if(this.§1t1625s0§ == null || §1t1523s0§.§1t9502s0§ || §1t3317s0§.instance.§1t1833s0§)
         {
            return;
         }
         this.§1t1625s0§.trackEvent("AcceptedDuelChallenge",§1t1523s0§.charname);
      }
      
      public function §1t1642s0§() : *
      {
         if(this.§1t1625s0§ == null || §1t1523s0§.§1t9502s0§ || §1t3317s0§.instance.§1t1833s0§)
         {
            return;
         }
         this.§1t1625s0§.trackEvent("DeclinedDuelChallenge",§1t1523s0§.charname);
      }
   }
}

