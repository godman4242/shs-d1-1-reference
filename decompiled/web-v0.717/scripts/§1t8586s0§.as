package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3234")]
   public class §1t8586s0§ extends §1t399s0§
   {
      
      internal var lvl:int;
      
      public function §1t8586s0§(param1:String, param2:String = "")
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2);
         this.props = param1;
         if(param2 == "")
         {
            objectName = "Loot Chest";
         }
         else
         {
            objectName = param2;
         }
         var _loc3_:Array = param1.split(",");
         this.lvl = _loc3_[0];
         if(_loc3_.length > 1 && _loc3_[1] == "1")
         {
            gotoAndStop(2);
            §1t8501s0§ = false;
         }
         §1t8503s0§ = §1t407s0§.§1t12444s0§;
      }
      
      override public function interact() : *
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         gotoAndStop(2);
         §1t8501s0§ = false;
         §1t1525s0§.§1t9927s0§(objectName);
         §1t406s0§.instance.§1t6440s0§.§1t6344s0§();
         §1t406s0§.instance.§1t6488s0§.§1t6194s0§(this.lvl,false,true);
         §1t406s0§.instance.§1t6488s0§.§1t6194s0§(this.lvl);
         §1t406s0§.instance.§1t6488s0§.§1t5846s0§(Math.random() * this.lvl);
         var _loc1_:int = §1t406s0§.instance.§1t6488s0§.§1t6207s0§();
         var _loc5_:int = 0;
         while(_loc5_ < _loc1_)
         {
            _loc2_ = Math.random() * 16 - 8;
            if(x < 100 && _loc2_ < 0)
            {
               _loc2_ *= -1;
            }
            else if(x > §1t1525s0§.§1t8124s0§() - 100 && _loc2_ > 0)
            {
               _loc2_ *= -1;
            }
            _loc4_ = 20;
            if(_loc2_ < 0)
            {
               _loc4_ = -20;
            }
            _loc3_ = -Math.random() * 10 - 25;
            §1t1712s0§.§1t11326s0§(x,y - 50,_loc2_,_loc3_,_loc4_,2);
            _loc5_++;
         }
         _loc1_ = §1t406s0§.instance.§1t6488s0§.§1t6208s0§();
         if(_loc1_ > 20)
         {
            _loc1_ = 0;
         }
         _loc5_ = 0;
         while(_loc5_ < _loc1_)
         {
            _loc2_ = Math.random() * 16 - 8;
            if(x < 100 && _loc2_ < 0)
            {
               _loc2_ *= -1;
            }
            else if(x > §1t1525s0§.§1t8124s0§() - 100 && _loc2_ > 0)
            {
               _loc2_ *= -1;
            }
            _loc4_ = 20;
            if(_loc2_ < 0)
            {
               _loc4_ = -20;
            }
            _loc3_ = -Math.random() * 10 - 20;
            §1t1712s0§.§1t11326s0§(x,y - 50,_loc2_,_loc3_,_loc4_,int(Math.random() * 2));
            _loc5_++;
         }
         §1t406s0§.instance.§1t6488s0§.§1t5826s0§();
         §1t406s0§.instance.§1t6488s0§.show();
      }
      
      override public function §1t6733s0§() : String
      {
         return §1t1521s0§.getString(190);
      }
      
      override public function §1t8518s0§(param1:MovieClip) : Boolean
      {
         if(!§1t8501s0§)
         {
            return false;
         }
         return abs(x - param1.x) < 100;
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         stop();
      }
   }
}

