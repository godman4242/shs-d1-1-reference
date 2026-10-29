package
{
   import flash.display.MovieClip;
   
   public class §1t4901s0§ extends §1t4542s0§
   {
      
      public function §1t4901s0§(param1:§1t75s0§ = null)
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
      }
      
      override public function setLevel(param1:int) : *
      {
         var _loc2_:int = 0;
         _loc2_ = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9403s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t9403s0§);
         var _loc3_:int = §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9409s0§) + §1t1523s0§.§1t7358s0§(§1t1523s0§.§1t9409s0§);
         var _loc4_:int = §1t1523s0§.§1t1088s0§() + §1t1523s0§.§1t9591s0§() / 2;
         damage = _loc4_ * 0.75;
         defense = _loc3_ * 0.75;
         §1t3257s0§ = _loc2_ * 0.75;
         §1t3308s0§(§1t3257s0§);
         §1t3301s0§();
         xp = 0;
         level = param1;
      }
      
      override public function init(param1:§1t76s0§) : *
      {
         §1t1550s0§(param1.mcs);
         reset();
         if(mcs.y == §1t1525s0§.§1t4467s0§())
         {
            §1t3269s0§(§1t11143s0§);
         }
         else
         {
            §1t3269s0§(§1t11145s0§);
         }
         §1t1235s0§ = param1.§1t1235s0§;
         §1t1236s0§ = param1.§1t1236s0§;
         §1t1237s0§ = param1.§1t1237s0§;
         §1t1238s0§ = param1.§1t1238s0§;
         §1t1239s0§ = param1.§1t1239s0§;
         §1t1240s0§ = param1.§1t1240s0§;
         §1t1241s0§ = param1.§1t1241s0§;
         §1t1242s0§ = param1.§1t1242s0§;
         reward = param1.§1t992s0§();
         mcs.§1t6287s0§(param1.§1t509s0§(),16763904);
         this.setLevel(§1t1523s0§.getLevel());
      }
      
      override public function §1t3274s0§(param1:MovieClip, param2:§1t67s0§, param3:Boolean = false, param4:Boolean = false) : Boolean
      {
         var _loc6_:MovieClip = null;
         var _loc5_:int = mcs.§1t6260s0§();
         var _loc7_:Vector.<MovieClip> = mcs.§1t6231s0§;
         var _loc8_:* = int(_loc5_ - 1);
         while(_loc8_ >= 0)
         {
            _loc6_ = _loc7_[_loc8_];
            if(_loc6_.hitTestObject(param1))
            {
               if(§1t3277s0§(_loc6_,param2))
               {
                  if(§1t3279s0§())
                  {
                     §1t1543s0§.§1t10236s0§();
                  }
                  return true;
               }
            }
            _loc8_--;
         }
         §1t3256s0§ = false;
         return false;
      }
   }
}

