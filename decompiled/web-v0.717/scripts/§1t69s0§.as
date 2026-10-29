package
{
   public class §1t69s0§
   {
      
      public var id:int;
      
      public var startin:int;
      
      public var name:String;
      
      public var level:int;
      
      public var type:int;
      
      public var §1t1450s0§:Boolean;
      
      public var startCondition:XMLList;
      
      private var §1t1451s0§:XMLList;
      
      public var §1t1452s0§:Vector.<§1t85s0§>;
      
      public function §1t69s0§(param1:XML)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         this.id = param1.id;
         this.startin = param1.startin;
         if(param1.title.toString() != "")
         {
            this.name = §1t1521s0§.§1t9287s0§(param1.title);
         }
         else
         {
            this.name = "";
         }
         if(this.name.charAt(0) == "-")
         {
            this.name = "";
         }
         if(param1.lvl.toString() == "")
         {
            this.level = 0;
         }
         else
         {
            this.level = param1.lvl;
         }
         if(param1.type.toString() == "")
         {
            this.type = 0;
         }
         else
         {
            this.type = param1.type;
         }
         if(param1.showdlg.toString() != "0")
         {
            this.§1t1450s0§ = true;
         }
         else
         {
            this.§1t1450s0§ = false;
         }
         this.startCondition = XMLList(param1.startCondition).copy();
         this.§1t1451s0§ = XMLList(param1.step).copy();
         this.§1t1455s0§();
      }
      
      public function §1t1453s0§(param1:int) : §1t85s0§
      {
         this.§1t1455s0§();
         if(this.§1t1452s0§.length <= param1)
         {
            return null;
         }
         return this.§1t1452s0§[param1];
      }
      
      public function §1t1454s0§() : Vector.<§1t85s0§>
      {
         this.§1t1455s0§();
         return this.§1t1452s0§;
      }
      
      private function §1t1455s0§() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this.§1t1451s0§ != null)
         {
            this.§1t1452s0§ = new Vector.<§1t85s0§>();
            _loc1_ = this.§1t1451s0§.length();
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               this.§1t1452s0§.push(new §1t85s0§(this.§1t1451s0§[_loc2_]));
               _loc2_++;
            }
            this.§1t1451s0§ = null;
         }
      }
   }
}

