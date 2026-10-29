package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class EnemyClone extends EnemyPlayer
   {
      
      public function EnemyClone(mcs:MCSCharacter)
      {
         super(mcs,false,false);
      }
      
      public function cloneMCSPlayer(owner:MCSPlayer, isMassClone:Boolean) : *
      {
         var cloneLevel:int = 0;
         if(owner.isPlayer())
         {
            controlledBy = 3;
         }
         else if(owner.isAI())
         {
            controlledBy = 1;
         }
         else if(owner.isNetworkPlayer())
         {
            controlledBy = 2;
         }
         else if(owner.isPlayerAI())
         {
            trace("createClone error: clones cannot create clone");
         }
         reset();
         var mcsStr:String = owner.getMCS().getMCSString();
         getMCS().initMCSFromEqString(mcsStr);
         if(owner.getMCS().isFacingRight())
         {
            getMCS().faceRight();
         }
         else
         {
            getMCS().faceLeft();
         }
         setHP(owner.getHP());
         this.maxhp = owner.maxhp;
         setChi(owner.getChi());
         this.maxchi = owner.maxchi;
         this.defense = owner.defense;
         this.baseReload = owner.baseReload;
         this.minDamage = owner.minDamage;
         this.damageRange = owner.damageRange;
         this.baseSlashLength = owner.baseSlashLength;
         this.slashUsage = owner.slashUsage;
         this.lightMastery = owner.lightMastery;
         this.balancedMastery = owner.balancedMastery;
         this.heavyMastery = owner.heavyMastery;
         this.level = owner.level;
         dead = false;
         animFrozen = false;
         autoSlash = false;
         slashCommitted = false;
         hasSlash = false;
         hasSlashBuffer = false;
         slashArray.length = 0;
         slashArrayBuffer.length = 0;
         walkSpeed = 4;
         if(isMassClone)
         {
            setStance(owner.cloneIndex % 3);
         }
         else
         {
            setStance(owner.stance);
         }
         this.nid = owner.nid + "_clone" + owner.cloneIndex++;
         startAction(IDLE_STATE);
         maxreload = 5 * 24;
         reload = 0;
         if(controlledBy == 3)
         {
            mcs.setDisplayName("Clone",16777215);
         }
         else
         {
            mcs.setDisplayName(owner.getMCS().displayName.nametext.text,16777215);
         }
         this.STAT_ATK = owner.STAT_ATK / 2;
         this.STAT_FIREATK = owner.STAT_FIREATK;
         this.STAT_WINDATK = owner.STAT_WINDATK;
         this.STAT_WATERATK = owner.STAT_WATERATK;
         this.STAT_EARTHATK = owner.STAT_EARTHATK;
         xp = 0;
         mcs.setSpeechText("");
         canSeeSlash = true;
         updateHealthBar();
         ttl = 24 * 60;
         if(isMassClone)
         {
            maxhp = 1;
         }
         else
         {
            cloneLevel = owner.getSkillLevel(SkillManager.SKILL_SHADOWCLONE);
            if(cloneLevel == 3)
            {
               maxhp = 2;
            }
            else
            {
               maxhp = 1;
            }
            if(cloneLevel == 1)
            {
               minDamage = 0;
               damageRange = 0;
               level = 0;
            }
         }
         setHP(maxhp);
         mcs.showHealthBar();
      }
      
      override public function checkHitObject(thing:MovieClip, damageObj:Damage, checkByAttacker:Boolean = false) : Boolean
      {
         var mc:MovieClip = null;
         var rolllvl:* = undefined;
         var dodgechance:int = 0;
         var projectile:Projectile = null;
         if(controlledBy == 0 && GameEngine.isPlayBack())
         {
            return false;
         }
         if(gotHitCounter > 0)
         {
            return false;
         }
         if(actionState == FORWARDROLL_STATE)
         {
            rolllvl = getSkillLevel(SkillManager.SKILL_ROLL);
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
         var damage:int = damageObj.damage;
         var launchType:* = damageObj.launchType;
         var fireDamage:int = damageObj.fireDamage - STAT_FIREDEF;
         var waterDamage:int = damageObj.waterDamage - STAT_WATERDEF;
         var windDamage:int = damageObj.windDamage - STAT_WINDDEF;
         var earthDamage:int = damageObj.earthDamage - STAT_EARTHDEF;
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
         var max:int = 22;
         var partList:Vector.<MovieClip> = mcs.partList;
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            mc = partList[i];
            if(mc.hitTestObject(thing))
            {
               if(canDeflect && isSlashing() && thing is Projectile)
               {
                  projectile = Projectile(thing);
                  if(projectile.canBreak())
                  {
                     Projectile(thing).doBreak();
                     SoundManager.instance.playDeflect();
                     return false;
                  }
               }
               if(!checkByAttacker && controlledBy == 2 && NetworkManager.instance.isP2P() && !GameEngine.isPlayback())
               {
                  gotHitCounter = 12;
                  cancelStealth();
                  return true;
               }
               if(chargingFx != null)
               {
                  chargingFx.removeProjectile();
                  chargingFx = null;
                  chargingTime = 0;
                  if(controlledBy == 0)
                  {
                     BattleUI.instance.playerGotHit();
                  }
               }
               damage -= getDefense();
               if(damage < damageObj.getMinDamage())
               {
                  damage = damageObj.getMinDamage();
               }
               setHP(getHP() - 1);
               gotHitCounter = 12;
               cancelStealth();
               if(controlledBy == 0)
               {
                  if(controlledBy == 0 && StatsManager.isInvincible && getHP() <= 0)
                  {
                     setHP(1);
                  }
                  if(damage + fireDamage + windDamage + waterDamage + earthDamage > 0)
                  {
                     StageManager.getBattleUI().updateHp(getHP(),maxhp);
                     StatsManager.resetCombo();
                     BattleUI.instance.showHurtRed();
                     SoundManager.instance.playHurt();
                  }
               }
               else
               {
                  SoundManager.instance.playHit();
               }
               if(getHP() <= 0)
               {
                  setHP(0);
                  if(controlledBy == 0)
                  {
                     this.die();
                  }
                  else if(controlledBy == 3)
                  {
                     this.die();
                  }
                  target = null;
               }
               else
               {
                  if(damageObj.isKneeGroin())
                  {
                     gotKneeGroin(damageObj.flyVelX,damageObj.flyVelY,damageObj.attackerlvl);
                  }
                  else if(damageObj.isBackThrow())
                  {
                     gotBackThrow(damageObj.flyVelX,damageObj.flyVelY);
                  }
                  else if((damageObj.isLaunchAir() || actionState == GOTLAUNCHED_STATE || actionState == FALL_STATE || actionState == JUMP_STATE) && !isDowned())
                  {
                     launchType = Damage.LAUNCH_AIR;
                     damageObj.setLaunchDir(getMCS().isFacingRight());
                     gotLaunched();
                  }
                  else if(damageObj.isKnockDown())
                  {
                     damageObj.setLaunchDir(getMCS().isFacingRight());
                     gotKnockDown();
                  }
                  else if(damageObj.isFly())
                  {
                     gotFly(damageObj.flyVelX,damageObj.flyVelY);
                  }
                  else if(damageObj.isFlyAway())
                  {
                     damageObj.setFlyAwayPos(thing.x,thing.y);
                     gotFlyAway(thing.x,thing.y);
                  }
                  else if(damageObj.isStun())
                  {
                     gotStun(damageObj.flyVelX,damageObj.flyVelY);
                  }
                  else if(!isDowned())
                  {
                     doFlinch();
                  }
                  if(damageObj.isDeathTouch())
                  {
                     gotDeathTouch(damageObj.flyVelX,damageObj.flyVelY);
                  }
                  if(damage > 0)
                  {
                     if(controlledBy == 0)
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
               if(checkByAttacker && controlledBy == 2)
               {
                  NetworkManager.instance.sendDamage(nid,getHP(),damageObj);
               }
               else if(!checkByAttacker && (controlledBy == 0 || controlledBy == 3))
               {
                  NetworkManager.instance.sendDamage(nid,getHP(),damageObj);
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
         if(controlledBy == 0 && GameEngine.isPlayBack())
         {
            return false;
         }
         if(gotHitCounter > 0)
         {
            return false;
         }
         if(chargingFx != null)
         {
            chargingFx.removeProjectile();
            chargingFx = null;
            chargingTime = 0;
            if(controlledBy == 0)
            {
               BattleUI.instance.playerGotHit();
            }
         }
         if(actionState == FORWARDROLL_STATE)
         {
            rolllvl = getSkillLevel(SkillManager.SKILL_ROLL);
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
         var damage:int = damageObj.damage;
         var launchType:* = damageObj.launchType;
         var fireDamage:int = damageObj.fireDamage - STAT_FIREDEF;
         var waterDamage:int = damageObj.waterDamage - STAT_WATERDEF;
         var windDamage:int = damageObj.windDamage - STAT_WINDDEF;
         var earthDamage:int = damageObj.earthDamage - STAT_EARTHDEF;
         var enemyStance:int = damageObj.stance;
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
            case mcs.partList[MCSCharacter.PART_hat]:
            case mcs.partList[MCSCharacter.PART_head]:
            case mcs.partList[MCSCharacter.PART_neck]:
               damage *= 1.5;
               behead = true;
               gotHitFlag = true;
               break;
            default:
               gotHitFlag = true;
         }
         if(getHP() > 0)
         {
            damagetextcol = 0;
            if(stance == LIGHT_STANCE && enemyStance == BALANCED_STANCE || stance == BALANCED_STANCE && enemyStance == HEAVY_STANCE || stance == HEAVY_STANCE && enemyStance == LIGHT_STANCE)
            {
               damage *= 1.2;
               if(controlledBy != 0)
               {
                  damagetextcol = 16777215;
               }
            }
            damage -= getDefense();
            if(damage < damageObj.getMinDamage())
            {
               damage = damageObj.getMinDamage();
            }
            setHP(getHP() - 1);
            gotHitCounter = 12;
            cancelStealth();
            if(controlledBy == 0)
            {
               if(controlledBy == 0 && StatsManager.isInvincible && getHP() <= 0)
               {
                  setHP(1);
               }
               if(damage > 0)
               {
                  StageManager.getBattleUI().updateHp(getHP(),maxhp);
                  StatsManager.resetCombo();
                  BattleUI.instance.showHurtRed();
                  SoundManager.instance.playHurt();
               }
            }
            else
            {
               SoundManager.instance.playHit();
            }
            if(getHP() <= 0)
            {
               setHP(0);
               if(controlledBy == 0 || controlledBy == 3)
               {
                  this.die();
               }
               target = null;
            }
            else
            {
               behead = false;
               if((damageObj.isLaunchAir() || actionState == GOTLAUNCHED_STATE || actionState == FALL_STATE || actionState == JUMP_STATE) && !isDowned())
               {
                  launchType = Damage.LAUNCH_AIR;
                  damageObj.setLaunchDir(getMCS().isFacingRight());
                  gotLaunched();
               }
               else if(damageObj.isKnockDown())
               {
                  damageObj.setLaunchDir(getMCS().isFacingRight());
                  gotKnockDown();
               }
               else if(damageObj.isFly())
               {
                  gotFly(damageObj.flyVelX,damageObj.flyVelY);
               }
               else if(damageObj.isFlyAway())
               {
                  damageObj.setFlyAwayPos(target.x,target.y);
                  gotFlyAway(target.x,target.y);
               }
               else if(damageObj.isStun())
               {
                  gotStun(damageObj.flyVelX,damageObj.flyVelY);
               }
               else if(!isDowned())
               {
                  doFlinch();
               }
               if(damageObj.isDeathTouch())
               {
                  gotDeathTouch(damageObj.flyVelX,damageObj.flyVelY);
               }
               if(damage > 0)
               {
                  if(controlledBy == 0)
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
            if(controlledBy == 2)
            {
               NetworkManager.instance.sendDamage(nid,getHP(),damageObj);
            }
            return true;
         }
         return false;
      }
      
      override internal function AI() : *
      {
         var dice:int = 0;
         var max:int = 0;
         var flag:Boolean = false;
         var i:int = 0;
         var pt:Point = null;
         if(animFrozen || isDowned() || isUsingSkill() || StageManager.isRedFreeze() || actionState == FLINCH_STATE || actionState == STUN_STATE || actionState == FLY_STATE)
         {
            return;
         }
         if(target == null || target.isDead() || target.actionState == SKILL_UNDYING_STATE)
         {
            target = NPCManager.getNearestEnemy(getMapPosition(),controlledBy == 1);
            if(target == null)
            {
               return;
            }
         }
         if(StageManager.isPeaceful())
         {
            if(actionState == IDLE_STATE && Math.abs(getTargetPosition() - getMapPosition()) < 100)
            {
               moveTo(Math.random() * StageManager.getGameStageWidth(),StageManager.getGroundY());
            }
            return;
         }
         if(target.getMCS().alpha < 1 || !target.getMCS().visible)
         {
            if(int(Math.random() * 3) == 0)
            {
               moveTo(Math.random() * StageManager.getGameStageWidth(),StageManager.getGroundY());
            }
            return;
         }
         if(!(actionState == SLASH_STATE || actionState == SLASH_START_STATE || actionState == FALL_STATE))
         {
            if(hasSlash || mcs.animation == DOWNSTAB || mcs.animation == DOWNSTAB_UP)
            {
               max = int(inputArray.length);
               flag = false;
               i = 0;
               while(i < max && !flag)
               {
                  pt = inputArray[i];
                  if(target.mcs.hitTestPoint(pt.x,pt.y,true))
                  {
                     flag = true;
                  }
                  i++;
               }
               if(!flag)
               {
                  slashTarget();
               }
            }
            else if(target.isDowned())
            {
               if(canStab)
               {
                  stabTarget();
               }
               else if(int(Math.random() * 2) == 0)
               {
                  slashDownedTarget();
               }
               else
               {
                  moveTo(Math.random() * StageManager.getGameStageWidth(),StageManager.getGroundY());
               }
            }
            else if(canAirCombo && target.isAirborne())
            {
               if(Math.abs(getTargetPosition() - getMapPosition()) < 120)
               {
                  if(stance == LIGHT_STANCE || stance == BALANCED_STANCE)
                  {
                     if(getTargetPosition() < mcs.x)
                     {
                        slashDiagonalLeft();
                     }
                     else
                     {
                        slashDiagonalRight();
                     }
                  }
               }
            }
            else
            {
               dice = Math.random() * 4;
               if(reload < doReload && dice == 0)
               {
                  if(actionState == IDLE_STATE || actionState == POSE_STATE)
                  {
                     moveTo(Math.random() * StageManager.getGameStageWidth(),StageManager.getGroundY());
                  }
               }
               else if(reload < 24 && dice == 0)
               {
                  doReload = 24 + Math.random() * (maxreload - 24);
                  moveTo(Math.random() * StageManager.getGameStageWidth(),StageManager.getGroundY());
               }
               else
               {
                  target = NPCManager.getNearestEnemy(getMapPosition(),controlledBy == 1);
                  if(target != null)
                  {
                     dice = Math.random() * 3;
                     if(dice == 0)
                     {
                        if(canLaunch && !isAirborne())
                        {
                           launchTarget();
                        }
                        else
                        {
                           slashTarget();
                        }
                     }
                     else
                     {
                        slashTarget();
                     }
                  }
                  doReload = 0;
               }
            }
         }
      }
      
      override public function gotInput(lineArray:Vector.<Point>, isLine:Boolean, posX:int = -1) : *
      {
         var max:int = 0;
         var i:int = 0;
         var dist:int = 0;
         if(getHP() <= 0 || dead || actionState == GOTLAUNCHED_STATE || isUsingSkill() || actionState == STUN_STATE || actionState == FLY_STATE)
         {
            InputManager.clearCanvas();
            return;
         }
         var offset:int = 0;
         var lineArrayCopy:Vector.<Point> = lineArrayDeepCopy(lineArray);
         if(StageManager.isPeaceful())
         {
            InputManager.clearCanvas();
            if(isLine)
            {
               isLine = false;
               lineArray[lineArray.length - 1].x += offset;
               initMove(lineArray[lineArray.length - 1]);
               if((controlledBy == 0 || controlledBy == 3) && NetworkManager.instance.isP2P())
               {
                  NetworkManager.instance.sendMove(lineArrayCopy,offset,getMapPosition());
               }
               return;
            }
         }
         if(isLine && (slashCommitted || actionState == FALL_STATE && stance != LIGHT_STANCE || actionState == GOTLAUNCHED_STATE || isDowned() || actionState == JUMP_STATE || actionState == FORWARDROLL_STATE))
         {
            slashArrayBuffer = lineArrayDeepCopy(lineArray,offset);
            hasSlashBuffer = true;
            if((controlledBy == 0 || controlledBy == 3) && NetworkManager.instance.isP2P())
            {
               NetworkManager.instance.sendMove(lineArrayCopy,offset,getMapPosition(),nid);
            }
         }
         else if(!slashCommitted)
         {
            if(isLine)
            {
               slashArray = lineArrayDeepCopy(lineArray,offset);
               initSlash(slashArray[0]);
               if((controlledBy == 0 || controlledBy == 3) && NetworkManager.instance.isP2P())
               {
                  NetworkManager.instance.sendMove(lineArrayCopy,offset,getMapPosition(),nid);
               }
            }
            else
            {
               dist = lineArray[0].x - getMCS().x;
               if(dist * dist < 100)
               {
                  return;
               }
               if(actionState != FALL_STATE && actionState != GOTLAUNCHED_STATE && actionState != DOWNED_STATE && actionState != JUMP_STATE && actionState != FORWARDROLL_STATE && actionState != SLASH_STATE)
               {
                  lineArray[0].x += offset;
                  initMove(lineArray[0]);
                  if((controlledBy == 0 || controlledBy == 3) && NetworkManager.instance.isP2P())
                  {
                     NetworkManager.instance.sendMove(lineArrayCopy,offset,getMapPosition(),nid);
                  }
               }
            }
         }
      }
      
      override public function die() : *
      {
         dead = true;
         startAnim(ENEMYDEATH);
         actionState = DYING_STATE;
         ProjectileManager.createSmoke3(getMapPosition(),mcs.y);
         ttl = 12;
         mcs.visible = false;
      }
      
      override internal function doDying() : *
      {
         --ttl;
         if(ttl <= 0)
         {
            mcs.disposeMCS();
            mcs = null;
         }
      }
      
      override public function redFreeze() : *
      {
         super.redFreeze();
         this.die();
         if(controlledBy == 3)
         {
            NetworkManager.instance.sendDamage(nid,0,new Damage());
         }
      }
      
      override public function update() : *
      {
         super.update();
         --ttl;
         if(ttl == 0 && !dead)
         {
            this.die();
         }
      }
      
      override public function gotNetworkDamage(newhp:int, launchTypeStr:String) : *
      {
         var launchType:int = 0;
         var flyVelX:int = 0;
         var flyVelY:int = 0;
         var chiDamage:int = 0;
         var strArray:Array = null;
         if(getMCS() == null)
         {
            return;
         }
         if(newhp <= 0 && GameEngine.isPvPRoomMode())
         {
            dontGiveLoot = true;
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
         }
         var damage:int = getHP() - newhp;
         setHP(newhp);
         stunCounter = 0;
         getMCS().updateHealthBar(getHP() / maxhp);
         SoundManager.instance.playHit();
         if(damage > 0)
         {
            cancelStealth();
         }
         if(damage > 0 && chargingFx != null)
         {
            chargingFx.removeProjectile();
         }
         if(getHP() <= 0)
         {
            this.die();
            NPCManager.externalRedFreezeCheck();
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
               gotLaunched();
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
               gotKnockDown();
            }
            else if(launchType == Damage.LAUNCH_FLY)
            {
               gotFly(flyVelX,flyVelY);
            }
            else if(launchType == Damage.LAUNCH_FLYAWAY)
            {
               gotFlyAway(flyVelX,flyVelY);
            }
            else if(launchType == Damage.KNEEGROIN)
            {
               gotKneeGroin(flyVelX,flyVelY,chiDamage);
            }
            else if(launchType == Damage.STUN)
            {
               gotStun(flyVelX,flyVelY);
            }
            else if(!isDowned())
            {
               doFlinch();
            }
            if(launchType == Damage.DEATHTOUCH)
            {
               gotDeathTouch(flyVelX,flyVelY);
            }
            if(damage > 0)
            {
               ProjectileManager.createFloatingText(mcs.x,mcs.y - 100,damage.toString(),0);
            }
         }
      }
   }
}

