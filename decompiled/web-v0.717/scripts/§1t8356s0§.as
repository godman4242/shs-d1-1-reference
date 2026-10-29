package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2447")]
   public class §1t8356s0§ extends §1t128s0§
   {
      
      internal var ownerIsNetworkPlayer:Boolean = false;
      
      public function §1t8356s0§()
      {
         super();
         addFrameScript(3,this.frame4);
      }
      
      override public function init(param1:int, param2:int, param3:int, param4:int, param5:§1t68s0§ = null) : *
      {
         if(param4 == 1)
         {
            param3 = 10;
         }
         else if(param4 == 2)
         {
            param3 = 20;
         }
         else if(param4 == 3)
         {
            param3 = 30;
         }
         visible = true;
         §1t8100s0§ = true;
         if(param1 < 0)
         {
            scaleX = -scaleX;
         }
         this.owner = param5;
         §1t8103s0§ = new §1t67s0§(param3,0,§1t67s0§.§1t9118s0§);
         if(param5 != null)
         {
            §1t8103s0§.§1t1089s0§(param5);
            this.ownerIsNetworkPlayer = param5.§1t3314s0§();
         }
      }
      
      override public function update() : *
      {
         if(§1t3255s0§())
         {
            §1t1543s0§.§1t3274s0§(this,§1t8103s0§,200,true);
         }
         else if(!this.ownerIsNetworkPlayer)
         {
            §1t1543s0§.§1t10232s0§(this,§1t8103s0§,200);
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
      
      internal function frame4() : *
      {
         this.§1t8113s0§();
      }
   }
}

