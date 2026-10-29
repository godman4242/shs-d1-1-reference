package
{
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1644")]
   public class TextProjectile extends Projectile
   {
      
      public var words:TextField;
      
      public function TextProjectile()
      {
         super();
      }
      
      public function initText(str:String, color:int = 0) : *
      {
         visible = true;
         flying = true;
         ttl = 12;
         this.words.text = str;
         this.velX = 0;
         this.velY = -5;
         scaleX = 1;
         scaleY = 1;
         alpha = 1;
         this.words.textColor = color;
      }
      
      override public function update() : *
      {
         if(!flying)
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
         if(ttl <= 0 || StageManager.isRedFreeze())
         {
            this.removeProjectile();
         }
      }
      
      override internal function removeProjectile() : *
      {
         flying = false;
         visible = false;
         ProjectileManager.unregister(this);
         ProjectilePool.returnFloatingText(this);
         StageManager.getGameStageCanvas().removeChild(this);
      }
   }
}

