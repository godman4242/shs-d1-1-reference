package
{
   public class XMLQuestText extends XMLQuestIntro
   {
      
      public var text:String;
      
      public function XMLQuestText(input:String)
      {
         super();
         type = "text";
         this.text = LangManager.getQuestString(input);
      }
   }
}

