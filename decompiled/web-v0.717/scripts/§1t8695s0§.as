package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3138")]
   public class §1t8695s0§ extends §1t397s0§
   {
      
      public var canvas:§1t5016s0§;
      
      internal var mcs:§1t75s0§;
      
      internal var lvl:int;
      
      internal var loottype:int = 0;
      
      public function §1t8695s0§(param1:String, param2:String = "")
      {
         var _loc6_:String = null;
         super();
         addFrameScript(0,this.frame1,47,this.frame48);
         this.props = param1;
         if(param2 == "")
         {
            objectName = "dragondanceloot";
         }
         else
         {
            objectName = param2;
         }
         var _loc3_:Array = param1.split(",");
         §1t5518s0§ = _loc3_[0];
         if(_loc3_.length >= 2)
         {
            this.lvl = _loc3_[1];
         }
         if(_loc3_.length >= 3)
         {
            this.loottype = _loc3_[2];
         }
         this.mcs = §1t1524s0§.§1t9883s0§(801);
         if(§1t5518s0§ == "")
         {
            §1t5518s0§ = this.generateSequence();
         }
         var _loc4_:Boolean = true;
         var _loc5_:int = int(§1t5518s0§.charAt(0));
         if(_loc5_ >= 8)
         {
            _loc5_ -= 8;
            _loc4_ = false;
         }
         if(_loc4_)
         {
            if(_loc5_ == 0)
            {
               _loc6_ = §1t1544s0§.§1t10389s0§;
            }
            else if(_loc5_ == 1)
            {
               _loc6_ = §1t1544s0§.§1t10397s0§;
            }
            else if(_loc5_ == 2)
            {
               _loc6_ = §1t1544s0§.§1t10391s0§;
            }
            else if(_loc5_ == 3)
            {
               _loc6_ = §1t1544s0§.§1t10393s0§;
            }
            else if(_loc5_ == 4)
            {
               _loc6_ = §1t1544s0§.§1t10385s0§;
            }
            else if(_loc5_ == 5)
            {
               _loc6_ = §1t1544s0§.§1t10395s0§;
            }
            else if(_loc5_ == 6)
            {
               _loc6_ = §1t1544s0§.§1t10383s0§;
            }
            else if(_loc5_ == 7)
            {
               _loc6_ = §1t1544s0§.§1t10387s0§;
            }
         }
         else if(_loc5_ == 0)
         {
            _loc6_ = §1t1544s0§.§1t10383s0§;
         }
         else if(_loc5_ == 1)
         {
            _loc6_ = §1t1544s0§.§1t10385s0§;
         }
         else if(_loc5_ == 2)
         {
            _loc6_ = §1t1544s0§.§1t10387s0§;
         }
         else if(_loc5_ == 3)
         {
            _loc6_ = §1t1544s0§.§1t10389s0§;
         }
         else if(_loc5_ == 4)
         {
            _loc6_ = §1t1544s0§.§1t10391s0§;
         }
         else if(_loc5_ == 5)
         {
            _loc6_ = §1t1544s0§.§1t10393s0§;
         }
         else if(_loc5_ == 6)
         {
            _loc6_ = §1t1544s0§.§1t10395s0§;
         }
         else if(_loc5_ == 7)
         {
            _loc6_ = §1t1544s0§.§1t10397s0§;
         }
         this.mcs.§1t1557s0§(_loc6_);
         this.mcs.§1t5493s0§();
         this.canvas.addChild(this.mcs);
         this.mcs.buttonMode = true;
         §1t8503s0§ = §1t407s0§.§1t12443s0§;
      }
      
      internal function generateSequence() : String
      {
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc1_:§1t58s0§ = §1t58s0§.§1t8804s0§(§1t1525s0§.§1t9935s0§() * (§1t1525s0§.§1t7341s0§() + 21));
         var _loc2_:int = §1t70s0§.instance.§1t1139s0§(§1t1525s0§.§1t9935s0§());
         var _loc3_:String = "";
         var _loc4_:Array = [0,1,2,3,4,5,6,7];
         var _loc6_:int = 0;
         if(_loc2_ < 30)
         {
            _loc6_ = 0;
         }
         else if(_loc2_ < 60)
         {
            if(_loc1_.rand(0) == 0)
            {
               _loc6_ = 1;
            }
            else
            {
               _loc6_ = 2;
            }
         }
         else
         {
            _loc6_ = 3;
         }
         if(_loc6_ == 0)
         {
            _loc7_ = 0;
            while(_loc7_ < 3)
            {
               _loc8_ = _loc1_.rand(_loc4_.length);
               _loc3_ += _loc4_[_loc8_].toString();
               _loc4_.splice(_loc8_,1);
               _loc7_++;
            }
         }
         else if(_loc6_ == 1)
         {
            _loc5_ = _loc1_.rand(5);
            if(_loc5_ == 0)
            {
               _loc3_ = "1246";
            }
            else if(_loc5_ == 1)
            {
               _loc3_ = "4216";
            }
            else if(_loc5_ == 2)
            {
               _loc3_ = "1642";
            }
            else if(_loc5_ == 3)
            {
               _loc3_ = "1426";
            }
            else if(_loc5_ == 4)
            {
               _loc3_ = "6241";
            }
            _loc3_ += _loc1_.rand(8);
         }
         else if(_loc6_ == 2)
         {
            _loc7_ = 0;
            while(_loc7_ < 4)
            {
               _loc8_ = _loc1_.rand(_loc4_.length);
               _loc3_ += _loc4_[_loc8_].toString();
               _loc4_.splice(_loc8_,1);
               _loc7_++;
            }
         }
         else
         {
            _loc5_ = _loc1_.rand(5);
            if(_loc5_ == 0)
            {
               _loc3_ = "1246";
            }
            else if(_loc5_ == 1)
            {
               _loc3_ = "4216";
            }
            else if(_loc5_ == 2)
            {
               _loc3_ = "1642";
            }
            else if(_loc5_ == 3)
            {
               _loc3_ = "1426";
            }
            else if(_loc5_ == 4)
            {
               _loc3_ = "6241";
            }
            _loc7_ = 0;
            while(_loc7_ < 2)
            {
               _loc8_ = _loc1_.rand(_loc4_.length);
               _loc3_ += _loc4_[_loc8_].toString();
               _loc4_.splice(_loc8_,1);
               _loc7_++;
            }
         }
         _loc1_.destroy();
         return _loc3_;
      }
      
      override public function validSequence() : *
      {
         var _loc1_:§1t85s0§ = null;
         gotoAndPlay(2);
         §1t1525s0§.§1t9927s0§(objectName);
         §1t406s0§.instance.§1t6440s0§.§1t6344s0§();
         §1t8501s0§ = false;
         if(§1t8502s0§ != null)
         {
            _loc1_ = §1t1524s0§.§1t9872s0§(§1t8502s0§.id,§1t8502s0§.§1t1103s0§);
            §1t6427s0§.§1t12475s0§(§1t8502s0§.id,§1t8502s0§.§1t1103s0§);
         }
         else if(this.loottype == 0)
         {
            this.giveGoodLoot();
         }
         else if(this.loottype == 1)
         {
            this.giveRest();
         }
         else
         {
            this.giveBuff();
         }
      }
      
      override public function invalidSequence() : *
      {
         §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(724),§1t1521s0§.getString(5));
      }
      
      override public function §1t6246s0§(param1:String) : *
      {
         this.mcs.§1t1557s0§(param1);
      }
      
      override public function interact() : *
      {
         if(!§1t1523s0§.§1t9606s0§(this.§1t8517s0§()))
         {
            §1t406s0§.instance.§1t6528s0§(§1t1521s0§.getString(100),§1t1521s0§.getString(5));
            return;
         }
         if(§1t1523s0§.§1t9714s0§(2211) != 0)
         {
            §1t5495s0§.instance.show(this);
         }
         else
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(101),§1t1521s0§.getString(5));
         }
      }
      
      override public function §1t8523s0§() : *
      {
         this.interact();
      }
      
      override public function §1t8517s0§() : int
      {
         return 2;
      }
      
      override public function §1t6733s0§() : String
      {
         if(§1t8502s0§ == null)
         {
            return §1t1521s0§.getString(751);
         }
         return §1t8502s0§.§1t1105s0§;
      }
      
      override public function §1t8518s0§(param1:MovieClip) : Boolean
      {
         return abs(x - param1.x) < 100;
      }
      
      override public function setQuestAction(param1:§1t107s0§) : *
      {
         §1t8502s0§ = param1;
         if(param1.§1t1103s0§ == 0)
         {
            this.mcs.§1t6289s0§(1);
         }
         else
         {
            this.mcs.§1t6289s0§(2);
         }
      }
      
      public function giveGoodLoot() : *
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         §1t88s0§.instance.§1t1513s0§();
         §1t406s0§.instance.§1t6488s0§.§1t6194s0§(this.lvl,true,true);
         §1t406s0§.instance.§1t6488s0§.§1t6194s0§(this.lvl,true,true);
         §1t406s0§.instance.§1t6488s0§.§1t6194s0§(this.lvl);
         §1t406s0§.instance.§1t6488s0§.§1t5846s0§(Math.random() * this.lvl + this.lvl * 5);
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
            _loc3_ = -Math.random() * 5 - 30;
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
      
      internal function giveRest() : *
      {
         §1t406s0§.instance.§1t6496s0§.§1t6848s0§(§1t6497s0§.§1t12434s0§);
      }
      
      internal function giveBuff() : *
      {
         §1t88s0§.instance.§1t1513s0§();
         §1t1523s0§.§1t9726s0§(§1t58s0§.random(8,§1t1525s0§.§1t9935s0§() * (§1t1525s0§.§1t7341s0§() + 21)),30 * 60);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame48() : *
      {
         stop();
      }
   }
}

