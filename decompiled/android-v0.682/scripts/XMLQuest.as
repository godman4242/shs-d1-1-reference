package
{
   public class XMLQuest
   {
      
      public var id:int;
      
      public var startin:int;
      
      public var name:String;
      
      public var level:int;
      
      public var type:int;
      
      public var showCompletedDialog:Boolean;
      
      public var startCondition:XMLList;
      
      private var stepXML:XMLList;
      
      public var stepList:Vector.<XMLQuestStep>;
      
      public function XMLQuest(xml:XML)
      {
         super();
         if(xml == null)
         {
            return;
         }
         this.id = xml.id;
         this.startin = xml.startin;
         if(xml.title.toString() != "")
         {
            this.name = LangManager.getQuestString(xml.title);
         }
         else
         {
            this.name = "";
         }
         if(this.name.charAt(0) == "-")
         {
            this.name = "";
         }
         if(xml.lvl.toString() == "")
         {
            this.level = 0;
         }
         else
         {
            this.level = xml.lvl;
         }
         if(xml.type.toString() == "")
         {
            this.type = 0;
         }
         else
         {
            this.type = xml.type;
         }
         if(xml.showdlg.toString() != "0")
         {
            this.showCompletedDialog = true;
         }
         else
         {
            this.showCompletedDialog = false;
         }
         this.startCondition = xml.startCondition;
         this.stepXML = xml.step;
      }
      
      public function getStep(index:int) : XMLQuestStep
      {
         this.fullParseQuestStep();
         if(this.stepList.length <= index)
         {
            return null;
         }
         return this.stepList[index];
      }
      
      public function getStepList() : Vector.<XMLQuestStep>
      {
         this.fullParseQuestStep();
         return this.stepList;
      }
      
      private function fullParseQuestStep() : void
      {
         var max:int = 0;
         var i:int = 0;
         if(this.stepXML != null)
         {
            this.stepList = new Vector.<XMLQuestStep>();
            max = this.stepXML.length();
            for(i = 0; i < max; i++)
            {
               this.stepList.push(new XMLQuestStep(this.stepXML[i]));
            }
            this.stepXML = null;
         }
      }
   }
}

