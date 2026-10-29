package
{
   public class §1t4907s0§ extends §1t122s0§
   {
      
      public function §1t4907s0§(param1:§1t75s0§ = null)
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
         var _loc2_:Number = NaN;
         mcs.§1t6287s0§(charname + " (" + param1 + ")",16777215);
         _loc2_ = param1 / level;
         level = param1;
         minDamage = damage * _loc2_;
         defense *= _loc2_;
         §1t3257s0§ *= _loc2_;
         §1t3308s0§(§1t3257s0§);
         §1t4413s0§ = 10 * param1;
         §1t4442s0§(§1t4413s0§);
         §1t3301s0§();
         xp = param1 * 5 + 45;
         var _loc3_:int = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9403s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t9403s0§);
         var _loc4_:int = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9409s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t9409s0§);
         var _loc5_:int = §1t1523s0§.§1t1088s0§() + §1t1523s0§.§1t9591s0§() / 2;
         var _loc6_:int = §1t1523s0§.getLevel();
         var _loc7_:int = param1 - _loc6_;
         var _loc8_:int = 10 + _loc7_;
         var _loc9_:int = 18 - _loc7_;
         if(_loc8_ <= 3)
         {
            _loc8_ = 3;
         }
         if(_loc9_ <= 3)
         {
            _loc9_ = 3;
         }
         var _loc10_:int = _loc5_ - defense;
         if(_loc6_ <= 10 && _loc10_ < 1)
         {
            _loc10_ = 1;
         }
         else if(_loc6_ <= 20 && _loc10_ < _loc6_ / 8)
         {
            _loc10_ = _loc6_ / 8;
         }
         else if(_loc6_ <= 30 && _loc10_ < _loc6_ / 6)
         {
            _loc10_ = _loc6_ / 6;
         }
         else if(_loc10_ < _loc6_ / 4)
         {
            _loc10_ = _loc6_ / 4;
         }
         var _loc11_:int = _loc10_ * _loc8_;
         if(_loc11_ > §1t3257s0§)
         {
            §1t3257s0§ = _loc11_;
            §1t3308s0§(§1t3257s0§);
            §1t3301s0§();
         }
         var _loc12_:int = _loc3_ / _loc9_;
         if(_loc12_ > minDamage)
         {
            minDamage = _loc12_;
         }
         §1t1244s0§ = minDamage;
         if(param1 <= 8)
         {
            minDamage = 1;
            §1t1244s0§ = 1;
            defense = 1;
         }
      }
      
      override public function init(param1:§1t76s0§) : *
      {
         var _loc9_:int = 0;
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
         _loc9_ = param1.§1t1255s0§(1002);
         §1t4443s0§(param1.controlledBy,param1.currenthp,param1.hp,param1.currentchi,param1.chi,param1.defense,_loc3_,param1.minDamage,param1.damageRange,_loc6_,param1.slashUsage,_loc7_,_loc8_,_loc9_,param1.lvl);
         §1t4445s0§(param1.attack,param1.§1t1235s0§,param1.§1t1236s0§,param1.§1t1237s0§,param1.§1t1238s0§);
         §1t4446s0§(param1.§1t1239s0§,param1.§1t1240s0§,param1.§1t1241s0§,param1.§1t1242s0§);
         if(controlledBy == 1)
         {
            §1t3308s0§(param1.hp);
         }
         nid = param1.nid;
         mcs.§1t6287s0§(param1.§1t509s0§() + " (" + level + ")",16777215);
         charname = param1.§1t509s0§();
         if(controlledBy == 1)
         {
            if(level > 30 && level < 80)
            {
               minDamage *= 1.1;
               §1t3257s0§ *= 1.1;
               §1t3308s0§(§1t3257s0§);
            }
            else if(level < 10)
            {
               minDamage *= 0.9;
               §1t3257s0§ *= 0.9;
               §1t3308s0§(§1t3257s0§);
            }
         }
         mcs.§1t6288s0§("");
         reward = param1.§1t992s0§();
         mcs.§1t6279s0§();
         §1t3301s0§();
         this.setLevel(param1.lvl);
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
         if(param1.stance != -1)
         {
            §1t3489s0§(param1.stance);
         }
         else if(param1.§1t1255s0§(1500) > 0)
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
      
      override public function §1t3298s0§() : *
      {
         if(!§1t4885s0§(§1t120s0§.§1t10167s0§))
         {
            super.§1t3298s0§();
         }
         else
         {
            §1t3269s0§(§1t11197s0§);
         }
      }
   }
}

