package
{
   public class EnemyStag extends NPC
   {
      
      internal var destX:int;
      
      internal var idleCounter:int;
      
      internal var doChase:Boolean;
      
      public function EnemyStag(mcs:MCSCharacter = null, doChase:Boolean = false)
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
      
      override public function setLevel(lvl:int) : *
      {
         var factor:Number = NaN;
         factor = lvl / level;
         if(lvl <= 20)
         {
            factor *= 0.9;
         }
         level = lvl;
         damage *= factor;
         defense *= factor;
         maxhp *= factor;
         setHP(maxhp);
         updateHealthBar();
         xp = lvl * 2 + 20;
         if(lvl <= 10)
         {
            damage = 1;
            defense = 1;
            maxhp = 1;
            setHP(maxhp);
         }
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
               case HORSE_DEATH:
                  deathAnimEnd();
                  break;
               case HORSE_GRAZING:
               case HORSE_PAWING:
                  this.startAction(IDLE_STATE);
                  break;
               case HORSE_REARING:
                  if(actionState == ATTACK_STATE)
                  {
                     this.startAction(CHARGING_STATE);
                  }
                  else
                  {
                     this.startAction(RUN_STATE);
                  }
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
            case ATTACK_STATE:
               startAnim(HORSE_REARING);
               break;
            case CHARGING_STATE:
               startAnim(STAG_CHARGE);
               if(this.destX < posX)
               {
                  walkSpeed = -15;
                  mcs.faceLeft();
               }
               else
               {
                  walkSpeed = 15;
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
                  if(!CutsceneManager.getInstance().isShowing())
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
                  if(!this.doChase && GameEngine.isAdventureMode() && (posX <= -50 || posX > StageManager.getGameStageWidth() + 50))
                  {
                     this.startAction(REDFREEZE_STATE);
                     startAnim(HORSE_IDLE);
                  }
               }
               break;
            case ATTACK_STATE:
               break;
            case CHARGING_STATE:
               movePositionX(walkSpeed);
               target.checkHitObject(mcs.partList[MCSCharacter.PART_head],new Damage(damage,level,Damage.LAUNCH_KNOCKDOWN));
               if(Math.abs(this.destX - posX) < 10)
               {
                  this.startAction(WALK_STATE);
               }
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
               this.startAction(POSE_STATE);
               startAnim(HORSE_REARING);
            }
            else if(this.doChase && mcs.x - playerX < 400)
            {
               this.destX = -100;
               this.startAction(ATTACK_STATE);
            }
         }
         else if(playerX > mcs.x && mcs.isFacingRight())
         {
            if(!this.doChase && playerX - mcs.x < 200)
            {
               this.destX = -100;
               this.startAction(POSE_STATE);
               startAnim(HORSE_REARING);
            }
            else if(this.doChase && playerX - mcs.x < 400)
            {
               this.destX = StageManager.getGameStageWidth() + 100;
               this.startAction(ATTACK_STATE);
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

