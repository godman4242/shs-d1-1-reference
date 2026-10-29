package
{
   public class EnemyCivilianOld extends EnemyCivilian
   {
      
      public function EnemyCivilianOld(mcs:MCSCharacter = null)
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
         doChase = false;
      }
      
      override public function update() : *
      {
         if(mcs == null || animFrozen)
         {
            return;
         }
         var finishedAnimation:String = mcs.updateAnimation();
         if(finishedAnimation != "")
         {
            switch(finishedAnimation)
            {
               case ENEMYDEATH:
               case DEATH_FORWARD:
               case DEFEATED2:
               case ENEMYDEATHNOHEAD:
               case ENEMYDEATHNOHAND:
               case DEATHDOWNED:
               case DEATHINHALF:
                  deathAnimEnd();
                  break;
               case ENEMYLAND:
               case FLY_END:
                  this.startAction(DOWNED_STATE);
                  break;
               case KNEEGROIN_VICTIM:
                  startAnim(GETUP_FRONT);
                  break;
               case GETUP_FRONT:
                  if(getMCS().isFacingRight())
                  {
                     movePositionX(-40);
                  }
                  else
                  {
                     movePositionX(40);
                  }
                  this.startAction(IDLE_STATE);
                  break;
               case GOTLAUNCHED_PEAK:
                  startAnim(GOTLAUNCHED_FALL);
                  break;
               case GOTLAUNCHEDDOWNED:
                  if(dead)
                  {
                     deathAnimEnd();
                  }
                  else
                  {
                     if(getHP() > 0)
                     {
                        mcs.showHealthBar();
                     }
                     mcs.moveHealthBarX(-100);
                     if(actionState == KNOCKDOWNED_STATE)
                     {
                        startAnim(DOWNEDUP);
                     }
                     else
                     {
                        startAnim(GOTLAUNCHEDDOWNEDEND);
                     }
                  }
                  break;
               case GOTLAUNCHEDDOWNEDEND:
                  startAnim(DOWNEDUP);
                  break;
               case DOWNEDUP:
                  mcs.moveHealthBarX(0);
                  if(mcs.scaleX == 1)
                  {
                     movePositionX(-100);
                  }
                  else
                  {
                     movePositionX(100);
                  }
                  this.startAction(WALK_STATE);
            }
         }
         this.doAction();
         if(gotHitCounter > 0)
         {
            --gotHitCounter;
         }
      }
      
      override internal function startAction(actionState:int) : *
      {
         this.actionState = actionState;
         switch(actionState)
         {
            case IDLE_STATE:
               startAnim(OLDMAN_IDLE);
               idleCounter = 48;
               break;
            case WALK_STATE:
               startAnim(OLDMAN_WALK);
               destX = Math.random() * StageManager.getGameStageWidth();
               if(destX < posX)
               {
                  walkSpeed = -1;
                  mcs.faceLeft();
               }
               else
               {
                  walkSpeed = 1;
                  mcs.faceRight();
               }
               break;
            case RUN_STATE:
               startAnim(OLDMAN_WALK);
               if(walkSpeed < 0)
               {
                  walkSpeed = -1;
               }
               else
               {
                  walkSpeed = 1;
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
                     walkSpeed = -1;
                     mcs.faceLeft();
                  }
                  else
                  {
                     walkSpeed = 1;
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

