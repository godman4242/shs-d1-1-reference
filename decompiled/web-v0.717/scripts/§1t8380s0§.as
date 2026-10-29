package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2331")]
   public class §1t8380s0§ extends §1t128s0§
   {
      
      internal var ownerIsNetworkPlayer:Boolean = false;
      
      public function §1t8380s0§()
      {
         super();
      }
      
      override public function init(param1:int, param2:int, param3:int, param4:int, param5:§1t68s0§ = null) : *
      {
         §1t8100s0§ = true;
         ttl = 3;
         this.owner = param5;
         if(param1 < 0)
         {
            scaleX = -scaleX;
         }
         §1t8103s0§ = new §1t67s0§(param3,param4,§1t67s0§.§1t9117s0§,§1t99s0§.§1t12220s0§);
         if(param5 != null)
         {
            §1t8103s0§.§1t1089s0§(param5);
            this.ownerIsNetworkPlayer = param5.§1t3314s0§();
         }
      }
      
      override public function update() : *
      {
         --ttl;
         if(ttl <= 0)
         {
            this.§1t8113s0§();
         }
         else if(§1t3255s0§())
         {
            §1t1543s0§.§1t3274s0§(this,§1t8103s0§,250,true);
         }
         else if(!this.ownerIsNetworkPlayer)
         {
            §1t1543s0§.§1t10232s0§(this,§1t8103s0§,250);
         }
      }
      
      override internal function §1t8113s0§() : *
      {
         stop();
         visible = false;
         §1t8100s0§ = false;
         owner = null;
         §1t8103s0§ = null;
         this.ownerIsNetworkPlayer = false;
         MovieClip(parent).removeChild(this);
         §1t1712s0§.unregister(this);
      }
   }
}

