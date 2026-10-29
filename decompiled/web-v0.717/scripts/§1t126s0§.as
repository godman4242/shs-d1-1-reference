package
{
   public class §1t126s0§
   {
      
      internal static var instance:§1t126s0§;
      
      internal var §1t1687s0§:int = -1;
      
      internal var §1t1688s0§:Vector.<§1t80s0§>;
      
      internal var ending:Boolean;
      
      internal var showing:Boolean;
      
      public function §1t126s0§()
      {
         super();
         instance = this;
      }
      
      public static function §1t9190s0§() : §1t126s0§
      {
         if(instance == null)
         {
            instance = new §1t126s0§();
         }
         return instance;
      }
      
      public function §1t1690s0§(param1:Vector.<§1t80s0§>, param2:int = 0) : *
      {
         this.§1t1688s0§ = param1;
         this.§1t1687s0§ = param2 - 1;
         this.ending = false;
         this.showing = true;
         §1t406s0§.instance.§1t6613s0§();
         if(!§1t1540s0§.§1t10014s0§())
         {
            §1t1541s0§.§1t10099s0§();
            §1t1523s0§.§1t9586s0§().§1t4453s0§();
         }
         this.§1t813s0§();
      }
      
      public function §1t1691s0§(param1:Vector.<§1t80s0§>) : *
      {
         this.§1t1688s0§ = param1;
         this.§1t1687s0§ = -1;
         this.ending = true;
         this.showing = true;
         §1t406s0§.instance.§1t6613s0§();
         if(!§1t1540s0§.§1t10014s0§())
         {
            §1t1541s0§.§1t10099s0§();
            §1t1523s0§.§1t9586s0§().§1t4453s0§();
         }
         this.§1t813s0§();
      }
      
      public function §1t813s0§() : *
      {
         ++this.§1t1687s0§;
         if(this.§1t1688s0§ != null && this.§1t1687s0§ < this.§1t1688s0§.length)
         {
            this.display();
         }
         else
         {
            this.§1t1696s0§();
         }
      }
      
      public function §1t1692s0§() : *
      {
         --this.§1t1687s0§;
         this.display();
      }
      
      public function §1t1693s0§(param1:§1t127s0§) : *
      {
         var _loc2_:String = param1.§1t6406s0§();
         var _loc3_:int = param1.§1t6405s0§();
         var _loc4_:int = this.§1t1697s0§(_loc2_);
         if(_loc4_ == -1)
         {
            if(_loc3_ == -1)
            {
               this.§1t1695s0§();
            }
            else
            {
               this.§1t1687s0§ = _loc3_;
               this.display();
            }
         }
         else
         {
            this.§1t1687s0§ = _loc4_;
            this.display();
         }
      }
      
      internal function §1t1694s0§(param1:String) : *
      {
         var _loc2_:int = this.§1t1697s0§(param1);
         if(_loc2_ != -1)
         {
            this.§1t1687s0§ = _loc2_;
            this.display();
         }
         else
         {
            this.§1t1687s0§ = int(param1);
            this.display();
         }
      }
      
      public function §1t1695s0§() : *
      {
         if(§1t1540s0§.§1t9550s0§())
         {
            §1t406s0§.instance.§1t6610s0§();
            §1t1541s0§.§1t10045s0§();
         }
         else if(§1t1540s0§.§1t10014s0§())
         {
            §1t406s0§.instance.§1t6612s0§();
         }
         this.showing = false;
      }
      
      public function §1t1696s0§() : *
      {
         if(this.ending)
         {
            §1t6427s0§.§1t12478s0§();
         }
         else
         {
            §1t6427s0§.§1t12476s0§();
         }
         this.showing = false;
      }
      
      internal function §1t1697s0§(param1:String) : int
      {
         var _loc2_:§1t80s0§ = null;
         if(param1 == "")
         {
            return -1;
         }
         var _loc3_:int = int(this.§1t1688s0§.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.§1t1688s0§[_loc4_];
            if(_loc2_ != null && _loc2_.type == "label" && §1t3657s0§(_loc2_).label == param1)
            {
               return _loc4_;
            }
            _loc4_++;
         }
         return -1;
      }
      
      public function display() : *
      {
         var _loc1_:§1t80s0§ = null;
         var _loc3_:§1t3653s0§ = null;
         var _loc4_:int = 0;
         var _loc5_:§1t3642s0§ = null;
         var _loc6_:§1t3637s0§ = null;
         var _loc7_:§1t3646s0§ = null;
         var _loc8_:§1t3645s0§ = null;
         _loc1_ = this.§1t1688s0§[this.§1t1687s0§];
         if(_loc1_ == null)
         {
            this.§1t813s0§();
            return;
         }
         var _loc2_:String = _loc1_.type;
         switch(_loc2_)
         {
            case "text":
               §1t406s0§.instance.§1t6510s0§.show(§1t3658s0§(_loc1_).text);
               break;
            case "dialogue":
               _loc3_ = §1t3653s0§(_loc1_);
               _loc4_ = _loc3_.id;
               §1t406s0§.instance.§1t6516s0§.show(_loc4_,_loc3_.text,_loc3_.portrait);
               break;
            case "image":
               §1t406s0§.instance.§1t6514s0§.show(§1t3656s0§(_loc1_).image);
               break;
            case "imageurl":
               §1t406s0§.instance.§1t6514s0§.show(§1t3655s0§(_loc1_).imageurl,1);
               break;
            case "option":
               _loc5_ = §1t3642s0§(_loc1_);
               §1t406s0§.instance.§1t6512s0§.show(_loc5_.id,_loc5_.text,_loc5_.choice);
               break;
            case "outcome":
               _loc6_ = §1t3637s0§(_loc1_);
               _loc6_.§1t795s0§();
               break;
            case "cutscene":
               _loc7_ = §1t3646s0§(_loc1_);
               _loc7_.§1t3650s0§();
               break;
            case "label":
               this.§1t813s0§();
               break;
            case "goto":
               _loc8_ = §1t3645s0§(_loc1_);
               this.§1t1694s0§(_loc8_.label);
         }
      }
      
      public function clean() : *
      {
         this.§1t1688s0§.length = 0;
         this.§1t1687s0§ = -1;
      }
      
      public function destroy() : *
      {
         instance = null;
      }
      
      public function §1t1700s0§() : Boolean
      {
         return this.showing;
      }
   }
}

