package
{
   public class §1t4906s0§ extends §1t122s0§
   {
      
      public function §1t4906s0§(param1:§1t75s0§ = null)
      {
         super();
         if(param1 == null)
         {
            this.mcs = new §1t75s0§();
         }
         else
         {
            this.mcs = param1;
         }
         §1t3269s0§(§1t11145s0§);
         §1t3244s0§ = 12;
         this.§1t4876s0§ = false;
         this.§1t4528s0§ = true;
      }
      
      override public function setLevel(param1:int) : *
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc2_ = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9403s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t9403s0§);
         _loc3_ = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9406s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t9406s0§);
         _loc4_ = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9409s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t9409s0§);
         var _loc5_:int = §1t1523s0§.§1t1088s0§() + §1t1523s0§.§1t9591s0§() / 2;
         minDamage = _loc5_ * 0.75;
         defense = _loc4_ * 0.75;
         §1t3257s0§ = _loc2_ * 0.75;
         §1t4413s0§ = _loc3_ * 0.75;
         §1t3308s0§(§1t3257s0§);
         §1t4442s0§(§1t4413s0§);
         §1t3301s0§();
         xp = 0;
         level = param1;
      }
      
      override public function init(param1:§1t76s0§) : *
      {
         var _loc11_:§1t105s0§ = null;
         var _loc13_:int = 0;
         reset();
         §1t1550s0§(param1.mcs);
         var _loc2_:§1t104s0§ = §1t1524s0§.§1t9862s0§(param1.mcs.weapon);
         if(_loc2_ == null)
         {
            _loc2_ = §1t1524s0§.§1t9862s0§(13002);
         }
         var _loc3_:int = 48 + param1.speed * 6;
         var _loc4_:int = param1.speed;
         var _loc5_:int = 90;
         var _loc6_:int = 120 + Math.floor(_loc5_ * _loc4_ / (20 + _loc4_));
         var _loc7_:int = param1.§1t1255s0§(1000);
         var _loc8_:int = param1.§1t1255s0§(1001);
         var _loc9_:int = param1.§1t1255s0§(1002);
         §1t4443s0§(param1.controlledBy,param1.currenthp,param1.hp,param1.currentchi,param1.chi,param1.defense,_loc3_,param1.minDamage,param1.damageRange,_loc6_,param1.slashUsage,_loc7_,_loc8_,_loc9_,param1.lvl);
         §1t4445s0§(param1.attack,param1.§1t1235s0§,param1.§1t1236s0§,param1.§1t1237s0§,param1.§1t1238s0§);
         §1t4446s0§(param1.§1t1239s0§,param1.§1t1240s0§,param1.§1t1241s0§,param1.§1t1242s0§);
         if(controlledBy == 1)
         {
            §1t3308s0§(param1.hp);
         }
         nid = param1.nid;
         mcs.§1t6287s0§(param1.§1t509s0§(),16763904);
         charname = param1.§1t509s0§();
         mcs.§1t6288s0§("");
         reward = param1.§1t992s0§();
         mcs.§1t6279s0§();
         §1t3301s0§();
         this.setLevel(§1t1523s0§.getLevel());
         §1t4428s0§ = true;
         §1t1222s0§ = param1.§1t1222s0§;
         var _loc10_:int = int(§1t1222s0§.length);
         §1t4877s0§ = new Array();
         var _loc12_:int = 0;
         while(_loc12_ < _loc10_)
         {
            _loc11_ = §1t1524s0§.§1t9863s0§(§1t1222s0§[_loc12_].§1t760s0§());
            if(_loc11_ != null)
            {
               §1t4877s0§[§1t1222s0§[_loc12_].§1t760s0§()] = _loc11_.§1t1465s0§(§1t1222s0§[_loc12_].§1t761s0§());
            }
            _loc12_++;
         }
         if(param1.§1t1255s0§(1500) > 0)
         {
            §1t3489s0§(§1t12224s0§);
         }
         else if(param1.§1t1255s0§(1501) > 0)
         {
            §1t3489s0§(§1t12223s0§);
         }
         else if(_loc7_ == _loc8_ && _loc8_ == _loc9_)
         {
            §1t3489s0§(Math.random() * 3);
         }
         else
         {
            _loc13_ = 1;
            if(_loc7_ > _loc8_ && _loc7_ >= _loc9_)
            {
               _loc13_ = 0;
            }
            if(_loc9_ > _loc8_ && _loc9_ >= _loc7_)
            {
               _loc13_ = 2;
            }
            §1t3489s0§(_loc13_);
         }
         if(mcs.y == §1t1525s0§.§1t4467s0§())
         {
            §1t3269s0§(§1t11141s0§);
         }
         else
         {
            §1t3269s0§(§1t11145s0§);
         }
      }
   }
}

