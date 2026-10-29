package
{
   public class EnemyDeer extends NPC
   {
      
      internal var destX:int;
      
      internal var idleCounter:int;
      
      public function EnemyDeer(mcs:MCSCharacter = null)
      {
         super();
         if(mcs == null)
         {
            this.mcs = new MCSDeer();
         }
         else
         {
            this.mcs = mcs;
         }
         canGotLaunched = false;
         canGotKnockDown = false;
         canGotFly = false;
         canGotKneeGroin = false;
         canGotStun = false;
      }
      
      override public function init(xml:XMLNpc) : *
      {
         initMCSFromXML(xml.mcs);
         damage = xml.attack;
         defense = xml.defense;
         maxhp = xml.hp;
         level = xml.lvl;
         xp = level * 5 + 45;
         reset();
         this.startAction(IDLE_STATE);
         reward = new XMLReward(xml.reward);
         mcs.y = StageManager.getGroundY();
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
               case DEER_DEATH:
                  deathAnimEnd();
                  break;
               case DEER_GRAZING:
               case DEER_FIDGET:
                  this.startAction(IDLE_STATE);
                  break;
               case DEER_GETUP:
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
               dice = Math.random() * 4;
               this.idleCounter = 48;
               if(dice == 0)
               {
                  startAnim(DEER_IDLE);
               }
               else if(dice == 1)
               {
                  startAnim(DEER_GRAZING);
                  this.idleCounter = 120;
               }
               else if(dice == 2)
               {
                  startAnim(DEER_FIDGET);
               }
               else if(dice == 3)
               {
                  startAnim(DEER_SIT);
                  this.idleCounter = 120;
               }
               break;
            case WALK_STATE:
               startAnim(DEER_WALK);
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
               startAnim(DEER_RUN);
               if(this.destX < posX)
               {
                  walkSpeed = -12;
                  mcs.faceLeft();
               }
               else
               {
                  walkSpeed = 12;
                  mcs.faceRight();
               }
               break;
            case DYING_STATE:
         }
      }
      
      override internal function doAction() : *
      {
         switch(actionState)
         {
            case IDLE_STATE:
               --this.idleCounter;
               if(this.idleCounter <= 0)
               {
                  this.idleCounter = 24;
                  if(!CutsceneManager.getInstance().isShowing())
                  {
                     if(getAnim() == DEER_SIT)
                     {
                        startAnim(DEER_GETUP);
                     }
                     else if(int(Math.random() * 3) == 1)
                     {
                        this.startAction(WALK_STATE);
                     }
                     else
                     {
                        this.startAction(IDLE_STATE);
                     }
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
                     startAnim(DEER_IDLE);
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
         var playerX:int = target.mcs.x;
         if(playerX < mcs.x)
         {
            if(mcs.x - playerX < 200 && !mcs.isFacingRight() || mcs.x - playerX < 50 && mcs.isFacingRight())
            {
               if(GameEngine.isAdventureMode())
               {
                  this.destX = StageManager.getGameStageWidth() + 100;
               }
               else
               {
                  this.destX = Math.random() * StageManager.getGameStageWidth();
               }
               this.startAction(RUN_STATE);
            }
         }
         else if(playerX > mcs.x)
         {
            if(playerX - mcs.x < 200 && mcs.isFacingRight() || playerX - mcs.x < 50 && !mcs.isFacingRight())
            {
               if(GameEngine.isAdventureMode())
               {
                  this.destX = -100;
               }
               else
               {
                  this.destX = Math.random() * StageManager.getGameStageWidth();
               }
               this.startAction(RUN_STATE);
            }
         }
      }
      
      override public function die() : *
      {
         createLoot();
         rewardXP();
         mcs.y = StageManager.getGroundY();
         actionState = DYING_STATE;
         startAnim(DEER_DEATH);
         dead = true;
         mcs.hideHealthBar();
      }
   }
}

