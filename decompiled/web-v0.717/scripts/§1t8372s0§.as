package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol152")]
   public class §1t8372s0§ extends §1t128s0§
   {
      
      public function §1t8372s0§()
      {
         super();
         addFrameScript(5,this.frame6);
         visible = true;
         §1t8100s0§ = false;
         this.velX = 0;
         this.velY = 0;
         ttl = §1t8101s0§;
      }
      
      override public function update() : *
      {
         if(!§1t8100s0§)
         {
            return;
         }
         y += velY;
         velY += §1t12543s0§;
         if(this.y > 480)
         {
            this.§1t8113s0§();
         }
      }
      
      override internal function §1t8113s0§() : *
      {
         §1t8100s0§ = false;
         visible = false;
         §1t1712s0§.unregister(this);
         §1t1525s0§.§1t9942s0§().removeChild(this);
      }
      
      internal function frame6() : *
      {
         stop();
         §1t8106s0§(true);
      }
   }
}

