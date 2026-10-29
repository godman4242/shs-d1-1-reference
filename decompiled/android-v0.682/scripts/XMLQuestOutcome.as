package
{
   public class XMLQuestOutcome extends XMLQuestIntro
   {
      
      public var id:int;
      
      public var setNo:int;
      
      public var modify:int;
      
      public var end:int;
      
      internal var hasSet:Boolean = false;
      
      internal var hasModify:Boolean = false;
      
      public function XMLQuestOutcome(xml:XML)
      {
         super();
         type = "outcome";
         if(xml.id.toString() == "")
         {
            this.id = -1;
         }
         else
         {
            this.id = xml.id;
         }
         if(xml.set.toString() != "")
         {
            this.setNo = xml.set;
            this.hasSet = true;
         }
         if(xml.modify.toString() != "")
         {
            this.modify = xml.modify;
            this.hasModify = true;
         }
         if(xml.end.toString() == "")
         {
            this.end = 0;
         }
         else
         {
            this.end = xml.end;
         }
      }
      
      public function applyOutcome() : *
      {
         if(this.id >= 0)
         {
            if(this.hasModify)
            {
               if(this.id == 11 && this.modify > 0)
               {
                  OverworldHUD.instance.lootDialog.addLootCoins(this.modify);
               }
               else if(this.id >= 2000 && this.id < 30000 && this.modify > 0)
               {
                  OverworldHUD.instance.lootDialog.addLootItemBasic(this.id,this.modify);
               }
               else if(this.id == StatsManager.STAT_XP)
               {
                  OverworldHUD.instance.lootDialog.addLootXP(this.modify);
               }
               else
               {
                  StatsManager.changeStat(this.id,this.modify);
               }
            }
            else if(this.hasSet)
            {
               StatsManager.setStat(this.id,this.setNo);
            }
         }
         if(this.end == -1)
         {
            CutsceneManager.getInstance().leaveCancel();
         }
         else if(this.end == 1)
         {
            CutsceneManager.getInstance().leaveOK();
         }
         else
         {
            CutsceneManager.getInstance().nextStep();
         }
      }
   }
}

