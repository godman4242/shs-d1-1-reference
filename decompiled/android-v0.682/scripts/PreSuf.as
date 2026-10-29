package
{
   public class PreSuf
   {
      
      internal var prefix:String;
      
      internal var suffix:String;
      
      public function PreSuf(p:String, s:String)
      {
         super();
         this.prefix = p;
         this.suffix = s;
      }
      
      public function getPrefix() : String
      {
         return this.prefix;
      }
      
      public function getSuffix() : String
      {
         return this.suffix;
      }
   }
}

