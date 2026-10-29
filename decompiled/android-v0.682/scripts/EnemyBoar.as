package
{
   public class EnemyBoar extends NPC
   {
      
      internal var destX:int;
      
      internal var idleCounter:int;
      
      internal var doChase:Boolean = false;
      
      internal var knocker:Boolean = false;
      
      public function EnemyBoar(mcs:MCSCharacter = null, doChase:Boolean = false)
      {
         super();
         if(mcs == null)
         {
            this.mcs = new MCSBoar();
         }
         else
         {
            this.mcs = mcs;
         }
         this.doChase = doChase;
         canGotLaunched = true;
         canGotKnockDown = true;
         canGotFly = true;
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
               case BOAR_DEATH:
                  deathAnimEnd();
                  break;
               case BOAR_FIDGET:
               case BOAR_GRAZING:
                  this.startAction(IDLE_STATE);
                  break;
               case BOAR_ATTACK:
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
                  startAnim(BOAR_IDLE);
               }
               else if(dice == 1)
               {
                  startAnim(BOAR_FIDGET);
               }
               else if(dice == 2)
               {
                  startAnim(BOAR_GRAZING);
               }
               this.idleCounter = 48;
               break;
            case WALK_STATE:
               startAnim(BOAR_WALK);
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
               startAnim(BOAR_RUN);
               if(this.destX < posX)
               {
                  walkSpeed = -10;
                  mcs.faceLeft();
               }
               else
               {
                  walkSpeed = 10;
                  mcs.faceRight();
               }
               this.knocker = int(Math.random() * 4) == 0;
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
               startAnim(BOAR_ATTACK);
               break;
            case DYING_STATE:
               break;
            case GOTLAUNCHED_STATE:
               startAnim(BOAR_ROLLING);
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
               if(this.knocker)
               {
                  target.checkHitObject(mcs.partList[MCSCharacter.PART_head],new Damage(damage,level,Damage.LAUNCH_KNOCKDOWN));
               }
               else
               {
                  target.checkHitObject(mcs.partList[MCSCharacter.PART_head],new Damage(damage,level));
               }
               if((this.doChase || !GameEngine.isAdventureMode()) && Math.abs(mcs.x - target.mcs.x) < 50)
               {
                  this.startAction(ATTACK_STATE);
               }
               else if(Math.abs(this.destX - posX) < 10)
               {
                  if(GameEngine.isAdventureMode() && int(Math.random() * 2) == 0)
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
               this.doLaunched();
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
         if(actionState == GOTLAUNCHED_STATE)
         {
            dead = true;
            return;
         }
         createLoot();
         rewardXP();
         mcs.y = StageManager.getGroundY();
         actionState = DYING_STATE;
         startAnim(BOAR_DEATH);
         dead = true;
         mcs.hideHealthBar();
      }
      
      override internal function gotLaunched() : *
      {
         if(actionState == DOWNED_STATE || actionState == DYING_STATE)
         {
            return;
         }
         if(actionState == GOTLAUNCHED_STATE || actionState == FALL_STATE || actionState == JUMP_STATE)
         {
            velY = -20;
            if(getMCS().isFacingRight())
            {
               mcs.faceLeft();
            }
            else
            {
               getMCS().faceRight();
            }
            this.startAction(GOTLAUNCHED_STATE);
         }
         else
         {
            this.startAction(GOTLAUNCHED_STATE);
            velY = -25;
         }
         if(getMCS().isFacingRight())
         {
            velX = -3;
         }
         else
         {
            velX = 3;
         }
      }
      
      override internal function doLaunched() : *
      {
         mcs.y += velY;
         movePositionX(velX);
         velY += 3;
         var groundY:int = StageManager.getGroundY();
         if(mcs.y >= groundY)
         {
            mcs.y = groundY;
            if(dead)
            {
               actionState = DYING_STATE;
               this.die();
            }
            else
            {
               this.startAction(WALK_STATE);
            }
         }
         else if(velX < 0 && getMapPosition() < 20 || velX > 0 && getMapPosition() > StageManager.getGameStageWidth() - 20)
         {
            this.gotLaunched();
            velX *= 2;
         }
      }
      
      override internal function gotKnockDown() : *
      {
         this.gotLaunched();
      }
      
      override internal function gotFly(flyVelX:int, flyVelY:int) : *
      {
         this.gotLaunched();
      }
   }
}

