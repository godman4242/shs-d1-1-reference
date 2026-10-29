package
{
   public class §1t107s0§
   {
      
      public var id:int;
      
      public var title:String;
      
      public var §1t1103s0§:int;
      
      public var §1t1104s0§:String;
      
      public var §1t1105s0§:String;
      
      public var ap:int;
      
      public var action:int;
      
      public var §1t1107s0§:int;
      
      public var type:int;
      
      public var auto:int;
      
      public var §1t1110s0§:XMLList;
      
      public var §1t1112s0§:§1t60s0§;
      
      public function §1t107s0§(param1:§1t69s0§, param2:int, param3:int)
      {
         super();
         this.§1t1103s0§ = param2;
         this.type = param3;
         if(param1 == null)
         {
            return;
         }
         this.id = param1.id;
         this.title = param1.name;
         var _loc4_:§1t85s0§ = param1.§1t1453s0§(this.§1t1103s0§);
         this.§1t1104s0§ = _loc4_.title;
         this.§1t1105s0§ = _loc4_.stitle;
         if(this.§1t1105s0§ == "")
         {
            this.§1t1105s0§ = this.§1t1104s0§;
         }
         this.ap = _loc4_.ap;
         this.action = _loc4_.action;
         this.§1t1107s0§ = param1.level;
         this.auto = _loc4_.auto;
         this.§1t1110s0§ = _loc4_.§1t1110s0§;
      }
      
      public function §1t1111s0§() : XMLList
      {
         return this.§1t1110s0§;
      }
      
      public function §1t1113s0§(param1:§1t60s0§) : *
      {
         this.§1t1112s0§ = param1;
      }
   }
}

