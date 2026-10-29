package
{
   public class QuestAction
   {
      
      public var id:int;
      
      public var title:String;
      
      public var stepNo:int;
      
      public var stepTitle:String;
      
      public var stepShortTitle:String;
      
      public var ap:int;
      
      public var action:int;
      
      public var levelLimit:int;
      
      public var type:int;
      
      public var auto:int;
      
      public var roomObj:XMLList;
      
      public var procGenQuest:ActiveQuest;
      
      public function QuestAction(xml:XMLQuest, currentStep:int, questType:int)
      {
         super();
         this.stepNo = currentStep;
         this.type = questType;
         if(xml == null)
         {
            return;
         }
         this.id = xml.id;
         this.title = xml.name;
         var stepData:XMLQuestStep = xml.getStep(this.stepNo);
         this.stepTitle = stepData.title;
         this.stepShortTitle = stepData.stitle;
         if(this.stepShortTitle == "")
         {
            this.stepShortTitle = this.stepTitle;
         }
         this.ap = stepData.ap;
         this.action = stepData.action;
         this.levelLimit = xml.level;
         this.auto = stepData.auto;
         this.roomObj = stepData.roomObj;
      }
      
      public function getRoomObj() : XMLList
      {
         return this.roomObj;
      }
      
      public function setProcGen(activeQuest:ActiveQuest) : *
      {
         this.procGenQuest = activeQuest;
      }
   }
}

