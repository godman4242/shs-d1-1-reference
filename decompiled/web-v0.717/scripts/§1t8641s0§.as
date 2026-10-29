package
{
   import flash.display.MovieClip;
   
   public class §1t8641s0§ extends §1t399s0§
   {
      
      internal var npc:§1t68s0§;
      
      internal var npcname:String;
      
      internal var npcid:int;
      
      public function §1t8641s0§(param1:int, param2:int, param3:String, param4:String = "")
      {
         super();
         if(param3 == "")
         {
            param3 = "1";
         }
         this.props = param3;
         this.npcid = int(param3);
         this.npc = §1t1543s0§.§1t10208s0§(this.npcid,param1,param2);
         this.npcname = §1t1524s0§.§1t1582s0§(this.npcid);
         if(param4 == "")
         {
            objectName = this.npcname;
         }
         else
         {
            objectName = param4;
         }
         this.npc.mcs.§1t6280s0§();
         this.npc.mcs.§1t6287s0§("");
         visible = false;
      }
      
      override public function setQuestAction(param1:§1t107s0§) : *
      {
         §1t8502s0§ = param1;
         this.npc.§1t1559s0§().buttonMode = true;
         if(param1.§1t1103s0§ == 0 && param1.type != 4)
         {
            this.npc.§1t1559s0§().§1t6289s0§(1);
         }
         else
         {
            this.npc.§1t1559s0§().§1t6289s0§(2);
         }
         this.npc.mcs.§1t6287s0§(this.npcname);
      }
      
      override public function §1t8523s0§() : *
      {
         var _loc2_:§1t60s0§ = null;
         var _loc3_:§1t69s0§ = null;
         if(§1t8502s0§ == null)
         {
            return;
         }
         if(§1t8502s0§.id == §1t123s0§.§1t11212s0§)
         {
            _loc2_ = §1t8502s0§.§1t1112s0§;
            _loc3_ = §1t123s0§.instance.§1t1604s0§(_loc2_.nodeid,_loc2_.roomid,_loc2_.§1t802s0§,_loc2_.date,_loc2_.§1t807s0§,_loc2_.§1t808s0§,_loc2_.§1t810s0§,_loc2_.§1t809s0§);
            §1t1524s0§.§1t9877s0§(this.npcid,this.npc.§1t1559s0§().§1t1251s0§());
            §1t1524s0§.§1t9878s0§(18,this.npc.§1t1559s0§().§1t1251s0§(),§1t70s0§.instance.§1t1139s0§(§1t1525s0§.§1t9935s0§()),§1t123s0§.instance.§1t1582s0§(_loc2_.nodeid,_loc2_.roomid,_loc2_.§1t802s0§,_loc2_.date,true));
            §1t1524s0§.§1t9873s0§(_loc3_);
         }
         var _loc1_:§1t85s0§ = §1t1524s0§.§1t9872s0§(§1t8502s0§.id,§1t8502s0§.§1t1103s0§);
         if(§1t1523s0§.§1t640s0§(_loc1_.condition))
         {
            if(§1t1523s0§.§1t9606s0§(_loc1_.ap))
            {
               §1t1524s0§.§1t9877s0§(this.npcid,this.npc.§1t1559s0§().§1t1251s0§());
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
      
      override public function interact() : *
      {
      }
      
      override public function showInteractButton(param1:Boolean) : *
      {
         if(param1 && !shown && §1t8501s0§)
         {
            if(§1t8502s0§ != null)
            {
               §1t406s0§.instance.§1t6574s0§().§1t6390s0§(this,§1t8502s0§.title,§1t8502s0§.§1t1105s0§,§1t8502s0§.type,§1t8502s0§.id,§1t8502s0§.§1t1103s0§,§1t8502s0§.ap);
            }
            else
            {
               §1t406s0§.instance.§1t6574s0§().§1t6388s0§(this,§1t407s0§.§1t12445s0§);
            }
            shown = true;
            this.npc.§1t3269s0§(§1t1544s0§.§1t11141s0§);
            if(§1t1523s0§.§1t9586s0§().mcs.x < this.npc.mcs.x)
            {
               this.npc.mcs.§1t5492s0§();
            }
            else
            {
               this.npc.mcs.§1t5493s0§();
            }
         }
         else if(!param1 && shown)
         {
            shown = false;
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
         return abs(this.npc.mcs.x - param1.x) < 100;
      }
      
      override public function §1t1552s0§(param1:MovieClip) : *
      {
         §1t1543s0§.§1t10212s0§(this.npc);
      }
      
      override public function §1t8513s0§() : MovieClip
      {
         return this.npc.§1t1559s0§();
      }
      
      override public function §1t5853s0§() : *
      {
         if(§1t8502s0§ != null)
         {
            this.npc.§1t3269s0§(§1t1544s0§.§1t11141s0§);
         }
      }
      
      override public function §1t8162s0§(param1:§1t107s0§) : *
      {
         this.npc.§1t1559s0§().§1t6289s0§(2);
      }
      
      override public function §1t2289s0§(param1:int) : *
      {
      }
   }
}

