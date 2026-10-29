package
{
   import flash.display.MovieClip;
   
   public class §1t8630s0§ extends §1t399s0§
   {
      
      internal var mcs:§1t75s0§;
      
      internal var npcname:String;
      
      internal var npcid:int;
      
      public function §1t8630s0§(param1:String, param2:String = "")
      {
         var _loc4_:§1t5038s0§ = null;
         super();
         if(param1 == "")
         {
            param1 = "1";
         }
         this.props = param1;
         var _loc3_:Array = param1.split(",");
         this.npcid = int(_loc3_[0]);
         this.mcs = §1t1524s0§.§1t9883s0§(this.npcid);
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
         if(_loc3_.length >= 4)
         {
            this.mcs.§1t6246s0§(_loc3_[1],_loc3_[3]);
         }
         if(_loc3_.length >= 5)
         {
            _loc4_ = new §1t5038s0§();
            addChild(_loc4_);
            _loc4_.arrow.arrowtext.text = "";
            _loc4_.x = 0;
            _loc4_.y = -170;
         }
         addChild(this.mcs);
         this.npcname = §1t1524s0§.§1t1582s0§(this.npcid);
         if(param2 == "")
         {
            objectName = this.npcname;
         }
         else
         {
            objectName = param2;
         }
         this.mcs.buttonMode = false;
      }
      
      override public function interact() : *
      {
      }
      
      override public function §1t8523s0§() : *
      {
         if(§1t8502s0§ == null)
         {
            return;
         }
         var _loc1_:§1t85s0§ = §1t1524s0§.§1t9872s0§(§1t8502s0§.id,§1t8502s0§.§1t1103s0§);
         if(§1t1523s0§.§1t640s0§(_loc1_.condition))
         {
            if(§1t1523s0§.§1t9606s0§(_loc1_.ap))
            {
               §1t1524s0§.§1t9877s0§(this.npcid,this.mcs.§1t1251s0§());
               §1t6427s0§.§1t12475s0§(§1t8502s0§.id,§1t8502s0§.§1t1103s0§);
            }
            else
            {
               §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(100),§1t1521s0§.getString(5));
            }
         }
         else
         {
            §1t406s0§.instance.§1t6527s0§(_loc1_.failtext,§1t1521s0§.getString(5));
         }
      }
      
      override public function §1t6733s0§() : String
      {
         if(§1t8502s0§ == null)
         {
            return "";
         }
         return §1t8502s0§.§1t1105s0§;
      }
      
      override public function §1t8518s0§(param1:MovieClip) : Boolean
      {
         if(§1t8502s0§ == null)
         {
            return false;
         }
         return abs(x - param1.x) < 100;
      }
      
      override public function setQuestAction(param1:§1t107s0§) : *
      {
         §1t8502s0§ = param1;
         this.mcs.buttonMode = true;
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

