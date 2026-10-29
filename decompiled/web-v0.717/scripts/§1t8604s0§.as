package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol3067")]
   public class §1t8604s0§ extends §1t399s0§
   {
      
      internal var roomid:int = 1;
      
      internal var xpos:int = 150;
      
      internal var nodeid:int = -1;
      
      internal var destName:String;
      
      internal var revealed:Boolean = false;
      
      public function §1t8604s0§(param1:String, param2:String = "")
      {
         super();
         addFrameScript(0,this.frame1);
         if(param2 == "")
         {
            objectName = "PathBush";
         }
         else
         {
            objectName = param2;
         }
         scaleX = Math.random() * 0.3 + 0.8;
         scaleY = Math.random() * 0.3 + 0.8;
         if(int(Math.random() * 2) == 0)
         {
            scaleX = -scaleX;
         }
         var _loc3_:Array = param1.split(",");
         if(_loc3_.length >= 1)
         {
            this.roomid = _loc3_[0];
         }
         if(_loc3_.length >= 2)
         {
            this.xpos = _loc3_[1];
         }
         if(_loc3_.length >= 3)
         {
            this.nodeid = _loc3_[2];
         }
         this.destName = §1t1525s0§.§1t1382s0§(this.roomid,this.nodeid);
         §1t8503s0§ = §1t407s0§.§1t12444s0§;
         if(§1t1523s0§.§1t9714s0§(1021) == 5)
         {
            gotoAndStop(2);
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
      
      override public function showInteractButton(param1:Boolean) : *
      {
         if(param1 && !shown && §1t8501s0§)
         {
            if(§1t8502s0§ != null)
            {
               §1t406s0§.instance.§1t6574s0§().§1t6390s0§(this,§1t8502s0§.title,§1t8502s0§.§1t1105s0§,§1t8502s0§.type,§1t8502s0§.id,§1t8502s0§.§1t1103s0§,§1t8502s0§.ap,true);
            }
            else
            {
               §1t406s0§.instance.§1t6574s0§().§1t6388s0§(this,§1t8503s0§);
            }
            shown = true;
         }
         else if(!param1 && shown)
         {
            shown = false;
         }
      }
      
      override public function interact() : *
      {
         if(!this.revealed)
         {
            §1t406s0§.§1t9190s0§().§1t6574s0§().§1t6395s0§(this);
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
      
      override public function interact2() : *
      {
         var _loc1_:§1t85s0§ = null;
         gotoAndStop(3);
         §1t8503s0§ = §1t407s0§.§1t12439s0§;
         this.revealed = true;
         §1t1541s0§.§1t10045s0§();
         scaleX = 1;
         scaleY = 1;
         §1t88s0§.instance.§1t1513s0§();
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
      
      override public function §1t6733s0§() : String
      {
         if(!this.revealed)
         {
            return §1t1521s0§.getString(186);
         }
         return this.destName;
      }
      
      override public function §1t8517s0§() : int
      {
         if(!this.revealed)
         {
            return 2;
         }
         return 1;
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

