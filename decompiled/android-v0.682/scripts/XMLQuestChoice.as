package
{
   public class XMLQuestChoice
   {
      
      public var text:String;
      
      public var goto:int;
      
      public var gotolabel:String;
      
      public var condition:XMLList;
      
      public var outcome:XMLList;
      
      public function XMLQuestChoice(xml:XML)
      {
         super();
         this.text = LangManager.getQuestString(xml.text);
         this.gotolabel = xml.gotolabel;
         if(xml.goto.toString() == "")
         {
            this.goto = -1;
         }
         else
         {
            this.goto = xml.goto;
         }
         this.condition = xml.condition;
         this.outcome = xml.outcome;
      }
      
      public function passCondition() : Boolean
      {
         return this.condition.toString() == "" || StatsManager.checkConditions(this.condition);
      }
      
      public function applyOutcome() : *
      {
         var outcomeXML:XMLQuestOutcome = null;
         var max:int = this.outcome.length();
         for(var i:int = 0; i < max; i++)
         {
            outcomeXML = new XMLQuestOutcome(this.outcome[i]);
            outcomeXML.applyOutcome();
         }
      }
   }
}

