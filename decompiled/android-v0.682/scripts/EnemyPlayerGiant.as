package
{
   public class EnemyPlayerGiant extends EnemyPlayer
   {
      
      public function EnemyPlayerGiant(mcs:MCSCharacter, isDuelist:Boolean)
      {
         super(mcs,isDuelist,false);
         mcs.scaleX = 1.5;
         mcs.scaleY = 1.5;
         canGotLaunched = true;
         canGotKnockDown = true;
         canGotFly = false;
         canGotKneeGroin = false;
         canGotStun = false;
      }
      
      override internal function deathAnimEnd() : *
      {
         if(bloodEmitter != null)
         {
            bloodEmitter.destroy();
         }
         if(bloodEmitter2 != null)
         {
            bloodEmitter2.destroy();
         }
         if(StageManager.isRedFreeze())
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
            mcs.disposeMCS();
            mcs = null;
         }
      }
      
      override internal function gotLaunched() : *
      {
         gotKnockDown();
      }
   }
}

