package
{
   public class XMLQuestDialogue extends XMLQuestIntro
   {
      
      public var id:int;
      
      public var text:String;
      
      public var portrait:String;
      
      public function XMLQuestDialogue(xml:XML)
      {
         super();
         type = "dialogue";
         this.id = xml.id;
         this.portrait = xml.img;
         this.text = LangManager.getQuestString(xml.text);
      }
   }
}

