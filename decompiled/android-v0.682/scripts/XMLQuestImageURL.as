package
{
   public class XMLQuestImageURL extends XMLQuestIntro
   {
      
      public var imageurl:String;
      
      public function XMLQuestImageURL(input:String)
      {
         super();
         type = "imageurl";
         this.imageurl = input;
      }
   }
}

