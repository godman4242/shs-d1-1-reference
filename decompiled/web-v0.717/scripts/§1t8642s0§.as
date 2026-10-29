package
{
   import flash.display.MovieClip;
   
   public class §1t8642s0§ extends §1t399s0§
   {
      
      internal var npc:§1t68s0§;
      
      internal var npcname:String;
      
      internal var npcid:int;
      
      internal var offset:int;
      
      public function §1t8642s0§(param1:int, param2:int, param3:String, param4:String = "")
      {
         var _loc6_:int = 0;
         super();
         if(param3 == "")
         {
            param3 = "1";
         }
         this.props = param3;
         var _loc5_:Array = param3.split(",");
         this.npcid = int(_loc5_[0]);
         this.npc = §1t1543s0§.§1t10208s0§(this.npcid,param1,param2);
         this.npc.§1t3260s0§ = true;
         this.npc.§1t1559s0§().§1t6280s0§();
         if(this.npcid == 77)
         {
            this.npc.§1t1559s0§().§1t6246s0§(§1t1544s0§.§1t10665s0§,53);
            this.offset = 150;
         }
         else if(this.npcid == 65 || this.npcid == 78)
         {
            this.npc.§1t1559s0§().§1t6246s0§(§1t1544s0§.§1t10645s0§,0);
            this.offset = 0;
         }
         else if(this.npcid == 72)
         {
            this.npc.§1t1559s0§().§1t6246s0§(§1t1544s0§.§1t10573s0§,5);
            this.offset = 50;
         }
         else if(this.npcid == 73)
         {
            this.npc.§1t1559s0§().§1t6246s0§(§1t1544s0§.§1t10587s0§,6);
            this.offset = 40;
         }
         else if(this.npcid == 74)
         {
            this.npc.§1t1559s0§().§1t6246s0§(§1t1544s0§.§1t10603s0§,6);
            this.offset = 80;
         }
         else
         {
            _loc6_ = §1t58s0§.random(5,§1t1525s0§.§1t9935s0§() * §1t3317s0§.instance.§1t1848s0§() + param1 + §1t1525s0§.§1t7341s0§());
            if(_loc6_ == 0)
            {
               this.npc.§1t1557s0§(§1t1544s0§.§1t10551s0§);
            }
            else if(_loc6_ == 1)
            {
               this.npc.§1t1557s0§(§1t1544s0§.§1t10553s0§);
            }
            else if(_loc6_ == 2)
            {
               this.npc.§1t1557s0§(§1t1544s0§.§1t10555s0§);
            }
            else if(_loc6_ == 3)
            {
               this.npc.§1t1557s0§(§1t1544s0§.§1t10557s0§);
            }
            else if(_loc6_ == 4)
            {
               this.npc.§1t1557s0§(§1t1544s0§.§1t10559s0§);
            }
            if(§1t58s0§.random(2,-1) == 0)
            {
               this.npc.§1t1559s0§().§1t5492s0§();
            }
            this.npc.§1t3258s0§ = true;
         }
         this.npc.§1t1559s0§().§1t6287s0§("");
         §1t8503s0§ = §1t407s0§.§1t12444s0§;
      }
      
      override public function interact() : *
      {
         §1t8501s0§ = false;
         §1t406s0§.§1t9190s0§().§1t6574s0§().§1t6395s0§(this);
      }
      
      override public function interact2() : *
      {
         var _loc1_:§1t85s0§ = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         §1t1523s0§.§1t1684s0§(60007,1);
         if(§1t8502s0§ != null)
         {
            _loc1_ = §1t1524s0§.§1t9872s0§(§1t8502s0§.id,§1t8502s0§.§1t1103s0§);
            §1t6427s0§.§1t12475s0§(§1t8502s0§.id,§1t8502s0§.§1t1103s0§);
            return;
         }
         if(int(Math.random() * 10) <= §1t1523s0§.§1t9714s0§(1021))
         {
            §1t406s0§.instance.§1t6488s0§.§1t6194s0§(§1t1525s0§.§1t9936s0§(),false,true);
            _loc2_ = §1t406s0§.instance.§1t6488s0§.§1t6207s0§();
            _loc6_ = 0;
            while(_loc6_ < _loc2_)
            {
               _loc3_ = Math.random() * 16 - 8;
               if(x < 100 && _loc3_ < 0)
               {
                  _loc3_ *= -1;
               }
               else if(x > §1t1525s0§.§1t8124s0§() - 100 && _loc3_ > 0)
               {
                  _loc3_ *= -1;
               }
               _loc5_ = 20;
               if(_loc3_ < 0)
               {
                  _loc5_ = -20;
               }
               _loc4_ = -Math.random() * 10 - 25;
               §1t1712s0§.§1t11326s0§(x,y - 50,_loc3_,_loc4_,_loc5_,2);
               _loc6_++;
            }
            §1t406s0§.instance.§1t6488s0§.§1t5826s0§();
            §1t406s0§.instance.§1t6488s0§.show();
         }
         else
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(101),§1t1521s0§.getString(5));
         }
      }
      
      override public function §1t6733s0§() : String
      {
         return §1t1521s0§.getString(977);
      }
      
      override public function §1t8518s0§(param1:MovieClip) : Boolean
      {
         if(!§1t8501s0§)
         {
            return false;
         }
         return abs(this.npc.§1t1559s0§().x + this.offset - param1.x) < 100;
      }
      
      override public function setQuestAction(param1:§1t107s0§) : *
      {
         §1t8502s0§ = param1;
         this.npc.§1t1559s0§().buttonMode = true;
      }
      
      override public function §1t8517s0§() : int
      {
         return 2;
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
   }
}

