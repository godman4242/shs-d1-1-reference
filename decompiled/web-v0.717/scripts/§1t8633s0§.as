package
{
   import flash.display.MovieClip;
   
   public class §1t8633s0§ extends §1t399s0§
   {
      
      internal var npc:§1t68s0§;
      
      internal var npcname:String;
      
      internal var questCompleted:Boolean;
      
      internal var isRonin:Boolean = false;
      
      public function §1t8633s0§(param1:int, param2:int, param3:String, param4:String = "")
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         super();
         if(param3 == "")
         {
            param3 = "1";
         }
         this.props = param3;
         var _loc5_:Array = param3.split(",");
         _loc6_ = int(_loc5_[0]);
         if(_loc5_.length == 2)
         {
            this.isRonin = _loc5_[1] == "1";
         }
         _loc7_ = §1t1525s0§.§1t9935s0§();
         _loc8_ = §1t1525s0§.§1t7341s0§();
         _loc9_ = §1t3317s0§.instance.§1t1848s0§();
         var _loc10_:§1t76s0§ = new §1t76s0§(null);
         _loc10_.§1t1249s0§(_loc7_,_loc8_,_loc6_,_loc9_,this.isRonin);
         this.npc = §1t1543s0§.§1t10209s0§(_loc10_,param1,param2);
         this.npcname = _loc10_.§1t509s0§();
         if(param4 == "")
         {
            objectName = this.npcname;
         }
         else
         {
            objectName = param4;
         }
         this.npc.§1t1559s0§().§1t6280s0§();
         this.npc.§1t1559s0§().§1t6287s0§(this.npcname,39423);
         visible = false;
         this.questCompleted = false;
         if(!this.questCompleted)
         {
            this.npc.§1t1559s0§().buttonMode = true;
         }
         if(§1t123s0§.instance.§1t821s0§(_loc7_,_loc8_,_loc6_,_loc9_))
         {
            this.npc.§1t1559s0§().§1t6287s0§(this.npcname,12627019);
            this.npc.§1t1559s0§().§1t6289s0§(2);
         }
         else
         {
            this.npc.§1t1559s0§().§1t6289s0§(3);
         }
      }
      
      override public function §1t8523s0§() : *
      {
         var _loc1_:§1t69s0§ = null;
         if(this.questCompleted)
         {
            return;
         }
         if(!this.isRonin)
         {
            _loc1_ = §1t123s0§.instance.§1t1602s0§(§1t1525s0§.§1t9935s0§(),§1t1525s0§.§1t7341s0§(),int(props),§1t3317s0§.instance.§1t1848s0§());
         }
         else
         {
            §1t1524s0§.§1t9878s0§(18,this.npc.§1t1559s0§().§1t1251s0§(),§1t70s0§.instance.§1t1139s0§(§1t1525s0§.§1t9935s0§()),this.npcname);
            _loc1_ = §1t123s0§.instance.§1t1603s0§(§1t1525s0§.§1t9935s0§(),§1t1525s0§.§1t7341s0§(),int(props),§1t3317s0§.instance.§1t1848s0§());
         }
         if(§1t1523s0§.§1t9606s0§(_loc1_.§1t1452s0§[0].ap))
         {
            §1t1524s0§.§1t9880s0§(this.npc.§1t1559s0§().§1t1251s0§(),this.npcname);
            §1t1524s0§.§1t9873s0§(_loc1_);
            §1t6427s0§.§1t12475s0§(§1t123s0§.§1t11212s0§,0);
         }
         else
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(100),§1t1521s0§.getString(5));
         }
      }
      
      override public function interact() : *
      {
         this.§1t8523s0§();
      }
      
      override public function showInteractButton(param1:Boolean) : *
      {
         if(param1 && !shown && §1t8501s0§)
         {
            §1t406s0§.instance.§1t6574s0§().§1t6388s0§(this,§1t407s0§.§1t12445s0§);
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
         return this.npcname;
      }
      
      override public function §1t8518s0§(param1:MovieClip) : Boolean
      {
         if(this.questCompleted)
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
         if(this.questCompleted)
         {
            return;
         }
         this.npc.§1t3269s0§(§1t1544s0§.§1t11141s0§);
      }
   }
}

