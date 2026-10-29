package
{
   import flash.display.MovieClip;
   
   public class EnemyZombie extends NPC
   {
      
      internal var walkType:int;
      
      internal var idleCounter:int;
      
      public function EnemyZombie(mcs:MCSCharacter = null)
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
         this.walkType = Math.random() * 4;
         canGotStun = false;
      }
      
      override public function init(xml:XMLNpc) : *
      {
         initMCSFromXML(xml.mcs);
         damage = xml.attack;
         defense = xml.defense;
         maxhp = xml.hp;
         level = xml.lvl;
         xp = level * 2 + 20;
         reset();
         if(mcs.y == StageManager.getGroundY())
         {
            this.startAction(WALK_STATE);
         }
         else
         {
            this.startAction(CLIMB_STATE);
            mcs.y = StageManager.getGroundY();
            getMCS().hideHealthBar();
         }
         reward = new XMLReward(xml.reward);
         STAT_FIREATK = xml.STAT_FIREATK;
         STAT_WINDATK = xml.STAT_WINDATK;
         STAT_WATERATK = xml.STAT_WATERATK;
         STAT_EARTHATK = xml.STAT_EARTHATK;
         STAT_FIREDEF = xml.STAT_FIREDEF;
         STAT_WINDDEF = xml.STAT_WINDDEF;
         STAT_WATERDEF = xml.STAT_WATERDEF;
         STAT_EARTHDEF = xml.STAT_EARTHDEF;
      }
      
      override public function update() : *
      {
         var dice:int = 0;
         var zdice:int = 0;
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
               case ENEMYDEATH:
               case DEATH_FORWARD:
               case ENEMYDEATHNOHEAD:
               case ENEMYDEATHNOHAND:
               case DEATHDOWNED:
               case DEATHINHALF:
               case ZOM_CRAWLDIE:
                  deathAnimEnd();
                  break;
               case ENEMYLAND:
               case ZOM_STUMBLE:
                  getMCS().showHealthBar();
                  this.startAction(WALK_STATE);
                  break;
               case ZOM_ATTACK:
               case ZOM_ATTACK2:
               case ZOM_ATTACK3:
                  this.startAction(WALK_STATE);
                  break;
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
                        zdice = Math.random() * 3;
                        if(zdice > 0)
                        {
                           startAnim(ZOM_GETUP);
                        }
                        else
                        {
                           startAnim(ZOM_DOWNEDTOCRAWL);
                           if(mcs.scaleX == 1)
                           {
                              movePositionX(-10);
                           }
                           else
                           {
                              movePositionX(10);
                           }
                        }
                     }
                     else
                     {
                        startAnim(GOTLAUNCHEDDOWNEDEND);
                     }
                  }
                  break;
               case GOTLAUNCHEDDOWNEDEND:
                  dice = Math.random() * 3;
                  if(dice > 0)
                  {
                     startAnim(ZOM_GETUP);
                  }
                  else
                  {
                     startAnim(ZOM_DOWNEDTOCRAWL);
                     if(mcs.scaleX == 1)
                     {
                        movePositionX(-10);
                     }
                     else
                     {
                        movePositionX(10);
                     }
                  }
                  break;
               case ZOM_GETUP:
                  mcs.moveHealthBarX(0);
                  if(mcs.scaleX == 1)
                  {
                     movePositionX(-50);
                  }
                  else
                  {
                     movePositionX(50);
                  }
                  this.startAction(IDLE_STATE);
                  break;
               case ZOM_DOWNEDTOCRAWL:
                  mcs.moveHealthBarX(0);
                  this.startAction(CRAWL_STATE);
                  break;
               case ZOM_CRAWLATTACK_START:
                  startAnim(ZOM_CRAWLATTACK);
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
                  break;
               case ZOM_OUTGROUND:
                  this.startAction(IDLE_STATE);
                  getMCS().showHealthBar();
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
               startAnim(ZOM_IDLE);
               this.idleCounter = 12;
               break;
            case WALK_STATE:
               if(this.walkType == 0)
               {
                  startAnim(ZOM_WALK);
               }
               else if(this.walkType == 1)
               {
                  startAnim(ZOM_WALK2);
               }
               else if(this.walkType == 2)
               {
                  startAnim(ZOM_WALK3);
               }
               else if(this.walkType == 3)
               {
                  this.startAction(RUN_STATE);
               }
               this.idleCounter = 24;
               break;
            case RUN_STATE:
               startAnim(ZOM_RUN);
               walkSpeed = 6 + Math.random() * 3;
               break;
            case ATTACK_STATE:
               dice = Math.random() * 3;
               if(dice == 0)
               {
                  startAnim(ZOM_ATTACK);
               }
               else if(dice == 1)
               {
                  startAnim(ZOM_ATTACK2);
               }
               else if(dice == 2)
               {
                  startAnim(ZOM_ATTACK3);
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
            case FLINCH_STATE:
               startAnim(ZOM_STUMBLE);
               break;
            case CRAWL_STATE:
               startAnim(ZOM_CRAWL);
               walkSpeed = 1 + Math.random() * 2;
               break;
            case CRAWLATTACK_STATE:
               startAnim(ZOM_CRAWLATTACK_START);
               break;
            case CLIMB_STATE:
               startAnim(ZOM_OUTGROUND);
         }
      }
      
      override internal function doAction() : *
      {
         var playerX:int = 0;
         var playerY:int = 0;
         switch(actionState)
         {
            case IDLE_STATE:
               --this.idleCounter;
               if(this.idleCounter <= 0)
               {
                  this.startAction(WALK_STATE);
               }
               break;
            case WALK_STATE:
               playerX = target.mcs.x;
               playerY = target.mcs.y;
               --this.idleCounter;
               if(playerX < mcs.x)
               {
                  mcs.faceLeft();
                  if(mcs.x - playerX < 80 && mcs.y - playerY < 80)
                  {
                     this.startAction(ATTACK_STATE);
                  }
                  else if(this.idleCounter <= 0)
                  {
                     if(int(Math.random() * 5) == 0)
                     {
                        this.startAction(IDLE_STATE);
                     }
                     else
                     {
                        this.idleCounter = 24;
                     }
                  }
               }
               else
               {
                  mcs.faceRight();
                  if(playerX - mcs.x < 80 && mcs.y - playerY < 80)
                  {
                     this.startAction(ATTACK_STATE);
                  }
                  else if(this.idleCounter <= 0)
                  {
                     if(int(Math.random() * 5) == 0)
                     {
                        this.startAction(IDLE_STATE);
                     }
                     else
                     {
                        this.idleCounter = 24;
                     }
                  }
               }
               break;
            case RUN_STATE:
               playerX = target.mcs.x;
               playerY = target.mcs.y;
               if(playerX < mcs.x)
               {
                  mcs.faceLeft();
                  if(mcs.x - playerX < 80 && mcs.y - playerY < 80)
                  {
                     this.startAction(ATTACK_STATE);
                  }
                  else
                  {
                     movePositionX(-walkSpeed);
                  }
               }
               else
               {
                  mcs.faceRight();
                  if(playerX - mcs.x < 80 && mcs.y - playerY < 80)
                  {
                     this.startAction(ATTACK_STATE);
                  }
                  else
                  {
                     movePositionX(walkSpeed);
                  }
               }
               break;
            case ATTACK_STATE:
               target.checkHitObject(mcs.partList[MCSCharacter.PART_r_hand],new Damage(damage,level));
               break;
            case GOTLAUNCHED_STATE:
               doLaunched();
               break;
            case FLY_STATE:
               doFly();
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
               break;
            case CRAWL_STATE:
               playerX = target.mcs.x;
               playerY = target.mcs.y;
               if(playerX < mcs.x)
               {
                  mcs.faceLeft();
                  if(mcs.x - playerX < 50 && mcs.y - playerY < 50)
                  {
                     this.startAction(CRAWLATTACK_STATE);
                  }
                  else
                  {
                     movePositionX(-walkSpeed);
                  }
               }
               else
               {
                  mcs.faceRight();
                  if(playerX - mcs.x < 50 && mcs.y - playerY < 50)
                  {
                     this.startAction(CRAWLATTACK_STATE);
                  }
                  else
                  {
                     movePositionX(walkSpeed);
                  }
               }
               break;
            case CRAWLATTACK_STATE:
               if(Math.abs(target.mcs.x - mcs.x) > 50)
               {
                  this.startAction(CRAWL_STATE);
               }
               else if(getAnim() == ZOM_CRAWLATTACK)
               {
                  target.checkHitObject(mcs.partList[MCSCharacter.PART_head],new Damage(damage,level));
               }
         }
      }
      
      override public function gotHit(target:MovieClip, damageObj:Damage) : Boolean
      {
         var waterDamage:int = 0;
         var windDamage:int = 0;
         if(gotHitCounter > 0)
         {
            return false;
         }
         var damage:int = damageObj.damage;
         var fireDamage:int = damageObj.fireDamage - STAT_FIREDEF;
         waterDamage = damageObj.waterDamage - STAT_WATERDEF;
         windDamage = damageObj.windDamage - STAT_WINDDEF;
         var earthDamage:int = damageObj.earthDamage - STAT_EARTHDEF;
         if(damageObj.fireDamage > 0 && fireDamage < 1)
         {
            fireDamage = 1;
         }
         else if(fireDamage < 0)
         {
            fireDamage = 0;
         }
         if(damageObj.waterDamage > 0 && waterDamage < 1)
         {
            waterDamage = 1;
         }
         else if(waterDamage < 0)
         {
            waterDamage = 0;
         }
         if(damageObj.windDamage > 0 && windDamage < 1)
         {
            windDamage = 1;
         }
         else if(windDamage < 0)
         {
            windDamage = 0;
         }
         if(damageObj.earthDamage > 0 && earthDamage < 1)
         {
            earthDamage = 1;
         }
         else if(earthDamage < 0)
         {
            earthDamage = 0;
         }
         switch(target)
         {
            case mcs.partList[MCSCharacter.PART_hat]:
            case mcs.partList[MCSCharacter.PART_head]:
            case mcs.partList[MCSCharacter.PART_neck]:
               behead = true;
               gotHitFlag = true;
               break;
            case mcs.partList[MCSCharacter.PART_weapon]:
               gotHitFlag = false;
               damage = 0;
               return false;
            default:
               gotHitFlag = true;
         }
         if(getHP() > 0)
         {
            damage -= defense;
            if(damage < damageObj.getMinDamage())
            {
               damage = damageObj.getMinDamage();
            }
            if(!behead)
            {
               damage /= 2;
            }
            setHP(getHP() - (damage + fireDamage + windDamage + waterDamage + earthDamage));
            updateHealthBar();
            gotHitCounter = 12;
            if(getHP() > 0)
            {
               behead = false;
               if((damageObj.isLaunchAir() || actionState == GOTLAUNCHED_STATE || actionState == FALL_STATE || actionState == JUMP_STATE) && !this.isDowned())
               {
                  gotLaunched();
               }
               else if(damageObj.isKnockDown())
               {
                  gotKnockDown();
               }
               else if(damageObj.isFly())
               {
                  gotFly(damageObj.flyVelX,damageObj.flyVelY);
               }
               else if(damageObj.isFlyAway())
               {
                  gotFlyAway(damageObj.flyVelX,damageObj.flyVelY);
               }
               else if(!this.isDowned() && !isAirborne())
               {
                  this.startAction(FLINCH_STATE);
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
      
      override public function die() : *
      {
         var dice:int = 0;
         var head:MovieClip = null;
         SoundManager.instance.playDie();
         if(!GameEngine.isPlayback())
         {
            createLoot();
            rewardXP();
         }
         if(actionState == CRAWL_STATE || actionState == CRAWLATTACK_STATE)
         {
            startAnim(ZOM_CRAWLDIE);
            actionState = DYING_STATE;
            dead = true;
            mcs.hideHealthBar();
            return;
         }
         if(actionState == GOTLAUNCHED_STATE)
         {
            dead = true;
            return;
         }
         if(this.isDowned())
         {
            actionState = DYING_STATE;
            startAnim(DEATHDOWNED);
            if(!StatsManager.censored)
            {
               bloodEmitter = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_torso),StageManager.getGameStageCanvas(),90);
               bloodEmitter.setAngleVariance(15);
            }
            dead = true;
            return;
         }
         mcs.y = StageManager.getGroundY();
         actionState = DYING_STATE;
         if(Math.random() * 2 < 1)
         {
            mcs.scaleX = -mcs.scaleX;
         }
         if(!StatsManager.censored && fatal)
         {
            if(behead)
            {
               startAnim(ENEMYDEATHNOHEAD);
               head = mcs.getPart(MCSCharacter.PART_head);
               dice = Math.random() * 3;
               if(dice == 0)
               {
                  bloodEmitter = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_neck),StageManager.getGameStageCanvas(),130);
               }
               else if(dice == 1)
               {
                  bloodEmitter2 = ParticleSystemManager.getInstance().createEmitter(0,head,StageManager.getGameStageCanvas(),180);
               }
               else
               {
                  bloodEmitter2 = ParticleSystemManager.getInstance().createEmitter(0,head,StageManager.getGameStageCanvas(),180);
                  bloodEmitter = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_neck),StageManager.getGameStageCanvas(),130);
               }
               if(bloodEmitter2 != null)
               {
                  bloodEmitter2.setVel(4);
                  bloodEmitter2.setNumber(10);
               }
            }
            else
            {
               dice = Math.random() * 6;
               if(dice <= 1)
               {
                  startAnim(ENEMYDEATH);
                  bloodEmitter = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_torso),StageManager.getGameStageCanvas(),80);
                  bloodEmitter.setAngleVariance(15);
               }
               else if(dice == 2)
               {
                  startAnim(DEATH_FORWARD);
                  bloodEmitter = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_neck),StageManager.getGameStageCanvas(),-90,0,5);
               }
               else if(dice == 3)
               {
                  startAnim(ENEMYDEATHNOHAND);
                  dice = Math.random() * 3;
                  if(dice == 0)
                  {
                     bloodEmitter = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_neck),StageManager.getGameStageCanvas(),60);
                  }
                  else if(dice == 1)
                  {
                     bloodEmitter2 = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_l_uparm),StageManager.getGameStageCanvas(),180);
                  }
                  else
                  {
                     bloodEmitter = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_neck),StageManager.getGameStageCanvas(),60);
                     bloodEmitter2 = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_l_uparm),StageManager.getGameStageCanvas(),180);
                  }
                  if(bloodEmitter2 != null)
                  {
                     bloodEmitter2.setVel(5);
                  }
               }
               else if(dice == 4)
               {
                  startAnim(DEATHINHALF);
                  dice = Math.random() * 3;
                  if(dice == 0)
                  {
                     bloodEmitter = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_stomach),StageManager.getGameStageCanvas(),180);
                  }
                  else if(dice == 1)
                  {
                     bloodEmitter = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_pelvic),StageManager.getGameStageCanvas(),120);
                  }
                  else
                  {
                     bloodEmitter = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_stomach),StageManager.getGameStageCanvas(),180);
                     bloodEmitter2 = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_pelvic),StageManager.getGameStageCanvas(),120);
                  }
               }
               else
               {
                  startAnim(ENEMYDEATH);
                  bloodEmitter = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_stomach),StageManager.getGameStageCanvas(),80);
                  bloodEmitter.setAngleVariance(15);
                  mcs.hair.visible = true;
                  mcs.hatHair.visible = false;
                  mcs.createFlyingWeapon();
                  mcs.createFlyingHat();
               }
            }
         }
         else if(behead)
         {
            startAnim(ENEMYDEATH);
            mcs.hair.visible = true;
            mcs.hatHair.visible = false;
            mcs.createFlyingHat();
         }
         else
         {
            dice = Math.random() * 4;
            if(dice <= 1)
            {
               startAnim(ENEMYDEATH);
            }
            else if(dice == 2)
            {
               startAnim(DEATH_FORWARD);
            }
            else
            {
               startAnim(ENEMYDEATH);
               mcs.createFlyingWeapon();
            }
         }
         dead = true;
         mcs.hideHealthBar();
      }
      
      override public function isDowned() : Boolean
      {
         return actionState == DOWNED_STATE || actionState == KNOCKDOWNED_STATE || actionState == FLY_STATE || actionState == VICTIM_STATE || actionState == CRAWL_STATE || actionState == CRAWLATTACK_STATE;
      }
   }
}

