package
{
   public class §1t855s0§
   {
      
      internal var §1t856s0§:Array;
      
      internal var §1t857s0§:Array;
      
      internal var §1t858s0§:int;
      
      internal var §1t859s0§:int;
      
      internal var §1t860s0§:int;
      
      internal var §1t861s0§:int;
      
      internal var §1t862s0§:int;
      
      internal var §1t863s0§:Class;
      
      internal var §1t864s0§:String;
      
      internal var debug:Boolean = false;
      
      public function §1t855s0§(param1:Class, param2:int, param3:int, param4:int, param5:String = "", param6:Boolean = false, param7:Boolean = false)
      {
         super();
         this.§1t863s0§ = param1;
         this.§1t856s0§ = new Array();
         this.§1t860s0§ = param2;
         this.§1t861s0§ = param3;
         this.§1t862s0§ = param4;
         this.§1t864s0§ = param5;
         if(param6)
         {
            this.§1t857s0§ = new Array();
         }
         this.debug = param7;
         var _loc8_:int = 0;
         while(_loc8_ < param2)
         {
            this.§1t856s0§.push(new param1());
            _loc8_++;
         }
         this.§1t858s0§ = param2;
         this.§1t859s0§ = 0;
      }
      
      public function §1t866s0§() : *
      {
         var _loc1_:* = undefined;
         if(this.§1t858s0§ == 0)
         {
            if(this.debug)
            {
            }
            _loc1_ = new this.§1t863s0§();
         }
         else
         {
            --this.§1t858s0§;
            _loc1_ = this.§1t856s0§.pop();
         }
         if(this.§1t857s0§ != null)
         {
            this.§1t857s0§.push(_loc1_);
         }
         ++this.§1t859s0§;
         return _loc1_;
      }
      
      public function §1t867s0§(param1:Object) : *
      {
         if(this.§1t858s0§ < this.§1t862s0§)
         {
            if(this.§1t864s0§ != "")
            {
               param1[this.§1t864s0§]();
            }
            else if(this.§1t863s0§ == Array)
            {
               param1.length = 0;
            }
            ++this.§1t858s0§;
            this.§1t856s0§.push(param1);
         }
         else if(this.debug)
         {
         }
         --this.§1t859s0§;
         if(this.debug && this.§1t857s0§ == null)
         {
         }
      }
      
      public function §1t868s0§() : *
      {
         if(this.§1t857s0§ == null)
         {
            return;
         }
         var _loc1_:int = int(this.§1t857s0§.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            this.§1t867s0§(this.§1t857s0§[_loc2_]);
            _loc2_++;
         }
         this.§1t857s0§.length = 0;
         if(this.debug)
         {
         }
         if(this.§1t858s0§ > this.§1t861s0§ && _loc1_ < this.§1t861s0§)
         {
            this.§1t858s0§ = this.§1t856s0§.length - 5;
            this.§1t856s0§.length = this.§1t858s0§;
            if(this.debug)
            {
            }
         }
      }
      
      public function destroy() : *
      {
         this.§1t868s0§();
         this.§1t856s0§.length = 0;
         if(this.§1t857s0§ != null)
         {
            this.§1t857s0§.length = 0;
         }
         this.§1t858s0§ = 0;
         this.§1t859s0§ = 0;
         this.§1t860s0§ = 0;
         this.§1t861s0§ = 0;
         this.§1t862s0§ = 0;
         this.§1t864s0§ = null;
         this.§1t863s0§ = null;
      }
   }
}

