package
{
   public class §1t3653s0§ extends §1t80s0§
   {
      
      public var id:int;
      
      public var text:String;
      
      public var portrait:String;
      
      public function §1t3653s0§(param1:XML)
      {
         super();
         type = "dialogue";
         this.id = param1.id;
         this.portrait = this.§1t796s0§(param1.img);
         this.text = §1t1521s0§.§1t9287s0§(param1.text);
      }
      
      internal function §1t796s0§(param1:String) : String
      {
         return param1.substr(0,1) + param1.substr(1);
      }
   }
}

