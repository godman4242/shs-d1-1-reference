package
{
   public class EnemyBear extends NPC
   {
      
      internal var destX:int;
      
      internal var idleCounter:int;
      
      internal var doChase:Boolean = false;
      
      public function EnemyBear(mcs:MCSCharacter = null, doChase:Boolean = false)
      {
         super();
         if(mcs == null)
         {
            this.mcs = new MCSBear();
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
         damage = xml.attack;
         defense = xml.defense;
         maxhp = xml.hp;
         level = xml.lvl;
         xp = level * 5 + 45;
         reset();
         this.startAction(IDLE_STATE);
         reward = new XMLReward(xml.reward);
         if(!GameEngine.isAdventureMode())
         {
            this.doChase = true;
         }
         mcs.y = StageManager.getGroundY();
      }
      
      override public function update() : *
      {
         if(mcs == null || animFrozen)
         {
            return;
         }
         if(target == null || target.isDead())
         {
            target = NPCManager.getNearestEnemy(getMapPosition(),true);
            if(target == null)
            {
               return;
            }
         }
         var finishedAnimation:String = mcs.updateAnimation();
         if(finishedAnimation != "")
         {
            switch(finishedAnimation)
            {
               case BEAR_DEATH:
                  deathAnimEnd();
                  break;
               case BEAR_FIDGET:
                  this.startAction(IDLE_STATE);
                  break;
               case BEAR_ATTACK:
                  this.destX = Math.random() * StageManager.getGameStageWidth();
                  this.startAction(RUN_STATE);
            }
         }
         this.doAction();
         if(gotHitCounter > 0)
         {
            --gotHitCounter;
         }
         if(checkAITrigger())
         {
            target = NPCManager.getNearestEnemy(getMapPosition(),true);
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
                  startAnim(BEAR_IDLE);
               }
               else if(dice == 1)
               {
                  startAnim(BEAR_SIT);
               }
               else
               {
                  startAnim(BEAR_FIDGET);
               }
               if(dice == 1)
               {
                  this.idleCounter = 72;
               }
               else
               {
                  this.idleCounter = 48;
               }
               break;
            case WALK_STATE:
               startAnim(BEAR_WALK);
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
               startAnim(BEAR_RUN);
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
            case ATTACK_STATE:
               if(mcs.x < target.mcs.x)
               {
                  mcs.faceRight();
               }
               else
               {
                  mcs.faceLeft();
               }
               startAnim(BEAR_ATTACK);
               break;
            case DYING_STATE:
         }
      }
      
      override internal function doAction() : *
      {
         if(this.idleCounter > 0)
         {
            --this.idleCounter;
         }
         switch(actionState)
         {
            case IDLE_STATE:
               if(this.idleCounter <= 0)
               {
                  this.idleCounter = 24;
                  if(!CutsceneManager.getInstance().isShowing() && int(Math.random() * 3) == 1)
                  {
                     this.startAction(WALK_STATE);
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
               if(this.idleCounter <= 0 && Math.abs(mcs.x - target.mcs.x) < 100)
               {
                  this.startAction(ATTACK_STATE);
                  this.idleCounter = 5 * 24;
               }
               else if(Math.abs(this.destX - posX) < 10)
               {
                  this.startAction(WALK_STATE);
                  if(GameEngine.isAdventureMode() && (posX <= -50 || posX > StageManager.getGameStageWidth() + 50))
                  {
                     this.startAction(REDFREEZE_STATE);
                     startAnim(BEAR_IDLE);
                  }
               }
               break;
            case ATTACK_STATE:
               target.checkHitObject(mcs.partList[MCSCharacter.PART_r_hand],new Damage(damage,level));
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
         if(playerX < mcs.x && !mcs.isFacingRight())
         {
            if(!this.doChase && mcs.x - playerX < 200)
            {
               this.destX = StageManager.getGameStageWidth() + 100;
               this.startAction(RUN_STATE);
            }
            else if(this.doChase && mcs.x - playerX < 400)
            {
               this.destX = -100;
               this.startAction(RUN_STATE);
            }
         }
         else if(playerX > mcs.x && mcs.isFacingRight())
         {
            if(!this.doChase && playerX - mcs.x < 200)
            {
               this.destX = -100;
               this.startAction(RUN_STATE);
            }
            else if(this.doChase && playerX - mcs.x < 400)
            {
               this.destX = StageManager.getGameStageWidth() + 100;
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
         startAnim(BEAR_DEATH);
         dead = true;
         mcs.hideHealthBar();
      }
   }
}

