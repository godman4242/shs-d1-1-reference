package
{
   public class §1t116s0§
   {
      
      public var enemy:XMLList;
      
      public var friend:XMLList;
      
      public var neutral:XMLList;
      
      public var objective:XMLList;
      
      public var endless:int;
      
      public function §1t116s0§(param1:XML)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         this.enemy = param1.enemy;
         this.friend = param1.friend;
         this.neutral = param1.neutral;
         this.objective = param1.objective;
         if(param1.endless.toString() == "")
         {
            this.endless = 0;
         }
         else
         {
            this.endless = param1.endless;
         }
      }
      
      public function init(param1:XMLList, param2:XMLList = null, param3:XMLList = null, param4:XMLList = null, param5:int = 0) : *
      {
         this.enemy = param1;
         if(param2 == null)
         {
            this.friend = new XMLList();
         }
         else
         {
            this.friend = param2;
         }
         if(param3 == null)
         {
            this.neutral = new XMLList();
         }
         else
         {
            this.neutral = param3;
         }
         if(param4 == null)
         {
            this.objective = new XMLList();
         }
         else
         {
            this.objective = param4;
         }
         this.endless = param5;
      }
      
      public function §1t1014s0§() : *
      {
         this.enemy = new XMLList("<enemy><id>" + -1 + "</id><qty>" + 1 + "</qty></enemy>");
         this.friend = new XMLList();
         this.neutral = new XMLList();
         this.objective = new XMLList();
         this.endless = 0;
      }
      
      public function §1t1015s0§() : *
      {
         this.enemy = new XMLList("<enemy><id>" + 700 + "</id><x>150</x><qty>1</qty></enemy><enemy><id>" + 701 + "</id><x>650</x><qty>1</qty></enemy>");
         this.friend = new XMLList();
         this.neutral = new XMLList();
         this.objective = new XMLList();
         this.endless = 0;
      }
      
      public function §1t1016s0§(param1:int) : *
      {
         var _loc2_:String = "";
         var _loc3_:int = 0;
         while(_loc3_ < param1)
         {
            _loc2_ += "<enemy><id>" + (700 + _loc3_).toString() + "</id><x>0</x><qty>1</qty></enemy>";
            _loc3_++;
         }
         this.enemy = new XMLList(_loc2_);
         this.friend = new XMLList();
         this.neutral = new XMLList();
         this.objective = new XMLList();
         this.endless = 0;
      }
   }
}

