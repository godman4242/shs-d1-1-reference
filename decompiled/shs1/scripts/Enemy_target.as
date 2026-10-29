package
{
   [Embed(source="/_assets/assets.swf", symbol="symbol323")]
   public class Enemy_target extends Enemy
   {
      
      public static var typeCode:int = 101;
      
      public function Enemy_target()
      {
         super();
         this.rotation = -10 + Math.random() * 20;
         speed = 0;
      }
      
      override public function die() : *
      {
         dead = true;
      }
      
      override public function unpauseGame() : *
      {
      }
      
      override public function freeze() : *
      {
      }
      
      override public function update() : *
      {
      }
      
      override public function arrowHit(param1:Arrow_player) : Boolean
      {
         if(param1.y < this.y - 97)
         {
            return false;
         }
         if(param1.isSimulation())
         {
            if(hp == 1)
            {
               param1.killingHit = true;
            }
            return true;
         }
         if(hp > 0)
         {
            --hp;
            if(hp <= 0)
            {
               if(param1.killingHit)
               {
                  freeze();
               }
            }
            return true;
         }
         return false;
      }
      
      override public function pauseGame() : *
      {
      }
      
      override public function hit(param1:int, param2:int) : Boolean
      {
         if(hp > 0)
         {
            --hp;
            return true;
         }
         return false;
      }
   }
}

