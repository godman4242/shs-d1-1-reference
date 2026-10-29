package
{
   public class EnemyCivilianFemale extends EnemyCivilian
   {
      
      public function EnemyCivilianFemale(mcs:MCSCharacter = null, doChase:Boolean = false)
      {
         super();
         if(mcs == null)
         {
            this.mcs = new MCSCharacter();
         }
         else
         {
            this.mcs = mcs;
         }
         this.doChase = doChase;
      }
      
      override internal function startAction(actionState:int) : *
      {
         var dice:int = 0;
         this.actionState = actionState;
         switch(actionState)
         {
            case IDLE_STATE:
               startAnim(IDLE2);
               idleCounter = 48;
               break;
            case WALK_STATE:
               startAnim(SEXY_WALK);
               destX = Math.random() * StageManager.getGameStageWidth();
               if(destX < posX)
               {
                  walkSpeed = -3;
                  mcs.faceLeft();
               }
               else
               {
                  walkSpeed = 3;
                  mcs.faceRight();
               }
               break;
            case RUN_STATE:
               dice = Math.random() * 6;
               if(dice == 0)
               {
                  startAnim(KNIFEWALK);
               }
               else if(dice == 1)
               {
                  startAnim(KATANAWALK);
               }
               else if(dice == 2)
               {
                  startAnim(RUN_LIGHT);
               }
               else if(dice == 3)
               {
                  startAnim(RUN_BALANCED);
               }
               else if(dice == 4)
               {
                  startAnim(RUN_HEAVY);
               }
               else if(dice == 5)
               {
                  startAnim(NINJARUN);
               }
               if(dice >= 2)
               {
                  if(walkSpeed < 0)
                  {
                     walkSpeed = -10;
                  }
                  else
                  {
                     walkSpeed = 10;
                  }
               }
               break;
            case GOTLAUNCHED_STATE:
               startAnim(GOTLAUNCHED_RISE);
               break;
            case KNOCKDOWNED_STATE:
            case DOWNED_STATE:
               startAnim(GOTLAUNCHEDDOWNED);
               break;
            case FALL_STATE:
               startAnim(ENEMYJUMP);
               break;
            case LAND_STATE:
               startAnim(ENEMYLAND);
               break;
            case DYING_STATE:
               break;
            case REDFREEZE_STATE:
               animFrozen = true;
         }
      }
      
      override internal function doAction() : *
      {
         var facingRight:Boolean = false;
         switch(actionState)
         {
            case IDLE_STATE:
               --idleCounter;
               if(idleCounter <= 0)
               {
                  idleCounter = 24;
                  if(!CutsceneManager.getInstance().isShowing() && int(Math.random() * 3) == 1)
                  {
                     this.startAction(WALK_STATE);
                  }
               }
               if(!onAlert && doChase)
               {
                  spotPlayer();
               }
               break;
            case WALK_STATE:
               movePositionX(walkSpeed);
               facingRight = mcs.isFacingRight();
               if(StageManager.getGameStage().isNPCBlocked(mcs.x,facingRight))
               {
                  movePositionX(-walkSpeed);
                  if(!facingRight)
                  {
                     destX = posX + Math.random() * (StageManager.getGameStageWidth() - posX);
                  }
                  else
                  {
                     destX = Math.random() * posX;
                  }
                  if(destX < posX)
                  {
                     walkSpeed = -3;
                     mcs.faceLeft();
                  }
                  else
                  {
                     walkSpeed = 3;
                     mcs.faceRight();
                  }
               }
               if(Math.abs(destX - posX) < 10)
               {
                  if(int(Math.random() * 2) == 0)
                  {
                     this.startAction(IDLE_STATE);
                  }
                  else
                  {
                     this.startAction(WALK_STATE);
                  }
               }
               if(doChase)
               {
                  spotPlayer();
               }
               break;
            case RUN_STATE:
               movePositionX(walkSpeed);
               if(posX < 0 || posX > StageManager.getGameStageWidth())
               {
                  this.startAction(IDLE_STATE);
               }
               break;
            case ATTACK_STATE:
               break;
            case GOTLAUNCHED_STATE:
               doLaunched();
               break;
            case FLY_STATE:
               doFly();
               break;
            case STUN_STATE:
               doStun();
               break;
            case DOWNED_STATE:
               break;
            case FALL_STATE:
               mcs.y += velY;
               velY += 3;
               if(mcs.y >= StageManager.getGroundY())
               {
                  mcs.y = StageManager.getGroundY();
                  this.startAction(LAND_STATE);
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

