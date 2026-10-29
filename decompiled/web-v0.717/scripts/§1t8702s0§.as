package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3137")]
   public class §1t8702s0§ extends §1t397s0§
   {
      
      public var canvas:§1t5016s0§;
      
      internal var mcs:§1t75s0§;
      
      internal var revealed:Boolean = false;
      
      internal var roomid:int = 1;
      
      internal var xpos:int = 150;
      
      internal var nodeid:int = -1;
      
      internal var destName:String = "";
      
      public function §1t8702s0§(param1:String, param2:String = "")
      {
         var _loc6_:String = null;
         super();
         addFrameScript(0,this.frame1,47,this.frame48);
         this.props = param1;
         if(param2 == "")
         {
            objectName = "dragondancepath";
         }
         else
         {
            objectName = param2;
         }
         var _loc3_:Array = param1.split(",");
         §1t5518s0§ = _loc3_[0];
         if(_loc3_.length >= 2)
         {
            this.roomid = _loc3_[1];
         }
         if(_loc3_.length >= 3)
         {
            this.xpos = _loc3_[2];
         }
         if(_loc3_.length >= 4)
         {
            this.nodeid = _loc3_[3];
         }
         if(_loc3_.length >= 5)
         {
            this.revealed = true;
         }
         this.destName = §1t1525s0§.§1t1382s0§(this.roomid,this.nodeid);
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
         if(!this.revealed)
         {
            §1t8503s0§ = §1t407s0§.§1t12443s0§;
         }
         else
         {
            gotoAndStop("revealed");
            §1t8503s0§ = §1t407s0§.§1t12439s0§;
         }
      }
      
      internal function generateSequence() : String
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc1_:§1t58s0§ = §1t58s0§.§1t8804s0§(§1t1525s0§.§1t9935s0§() * §1t1525s0§.§1t7341s0§() + 21);
         var _loc2_:int = §1t70s0§.instance.§1t1139s0§(§1t1525s0§.§1t9935s0§());
         var _loc3_:String = "";
         var _loc4_:Array = [0,1,2,3,4,5,6,7];
         if(_loc2_ < 20)
         {
            _loc6_ = 0;
            while(_loc6_ < 3)
            {
               _loc7_ = _loc1_.rand(_loc4_.length);
               _loc3_ += _loc4_[_loc7_].toString();
               _loc4_.splice(_loc7_,1);
               _loc6_++;
            }
         }
         else if(_loc2_ < 60)
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
            _loc6_ = 0;
            while(_loc6_ < 2)
            {
               _loc7_ = _loc1_.rand(_loc4_.length);
               _loc3_ += _loc4_[_loc7_].toString();
               _loc4_.splice(_loc7_,1);
               _loc6_++;
            }
         }
         _loc1_.destroy();
         return _loc3_;
      }
      
      override public function validSequence() : *
      {
         var _loc1_:§1t85s0§ = null;
         §1t88s0§.instance.§1t1513s0§();
         gotoAndPlay(2);
         this.revealed = true;
         §1t8503s0§ = §1t407s0§.§1t12439s0§;
         §1t1525s0§.§1t9927s0§(objectName);
         if(§1t8502s0§ != null)
         {
            _loc1_ = §1t1524s0§.§1t9872s0§(§1t8502s0§.id,§1t8502s0§.§1t1103s0§);
            §1t6427s0§.§1t12475s0§(§1t8502s0§.id,§1t8502s0§.§1t1103s0§);
         }
         else
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(755),§1t1521s0§.getString(5));
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
         if(!this.revealed)
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
         else
         {
            if(!§1t1540s0§.§1t10047s0§() && §1t1523s0§.§1t9595s0§() > §1t1523s0§.§1t9603s0§())
            {
               §1t406s0§.instance.§1t6534s0§(§1t1521s0§.getString(138),§1t1521s0§.getString(5));
               return;
            }
            if(!§1t1523s0§.§1t9606s0§(1))
            {
               §1t406s0§.instance.§1t6528s0§(§1t1521s0§.getString(100),§1t1521s0§.getString(5));
               return;
            }
            §1t1525s0§.§1t9922s0§(this.roomid,this.xpos,this.nodeid);
         }
      }
      
      override public function needTransition() : Boolean
      {
         if(!this.revealed)
         {
            return false;
         }
         if(!§1t1540s0§.§1t10047s0§() && §1t1523s0§.§1t9595s0§() > §1t1523s0§.§1t9603s0§() || §1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9414s0§) <= 0)
         {
            return false;
         }
         return true;
      }
      
      override public function §1t8523s0§() : *
      {
         if(this.needTransition())
         {
            §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6851s0§(this);
            §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6848s0§(§1t6497s0§.§1t12442s0§);
         }
         else
         {
            this.interact();
         }
      }
      
      override public function §1t8517s0§() : int
      {
         if(!this.revealed)
         {
            return 2;
         }
         return 1;
      }
      
      override public function §1t6733s0§() : String
      {
         if(!this.revealed)
         {
            if(§1t8502s0§ == null)
            {
               return §1t1521s0§.getString(751);
            }
            return §1t8502s0§.§1t1105s0§;
         }
         return this.destName;
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

