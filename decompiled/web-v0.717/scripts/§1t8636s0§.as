package
{
   import flash.display.MovieClip;
   
   public class §1t8636s0§ extends §1t399s0§
   {
      
      internal var mcs:§1t75s0§;
      
      internal var npcname:String;
      
      internal var shopName:String;
      
      public function §1t8636s0§(param1:String, param2:String = "")
      {
         super();
         if(param1 == "")
         {
            param1 = "1";
         }
         this.props = param1;
         var _loc3_:Array = param1.split(",");
         var _loc4_:int = int(_loc3_[0]);
         this.mcs = §1t1524s0§.§1t9883s0§(_loc4_);
         if(_loc3_.length < 2)
         {
            this.mcs.§1t1557s0§(§1t1544s0§.§1t10267s0§);
         }
         else
         {
            this.mcs.§1t1557s0§(_loc3_[1]);
         }
         if(_loc3_.length >= 3 && _loc3_[2] == "1")
         {
            this.mcs.§1t5493s0§();
         }
         else
         {
            this.mcs.§1t5492s0§();
         }
         addChild(this.mcs);
         this.npcname = §1t1524s0§.§1t1582s0§(_loc4_);
         if(param2 == "")
         {
            objectName = this.npcname;
         }
         else
         {
            objectName = param2;
         }
         this.mcs.§1t6287s0§(this.npcname);
         §1t8503s0§ = §1t407s0§.§1t12433s0§;
         this.shopName = §1t1521s0§.getString(§1t1524s0§.§1t1183s0§(§1t6427s0§.§1t9911s0§).name);
      }
      
      override public function interact() : *
      {
         §1t406s0§.instance.§1t5947s0§.show(§1t401s0§.§1t12349s0§);
      }
      
      override public function §1t6733s0§() : String
      {
         return this.shopName;
      }
      
      override public function §1t8518s0§(param1:MovieClip) : Boolean
      {
         return abs(x - param1.x) < 100;
      }
   }
}

