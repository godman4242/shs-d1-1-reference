package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3242")]
   public class §1t8583s0§ extends §1t399s0§
   {
      
      public function §1t8583s0§(param1:String, param2:String = "")
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2);
         this.props = param1;
         if(param2 == "")
         {
            objectName = "Chest";
         }
         else
         {
            objectName = param2;
         }
         var _loc3_:XMLList = XMLList(param1);
         if(§1t1523s0§.§1t9722s0§(_loc3_.condition,1))
         {
            gotoAndStop(2);
            §1t8501s0§ = false;
         }
         §1t8503s0§ = §1t407s0§.§1t12444s0§;
      }
      
      override public function interact() : *
      {
         var _loc3_:§1t63s0§ = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc13_:int = 0;
         gotoAndStop(2);
         §1t8501s0§ = false;
         var _loc1_:XMLList = XMLList(props);
         §1t1523s0§.§1t9712s0§(_loc1_.condition,1);
         §1t3317s0§.instance.§1t1946s0§();
         var _loc2_:§1t77s0§ = new §1t77s0§(_loc1_.reward);
         var _loc10_:int = §1t1523s0§.getLevel();
         var _loc11_:int = int(_loc2_.loot.length);
         var _loc12_:int = 0;
         while(_loc12_ < _loc11_)
         {
            _loc3_ = _loc2_.loot[_loc12_];
            _loc5_ = _loc3_.§1t760s0§();
            _loc6_ = _loc3_.getQty();
            _loc4_ = _loc3_.chance * 100;
            if(_loc4_ == 100 || Math.random() * 100 < _loc4_)
            {
               _loc13_ = 0;
               while(_loc13_ < _loc6_)
               {
                  _loc7_ = Math.random() * 16 - 8;
                  if(x < 100 && _loc7_ < 0)
                  {
                     _loc7_ *= -1;
                  }
                  else if(x > §1t1525s0§.§1t8124s0§() - 100 && _loc7_ > 0)
                  {
                     _loc7_ *= -1;
                  }
                  _loc9_ = 20;
                  if(_loc7_ < 0)
                  {
                     _loc9_ = -20;
                  }
                  if(_loc5_ == 0)
                  {
                     _loc8_ = -Math.random() * 10 - 20;
                  }
                  else
                  {
                     _loc8_ = -Math.random() * 10 - 25;
                  }
                  §1t1712s0§.§1t11326s0§(x,y - 50,_loc7_,_loc8_,_loc9_,_loc5_);
                  _loc13_++;
               }
               if(_loc5_ == 0)
               {
                  §1t406s0§.instance.§1t6488s0§.§1t5846s0§(1 * _loc6_);
               }
               else if(_loc5_ == 1)
               {
                  §1t406s0§.instance.§1t6488s0§.§1t5846s0§(5 * _loc6_);
               }
               else
               {
                  §1t406s0§.instance.§1t6488s0§.§1t5845s0§(_loc5_,_loc10_,_loc6_);
               }
            }
            _loc12_++;
         }
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

