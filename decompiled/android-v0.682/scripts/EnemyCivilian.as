package
{
   public class EnemyCivilian extends NPC
   {
      
      internal var destX:int;
      
      internal var idleCounter:int;
      
      internal var doChase:Boolean = false;
      
      internal var onAlert:Boolean = false;
      
      public function EnemyCivilian(mcs:MCSCharacter = null, doChase:Boolean = false)
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
      
      override public function init(xml:XMLNpc) : *
      {
         initMCSFromXML(xml.mcs);
         damage = xml.attack;
         defense = xml.defense;
         maxhp = xml.hp;
         level = 1;
         xp = level * 5 + 45;
         reset();
         this.startAction(WALK_STATE);
         reward = new XMLReward(xml.reward);
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
         var dice:int = 0;
         this.actionState = actionState;
         switch(actionState)
         {
            case IDLE_STATE:
               startAnim(IDLE2);
               this.idleCounter = 48;
               break;
            case WALK_STATE:
               startAnim(WALK_SHEATHED);
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
               --this.idleCounter;
               if(this.idleCounter <= 0)
               {
                  this.idleCounter = 24;
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
      
      internal function spotPlayer() : *
      {
         var alertStr:String = null;
         var dice:int = 0;
         var facingRight:Boolean = mcs.isFacingRight();
         var posdiff:int = target.getMCS().x - getMCS().x;
         if(facingRight && posdiff > 0 && posdiff < 300)
         {
            walkSpeed = Math.random() * 3 + 5;
            this.onAlert = true;
         }
         else if(!facingRight && posdiff < 0 && posdiff > -300)
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
            dice = Math.random() * 5;
            if(dice == 0)
            {
               alertStr = LangManager.getString(410);
            }
            else if(dice == 1)
            {
               alertStr = LangManager.getString(411);
            }
            else if(dice == 2)
            {
               alertStr = LangManager.getString(412);
            }
            else if(dice == 3)
            {
               alertStr = LangManager.getString(413);
            }
            else if(dice == 4)
            {
               alertStr = LangManager.getString(414);
            }
            mcs.setSpeechText(alertStr);
         }
      }
   }
}

