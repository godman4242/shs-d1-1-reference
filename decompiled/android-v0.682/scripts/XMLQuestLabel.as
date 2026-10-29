package
{
   public class XMLQuestLabel extends XMLQuestIntro
   {
      
      public var label:String;
      
      public function XMLQuestLabel(input:String)
      {
         super();
         type = "label";
         this.label = input;
      }
   }
}

