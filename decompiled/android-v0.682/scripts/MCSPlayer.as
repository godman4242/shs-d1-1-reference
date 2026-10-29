package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class MCSPlayer extends NPC
   {
      
      internal static var standingRange:int = 50;
      
      internal static var jumpThreshhold:int = 100;
      
      internal static var runSpeed:int = 12;
      
      internal static var lightSlashSpeed:int = 50;
      
      internal static var balancedSlashSpeed:int = 40;
      
      internal static var heavySlashSpeed:int = 30;
      
      public static var playerScrollMin:int = 350;
      
      public static var playerScrollMax:int = 450;
      
      internal static var gravity:int = 3;
      
      internal static var LIGHT_STANCE:int = 0;
      
      internal static var BALANCED_STANCE:int = 1;
      
      internal static var HEAVY_STANCE:int = 2;
      
      internal static var DUAL_STANCE:int = 3;
      
      internal static var REVERSED_STANCE:int = 4;
      
      internal static var HOR_SLASH:int = 0;
      
      internal static var JUMP_SLASH:int = 1;
      
      internal static var DROP_SLASH:int = 2;
      
      internal static var UP_SLASH:int = 3;
      
      internal static var AIR_SLASH:int = 4;
      
      internal static var LAUNCH_SLASH:int = 5;
      
      internal static var DOWNSTAB_SLASH:int = 6;
      
      internal static var HOR_SLASHDOWN:int = 7;
      
      internal static var HOR_SLASHUP:int = 8;
      
      internal var slashArray:Vector.<Point> = new Vector.<Point>();
      
      internal var slashArrayBuffer:Vector.<Point> = new Vector.<Point>();
      
      internal var slashCommitted:Boolean = false;
      
      internal var hasSlash:Boolean = false;
      
      internal var hasSlashBuffer:Boolean = false;
      
      internal var destX:int;
      
      internal var destY:int;
      
      internal var minDamage:int;
      
      internal var damageRange:int;
      
      internal var slashUsage:int;
      
      internal var slashDamage:int;
      
      internal var doShunpo:Boolean = false;
      
      internal var stance:int;
      
      internal var STAT_CRITICALDMG:int;
      
      internal var STAT_PIERCINGDMG:int;
      
      internal var slashType:int;
      
      internal var maxchi:int;
      
      internal var chi:int;
      
      internal var reload:int;
      
      internal var maxreload:int;
      
      internal var tempreload:int;
      
      internal var slashLength:int = 0;
      
      internal var controlledBy:int = 0;
      
      internal var nid:String = "";
      
      internal var speechCounter:int = -1;
      
      internal var baseReload:int = 48;
      
      internal var baseSlashLength:int = 10;
      
      internal var lightMastery:int = 0;
      
      internal var balancedMastery:int = 0;
      
      internal var heavyMastery:int = 0;
      
      internal var STAT_ATK:int = 0;
      
      internal var canLaunch:Boolean = false;
      
      internal var canStab:Boolean = false;
      
      internal var canFlipUp:Boolean = false;
      
      internal var canSeeSlash:Boolean = false;
      
      internal var canAirCombo:Boolean = false;
      
      internal var canDeflect:Boolean = false;
      
      internal var skillList:Vector.<IntStat>;
      
      internal var autoSlash:Boolean = false;
      
      internal var chargingTime:int;
      
      internal var chargingFx:Projectile = null;
      
      internal var invisCounter:int;
      
      internal var logsubCounter:int;
      
      internal var cloneIndex:int = 0;
      
      internal var logIcon:MovieClip = null;
      
      internal var launchCount:int = 0;
      
      internal var bullChargeTime:int;
      
      internal var inputArray:Vector.<Point> = new Vector.<Point>();
      
      internal var doReload:int = -1;
      
      public function MCSPlayer(mcs:MCSCharacter = null)
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
         this.startAction(IDLE_STATE);
         aiCounterMax = 12;
      }
      
      public function getChi() : int
      {
         return this.chi / StatsManager.multiplier;
      }
      
      public function setChi(val:int) : *
      {
         this.chi = val * StatsManager.multiplier;
         if(this.controlledBy == 0)
         {
            BattleUI.instance.checkSkillDisabled();
         }
      }
      
      public function initPlayer(controlledBy:int, hp:int, maxhp:int, chi:int, maxchi:int, defense:int, baseReload:int, minDamage:int, damageRange:int, baseSlashLength:int, slashUsage:int, lightMastery:int, balancedMastery:int, heavyMastery:int, level:int) : *
      {
         this.controlledBy = controlledBy;
         setHP(hp);
         this.maxhp = maxhp;
         this.setChi(chi);
         this.maxchi = maxchi;
         this.defense = defense;
         this.baseReload = baseReload;
         this.minDamage = minDamage;
         this.damageRange = damageRange;
         this.baseSlashLength = baseSlashLength;
         this.slashUsage = slashUsage;
         this.lightMastery = lightMastery;
         this.balancedMastery = balancedMastery;
         this.heavyMastery = heavyMastery;
         this.level = level;
         dead = false;
         animFrozen = false;
         this.autoSlash = false;
         this.slashCommitted = false;
         this.hasSlash = false;
         this.hasSlashBuffer = false;
         this.slashArray.length = 0;
         this.slashArrayBuffer.length = 0;
         walkSpeed = 4;
         if(controlledBy == 0)
         {
            if(StatsManager.hasBuff(StatsManager.BUFF_ATTACK))
            {
               this.minDamage *= 1.5;
            }
            else if(StatsManager.hasBuff(StatsManager.BUFF_DEFENSE))
            {
               this.defense *= 1.5;
            }
            else if(StatsManager.hasBuff(StatsManager.BUFF_INJURED))
            {
               this.minDamage *= 0.5;
               this.defense *= 0.5;
               this.baseSlashLength *= 0.5;
            }
            StageManager.getBattleUI().setMax(maxhp,maxchi);
            StageManager.getBattleUI().updateHp(getHP(),maxhp);
            StageManager.getBattleUI().updateChi(this.getChi(),maxchi);
            this.setStance(StatsManager.stance);
            this.autoSlash = StatsManager.autoSlash;
            if(StatsManager.usePlayerIO)
            {
               this.nid = StatsManager.charname;
            }
            else
            {
               this.nid = NetworkManager.instance.nid;
            }
         }
         this.startAction(IDLE_STATE);
         this.maxreload = 5 * 24;
         this.reload = 0;
         StageManager.getBattleUI().updateReload(0);
         this.cloneIndex = 0;
         gotHitCounter = 0;
         this.launchCount = 0;
         mcs.setDisplayName(StatsManager.charname,16763904);
         this.cleanUpPlayer();
      }
      
      public function initAttackStats(STAT_ATK:int, STAT_FIREATK:int, STAT_WINDATK:int, STAT_WATERATK:int, STAT_EARTHATK:int, STAT_CRITICALDMG:int = 0, STAT_PIERCINGDMG:int = 0) : *
      {
         this.STAT_ATK = STAT_ATK;
         this.STAT_FIREATK = STAT_FIREATK;
         this.STAT_WINDATK = STAT_WINDATK;
         this.STAT_WATERATK = STAT_WATERATK;
         this.STAT_EARTHATK = STAT_EARTHATK;
         this.STAT_CRITICALDMG = STAT_CRITICALDMG;
         this.STAT_PIERCINGDMG = STAT_PIERCINGDMG;
      }
      
      public function initElementDefenseStats(STAT_FIREDEF:int, STAT_WINDDEF:int, STAT_WATERDEF:int, STAT_EARTHDEF:int) : *
      {
         this.STAT_FIREDEF = STAT_FIREDEF;
         this.STAT_WINDDEF = STAT_WINDDEF;
         this.STAT_WATERDEF = STAT_WATERDEF;
         this.STAT_EARTHDEF = STAT_EARTHDEF;
      }
      
      override public function setIsFriendly() : *
      {
         isFriendly = true;
         target = NPCManager.getNearestEnemy(getMapPosition(),!isFriendly);
         this.controlledBy = 3;
      }
      
      override public function update() : *
      {
         var seppukuDamage:int = 0;
         var startX:int = 0;
         var velX:int = 0;
         var damageObj:Damage = null;
         var damage:Damage = null;
         var rockSpacing:int = 0;
         var proj:BigEarthquakeProjectile = null;
         var velY:int = 0;
         var i:int = 0;
         var stealthlvl:int = 0;
         if(mcs == null)
         {
            return;
         }
         if(this.controlledBy != 0 && animFrozen && getHP() <= 0)
         {
            return;
         }
         var finishedAnimation:String = mcs.updateAnimation();
         if(finishedAnimation != "")
         {
            switch(finishedAnimation)
            {
               case SHEATHESWORDCHIBURI:
               case SHEATHESWORD:
                  if(!StageManager.isRedFreeze())
                  {
                     if(this.controlledBy == 0)
                     {
                        startAnim(SHEATHETOIDLE);
                     }
                     else
                     {
                        this.startAction(IDLE_STATE);
                     }
                  }
                  break;
               case SHEATHETOIDLE:
                  this.startAction(IDLE_STATE);
                  break;
               case LIGHTSLASH_START:
                  startAnim(LIGHTSLASH_MID);
                  break;
               case LIGHTSLASHDOWN_START:
                  startAnim(LIGHTSLASHDOWN_MID);
                  break;
               case LIGHTSLASHUP_START:
                  startAnim(LIGHTSLASHUP_MID);
                  break;
               case BALANCEDSLASH_START:
                  startAnim(BALANCEDSLASH_MID);
                  break;
               case BALANCEDSLASHDOWN_START:
                  startAnim(BALANCEDSLASHDOWN_MID);
                  break;
               case BALANCEDSLASHUP_START:
                  startAnim(BALANCEDSLASHUP_MID);
                  break;
               case HEAVYSLASH_START:
                  startAnim(HEAVYSLASH_MID);
                  break;
               case HEAVYSLASHDOWN_START:
                  startAnim(HEAVYSLASHDOWN_MID);
                  break;
               case HEAVYSLASHUP_START:
                  startAnim(HEAVYSLASHUP_MID);
                  break;
               case DUALSLASH_START:
                  startAnim(DUALSLASH_MID);
                  break;
               case DUALSLASHDOWN_START:
                  startAnim(DUALSLASHDOWN_MID);
                  break;
               case DUALSLASHUP_START:
                  startAnim(DUALSLASHUP_MID);
                  break;
               case REVERSEDSLASH_START:
                  startAnim(REVERSEDSLASH_MID);
                  break;
               case LIGHTJUMPSLASH_START:
                  if(this.slashType == JUMP_SLASH)
                  {
                     startAnim(LIGHTFALLSLASH_MID);
                     mcs.y = this.slashArray[0].y + 90;
                  }
                  else if(this.slashType == UP_SLASH)
                  {
                     startAnim(LIGHTJUMPSLASH_RISE);
                  }
                  break;
               case BALANCEDJUMPSLASH_START:
                  if(this.slashType == JUMP_SLASH)
                  {
                     startAnim(BALANCEDFALLSLASH_START);
                     mcs.y = this.slashArray[0].y + 90;
                  }
                  else if(this.slashType == UP_SLASH)
                  {
                     startAnim(BALANCEDJUMPSLASH_RISE);
                  }
                  break;
               case HEAVYJUMPSLASH_START:
                  if(this.slashType == JUMP_SLASH)
                  {
                     startAnim(HEAVYFALLSLASH_START);
                     mcs.y = this.slashArray[0].y + 90;
                  }
                  else if(this.slashType == UP_SLASH)
                  {
                     startAnim(HEAVYJUMPSLASH_RISE);
                  }
                  break;
               case DUALJUMPSLASH_START:
                  if(this.slashType == JUMP_SLASH)
                  {
                     startAnim(DUALFALLSLASH_START);
                     mcs.y = this.slashArray[0].y + 90;
                  }
                  else if(this.slashType == UP_SLASH)
                  {
                     startAnim(DUALJUMPSLASH_RISE);
                  }
                  break;
               case REVERSEDJUMPSLASH_START:
                  if(this.slashType == JUMP_SLASH)
                  {
                     startAnim(REVERSEDFALLSLASH_START);
                     mcs.y = this.slashArray[0].y + 90;
                  }
                  else if(this.slashType == UP_SLASH)
                  {
                     startAnim(REVERSEDJUMPSLASH_RISE);
                  }
                  break;
               case LIGHTFALLSLASH_START:
                  startAnim(LIGHTFALLSLASH_MID);
                  break;
               case BALANCEDFALLSLASH_START:
                  startAnim(BALANCEDFALLSLASH_MID);
                  break;
               case HEAVYFALLSLASH_START:
                  startAnim(HEAVYFALLSLASH_MID);
                  break;
               case DUALFALLSLASH_START:
                  startAnim(DUALFALLSLASH_MID);
                  break;
               case REVERSEDFALLSLASH_START:
                  startAnim(REVERSEDFALLSLASH_MID);
                  break;
               case LIGHTSLASH_END:
                  startAnim(LIGHTSLASH_POSE);
                  break;
               case LIGHTSLASHDOWN_END:
                  startAnim(LIGHTSLASHDOWN_POSE);
                  break;
               case LIGHTSLASHUP_END:
                  startAnim(LIGHTSLASHUP_POSE);
                  break;
               case BALANCEDSLASH_END:
                  startAnim(BALANCEDSLASH_POSE);
                  break;
               case BALANCEDSLASHDOWN_END:
                  startAnim(BALANCEDSLASHDOWN_POSE);
                  break;
               case BALANCEDSLASHUP_END:
                  startAnim(BALANCEDSLASHUP_POSE);
                  break;
               case HEAVYSLASH_END:
                  startAnim(HEAVYSLASH_POSE);
                  break;
               case HEAVYSLASHDOWN_END:
                  startAnim(HEAVYSLASHDOWN_POSE);
                  break;
               case HEAVYSLASHUP_END:
                  startAnim(HEAVYSLASHUP_POSE);
                  break;
               case DUALSLASH_END:
                  startAnim(DUALSLASH_POSE);
                  break;
               case DUALSLASHDOWN_END:
                  startAnim(DUALSLASHDOWN_POSE);
                  break;
               case DUALSLASHUP_END:
                  startAnim(DUALSLASHUP_POSE);
                  break;
               case REVERSEDSLASH_END:
                  startAnim(REVERSEDSLASH_POSE);
                  break;
               case LIGHTSLASH_POSE:
               case LIGHTSLASHDOWN_POSE:
               case LIGHTSLASHUP_POSE:
               case BALANCEDSLASH_POSE:
               case BALANCEDSLASHDOWN_POSE:
               case BALANCEDSLASHUP_POSE:
               case HEAVYSLASH_POSE:
               case HEAVYSLASHDOWN_POSE:
               case HEAVYSLASHUP_POSE:
               case DUALSLASH_POSE:
               case DUALSLASHDOWN_POSE:
               case DUALSLASHUP_POSE:
               case REVERSEDSLASH_POSE:
               case LIGHTJUMPSLASH_LAND:
               case BALANCEDJUMPSLASH_LAND:
               case HEAVYJUMPSLASH_LAND:
               case DUALJUMPSLASH_LAND:
               case REVERSEDJUMPSLASH_LAND:
               case LIGHTFALLSLASH_END:
               case BALANCEDFALLSLASH_END:
               case HEAVYFALLSLASH_END:
               case DUALFALLSLASH_END:
               case REVERSEDFALLSLASH_END:
                  if(actionState != REDFREEZE_STATE && StageManager.isRedFreeze())
                  {
                     this.startAction(REDFREEZE_STATE);
                  }
                  else if(actionState != REDFREEZE_STATE)
                  {
                     startAnim(SHEATHESWORD);
                  }
                  break;
               case DOWNSTAB:
                  if(actionState != REDFREEZE_STATE)
                  {
                     damage = new Damage(this.getDamage() * 2,level);
                     damage.setPiercingDamage(this.STAT_PIERCINGDMG);
                     if(this.controlledBy == 0)
                     {
                        NPCManager.checkDownStab(mcs.partList[MCSCharacter.PART_weapon],damage);
                     }
                     else if(this.controlledBy == 1)
                     {
                        target.checkHitObject(mcs.partList[MCSCharacter.PART_weapon],damage);
                     }
                     this.deductReloadBar();
                     if(StageManager.isRedFreeze())
                     {
                        this.startAction(REDFREEZE_STATE);
                     }
                     else
                     {
                        startAnim(DOWNSTAB_UP);
                     }
                  }
                  break;
               case DOWNSTAB_UP:
                  this.endDownStab();
                  break;
               case DEFEATED1:
               case ENEMYDEATH:
               case DEATH_FORWARD:
               case DEFEATED2:
               case ENEMYDEATHNOHEAD:
               case ENEMYDEATHNOHAND:
               case DEATHDOWNED:
               case DEATHINHALF:
               case SEPPUKU_END:
               case SEPPUKU_NOHEAD:
                  if(this.controlledBy == 0)
                  {
                     animFrozen = true;
                     break;
                  }
                  deathAnimEnd();
                  return;
                  break;
               case FLY_END:
                  this.startAction(DOWNED_STATE);
                  break;
               case KNEEGROIN_VICTIM:
                  startAnim(GETUP_FRONT);
                  break;
               case BACKTHROW_VICTIM:
                  actionState = DOWNED_STATE;
                  if(this.canFlipUp && !GameEngine.isAdventureMode())
                  {
                     startAnim(FLIPUP);
                  }
                  else
                  {
                     startAnim(GOTLAUNCHEDDOWNEDEND);
                  }
                  if(getMCS().isFacingRight())
                  {
                     this.movePlayer(410);
                  }
                  else
                  {
                     this.movePlayer(-410);
                  }
                  break;
               case GETUP_FRONT:
                  if(getMCS().isFacingRight())
                  {
                     this.movePlayer(-40);
                  }
                  else
                  {
                     this.movePlayer(40);
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
                     if(this.controlledBy != 0)
                     {
                        return;
                     }
                  }
                  else
                  {
                     if(this.controlledBy != 0)
                     {
                        if(getHP() > 0 && !StageManager.isRedFreeze())
                        {
                           mcs.showHealthBar();
                        }
                        mcs.moveHealthBarX(-100);
                     }
                     if(this.canFlipUp && !GameEngine.isAdventureMode())
                     {
                        startAnim(FLIPUP);
                        if(this.controlledBy != 0)
                        {
                           mcs.hideHealthBar();
                        }
                     }
                     else if(actionState == KNOCKDOWNED_STATE)
                     {
                        startAnim(DOWNEDUP2);
                     }
                     else
                     {
                        startAnim(GOTLAUNCHEDDOWNEDEND);
                     }
                  }
                  break;
               case GOTLAUNCHEDDOWNEDEND:
                  startAnim(DOWNEDUP2);
                  break;
               case DOWNEDUP:
               case DOWNEDUP2:
                  if(this.controlledBy != 0)
                  {
                     mcs.moveHealthBarX(0);
                     mcs.showHealthBar();
                  }
                  else if(!StageManager.isRedFreeze())
                  {
                     mcs.showDisplayName(true);
                  }
                  if(getMCS().isFacingRight())
                  {
                     this.movePlayer(-120);
                  }
                  else
                  {
                     this.movePlayer(120);
                  }
                  this.startAction(IDLE_STATE);
                  break;
               case BACKTHROW:
                  if(getMCS().isFacingRight())
                  {
                     this.movePlayer(-110);
                  }
                  else
                  {
                     this.movePlayer(110);
                  }
                  if(posX < 0)
                  {
                     this.movePlayer(posX + 50);
                  }
                  else if(posX > StageManager.getGameStageWidth())
                  {
                     this.movePlayer(posX - StageManager.getGameStageWidth() - 50);
                  }
                  if(this.controlledBy != 0)
                  {
                     if(!StageManager.isRedFreeze())
                     {
                        mcs.showHealthBar();
                     }
                  }
                  else if(!StageManager.isRedFreeze())
                  {
                     mcs.showDisplayName(true);
                  }
                  this.startAction(IDLE_STATE);
                  break;
               case FLIPUP:
                  if(this.controlledBy != 0)
                  {
                     if(!StageManager.isRedFreeze())
                     {
                        mcs.showHealthBar();
                     }
                     mcs.moveHealthBarX(0);
                  }
                  this.startAction(IDLE_STATE);
                  break;
               case FORWARDROLL_END:
               case SHEATHEDLAND:
               case KUNAITHROW:
               case KATANAATTACK:
               case PICKUP:
               case PUNCH:
               case SPARTAKICK_END:
               case PUNCH_END:
               case KNEEGROIN:
               case BOW:
               case BOW2:
               case THROWGRENADE:
               case JUTSU_GROUND_PARTB:
               case CHARGEDSHOT_END:
               case CHICHARGE_END:
                  this.startAction(IDLE_STATE);
                  break;
               case SEPPUKU_START:
                  seppukuDamage = getHP() - 1;
                  if(GameEngine.isAdventureMode())
                  {
                     startAnim(SEPPUKU_MID);
                     if(this.controlledBy == 0)
                     {
                        StatsManager.setStat(0,1);
                        OverworldHUD.instance.updateHUD();
                        ProjectileManager.createFloatingText(mcs.x,mcs.y - 100,seppukuDamage.toString(),0);
                     }
                     else if(seppukuDamage > 0)
                     {
                        ProjectileManager.createFloatingText(mcs.x,mcs.y - 100,seppukuDamage.toString(),10027008);
                        mcs.updateHealthBar(getHP() / maxhp);
                     }
                  }
                  else
                  {
                     setHP(1);
                     mcs.updateHealthBar(getHP() / maxhp);
                     if(this.controlledBy == 0)
                     {
                        StageManager.getBattleUI().updateHp(getHP(),maxhp);
                        ProjectileManager.createFloatingText(mcs.x,mcs.y - 100,seppukuDamage.toString(),0);
                     }
                     else if(seppukuDamage > 0)
                     {
                        ProjectileManager.createFloatingText(mcs.x,mcs.y - 100,seppukuDamage.toString(),10027008);
                        mcs.updateHealthBar(getHP() / maxhp);
                     }
                  }
                  break;
               case SEPPUKU_MID:
                  if(!GameEngine.isAdventureMode())
                  {
                     startAnim(SEPPUKU_END);
                  }
                  break;
               case FLINCH_WEAPON:
               case FLINCH:
                  this.endFlinch();
                  break;
               case FORWARDROLL_START:
                  startAnim(FORWARDROLL_END);
                  break;
               case NINJASMOKEBOMB:
                  if(actionState == SMOKEBOMB_STATE || actionState == SMOKEBOMB2_STATE)
                  {
                     ProjectileManager.createSmoke(getMapPosition(),getMCS().y);
                     if(getMCS().isFacingRight())
                     {
                        this.movePlayer(400);
                     }
                     else
                     {
                        this.movePlayer(-400);
                     }
                     if(this.controlledBy == 0)
                     {
                        StageManager.keepPlayerInView();
                     }
                     ProjectileManager.createSmoke(getMapPosition(),getMCS().y);
                     this.startAction(LAND_STATE);
                  }
                  else if(actionState == SKILL_FLASHBANG_STATE)
                  {
                     ProjectileManager.createProjectile(ProjectileManager.PROJ_FLASHBANG,getMapPosition(),getMCS().y,0,0,0,this.getSkillLevel(SkillManager.SKILL_FLASHBANG),this);
                     this.startAction(IDLE_STATE);
                  }
                  break;
               case JUTSU_BLOW_PARTA:
                  startAnim(JUTSU_BLOW_PARTB);
                  if(STAT_FIREATK == 0)
                  {
                     SoundManager.instance.playFart();
                  }
                  else if(actionState == SKILL_FIREBREATH_STATE)
                  {
                     if(getMCS().isFacingRight())
                     {
                        ProjectileManager.createProjectile(ProjectileManager.PROJ_FIREBREATH,getMapPosition() + 25,getMCS().y - 65,1,0,STAT_FIREATK,this.getSkillLevel(SkillManager.SKILL_FIREBREATH),this);
                     }
                     else
                     {
                        ProjectileManager.createProjectile(ProjectileManager.PROJ_FIREBREATH,getMapPosition() - 25,getMCS().y - 65,-1,0,STAT_FIREATK,this.getSkillLevel(SkillManager.SKILL_FIREBREATH),this);
                     }
                  }
                  else if(actionState == SKILL_INFERNO_STATE)
                  {
                     if(getMCS().isFacingRight())
                     {
                        ProjectileManager.createProjectile(ProjectileManager.PROJ_INFERNO,getMapPosition() + 25,getMCS().y - 65,1,0,STAT_FIREATK,this.getSkillLevel(SkillManager.SKILL_INFERNO),this);
                     }
                     else
                     {
                        ProjectileManager.createProjectile(ProjectileManager.PROJ_INFERNO,getMapPosition() - 25,getMCS().y - 65,-1,0,STAT_FIREATK,this.getSkillLevel(SkillManager.SKILL_INFERNO),this);
                     }
                  }
                  break;
               case JUTSU_BLOW_PARTB:
                  this.startAction(IDLE_STATE);
                  break;
               case GROUNDPUNCH_PARTA:
                  if(actionState == SKILL_GROUNDPUNCH_STATE)
                  {
                     if(STAT_EARTHATK == 0)
                     {
                        SoundManager.instance.playFart();
                     }
                     else if(getMCS().isFacingRight())
                     {
                        ProjectileManager.createProjectile(ProjectileManager.PROJ_GROUNDPUNCH,getMapPosition() + 40,getMCS().y,0,0,STAT_EARTHATK,this.getSkillLevel(SkillManager.SKILL_GROUNDPUNCH),this);
                     }
                     else
                     {
                        ProjectileManager.createProjectile(ProjectileManager.PROJ_GROUNDPUNCH,getMapPosition() - 40,getMCS().y,0,0,STAT_EARTHATK,this.getSkillLevel(SkillManager.SKILL_GROUNDPUNCH),this);
                     }
                  }
                  else if(actionState == SKILL_CHIBURST_STATE)
                  {
                     if(getMCS().isFacingRight())
                     {
                        ProjectileManager.createProjectile(ProjectileManager.PROJ_CHIBURST,getMapPosition() + 40,getMCS().y,0,0,0,this.getSkillLevel(SkillManager.SKILL_CHIBURST),this);
                     }
                     else
                     {
                        ProjectileManager.createProjectile(ProjectileManager.PROJ_CHIBURST,getMapPosition() - 40,getMCS().y,0,0,0,this.getSkillLevel(SkillManager.SKILL_CHIBURST),this);
                     }
                  }
                  startAnim(GROUNDPUNCH_PARTB);
                  break;
               case GROUNDPUNCH_PARTB:
                  this.startAction(IDLE_STATE);
                  break;
               case STOMP_PARTA:
                  if(STAT_WATERATK == 0)
                  {
                     SoundManager.instance.playFart();
                  }
                  else if(getMCS().isFacingRight())
                  {
                     ProjectileManager.createProjectile(ProjectileManager.PROJ_WATERSPLASH,getMapPosition() + 50,getMCS().y,1,0,STAT_WATERATK,this.getSkillLevel(SkillManager.SKILL_WATERSPLASH),this);
                  }
                  else
                  {
                     ProjectileManager.createProjectile(ProjectileManager.PROJ_WATERSPLASH,getMapPosition() - 50,getMCS().y,-1,0,STAT_WATERATK,this.getSkillLevel(SkillManager.SKILL_WATERSPLASH),this);
                  }
                  startAnim(STOMP_PARTB);
                  break;
               case STOMP_PARTB:
                  this.startAction(IDLE_STATE);
                  break;
               case PUNCHCOMBO_PARTA:
                  if(STAT_WINDATK == 0)
                  {
                     SoundManager.instance.playFart();
                  }
                  else if(getMCS().isFacingRight())
                  {
                     ProjectileManager.createProjectile(ProjectileManager.PROJ_WINDKICK,getMapPosition() + 20,getMCS().y - 60,1,0,STAT_WINDATK,this.getSkillLevel(SkillManager.SKILL_WINDKICK),this);
                  }
                  else
                  {
                     ProjectileManager.createProjectile(ProjectileManager.PROJ_WINDKICK,getMapPosition() - 20,getMCS().y - 60,-1,0,STAT_WINDATK,this.getSkillLevel(SkillManager.SKILL_WINDKICK),this);
                  }
                  startAnim(PUNCHCOMBO_PARTB);
                  break;
               case PUNCHCOMBO_PARTB:
                  if(STAT_WINDATK > 0)
                  {
                     if(getMCS().isFacingRight())
                     {
                        ProjectileManager.createProjectile(ProjectileManager.PROJ_WINDKICK,getMapPosition() + 20,getMCS().y - 60,1,0,STAT_WINDATK,this.getSkillLevel(SkillManager.SKILL_WINDKICK),this);
                     }
                     else
                     {
                        ProjectileManager.createProjectile(ProjectileManager.PROJ_WINDKICK,getMapPosition() - 20,getMCS().y - 60,-1,0,STAT_WINDATK,this.getSkillLevel(SkillManager.SKILL_WINDKICK),this);
                     }
                  }
                  startAnim(PUNCHCOMBO_PARTC);
                  break;
               case PUNCHCOMBO_PARTC:
                  if(STAT_WINDATK > 0)
                  {
                     if(getMCS().isFacingRight())
                     {
                        ProjectileManager.createProjectile(ProjectileManager.PROJ_WINDKICK,getMapPosition() + 30,getMCS().y - 50,1,0,STAT_WINDATK,this.getSkillLevel(SkillManager.SKILL_WINDKICK),this);
                     }
                     else
                     {
                        ProjectileManager.createProjectile(ProjectileManager.PROJ_WINDKICK,getMapPosition() - 30,getMCS().y - 50,-1,0,STAT_WINDATK,this.getSkillLevel(SkillManager.SKILL_WINDKICK),this);
                     }
                  }
                  startAnim(PUNCHCOMBO_PARTD);
                  break;
               case PUNCHCOMBO_PARTD:
                  this.startAction(IDLE_STATE);
                  break;
               case CLEAVE_END:
                  if(getMCS().isFacingRight())
                  {
                     ProjectileManager.createProjectile(ProjectileManager.PROJ_CLEAVEHIT,getMapPosition() + 50,getMCS().y,0,0,this.getDamage() * this.getChargingTime() / 2,level,this);
                  }
                  else
                  {
                     ProjectileManager.createProjectile(ProjectileManager.PROJ_CLEAVEHIT,getMapPosition() - 50,getMCS().y,-1,0,this.getDamage() * this.getChargingTime() / 2,level,this);
                  }
                  startAnim(CLEAVE_POSE);
                  actionState = POSE_STATE;
                  this.chargingTime = 0;
                  StageManager.startShake(12);
                  break;
               case CLEAVE_POSE:
                  startAnim(SHEATHESWORDCHIBURI);
                  break;
               case FLURRY_PARTB:
                  startAnim(FLURRY_PARTC);
                  this.chargingFx = new DashFX();
                  getMCS().addChild(this.chargingFx);
                  break;
               case FLURRY_PARTC:
                  startAnim(FLURRY_PARTD);
                  if(this.chargingFx != null)
                  {
                     this.chargingFx.removeProjectile();
                     this.chargingFx = null;
                  }
                  break;
               case FLURRY_PARTD:
                  startAnim(FLURRY_POSE);
                  actionState = POSE_STATE;
                  this.chargingTime = 0;
                  break;
               case FLURRY_POSE:
                  startAnim(SHEATHESWORDCHIBURI);
                  break;
               case SPARTAKICK_START:
                  startAnim(SPARTAKICK_END);
                  break;
               case PUNCH_START:
                  startAnim(PUNCH_END);
                  break;
               case JUTSU_GROUND_PARTA:
                  if(actionState == SKILL_EARTHQUAKE_STATE)
                  {
                     StageManager.startShake(24);
                     rockSpacing = 100;
                     if(!mcs.isFacingRight())
                     {
                        rockSpacing = -rockSpacing;
                     }
                     startX = getMapPosition() + rockSpacing;
                     for(i = 1; i < 6; i++)
                     {
                        velY = -30 - i;
                        proj = ProjectileManager.createProjectile(ProjectileManager.PROJ_EARTHQUAKE,getMapPosition() + rockSpacing * i,getMCS().y,0,velY,STAT_EARTHATK,1,this) as BigEarthquakeProjectile;
                        proj.setDelay((i - 1) * 3);
                     }
                  }
                  else if(actionState == SKILL_TSUNAMI_STATE)
                  {
                     if(getMCS().isFacingRight())
                     {
                        startX = getMapPosition() + 20;
                        velX = 1;
                     }
                     else
                     {
                        startX = getMapPosition() - 20;
                        velX = -1;
                     }
                     ProjectileManager.createProjectile(ProjectileManager.PROJ_TSUNAMI,startX,getMCS().y,velX,0,STAT_WATERATK,1,this);
                  }
                  else if(actionState == SKILL_TORNADO_STATE)
                  {
                     if(getMCS().isFacingRight())
                     {
                        startX = getMapPosition() + 50;
                        velX = 15;
                     }
                     else
                     {
                        startX = getMapPosition() - 50;
                        velX = -15;
                     }
                     ProjectileManager.createProjectile(ProjectileManager.PROJ_TORNADO,startX,getMCS().y,velX,0,STAT_WINDATK,1,this);
                  }
                  startAnim(JUTSU_GROUND_PARTB);
                  break;
               case DEATHTOUCH_PARTA:
                  startAnim(DEATHTOUCH_PARTB);
                  break;
               case DEATHTOUCH_PARTB:
                  startAnim(DEATHTOUCH_PARTC);
                  break;
               case DEATHTOUCH_PARTC:
                  startAnim(DEATHTOUCH_PARTD);
                  damageObj = new Damage(0,0,Damage.DEATHTOUCH);
                  if(getMCS().isFacingRight())
                  {
                     damageObj.setFlyVel(25,-10);
                  }
                  else
                  {
                     damageObj.setFlyVel(-25,-10);
                  }
                  if(this.controlledBy == 0)
                  {
                     NPCManager.checkHitObject(mcs.partList[MCSCharacter.PART_r_hand],damageObj,100,false,mcs);
                  }
                  else if(this.controlledBy == 1)
                  {
                     target.checkHitObject(mcs.partList[MCSCharacter.PART_r_hand],damageObj);
                  }
                  else if(this.controlledBy == 2)
                  {
                     NPCManager.checkPlayerHitObject(mcs.partList[MCSCharacter.PART_r_hand],damageObj,100,true,mcs,this);
                  }
                  break;
               case DEATHTOUCH_PARTD:
                  this.startAction(IDLE_STATE);
                  break;
               case SHUNPO_END:
                  actionState = POSE_STATE;
                  break;
               case DASH_START:
                  startAnim(DASH_END);
                  actionState = POSE_STATE;
                  if(this.chargingFx != null)
                  {
                     this.chargingFx.removeProjectile();
                     this.chargingFx = null;
                  }
                  break;
               case BACKSTEP_START:
                  startAnim(BACKSTEP_END);
                  actionState = POSE_STATE;
                  if(this.chargingFx != null)
                  {
                     this.chargingFx.removeProjectile();
                     this.chargingFx = null;
                  }
                  break;
               case DASH_END:
               case BACKSTEP_END:
                  this.startAction(IDLE_STATE);
                  break;
               case FOCUS_START:
                  if(actionState == SKILL_STEALTH_STATE)
                  {
                     if(this.controlledBy == 0 || this.controlledBy == 3)
                     {
                        getMCS().alpha = 0.5;
                     }
                     else
                     {
                        getMCS().visible = false;
                     }
                     stealthlvl = this.getSkillLevel(SkillManager.SKILL_STEALTH);
                     if(stealthlvl == 1)
                     {
                        this.invisCounter = 24 * 10;
                     }
                     else if(stealthlvl == 2)
                     {
                        this.invisCounter = 24 * 15;
                     }
                     else if(stealthlvl == 3)
                     {
                        this.invisCounter = 24 * 20;
                     }
                     ProjectileManager.createSmoke3(getMapPosition(),getMCS().y);
                  }
                  startAnim(FOCUS_END);
                  break;
               case FOCUS_END:
                  this.startAction(IDLE_STATE);
                  break;
               case AIRSTAB_START:
                  startAnim(AIRSTAB_MID);
                  break;
               case AIRSTAB_MID:
                  startAnim(AIRSTAB_STAB);
                  if(getMCS().isFacingRight())
                  {
                     ProjectileManager.createProjectile(ProjectileManager.PROJ_GROUNDPUNCH,getMapPosition() + 30,getMCS().y + 15,0,0,0,1,this);
                  }
                  else
                  {
                     ProjectileManager.createProjectile(ProjectileManager.PROJ_GROUNDPUNCH,getMapPosition() - 30,getMCS().y + 15,0,0,0,1,this);
                  }
                  damage = new Damage(this.getDamage() * 2,level);
                  damage.setPiercingDamage(this.STAT_PIERCINGDMG);
                  if(this.controlledBy == 0)
                  {
                     NPCManager.checkDownStab(mcs.partList[MCSCharacter.PART_weapon],damage);
                  }
                  else if(this.controlledBy == 1)
                  {
                     target.checkHitObject(mcs.partList[MCSCharacter.PART_weapon],damage);
                  }
                  break;
               case AIRSTAB_STAB:
                  startAnim(AIRSTAB_END);
                  break;
               case AIRSTAB_END:
                  this.startAction(POSE_STATE);
                  startAnim(SHEATHESWORDCHIBURI);
                  break;
               case BULLCHARGE_START:
                  startAnim(BULLCHARGE_RUN);
                  this.chargingFx = new BullChargeFX();
                  getMCS().addChild(this.chargingFx);
                  break;
               case PUNCHLUNGE_START:
                  startAnim(PUNCHLUNGE_MID);
                  this.chargingFx = new BullChargeFX();
                  getMCS().addChild(this.chargingFx);
                  break;
               case PUNCHLUNGE_MID:
                  startAnim(PUNCHLUNGE_END);
                  if(this.chargingFx != null)
                  {
                     this.chargingFx.removeProjectile();
                     this.chargingFx = null;
                  }
                  break;
               case PUNCHLUNGE_END:
                  this.startAction(IDLE_STATE);
                  break;
               case ZOM_GETUP:
                  getMCS().moveHealthBarX(0);
                  getMCS().showHealthBar();
                  if(mcs.isFacingRight())
                  {
                     movePositionX(-50);
                  }
                  else
                  {
                     movePositionX(50);
                  }
                  this.startAction(IDLE_STATE);
                  break;
               case CHICHARGE_START:
                  this.chargingFx = new ChiChargeFX();
                  getMCS().addChild(this.chargingFx);
            }
         }
         if((this.controlledBy == 1 || this.controlledBy == 3 || this.autoSlash) && !dead && checkAITrigger() && !GameEngine.isAdventureMode() && !NetworkManager.instance.playBack)
         {
            this.AI();
         }
         else if(this.controlledBy == 0 && (GameEngine.isPlayBackClient() || NetworkManager.instance.playBack))
         {
            this.playbackAI();
         }
         this.doAction();
         if(this.reload < this.maxreload)
         {
            ++this.reload;
            if(this.controlledBy == 0)
            {
               this.tempreload = this.reload - 24;
               if(this.tempreload < 0)
               {
                  this.tempreload = 0;
               }
               StageManager.getBattleUI().updateReload(this.tempreload / (this.maxreload - 24));
            }
         }
         if(gotHitCounter > 0)
         {
            --gotHitCounter;
         }
         if(this.speechCounter > 0)
         {
            --this.speechCounter;
         }
         else if(this.speechCounter == 0)
         {
            this.speechCounter = -1;
            mcs.setSpeechText("");
         }
         if(this.controlledBy == 0)
         {
            mcs.getProgressBar().update();
         }
         if(this.invisCounter > 0)
         {
            --this.invisCounter;
            if(this.invisCounter == 0)
            {
               this.cancelStealth();
            }
         }
         if(this.logsubCounter > 0)
         {
            --this.logsubCounter;
            if(this.logsubCounter == 0)
            {
               this.cancelLogSub();
            }
         }
      }
      
      override internal function startAction(actionState:int) : *
      {
         var fxPos:int = 0;
         var chiDamage:int = 0;
         var spiritThiefLvl:int = 0;
         var damageObj:Damage = null;
         var victimpos:int = 0;
         var projectile:Projectile = null;
         var logsublvl:int = 0;
         var hitArray:Array = null;
         var victim:NPC = null;
         var mcsplayer:MCSPlayer = null;
         var currentAnim:String = null;
         var pvelX:int = 0;
         var prevActionState:int = this.actionState;
         this.actionState = actionState;
         if(actionState != prevActionState && this.chargingFx != null)
         {
            this.chargingFx.removeProjectile();
            this.chargingFx = null;
         }
         switch(actionState)
         {
            case IDLE_STATE:
               if(!GameEngine.isAdventureMode() && !StageManager.isRedFreeze() && getHP() <= maxhp / 4 || GameEngine.isAdventureMode() && this.controlledBy == 0 && StatsManager.getStat(StatsManager.STAT_AP) == 0)
               {
                  startAnim(TIRED);
               }
               else
               {
                  startAnim(IDLE_SHEATHED);
               }
               this.checkNextSlash();
               break;
            case RUN_STATE:
               if(this.hasSlash)
               {
                  if(this.stance == LIGHT_STANCE)
                  {
                     startAnim(RUN_LIGHT);
                  }
                  else if(this.stance == BALANCED_STANCE)
                  {
                     startAnim(RUN_BALANCED);
                  }
                  else if(this.stance == HEAVY_STANCE)
                  {
                     startAnim(RUN_HEAVY);
                  }
                  else if(this.stance == DUAL_STANCE)
                  {
                     startAnim(RUN_DUAL);
                  }
                  else if(this.stance == REVERSED_STANCE)
                  {
                     startAnim(RUN_REVERSED);
                  }
               }
               else
               {
                  startAnim(RUN_SHEATHED);
               }
               if(getMCS().y < StageManager.getGroundY())
               {
                  this.startAction(FALL_STATE);
               }
               break;
            case WALK_STATE:
               startAnim(WALK_SHEATHED);
               if(getMCS().y < StageManager.getGroundY())
               {
                  this.startAction(FALL_STATE);
               }
               break;
            case FALL_STATE:
               if(this.stance == LIGHT_STANCE)
               {
                  if(this.slashType == UP_SLASH)
                  {
                     startAnim(LIGHTJUMPSLASH_SLASH);
                  }
                  else
                  {
                     startAnim(BALANCEDFALLSLASH_MID);
                  }
               }
               else if(this.stance == BALANCED_STANCE)
               {
                  if(this.slashType == UP_SLASH)
                  {
                     startAnim(BALANCEDJUMPSLASH_SLASH);
                  }
                  else
                  {
                     startAnim(BALANCEDFALLSLASH_MID);
                  }
               }
               else if(this.stance == HEAVY_STANCE)
               {
                  if(this.slashType == UP_SLASH)
                  {
                     startAnim(HEAVYJUMPSLASH_SLASH);
                  }
                  else
                  {
                     startAnim(HEAVYFALLSLASH_MID);
                  }
               }
               else if(this.stance == DUAL_STANCE)
               {
                  if(this.slashType == UP_SLASH)
                  {
                     startAnim(DUALJUMPSLASH_SLASH);
                  }
                  else
                  {
                     startAnim(DUALFALLSLASH_MID);
                  }
               }
               else if(this.stance == REVERSED_STANCE)
               {
                  if(this.slashType == UP_SLASH)
                  {
                     startAnim(REVERSEDJUMPSLASH_SLASH);
                  }
                  else
                  {
                     startAnim(REVERSEDFALLSLASH_MID);
                  }
               }
               break;
            case SLASH_STATE:
               this.startSlash();
               break;
            case POSE_STATE:
               if(this.slashType == DOWNSTAB_SLASH)
               {
                  startAnim(SHEATHESWORD);
               }
               else if(this.stance == LIGHT_STANCE)
               {
                  if(this.slashType == JUMP_SLASH || this.slashType == DROP_SLASH)
                  {
                     startAnim(LIGHTFALLSLASH_END);
                  }
                  else if(this.slashType == UP_SLASH)
                  {
                     startAnim(LIGHTJUMPSLASH_LAND);
                  }
                  else if(this.slashType == HOR_SLASHDOWN)
                  {
                     startAnim(LIGHTSLASHDOWN_END);
                  }
                  else if(this.slashType == HOR_SLASHUP)
                  {
                     startAnim(LIGHTSLASHUP_END);
                  }
                  else
                  {
                     startAnim(LIGHTSLASH_END);
                  }
               }
               else if(this.stance == BALANCED_STANCE)
               {
                  if(this.slashType == JUMP_SLASH || this.slashType == DROP_SLASH)
                  {
                     startAnim(BALANCEDFALLSLASH_END);
                  }
                  else if(this.slashType == UP_SLASH)
                  {
                     startAnim(BALANCEDJUMPSLASH_LAND);
                  }
                  else if(this.slashType == HOR_SLASHDOWN)
                  {
                     startAnim(BALANCEDSLASHDOWN_END);
                  }
                  else if(this.slashType == HOR_SLASHUP)
                  {
                     startAnim(BALANCEDSLASHUP_END);
                  }
                  else
                  {
                     startAnim(BALANCEDSLASH_END);
                  }
               }
               else if(this.stance == HEAVY_STANCE)
               {
                  if(this.slashType == JUMP_SLASH || this.slashType == DROP_SLASH)
                  {
                     startAnim(HEAVYFALLSLASH_END);
                  }
                  else if(this.slashType == UP_SLASH)
                  {
                     startAnim(HEAVYJUMPSLASH_LAND);
                  }
                  else if(this.slashType == HOR_SLASHDOWN)
                  {
                     startAnim(HEAVYSLASHDOWN_END);
                  }
                  else if(this.slashType == HOR_SLASHUP)
                  {
                     startAnim(HEAVYSLASHUP_END);
                  }
                  else
                  {
                     startAnim(HEAVYSLASH_END);
                  }
               }
               else if(this.stance == DUAL_STANCE)
               {
                  if(this.slashType == JUMP_SLASH || this.slashType == DROP_SLASH)
                  {
                     startAnim(DUALFALLSLASH_END);
                  }
                  else if(this.slashType == UP_SLASH)
                  {
                     startAnim(DUALJUMPSLASH_LAND);
                  }
                  else if(this.slashType == HOR_SLASHDOWN)
                  {
                     startAnim(DUALSLASHDOWN_END);
                  }
                  else if(this.slashType == HOR_SLASHUP)
                  {
                     startAnim(DUALSLASHUP_END);
                  }
                  else
                  {
                     startAnim(DUALSLASH_END);
                  }
               }
               else if(this.stance == REVERSED_STANCE)
               {
                  if(this.slashType == JUMP_SLASH || this.slashType == DROP_SLASH)
                  {
                     startAnim(REVERSEDFALLSLASH_END);
                  }
                  else if(this.slashType == UP_SLASH)
                  {
                     startAnim(REVERSEDJUMPSLASH_LAND);
                  }
                  else
                  {
                     startAnim(REVERSEDSLASH_END);
                  }
               }
               this.checkNextSlash();
               break;
            case REDFREEZE_STATE:
               if(mcs.animation == DOWNSTAB)
               {
                  gotHitCounter = 24;
               }
               else if(this.controlledBy == 0)
               {
                  gotHitCounter = 84;
               }
               else
               {
                  gotHitCounter = 12;
               }
               break;
            case GOTLAUNCHED_STATE:
               startAnim(GOTLAUNCHED_RISE);
               break;
            case KNOCKDOWNED_STATE:
            case DOWNED_STATE:
               startAnim(GOTLAUNCHEDDOWNED);
               break;
            case FORWARDROLL_STATE:
               startAnim(FORWARDROLL_START);
               break;
            case JUMP_STATE:
               startAnim(SHEATHEDJUMP);
               velY = -30;
               break;
            case LAND_STATE:
               startAnim(SHEATHEDLAND);
               velY = 0;
               break;
            case SMOKEBOMB_STATE:
               startAnim(NINJASMOKEBOMB);
               break;
            case SMOKEBOMB2_STATE:
               if(prevActionState == DOWNED_STATE || prevActionState == KNOCKDOWNED_STATE || prevActionState == GOTLAUNCHED_STATE || prevActionState == FLY_STATE || prevActionState == FALL_STATE || prevActionState == GOTLAUNCHED_STATE || prevActionState == JUMP_STATE || prevActionState == VICTIM_STATE)
               {
                  ProjectileManager.createSmoke3(getMapPosition(),getMCS().y);
                  if(getMCS().y < StageManager.getGroundY() - 100)
                  {
                     if(getMCS().isFacingRight())
                     {
                        this.movePlayer(100);
                     }
                     else
                     {
                        this.movePlayer(-100);
                     }
                     getMCS().y = StageManager.getGroundY();
                     this.startAction(LAND_STATE);
                     StageManager.keepPlayerInView();
                     ProjectileManager.createSmoke2(getMapPosition(),getMCS().y);
                  }
                  else
                  {
                     if(getMCS().isFacingRight())
                     {
                        this.movePlayer(100);
                     }
                     else
                     {
                        this.movePlayer(-100);
                     }
                     if(getMCS().isFacingRight())
                     {
                        velX = 3;
                     }
                     velX = -3;
                     getMCS().y = getMCS().y - 250;
                     velY = 0;
                     this.startAction(FALL_STATE);
                     StageManager.keepPlayerInView();
                     ProjectileManager.createSmoke2(getMapPosition(),getMCS().y);
                  }
                  if((prevActionState == DOWNED_STATE || prevActionState == KNOCKDOWNED_STATE || prevActionState == FLY_STATE) && this.controlledBy != 0)
                  {
                     if(!StageManager.isRedFreeze())
                     {
                        mcs.showHealthBar();
                     }
                     mcs.moveHealthBarX(0);
                  }
               }
               else
               {
                  startAnim(NINJASMOKEBOMB);
               }
               break;
            case LOGSUBSTITUTION_STATE:
               ProjectileManager.createProjectile(ProjectileManager.PROJ_LOGSMOKE,getMapPosition(),getMCS().y,0,0,0,0,this);
               if(getMCS().y < StageManager.getGroundY() - 100)
               {
                  if(getMCS().isFacingRight())
                  {
                     this.movePlayer(100);
                  }
                  else
                  {
                     this.movePlayer(-100);
                  }
                  getMCS().y = StageManager.getGroundY();
                  this.startAction(LAND_STATE);
                  StageManager.keepPlayerInView();
                  ProjectileManager.createSmoke2(getMapPosition(),getMCS().y);
               }
               else
               {
                  getMCS().y = StageManager.getGroundY();
                  if(getMCS().isFacingRight())
                  {
                     this.movePlayer(400);
                  }
                  else
                  {
                     this.movePlayer(-400);
                  }
                  this.startAction(LAND_STATE);
                  StageManager.keepPlayerInView();
                  ProjectileManager.createSmoke2(getMapPosition(),getMCS().y);
               }
               break;
            case WINDKICK_STATE:
               if(getMCS().isFacingRight())
               {
                  velX = 2;
               }
               else
               {
                  velX = -2;
               }
               break;
            case SKILL_SPIRITTHIEF_STATE:
               spiritThiefLvl = this.getSkillLevel(SkillManager.SKILL_SPIRITTHIEF);
               if(spiritThiefLvl == 1)
               {
                  chiDamage = 20;
               }
               else if(spiritThiefLvl == 2)
               {
                  chiDamage = 35;
               }
               else if(spiritThiefLvl == 3)
               {
                  chiDamage = 50;
               }
               damageObj = new Damage(0,chiDamage,Damage.KNEEGROIN);
               damageObj.setFlyVel(getMapPosition(),getMCS().y);
               if(this.controlledBy == 0)
               {
                  hitArray = NPCManager.getHitArray(getMCS(),true);
                  if(hitArray.length > 0)
                  {
                     victim = hitArray[0];
                     if(victim.getMapPosition() > getMapPosition())
                     {
                        getMCS().faceRight();
                     }
                     else
                     {
                        getMCS().faceLeft();
                     }
                     if(victim is MCSPlayer && !victim.isDowned())
                     {
                        mcsplayer = MCSPlayer(victim);
                        if(!mcsplayer.hasLogSub())
                        {
                           if(mcsplayer.getChi() < chiDamage)
                           {
                              chiDamage = mcsplayer.getChi();
                           }
                           this.setChi(this.getChi() + chiDamage);
                           if(this.getChi() > this.maxchi)
                           {
                              this.setChi(this.maxchi);
                           }
                           StageManager.getBattleUI().updateChi(this.getChi(),this.maxchi);
                           if(chiDamage > 0)
                           {
                              ProjectileManager.createFloatingText(mcs.x,mcs.y - 100,chiDamage.toString(),3394815);
                           }
                        }
                     }
                     victim.checkHitObject(getMCS(),damageObj,true);
                  }
               }
               else if(this.controlledBy == 1 || this.controlledBy == 3)
               {
                  faceTarget();
                  target.checkHitObject(getMCS(),damageObj,true);
               }
               break;
            case SKILL_BACKTHROW_STATE:
               if(this.controlledBy != 0)
               {
                  mcs.hideHealthBar();
               }
               else
               {
                  mcs.showDisplayName(false);
               }
               damageObj = new Damage(0,0,Damage.BACKTHROW);
               damageObj.setFlyVel(getMapPosition(),getMCS().y);
               if(this.controlledBy == 0)
               {
                  hitArray = NPCManager.getHitArray(getMCS(),true);
                  if(hitArray.length > 0)
                  {
                     victim = hitArray[0];
                     if(victim.getMapPosition() > getMapPosition())
                     {
                        getMCS().faceRight();
                     }
                     else
                     {
                        getMCS().faceLeft();
                     }
                     victim.checkHitObject(getMCS(),damageObj,true);
                  }
               }
               else if(this.controlledBy == 1 || this.controlledBy == 3)
               {
                  faceTarget();
                  target.checkHitObject(getMCS(),damageObj,true);
               }
               break;
            case SKILL_DEATHTOUCH_STATE:
               if(getMCS().isFacingRight())
               {
                  velX = 1;
                  victimpos = getMapPosition() + 65;
               }
               else
               {
                  velX = -1;
                  victimpos = getMapPosition() - 65;
               }
               projectile = ProjectileManager.createProjectile(ProjectileManager.PROJ_YINYANG,getMapPosition(),getMCS().y,victimpos,0,0,1,this);
               break;
            case CHARGING_STATE:
               this.chargingTime = 24;
               if(getMCS().isFacingRight())
               {
                  fxPos = getMapPosition() + 25;
               }
               else
               {
                  fxPos = getMapPosition() - 25;
               }
               this.chargingFx = ProjectileManager.createProjectile(ProjectileManager.PROJ_CHARGINGSHOTFX,fxPos,getMCS().y - 40,0,0,0,0,this);
               break;
            case SKILL_SHUNPO_STATE:
               this.chargingTime = 3 * 24;
               if(getMCS().isFacingRight())
               {
                  fxPos = getMapPosition() + 27;
               }
               else
               {
                  fxPos = getMapPosition() - 27;
               }
               this.chargingFx = ProjectileManager.createProjectile(ProjectileManager.PROJ_CHARGINGFX,fxPos,getMCS().y - 27,0,0,0,0,this);
               break;
            case SKILL_THOUSANDSTABS_STATE:
               this.chargingTime = 3 * 24;
               if(getMCS().isFacingRight())
               {
                  fxPos = getMapPosition() - 8;
               }
               else
               {
                  fxPos = getMapPosition() + 8;
               }
               this.chargingFx = ProjectileManager.createProjectile(ProjectileManager.PROJ_CHARGINGFX,fxPos,getMCS().y - 76,0,0,0,0,this);
               break;
            case SKILL_DEADLYCLEAVE_STATE:
               this.chargingTime = 4 * 24;
               if(getMCS().isFacingRight())
               {
                  fxPos = getMapPosition() - 31;
               }
               else
               {
                  fxPos = getMapPosition() + 31;
               }
               this.chargingFx = ProjectileManager.createProjectile(ProjectileManager.PROJ_CHARGINGFX,fxPos,getMCS().y - 30,0,0,0,0,this);
               break;
            case DOSKILL_STATE:
               if((prevActionState == CHARGING_STATE || prevActionState == SKILL_SHUNPO_STATE || prevActionState == SKILL_THOUSANDSTABS_STATE || prevActionState == SKILL_DEADLYCLEAVE_STATE) && this.chargingFx != null)
               {
                  this.chargingFx.removeProjectile();
                  this.chargingFx = null;
               }
               if(prevActionState == SKILL_SHUNPO_STATE)
               {
                  if(getMCS().isFacingRight())
                  {
                     this.movePlayer(250);
                     ProjectileManager.createProjectile(ProjectileManager.PROJ_SHUNPOHIT,getMapPosition(),getMCS().y - 44,0,0,this.getDamage() * this.getChargingTime() / 2,level,this);
                  }
                  else
                  {
                     this.movePlayer(-250);
                     ProjectileManager.createProjectile(ProjectileManager.PROJ_SHUNPOHIT,getMapPosition(),getMCS().y - 44,-1,0,this.getDamage() * this.getChargingTime() / 2,level,this);
                  }
                  StageManager.keepPlayerInView();
                  this.chargingTime = 0;
               }
               else if(prevActionState == SKILL_THOUSANDSTABS_STATE)
               {
                  gotHitCounter = 26;
               }
               else if(prevActionState == SKILL_DEADLYCLEAVE_STATE)
               {
                  gotHitCounter = 16;
               }
               else
               {
                  currentAnim = getAnim();
                  if(currentAnim == PUNCH_START)
                  {
                     if(getMCS().isFacingRight())
                     {
                        pvelX = 1;
                     }
                     else
                     {
                        pvelX = -1;
                     }
                     ProjectileManager.createProjectile(ProjectileManager.PROJ_CHIPUNCH,getMapPosition(),getMCS().y,pvelX,0,0,StatsManager.getStat(SkillManager.SKILL_CHIPUNCH),this);
                  }
                  else if(currentAnim == SPARTAKICK_START)
                  {
                     if(getMCS().isFacingRight())
                     {
                        pvelX = 1;
                     }
                     else
                     {
                        pvelX = -1;
                     }
                     ProjectileManager.createProjectile(ProjectileManager.PROJ_CHIKICK,getMapPosition(),getMCS().y,pvelX,0,0,StatsManager.getStat(SkillManager.SKILL_CHIKICK),this);
                  }
               }
               break;
            case DASH_STATE:
               startAnim(DASH_START);
               if(getMCS().isFacingRight())
               {
                  velX = 50;
               }
               else
               {
                  velX = -50;
               }
               this.chargingFx = new DashFX();
               getMCS().addChild(this.chargingFx);
               break;
            case BACKSTEP_STATE:
               startAnim(BACKSTEP_START);
               if(getMCS().isFacingRight())
               {
                  velX = -50;
               }
               else
               {
                  velX = 50;
               }
               this.chargingFx = new DashFX();
               getMCS().addChild(this.chargingFx);
               this.chargingFx.scaleX = -1;
               break;
            case SKILL_FLASHBANG_STATE:
               startAnim(NINJASMOKEBOMB);
               break;
            case SKILL_STEALTH_STATE:
               startAnim(FOCUS_START);
               break;
            case SKILL_SHADOWCLONE_STATE:
               NPCManager.createClone(this);
               startAnim(FOCUS_START);
               break;
            case SKILL_MASSCLONE_STATE:
               NPCManager.createMassClone(this);
               startAnim(FOCUS_START);
               break;
            case SKILL_SUBSTITUTIONLOG_STATE:
               logsublvl = this.getSkillLevel(SkillManager.SKILL_SUBSTITUTIONLOG);
               if(logsublvl == 1)
               {
                  this.logsubCounter = 24 * 5;
               }
               else if(logsublvl == 2)
               {
                  this.logsubCounter = 24 * 10;
               }
               else if(logsublvl == 3)
               {
                  this.logsubCounter = 24 * 15;
               }
               if(this.controlledBy == 0 && this.logIcon == null)
               {
                  this.logIcon = new LogIcon();
                  this.logIcon.alpha = 0.5;
                  mcs.partList[MCSCharacter.PART_torso].addChild(this.logIcon);
               }
               startAnim(FOCUS_START);
               break;
            case SKILL_BULLCHARGE_STATE:
               startAnim(BULLCHARGE_START);
               this.bullChargeTime = 0;
               break;
            case SKILL_UNDYING_STATE:
               setHP(1);
               mcs.y = StageManager.getGroundY();
               startAnim(ENEMYDEATH);
               mcs.moveHealthBarX(-180);
               break;
            case SKILL_CHICHARGE_STATE:
               this.chargingTime = 0;
         }
      }
      
      override internal function doAction() : *
      {
         var groundY:int = 0;
         var fdamageObj:Damage = null;
         var damage:Damage = null;
         var damageObj:Damage = null;
         var skilllvl:int = 0;
         var newchi:int = 0;
         switch(actionState)
         {
            case IDLE_STATE:
               break;
            case RUN_STATE:
               if(!this.movement(runSpeed))
               {
                  velX = 0;
                  if(this.hasSlash)
                  {
                     this.startAction(SLASH_STATE);
                  }
                  else
                  {
                     this.startAction(IDLE_STATE);
                  }
               }
               break;
            case WALK_STATE:
               if(!this.movement(walkSpeed))
               {
                  velX = 0;
                  if(this.hasSlash)
                  {
                     this.startAction(SLASH_STATE);
                  }
                  else
                  {
                     this.startAction(IDLE_STATE);
                  }
               }
               break;
            case FALL_STATE:
               velY += gravity;
               mcs.y += velY;
               this.movePlayer(velX);
               groundY = this.getGroundY();
               if(this.stance == LIGHT_STANCE && this.hasSlash && Math.abs(this.slashArray[0].x - posX) < 50)
               {
                  this.startAction(SLASH_STATE);
               }
               else if(mcs.y >= groundY)
               {
                  mcs.y = groundY;
                  this.startAction(POSE_STATE);
                  damage = new Damage(this.slashDamage,level,0,this.stance);
                  damage.setPiercingDamage(this.STAT_PIERCINGDMG);
                  if(this.controlledBy == 0)
                  {
                     NPCManager.checkHitObject(mcs.partList[MCSCharacter.PART_weapon],damage,100,true,mcs);
                  }
                  else if(this.controlledBy == 1)
                  {
                     target.checkHitObject(mcs.partList[MCSCharacter.PART_weapon],damage);
                  }
               }
               break;
            case GOTLAUNCHED_STATE:
               this.doLaunched();
               break;
            case FLY_STATE:
               this.doFly();
               break;
            case STUN_STATE:
               doStun();
               break;
            case DOWNED_STATE:
               break;
            case SLASH_STATE:
               this.doSlash();
               break;
            case REDFREEZE_STATE:
               if(gotHitCounter == 0)
               {
                  gotHitCounter = -1;
                  if(mcs.animation == DOWNSTAB)
                  {
                     startAnim(DOWNSTAB_UP);
                  }
                  else
                  {
                     startAnim(SHEATHESWORDCHIBURI);
                  }
               }
               break;
            case FORWARDROLL_STATE:
               if(mcs.animation == FORWARDROLL_END)
               {
                  if(mcs.isFacingRight())
                  {
                     this.movePlayer(10);
                  }
                  else
                  {
                     this.movePlayer(-10);
                  }
               }
               break;
            case JUMP_STATE:
               mcs.y += velY;
               velY += 4;
               if(mcs.isFacingRight())
               {
                  this.movePlayer(8);
               }
               else
               {
                  this.movePlayer(-8);
               }
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
            case WINDKICK_STATE:
               this.movePlayer(velX);
               break;
            case SKILL_DEATHTOUCH_STATE:
               if(mcs.animation == DEATHTOUCH_PARTB)
               {
                  this.movePlayer(velX);
               }
               break;
            case CHARGING_STATE:
            case SKILL_SHUNPO_STATE:
            case SKILL_THOUSANDSTABS_STATE:
            case SKILL_DEADLYCLEAVE_STATE:
               ++this.chargingTime;
               break;
            case DOSKILL_STATE:
               if(mcs.animation == FLURRY_PARTC)
               {
                  if(mcs.isFacingRight())
                  {
                     this.movePlayer(15);
                  }
                  else
                  {
                     this.movePlayer(-15);
                  }
                  fdamageObj = new Damage(this.getDamage() * this.getChargingTime() / 2,level,Damage.LAUNCH_KNOCKDOWN,BALANCED_STANCE);
                  if(this.controlledBy == 0)
                  {
                     NPCManager.checkHitObject(mcs.partList[MCSCharacter.PART_weapon],fdamageObj,100,true,mcs);
                  }
                  else if(this.controlledBy == 1)
                  {
                     target.checkHitObject(mcs.partList[MCSCharacter.PART_weapon],fdamageObj);
                  }
               }
               else if(mcs.animation == FLURRY_PARTD)
               {
                  fdamageObj = new Damage(this.getDamage() * this.getChargingTime() / 2,level,Damage.LAUNCH_KNOCKDOWN,BALANCED_STANCE);
                  if(this.controlledBy == 0)
                  {
                     NPCManager.checkHitObject(mcs.partList[MCSCharacter.PART_weapon],fdamageObj,100,true,mcs);
                  }
                  else if(this.controlledBy == 1)
                  {
                     target.checkHitObject(mcs.partList[MCSCharacter.PART_weapon],fdamageObj);
                  }
               }
               else if(mcs.animation == AIRSTAB_MID)
               {
                  if(mcs.isFacingRight())
                  {
                     this.movePlayer(10);
                  }
                  else
                  {
                     this.movePlayer(-10);
                  }
               }
               else if(mcs.animation == PUNCHLUNGE_MID)
               {
                  fdamageObj = new Damage(this.getDamage(),level,Damage.LAUNCH_FLY);
                  if(mcs.isFacingRight())
                  {
                     this.movePlayer(30);
                     fdamageObj.setFlyVel(35,-6);
                  }
                  else
                  {
                     this.movePlayer(-30);
                     fdamageObj.setFlyVel(-35,-6);
                  }
                  if(this.controlledBy == 0)
                  {
                     NPCManager.checkHitObject(mcs.partList[MCSCharacter.PART_r_hand],fdamageObj,100,true,mcs);
                  }
                  else if(this.controlledBy == 1)
                  {
                     target.checkHitObject(mcs.partList[MCSCharacter.PART_r_hand],fdamageObj);
                  }
               }
               else if(mcs.animation == PUNCHLUNGE_END && mcs.frameCounter <= 3)
               {
                  if(mcs.isFacingRight())
                  {
                     this.movePlayer(4);
                  }
                  else
                  {
                     this.movePlayer(-4);
                  }
               }
               break;
            case DASH_STATE:
            case BACKSTEP_STATE:
               this.movePlayer(velX);
               break;
            case POSE_STATE:
               switch(mcs.animation)
               {
                  case LIGHTSLASH_END:
                  case LIGHTSLASHDOWN_END:
                  case LIGHTSLASHUP_END:
                  case BALANCEDSLASH_END:
                  case BALANCEDSLASHDOWN_END:
                  case BALANCEDSLASHUP_END:
                  case HEAVYSLASH_END:
                  case HEAVYSLASHDOWN_END:
                  case HEAVYSLASHUP_END:
                  case DUALSLASH_END:
                  case DUALSLASHDOWN_END:
                  case DUALSLASHUP_END:
                  case REVERSEDSLASH_END:
                     damage = new Damage(this.slashDamage,level,0,this.stance);
                     damage.setPiercingDamage(this.STAT_PIERCINGDMG);
                     if(this.controlledBy == 0)
                     {
                        NPCManager.checkHitObject(mcs.partList[MCSCharacter.PART_weapon],damage,100,true,mcs);
                     }
                     if(this.controlledBy == 1)
                     {
                        target.checkHitObject(mcs.partList[MCSCharacter.PART_weapon],damage);
                     }
               }
            case SKILL_BULLCHARGE_STATE:
               if(mcs.animation == BULLCHARGE_RUN)
               {
                  if(this.bullChargeTime < 30)
                  {
                     ++this.bullChargeTime;
                  }
                  if(mcs.isFacingRight())
                  {
                     this.movePlayer(10 + this.bullChargeTime);
                  }
                  else
                  {
                     this.movePlayer(-10 - this.bullChargeTime);
                  }
                  damageObj = new Damage(this.getDamage(),level,Damage.LAUNCH_AIR);
                  if(this.controlledBy == 0)
                  {
                     NPCManager.checkHitObject(mcs,damageObj,100,true,mcs);
                  }
                  else if(this.controlledBy == 1)
                  {
                     target.checkHitObject(mcs,damageObj);
                  }
                  if(posX <= 50)
                  {
                     this.startAction(IDLE_STATE);
                  }
                  else if(posX >= StageManager.getGameStageWidth() - 50)
                  {
                     this.startAction(IDLE_STATE);
                  }
               }
               break;
            case SKILL_UNDYING_STATE:
               if(this.getSkillLevel(SkillManager.SKILL_UNDYING) == 2)
               {
                  setHP(getHP() + maxhp / (24 * 6));
               }
               else
               {
                  setHP(getHP() + maxhp / (24 * 12));
               }
               getMCS().updateHealthBar(getHP() / maxhp);
               if(getHP() >= maxhp && getAnim() != ZOM_GETUP)
               {
                  startAnim(ZOM_GETUP);
                  getMCS().hideHealthBar();
                  if(mcs.isFacingRight())
                  {
                     movePositionX(-100);
                  }
                  else
                  {
                     movePositionX(100);
                  }
                  this.minDamage *= 0.8;
                  setHP(maxhp);
               }
               break;
            case SKILL_CHICHARGE_STATE:
               ++this.chargingTime;
               if(this.chargingTime >= 24)
               {
                  this.chargingTime = 0;
                  skilllvl = this.getSkillLevel(SkillManager.SKILL_CHICHARGE);
                  if(skilllvl == 1)
                  {
                     newchi = this.getChi() + 1;
                  }
                  else if(skilllvl == 2)
                  {
                     newchi = this.getChi() + 2;
                  }
                  else if(skilllvl == 3)
                  {
                     newchi = this.getChi() + 3;
                  }
                  if(newchi > this.maxchi)
                  {
                     newchi = this.maxchi;
                     if(this.controlledBy != 2)
                     {
                        if(mcs.isFacingRight())
                        {
                           movePositionX(16);
                        }
                        else
                        {
                           movePositionX(-16);
                        }
                        if(this.chargingFx != null)
                        {
                           this.chargingFx.removeProjectile();
                           this.chargingFx = null;
                        }
                        startAnim(CHICHARGE_END);
                     }
                  }
                  this.setChi(newchi);
                  if(this.controlledBy == 0)
                  {
                     StageManager.getBattleUI().updateChi(this.getChi(),this.maxchi);
                  }
               }
         }
      }
      
      internal function lineArrayDeepCopy(lineArray:Vector.<Point>, offset:int = 0) : Vector.<Point>
      {
         var max:int = int(lineArray.length);
         var output:Vector.<Point> = new Vector.<Point>();
         for(var i:int = 0; i < max; i++)
         {
            output.push(new Point(lineArray[i].x + offset,lineArray[i].y));
         }
         return output;
      }
      
      public function gotInput(lineArray:Vector.<Point>, isLine:Boolean, posX:int = -1) : *
      {
         var max:int = 0;
         var i:int = 0;
         var dist:int = 0;
         if(getHP() <= 0 || dead || actionState == GOTLAUNCHED_STATE || this.isUsingSkill() || actionState == STUN_STATE || actionState == FLY_STATE)
         {
            InputManager.clearCanvas();
            return;
         }
         var offset:int = StageManager.getStagePosition();
         var lineArrayCopy:Vector.<Point> = this.lineArrayDeepCopy(lineArray);
         if(StageManager.isPeaceful())
         {
            InputManager.clearCanvas();
            if(isLine)
            {
               isLine = false;
               lineArray[lineArray.length - 1].x += offset;
               this.initMove(lineArray[lineArray.length - 1]);
               if((this.controlledBy == 0 || this.controlledBy == 3) && NetworkManager.instance.isP2P())
               {
                  NetworkManager.instance.sendMove(lineArrayCopy,offset,getMapPosition());
               }
               return;
            }
         }
         if(this.slashCommitted || actionState == FALL_STATE && this.stance != LIGHT_STANCE || actionState == GOTLAUNCHED_STATE || isDowned() || actionState == JUMP_STATE || actionState == FORWARDROLL_STATE)
         {
            if(isLine)
            {
               this.slashArrayBuffer = this.lineArrayDeepCopy(lineArray,offset);
               this.hasSlashBuffer = true;
               if((this.controlledBy == 0 || this.controlledBy == 3) && NetworkManager.instance.isP2P())
               {
                  NetworkManager.instance.sendMove(lineArrayCopy,offset,getMapPosition());
               }
            }
         }
         else if(!this.slashCommitted)
         {
            if(isLine)
            {
               this.slashArray = this.lineArrayDeepCopy(lineArray,offset);
               this.initSlash(this.slashArray[0]);
               if((this.controlledBy == 0 || this.controlledBy == 3) && NetworkManager.instance.isP2P())
               {
                  NetworkManager.instance.sendMove(lineArrayCopy,offset,getMapPosition());
               }
            }
            else
            {
               dist = lineArray[0].x - getMCS().x;
               if(dist * dist < 625)
               {
                  return;
               }
               if(actionState != FALL_STATE && actionState != GOTLAUNCHED_STATE && actionState != DOWNED_STATE && actionState != JUMP_STATE && actionState != FORWARDROLL_STATE && actionState != SLASH_STATE)
               {
                  lineArray[0].x += offset;
                  this.initMove(lineArray[0]);
                  if((this.controlledBy == 0 || this.controlledBy == 3) && NetworkManager.instance.isP2P())
                  {
                     NetworkManager.instance.sendMove(lineArrayCopy,offset,getMapPosition());
                  }
               }
            }
         }
      }
      
      internal function initMove(dest:Point) : *
      {
         this.destX = dest.x;
         var dist:int = posX - this.destX;
         if(GameEngine.isAdventureMode() && (dist * dist < 625 || actionState == JUMP_STATE || actionState == FALL_STATE || isDowned() || isAirborne() || actionState == GOTLAUNCHED_STATE))
         {
            return;
         }
         if(this.destX < 0)
         {
            this.destX = 0;
         }
         else if(this.destX > StageManager.getGameStageWidth())
         {
            this.destX = StageManager.getGameStageWidth();
         }
         this.destY = dest.y;
         this.hasSlash = false;
         this.hasSlashBuffer = false;
         if(dist * dist <= 10000)
         {
            this.startAction(WALK_STATE);
         }
         else
         {
            this.startAction(RUN_STATE);
         }
      }
      
      public function walkTo(dest:int) : *
      {
         this.destX = dest;
         if(this.destX < 0)
         {
            this.destX = 0;
         }
         else if(this.destX > StageManager.getGameStageWidth())
         {
            this.destX = StageManager.getGameStageWidth();
         }
         this.hasSlash = false;
         this.hasSlashBuffer = false;
         this.startAction(WALK_STATE);
      }
      
      public function stopMoving(informNetwork:Boolean = true) : *
      {
         var lineArray:Vector.<Point> = null;
         if(actionState == IDLE_STATE)
         {
            return;
         }
         this.destX = posX;
         this.destY = mcs.y;
         this.hasSlash = false;
         this.hasSlashBuffer = false;
         this.startAction(IDLE_STATE);
         if(InventoryUI.instance.visible)
         {
            startAnim(IDLE_SHEATHED);
         }
         StageManager.clearInteractTarget();
         if(this.controlledBy == 0 && informNetwork && NetworkManager.instance.isP2P())
         {
            lineArray = new Vector.<Point>();
            lineArray.push(new Point(posX,this.destY));
            NetworkManager.instance.sendMove(lineArray,0,getMapPosition());
         }
      }
      
      public function isIdle() : Boolean
      {
         return actionState == IDLE_STATE;
      }
      
      public function isUsingSkill() : Boolean
      {
         return actionState == DOSKILL_STATE || actionState == SKILL_GROUNDPUNCH_STATE || actionState == SKILL_CHIBURST_STATE || actionState == WINDKICK_STATE || actionState == SKILL_THOUSANDSTABS_STATE || actionState == SKILL_DEATHTOUCH_STATE || actionState == SKILL_SPIRITTHIEF_STATE || actionState == DASH_STATE || actionState == BACKSTEP_STATE || this.isCharging() || actionState == SKILL_FLASHBANG_STATE || actionState == SKILL_STEALTH_STATE || actionState == SKILL_SHADOWCLONE_STATE || actionState == SKILL_MASSCLONE_STATE || actionState == SKILL_SUBSTITUTIONLOG_STATE || actionState == SKILL_BACKTHROW_STATE || actionState == SKILL_BULLCHARGE_STATE || actionState == SKILL_INFERNO_STATE || actionState == SKILL_TSUNAMI_STATE || actionState == SKILL_EARTHQUAKE_STATE || actionState == SKILL_TORNADO_STATE;
      }
      
      public function isCharging() : Boolean
      {
         return actionState == SKILL_SHUNPO_STATE || actionState == SKILL_THOUSANDSTABS_STATE || actionState == SKILL_DEADLYCLEAVE_STATE || actionState == CHARGING_STATE;
      }
      
      internal function initSlash(firstPt:Point) : *
      {
         var diff:int = 0;
         var index:int = 0;
         this.cancelStealth();
         this.destX = firstPt.x;
         this.destY = firstPt.y;
         if(this.destX < 0)
         {
            this.destX = 0;
         }
         else if(this.destX > StageManager.getGameStageWidth())
         {
            this.destX = StageManager.getGameStageWidth();
         }
         this.hasSlash = true;
         this.hasSlashBuffer = false;
         this.slashType = HOR_SLASH;
         var lastPt:Point = this.slashArray[this.slashArray.length - 1];
         if(this.stance == LIGHT_STANCE && actionState == FALL_STATE)
         {
            if(this.destY - mcs.y > 100)
            {
               this.slashType = DROP_SLASH;
            }
            else
            {
               this.slashType = AIR_SLASH;
            }
         }
         else if(mcs.y - this.destY > jumpThreshhold)
         {
            this.slashType = JUMP_SLASH;
         }
         else if(this.canStab && this.destY < lastPt.y && Math.abs(this.destX - lastPt.x) < 50)
         {
            this.slashType = DOWNSTAB_SLASH;
         }
         else if(this.destY - lastPt.y > jumpThreshhold && !isAirborne())
         {
            this.slashType = UP_SLASH;
         }
         else
         {
            diff = this.destY - lastPt.y;
            if(diff > 25)
            {
               this.slashType = HOR_SLASHUP;
            }
            else if(diff < -25)
            {
               this.slashType = HOR_SLASHDOWN;
            }
         }
         if(this.slashType == DOWNSTAB_SLASH)
         {
            if(mcs.x < this.destX)
            {
               this.destX -= 55;
            }
            else
            {
               this.destX += 55;
            }
            if(this.destX < 0)
            {
               this.destX = 0;
            }
            else if(this.destX > StageManager.getGameStageWidth())
            {
               this.destX = StageManager.getGameStageWidth();
            }
         }
         if(actionState != GOTLAUNCHED_STATE && Math.abs(this.destX - posX) < standingRange)
         {
            index = InputManager.lengthThreshhold - 1;
            if(index < 0)
            {
               index = 0;
            }
            else if(index >= this.slashArray.length)
            {
               index = this.slashArray.length - 1;
            }
            if(posX < this.slashArray[index].x)
            {
               mcs.faceRight();
            }
            else
            {
               mcs.faceLeft();
            }
            this.startAction(SLASH_STATE);
         }
         else if(actionState != FALL_STATE)
         {
            this.startAction(RUN_STATE);
         }
      }
      
      internal function checkNextSlash() : *
      {
         if(this.hasSlash)
         {
            this.initSlash(this.slashArray[0]);
         }
         else if(this.hasSlashBuffer)
         {
            this.slashArray = this.slashArrayBuffer;
            this.initSlash(this.slashArray[0]);
         }
      }
      
      internal function startSlash() : *
      {
         var slashSpeed:int = 0;
         this.slashCommitted = true;
         if(this.slashType != DOWNSTAB_SLASH)
         {
            if(this.slashArray[0].x < this.slashArray[this.slashArray.length - 1].x)
            {
               mcs.faceRight();
            }
            else
            {
               mcs.faceLeft();
            }
         }
         if(this.slashType == DOWNSTAB_SLASH)
         {
            if(this.controlledBy == 0)
            {
               InputManager.clearCanvas();
            }
            mcs.y = this.getGroundY();
            startAnim(DOWNSTAB);
         }
         else if(this.stance == LIGHT_STANCE)
         {
            if(this.slashType == HOR_SLASH)
            {
               startAnim(LIGHTSLASH_START);
            }
            else if(this.slashType == HOR_SLASHDOWN)
            {
               startAnim(LIGHTSLASHDOWN_START);
            }
            else if(this.slashType == HOR_SLASHUP)
            {
               startAnim(LIGHTSLASHUP_START);
            }
            else if(this.slashType == JUMP_SLASH)
            {
               startAnim(LIGHTJUMPSLASH_START);
            }
            else if(this.slashType == DROP_SLASH)
            {
               startAnim(LIGHTFALLSLASH_START);
            }
            else if(this.slashType == UP_SLASH)
            {
               startAnim(LIGHTJUMPSLASH_START);
            }
            else if(this.slashType == AIR_SLASH)
            {
               startAnim(LIGHTJUMPSLASH_RISE);
            }
            slashSpeed = lightSlashSpeed;
         }
         else if(this.stance == BALANCED_STANCE)
         {
            if(this.slashType == HOR_SLASH)
            {
               startAnim(BALANCEDSLASH_START);
            }
            else if(this.slashType == HOR_SLASHDOWN)
            {
               startAnim(BALANCEDSLASHDOWN_START);
            }
            else if(this.slashType == HOR_SLASHUP)
            {
               startAnim(BALANCEDSLASHUP_START);
            }
            else if(this.slashType == JUMP_SLASH)
            {
               startAnim(BALANCEDJUMPSLASH_START);
            }
            else if(this.slashType == DROP_SLASH)
            {
               startAnim(BALANCEDFALLSLASH_START);
            }
            else if(this.slashType == UP_SLASH)
            {
               startAnim(BALANCEDJUMPSLASH_START);
            }
            slashSpeed = balancedSlashSpeed;
         }
         else if(this.stance == HEAVY_STANCE)
         {
            if(this.slashType == HOR_SLASH)
            {
               startAnim(HEAVYSLASH_START);
            }
            else if(this.slashType == HOR_SLASHDOWN)
            {
               startAnim(HEAVYSLASHDOWN_START);
            }
            else if(this.slashType == HOR_SLASHUP)
            {
               startAnim(HEAVYSLASHUP_START);
            }
            else if(this.slashType == JUMP_SLASH)
            {
               startAnim(HEAVYJUMPSLASH_START);
            }
            else if(this.slashType == DROP_SLASH)
            {
               startAnim(HEAVYFALLSLASH_START);
            }
            else if(this.slashType == UP_SLASH)
            {
               startAnim(HEAVYJUMPSLASH_START);
            }
            slashSpeed = heavySlashSpeed;
         }
         else if(this.stance == DUAL_STANCE)
         {
            if(this.slashType == HOR_SLASH)
            {
               startAnim(DUALSLASH_START);
            }
            else if(this.slashType == HOR_SLASHDOWN)
            {
               startAnim(DUALSLASHDOWN_START);
            }
            else if(this.slashType == HOR_SLASHUP)
            {
               startAnim(DUALSLASHUP_START);
            }
            else if(this.slashType == JUMP_SLASH)
            {
               startAnim(DUALJUMPSLASH_START);
            }
            else if(this.slashType == DROP_SLASH)
            {
               startAnim(DUALFALLSLASH_START);
            }
            else if(this.slashType == UP_SLASH)
            {
               startAnim(DUALJUMPSLASH_START);
            }
            slashSpeed = heavySlashSpeed;
         }
         else if(this.stance == REVERSED_STANCE)
         {
            if(this.slashType == HOR_SLASH || this.slashType == HOR_SLASHDOWN || this.slashType == HOR_SLASHUP)
            {
               startAnim(REVERSEDSLASH_START);
            }
            else if(this.slashType == JUMP_SLASH)
            {
               startAnim(REVERSEDJUMPSLASH_START);
            }
            else if(this.slashType == DROP_SLASH)
            {
               startAnim(REVERSEDFALLSLASH_START);
            }
            else if(this.slashType == UP_SLASH)
            {
               startAnim(REVERSEDJUMPSLASH_START);
            }
            slashSpeed = balancedSlashSpeed;
         }
         this.destX = this.slashArray[this.slashArray.length - 1].x;
         if(this.destX < 0)
         {
            this.destX = 0;
         }
         else if(this.destX > StageManager.getGameStageWidth())
         {
            this.destX = StageManager.getGameStageWidth();
         }
         if(this.slashArray[this.slashArray.length - 1].y > this.getGroundY() - jumpThreshhold)
         {
            this.destY = this.getGroundY();
         }
         else
         {
            this.destY = this.slashArray[this.slashArray.length - 1].y;
         }
         var xdiff:int = this.destX - posX;
         var ydiff:int = this.destY - this.slashArray[0].y;
         var dist:Number = Math.sqrt(xdiff * xdiff + ydiff * ydiff);
         var time:Number = dist / slashSpeed;
         velX = xdiff / time;
         velY = ydiff / time;
         this.slashDamage = this.getDamage();
         if(this.doShunpo)
         {
            setPosition(this.destX,this.destY);
            this.slashDamage *= 2;
            this.endSlash();
         }
      }
      
      internal function doSlash() : *
      {
         if(this.stance == LIGHT_STANCE && (mcs.animation == LIGHTSLASH_START || mcs.animation == LIGHTSLASH_MID || mcs.animation == LIGHTSLASHDOWN_START || mcs.animation == LIGHTSLASHDOWN_MID || mcs.animation == LIGHTSLASHUP_START || mcs.animation == LIGHTSLASHUP_MID || mcs.animation == LIGHTFALLSLASH_MID || mcs.animation == LIGHTJUMPSLASH_RISE))
         {
            if(!this.movement(lightSlashSpeed))
            {
               this.endSlash();
            }
            if(this.slashType != HOR_SLASH && this.slashType != HOR_SLASHDOWN && this.slashType != HOR_SLASHUP && mcs.y < StageManager.getGroundY())
            {
               mcs.y += velY;
            }
         }
         else if(this.stance == BALANCED_STANCE && (mcs.animation == BALANCEDSLASH_START || mcs.animation == BALANCEDSLASH_MID || mcs.animation == BALANCEDSLASHDOWN_START || mcs.animation == BALANCEDSLASHDOWN_MID || mcs.animation == BALANCEDSLASHUP_START || mcs.animation == BALANCEDSLASHUP_MID || mcs.animation == BALANCEDFALLSLASH_MID || mcs.animation == BALANCEDJUMPSLASH_RISE))
         {
            if(!this.movement(balancedSlashSpeed))
            {
               this.endSlash();
            }
            if(this.slashType != HOR_SLASH && this.slashType != HOR_SLASHDOWN && this.slashType != HOR_SLASHUP && mcs.y < StageManager.getGroundY())
            {
               mcs.y += velY;
            }
         }
         else if(this.stance == HEAVY_STANCE && (mcs.animation == HEAVYSLASH_START || mcs.animation == HEAVYSLASH_MID || mcs.animation == HEAVYSLASHDOWN_START || mcs.animation == HEAVYSLASHDOWN_MID || mcs.animation == HEAVYSLASHUP_START || mcs.animation == HEAVYSLASHUP_MID || mcs.animation == HEAVYFALLSLASH_MID || mcs.animation == HEAVYJUMPSLASH_RISE))
         {
            if(!this.movement(heavySlashSpeed))
            {
               this.endSlash();
            }
            if(this.slashType != HOR_SLASH && this.slashType != HOR_SLASHDOWN && this.slashType != HOR_SLASHUP && mcs.y < StageManager.getGroundY())
            {
               mcs.y += velY;
            }
         }
         else if(this.stance == DUAL_STANCE && (mcs.animation == DUALSLASH_START || mcs.animation == DUALSLASH_MID || mcs.animation == DUALSLASHDOWN_START || mcs.animation == DUALSLASHDOWN_MID || mcs.animation == DUALSLASHUP_START || mcs.animation == DUALSLASHUP_MID || mcs.animation == DUALFALLSLASH_MID || mcs.animation == DUALJUMPSLASH_RISE))
         {
            if(!this.movement(heavySlashSpeed))
            {
               this.endSlash();
            }
            if(this.slashType != HOR_SLASH && this.slashType != HOR_SLASHDOWN && this.slashType != HOR_SLASHUP && mcs.y < StageManager.getGroundY())
            {
               mcs.y += velY;
            }
         }
         else if(this.stance == REVERSED_STANCE && (mcs.animation == REVERSEDSLASH_START || mcs.animation == REVERSEDSLASH_MID || mcs.animation == REVERSEDFALLSLASH_MID || mcs.animation == REVERSEDJUMPSLASH_RISE))
         {
            if(!this.movement(balancedSlashSpeed))
            {
               this.endSlash();
            }
            if(this.slashType != HOR_SLASH && this.slashType != HOR_SLASHDOWN && this.slashType != HOR_SLASHUP && mcs.y < StageManager.getGroundY())
            {
               mcs.y += velY;
            }
         }
      }
      
      internal function endSlash() : *
      {
         var offset:int = StageManager.getStagePosition();
         if(this.controlledBy == 0)
         {
            InputManager.drawLine(this.slashArray,offset);
         }
         else if((StatsManager.getPlayer().canSeeSlash || GameEngine.isPlayBack() && GameEngine.isPlaybackClientShowSlash()) && !StageManager.isRedFreeze())
         {
            InputManager.drawEnemyLine(this.slashArray,offset,this.slashLength);
         }
         this.deductReloadBar();
         this.hasSlash = false;
         var launchType:int = Damage.LAUNCH_NONE;
         if(this.slashType == UP_SLASH && this.canLaunch)
         {
            launchType = Damage.LAUNCH_AIR;
         }
         var endSlashY:* = this.slashArray[this.slashArray.length - 1].y;
         var groundY:int = this.getGroundY();
         var damage:Damage = new Damage(this.slashDamage,level,launchType,this.stance);
         damage.setPiercingDamage(this.STAT_PIERCINGDMG);
         if(groundY - endSlashY > jumpThreshhold)
         {
            mcs.y = endSlashY + 90;
            velY = 0;
            this.startAction(FALL_STATE);
            if(this.controlledBy == 0 || this.controlledBy == 3)
            {
               NPCManager.checkHit(this.slashArray,offset,damage);
            }
            else if(this.controlledBy == 1)
            {
               NPCManager.checkPlayerHit(this.slashArray,offset,damage);
            }
         }
         else
         {
            mcs.y = groundY;
            velY = 0;
            if(this.controlledBy == 0 || this.controlledBy == 3)
            {
               NPCManager.checkHit(this.slashArray,offset,damage);
            }
            else if(this.controlledBy == 1)
            {
               NPCManager.checkPlayerHit(this.slashArray,offset,damage);
            }
            this.startAction(POSE_STATE);
         }
         var slashArrayLength:int = int(this.slashArray.length);
         var index:int = slashArrayLength - InputManager.lengthThreshhold + 1;
         if(index < 0)
         {
            index = 0;
         }
         if(mcs != null)
         {
            if(this.slashArray[slashArrayLength - 1].x > this.slashArray[index].x)
            {
               velX = 5;
               mcs.faceRight();
            }
            else
            {
               velX = -5;
               mcs.faceLeft();
            }
         }
         if(this.hasSlashBuffer)
         {
            this.slashArray = this.slashArrayBuffer;
            this.hasSlash = true;
         }
         this.hasSlashBuffer = false;
         this.slashCommitted = false;
         if(this.controlledBy == 0)
         {
            SoundManager.instance.playSlash();
            InputManager.clearCanvas();
            if(this.hasSlash)
            {
               InputManager.drawLine(this.slashArray,StageManager.getStagePosition());
            }
            else if(this.hasSlashBuffer)
            {
               InputManager.drawLine(this.slashArrayBuffer,StageManager.getStagePosition());
            }
         }
         if(this.doShunpo)
         {
            this.doShunpo = false;
         }
      }
      
      internal function endDownStab() : *
      {
         this.hasSlash = false;
         this.startAction(POSE_STATE);
         if(this.hasSlashBuffer)
         {
            this.slashArray = this.slashArrayBuffer;
            this.hasSlash = true;
         }
         this.hasSlashBuffer = false;
         this.slashCommitted = false;
      }
      
      public function getSlashArray() : Vector.<Point>
      {
         return this.slashArray;
      }
      
      public function gotSlash() : Boolean
      {
         return this.hasSlash;
      }
      
      internal function isSlashing() : Boolean
      {
         return actionState == SLASH_STATE;
      }
      
      internal function movement(speed:int) : *
      {
         if(posX - this.destX < -speed)
         {
            mcs.faceRight();
            velX = speed;
         }
         else
         {
            if(posX - this.destX <= speed)
            {
               this.movePlayer(this.destX - posX);
               return false;
            }
            mcs.faceLeft();
            velX = -speed;
         }
         this.movePlayer(velX);
         return true;
      }
      
      internal function getGroundY() : int
      {
         return StageManager.getGroundY();
      }
      
      public function doScroll(dist:int) : *
      {
         posX += dist;
      }
      
      public function movePlayer(dist:int) : *
      {
         if(posX + dist < 0)
         {
            dist -= posX + dist;
         }
         else if(posX + dist > StageManager.getGameStageWidth())
         {
            dist -= posX + dist - StageManager.getGameStageWidth();
         }
         if(this.controlledBy != 0)
         {
            movePositionX(dist);
            return;
         }
         var canScroll:Boolean = true;
         if(!StageManager.getGameStage().canScroll(dist) || mcs.x < playerScrollMax && dist > 0 || mcs.x > playerScrollMin && dist < 0 || mcs.x > playerScrollMin && mcs.x < playerScrollMax || StageManager.isRedFreeze())
         {
            canScroll = false;
         }
         if(canScroll)
         {
            StageManager.scrollStage(-dist);
            InputManager.getCanvas().x = InputManager.getCanvas().x - dist;
            posX += dist;
         }
         else
         {
            mcs.x += dist;
            posX += dist;
         }
         if(this.controlledBy == 0 && (GameEngine.isAdventureMode() || GameEngine.isPvPRoomMode()))
         {
            if(Minimap.getInstance().visible)
            {
               Minimap.getInstance().gotUpdateFromPlayer(posX,getMCS().isFacingRight());
            }
            else
            {
               OverworldHUD.instance.territorymap.gotUpdateFromPlayer(posX,getMCS().isFacingRight());
            }
         }
      }
      
      public function canChangeStance() : Boolean
      {
         return actionState == IDLE_STATE || actionState == POSE_STATE || actionState == RUN_STATE || actionState == WALK_STATE || actionState == SKILL_CHICHARGE_STATE || actionState == FLINCH_STATE && (prevActionState == IDLE_STATE || prevActionState == POSE_STATE || prevActionState == RUN_STATE || prevActionState == WALK_STATE);
      }
      
      public function canSmokeAway() : Boolean
      {
         return this.canChangeStance() || isDowned() || actionState == GOTLAUNCHED_STATE || actionState == FALL_STATE || actionState == GOTLAUNCHED_STATE || actionState == JUMP_STATE;
      }
      
      public function nextStance() : *
      {
         if(this.reload < this.maxreload / 6)
         {
            return;
         }
         if(StatsManager.consoleEnabled)
         {
            if(this.stance == LIGHT_STANCE)
            {
               this.setStance(BALANCED_STANCE);
            }
            else if(this.stance == BALANCED_STANCE)
            {
               this.setStance(HEAVY_STANCE);
            }
            else if(this.stance == HEAVY_STANCE)
            {
               this.setStance(DUAL_STANCE);
            }
            else if(this.stance == DUAL_STANCE)
            {
               this.setStance(REVERSED_STANCE);
            }
            else if(this.stance == REVERSED_STANCE)
            {
               this.setStance(LIGHT_STANCE);
            }
         }
         else if(this.stance == LIGHT_STANCE)
         {
            this.setStance(BALANCED_STANCE);
         }
         else if(this.stance == BALANCED_STANCE)
         {
            this.setStance(HEAVY_STANCE);
         }
         else if(this.stance == HEAVY_STANCE)
         {
            this.setStance(LIGHT_STANCE);
         }
         NetworkManager.getInstance().setStance(this.stance);
      }
      
      public function setStance(num:int) : *
      {
         this.stance = num;
         if(StageManager.isBattle())
         {
            this.stopMoving(false);
         }
         this.slashCommitted = false;
         switch(this.stance)
         {
            case LIGHT_STANCE:
               this.slashLength = this.baseSlashLength * 1.5;
               if(StageManager.isBattle())
               {
                  startAnim(IDLE_LIGHT);
               }
               if(this.controlledBy == 0)
               {
                  BattleUI.instance.setStanceColor(1);
               }
               break;
            case BALANCED_STANCE:
               this.slashLength = this.baseSlashLength * (1 + 0.5 * this.balancedMastery * 0.01);
               if(StageManager.isBattle())
               {
                  startAnim(IDLE_BALANCED);
               }
               if(this.controlledBy == 0)
               {
                  BattleUI.instance.setStanceColor(2);
               }
               break;
            case HEAVY_STANCE:
               this.slashLength = this.baseSlashLength * (0.5 + 0.5 * this.heavyMastery * 0.01);
               if(this.slashLength < 100)
               {
                  this.slashLength = 100;
               }
               if(StageManager.isBattle())
               {
                  startAnim(IDLE_HEAVY);
               }
               if(this.controlledBy == 0)
               {
                  BattleUI.instance.setStanceColor(3);
               }
               break;
            case REVERSED_STANCE:
               this.slashLength = this.baseSlashLength * 1.5;
               if(StageManager.isBattle())
               {
                  startAnim(IDLE_REVERSED);
               }
               if(this.controlledBy == 0)
               {
                  BattleUI.instance.setStanceColor(2);
               }
               break;
            case DUAL_STANCE:
               this.slashLength = this.baseSlashLength;
               if(this.slashLength < 100)
               {
                  this.slashLength = 100;
               }
               if(StageManager.isBattle())
               {
                  startAnim(IDLE_DUAL);
               }
               if(this.controlledBy == 0)
               {
                  BattleUI.instance.setStanceColor(3);
               }
         }
         if(this.controlledBy == 0)
         {
            InputManager.setMaxDistance(this.slashLength);
         }
         if(StageManager.isBattle())
         {
            if(this.reload > this.maxreload / 2)
            {
               this.reload = this.maxreload / 3;
            }
            else
            {
               this.reload -= this.maxreload / 6;
            }
            if(this.reload < 0)
            {
               this.reload = 0;
            }
            if(this.controlledBy == 0)
            {
               StageManager.getBattleUI().updateReload(this.reload / this.maxreload);
            }
         }
         this.initSpecialSkills();
         if(this.controlledBy == 0)
         {
            BattleUI.instance.checkSkillDisabled();
         }
      }
      
      public function getStance() : int
      {
         return this.stance;
      }
      
      internal function initSpecialSkills() : *
      {
         if(this.controlledBy == 0 || this.controlledBy == 2)
         {
            if(this.stance == LIGHT_STANCE)
            {
               this.canLaunch = this.getSkillLevel(1014) > 0;
               this.canDeflect = this.getSkillLevel(1036) > 0;
               this.canAirCombo = this.getSkillLevel(1015) > 0;
               this.canFlipUp = false;
               this.canStab = false;
            }
            else if(this.stance == BALANCED_STANCE)
            {
               this.canFlipUp = this.getSkillLevel(1016) > 0;
               this.canDeflect = this.getSkillLevel(1037) > 0;
               this.canLaunch = this.getSkillLevel(1017) > 0;
               this.canStab = false;
               this.canAirCombo = false;
            }
            else if(this.stance == HEAVY_STANCE)
            {
               this.canStab = this.getSkillLevel(1018) > 0;
               this.canDeflect = this.getSkillLevel(1038) > 0;
               this.canLaunch = this.getSkillLevel(1019) > 0;
               this.canFlipUp = false;
               this.canAirCombo = false;
            }
            else if(this.stance == REVERSED_STANCE || this.stance == DUAL_STANCE)
            {
               this.canStab = true;
               this.canDeflect = true;
               this.canLaunch = true;
               this.canFlipUp = true;
               this.canAirCombo = true;
            }
         }
         else if(this.stance == LIGHT_STANCE)
         {
            this.canLaunch = this.lightMastery >= 3;
            this.canDeflect = this.lightMastery >= 4;
            this.canAirCombo = this.lightMastery >= 5;
            this.canFlipUp = false;
            this.canStab = false;
         }
         else if(this.stance == BALANCED_STANCE)
         {
            this.canFlipUp = this.balancedMastery >= 3;
            this.canDeflect = this.balancedMastery >= 4;
            this.canLaunch = this.balancedMastery >= 5;
            this.canStab = false;
            this.canAirCombo = false;
         }
         else if(this.stance == HEAVY_STANCE)
         {
            this.canLaunch = this.heavyMastery >= 3;
            this.canDeflect = this.heavyMastery >= 4;
            this.canStab = this.heavyMastery >= 5;
            this.canFlipUp = false;
            this.canAirCombo = false;
         }
         else if(this.stance == REVERSED_STANCE || this.stance == DUAL_STANCE)
         {
            this.canStab = true;
            this.canDeflect = true;
            this.canLaunch = true;
            this.canFlipUp = true;
            this.canAirCombo = true;
         }
      }
      
      internal function getDamage() : int
      {
         var maxDamage:int = 0;
         var baseDamage:int = this.minDamage + Math.random() * this.damageRange;
         switch(this.stance)
         {
            case LIGHT_STANCE:
               maxDamage = baseDamage * (0.5 + 0.5 * this.lightMastery * 0.01);
               break;
            case BALANCED_STANCE:
               maxDamage = baseDamage * (1 + 0.5 * this.balancedMastery * 0.01);
               break;
            case HEAVY_STANCE:
            case DUAL_STANCE:
            case REVERSED_STANCE:
               maxDamage = baseDamage * 1.5;
         }
         if(this.reload == this.maxreload)
         {
            if(this.stance != LIGHT_STANCE)
            {
               return maxDamage * 1.2 + this.STAT_CRITICALDMG;
            }
            return maxDamage * 1.5 + this.STAT_CRITICALDMG;
         }
         return maxDamage;
      }
      
      public function getBaseDamage() : int
      {
         return this.minDamage + Math.random() * this.damageRange;
      }
      
      internal function getDefense() : int
      {
         if(this.stance == HEAVY_STANCE)
         {
            return defense * 0.8;
         }
         return defense;
      }
      
      public function deductReloadBar() : *
      {
         if(this.reload == this.maxreload)
         {
            this.reload = 0;
         }
         switch(this.stance)
         {
            case LIGHT_STANCE:
               this.reload -= this.slashUsage / 2;
               break;
            case BALANCED_STANCE:
            case REVERSED_STANCE:
               this.reload -= this.slashUsage;
               break;
            case HEAVY_STANCE:
            case DUAL_STANCE:
               this.reload -= this.slashUsage * 1.5;
         }
         if(this.reload < 0)
         {
            this.reload = 0;
         }
      }
      
      public function bonusReload() : *
      {
         this.reload += 6;
         if(this.reload > this.maxreload)
         {
            this.reload = this.maxreload;
         }
         StageManager.getBattleUI().updateReload((this.reload - 24) / (this.maxreload - 24));
      }
      
      override public function checkHitObject(thing:MovieClip, damageObj:Damage, checkByAttacker:Boolean = false) : Boolean
      {
         var mc:MovieClip = null;
         var rolllvl:* = undefined;
         var dodgechance:int = 0;
         var projectile:Projectile = null;
         var owner:NPC = null;
         var killer:EnemyPlayer = null;
         if(this.controlledBy == 0 && GameEngine.isPlayBack())
         {
            return false;
         }
         if(gotHitCounter > 0)
         {
            return false;
         }
         if(OverworldHUD.instance != null && OverworldHUD.instance.screenTransition.isTransitioning())
         {
            return false;
         }
         if(actionState == SKILL_UNDYING_STATE)
         {
            return false;
         }
         if(actionState == FORWARDROLL_STATE)
         {
            rolllvl = this.getSkillLevel(SkillManager.SKILL_ROLL);
            if(rolllvl == 1)
            {
               dodgechance = 80;
            }
            else if(rolllvl == 2)
            {
               dodgechance = 85;
            }
            else if(rolllvl == 3)
            {
               dodgechance = 90;
            }
            else if(rolllvl == 4)
            {
               dodgechance = 95;
            }
            else if(rolllvl == 5)
            {
               dodgechance = 100;
            }
            if(int(Math.random() * 100) < dodgechance)
            {
               gotHitCounter = 12;
               return true;
            }
         }
         if(this.logsubCounter > 0)
         {
            if(checkByAttacker && this.controlledBy != 0)
            {
               this.cancelLogSub();
            }
            else if(!checkByAttacker && this.controlledBy == 0)
            {
               this.doSubstitutionLog();
            }
            else
            {
               this.cancelLogSub();
            }
            damageObj.setSubstitutionLog();
         }
         stunCounter = 0;
         var damage:int = damageObj.damage;
         var launchType:* = damageObj.launchType;
         var fireDamage:int = damageObj.fireDamage - STAT_FIREDEF;
         var waterDamage:int = damageObj.waterDamage - STAT_WATERDEF;
         var windDamage:int = damageObj.windDamage - STAT_WINDDEF;
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
         var max:int = 22;
         var partList:Vector.<MovieClip> = mcs.partList;
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            mc = partList[i];
            if(mc.hitTestObject(thing))
            {
               if(this.canDeflect && this.isSlashing() && thing is Projectile)
               {
                  projectile = Projectile(thing);
                  if(projectile.canBreak())
                  {
                     Projectile(thing).doBreak();
                     SoundManager.instance.playDeflect();
                     return false;
                  }
               }
               if(!checkByAttacker && this.controlledBy == 2 && NetworkManager.instance.isP2P() && !GameEngine.isPlayback())
               {
                  gotHitCounter = 12;
                  this.cancelStealth();
                  return true;
               }
               if(this.chargingFx != null)
               {
                  if(!(actionState == SKILL_CHICHARGE_STATE && damageObj.launchType == Damage.LAUNCH_NONE))
                  {
                     this.chargingFx.removeProjectile();
                     this.chargingFx = null;
                     this.chargingTime = 0;
                  }
               }
               damage -= this.getDefense();
               if(damage < damageObj.getMinDamage())
               {
                  damage = damageObj.getMinDamage();
               }
               setHP(getHP() - (damage + fireDamage + windDamage + waterDamage + earthDamage));
               gotHitCounter = 12;
               this.cancelStealth();
               if(this.controlledBy == 0)
               {
                  if(this.controlledBy == 0 && StatsManager.isInvincible && getHP() <= 0)
                  {
                     setHP(1);
                  }
                  if(damage + fireDamage + windDamage + waterDamage + earthDamage > 0)
                  {
                     if(GameEngine.isAdventureMode())
                     {
                        if(getHP() > 0)
                        {
                           StatsManager.setStat(0,getHP());
                           OverworldHUD.instance.updateHUD();
                           OverworldHUD.instance.closeOpenDialogs();
                        }
                     }
                     else if(GameEngine.isBattleMode())
                     {
                        StageManager.getBattleUI().updateHp(getHP(),maxhp);
                        StatsManager.resetCombo();
                        BattleUI.instance.showHurtRed();
                        BattleUI.instance.playerGotHit();
                     }
                     SoundManager.instance.playHurt();
                  }
               }
               else
               {
                  mcs.updateHealthBar(getHP() / maxhp);
                  SoundManager.instance.playHit();
               }
               if(getHP() <= 0)
               {
                  if(StatsManager.serverSideDuel && this.controlledBy == 2)
                  {
                     setHP(1);
                  }
                  else
                  {
                     setHP(0);
                     if(this.controlledBy == 0)
                     {
                        if(GameEngine.isPvPRoomMode())
                        {
                           if(thing is Projectile)
                           {
                              owner = Projectile(thing).owner;
                              if(owner is EnemyPlayer)
                              {
                                 killer = EnemyPlayer(owner);
                                 NetworkManager.instance.duelAnnouncement("[PvP]",killer.charname + " defeated " + StatsManager.charname);
                                 NetworkManager.instance.giveKillerLoot(killer.charname,level);
                              }
                           }
                        }
                        this.die();
                     }
                     else if(this.controlledBy == 3)
                     {
                        this.die();
                     }
                     target = null;
                  }
               }
               else
               {
                  damageObj.setVictimPosX(getMapPosition());
                  if(damageObj.isKneeGroin())
                  {
                     this.gotKneeGroin(damageObj.flyVelX,damageObj.flyVelY,damageObj.attackerlvl);
                  }
                  else if(damageObj.isBackThrow())
                  {
                     this.gotBackThrow(damageObj.flyVelX,damageObj.flyVelY);
                  }
                  else if((damageObj.isLaunchAir() || actionState == GOTLAUNCHED_STATE || actionState == FALL_STATE || actionState == JUMP_STATE) && !isDowned() && !damageObj.isSubstitutionLog())
                  {
                     if(!(damageObj.stance == -1 && this.launchCount >= 3))
                     {
                        launchType = Damage.LAUNCH_AIR;
                        damageObj.setLaunchDir(getMCS().isFacingRight());
                        this.gotLaunched();
                        if(damageObj.stance == -1)
                        {
                           ++this.launchCount;
                        }
                     }
                  }
                  else if(damageObj.isKnockDown())
                  {
                     damageObj.setLaunchDir(getMCS().isFacingRight());
                     this.gotKnockDown();
                  }
                  else if(damageObj.isFly())
                  {
                     this.gotFly(damageObj.flyVelX,damageObj.flyVelY);
                  }
                  else if(damageObj.isFlyAway())
                  {
                     damageObj.setFlyAwayPos(thing.x,thing.y);
                     this.gotFlyAway(thing.x,thing.y);
                  }
                  else if(damageObj.isStun())
                  {
                     gotStun(damageObj.flyVelX,damageObj.flyVelY);
                  }
                  else if(!isDowned())
                  {
                     this.doFlinch();
                  }
                  if(damageObj.isDeathTouch())
                  {
                     this.gotDeathTouch(damageObj.flyVelX,damageObj.flyVelY);
                  }
                  if(damage > 0)
                  {
                     if(this.controlledBy == 0)
                     {
                        ProjectileManager.createFloatingText(mcs.x,mcs.y - 100,damage.toString(),0);
                     }
                     else
                     {
                        ProjectileManager.createFloatingText(mcs.x,mcs.y - 100,damage.toString(),10027008);
                     }
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
               if(checkByAttacker && this.controlledBy == 2)
               {
                  NetworkManager.instance.sendDamage(this.nid,getHP(),damageObj);
               }
               else if(!checkByAttacker && (this.controlledBy == 0 || this.controlledBy == 3))
               {
                  NetworkManager.instance.sendDamage(this.nid,getHP(),damageObj);
               }
               return true;
            }
         }
         return false;
      }
      
      override public function gotHit(target:MovieClip, damageObj:Damage) : Boolean
      {
         var rolllvl:* = undefined;
         var dodgechance:int = 0;
         var damagetextcol:int = 0;
         if(this.controlledBy == 0 && GameEngine.isPlayBack())
         {
            return false;
         }
         if(gotHitCounter > 0)
         {
            return false;
         }
         if(actionState == SKILL_UNDYING_STATE)
         {
            return false;
         }
         if(actionState == FORWARDROLL_STATE)
         {
            rolllvl = this.getSkillLevel(SkillManager.SKILL_ROLL);
            if(rolllvl == 1)
            {
               dodgechance = 80;
            }
            else if(rolllvl == 2)
            {
               dodgechance = 85;
            }
            else if(rolllvl == 3)
            {
               dodgechance = 90;
            }
            else if(rolllvl == 4)
            {
               dodgechance = 95;
            }
            else if(rolllvl == 5)
            {
               dodgechance = 100;
            }
            if(int(Math.random() * 100) < dodgechance)
            {
               gotHitCounter = 12;
               return true;
            }
         }
         if(this.logsubCounter > 0)
         {
            if(this.controlledBy == 2)
            {
               this.cancelLogSub();
            }
            else
            {
               this.doSubstitutionLog();
            }
            damageObj.setSubstitutionLog();
         }
         stunCounter = 0;
         if(this.chargingFx != null)
         {
            if(!(actionState == SKILL_CHICHARGE_STATE && damageObj.launchType == Damage.LAUNCH_NONE))
            {
               this.chargingFx.removeProjectile();
               this.chargingFx = null;
               this.chargingTime = 0;
            }
         }
         var damage:int = damageObj.damage;
         var launchType:* = damageObj.launchType;
         var fireDamage:int = damageObj.fireDamage - STAT_FIREDEF;
         var waterDamage:int = damageObj.waterDamage - STAT_WATERDEF;
         var windDamage:int = damageObj.windDamage - STAT_WINDDEF;
         var earthDamage:int = damageObj.earthDamage - STAT_EARTHDEF;
         var enemyStance:int = damageObj.stance;
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
            default:
               gotHitFlag = true;
         }
         if(getHP() > 0)
         {
            damagetextcol = 0;
            if(this.stance == LIGHT_STANCE && enemyStance == BALANCED_STANCE || this.stance == BALANCED_STANCE && enemyStance == HEAVY_STANCE || this.stance == HEAVY_STANCE && enemyStance == LIGHT_STANCE)
            {
               damage *= 1.2;
               if(this.controlledBy != 0)
               {
                  damagetextcol = 16777215;
               }
            }
            damage -= this.getDefense();
            if(damage < damageObj.getMinDamage())
            {
               damage = damageObj.getMinDamage();
            }
            if(behead)
            {
               damage *= 1.5;
            }
            setHP(getHP() - (damage + fireDamage + windDamage + waterDamage + earthDamage));
            gotHitCounter = 12;
            this.cancelStealth();
            if(this.controlledBy == 0)
            {
               if(this.controlledBy == 0 && StatsManager.isInvincible && getHP() <= 0)
               {
                  setHP(1);
               }
               if(damage > 0)
               {
                  if(GameEngine.isBattleMode())
                  {
                     StageManager.getBattleUI().updateHp(getHP(),maxhp);
                     StatsManager.resetCombo();
                     BattleUI.instance.playerGotHit();
                     BattleUI.instance.showHurtRed();
                  }
                  else
                  {
                     StatsManager.setStat(0,getHP());
                     OverworldHUD.instance.updateHUD();
                  }
                  SoundManager.instance.playHurt();
               }
            }
            else
            {
               mcs.updateHealthBar(getHP() / maxhp);
               SoundManager.instance.playHit();
            }
            if(getHP() <= 0)
            {
               if(StatsManager.serverSideDuel && this.controlledBy == 2)
               {
                  setHP(1);
               }
               else
               {
                  setHP(0);
                  if(this.controlledBy == 0 || this.controlledBy == 3)
                  {
                     this.die();
                  }
                  target = null;
               }
            }
            else
            {
               behead = false;
               damageObj.setVictimPosX(getMapPosition());
               if((damageObj.isLaunchAir() || actionState == GOTLAUNCHED_STATE || actionState == FALL_STATE || actionState == JUMP_STATE) && !isDowned() && !damageObj.isSubstitutionLog())
               {
                  launchType = Damage.LAUNCH_AIR;
                  damageObj.setLaunchDir(getMCS().isFacingRight());
                  this.gotLaunched();
               }
               else if(damageObj.isKnockDown())
               {
                  damageObj.setLaunchDir(getMCS().isFacingRight());
                  this.gotKnockDown();
               }
               else if(damageObj.isFly())
               {
                  this.gotFly(damageObj.flyVelX,damageObj.flyVelY);
               }
               else if(damageObj.isFlyAway())
               {
                  damageObj.setFlyAwayPos(target.x,target.y);
                  this.gotFlyAway(target.x,target.y);
               }
               else if(damageObj.isStun())
               {
                  gotStun(damageObj.flyVelX,damageObj.flyVelY);
               }
               else if(!isDowned())
               {
                  this.doFlinch();
               }
               if(damageObj.isDeathTouch())
               {
                  this.gotDeathTouch(damageObj.flyVelX,damageObj.flyVelY);
               }
               if(damage > 0)
               {
                  if(this.controlledBy == 0)
                  {
                     ProjectileManager.createFloatingText(mcs.x,mcs.y - 100,damage.toString(),damagetextcol);
                  }
                  else
                  {
                     ProjectileManager.createFloatingText(mcs.x,mcs.y - 100,damage.toString(),10027008);
                  }
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
            if(this.controlledBy == 2)
            {
               NetworkManager.instance.sendDamage(this.nid,getHP(),damageObj);
            }
            return true;
         }
         return false;
      }
      
      public function doPose(num:int) : *
      {
         if(actionState == IDLE_STATE || actionState == POSE_STATE)
         {
            switch(num)
            {
               case 0:
                  startAnim(MCSActor.POSE1);
                  NetworkManager.getInstance().startAnim(MCSActor.POSE1);
                  break;
               case 1:
                  startAnim(MCSActor.POSE2);
                  NetworkManager.getInstance().startAnim(MCSActor.POSE2);
                  break;
               case 2:
                  startAnim(MCSActor.POSE3);
                  NetworkManager.getInstance().startAnim(MCSActor.POSE3);
                  break;
               case 3:
                  startAnim(MCSActor.POSE4);
                  NetworkManager.getInstance().startAnim(MCSActor.POSE4);
                  break;
               case 4:
                  startAnim(MCSActor.POSE5);
                  NetworkManager.getInstance().startAnim(MCSActor.POSE5);
                  break;
               case 5:
                  startAnim(MCSActor.POSE6);
                  NetworkManager.getInstance().startAnim(MCSActor.POSE6);
                  break;
               case 6:
                  startAnim(MCSActor.POSE7);
                  NetworkManager.getInstance().startAnim(MCSActor.POSE7);
                  break;
               case 7:
                  startAnim(MCSActor.POSE8);
                  NetworkManager.getInstance().startAnim(MCSActor.POSE8);
                  break;
               case 8:
                  startAnim(MCSActor.POSE9);
                  NetworkManager.getInstance().startAnim(MCSActor.POSE9);
                  break;
               case 9:
                  startAnim(MCSActor.POSE10);
                  NetworkManager.getInstance().startAnim(MCSActor.POSE10);
            }
         }
      }
      
      override internal function doLaunched() : *
      {
         mcs.y += velY;
         if(this.controlledBy == 0)
         {
            this.movePlayer(velX);
         }
         else
         {
            movePositionX(velX);
         }
         velY += 3;
         if(velY < 0 && velY > -4)
         {
            startAnim(GOTLAUNCHED_PEAK);
         }
         var groundY:* = StageManager.getGroundY();
         if(mcs.y >= groundY)
         {
            mcs.y = groundY;
            this.startAction(DOWNED_STATE);
            mcs.hideHealthBar();
            if(this.controlledBy == 2)
            {
               this.destX = posX;
            }
            this.launchCount = 0;
         }
      }
      
      public function faceScreenCenter() : *
      {
         if(mcs.x < StatsManager.stageWidth / 2)
         {
            mcs.faceRight();
         }
         else
         {
            mcs.faceLeft();
         }
      }
      
      internal function cleanUpPlayer() : *
      {
         if(this.logIcon != null)
         {
            mcs.partList[MCSCharacter.PART_torso].removeChild(this.logIcon);
         }
         this.logIcon = null;
         this.logsubCounter = 0;
         mcs.alpha = 1;
         this.invisCounter = 0;
         this.hasSlashBuffer = false;
         this.slashCommitted = false;
         this.hasSlash = false;
      }
      
      override public function redFreeze() : *
      {
         this.cleanUpPlayer();
         ColorCode.makeDark(mcs,-255);
         mcs.setDisplayName("");
         mcs.setSpeechText("");
      }
      
      override public function die() : *
      {
         if(this.chargingFx != null)
         {
            this.chargingFx.removeProjectile();
            this.chargingFx = null;
         }
         if(this.controlledBy == 0)
         {
            dead = true;
            mcs.y = this.getGroundY();
            InputManager.clearCanvas();
            StageManager.redFreeze();
            dontGiveLoot = true;
            getMCS().isPlayer = true;
         }
         super.die();
      }
      
      public function gotNetworkDamage(newhp:int, launchTypeStr:String) : *
      {
         var launchType:int = 0;
         var flyVelX:int = 0;
         var flyVelY:int = 0;
         var chiDamage:int = 0;
         var strArray:Array = null;
         if(StageManager.isPeaceful())
         {
            return;
         }
         if(!GameEngine.isBattleMode() || StageManager.isRedFreeze())
         {
            if(!dead && newhp <= 0 && StageManager.isRedFreezeWaiting())
            {
               BattleUI.instance.setDraw();
               startAnim(DEATH_FORWARD);
            }
            return;
         }
         var launchPosX:int = -1;
         if(launchTypeStr == "")
         {
            launchType = Damage.LAUNCH_NONE;
         }
         else
         {
            strArray = launchTypeStr.split(",");
            launchType = int(strArray[0]);
            if(launchType == Damage.LAUNCH_AIR || launchType == Damage.LAUNCH_KNOCKDOWN)
            {
               flyVelX = int(strArray[1]);
               if(strArray.length >= 3)
               {
                  launchPosX = int(strArray[2]);
               }
            }
            else if(launchType == Damage.LAUNCH_FLY || launchType == Damage.LAUNCH_FLYAWAY || launchType == Damage.STUN || launchType == Damage.DEATHTOUCH)
            {
               flyVelX = int(strArray[1]);
               flyVelY = int(strArray[2]);
               if(strArray.length >= 4)
               {
                  launchPosX = int(strArray[3]);
               }
            }
            else if(launchType == Damage.KNEEGROIN)
            {
               flyVelX = int(strArray[1]);
               flyVelY = int(strArray[2]);
               chiDamage = int(strArray[3]);
            }
            else if(launchType == Damage.BACKTHROW)
            {
               flyVelX = int(strArray[1]);
               flyVelY = int(strArray[2]);
            }
         }
         var damage:int = getHP() - newhp;
         setHP(newhp);
         StageManager.getBattleUI().updateHp(getHP(),maxhp);
         StatsManager.resetCombo();
         gotHitCounter = 12;
         stunCounter = 0;
         this.cancelStealth();
         if(this.chargingFx != null)
         {
            if(damage > 0 || launchType != Damage.LAUNCH_NONE)
            {
               if(!(actionState == SKILL_CHICHARGE_STATE && launchType == Damage.LAUNCH_NONE))
               {
                  this.chargingFx.removeProjectile();
                  this.chargingFx = null;
                  this.chargingTime = 0;
               }
            }
         }
         if(getHP() <= 0)
         {
            if(!(StatsManager.serverSideDuel && this.controlledBy == 2))
            {
               this.die();
            }
         }
         else
         {
            if(launchPosX != -1)
            {
               setPosition(launchPosX,getMCS().y);
            }
            if((launchType == Damage.LAUNCH_AIR || actionState == GOTLAUNCHED_STATE || actionState == FALL_STATE || actionState == JUMP_STATE) && !isDowned())
            {
               if(flyVelX == 1)
               {
                  getMCS().faceRight();
               }
               else
               {
                  getMCS().faceLeft();
               }
               this.gotLaunched();
               launchType = Damage.LAUNCH_AIR;
            }
            else if(launchType == Damage.LAUNCH_KNOCKDOWN)
            {
               if(flyVelX == 1)
               {
                  getMCS().faceRight();
               }
               else
               {
                  getMCS().faceLeft();
               }
               this.gotKnockDown();
            }
            else if(launchType == Damage.LAUNCH_FLY)
            {
               this.gotFly(flyVelX,flyVelY);
            }
            else if(launchType == Damage.LAUNCH_FLYAWAY)
            {
               this.gotFlyAway(flyVelX,flyVelY);
            }
            else if(launchType == Damage.KNEEGROIN)
            {
               this.gotKneeGroin(flyVelX,flyVelY,chiDamage);
            }
            else if(launchType == Damage.BACKTHROW)
            {
               this.gotBackThrow(flyVelX,flyVelY);
            }
            else if(launchType == Damage.STUN)
            {
               gotStun(flyVelX,flyVelY);
            }
            else if(launchType == Damage.SUBSTITUTIONLOG)
            {
               this.doSubstitutionLog();
            }
            else if(!isDowned())
            {
               this.doFlinch();
            }
            if(launchType == Damage.DEATHTOUCH)
            {
               this.gotDeathTouch(flyVelX,flyVelY);
            }
            if(damage > 0)
            {
               ProjectileManager.createFloatingText(mcs.x,mcs.y - 100,damage.toString(),0);
               BattleUI.instance.showHurtRed();
               BattleUI.instance.playerGotHit();
               SoundManager.instance.playHurt();
            }
         }
      }
      
      public function say(str:String) : *
      {
         this.speechCounter = 240;
         if(mcs != null)
         {
            mcs.setSpeechText(str);
         }
      }
      
      override internal function gotLaunched() : *
      {
         if(this.controlledBy == 0)
         {
            SkillUI.instance.closeButtonClick();
            this.hasSlash = false;
            this.hasSlashBuffer = false;
            this.slashCommitted = false;
         }
         super.gotLaunched();
      }
      
      override internal function gotKnockDown() : *
      {
         if(this.controlledBy == 0)
         {
            SkillUI.instance.closeButtonClick();
            this.hasSlash = false;
            this.hasSlashBuffer = false;
            this.slashCommitted = false;
         }
         super.gotKnockDown();
      }
      
      internal function gotDeathTouch(flyVelX:int, flyVelY:int) : *
      {
         var damage:int = this.getChi() * 10;
         this.setChi(0);
         if(this.controlledBy == 0)
         {
            StageManager.getBattleUI().updateChi(this.getChi(),this.maxchi);
         }
         gotHitCounter = 0;
         this.gotHit(getMCS(),new Damage(damage,0,0));
         if(flyVelX != 0 && getHP() > 0)
         {
            this.gotFly(flyVelX,flyVelY);
         }
         var damageObj:Damage = new Damage(damage,0,Damage.LAUNCH_FLY);
         damageObj.setFlyVel(flyVelX,flyVelY);
         if(this.controlledBy == 0)
         {
            NetworkManager.instance.sendDamage(this.nid,getHP(),damageObj);
            StageManager.startShake(12);
         }
      }
      
      internal function doSubstitutionLog() : *
      {
         if(this.controlledBy == 0 || this.controlledBy == 3)
         {
            NetworkManager.instance.startAction(MCSActor.LOGSUBSTITUTION_STATE,getMapPosition(),getMCS().y,getMCS().isFacingRight());
         }
         this.startAction(LOGSUBSTITUTION_STATE);
         this.cancelLogSub();
         this.hasSlash = false;
         this.hasSlashBuffer = false;
         this.slashCommitted = false;
      }
      
      override internal function gotKneeGroin(posx:int, posy:int, chiDamage:int) : *
      {
         if(!canGotKneeGroin || isDowned() || actionState == DYING_STATE)
         {
            return;
         }
         super.gotKneeGroin(posx,posy,chiDamage);
         this.setChi(this.getChi() - chiDamage);
         if(this.getChi() < 0)
         {
            this.setChi(0);
         }
         if(this.controlledBy == 0)
         {
            StageManager.getBattleUI().updateChi(this.getChi(),this.maxchi);
            this.hasSlashBuffer = false;
         }
      }
      
      override internal function gotBackThrow(posx:int, posy:int) : *
      {
         if(!canGotKneeGroin || isDowned() || actionState == DYING_STATE)
         {
            return;
         }
         super.gotBackThrow(posx,posy);
         if(this.controlledBy == 0)
         {
            this.hasSlashBuffer = false;
            mcs.showDisplayName(false);
         }
      }
      
      override internal function gotFly(flyVelX:int, flyVelY:int) : *
      {
         super.gotFly(flyVelX,flyVelY);
         if(this.controlledBy == 0)
         {
            this.hasSlashBuffer = false;
         }
      }
      
      override internal function gotFlyAway(xpos:int, ypos:int) : *
      {
         super.gotFlyAway(xpos,ypos);
         if(this.controlledBy == 0)
         {
            this.hasSlashBuffer = false;
         }
      }
      
      override internal function doFly() : *
      {
         super.doFly();
         if(this.controlledBy == 0)
         {
            StageManager.keepPlayerInView();
         }
      }
      
      public function useChi(num:int) : Boolean
      {
         if(num == 0 || this.isCharging())
         {
            return true;
         }
         if(num > this.getChi())
         {
            return false;
         }
         this.setChi(this.getChi() - num);
         if(this.controlledBy == 0)
         {
            StageManager.getBattleUI().updateChi(this.getChi(),this.maxchi);
         }
         return true;
      }
      
      public function isPlayer() : Boolean
      {
         return this.controlledBy == 0;
      }
      
      public function isAI() : Boolean
      {
         return this.controlledBy == 1;
      }
      
      public function isNetworkPlayer() : Boolean
      {
         return this.controlledBy == 2;
      }
      
      public function isPlayerAI() : Boolean
      {
         return this.controlledBy == 3;
      }
      
      override public function getNetworkPlayer() : String
      {
         if(this.controlledBy == 2 || this.controlledBy == 3)
         {
            return this.nid;
         }
         return "";
      }
      
      internal function getSkillLevel(skillid:int) : int
      {
         return StatsManager.getStat(skillid);
      }
      
      override public function doFlinch() : *
      {
         if(actionState == SKILL_CHICHARGE_STATE || actionState == FLINCH_STATE || actionState == SLASH_STATE)
         {
            return;
         }
         prevActionState = actionState;
         prevAnim = mcs.animation;
         prevFrameCounter = mcs.frameCounter;
         actionState = FLINCH_STATE;
         if(prevAnim == IDLE_SHEATHED || prevAnim == WALK_SHEATHED || prevAnim == RUN_SHEATHED || prevAnim == TIRED)
         {
            startAnim(FLINCH);
         }
         else
         {
            startAnim(FLINCH_WEAPON);
         }
      }
      
      override public function endFlinch() : *
      {
         actionState = prevActionState;
         startAnim(prevAnim);
         mcs.frameCounter = prevFrameCounter;
         if(this.isUsingSkill() || actionState == POSE_STATE)
         {
            this.startAction(IDLE_STATE);
         }
         if(this.controlledBy == 1 || this.autoSlash)
         {
            this.AI();
         }
      }
      
      public function getChargingTime() : int
      {
         var num:int = this.chargingTime / 24;
         if(num > 10)
         {
            num = 10;
         }
         return num;
      }
      
      public function cancelChargingTime() : *
      {
         this.chargingTime = 0;
      }
      
      public function cancelStealth() : *
      {
         if(!getMCS().visible || getMCS().alpha < 1)
         {
            ProjectileManager.createSmoke3(getMapPosition(),getMCS().y);
         }
         getMCS().visible = true;
         getMCS().alpha = 1;
      }
      
      public function cancelLogSub() : *
      {
         this.logsubCounter = 0;
         gotHitCounter = 12;
         if(this.logIcon != null)
         {
            mcs.partList[MCSCharacter.PART_torso].removeChild(this.logIcon);
         }
         this.logIcon = null;
      }
      
      override public function disposeMCS() : *
      {
         if(this.chargingFx != null)
         {
            this.chargingFx.removeProjectile();
            this.chargingFx = null;
         }
         if(mcs != null)
         {
            mcs.disposeMCS();
            mcs = null;
         }
      }
      
      public function isAutoSlash() : Boolean
      {
         return this.autoSlash;
      }
      
      public function setAutoSlash(flag:Boolean) : *
      {
         if(GameEngine.isPlayBackClient())
         {
            this.autoSlash = false;
            return;
         }
         if(flag)
         {
            target = NPCManager.getNearestEnemy(getMapPosition());
         }
         this.autoSlash = flag;
      }
      
      internal function playbackAI() : *
      {
         if(target == null)
         {
            target = NPCManager.getNearestEnemy(getMapPosition());
            if(target == null)
            {
               return;
            }
         }
         this.moveTo(target.getMapPosition(),getMCS().y);
      }
      
      internal function AI() : *
      {
         var dice:int = 0;
         var max:int = 0;
         var flag:Boolean = false;
         var i:int = 0;
         var pt:Point = null;
         if(animFrozen || isDowned() || this.isUsingSkill() || StageManager.isRedFreeze() || actionState == FLINCH_STATE || actionState == STUN_STATE || actionState == FLY_STATE || actionState == SKILL_CHICHARGE_STATE)
         {
            return;
         }
         if(target == null || target.isDead() || target.actionState == SKILL_UNDYING_STATE)
         {
            target = NPCManager.getNearestEnemy(getMapPosition());
            if(target == null)
            {
               if(getMapPosition() < 50 || getMapPosition() > StageManager.getGameStageWidth() - 50)
               {
                  this.moveTo(Math.random() * (StageManager.getGameStageWidth() - 100) + 50,StageManager.getGroundY());
               }
               return;
            }
         }
         if(StageManager.isPeaceful())
         {
            if(actionState == IDLE_STATE && Math.abs(this.getTargetPosition() - getMapPosition()) < 100)
            {
               this.moveTo(Math.random() * StageManager.getGameStageWidth(),StageManager.getGroundY());
            }
            return;
         }
         if(target.getMCS().alpha < 1 || !target.getMCS().visible)
         {
            if(int(Math.random() * 3) == 0)
            {
               this.moveTo(Math.random() * StageManager.getGameStageWidth(),StageManager.getGroundY());
            }
            return;
         }
         if(!(actionState == SLASH_STATE || actionState == SLASH_START_STATE || actionState == FALL_STATE))
         {
            if(this.hasSlash || mcs.animation == DOWNSTAB || mcs.animation == DOWNSTAB_UP)
            {
               max = int(this.inputArray.length);
               flag = false;
               i = 0;
               while(i < max && !flag)
               {
                  pt = this.inputArray[i];
                  if(target.mcs.hitTestPoint(pt.x,pt.y,true))
                  {
                     flag = true;
                  }
                  i++;
               }
               if(!flag)
               {
                  this.slashTarget();
               }
            }
            else if(target.isDowned())
            {
               if(this.canStab)
               {
                  this.stabTarget();
               }
               else if(int(Math.random() * 2) == 0)
               {
                  this.slashDownedTarget();
               }
               else
               {
                  this.moveTo(Math.random() * StageManager.getGameStageWidth(),StageManager.getGroundY());
               }
            }
            else if(this.canAirCombo && target.isAirborne())
            {
               if(Math.abs(this.getTargetPosition() - getMapPosition()) < 120)
               {
                  if(this.stance == LIGHT_STANCE || this.stance == BALANCED_STANCE)
                  {
                     if(this.getTargetPosition() < mcs.x)
                     {
                        this.slashDiagonalLeft();
                     }
                     else
                     {
                        this.slashDiagonalRight();
                     }
                  }
               }
            }
            else
            {
               dice = Math.random() * 4;
               if(this.reload < this.doReload && dice == 0)
               {
                  if(actionState == IDLE_STATE || actionState == POSE_STATE)
                  {
                     this.moveTo(Math.random() * StageManager.getGameStageWidth(),StageManager.getGroundY());
                  }
               }
               else if(this.reload < 24 && dice == 0)
               {
                  this.doReload = 24 + Math.random() * (this.maxreload - 24);
                  this.moveTo(Math.random() * StageManager.getGameStageWidth(),StageManager.getGroundY());
               }
               else
               {
                  target = NPCManager.getNearestEnemy(getMapPosition());
                  if(target != null)
                  {
                     dice = Math.random() * 3;
                     if(dice == 0)
                     {
                        if(this.canLaunch && !isAirborne())
                        {
                           this.launchTarget();
                        }
                        else
                        {
                           this.slashTarget();
                        }
                     }
                     else
                     {
                        this.slashTarget();
                     }
                     this.doReload = 0;
                  }
                  else if(getMapPosition() < 50 || getMapPosition() > StageManager.getGameStageWidth() - 50)
                  {
                     this.moveTo(Math.random() * (StageManager.getGameStageWidth() - 100) + 50,StageManager.getGroundY());
                  }
               }
            }
         }
      }
      
      internal function moveTo(posX:int, posY:int) : *
      {
         this.inputArray.length = 0;
         this.inputArray.push(new Point(posX,posY));
         this.gotInput(this.inputArray,false);
      }
      
      internal function getTargetPosition() : int
      {
         return target.getMapPosition() - StageManager.getStagePosition();
      }
      
      internal function launchTarget() : *
      {
         var startX:int = 0;
         var startY:int = 0;
         var changeX:int = 0;
         var changeY:int = 0;
         startX = this.getTargetPosition();
         startY = target.mcs.y;
         changeY = -20;
         changeX = 0;
         this.makeSlash(startX,startY,changeX,changeY);
      }
      
      internal function slashDiagonalLeft() : *
      {
         var startX:int = 0;
         var startY:int = 0;
         var changeX:int = 0;
         var changeY:int = 0;
         var newangle:Number = Math.atan(Math.abs(mcs.y - target.mcs.y) / Math.abs(getMapPosition() - this.getTargetPosition()));
         newangle -= 0.1745;
         var slashDiag:* = this.slashLength / 2;
         startX = getMapPosition();
         startY = mcs.y - 80;
         changeY = -20 * Math.sin(newangle);
         changeX = -20 * Math.sin(newangle);
         this.makeSlash(startX,startY,changeX,changeY);
      }
      
      internal function slashDiagonalRight() : *
      {
         var startX:int = 0;
         var startY:int = 0;
         var changeX:int = 0;
         var changeY:int = 0;
         var newangle:Number = Math.atan(Math.abs(mcs.y - target.mcs.y) / Math.abs(getMapPosition() - this.getTargetPosition()));
         newangle -= 0.1745;
         var slashDiag:* = this.slashLength / 2;
         startX = getMapPosition();
         startY = mcs.y - 80;
         changeY = -20 * Math.sin(newangle);
         changeX = 20 * Math.cos(newangle);
         this.makeSlash(startX,startY,changeX,changeY);
      }
      
      internal function stabTarget() : *
      {
         var startX:int = 0;
         var startY:int = 0;
         var endY:int = 0;
         var changeX:int = 0;
         var changeY:int = 0;
         if(target.getMCS().isFacingRight())
         {
            startX = this.getTargetPosition() - 100;
         }
         else
         {
            startX = this.getTargetPosition() + 100;
         }
         endY = target.mcs.y + 50;
         startY = endY - this.slashLength / 2;
         changeY = 20;
         changeX = 0;
         this.makeSlash(startX,startY,changeX,changeY);
      }
      
      internal function slashTarget() : *
      {
         var startX:int = 0;
         var startY:int = 0;
         var endX:int = 0;
         var endY:int = 0;
         var changeX:int = 0;
         var changeY:int = 0;
         if(target == null || target.mcs == null)
         {
            return;
         }
         if(target.mcs.x < mcs.x)
         {
            startY = target.mcs.y - 40;
            changeX = -20;
            changeY = -2;
            if(target.getMCS().isFacingRight())
            {
               startX = this.getTargetPosition() + this.slashLength * 2 / 3;
            }
            else
            {
               startX = this.getTargetPosition() + this.slashLength / 3;
            }
         }
         else
         {
            startY = target.mcs.y - 40;
            changeX = 20;
            changeY = -2;
            if(target.getMCS().isFacingRight())
            {
               startX = this.getTargetPosition() - this.slashLength / 3;
            }
            else
            {
               startX = this.getTargetPosition() - this.slashLength * 2 / 3;
            }
         }
         this.makeSlash(startX,startY,changeX,changeY);
      }
      
      internal function slashDownedTarget() : *
      {
         var startX:int = 0;
         var startY:int = 0;
         var changeX:int = 0;
         var changeY:int = 0;
         var targetX:int = 0;
         if(target.getMCS().isFacingRight())
         {
            targetX = this.getTargetPosition() - 100;
         }
         else
         {
            targetX = this.getTargetPosition() + 100;
         }
         if(targetX < posX)
         {
            startY = target.mcs.y - 10;
            changeX = -20;
            changeY = 0;
            startX = targetX + this.slashLength / 2;
         }
         else
         {
            startY = target.mcs.y - 10;
            changeX = 20;
            changeY = 0;
            startX = targetX - this.slashLength / 2;
         }
         this.makeSlash(startX,startY,changeX,changeY);
      }
      
      internal function makeSlash(startX:int, startY:int, changeX:int, changeY:int) : *
      {
         this.inputArray.length = 0;
         var pointsmax:int = this.slashLength / 20;
         this.inputArray.push(new Point(startX,startY));
         for(var i:int = 1; i < pointsmax; i++)
         {
            this.inputArray.push(new Point(startX + i * changeX,startY + i * changeY));
         }
         this.gotInput(this.inputArray,true);
         if(this.controlledBy == 0)
         {
            InputManager.drawLine(this.inputArray,0);
         }
      }
      
      public function performCutsceneAction(action:String, param:String) : *
      {
         var strArray:Array = null;
         switch(action)
         {
            case "anim":
               startAnim(param);
               break;
            case "pose":
               strArray = param.split(",");
               getMCS().setPose(strArray[0],strArray[1]);
               break;
            case "face":
               if(param == "right")
               {
                  getMCS().faceRight();
               }
               else
               {
                  getMCS().faceLeft();
               }
               break;
            case "walk":
               this.moveTo(int(param),StageManager.getGroundY());
               break;
            case "say":
               getMCS().setSpeechText(LangManager.getString(int(param)));
               break;
            case "setposition":
               strArray = param.split(",");
               setPosition(int(strArray[0]),int(strArray[1]));
         }
      }
      
      public function hasLogSub() : Boolean
      {
         return this.logsubCounter > 0;
      }
   }
}

