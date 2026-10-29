package
{
   import flash.display.MovieClip;
   
   public class EnemyWolf extends NPC
   {
      
      internal var destX:int;
      
      internal var idleCounter:int;
      
      public function EnemyWolf()
      {
         super();
         this.mcs = new MCSWolf();
         this.startAction(IDLE_STATE);
         canGotLaunched = true;
         canGotKnockDown = true;
         canGotFly = false;
         canGotKneeGroin = false;
         canGotStun = false;
      }
      
      override public function init(xml:XMLNpc) : *
      {
         initMCSFromXML(xml.mcs);
         mcs.changeScale(1.2,1.2);
         damage = xml.attack;
         defense = xml.defense;
         maxhp = xml.hp;
         level = xml.lvl;
         xp = level * 5 + 45;
         reset();
         if(mcs.y == StageManager.getGroundY())
         {
            this.startAction(WALK_STATE);
         }
         else
         {
            this.startAction(FALL_STATE);
         }
         reward = new XMLReward(xml.reward);
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
               case WOLF_DEATH:
                  deathAnimEnd();
                  break;
               case WOLF_LAUNCHEDEND:
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
                     startAnim(WOLF_DOWNED);
                  }
                  break;
               case WOLF_POUNCE_END:
                  if(getHP() <= 0)
                  {
                     this.die();
                  }
                  else
                  {
                     this.startAction(WALK_STATE);
                  }
                  break;
               case WOLF_DOWNEDTOIDLE:
               case WOLF_BITE:
               case WOLF_HOWL:
               case WOLF_DOWNEDTOIDLE:
                  this.startAction(WALK_STATE);
                  break;
               case WOLF_POUNCE_START:
                  if(int(Math.random() * 2) == 0)
                  {
                     startAnim(WOLF_POUNCE_MIDHIGH);
                  }
                  else
                  {
                     startAnim(WOLF_POUNCE_MID);
                  }
                  break;
               case WOLF_POUNCE_MID:
               case WOLF_POUNCE_MIDHIGH:
                  if(actionState != FALL_STATE)
                  {
                     startAnim(WOLF_POUNCE_END);
                  }
                  break;
               case WOLF_LAUNCHEDEND:
                  startAnim(WOLF_DOWNED);
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
         this.actionState = actionState;
         switch(actionState)
         {
            case IDLE_STATE:
               faceTarget();
               startAnim(WOLF_SNARL);
               this.idleCounter = 24;
               break;
            case WALK_STATE:
               this.destX = Math.random() * StageManager.getGameStageWidth();
               faceTarget();
               if(this.destX < posX)
               {
                  walkSpeed = -Math.random() * 2 - 4;
               }
               else
               {
                  walkSpeed = Math.random() * 2 + 4;
               }
               if((target.mcs.x - mcs.x) * walkSpeed < 0)
               {
                  startAnim(WOLF_WALKBACKWARDS);
                  walkSpeed /= 2;
               }
               else
               {
                  startAnim(WOLF_WALK);
               }
               break;
            case RUN_STATE:
               startAnim(WOLF_RUN);
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
               faceTarget();
               startAnim(WOLF_BITE);
               break;
            case CHARGING_STATE:
               faceTarget();
               startAnim(WOLF_POUNCE_START);
               break;
            case GOTLAUNCHED_STATE:
               startAnim(WOLF_LAUNCHED);
               break;
            case KNOCKDOWNED_STATE:
               actionState = DOWNED_STATE;
               startAnim(WOLF_LAUNCHEDEND);
               this.idleCounter = 6;
               break;
            case DOWNED_STATE:
               startAnim(WOLF_LAUNCHEDEND);
               this.idleCounter = 48;
               break;
            case FALL_STATE:
               startAnim(WOLF_POUNCE_MIDHIGH);
               break;
            case LAND_STATE:
               startAnim(WOLF_POUNCE_END);
               break;
            case DYING_STATE:
         }
      }
      
      override internal function doAction() : *
      {
         var dice:int = 0;
         var dist:int = 0;
         switch(actionState)
         {
            case IDLE_STATE:
               --this.idleCounter;
               if(this.idleCounter <= 0)
               {
                  this.idleCounter = 12;
                  faceTarget();
                  if(int(Math.random() * 3) < 2)
                  {
                     this.startAction(WALK_STATE);
                  }
               }
               break;
            case WALK_STATE:
               movePositionX(walkSpeed);
               if(Math.abs(this.destX - posX) < 10)
               {
                  dice = Math.random() * 3;
                  if(dice == 0)
                  {
                     this.startAction(IDLE_STATE);
                  }
                  else if(dice == 1)
                  {
                     this.startAction(WALK_STATE);
                  }
                  else
                  {
                     this.destX = Math.random() * StageManager.getGameStageWidth();
                     this.startAction(RUN_STATE);
                  }
               }
               dist = Math.abs(mcs.x - target.mcs.x);
               if(dist < 100 && dist > 50)
               {
                  this.startAction(ATTACK_STATE);
               }
               else if(dist >= 100 && dist < 250 && int(Math.random() * 3) == 0)
               {
                  this.startAction(CHARGING_STATE);
               }
               break;
            case RUN_STATE:
               movePositionX(walkSpeed);
               if(Math.abs(this.destX - posX) < 10)
               {
                  dice = Math.random() * 3;
                  if(dice == 0)
                  {
                     this.startAction(IDLE_STATE);
                  }
                  else if(dice == 1)
                  {
                     this.startAction(WALK_STATE);
                  }
                  else
                  {
                     this.destX = Math.random() * StageManager.getGameStageWidth();
                     this.startAction(RUN_STATE);
                  }
               }
               dist = Math.abs(mcs.x - target.mcs.x);
               if(dist < 100 && dist > 50)
               {
                  this.startAction(ATTACK_STATE);
               }
               else if(dist >= 100 && dist < 250 && int(Math.random() * 3) == 0)
               {
                  this.startAction(CHARGING_STATE);
               }
               break;
            case ATTACK_STATE:
               if(!GameEngine.isAdventureMode())
               {
                  target.checkHitObject(mcs.partList[MCSCharacter.PART_weapon],new Damage(damage,level));
               }
               break;
            case CHARGING_STATE:
               if(mcs.getAnim() == WOLF_POUNCE_MID || mcs.getAnim() == WOLF_POUNCE_MIDHIGH)
               {
                  if(mcs.isFacingRight())
                  {
                     movePositionX(15);
                  }
                  else
                  {
                     movePositionX(-15);
                  }
                  if(!GameEngine.isAdventureMode())
                  {
                     target.checkHitObject(mcs.partList[MCSCharacter.PART_head],new Damage(damage,level));
                     target.checkHitObject(mcs.partList[MCSCharacter.PART_r_hand],new Damage(damage,level));
                  }
               }
               break;
            case GOTLAUNCHED_STATE:
               this.doLaunched();
               break;
            case DOWNED_STATE:
               --this.idleCounter;
               if(this.idleCounter <= 0)
               {
                  startAnim(WOLF_DOWNEDTOIDLE);
               }
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
      
      override public function gotHit(target:MovieClip, damageObj:Damage) : Boolean
      {
         if(gotHitCounter > 0)
         {
            return false;
         }
         var damage:int = damageObj.damage;
         var fireDamage:int = damageObj.fireDamage;
         var waterDamage:int = damageObj.waterDamage;
         var windDamage:int = damageObj.windDamage;
         var earthDamage:int = damageObj.earthDamage;
         var launch:Boolean = damageObj.isLaunchAir();
         if(fireDamage < 0)
         {
            fireDamage = 0;
         }
         if(waterDamage < 0)
         {
            waterDamage = 0;
         }
         if(windDamage < 0)
         {
            windDamage = 0;
         }
         if(earthDamage < 0)
         {
            earthDamage = 0;
         }
         switch(target)
         {
            case mcs.partList[MCSCharacter.PART_head]:
            case mcs.partList[MCSCharacter.PART_neck]:
            case mcs.partList[MCSCharacter.PART_weapon]:
               damage *= 2;
               behead = true;
               gotHitFlag = true;
               break;
            default:
               gotHitFlag = true;
         }
         damage -= defense;
         if(damage < damageObj.getMinDamage())
         {
            damage = damageObj.getMinDamage();
         }
         if(getHP() > 0)
         {
            setHP(getHP() - (damage + fireDamage + windDamage + waterDamage + earthDamage));
            updateHealthBar();
            gotHitCounter = 12;
            if(getHP() > 0)
            {
               if((damageObj.isLaunchAir() || actionState == GOTLAUNCHED_STATE || actionState == FALL_STATE || actionState == JUMP_STATE) && !isDowned())
               {
                  gotLaunched();
               }
               else if(damageObj.isKnockDown())
               {
                  gotKnockDown();
               }
               if(damage > 0)
               {
                  ProjectileManager.createFloatingText(mcs.x,mcs.y - 100,damage.toString(),10027008);
               }
               if(fireDamage > 0)
               {
                  ProjectileManager.createFloatingText(mcs.x,mcs.y - 100,fireDamage.toString(),16737792);
               }
               if(windDamage > 0)
               {
                  ProjectileManager.createFloatingText(mcs.x,mcs.y - 100,windDamage.toString(),13421772);
               }
               if(waterDamage > 0)
               {
                  ProjectileManager.createFloatingText(mcs.x,mcs.y - 100,waterDamage.toString(),26367);
               }
               if(earthDamage > 0)
               {
                  ProjectileManager.createFloatingText(mcs.x,mcs.y - 100,earthDamage.toString(),6697728);
               }
            }
            SoundManager.instance.playHit();
         }
         return true;
      }
      
      override internal function doLaunched() : *
      {
         mcs.y += velY;
         movePositionX(velX);
         velY += 3;
         var groundY:* = StageManager.getGroundY();
         if(mcs.y >= groundY)
         {
            mcs.y = groundY;
            this.startAction(DOWNED_STATE);
         }
         else if(velX < 0 && getMapPosition() < 20 || velX > 0 && getMapPosition() > StageManager.getGameStageWidth() - 20)
         {
            gotLaunched();
            velX *= 2;
         }
      }
      
      override public function die() : *
      {
         SoundManager.instance.playDie();
         createLoot();
         rewardXP();
         if(actionState == GOTLAUNCHED_STATE)
         {
            dead = true;
            return;
         }
         if(isDowned())
         {
            actionState = DYING_STATE;
            startAnim(WOLF_DEATH);
            dead = true;
            return;
         }
         mcs.y = StageManager.getGroundY();
         actionState = DYING_STATE;
         startAnim(WOLF_DEATH);
         dead = true;
         mcs.hideHealthBar();
      }
      
      override public function redFreeze() : *
      {
         mcs.hideHealthBar();
         if(mcs.alpha < 1)
         {
            mcs.visible = false;
         }
         else
         {
            ColorCode.makeDark(mcs,-255);
         }
         if(actionState != GOTLAUNCHED_STATE && actionState != DYING_STATE && actionState != CHARGING_STATE)
         {
            animFrozen = true;
         }
      }
   }
}

