package
{
   import flash.display.MovieClip;
   
   public class EnemyJiangSi extends NPC
   {
      
      public function EnemyJiangSi(mcs:MCSCharacter = null)
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
      
      override public function init(xml:XMLNpc) : *
      {
         super.init(xml);
         if(mcs.y == StageManager.getGroundY())
         {
            this.startAction(IDLE_STATE);
         }
         else
         {
            this.startAction(FALL_STATE);
         }
         canGotStun = false;
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
                  this.startAction(ATTACK_STATE);
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
                        startAnim(JS_RISE);
                     }
                     else
                     {
                        startAnim(GOTLAUNCHEDDOWNEDEND);
                     }
                  }
                  break;
               case GOTLAUNCHEDDOWNEDEND:
                  startAnim(JS_RISE);
                  break;
               case JS_RISE:
                  mcs.moveHealthBarX(0);
                  if(mcs.scaleX == 1)
                  {
                     movePositionX(-30);
                  }
                  else
                  {
                     movePositionX(30);
                  }
                  this.startAction(ATTACK_STATE);
                  break;
               case JS_ALERT:
                  this.startAction(ATTACK_STATE);
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
               startAnim(JS_IDLE);
               break;
            case ATTACK_STATE:
               if(getAnim() == JS_HOP)
               {
                  mcs.restartAnim();
               }
               else
               {
                  startAnim(JS_HOP);
               }
               if(target.mcs.x < mcs.x)
               {
                  velX = -10 - Math.random() * 5;
                  mcs.faceLeft();
               }
               else
               {
                  velX = 10 + Math.random() * 5;
                  mcs.faceRight();
               }
               velY = -10 - Math.random() * 10;
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
               aiCounter = 24;
               break;
            case DYING_STATE:
               break;
            case POSE_STATE:
               startAnim(JS_ALERT);
         }
      }
      
      override internal function doAction() : *
      {
         switch(actionState)
         {
            case IDLE_STATE:
               if(Math.abs(target.mcs.x - mcs.x) < 50)
               {
                  this.startAction(POSE_STATE);
               }
               break;
            case ATTACK_STATE:
               movePositionX(velX);
               mcs.y += velY;
               velY += 1;
               if(mcs.y >= StageManager.getGroundY())
               {
                  mcs.y = StageManager.getGroundY() + 5;
                  this.startAction(LAND_STATE);
               }
               target.checkHitObject(mcs,new Damage(damage,level));
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
                  this.startAction(ATTACK_STATE);
               }
               break;
            case LAND_STATE:
               --aiCounter;
               if(aiCounter <= 0)
               {
                  this.startAction(ATTACK_STATE);
               }
               break;
            case DYING_STATE:
               doDying();
         }
      }
      
      override public function gotHit(target:MovieClip, damageObj:Damage) : Boolean
      {
         var damage:int = 0;
         if(gotHitCounter > 0)
         {
            return false;
         }
         if(actionState == IDLE_STATE)
         {
            this.startAction(POSE_STATE);
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
            setHP(getHP() - (damage + fireDamage + windDamage + waterDamage + earthDamage));
            updateHealthBar();
            gotHitCounter = 12;
            if(getHP() > 0)
            {
               behead = false;
               if((damageObj.isLaunchAir() || actionState == GOTLAUNCHED_STATE || actionState == FALL_STATE || actionState == JUMP_STATE || actionState == ATTACK_STATE) && !isDowned())
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

