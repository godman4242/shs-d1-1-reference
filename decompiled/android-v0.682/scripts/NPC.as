package
{
   import flash.display.MovieClip;
   
   public class NPC extends MCSActor
   {
      
      internal var velY:int;
      
      internal var velX:int;
      
      internal var walkSpeed:int;
      
      internal var damage:int = 10;
      
      internal var defense:int = 1;
      
      internal var level:int;
      
      internal var xp:int;
      
      internal var aiCounterMax:int = 24;
      
      internal var aiCounter:int = 0;
      
      internal var gotHitCounter:int = 0;
      
      internal var TTLMAX:int = 96;
      
      internal var ttl:int = this.TTLMAX;
      
      internal var target:NPC;
      
      internal var reward:XMLReward;
      
      internal var bloodEmitter:ParticleEmitter;
      
      internal var bloodEmitter2:ParticleEmitter;
      
      internal var fatal:Boolean = true;
      
      internal var dontGiveLoot:Boolean = false;
      
      internal var prevActionState:int;
      
      internal var prevAnim:String;
      
      internal var prevFrameCounter:int;
      
      internal var stunCounter:int;
      
      internal var isFriendly:Boolean = false;
      
      internal var STAT_FIREATK:int;
      
      internal var STAT_WINDATK:int;
      
      internal var STAT_WATERATK:int;
      
      internal var STAT_EARTHATK:int;
      
      internal var STAT_FIREDEF:int;
      
      internal var STAT_WINDDEF:int;
      
      internal var STAT_WATERDEF:int;
      
      internal var STAT_EARTHDEF:int;
      
      internal var canGotLaunched:Boolean = true;
      
      internal var canGotKnockDown:Boolean = true;
      
      internal var canGotFly:Boolean = true;
      
      internal var canGotKneeGroin:Boolean = true;
      
      internal var canGotStun:Boolean = true;
      
      public function NPC(mcs:MCSCharacter = null)
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
         this.target = StatsManager.getPlayer();
      }
      
      internal static function getGreyLevel() : int
      {
         var playerLevel:int = StatsManager.getLevel();
         if(playerLevel < 6)
         {
            return 0;
         }
         if(playerLevel < 40)
         {
            return playerLevel - Math.floor(playerLevel / 10) - 5;
         }
         if(playerLevel < 60)
         {
            return playerLevel - Math.floor(playerLevel / 5) - 1;
         }
         return playerLevel - 9;
      }
      
      internal static function getZeroDifference() : int
      {
         var playerLevel:int = StatsManager.getLevel();
         if(playerLevel < 8)
         {
            return 5;
         }
         if(playerLevel < 10)
         {
            return 6;
         }
         if(playerLevel < 12)
         {
            return 7;
         }
         if(playerLevel < 16)
         {
            return 8;
         }
         if(playerLevel < 20)
         {
            return 9;
         }
         if(playerLevel < 30)
         {
            return 11;
         }
         if(playerLevel < 40)
         {
            return 12;
         }
         if(playerLevel < 45)
         {
            return 13;
         }
         if(playerLevel < 50)
         {
            return 14;
         }
         if(playerLevel < 55)
         {
            return 15;
         }
         if(playerLevel < 60)
         {
            return 16;
         }
         if(playerLevel < 80)
         {
            return 17;
         }
         return 17;
      }
      
      public static function calcXP(playerLevel:int, mobLevel:int, xp:int, elite:Boolean) : *
      {
         if(mobLevel <= getGreyLevel())
         {
            return 0;
         }
         if(mobLevel - playerLevel > 3)
         {
            return 0;
         }
         var finalXP:int = xp;
         if(playerLevel < mobLevel)
         {
            finalXP = xp * (1 + 0.05 * (mobLevel - playerLevel));
         }
         else if(playerLevel > mobLevel)
         {
            finalXP = xp * (1 - (playerLevel - mobLevel) / getZeroDifference());
         }
         if(elite)
         {
            finalXP *= 2;
         }
         return finalXP;
      }
      
      internal function reset() : *
      {
         mcs.visible = true;
         mcs.alpha = 1;
         dead = false;
         behead = false;
         gotHitFlag = false;
         this.dontGiveLoot = false;
         setHP(maxhp);
         this.velX = 0;
         this.velY = 0;
         this.aiCounter = 0;
         this.startAction(IDLE_STATE);
         mcs.showHealthBar();
         this.updateHealthBar();
         mcs.faceRight();
         this.ttl = this.TTLMAX;
      }
      
      public function init(xml:XMLNpc) : *
      {
         initMCSFromXML(xml.mcs);
         this.damage = xml.attack;
         this.defense = xml.defense;
         maxhp = xml.hp;
         this.level = xml.lvl;
         this.xp = this.level * 2 + 20;
         this.reset();
         if(mcs.y == StageManager.getGroundY())
         {
            this.startAction(WALK_STATE);
         }
         else
         {
            this.startAction(FALL_STATE);
         }
         this.reward = new XMLReward(xml.reward);
         this.STAT_FIREATK = xml.STAT_FIREATK;
         this.STAT_WINDATK = xml.STAT_WINDATK;
         this.STAT_WATERATK = xml.STAT_WATERATK;
         this.STAT_EARTHATK = xml.STAT_EARTHATK;
         this.STAT_FIREDEF = xml.STAT_FIREDEF;
         this.STAT_WINDDEF = xml.STAT_WINDDEF;
         this.STAT_WATERDEF = xml.STAT_WATERDEF;
         this.STAT_EARTHDEF = xml.STAT_EARTHDEF;
      }
      
      public function setLevel(lvl:int) : *
      {
         var factor:Number = lvl / this.level;
         if(lvl <= 20)
         {
            factor *= 0.9;
         }
         this.level = lvl;
         this.damage *= factor;
         this.defense *= factor;
         maxhp *= factor;
         setHP(maxhp);
         this.updateHealthBar();
         this.xp = lvl * 2 + 20;
         if(lvl <= 10)
         {
            this.damage = 1;
            this.defense = 1;
            maxhp = 1;
            setHP(maxhp);
         }
      }
      
      public function setIsFriendly() : *
      {
         this.isFriendly = true;
         this.target = NPCManager.getNearestEnemy(getMapPosition(),!this.isFriendly);
      }
      
      public function update() : *
      {
      }
      
      public function updateAnimation() : *
      {
         mcs.updateAnimation();
      }
      
      internal function startAction(actionState:int) : *
      {
      }
      
      internal function doAction() : *
      {
      }
      
      internal function checkAITrigger() : Boolean
      {
         --this.aiCounter;
         if(this.aiCounter <= 0)
         {
            this.aiCounter = this.aiCounterMax;
            return true;
         }
         return false;
      }
      
      public function canHit() : Boolean
      {
         return this.gotHitCounter == 0;
      }
      
      public function checkHit(hitX:int, hitY:int, damage:Damage) : Boolean
      {
         var mc:MovieClip = null;
         var max:int = mcs.getPartListLength();
         var partList:Vector.<MovieClip> = mcs.partList;
         var i:* = int(max - 1);
         while(i >= 0 && !gotHitFlag)
         {
            mc = partList[i];
            if(mc.hitTestPoint(hitX,hitY))
            {
               if(this.gotHit(mc,damage))
               {
                  return true;
               }
               return false;
            }
            i--;
         }
         return false;
      }
      
      public function checkHitObject(thing:MovieClip, damage:Damage, checkByAttacker:Boolean = false) : Boolean
      {
         var mc:MovieClip = null;
         var max:int = mcs.getPartListLength();
         var partList:Vector.<MovieClip> = mcs.partList;
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            mc = partList[i];
            if(mc.hitTestObject(thing))
            {
               if(this.gotHit(mc,damage))
               {
                  return true;
               }
               return false;
            }
         }
         gotHitFlag = false;
         return false;
      }
      
      public function checkHitTrap(thing:MovieClip, damage:Damage) : Boolean
      {
         var mc:MovieClip = null;
         var max:int = mcs.getPartListLength();
         var partList:Vector.<MovieClip> = mcs.partList;
         var i:* = int(max - 1);
         while(i >= 0 && !gotHitFlag)
         {
            mc = partList[i];
            if(mc.hitTestObject(thing))
            {
               if(this.gotHit(mc,damage))
               {
                  gotHitFlag = false;
                  return true;
               }
               return false;
            }
            i--;
         }
         gotHitFlag = false;
         return false;
      }
      
      public function testHit(thing:MovieClip) : Boolean
      {
         var mc:MovieClip = null;
         var max:int = mcs.getPartListLength();
         var partList:Vector.<MovieClip> = mcs.partList;
         var i:* = int(max - 1);
         while(i >= 0 && !gotHitFlag)
         {
            mc = partList[i];
            if(mc.hitTestObject(thing))
            {
               return true;
            }
            i--;
         }
         return false;
      }
      
      public function gotHit(target:MovieClip, damageObj:Damage) : Boolean
      {
         if(this.gotHitCounter > 0)
         {
            return false;
         }
         var damage:int = damageObj.damage;
         var fireDamage:int = damageObj.fireDamage - this.STAT_FIREDEF;
         var waterDamage:int = damageObj.waterDamage - this.STAT_WATERDEF;
         var windDamage:int = damageObj.windDamage - this.STAT_WINDDEF;
         var earthDamage:int = damageObj.earthDamage - this.STAT_EARTHDEF;
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
            damage -= this.defense;
            if(damage < damageObj.getMinDamage())
            {
               damage = damageObj.getMinDamage();
            }
            if(behead)
            {
               damage *= 1.5;
            }
            if(damageObj.isDeathTouch())
            {
               damage = 500;
               damageObj.launchType = Damage.LAUNCH_FLY;
            }
            setHP(getHP() - (damage + fireDamage + windDamage + waterDamage + earthDamage));
            this.updateHealthBar();
            this.gotHitCounter = 12;
            this.stunCounter = 0;
            if(getHP() > 0)
            {
               behead = false;
               if(damageObj.isKneeGroin())
               {
                  this.gotKneeGroin(damageObj.flyVelX,damageObj.flyVelY,damageObj.attackerlvl);
               }
               else if(damageObj.isBackThrow())
               {
                  this.gotBackThrow(damageObj.flyVelX,damageObj.flyVelY);
               }
               else if((damageObj.isLaunchAir() || actionState == GOTLAUNCHED_STATE || actionState == FALL_STATE || actionState == JUMP_STATE) && !this.isDowned())
               {
                  this.gotLaunched();
               }
               else if(damageObj.isKnockDown())
               {
                  this.gotKnockDown();
               }
               else if(damageObj.isFly())
               {
                  this.gotFly(damageObj.flyVelX,damageObj.flyVelY);
               }
               else if(damageObj.isFlyAway())
               {
                  this.gotFlyAway(target.x,target.y);
               }
               else if(damageObj.isStun())
               {
                  this.gotStun(damageObj.flyVelX,damageObj.flyVelY);
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
      
      public function checkDie() : Boolean
      {
         if(getHP() <= 0)
         {
            this.die();
            return true;
         }
         return false;
      }
      
      public function isGoingToDie() : Boolean
      {
         return getHP() <= 0;
      }
      
      internal function gotLaunched() : *
      {
         if(!this.canGotLaunched || this.isDowned() && !actionState == FLY_STATE || actionState == DYING_STATE)
         {
            return;
         }
         if(actionState == GOTLAUNCHED_STATE || actionState == FALL_STATE || actionState == JUMP_STATE || actionState == FLY_STATE)
         {
            this.velY = -20;
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
            this.velY = -25;
         }
         if(getMCS().isFacingRight())
         {
            this.velX = -3;
         }
         else
         {
            this.velX = 3;
         }
      }
      
      internal function gotKnockDown() : *
      {
         if(!this.canGotKnockDown || this.isDowned() || actionState == DYING_STATE)
         {
            return;
         }
         var groundY:int = StageManager.getGroundY();
         if(mcs.y >= groundY)
         {
            mcs.y = groundY;
            this.startAction(KNOCKDOWNED_STATE);
            mcs.hideHealthBar();
         }
      }
      
      internal function gotFly(flyVelX:int, flyVelY:int) : *
      {
         if(!this.canGotFly || this.isDowned() || actionState == DYING_STATE)
         {
            return;
         }
         if(getHP() <= 0)
         {
            this.die();
            return;
         }
         this.startAction(FLY_STATE);
         startAnim(FLY_START);
         if(flyVelX > 0)
         {
            mcs.faceLeft();
         }
         else
         {
            mcs.faceRight();
         }
         this.velX = flyVelX;
         this.velY = flyVelY;
         mcs.hideHealthBar();
      }
      
      internal function gotFlyAway(xpos:int, ypos:int) : *
      {
         if(!this.canGotFly || this.isDowned() || actionState == DYING_STATE)
         {
            return;
         }
         if(getHP() <= 0)
         {
            this.die();
            return;
         }
         this.startAction(FLY_STATE);
         startAnim(FLY_START);
         if(xpos > getMCS().x)
         {
            mcs.faceRight();
            this.velX = -20;
            this.velY = -10;
         }
         else
         {
            mcs.faceLeft();
            this.velX = 20;
            this.velY = -10;
         }
         mcs.hideHealthBar();
      }
      
      internal function gotKneeGroin(posx:int, posy:int, chiDamage:int) : *
      {
         if(!this.canGotKneeGroin || this.isDowned() || actionState == DYING_STATE)
         {
            return;
         }
         if(posx > getMapPosition())
         {
            getMCS().faceRight();
         }
         else
         {
            getMCS().faceLeft();
         }
         actionState = VICTIM_STATE;
         startAnim(KNEEGROIN_VICTIM);
         setPosition(posx,posy);
      }
      
      internal function gotBackThrow(posx:int, posy:int) : *
      {
         if(!this.canGotKneeGroin || this.isDowned() || actionState == DYING_STATE)
         {
            return;
         }
         if(posx > getMapPosition())
         {
            getMCS().faceRight();
         }
         else
         {
            getMCS().faceLeft();
         }
         actionState = VICTIM_STATE;
         startAnim(BACKTHROW_VICTIM);
         setPosition(posx,posy);
         mcs.hideHealthBar();
      }
      
      internal function gotStun(duration:int, posx:int = 0) : *
      {
         if(!this.canGotStun || this.isDowned() || actionState == DYING_STATE)
         {
            return;
         }
         this.stunCounter = duration;
         actionState = STUN_STATE;
         startAnim(ZOM_IDLE);
         if(posx != 0)
         {
            setPosition(posx,getMCS().y);
         }
      }
      
      internal function doStun() : *
      {
         --this.stunCounter;
         if(this.stunCounter <= 0)
         {
            this.startAction(IDLE_STATE);
         }
      }
      
      internal function doLaunched() : *
      {
         mcs.y += this.velY;
         movePositionX(this.velX);
         this.velY += 3;
         if(this.velY < 0 && this.velY > -4)
         {
            startAnim(GOTLAUNCHED_PEAK);
         }
         var groundY:int = StageManager.getGroundY();
         if(this.velY > 0 && mcs.y >= groundY)
         {
            mcs.y = groundY;
            this.startAction(DOWNED_STATE);
            mcs.hideHealthBar();
         }
         else if(this.velX < 0 && getMapPosition() < 20 || this.velX > 0 && getMapPosition() > StageManager.getGameStageWidth() - 20)
         {
            this.gotLaunched();
            this.velX *= 2;
         }
      }
      
      internal function doFly() : *
      {
         if(mcs.animation == FLY_END)
         {
            return;
         }
         mcs.y += this.velY;
         movePositionX(this.velX);
         this.velY += 1;
         var groundY:int = StageManager.getGroundY();
         if(this.velY > 0 && mcs.y >= groundY - 10)
         {
            mcs.y = groundY;
            startAnim(FLY_END);
         }
         else if(this.velX < 0 && getMapPosition() < 20 || this.velX > 0 && getMapPosition() > StageManager.getGameStageWidth() - 20)
         {
            this.gotLaunched();
            this.velX *= 2;
         }
      }
      
      public function doFlinch() : *
      {
         if(actionState == FLINCH_STATE || actionState == SLASH_STATE)
         {
            return;
         }
         this.prevActionState = actionState;
         this.prevAnim = mcs.animation;
         this.prevFrameCounter = mcs.frameCounter;
         actionState = FLINCH_STATE;
         startAnim(FLINCH_WEAPON);
      }
      
      public function endFlinch() : *
      {
         actionState = this.prevActionState;
         startAnim(this.prevAnim);
         mcs.frameCounter = this.prevFrameCounter;
      }
      
      public function isDowned() : Boolean
      {
         return actionState == DOWNED_STATE || actionState == KNOCKDOWNED_STATE || actionState == FLY_STATE || actionState == VICTIM_STATE;
      }
      
      public function isAirborne() : Boolean
      {
         return mcs.y < StageManager.getGroundY() - 50;
      }
      
      internal function createLoot() : *
      {
         var movtx:int = 0;
         var movty:int = 0;
         var rot:int = 0;
         var loot:XMLLoot = null;
         var chance:int = 0;
         var lootType:int = 0;
         var qty:int = 0;
         var j:int = 0;
         var positionX:int = mcs.x;
         if(this.isDowned())
         {
            if(mcs.scaleX > 0)
            {
               positionX -= 100;
            }
            else
            {
               positionX += 100;
            }
         }
         var max:int = int(this.reward.loot.length);
         for(var i:int = 0; i < max; i++)
         {
            loot = this.reward.loot[i];
            lootType = int(loot.id);
            qty = loot.qty;
            chance = loot.chance * 100;
            if(chance == 100 || Math.random() * 100 < chance)
            {
               if(!StageManager.isRedFreeze())
               {
                  for(j = 0; j < qty; j++)
                  {
                     movtx = Math.random() * 16 - 8;
                     if(posX < 100 && movtx < 0)
                     {
                        movtx *= -1;
                     }
                     else if(posX > StageManager.getGameStageWidth() - 100 && movtx > 0)
                     {
                        movtx *= -1;
                     }
                     rot = 20;
                     if(movtx < 0)
                     {
                        rot = -20;
                     }
                     if(lootType == 0)
                     {
                        movty = -Math.random() * 10 - 20;
                     }
                     else
                     {
                        movty = -Math.random() * 10 - 25;
                     }
                     ProjectileManager.createLootProjectile(positionX,mcs.y - 50,movtx,movty,rot,lootType);
                  }
               }
               if(lootType == 0)
               {
                  OverworldHUD.instance.lootDialog.addLootCoins(1 * qty);
               }
               else if(lootType == 1)
               {
                  OverworldHUD.instance.lootDialog.addLootCoins(5 * qty);
               }
               else if(lootType == 2)
               {
                  OverworldHUD.instance.lootDialog.addQuestLootItem();
               }
               else if(lootType == 3)
               {
                  OverworldHUD.instance.lootDialog.addRandomLootItem(this.level,false,true);
               }
               else
               {
                  OverworldHUD.instance.lootDialog.addLootItemBasic(lootType,qty);
               }
            }
         }
      }
      
      internal function rewardXP() : *
      {
         OverworldHUD.instance.lootDialog.addLootXP(calcXP(StatsManager.getLevel(),this.level,this.xp,false));
      }
      
      public function getLevel() : int
      {
         return this.level;
      }
      
      internal function getColorXP() : int
      {
         var playerLevel:int = StatsManager.getLevel();
         if(this.level >= playerLevel + 5)
         {
            return 4;
         }
         if(this.level >= playerLevel + 3)
         {
            return 3;
         }
         if(this.level >= playerLevel - 2)
         {
            return 2;
         }
         if(this.level > getGreyLevel())
         {
            return 1;
         }
         return 0;
      }
      
      public function setFatal(flag:Boolean) : *
      {
         this.fatal = flag;
      }
      
      override public function die() : *
      {
         var dice:int = 0;
         var head:MovieClip = null;
         var shead:MovieClip = null;
         SoundManager.instance.playDie();
         if(!GameEngine.isPlayback() && !this.dontGiveLoot)
         {
            this.createLoot();
            this.rewardXP();
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
               this.bloodEmitter = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_torso),StageManager.getGameStageCanvas(),90);
               this.bloodEmitter.setAngleVariance(15);
            }
            dead = true;
            return;
         }
         if(mcs.animation == SEPPUKU_START)
         {
            actionState = DYING_STATE;
            if(!behead || StatsManager.censored)
            {
               startAnim(SEPPUKU_MID);
               if(!StatsManager.censored)
               {
                  this.bloodEmitter = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_torso),StageManager.getGameStageCanvas(),-90,0,5);
               }
            }
            else
            {
               startAnim(SEPPUKU_NOHEAD);
               head = mcs.getPart(MCSCharacter.PART_head);
               dice = Math.random() * 3;
               if(dice == 0)
               {
                  this.bloodEmitter = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_neck),StageManager.getGameStageCanvas(),130);
               }
               else if(dice == 1)
               {
                  this.bloodEmitter2 = ParticleSystemManager.getInstance().createEmitter(0,head,StageManager.getGameStageCanvas(),180);
               }
               else
               {
                  this.bloodEmitter2 = ParticleSystemManager.getInstance().createEmitter(0,head,StageManager.getGameStageCanvas(),180);
                  this.bloodEmitter = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_neck),StageManager.getGameStageCanvas(),130);
               }
               if(this.bloodEmitter2 != null)
               {
                  this.bloodEmitter2.setVel(4);
                  this.bloodEmitter2.setNumber(10);
               }
            }
            dead = true;
            return;
         }
         mcs.y = StageManager.getGroundY();
         actionState = DYING_STATE;
         if(Math.random() * 2 < 1)
         {
            if(getMCS().isFacingRight())
            {
               getMCS().faceLeft();
            }
            else
            {
               getMCS().faceRight();
            }
         }
         if(!StatsManager.censored && this.fatal)
         {
            if(behead)
            {
               startAnim(ENEMYDEATHNOHEAD);
               shead = mcs.getPart(MCSCharacter.PART_head);
               dice = Math.random() * 3;
               if(dice == 0)
               {
                  this.bloodEmitter = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_neck),StageManager.getGameStageCanvas(),130);
               }
               else if(dice == 1)
               {
                  this.bloodEmitter2 = ParticleSystemManager.getInstance().createEmitter(0,shead,StageManager.getGameStageCanvas(),180);
               }
               else
               {
                  this.bloodEmitter2 = ParticleSystemManager.getInstance().createEmitter(0,shead,StageManager.getGameStageCanvas(),180);
                  this.bloodEmitter = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_neck),StageManager.getGameStageCanvas(),130);
               }
               if(this.bloodEmitter2 != null)
               {
                  this.bloodEmitter2.setVel(4);
                  this.bloodEmitter2.setNumber(10);
               }
            }
            else
            {
               dice = Math.random() * 7;
               if(dice <= 1)
               {
                  startAnim(ENEMYDEATH);
                  this.bloodEmitter = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_torso),StageManager.getGameStageCanvas(),80);
                  this.bloodEmitter.setAngleVariance(15);
               }
               else if(dice == 2)
               {
                  startAnim(DEATH_FORWARD);
                  this.bloodEmitter = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_neck),StageManager.getGameStageCanvas(),-90,0,5);
               }
               else if(dice == 3 && !StageManager.isRedFreeze())
               {
                  startAnim(DEFEATED2);
                  if(int(Math.random() * 2) == 0)
                  {
                     this.bloodEmitter = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_neck),StageManager.getGameStageCanvas(),-90,0,5);
                  }
                  else
                  {
                     this.bloodEmitter = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_stomach),StageManager.getGameStageCanvas(),-90,0,-10);
                  }
               }
               else if(dice == 4)
               {
                  startAnim(ENEMYDEATHNOHAND);
                  dice = Math.random() * 3;
                  if(dice == 0)
                  {
                     this.bloodEmitter = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_neck),StageManager.getGameStageCanvas(),60);
                  }
                  else if(dice == 1)
                  {
                     this.bloodEmitter2 = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_l_uparm),StageManager.getGameStageCanvas(),180);
                  }
                  else
                  {
                     this.bloodEmitter = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_neck),StageManager.getGameStageCanvas(),60);
                     this.bloodEmitter2 = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_l_uparm),StageManager.getGameStageCanvas(),180);
                  }
                  if(this.bloodEmitter2 != null)
                  {
                     this.bloodEmitter2.setVel(5);
                  }
               }
               else if(dice == 5)
               {
                  startAnim(DEATHINHALF);
                  dice = Math.random() * 3;
                  if(dice == 0)
                  {
                     this.bloodEmitter = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_stomach),StageManager.getGameStageCanvas(),180);
                  }
                  else if(dice == 1)
                  {
                     this.bloodEmitter = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_pelvic),StageManager.getGameStageCanvas(),120);
                  }
                  else
                  {
                     this.bloodEmitter = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_stomach),StageManager.getGameStageCanvas(),180);
                     this.bloodEmitter2 = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_pelvic),StageManager.getGameStageCanvas(),120);
                  }
               }
               else
               {
                  startAnim(ENEMYDEATH);
                  this.bloodEmitter = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_stomach),StageManager.getGameStageCanvas(),80);
                  this.bloodEmitter.setAngleVariance(15);
                  if(!mcs.isPlayer)
                  {
                     mcs.hair.visible = true;
                     mcs.hatHair.visible = false;
                     mcs.createFlyingWeapon();
                     mcs.createFlyingHat();
                  }
               }
            }
         }
         else if(behead)
         {
            startAnim(ENEMYDEATH);
            if(!mcs.isPlayer)
            {
               mcs.hair.visible = true;
               mcs.hatHair.visible = false;
               mcs.createFlyingHat();
            }
         }
         else
         {
            dice = Math.random() * 5;
            if(dice <= 1)
            {
               startAnim(ENEMYDEATH);
            }
            else if(dice == 2)
            {
               startAnim(DEATH_FORWARD);
            }
            else if(dice == 3 && !StageManager.isRedFreeze())
            {
               startAnim(DEFEATED2);
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
      
      override internal function deathAnimEnd() : *
      {
         if(this.bloodEmitter != null)
         {
            this.bloodEmitter.destroy();
         }
         if(this.bloodEmitter2 != null)
         {
            this.bloodEmitter2.destroy();
         }
         if(StageManager.isRedFreeze())
         {
            return;
         }
         --this.ttl;
         if(this.ttl < 12)
         {
            mcs.alpha = this.ttl / 12;
         }
         if(this.ttl <= 0)
         {
            mcs.visible = false;
            mcs.disposeMCS();
            mcs = null;
         }
      }
      
      internal function doDying() : *
      {
         if(StageManager.isRedFreeze())
         {
            return;
         }
         --this.ttl;
         if(this.ttl < 12)
         {
            mcs.alpha = this.ttl / 12;
         }
         if(this.ttl <= 0)
         {
            mcs.visible = false;
            mcs.disposeMCS();
            mcs = null;
         }
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
         if(actionState != GOTLAUNCHED_STATE && actionState != DYING_STATE && actionState != FLY_STATE)
         {
            animFrozen = true;
         }
      }
      
      internal function updateHealthBar() : *
      {
         if(getHP() <= 0)
         {
            mcs.hideHealthBar();
         }
         else
         {
            mcs.showHealthBar();
         }
         mcs.updateHealthBar(getHP() / maxhp);
      }
      
      internal function getProgressBar() : MCSProgressBar
      {
         return mcs.getProgressBar();
      }
      
      public function changeTarget(npc:NPC) : *
      {
         this.target = npc;
      }
      
      public function faceTarget() : *
      {
         if(this.target.getMCS().x < getMCS().x)
         {
            mcs.faceLeft();
         }
         else
         {
            mcs.faceRight();
         }
      }
      
      public function disposeMCS() : *
      {
         if(mcs != null)
         {
            mcs.disposeMCS();
            mcs = null;
         }
      }
      
      public function getNetworkPlayer() : String
      {
         return "";
      }
      
      public function setScale(num:Number) : *
      {
         mcs.scaleX = num;
         mcs.scaleY = num;
      }
   }
}

