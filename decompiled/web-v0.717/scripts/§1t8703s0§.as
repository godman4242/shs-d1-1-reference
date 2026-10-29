package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3133")]
   public class §1t8703s0§ extends §1t397s0§
   {
      
      public var canvas:§1t5016s0§;
      
      public var word:MovieClip;
      
      internal var mcs:§1t75s0§;
      
      internal var num:int;
      
      internal var §1t5519s0§:Boolean = true;
      
      internal var §1t1700s0§:Boolean = false;
      
      public function §1t8703s0§(param1:String, param2:String = "")
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         super();
         this.props = param1;
         if(param2 == "")
         {
            objectName = "statue";
         }
         else
         {
            objectName = param2;
         }
         this.mcs = §1t1524s0§.§1t9883s0§(801);
         this.num = int(param1);
         if(this.num >= 8)
         {
            this.num -= 8;
            this.§1t5519s0§ = false;
            _loc4_ = §1t58s0§.random(5,§1t1525s0§.§1t9935s0§());
            if(_loc4_ == 0)
            {
               §1t5518s0§ = "1246" + this.num;
            }
            else if(_loc4_ == 1)
            {
               §1t5518s0§ = "4216" + this.num;
            }
            else if(_loc4_ == 2)
            {
               §1t5518s0§ = "1642" + this.num;
            }
            else if(_loc4_ == 3)
            {
               §1t5518s0§ = "1426" + this.num;
            }
            else if(_loc4_ == 4)
            {
               §1t5518s0§ = "6241" + this.num;
            }
         }
         else
         {
            §1t5518s0§ = param1;
         }
         if(this.§1t5519s0§)
         {
            if(this.num == 0)
            {
               _loc3_ = §1t1544s0§.§1t10389s0§;
            }
            else if(this.num == 1)
            {
               _loc3_ = §1t1544s0§.§1t10397s0§;
            }
            else if(this.num == 2)
            {
               _loc3_ = §1t1544s0§.§1t10391s0§;
            }
            else if(this.num == 3)
            {
               _loc3_ = §1t1544s0§.§1t10393s0§;
            }
            else if(this.num == 4)
            {
               _loc3_ = §1t1544s0§.§1t10385s0§;
            }
            else if(this.num == 5)
            {
               _loc3_ = §1t1544s0§.§1t10395s0§;
            }
            else if(this.num == 6)
            {
               _loc3_ = §1t1544s0§.§1t10383s0§;
            }
            else if(this.num == 7)
            {
               _loc3_ = §1t1544s0§.§1t10387s0§;
            }
            if(§1t1523s0§.§1t9714s0§(40002 + int(param1)) == 0)
            {
               this.word.gotoAndStop(1 + this.num);
            }
            else
            {
               this.word.gotoAndStop(41 + this.num);
            }
         }
         else
         {
            if(this.num == 0)
            {
               _loc3_ = §1t1544s0§.§1t10383s0§;
            }
            else if(this.num == 1)
            {
               _loc3_ = §1t1544s0§.§1t10385s0§;
            }
            else if(this.num == 2)
            {
               _loc3_ = §1t1544s0§.§1t10387s0§;
            }
            else if(this.num == 3)
            {
               _loc3_ = §1t1544s0§.§1t10389s0§;
            }
            else if(this.num == 4)
            {
               _loc3_ = §1t1544s0§.§1t10391s0§;
            }
            else if(this.num == 5)
            {
               _loc3_ = §1t1544s0§.§1t10393s0§;
            }
            else if(this.num == 6)
            {
               _loc3_ = §1t1544s0§.§1t10395s0§;
            }
            else if(this.num == 7)
            {
               _loc3_ = §1t1544s0§.§1t10397s0§;
            }
            if(§1t1523s0§.§1t9714s0§(40002 + int(param1)) == 0)
            {
               this.word.gotoAndStop(11 + this.num);
            }
            else
            {
               this.word.gotoAndStop(51 + this.num);
            }
         }
         this.mcs.§1t1557s0§(_loc3_);
         this.mcs.§1t5493s0§();
         this.canvas.addChild(this.mcs);
         if(param2 == "")
         {
            objectName = "statue";
         }
         this.mcs.buttonMode = true;
         §1t8503s0§ = §1t407s0§.§1t12443s0§;
      }
      
      override public function nodeTaught() : int
      {
         return int(props);
      }
      
      override public function validSequence() : *
      {
         var _loc1_:§1t85s0§ = null;
         if(§1t1523s0§.§1t9714s0§(40002 + int(props)) == 0)
         {
            §1t88s0§.instance.§1t1513s0§();
            if(this.§1t5519s0§)
            {
               this.word.gotoAndStop(1 + this.num);
            }
            else
            {
               this.word.gotoAndStop(21 + this.num);
            }
            §1t1523s0§.§1t9712s0§(40002 + int(props),1);
            if(§1t8502s0§ == null)
            {
               §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(750),§1t1521s0§.getString(5));
            }
         }
         else if(§1t8502s0§ == null)
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(724),§1t1521s0§.getString(5));
         }
         if(§1t8502s0§ != null)
         {
            _loc1_ = §1t1524s0§.§1t9872s0§(§1t8502s0§.id,§1t8502s0§.§1t1103s0§);
            §1t6427s0§.§1t12475s0§(§1t8502s0§.id,§1t8502s0§.§1t1103s0§);
         }
      }
      
      override public function invalidSequence() : *
      {
         §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(724),§1t1521s0§.getString(5));
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
   }
}

