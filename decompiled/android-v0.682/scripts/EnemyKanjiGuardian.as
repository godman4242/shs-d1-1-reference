package
{
   public class EnemyKanjiGuardian extends NPC
   {
      
      internal var destX:int;
      
      internal var idleCounter:int;
      
      internal var charname:String;
      
      internal var stompCounter:int = 0;
      
      internal var throwCounter:int = 0;
      
      public function EnemyKanjiGuardian(mcs:MCSCharacter = null)
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
         this.charname = xml.name;
      }
      
      override public function setLevel(lvl:int) : *
      {
         var factor:Number = NaN;
         factor = lvl / level;
         level = lvl;
         damage *= factor;
         defense *= factor;
         maxhp *= factor;
         setHP(maxhp);
         updateHealthBar();
         xp = lvl * 5 + 45;
         mcs.setDisplayName(this.charname + " (" + lvl + ")",16777215);
         var playerHP:int = StatsManager.getPlayerStats(StatsManager.STAT_MAXHP) + StatsManager.findBonusStat(StatsManager.STAT_MAXHP);
         var playerDEF:int = StatsManager.getPlayerStats(StatsManager.STAT_DEFENSE) + StatsManager.findBonusStat(StatsManager.STAT_DEFENSE);
         var playerATK:int = StatsManager.getMinDamage() + StatsManager.getDamageRange() / 2;
         var playerLVL:int = StatsManager.getLevel();
         var lvldiff:int = lvl - playerLVL;
         var hitsToKillBoss:int = 5 + 8 + lvldiff;
         var hitsToKillPlayer:int = 16 - lvldiff;
         if(hitsToKillBoss <= 5)
         {
            hitsToKillBoss = 5;
         }
         if(hitsToKillPlayer <= 0)
         {
            hitsToKillPlayer = 1;
         }
         var playerhit:int = playerATK - defense;
         if(playerLVL <= 10 && playerhit < 1)
         {
            playerhit = 1;
         }
         else if(playerLVL <= 20 && playerhit < playerLVL / 8)
         {
            playerhit = playerLVL / 8;
         }
         else if(playerLVL <= 30 && playerhit < playerLVL / 6)
         {
            playerhit = playerLVL / 6;
         }
         else if(playerhit < playerLVL / 4)
         {
            playerhit = playerLVL / 4;
         }
         var bossHP:int = playerhit * hitsToKillBoss;
         if(bossHP > maxhp)
         {
            maxhp = bossHP;
            setHP(maxhp);
            updateHealthBar();
         }
         var bosshit:int = playerHP / hitsToKillPlayer;
         var bossATK:int = bosshit + playerDEF;
         if(bossATK > damage)
         {
            damage = bossATK;
         }
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
               case GUARDIAN_DEATH:
                  deathAnimEnd();
                  break;
               case GUARDIAN_SWINGDOWN:
                  startAnim(GUARDIAN_SWINGDOWNHIT);
                  break;
               case GUARDIAN_SWINGUP:
                  startAnim(GUARDIAN_SWINGUPHIT);
                  break;
               case GUARDIAN_STOMP:
                  startAnim(GUARDIAN_STOMPHIT);
                  break;
               case GUARDIAN_STOMPHIT:
                  startAnim(GUARDIAN_STOMPFREEZE);
                  break;
               case GUARDIAN_STOMPFREEZE:
                  startAnim(GUARDIAN_STOMPRETURN);
                  break;
               case GUARDIAN_SWINGUPHIT:
                  if(StageManager.isRedFreeze())
                  {
                     animFrozen = true;
                     return;
                  }
                  startAnim(GUARDIAN_SWINGUPEND);
                  break;
               case ENEMYLAND:
               case GUARDIAN_SWINGDOWNHIT:
               case GUARDIAN_STOMPRETURN:
               case GUARDIAN_SWINGUPEND:
               case DOWNSTAB_UP:
                  this.startAction(WALK_STATE);
                  break;
               case GUARDIAN_THROW:
                  startAnim(GUARDIAN_THROWRELEASE);
                  this.throwStone();
                  break;
               case GUARDIAN_THROWRELEASE:
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
         if(this.stompCounter > 0)
         {
            --this.stompCounter;
         }
         if(this.throwCounter > 0)
         {
            --this.throwCounter;
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
               startAnim(GUARDIAN_IDLE);
               break;
            case WALK_STATE:
               startAnim(GUARDIAN_WALK);
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
               startAnim(GUARDIAN_RUN);
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
               startAnim(GUARDIAN_SWINGDOWN);
               break;
            case SLASH_STATE:
               startAnim(GUARDIAN_SWINGUP);
               break;
            case WINDKICK_STATE:
               startAnim(GUARDIAN_STOMP);
               break;
            case THROW_STATE:
               startAnim(GUARDIAN_THROW);
               this.throwCounter = 240;
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
               if(this.stompCounter == 0)
               {
                  this.startAction(WALK_STATE);
               }
               break;
            case WALK_STATE:
               movePositionX(walkSpeed);
               dist = Math.abs(target.posX - posX);
               if(dist < 100)
               {
                  if(this.stompCounter == 0)
                  {
                     this.stompCounter = 48;
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
                  else
                  {
                     this.startAction(IDLE_STATE);
                  }
               }
               else if(dist > 400)
               {
                  if(this.throwCounter == 0)
                  {
                     this.startAction(THROW_STATE);
                  }
                  else
                  {
                     this.startAction(RUN_STATE);
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
                  if(this.stompCounter == 0)
                  {
                     this.stompCounter = 48;
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
                  else
                  {
                     this.startAction(IDLE_STATE);
                  }
               }
               else if(dist > 400)
               {
                  this.startAction(RUN_STATE);
               }
               else if(Math.abs(this.destX - posX) < 10)
               {
                  this.startAction(WALK_STATE);
               }
               break;
            case ATTACK_STATE:
               if(mcs.animation == GUARDIAN_SWINGDOWNHIT)
               {
                  target.checkHitObject(mcs.partList[MCSCharacter.PART_weapon],new Damage(damage,level));
               }
               break;
            case SLASH_STATE:
               if(mcs.animation == GUARDIAN_SWINGUPHIT)
               {
                  target.checkHitObject(mcs.partList[MCSCharacter.PART_weapon],new Damage(damage,level,Damage.LAUNCH_AIR));
               }
               break;
            case WINDKICK_STATE:
               if(mcs.animation == GUARDIAN_STOMPHIT)
               {
                  target.checkHitObject(mcs.partList[MCSCharacter.PART_r_foot],new Damage(damage,level,Damage.LAUNCH_KNOCKDOWN));
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
      
      override public function die() : *
      {
         SoundManager.instance.playDie();
         if(!GameEngine.isPlayback())
         {
            createLoot();
            rewardXP();
         }
         actionState = DYING_STATE;
         startAnim(GUARDIAN_DEATH);
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
         if(actionState != GOTLAUNCHED_STATE && actionState != DYING_STATE && actionState != FLY_STATE && mcs.animation != GUARDIAN_SWINGUPHIT)
         {
            animFrozen = true;
         }
      }
      
      internal function throwStone() : *
      {
         var fireX:int = mcs.x;
         var fireY:int = mcs.y - 100;
         var targetX:int = target.getMCS().x;
         var targetY:int = target.getMCS().y - 60;
         var velA:Number = Projectile.GRAVITY * Math.abs(targetX - fireX) / (0.866 / 3);
         velA = Math.sqrt(velA);
         var velXa:Number = velA * (0.866 / 3);
         var t:Number = Math.abs(targetX - fireX) / velXa;
         var velYa:Number = (targetY - fireY - 0.5 * Projectile.GRAVITY * t * t) / t;
         if(fireX > targetX)
         {
            velXa = -velXa;
         }
         velYa += Math.random() * 8 - 4;
         ProjectileManager.createProjectile(ProjectileManager.PROJ_BIGROCK,getMapPosition(),fireY,velXa,velYa,20,1,this);
      }
   }
}

