package
{
   public class XMLQuestImage extends XMLQuestIntro
   {
      
      public var image:String;
      
      public function XMLQuestImage(input:String)
      {
         super();
         type = "image";
         this.image = input;
      }
   }
}

