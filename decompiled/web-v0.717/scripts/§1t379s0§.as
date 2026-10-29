package
{
   import flash.display.MovieClip;
   
   public class §1t379s0§ extends §1t399s0§
   {
      
      internal var npc:§1t121s0§;
      
      internal var npcname:String;
      
      internal var npcid:int;
      
      public function §1t379s0§(param1:int, param2:int, param3:String, param4:String = "")
      {
         super();
         if(param3 == "")
         {
            param3 = "1";
         }
         this.props = param3;
         var _loc5_:Array = param3.split(",");
         this.npcid = int(_loc5_[0]);
         this.npc = §1t1543s0§.§1t10211s0§(this.npcid,param1,param2);
         this.npc.§1t4517s0§(this);
         this.npc.§1t3269s0§(§1t1544s0§.§1t11150s0§);
         if(_loc5_.length < 2)
         {
            this.npc.mcs.§1t1557s0§(§1t1544s0§.§1t10267s0§);
         }
         else
         {
            this.npc.mcs.§1t1557s0§(_loc5_[1]);
         }
         if(_loc5_.length >= 3 && _loc5_[2] == "1")
         {
            this.npc.mcs.§1t5493s0§();
         }
         else
         {
            this.npc.mcs.§1t5492s0§();
         }
         if(_loc5_.length >= 4 && _loc5_[3] != "-1")
         {
            this.npc.mcs.§1t6246s0§(_loc5_[1],_loc5_[3]);
         }
         if(_loc5_.length >= 6)
         {
            this.§1t4511s0§(_loc5_[4],_loc5_[5]);
         }
         this.npcname = §1t1524s0§.§1t1582s0§(this.npcid);
         if(param4 == "")
         {
            objectName = this.npcname;
         }
         else
         {
            objectName = param4;
         }
         this.npc.mcs.buttonMode = false;
         this.npc.mcs.§1t6280s0§();
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
               §1t1524s0§.§1t9877s0§(this.npcid,this.npc.mcs.§1t1251s0§());
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
         this.npc.mcs.buttonMode = true;
         if(param1.§1t1103s0§ == 0)
         {
            this.npc.mcs.§1t6289s0§(1);
         }
         else
         {
            this.npc.mcs.§1t6289s0§(2);
         }
         this.npc.mcs.§1t6287s0§(this.npcname);
      }
      
      public function §1t4511s0§(param1:String, param2:String) : *
      {
         if(this.npc != null)
         {
            this.npc.§1t4511s0§(param1,param2);
         }
      }
      
      public function destroy() : *
      {
         this.npc = null;
         §1t1525s0§.§1t9940s0§().§1t8138s0§(objectName);
      }
      
      override public function §1t8513s0§() : MovieClip
      {
         return this.npc.§1t1559s0§();
      }
   }
}

