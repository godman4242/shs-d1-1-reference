package
{
   public class EnemyHorse extends NPC
   {
      
      internal var destX:int;
      
      internal var idleCounter:int;
      
      internal var doChase:Boolean = false;
      
      public function EnemyHorse(mcs:MCSCharacter = null, doChase:Boolean = false)
      {
         super();
         if(mcs == null)
         {
            this.mcs = new MCSHorse();
         }
         else
         {
            this.mcs = mcs;
         }
         this.doChase = doChase;
         canGotLaunched = false;
         canGotKnockDown = false;
         canGotFly = false;
         canGotKneeGroin = false;
         canGotStun = false;
      }
      
      override public function init(xml:XMLNpc) : *
      {
         initMCSFromXML(xml.mcs);
         if(xml.mcs.prop.toString != "")
         {
         }
         damage = xml.attack;
         defense = xml.defense;
         maxhp = xml.hp;
         level = xml.lvl;
         xp = level * 5 + 45;
         reset();
         this.startAction(IDLE_STATE);
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
               case HORSE_DEATH:
                  deathAnimEnd();
                  break;
               case HORSE_GRAZING:
               case HORSE_PAWING:
                  this.startAction(IDLE_STATE);
                  break;
               case HORSE_REARING:
                  this.startAction(RUN_STATE);
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
               dice = Math.random() * 3;
               if(dice == 0)
               {
                  startAnim(HORSE_IDLE);
               }
               else if(dice == 1)
               {
                  startAnim(HORSE_GRAZING);
               }
               else if(dice == 2)
               {
                  startAnim(HORSE_PAWING);
               }
               this.idleCounter = 48;
               break;
            case WALK_STATE:
               startAnim(HORSE_WALK);
               this.destX = Math.random() * StageManager.getGameStageWidth();
               if(this.destX < posX)
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
               startAnim(HORSE_RUN);
               if(this.destX < posX)
               {
                  if(!GameEngine.isAdventureMode())
                  {
                     walkSpeed = -15;
                  }
                  else
                  {
                     walkSpeed = -12;
                  }
                  mcs.faceLeft();
               }
               else
               {
                  if(!GameEngine.isAdventureMode())
                  {
                     walkSpeed = 15;
                  }
                  else
                  {
                     walkSpeed = 12;
                  }
                  mcs.faceRight();
               }
               break;
            case DYING_STATE:
         }
      }
      
      override internal function doAction() : *
      {
         var dice:int = 0;
         switch(actionState)
         {
            case IDLE_STATE:
               --this.idleCounter;
               if(this.idleCounter <= 0)
               {
                  this.idleCounter = 24;
                  if(!CutsceneManager.getInstance().isShowing() && this.doChase)
                  {
                     dice = Math.random() * 3;
                     if(dice == 0)
                     {
                        this.startAction(WALK_STATE);
                     }
                     else if(dice == 1)
                     {
                        this.destX = Math.random() * StageManager.getGameStageWidth();
                        this.startAction(RUN_STATE);
                     }
                  }
                  else
                  {
                     this.startAction(IDLE_STATE);
                  }
               }
               this.checkPlayer();
               break;
            case WALK_STATE:
               movePositionX(walkSpeed);
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
               this.checkPlayer();
               break;
            case RUN_STATE:
               movePositionX(walkSpeed);
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
                  if(GameEngine.isAdventureMode() && (posX <= -50 || posX > StageManager.getGameStageWidth() + 50))
                  {
                     this.startAction(REDFREEZE_STATE);
                     startAnim(HORSE_IDLE);
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
               break;
            case DYING_STATE:
               doDying();
         }
      }
      
      internal function checkPlayer() : *
      {
         if(!this.doChase)
         {
            return;
         }
         var playerX:int = target.mcs.x;
         if(playerX < mcs.x && !mcs.isFacingRight())
         {
            if(mcs.x - playerX < 200)
            {
               this.destX = StageManager.getGameStageWidth() + 100;
               this.startAction(POSE_STATE);
               startAnim(HORSE_REARING);
            }
         }
         else if(playerX > mcs.x && mcs.isFacingRight())
         {
            if(playerX - mcs.x < 200)
            {
               this.destX = -100;
               this.startAction(POSE_STATE);
               startAnim(HORSE_REARING);
            }
         }
      }
      
      override public function die() : *
      {
         createLoot();
         rewardXP();
         mcs.y = StageManager.getGroundY();
         actionState = DYING_STATE;
         startAnim(HORSE_DEATH);
         dead = true;
         mcs.hideHealthBar();
      }
   }
}

