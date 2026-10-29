package
{
   import flash.display.MovieClip;
   
   public class EnemySpearElite extends NPC
   {
      
      internal var spearSpinCoolDown:int = 0;
      
      internal var spearFlurryCoolDown:int = 0;
      
      internal var spearLaunchCoolDown:int = 0;
      
      internal var hasBowed:Boolean = false;
      
      internal var isBoss:Boolean = false;
      
      public function EnemySpearElite(mcs:MCSCharacter = null, isBoss:Boolean = false)
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
         this.isBoss = isBoss;
      }
      
      override public function setLevel(lvl:int) : *
      {
         var factor:Number = NaN;
         var namecolor:int = 0;
         var playerHP:int = 0;
         var playerDEF:int = 0;
         var playerATK:int = 0;
         var playerLVL:int = 0;
         var lvldiff:int = 0;
         var hitsToKillBoss:int = 0;
         var hitsToKillPlayer:int = 0;
         var playerhit:int = 0;
         var bossHP:int = 0;
         var bosshit:int = 0;
         var bossATK:int = 0;
         if(!this.isBoss)
         {
            super.setLevel(lvl);
         }
         else
         {
            factor = lvl / level;
            level = lvl;
            damage *= factor;
            defense *= factor;
            maxhp *= factor;
            setHP(maxhp);
            updateHealthBar();
            if(this.isBoss)
            {
               xp = lvl * 5 + 45;
               namecolor = 16777215;
            }
            else
            {
               xp = lvl * 2 + 20;
            }
            if(this.isBoss)
            {
               factor = lvl / level;
               level = lvl;
               damage *= factor;
               defense *= factor;
               maxhp *= factor;
               setHP(maxhp);
               updateHealthBar();
               xp = lvl * 5 + 45;
               playerHP = StatsManager.getPlayerStats(StatsManager.STAT_MAXHP) + StatsManager.findBonusStat(StatsManager.STAT_MAXHP);
               playerDEF = StatsManager.getPlayerStats(StatsManager.STAT_DEFENSE) + StatsManager.findBonusStat(StatsManager.STAT_DEFENSE);
               playerATK = StatsManager.getMinDamage() + StatsManager.getDamageRange() / 2;
               playerLVL = StatsManager.getLevel();
               lvldiff = lvl - playerLVL;
               hitsToKillBoss = 10 + lvldiff;
               hitsToKillPlayer = 18 - lvldiff;
               if(hitsToKillBoss <= 3)
               {
                  hitsToKillBoss = 3;
               }
               if(hitsToKillPlayer <= 0)
               {
                  hitsToKillPlayer = 1;
               }
               playerhit = playerATK - defense;
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
               bossHP = playerhit * hitsToKillBoss;
               if(bossHP > maxhp)
               {
                  maxhp = bossHP;
                  setHP(maxhp);
                  updateHealthBar();
               }
               bosshit = playerHP / hitsToKillPlayer;
               bossATK = bosshit + playerDEF;
               if(bossATK > damage)
               {
                  damage = bossATK;
               }
               if(lvl <= 5)
               {
                  damage = 1;
                  defense = 1;
               }
            }
         }
      }
      
      override public function update() : *
      {
         if(mcs == null || animFrozen)
         {
            return;
         }
         if(!dead && (target == null || target.isDead()))
         {
            target = NPCManager.getNearestEnemy(getMapPosition(),!isFriendly);
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
               case SPEARLAUNCH:
               case ENEMYLAND:
               case SPEARSTABEND:
               case DOWNSTAB_UP:
               case SPEARLUNGEEND:
               case SPEARFLURRY:
               case SPEARKICKEND:
               case SPEARSWING:
               case SPEARSPINEND:
                  this.startAction(WALK_STATE);
                  this.AI();
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
                     if(getHP() > 0 && !StageManager.isRedFreeze())
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
                  break;
               case SPEARSTABSTART:
                  if(target != null)
                  {
                     if(target.checkHitObject(mcs.partList[MCSCharacter.PART_weapon],new Damage(damage,level)) && isFriendly)
                     {
                        NPCManager.externalRedFreezeCheck();
                     }
                  }
                  startAnim(SPEARSTABEND);
                  break;
               case DOWNSTAB:
                  if(target != null && target.isDowned())
                  {
                     if(target.checkHitObject(mcs.partList[MCSCharacter.PART_weapon],new Damage(damage * 2,level)) && isFriendly)
                     {
                        NPCManager.externalRedFreezeCheck();
                     }
                  }
                  startAnim(DOWNSTAB_UP);
                  break;
               case SPEARLUNGESTART:
                  startAnim(SPEARLUNGEMID);
                  break;
               case SPEARLUNGEMID:
                  startAnim(SPEARLUNGEEND);
                  break;
               case SPEARKICKSTART:
                  startAnim(SPEARKICKMID);
                  break;
               case SPEARKICKMID:
                  startAnim(SPEARKICKMID2);
                  break;
               case SPEARKICKMID2:
                  startAnim(SPEARKICKEND);
                  break;
               case SPEARSPINSTART:
                  startAnim(SPEARSPINMID);
                  break;
               case SPEARSPINMID:
                  startAnim(SPEARSPINEND);
            }
         }
         this.doAction();
         if(gotHitCounter > 0)
         {
            --gotHitCounter;
         }
         if(this.spearSpinCoolDown > 0)
         {
            --this.spearSpinCoolDown;
         }
         if(this.spearFlurryCoolDown > 0)
         {
            --this.spearFlurryCoolDown;
         }
         if(this.spearLaunchCoolDown > 0)
         {
            --this.spearLaunchCoolDown;
         }
      }
      
      override internal function startAction(actionState:int) : *
      {
         this.actionState = actionState;
         switch(actionState)
         {
            case IDLE_STATE:
               startAnim(SPEARIDLE);
               break;
            case WALK_STATE:
               walkSpeed = Math.random() * 2 + 3;
               startAnim(SPEARRELAXWALK);
               break;
            case ATTACK_STATE:
            case DOSKILL_STATE:
               faceTarget();
               break;
            case RUN_STATE:
               startAnim(SPEARCHARGE);
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
            case STAB_STATE:
               faceTarget();
               startAnim(DOWNSTAB);
         }
      }
      
      override internal function doAction() : *
      {
         var playerX:int = 0;
         var playerY:int = 0;
         if(target == null || checkAITrigger())
         {
            this.AI();
         }
         switch(actionState)
         {
            case IDLE_STATE:
               if(target != null && !target.isAirborne())
               {
                  this.startAction(WALK_STATE);
               }
               break;
            case WALK_STATE:
               if(target == null || target.isAirborne())
               {
                  this.startAction(IDLE_STATE);
                  return;
               }
               playerX = target.mcs.x;
               playerY = target.mcs.y;
               if(playerX < mcs.x)
               {
                  mcs.faceLeft();
                  movePositionX(-walkSpeed);
               }
               else
               {
                  mcs.faceRight();
                  movePositionX(walkSpeed);
               }
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
               break;
            case ATTACK_STATE:
               if(getAnim() == SPEARLAUNCH)
               {
                  if(target != null && target.checkHitObject(mcs.partList[MCSCharacter.PART_weapon],new Damage(damage,level,Damage.LAUNCH_AIR)) && isFriendly)
                  {
                     NPCManager.externalRedFreezeCheck();
                  }
               }
               else if(getAnim() == SPEARSPINMID)
               {
                  if(target != null && target.checkHitObject(mcs.partList[MCSCharacter.PART_weapon],new Damage(damage,level,Damage.LAUNCH_KNOCKDOWN)) && isFriendly)
                  {
                     NPCManager.externalRedFreezeCheck();
                  }
               }
               else if(getAnim() == SPEARLUNGEMID)
               {
                  if(mcs.isFacingRight())
                  {
                     movePositionX(20);
                  }
                  else
                  {
                     movePositionX(-20);
                  }
                  if(target != null && target.checkHitObject(mcs.partList[MCSCharacter.PART_weapon],new Damage(damage,level)) && isFriendly)
                  {
                     NPCManager.externalRedFreezeCheck();
                  }
               }
               else if(getAnim() == SPEARFLURRY || getAnim() == SPEARSWING)
               {
                  if(target != null && target.checkHitObject(mcs.partList[MCSCharacter.PART_weapon],new Damage(damage,level)) && isFriendly)
                  {
                     NPCManager.externalRedFreezeCheck();
                  }
               }
               break;
            case DOSKILL_STATE:
               if(getAnim() == SPEARKICKMID)
               {
                  if(mcs.isFacingRight())
                  {
                     movePositionX(20);
                  }
                  else
                  {
                     movePositionX(-20);
                  }
                  if(target != null && target.checkHitObject(mcs.partList[MCSCharacter.PART_l_foot],new Damage(damage,level,Damage.LAUNCH_KNOCKDOWN)) && isFriendly)
                  {
                     NPCManager.externalRedFreezeCheck();
                  }
               }
               else if(getAnim() == SPEARKICKMID2)
               {
                  if(mcs.isFacingRight())
                  {
                     movePositionX(10);
                  }
                  else
                  {
                     movePositionX(-10);
                  }
               }
         }
      }
      
      override public function checkHitObject(thing:MovieClip, damage:Damage, checkByAttacker:Boolean = false) : Boolean
      {
         var mc:MovieClip = null;
         var projectile:Projectile = null;
         var max:int = mcs.getPartListLength();
         var partList:Vector.<MovieClip> = mcs.partList;
         var i:* = int(max - 1);
         while(i >= 0 && !gotHitFlag)
         {
            mc = partList[i];
            if(mc.hitTestObject(thing))
            {
               if(mc == mcs.partList[MCSCharacter.PART_weapon] && thing is Projectile)
               {
                  projectile = Projectile(thing);
                  if(projectile.canBreak())
                  {
                     Projectile(thing).doBreak();
                     return false;
                  }
               }
               if(gotHit(mc,damage))
               {
                  if(isGoingToDie())
                  {
                     NPCManager.externalRedFreezeCheck();
                  }
                  return true;
               }
               return false;
            }
            i--;
         }
         gotHitFlag = false;
         return false;
      }
      
      internal function AI() : *
      {
         var dice:int = 0;
         var absDistanceAway:int = 0;
         if(animFrozen || dead || isDowned() || isAirborne() || actionState == GOTLAUNCHED_STATE)
         {
            return;
         }
         var newtarget:NPC = NPCManager.getNearestEnemy(getMapPosition(),!isFriendly);
         if(newtarget != null)
         {
            target = newtarget;
         }
         if(target == null)
         {
            return;
         }
         if(StageManager.isPeaceful())
         {
            if(!this.hasBowed && GameEngine.isDuelMode())
            {
               this.hasBowed = true;
               this.startAction(POSE_STATE);
               startAnim(MCSActor.BOW2);
            }
            if(actionState == POSE_STATE && Math.abs(target.getMapPosition() - getMapPosition()) < 100)
            {
               this.startAction(WALK_STATE);
            }
            return;
         }
         if(actionState == POSE_STATE)
         {
            this.startAction(WALK_STATE);
         }
         if(actionState == WALK_STATE)
         {
            absDistanceAway = Math.abs(mcs.x - target.mcs.x);
            if(absDistanceAway < 50 && target.isDowned())
            {
               this.startAction(STAB_STATE);
            }
            else if(absDistanceAway < 100)
            {
               dice = Math.random() * 4;
               if(dice == 1 && this.spearSpinCoolDown == 0)
               {
                  this.startAction(ATTACK_STATE);
                  startAnim(SPEARSPINSTART);
                  this.spearSpinCoolDown = 5 * 24;
               }
               else if(dice == 2 && this.spearFlurryCoolDown == 0)
               {
                  this.startAction(ATTACK_STATE);
                  startAnim(SPEARFLURRY);
                  this.spearSpinCoolDown = 5 * 24;
               }
               else if(dice == 3 && this.spearLaunchCoolDown == 0)
               {
                  this.startAction(ATTACK_STATE);
                  startAnim(SPEARLAUNCH);
                  this.spearSpinCoolDown = 5 * 24;
               }
               else
               {
                  this.startAction(ATTACK_STATE);
                  startAnim(SPEARSTABSTART);
               }
            }
            else if(absDistanceAway < 200)
            {
               dice = Math.random() * 5;
               if(dice == 0)
               {
                  this.startAction(ATTACK_STATE);
                  startAnim(SPEARLUNGESTART);
               }
               else if(dice == 1)
               {
                  this.startAction(ATTACK_STATE);
                  startAnim(SPEARSWING);
               }
               else if(dice == 2)
               {
                  this.startAction(DOSKILL_STATE);
                  startAnim(SPEARKICKSTART);
               }
            }
         }
      }
   }
}

