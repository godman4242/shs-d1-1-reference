package
{
   public class EnemyWolf2 extends EnemyWolf
   {
      
      public function EnemyWolf2()
      {
         super();
         this.mcs = new MCSWolf();
         destX = Math.random() * StageManager.getGameStageWidth();
         startAction(RUN_STATE);
      }
      
      override internal function doAction() : *
      {
         var dice:int = 0;
         var dist:int = 0;
         switch(actionState)
         {
            case IDLE_STATE:
               --idleCounter;
               if(idleCounter <= 0)
               {
                  idleCounter = 12;
                  faceTarget();
                  if(!CutsceneManager.getInstance().isShowing() && int(Math.random() * 3) < 2)
                  {
                     destX = Math.random() * StageManager.getGameStageWidth();
                     startAction(RUN_STATE);
                  }
               }
               break;
            case WALK_STATE:
               destX = Math.random() * StageManager.getGameStageWidth();
               startAction(RUN_STATE);
               break;
            case RUN_STATE:
               movePositionX(walkSpeed);
               if(Math.abs(destX - posX) < 10)
               {
                  dice = Math.random() * 3;
                  if(dice == 0)
                  {
                     startAction(IDLE_STATE);
                  }
                  else
                  {
                     destX = Math.random() * StageManager.getGameStageWidth();
                     startAction(RUN_STATE);
                  }
               }
               dist = Math.abs(mcs.x - target.mcs.x);
               if(dist >= 100 && dist < 250 && int(Math.random() * 3) == 0)
               {
                  startAction(CHARGING_STATE);
               }
               break;
            case ATTACK_STATE:
               target.checkHitObject(mcs.partList[MCSCharacter.PART_weapon],new Damage(damage,level));
               break;
            case CHARGING_STATE:
               if(mcs.getAnim() == WOLF_POUNCE_MID || mcs.getAnim() == WOLF_POUNCE_MIDHIGH)
               {
                  if(mcs.isFacingRight())
                  {
                     movePositionX(15);
                  }
                  else
                  {
                     movePositionX(-15);
                  }
                  target.checkHitObject(mcs.partList[MCSCharacter.PART_head],new Damage(damage,level));
                  target.checkHitObject(mcs.partList[MCSCharacter.PART_r_hand],new Damage(damage,level));
               }
               break;
            case GOTLAUNCHED_STATE:
               doLaunched();
               break;
            case DOWNED_STATE:
               --idleCounter;
               if(idleCounter <= 0)
               {
                  startAnim(WOLF_DOWNEDTOIDLE);
               }
               break;
            case FALL_STATE:
               mcs.y += velY;
               velY += 3;
               if(mcs.y >= StageManager.getGroundY())
               {
                  mcs.y = StageManager.getGroundY();
                  startAction(LAND_STATE);
               }
               break;
            case LAND_STATE:
               break;
            case DYING_STATE:
               doDying();
         }
      }
   }
}

