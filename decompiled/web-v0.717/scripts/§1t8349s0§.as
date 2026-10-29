package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol2498")]
   public class §1t8349s0§ extends §1t128s0§
   {
      
      public function §1t8349s0§()
      {
         super();
         visible = true;
         §1t8100s0§ = false;
         this.velX = 0;
         this.velY = 0;
         ttl = §1t8101s0§;
      }
      
      override public function update() : *
      {
      }
      
      override internal function §1t8113s0§() : *
      {
         §1t8100s0§ = false;
         visible = false;
         §1t1712s0§.unregister(this);
         if(§1t1525s0§.§1t9942s0§().contains(this))
         {
            §1t1525s0§.§1t9942s0§().removeChild(this);
         }
      }
   }
}

