package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2314")]
   public class §1t8384s0§ extends §1t128s0§
   {
      
      internal var traptype:int;
      
      internal var npcMode:Boolean;
      
      public function §1t8384s0§(param1:int)
      {
         super();
         addFrameScript(0,this.frame1);
         this.traptype = param1;
         gotoAndStop(param1 + 1);
      }
      
      override public function init(param1:int, param2:int, param3:int, param4:int, param5:§1t68s0§ = null) : *
      {
         visible = true;
         ttl = 24 * 30;
         this.owner = param5;
         §1t8103s0§ = new §1t67s0§();
         if(param5 != null)
         {
            §1t8103s0§.§1t1089s0§(param5);
         }
         if(this.traptype == 0)
         {
            §1t8103s0§.§1t1094s0§(§1t67s0§.§1t9118s0§);
            if(param4 == 1)
            {
               §1t8103s0§.§1t1092s0§(20);
            }
            else if(param4 == 2)
            {
               §1t8103s0§.§1t1092s0§(40);
            }
            else if(param4 == 3)
            {
               §1t8103s0§.§1t1092s0§(60);
            }
            §1t8103s0§.§1t1093s0§(0);
         }
         else if(this.traptype == 1)
         {
            §1t8103s0§.§1t1095s0§(param3);
         }
         else if(this.traptype == 2)
         {
            §1t8103s0§.§1t1096s0§(param3);
         }
         else if(this.traptype == 3)
         {
            §1t8103s0§.§1t1097s0§(param3);
         }
         else if(this.traptype == 4)
         {
            §1t8103s0§.§1t1098s0§(param3);
         }
      }
      
      public function setNPCMode() : *
      {
         this.npcMode = true;
         visible = false;
      }
      
      override public function update() : *
      {
         --ttl;
         if(ttl == 0)
         {
            this.§1t8113s0§();
            return;
         }
         if(this.npcMode)
         {
            if(§1t1543s0§.§1t10232s0§(this,§1t8103s0§))
            {
               §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11280s0§,this.x + §1t1525s0§.§1t8131s0§(),this.y,0,0,0,0,null);
               this.§1t8113s0§();
            }
         }
         else if(§1t3255s0§() && §1t1543s0§.§1t3275s0§(this,§1t8103s0§))
         {
            §1t1712s0§.§1t4568s0§(§1t1712s0§.§1t11280s0§,this.x + §1t1525s0§.§1t8131s0§(),this.y,0,0,0,0,null);
            if(§1t251s0§.instance.§1t3476s0§())
            {
               §1t251s0§.instance.§1t3495s0§(§1t1712s0§.§1t11280s0§,this.x + §1t1525s0§.§1t8131s0§(),this.y,0,0,0,0);
            }
            §1t1543s0§.§1t10236s0§();
            this.§1t8113s0§();
         }
      }
      
      override internal function §1t8113s0§() : *
      {
         visible = false;
         MovieClip(parent).removeChild(this);
         §1t1712s0§.unregister(this);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

