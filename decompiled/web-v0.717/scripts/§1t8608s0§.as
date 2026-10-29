package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3049")]
   public class §1t8608s0§ extends §1t399s0§
   {
      
      public var primary:MovieClip;
      
      internal var itemname:String = "";
      
      internal var itemtype:int;
      
      internal var color:uint;
      
      internal var descindex:int;
      
      public function §1t8608s0§(param1:String, param2:String)
      {
         var _loc4_:§1t58s0§ = null;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         super();
         this.props = param1;
         var _loc3_:Array = param1.split(",");
         _loc4_ = §1t58s0§.§1t8804s0§(int(_loc3_[0]));
         if(_loc3_.length == 2)
         {
            _loc5_ = int(_loc3_[1]);
         }
         else
         {
            _loc5_ = _loc4_.rand(3);
         }
         gotoAndStop(_loc5_ + 1);
         if(_loc5_ == 0)
         {
            _loc6_ = §1t1521s0§.getString(443);
            this.itemtype = 2122;
         }
         else if(_loc5_ == 1)
         {
            _loc6_ = §1t1521s0§.getString(444);
            this.itemtype = 2123;
         }
         else if(_loc5_ == 2)
         {
            _loc6_ = §1t1521s0§.getString(445);
            this.itemtype = 2124;
         }
         else if(_loc5_ == 3)
         {
            _loc6_ = §1t1521s0§.getString(4071);
            this.itemtype = 2148;
            _loc4_.destroy();
            _loc4_ = §1t58s0§.§1t8804s0§(int(_loc3_[0]) * §1t3317s0§.instance.§1t1848s0§());
         }
         var _loc7_:int = _loc4_.rand(11);
         var _loc8_:Array = [16711680,16737792,16763904,39168,13311,6684927,16751103,6697728,16777215,10066329,0];
         this.color = _loc8_[_loc7_];
         §1t1643s0§.§1t11214s0§(this.primary,this.color);
         this.descindex = _loc4_.rand(§1t1644s0§.instance.§1t1654s0§);
         this.itemname = §1t1644s0§.instance.§1t1667s0§(this.itemtype,this.descindex);
         objectName = param2;
         scaleX = Math.random() * 0.3 + 0.9;
         scaleY = Math.random() * 0.3 + 0.9;
         rotation = Math.random() * 5 - 10;
         if(int(Math.random()) * 2 == 0)
         {
            scaleX = -scaleX;
         }
         §1t8503s0§ = §1t407s0§.§1t12444s0§;
         _loc4_.destroy();
      }
      
      override public function interact() : *
      {
         var _loc2_:§1t85s0§ = null;
         if(!§1t1523s0§.§1t9606s0§(1))
         {
            §1t406s0§.instance.§1t6528s0§(§1t1521s0§.getString(100),§1t1521s0§.getString(5));
            return;
         }
         visible = false;
         §1t8501s0§ = false;
         §1t1523s0§.§1t9586s0§().§1t4453s0§(false);
         §1t1523s0§.§1t9586s0§().§1t1557s0§(§1t1544s0§.§1t10329s0§);
         §1t1525s0§.§1t9927s0§(objectName);
         if(§1t8502s0§ != null)
         {
            _loc2_ = §1t1524s0§.§1t9872s0§(§1t8502s0§.id,§1t8502s0§.§1t1103s0§);
            §1t6427s0§.§1t12475s0§(§1t8502s0§.id,§1t8502s0§.§1t1103s0§);
            return;
         }
         var _loc1_:§1t17s0§ = new §1t17s0§(this.itemtype);
         _loc1_.§1t529s0§(this.color);
         _loc1_.§1t493s0§(85,this.descindex);
         if(this.itemtype == 2122)
         {
            §1t1523s0§.§1t1684s0§(60012,1);
         }
         else if(this.itemtype == 2123)
         {
            §1t1523s0§.§1t1684s0§(60013,1);
         }
         else if(this.itemtype == 2124)
         {
            §1t1523s0§.§1t1684s0§(60014,1);
         }
         §1t1523s0§.§1t7693s0§(_loc1_);
         §1t3317s0§.instance.§1t1530s0§(§1t1523s0§.§1t9678s0§);
         §1t123s0§.instance.§1t1596s0§();
         §1t3317s0§.instance.§1t1946s0§();
      }
      
      override public function showInteractButton(param1:Boolean) : *
      {
         if(param1 && !shown && §1t8501s0§)
         {
            §1t406s0§.instance.§1t6574s0§().§1t6388s0§(this,§1t8503s0§);
            shown = true;
         }
         else if(!param1 && shown)
         {
            shown = false;
         }
      }
      
      override public function §1t6733s0§() : String
      {
         return §1t1521s0§.getString(431) + this.itemname;
      }
      
      override public function §1t8517s0§() : int
      {
         return 1;
      }
   }
}

