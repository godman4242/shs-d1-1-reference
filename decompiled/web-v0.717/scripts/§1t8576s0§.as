package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol3259")]
   public class §1t8576s0§ extends §1t399s0§
   {
      
      internal var lvl:int;
      
      public function §1t8576s0§(param1:String)
      {
         super();
         scaleX = Math.random() * 0.3 + 0.8;
         scaleY = Math.random() * 0.3 + 0.8;
         if(int(Math.random() * 2) == 0)
         {
            scaleX = -scaleX;
         }
         var _loc2_:Array = param1.split(",");
         if(_loc2_.length == 0 || _loc2_[0] == "")
         {
            gotoAndStop(1);
         }
         else
         {
            gotoAndStop(_loc2_[0]);
         }
         if(_loc2_.length > 1)
         {
            this.lvl = _loc2_[1];
         }
         §1t8503s0§ = §1t407s0§.§1t12444s0§;
      }
      
      override public function interact() : *
      {
         §1t406s0§.§1t9190s0§().§1t6574s0§().§1t6395s0§(this);
      }
      
      override public function interact2() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         §1t1523s0§.§1t1684s0§(60007,1);
         if(§1t1523s0§.§1t9514s0§ == §1t1523s0§.§1t9466s0§ && §1t3317s0§.instance.§1t1847s0§() < §1t1523s0§.§1t9515s0§ && §1t58s0§.random(3,(§1t1525s0§.§1t9935s0§() + §1t1525s0§.§1t7341s0§()) * 2) == 0 && int(Math.random() * 15) <= §1t1523s0§.§1t9714s0§(1021))
         {
            §1t406s0§.instance.§1t6488s0§.§1t6186s0§(2183 + int(Math.random() * 5),1);
            §1t1523s0§.§1t9713s0§(50004,1);
            §1t406s0§.instance.§1t6488s0§.§1t5826s0§();
            §1t406s0§.instance.§1t6488s0§.show();
            §1t406s0§.instance.§1t6489s0§.show();
         }
         else if(int(Math.random() * 11) <= §1t1523s0§.§1t9714s0§(1021))
         {
            §1t406s0§.instance.§1t6488s0§.§1t6194s0§(this.lvl,false,true);
            _loc1_ = §1t406s0§.instance.§1t6488s0§.§1t6207s0§();
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
               _loc3_ = -Math.random() * 10 - 25;
               §1t1712s0§.§1t11326s0§(x,y - 50,_loc2_,_loc3_,_loc4_,2);
               _loc5_++;
            }
            §1t406s0§.instance.§1t6488s0§.§1t5826s0§();
            §1t406s0§.instance.§1t6488s0§.show();
         }
         else
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(101),§1t1521s0§.getString(5));
         }
         §1t8501s0§ = false;
      }
      
      override public function §1t6733s0§() : String
      {
         if(currentFrame <= 3)
         {
            return §1t1521s0§.getString(186);
         }
         if(currentFrame <= 6)
         {
            return §1t1521s0§.getString(425);
         }
         return §1t1521s0§.getString(426);
      }
      
      override public function §1t8517s0§() : int
      {
         return 2;
      }
   }
}

