package
{
   public class RoomOgre extends NPC
   {
      
      internal var destX:int;
      
      internal var idleCounter:int;
      
      internal var doChase:Boolean = false;
      
      internal var onAlert:Boolean = false;
      
      public function RoomOgre(mcs:MCSCharacter = null, doChase:Boolean = false)
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
         this.mcs.healthBar.y = -200;
         this.mcs.displayName.y = -200;
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
               case OGRE_SWINGDOWN:
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
               case DOWNSTAB:
                  if(target.isDowned())
                  {
                     target.checkHitObject(mcs.partList[MCSCharacter.PART_weapon],new Damage(damage * 2,level));
                  }
                  startAnim(DOWNSTAB_UP);
                  break;
               case OGRE_FIDGET:
                  startAnim(OGRE_IDLE);
                  break;
               case OGRE_NAP1_END:
               case OGRE_NAP2_END:
                  this.startAction(WALK_STATE);
                  break;
               case OGRE_NAP1_START:
                  startAnim(OGRE_NAP1_MID);
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
               startAnim(OGRE_IDLE);
               this.idleCounter = 48;
               break;
            case WALK_STATE:
               startAnim(OGRE_WALK);
               this.destX = Math.random() * StageManager.getGameStageWidth();
               if(this.destX < posX)
               {
                  walkSpeed = -Math.random() * 2 - 4;
                  mcs.faceLeft();
               }
               else
               {
                  walkSpeed = Math.random() * 2 + 4;
                  mcs.faceRight();
               }
               break;
            case RUN_STATE:
               startAnim(OGRE_WALK);
               break;
            case ATTACK_STATE:
               startAnim(OGRE_SWINGDOWN);
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
               break;
            case NAP_STATE:
               if(int(Math.random() * 2) == 0)
               {
                  startAnim(OGRE_NAP1_START);
               }
               else
               {
                  startAnim(OGRE_NAP2_START);
               }
               this.idleCounter = (5 + Math.random() * 10) * 24;
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
                  this.idleCounter = 48;
                  if(!CutsceneManager.getInstance().isShowing() && int(Math.random() * 3) == 1)
                  {
                     this.startAction(WALK_STATE);
                  }
                  else
                  {
                     this.startAction(NAP_STATE);
                  }
               }
               if(!this.onAlert && this.doChase)
               {
                  this.spotPlayer();
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
                     this.destX = posX + Math.random() * (StageManager.getGameStageWidth() - posX);
                  }
                  else
                  {
                     this.destX = Math.random() * posX;
                  }
                  if(this.destX < posX)
                  {
                     walkSpeed = -Math.random() * 2 - 4;
                     mcs.faceLeft();
                  }
                  else
                  {
                     walkSpeed = Math.random() * 2 + 4;
                     mcs.faceRight();
                  }
               }
               if(Math.abs(this.destX - posX) < 10)
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
               movePositionX(walkSpeed);
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
                  movePositionX(-walkSpeed);
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
                     walkSpeed = -Math.random() * 2 - 4;
                     mcs.faceLeft();
                  }
                  else
                  {
                     walkSpeed = Math.random() * 2 + 4;
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
               break;
            case NAP_STATE:
               --this.idleCounter;
               if(this.idleCounter <= 0)
               {
                  if(getAnim() == OGRE_NAP2_START)
                  {
                     startAnim(OGRE_NAP2_END);
                  }
                  else if(getAnim() == OGRE_NAP1_MID)
                  {
                     startAnim(OGRE_NAP1_END);
                  }
               }
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
         if(facingRight && posdiff > 0 && posdiff < 200)
         {
            walkSpeed = Math.random() * 3 + 5;
            this.onAlert = true;
         }
         else if(!facingRight && posdiff < 0 && posdiff > -200)
         {
            walkSpeed = -(Math.random() * 3 + 5);
            this.onAlert = true;
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

