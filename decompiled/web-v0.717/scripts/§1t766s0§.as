package
{
   public class §1t766s0§
   {
      
      public var label:int;
      
      public var icon:int = -1;
      
      public var condition:XMLList;
      
      private var §1t770s0§:String;
      
      public var §1t771s0§:int;
      
      public var ap:int = 0;
      
      public var §1t773s0§:int = 0;
      
      public function §1t766s0§(param1:XML)
      {
         super();
         this.label = param1.label;
         if(param1.icon.toString() != "")
         {
            this.icon = param1.icon;
         }
         if(param1.ap.toString() != "")
         {
            this.ap = param1.ap;
         }
         if(param1.errormsg.toString() != "")
         {
            this.§1t773s0§ = param1.errormsg;
         }
         if(param1.action.toString() != "")
         {
            this.§1t770s0§ = this.encrypt(param1.action.id);
            if(param1.action.param.toString() != "")
            {
               this.§1t771s0§ = param1.action.param;
            }
         }
         this.condition = XMLList(param1.condition).copy();
      }
      
      internal function encrypt(param1:String) : String
      {
         var _loc4_:* = 0;
         if(param1 == "")
         {
            return "";
         }
         var _loc2_:int = param1.length;
         var _loc3_:String = "";
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_)
         {
            _loc4_ = §1t1523s0§.§1t9777s0§(param1,_loc5_);
            _loc4_ = _loc4_ + 1;
            _loc3_ += §1t1523s0§.§1t9778s0§(_loc4_);
            _loc5_++;
         }
         return _loc3_;
      }
      
      internal function §1t775s0§() : String
      {
         var _loc3_:* = 0;
         var _loc1_:int = this.§1t770s0§.length;
         var _loc2_:String = "";
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_)
         {
            _loc3_ = §1t1523s0§.§1t9777s0§(this.§1t770s0§,_loc4_);
            _loc3_--;
            _loc2_ += §1t1523s0§.§1t9778s0§(_loc3_);
            _loc4_++;
         }
         return _loc2_;
      }
   }
}

