package
{
   public class XMLWorldMap
   {
      
      public var id:int;
      
      public var x:int;
      
      public var y:int;
      
      public var image:String;
      
      public var imageurl:String;
      
      public function XMLWorldMap(xml:XML)
      {
         super();
         this.id = xml.id;
         this.x = xml.x;
         this.y = xml.y;
         this.image = xml.image;
         this.imageurl = xml.url;
      }
   }
}

