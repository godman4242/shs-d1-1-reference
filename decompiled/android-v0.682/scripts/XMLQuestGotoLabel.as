package
{
   public class XMLQuestGotoLabel extends XMLQuestIntro
   {
      
      public var label:String;
      
      public function XMLQuestGotoLabel(input:String)
      {
         super();
         type = "goto";
         this.label = input;
      }
   }
}

