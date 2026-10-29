package
{
   public class §1t4908s0§ extends §1t122s0§
   {
      
      public function §1t4908s0§(param1:§1t75s0§, param2:Boolean)
      {
         super(param1,param2,false);
         param1.scaleX = 1.5;
         param1.scaleY = 1.5;
         §1t3261s0§ = true;
         §1t3262s0§ = true;
         §1t3263s0§ = false;
         §1t3264s0§ = false;
         §1t3265s0§ = false;
      }
      
      override internal function §1t3299s0§() : *
      {
         if(§1t3248s0§ != null)
         {
            §1t3248s0§.destroy();
         }
         if(§1t3249s0§ != null)
         {
            §1t3249s0§.destroy();
         }
         if(§1t1525s0§.§1t9952s0§())
         {
            return;
         }
         --ttl;
         if(ttl < 12)
         {
            mcs.alpha = ttl / 12;
         }
         if(ttl <= 0)
         {
            mcs.visible = false;
            mcs.scaleX = 1;
            mcs.scaleX = 1;
            mcs.§1t3305s0§();
            mcs = null;
         }
      }
      
      override internal function §1t3280s0§() : *
      {
         §1t3281s0§();
      }
   }
}

