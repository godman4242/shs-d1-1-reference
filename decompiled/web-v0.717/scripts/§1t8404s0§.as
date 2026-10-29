package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2252")]
   public class §1t8404s0§ extends §1t128s0§
   {
      
      public var hitarea:MovieClip;
      
      public function §1t8404s0§()
      {
         super();
         addFrameScript(49,this.frame50);
      }
      
      override public function init(param1:int, param2:int, param3:int, param4:int, param5:§1t68s0§ = null) : *
      {
         if(param4 == 1)
         {
            param3 = 50;
         }
         else if(param4 == 2)
         {
            param3 = 100;
         }
         else if(param4 == 3)
         {
            param3 = 150;
         }
         visible = true;
         §1t8100s0§ = true;
         this.owner = param5;
         §1t8103s0§ = new §1t67s0§(0,0,§1t67s0§.§1t9122s0§);
         if(param5 != null)
         {
            §1t8103s0§.§1t1089s0§(param5);
         }
         §1t8103s0§.§1t1086s0§(90,param1);
         this.hitarea.visible = false;
      }
      
      override public function update() : *
      {
         if(§1t8100s0§)
         {
            if(§1t3255s0§())
            {
               if(§1t1543s0§.§1t3274s0§(this.hitarea,§1t8103s0§,200,false,this))
               {
                  §1t8100s0§ = false;
               }
            }
            else if(§1t1543s0§.§1t10232s0§(this.hitarea,§1t8103s0§,200,false,this))
            {
               §1t8100s0§ = false;
            }
         }
      }
      
      override internal function §1t8113s0§() : *
      {
         stop();
         §1t8100s0§ = false;
         visible = false;
         MovieClip(parent).removeChild(this);
         §1t1712s0§.unregister(this);
      }
      
      internal function frame50() : *
      {
         this.§1t8113s0§();
      }
   }
}

