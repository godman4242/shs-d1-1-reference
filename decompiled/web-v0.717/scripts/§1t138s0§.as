package
{
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2316")]
   public class §1t138s0§ extends §1t128s0§
   {
      
      public var words:TextField;
      
      public function §1t138s0§()
      {
         super();
      }
      
      public function §1t8383s0§(param1:String, param2:int = 0) : *
      {
         visible = true;
         §1t8100s0§ = true;
         ttl = 12;
         this.words.text = param1;
         this.velX = 0;
         this.velY = -5;
         scaleX = 1;
         scaleY = 1;
         alpha = 1;
         this.words.textColor = param2;
      }
      
      override public function update() : *
      {
         if(!§1t8100s0§)
         {
            return;
         }
         x += velX;
         y += velY;
         --ttl;
         if(ttl < 10)
         {
            scaleX += 0.1;
            scaleY += 0.1;
            if(ttl < 4)
            {
               alpha -= 0.25;
            }
         }
         if(ttl <= 0 || §1t1525s0§.§1t9952s0§())
         {
            this.§1t8113s0§();
         }
      }
      
      override internal function §1t8113s0§() : *
      {
         §1t8100s0§ = false;
         visible = false;
         §1t1712s0§.unregister(this);
         §1t1831s0§.§1t11502s0§(this);
         §1t1525s0§.§1t9942s0§().removeChild(this);
      }
   }
}

