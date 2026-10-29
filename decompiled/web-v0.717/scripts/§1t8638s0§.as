package
{
   import flash.display.MovieClip;
   
   public class §1t8638s0§ extends §1t399s0§
   {
      
      internal var npc:§1t68s0§;
      
      internal var npcname:String;
      
      internal var waveXML:XMLList;
      
      internal var npcid:int;
      
      internal var doDuel:Boolean = false;
      
      internal var lvl:int = 0;
      
      public function §1t8638s0§(param1:int, param2:int, param3:String, param4:String = "")
      {
         var _loc5_:Array = null;
         var _loc9_:§1t76s0§ = null;
         var _loc10_:§1t4518s0§ = null;
         super();
         if(param3 == "")
         {
            param3 = "1";
         }
         param3 = param3.split("<property>").join("");
         param3 = param3.split("</property>").join("");
         _loc5_ = param3.split(",");
         var _loc6_:String = _loc5_[0];
         if(_loc5_.length >= 2)
         {
            this.lvl = _loc5_[1];
         }
         if(_loc5_.length >= 3)
         {
            this.waveXML = new XMLList(_loc5_[2]);
         }
         var _loc7_:Array = _loc6_.split("|");
         if(_loc7_.length > 1)
         {
            this.npcid = _loc7_[int(Math.random() * _loc7_.length)];
         }
         else
         {
            this.npcid = int(_loc7_);
         }
         if(this.npcid == §1t76s0§.§1t9200s0§)
         {
            _loc9_ = §1t123s0§.instance.§1t1583s0§(§1t1525s0§.§1t9935s0§(),§1t1525s0§.§1t7341s0§(),§1t3317s0§.instance.§1t1848s0§());
            _loc9_.lvl = this.lvl;
            _loc9_.id = §1t76s0§.§1t9200s0§;
            §1t1524s0§.§1t9876s0§(_loc9_);
         }
         var _loc8_:Boolean = false;
         if(_loc5_.length >= 4 && _loc5_[3] != null && this.trim(_loc5_[3]) == "2")
         {
            _loc8_ = true;
         }
         this.npc = §1t1543s0§.§1t10208s0§(this.npcid,param1,param2,_loc8_);
         if(!_loc8_ && this.npc is §1t4518s0§)
         {
            _loc10_ = §1t4518s0§(this.npc);
            _loc10_.aggro = true;
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
         this.npc.mcs.§1t6280s0§();
         if(this.lvl == 0)
         {
            this.npc.mcs.§1t6287s0§(this.npcname,10027008);
         }
         else
         {
            this.npc.mcs.§1t6287s0§(this.npcname + " (" + this.lvl + ")",10027008);
         }
         visible = false;
         if(_loc5_.length >= 4 && _loc5_[3] != null && this.trim(_loc5_[3]) == "1")
         {
            this.npc.§1t1557s0§(§1t1544s0§.§1t10267s0§);
            this.npc.§1t3269s0§(§1t1544s0§.§1t11154s0§);
            if(_loc5_.length >= 6 && this.trim(_loc5_[5]) == "1")
            {
               this.npc.§1t1559s0§().§1t5493s0§();
            }
            else
            {
               this.npc.§1t1559s0§().§1t5492s0§();
            }
            if(_loc5_.length >= 5 && _loc5_[4] != "0")
            {
               this.npc.§1t1557s0§(this.trim(_loc5_[4]));
            }
            else
            {
               this.npc.§1t1557s0§(§1t1544s0§.§1t10267s0§);
            }
         }
         if(_loc5_.length >= 7 && this.trim(_loc5_[6]) == "1")
         {
            this.doDuel = true;
         }
         this.npc.§1t1559s0§().buttonMode = true;
      }
      
      internal function trim(param1:String) : String
      {
         return param1.replace(/^[\s|\t|\n]+|[\s|\t|\n]+$/gs,"");
      }
      
      override public function §1t8523s0§() : *
      {
      }
      
      override public function interact() : *
      {
         var _loc1_:§1t60s0§ = null;
         var _loc2_:§1t69s0§ = null;
         var _loc3_:int = 0;
         var _loc4_:* = undefined;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         §1t1524s0§.§1t9877s0§(this.npcid,this.npc.§1t1559s0§().§1t1251s0§(),this.lvl);
         if(§1t8502s0§ != null)
         {
            if(§1t8502s0§.id == §1t123s0§.§1t11212s0§)
            {
               _loc1_ = §1t8502s0§.§1t1112s0§;
               _loc2_ = §1t123s0§.instance.§1t1604s0§(_loc1_.nodeid,_loc1_.roomid,_loc1_.§1t802s0§,_loc1_.date,_loc1_.§1t807s0§,_loc1_.§1t808s0§,_loc1_.§1t810s0§,_loc1_.§1t809s0§);
               §1t1524s0§.§1t9877s0§(this.npcid,this.npc.§1t1559s0§().§1t1251s0§(),this.lvl);
               §1t1524s0§.§1t9873s0§(_loc2_);
            }
            if(§1t8502s0§.action == 6)
            {
               §1t1524s0§.§1t9878s0§(this.npcid,this.npc.§1t1559s0§().§1t1251s0§(),this.lvl);
            }
            §1t6427s0§.§1t12475s0§(§1t8502s0§.id,§1t8502s0§.§1t1103s0§);
         }
         else
         {
            §1t6427s0§.§1t12474s0§(-1);
            _loc3_ = int(this.waveXML.wave.length());
            _loc4_ = new Vector.<§1t116s0§>();
            _loc5_ = 0;
            while(_loc5_ < _loc3_)
            {
               _loc4_.push(new §1t116s0§(this.waveXML.wave[_loc5_]));
               _loc5_++;
            }
            if(this.doDuel)
            {
               §1t1524s0§.§1t9878s0§(this.npcid,this.npc.§1t1559s0§().§1t1251s0§(),this.lvl);
               _loc6_ = Math.random() * 8;
               if(_loc6_ == 0)
               {
                  _loc7_ = §1t1521s0§.getString(472);
               }
               else if(_loc6_ == 1)
               {
                  _loc7_ = §1t1521s0§.getString(473);
               }
               else if(_loc6_ == 2)
               {
                  _loc7_ = §1t1521s0§.getString(474);
               }
               else if(_loc6_ == 3)
               {
                  _loc7_ = §1t1521s0§.getString(475);
               }
               else if(_loc6_ == 4)
               {
                  _loc7_ = §1t1521s0§.getString(476);
               }
               else if(_loc6_ == 5)
               {
                  _loc7_ = §1t1521s0§.getString(477);
               }
               else if(_loc6_ == 6)
               {
                  _loc7_ = §1t1521s0§.getString(478);
               }
               else if(_loc6_ == 7)
               {
                  _loc7_ = §1t1521s0§.getString(479);
               }
               §1t5565s0§.instance.§1t5609s0§(_loc7_);
               §1t1540s0§.§1t10052s0§(-2,6,§1t1525s0§.§1t9900s0§,§1t1525s0§.§1t9940s0§().§1t8124s0§(),0,_loc4_,150);
            }
            else
            {
               §1t1540s0§.§1t10052s0§(-1,1,§1t1525s0§.§1t9900s0§,§1t1525s0§.§1t9940s0§().§1t8124s0§(),0,_loc4_,400);
            }
         }
         §1t1525s0§.§1t9927s0§(objectName);
         §1t1523s0§.§1t9608s0§(-2);
      }
      
      override public function showInteractButton(param1:Boolean) : *
      {
         var _loc2_:§1t6497s0§ = §1t406s0§.§1t9190s0§().§1t6496s0§;
         if(_loc2_.§1t6853s0§() || §1t407s0§.instance.§1t6377s0§ || §1t1523s0§.§1t9479s0§ != §1t251s0§.§1t12136s0§ || §1t126s0§.instance != null && §1t126s0§.instance.showing || §1t406s0§.instance.§1t6498s0§.visible)
         {
            return;
         }
         if(param1 && !shown && §1t8501s0§)
         {
            shown = true;
            this.npc.§1t3269s0§(§1t1544s0§.§1t11154s0§);
            §1t1523s0§.§1t9586s0§().§1t4453s0§();
            §1t406s0§.instance.§1t6535s0§();
            if(§1t8502s0§ != null && §1t8502s0§.action == 0)
            {
               this.interact();
            }
            else
            {
               §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(196,[this.npcname]),§1t1521s0§.getString(5),false);
               _loc2_.§1t6851s0§(this);
               _loc2_.§1t6848s0§(§1t6497s0§.§1t12442s0§);
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
         return this.npcname;
      }
      
      override public function §1t8518s0§(param1:MovieClip) : Boolean
      {
         return abs(this.npc.§1t1559s0§().x - param1.x) < 50 && this.npc.§1t1559s0§().§1t1558s0§() != §1t1544s0§.§1t10637s0§ && this.npc.actionState != §1t1544s0§.§1t11170s0§;
      }
      
      override public function §1t1552s0§(param1:MovieClip) : *
      {
         §1t1543s0§.§1t10212s0§(this.npc);
      }
      
      override public function §1t8513s0§() : MovieClip
      {
         return this.npc.§1t1559s0§();
      }
      
      override public function §1t2289s0§(param1:int) : *
      {
      }
      
      override public function §1t8162s0§(param1:§1t107s0§) : *
      {
         this.npc.§1t1559s0§().§1t6289s0§(2);
      }
   }
}

