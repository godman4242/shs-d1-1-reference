package
{
   public class §1t405s0§
   {
      
      public var text:String;
      
      public var goto:int;
      
      public var gotolabel:String;
      
      public var condition:XMLList;
      
      public var outcome:XMLList;
      
      public function §1t405s0§(param1:XML)
      {
         super();
         this.text = §1t1521s0§.§1t9287s0§(param1.text);
         this.gotolabel = this.§1t796s0§(param1.gotolabel);
         if(param1.goto.toString() == "")
         {
            this.goto = -1;
         }
         else
         {
            this.goto = param1.goto;
         }
         this.condition = XMLList(param1.condition).copy();
         this.outcome = XMLList(param1.outcome).copy();
      }
      
      public function §1t794s0§() : Boolean
      {
         return this.condition.toString() == "" || §1t1523s0§.§1t640s0§(this.condition);
      }
      
      public function §1t795s0§() : *
      {
         var _loc2_:§1t3637s0§ = null;
         var _loc1_:int = this.outcome.length();
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_)
         {
            _loc2_ = new §1t3637s0§(this.outcome[_loc3_]);
            _loc2_.§1t795s0§();
            _loc3_++;
         }
      }
      
      internal function §1t796s0§(param1:String) : String
      {
         return param1.substr(0,1) + param1.substr(1);
      }
   }
}

