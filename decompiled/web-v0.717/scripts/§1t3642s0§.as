package
{
   public class §1t3642s0§ extends §1t80s0§
   {
      
      public var id:int;
      
      public var text:String;
      
      public var choice:Vector.<§1t405s0§>;
      
      public function §1t3642s0§(param1:XML)
      {
         super();
         type = "option";
         if(param1.text.toString() == "")
         {
            this.text = "";
         }
         else
         {
            this.text = §1t1521s0§.§1t9287s0§(param1.text);
         }
         this.choice = new Vector.<§1t405s0§>();
         var _loc2_:int = param1.choice.length();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.choice.push(new §1t405s0§(param1.choice[_loc3_]));
            _loc3_++;
         }
         if(param1.id.toString() == "")
         {
            this.id = -999;
         }
         else
         {
            this.id = param1.id;
         }
      }
      
      public function §1t3644s0§() : Boolean
      {
         return this.id != -999;
      }
   }
}

