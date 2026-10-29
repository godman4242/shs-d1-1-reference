package
{
   import flash.display.MovieClip;
   
   public class EnemyShield extends NPC
   {
      
      internal var altAI:Boolean = true;
      
      internal var speeD:int;
      
      public function EnemyShield(mcs:MCSCharacter = null)
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
               case ENEMYDEATH:
               case DEATH_FORWARD:
               case DEFEATED2:
               case ENEMYDEATHNOHEAD:
               case ENEMYDEATHNOHAND:
               case DEATHDOWNED:
               case DEATHINHALF:
                  deathAnimEnd();
                  break;
               case ENEMYLAND:
                  this.startAction(WALK_STATE);
                  break;
               case SHIELDSTAB:
                  target.checkHitObject(mcs.partList[MCSCharacter.PART_weapon],new Damage(damage,level));
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
               case FLINCH_WEAPON:
               case FLINCH:
                  endFlinch();
            }
         }
         this.doAction();
         if(gotHitCounter > 0)
         {
            --gotHitCounter;
         }
      }
      
      override internal function startAction(actionState:int) : *
      {
         this.actionState = actionState;
         switch(actionState)
         {
            case IDLE_STATE:
               startAnim(SHIELDHOLD);
               break;
            case WALK_STATE:
               walkSpeed = Math.random() * 2 + 3;
               startAnim(SHIELDWALK);
               break;
            case ATTACK_STATE:
               startAnim(SHIELDSTAB);
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
            case CHARGING_STATE:
               startAnim(SHIELDRUN);
         }
      }
      
      override internal function doAction() : *
      {
         var distanceAway:int = 0;
         var absDistanceAway:int = 0;
         var playerX:int = 0;
         var playerY:int = 0;
         var dice:int = -1;
         if(checkAITrigger())
         {
            target = NPCManager.getNearestEnemy(getMapPosition(),true);
            dice = Math.random() * 4;
         }
         switch(actionState)
         {
            case IDLE_STATE:
               if(dice == 0)
               {
                  this.startAction(WALK_STATE);
               }
               else if(dice == 1 && this.altAI)
               {
                  this.startAction(CHARGING_STATE);
               }
               break;
            case WALK_STATE:
               if(dice == 0 && posX > 50 && posX < StageManager.getGameStageWidth() - 50)
               {
                  this.startAction(IDLE_STATE);
               }
               else if(dice == 1 && this.altAI)
               {
                  this.startAction(CHARGING_STATE);
               }
               else
               {
                  playerX = target.mcs.x;
                  playerY = target.mcs.y;
                  if(playerX < mcs.x)
                  {
                     mcs.faceLeft();
                     if(mcs.x - playerX < 50 && mcs.y - playerY < 50)
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
                     if(playerX - mcs.x < 50 && mcs.y - playerY < 50)
                     {
                        this.startAction(ATTACK_STATE);
                     }
                     else
                     {
                        movePositionX(walkSpeed);
                     }
                  }
               }
               break;
            case ATTACK_STATE:
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
            case CHARGING_STATE:
               if(mcs.scaleX > 0)
               {
                  movePositionX(8);
               }
               else
               {
                  movePositionX(-8);
               }
               distanceAway = mcs.x - target.mcs.x;
               absDistanceAway = Math.abs(distanceAway);
               if(absDistanceAway < 100)
               {
                  if(getMCS().isFacingRight() && distanceAway <= 0 || !getMCS().isFacingRight() && distanceAway >= 0)
                  {
                     target.checkHitObject(mcs.partList[MCSCharacter.PART_prop],new Damage(damage,level));
                  }
               }
               else if(absDistanceAway > 500)
               {
                  this.startAction(WALK_STATE);
               }
         }
      }
      
      override public function gotHit(target:MovieClip, damageObj:Damage) : Boolean
      {
         var damage:int = 0;
         if(gotHitCounter > 0)
         {
            return false;
         }
         damage = damageObj.damage;
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
            case mcs.partList[MCSCharacter.PART_prop]:
               gotHitFlag = true;
               damage = 0;
               gotHitCounter = 24;
               SoundManager.instance.playHitMetal();
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
            updateHealthBar();
            gotHitCounter = 12;
            if(getHP() > 0)
            {
               behead = false;
               if((damageObj.isLaunchAir() || actionState == GOTLAUNCHED_STATE || actionState == FALL_STATE || actionState == JUMP_STATE) && !isDowned())
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
               else if(damageObj.isStun())
               {
                  gotStun(damageObj.flyVelX,damageObj.flyVelY);
               }
               else if(!isDowned() && !damageObj.isDeathTouch())
               {
                  doFlinch();
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
   }
}

