package
{
   import flash.display.MovieClip;
   
   public class EnemyOgre extends NPC
   {
      
      internal var destX:int;
      
      internal var idleCounter:int;
      
      internal var doChase:Boolean = false;
      
      internal var onAlert:Boolean = false;
      
      public function EnemyOgre(mcs:MCSCharacter = null, doChase:Boolean = false)
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
         this.doChase = true;
         this.mcs.healthBar.y = -200;
         this.mcs.displayName.y = -200;
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
         this.startAction(WALK_STATE);
         reward = new XMLReward(xml.reward);
      }
      
      override public function setLevel(lvl:int) : *
      {
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
               case OGRE_DEATH:
                  deathAnimEnd();
                  break;
               case OGRE_SWINGDOWN:
                  startAnim(OGRE_SWINGDOWNHIT);
                  break;
               case OGRE_SWINGUP:
                  startAnim(OGRE_SWINGUPHIT);
                  break;
               case OGRE_STOMP:
                  startAnim(OGRE_STOMPHIT);
                  break;
               case OGRE_SWINGUPHIT:
                  if(StageManager.isRedFreeze())
                  {
                     animFrozen = true;
                     return;
                  }
                  startAnim(OGRE_SWINGUPEND);
                  break;
               case ENEMYLAND:
               case OGRE_SWINGDOWNHIT:
               case OGRE_STOMPHIT:
               case OGRE_SWINGUPEND:
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
            }
         }
         if(target == null || target.isDead())
         {
            target = NPCManager.getNearestEnemy(getMapPosition(),true);
            if(target == null)
            {
               return;
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
               startAnim(OGRE_IDLE);
               this.idleCounter = 48;
               break;
            case WALK_STATE:
               startAnim(OGRE_WALK);
               this.destX = target.posX;
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
               startAnim(OGRE_RUN);
               if(walkSpeed < 0)
               {
                  walkSpeed = -12;
               }
               else
               {
                  walkSpeed = 12;
               }
               break;
            case ATTACK_STATE:
               startAnim(OGRE_SWINGDOWN);
               break;
            case SLASH_STATE:
               startAnim(OGRE_SWINGUP);
               break;
            case WINDKICK_STATE:
               startAnim(OGRE_STOMP);
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
            case REDFREEZE_STATE:
               animFrozen = true;
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
                  this.idleCounter = 24;
                  if(!CutsceneManager.getInstance().isShowing() && int(Math.random() * 3) == 1)
                  {
                     this.startAction(WALK_STATE);
                  }
                  else
                  {
                     startAnim(OGRE_FIDGET);
                  }
               }
               break;
            case WALK_STATE:
               movePositionX(walkSpeed);
               dist = Math.abs(target.posX - posX);
               if(dist < 100)
               {
                  if(dist < 40)
                  {
                     this.startAction(WINDKICK_STATE);
                  }
                  else
                  {
                     dice = Math.random() * 2;
                     if(dice == 0)
                     {
                        this.startAction(ATTACK_STATE);
                     }
                     else if(dice == 1)
                     {
                        this.startAction(SLASH_STATE);
                     }
                  }
               }
               else if(Math.abs(this.destX - posX) < 10)
               {
                  this.startAction(WALK_STATE);
               }
               break;
            case RUN_STATE:
               movePositionX(walkSpeed);
               dist = Math.abs(target.posX - posX);
               if(dist < 100)
               {
                  if(dist < 50)
                  {
                     this.startAction(WINDKICK_STATE);
                  }
                  else
                  {
                     dice = Math.random() * 2;
                     if(dice == 0)
                     {
                        this.startAction(ATTACK_STATE);
                     }
                     else if(dice == 1)
                     {
                        this.startAction(SLASH_STATE);
                     }
                  }
               }
               break;
            case ATTACK_STATE:
               if(mcs.animation == OGRE_SWINGDOWNHIT)
               {
                  target.checkHitObject(mcs.partList[MCSCharacter.PART_weapon],new Damage(damage,0));
               }
               break;
            case SLASH_STATE:
               if(mcs.animation == OGRE_SWINGUPHIT)
               {
                  target.checkHitObject(mcs.partList[MCSCharacter.PART_weapon],new Damage(damage,0,Damage.LAUNCH_AIR));
               }
               break;
            case WINDKICK_STATE:
               if(mcs.animation == OGRE_STOMPHIT)
               {
                  target.checkHitObject(mcs.partList[MCSCharacter.PART_r_foot],new Damage(damage,0,Damage.LAUNCH_KNOCKDOWN));
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
      
      override public function gotHit(target:MovieClip, damageObj:Damage) : Boolean
      {
         if(gotHitCounter > 0)
         {
            return false;
         }
         switch(target)
         {
            case mcs.partList[MCSCharacter.PART_weapon]:
               gotHitFlag = false;
               damageObj.damage = 0;
               return false;
            default:
               gotHitFlag = true;
               if(getHP() > 0)
               {
                  setHP(getHP() - 1);
                  updateHealthBar();
                  gotHitCounter = 12;
                  SoundManager.instance.playHit();
                  ProjectileManager.createFloatingText(mcs.x,mcs.y - 100,"1",10027008);
               }
               return true;
         }
      }
      
      override public function die() : *
      {
         SoundManager.instance.playDie();
         if(!GameEngine.isPlayback())
         {
            createLoot();
            rewardXP();
         }
         actionState = DYING_STATE;
         startAnim(OGRE_DEATH);
         bloodEmitter = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_torso),StageManager.getGameStageCanvas(),80);
         bloodEmitter.setAngleVariance(15);
         dead = true;
         mcs.hideHealthBar();
         StatsManager.reportAchievementStat(60019,1);
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
         if(actionState != GOTLAUNCHED_STATE && actionState != DYING_STATE && actionState != FLY_STATE && mcs.animation != OGRE_SWINGUPHIT)
         {
            animFrozen = true;
         }
      }
   }
}

