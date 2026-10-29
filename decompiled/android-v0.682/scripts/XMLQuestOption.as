package
{
   public class XMLQuestOption extends XMLQuestIntro
   {
      
      public var id:int;
      
      public var text:String;
      
      public var choice:Vector.<XMLQuestChoice>;
      
      public function XMLQuestOption(xml:XML)
      {
         super();
         type = "option";
         if(xml.text.toString() == "")
         {
            this.text = "";
         }
         else
         {
            this.text = LangManager.getQuestString(xml.text);
         }
         this.choice = new Vector.<XMLQuestChoice>();
         var length:int = xml.choice.length();
         for(var i:int = 0; i < length; i++)
         {
            this.choice.push(new XMLQuestChoice(xml.choice[i]));
         }
         if(xml.id.toString() == "")
         {
            this.id = -999;
         }
         else
         {
            this.id = xml.id;
         }
      }
      
      public function hasBust() : Boolean
      {
         return this.id != -999;
      }
   }
}

