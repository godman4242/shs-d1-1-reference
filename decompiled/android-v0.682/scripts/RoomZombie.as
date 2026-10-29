package
{
   public class RoomZombie extends NPC
   {
      
      internal var destX:int;
      
      internal var idleCounter:int;
      
      internal var doChase:Boolean = false;
      
      internal var onAlert:Boolean = false;
      
      internal var walkType:int;
      
      public function RoomZombie(mcs:MCSCharacter = null, doChase:Boolean = false)
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
         this.walkType = Math.random() * 2;
      }
      
      override public function init(xml:XMLNpc) : *
      {
         super.init(xml);
         if(mcs.y == StageManager.getGroundY())
         {
            this.startAction(IDLE_STATE);
         }
         else
         {
            this.startAction(FALL_STATE);
         }
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
               case ZOM_ATTACK:
               case DOWNSTAB_UP:
                  this.startAction(WALK_STATE);
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
                     startAnim(GOTLAUNCHEDDOWNEDEND);
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
                  break;
               case ZOM_WALK:
               case ZOM_WALK2:
               case ZOM_WALK3:
                  if(mcs.isFacingRight())
                  {
                     movePositionX(33);
                  }
                  else
                  {
                     movePositionX(-33);
                  }
                  mcs.restartAnim();
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
               startAnim(ZOM_IDLE);
               this.idleCounter = 60;
               break;
            case WALK_STATE:
               startAnim(ZOM_WALK);
               this.destX = Math.random() * StageManager.getGameStageWidth();
               if(this.destX < posX)
               {
                  mcs.faceLeft();
               }
               else
               {
                  mcs.faceRight();
               }
               break;
            case RUN_STATE:
               if(this.walkType == 0)
               {
                  startAnim(ZOM_WALK2);
               }
               else
               {
                  startAnim(ZOM_WALK3);
               }
               if(!mcs.isFacingRight())
               {
                  walkSpeed = -Math.random() * 2 - 2;
               }
               else
               {
                  walkSpeed = Math.random() * 2 + 2;
               }
               break;
            case ATTACK_STATE:
               startAnim(ZOM_ATTACK);
               break;
            case GOTLAUNCHED_STATE:
               startAnim(GOTLAUNCHED_RISE);
               break;
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
            case STAB_STATE:
               startAnim(DOWNSTAB);
         }
      }
      
      override internal function doAction() : *
      {
         var facingRight:Boolean = false;
         switch(actionState)
         {
            case IDLE_STATE:
               --this.idleCounter;
               if(this.idleCounter <= 0)
               {
                  this.idleCounter = 60;
                  if(!CutsceneManager.getInstance().isShowing() && int(Math.random() * 3) == 1)
                  {
                     this.startAction(WALK_STATE);
                  }
               }
               if(!this.onAlert && this.doChase)
               {
                  this.spotPlayer();
               }
               break;
            case WALK_STATE:
               facingRight = mcs.isFacingRight();
               if(StageManager.getGameStage().isNPCBlocked(mcs.x,facingRight))
               {
                  if(!facingRight)
                  {
                     this.destX = posX + Math.random() * (StageManager.getGameStageWidth() - posX);
                  }
                  else
                  {
                     this.destX = Math.random() * posX;
                  }
                  if(this.destX < posX)
                  {
                     mcs.faceLeft();
                  }
                  else
                  {
                     mcs.faceRight();
                  }
               }
               if(Math.abs(this.destX - posX) < 50)
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
               if(this.doChase)
               {
                  this.spotPlayer();
               }
               break;
            case RUN_STATE:
               if(posX < 0 || posX > StageManager.getGameStageWidth())
               {
                  this.startAction(IDLE_STATE);
               }
               if(Math.abs(mcs.x - target.getMCS().x) < 50)
               {
                  this.startAction(ATTACK_STATE);
               }
               facingRight = mcs.isFacingRight();
               if(StageManager.getGameStage().isNPCBlocked(mcs.x,facingRight))
               {
                  if(!facingRight)
                  {
                     this.destX = posX + Math.random() * (StageManager.getGameStageWidth() - posX);
                  }
                  else
                  {
                     this.destX = Math.random() * posX;
                  }
                  if(this.destX < posX)
                  {
                     mcs.faceLeft();
                  }
                  else
                  {
                     mcs.faceRight();
                  }
               }
               break;
            case ATTACK_STATE:
               break;
            case GOTLAUNCHED_STATE:
               doLaunched();
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
            case DYING_STATE:
         }
      }
      
      internal function spotPlayer() : *
      {
         var screenTransition:ScreenTransition = OverworldHUD.getInstance().screenTransition;
         if(screenTransition.isTransitioning() || OverworldHUD.instance.duelmodeUI.noAggro || CutsceneManager.instance != null && CutsceneManager.instance.showing)
         {
            return;
         }
         var facingRight:Boolean = mcs.isFacingRight();
         var posdiff:int = target.getMCS().x - getMCS().x;
         if(Math.abs(posdiff) < 200)
         {
            this.onAlert = true;
            if(posdiff > 0)
            {
               mcs.faceRight();
            }
            else
            {
               mcs.faceLeft();
            }
         }
         if(this.onAlert)
         {
            if(OverworldHUD.getInstance().screenTransition.isTransitioning())
            {
               return;
            }
            this.startAction(RUN_STATE);
         }
      }
   }
}

