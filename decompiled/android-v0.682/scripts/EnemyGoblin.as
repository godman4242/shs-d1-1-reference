package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class EnemyGoblin extends NPC
   {
      
      internal var isPouncer:Boolean = false;
      
      internal var destX:int;
      
      public function EnemyGoblin(mcs:MCSCharacter = null)
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
         this.mcs.healthBar.y = -80;
         this.mcs.displayName.y = -80;
         if(int(Math.random() * 2) == 0)
         {
            this.isPouncer = true;
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
               case ENEMYDEATHNOHEAD:
               case ENEMYDEATHNOHAND:
               case DEATHDOWNED:
               case DEATHINHALF:
               case GOB_DEATH:
                  deathAnimEnd();
                  break;
               case ENEMYLAND:
               case GOB_ATTACK:
               case DOWNSTAB_UP:
               case GOB_JUMP_END:
               case GOB_DASH_END:
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
               case DOWNSTAB:
                  if(target.isDowned())
                  {
                     target.checkHitObject(mcs.partList[MCSCharacter.PART_weapon],new Damage(damage * 2,level));
                  }
                  startAnim(DOWNSTAB_UP);
                  break;
               case GOB_FIDGET:
                  startAnim(GOB_IDLE);
                  break;
               case GOB_POUNCE_START:
                  startAnim(GOB_POUNCE_MID);
                  break;
               case GOB_POUNCE_MID:
                  startAnim(GOB_POUNCE_END);
                  break;
               case GOB_POUNCE_END:
                  target.checkHitObject(mcs.partList[MCSCharacter.PART_r_hand],new Damage(damage,level));
                  this.startAction(IDLE_STATE);
                  this.AI();
                  break;
               case GOB_JUMP_START:
                  startAnim(GOB_JUMP_MID);
                  break;
               case GOB_DASH_START:
                  startAnim(GOB_DASH_MID);
                  break;
               case GOB_DASH_MID:
                  startAnim(GOB_DASH_END);
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
               startAnim(GOB_IDLE);
               break;
            case WALK_STATE:
               walkSpeed = Math.random() * 2 + 4;
               startAnim(GOB_WALK);
               break;
            case RUN_STATE:
               walkSpeed = 10;
               startAnim(GOB_RUN);
               break;
            case ATTACK_STATE:
               startAnim(GOB_ATTACK);
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
               startAnim(GOB_JUMP_END);
               break;
            case DYING_STATE:
               break;
            case STAB_STATE:
               startAnim(DOWNSTAB);
               break;
            case CHARGING_STATE:
               startAnim(GOB_POUNCE_START);
               break;
            case JUMP_STATE:
               startAnim(GOB_JUMP_START);
               velY = -30 - Math.random() * 5;
               break;
            case DASH_STATE:
               startAnim(GOB_DASH_START);
         }
      }
      
      override internal function doAction() : *
      {
         if(checkAITrigger())
         {
            this.AI();
         }
         switch(actionState)
         {
            case IDLE_STATE:
               this.startAction(WALK_STATE);
               break;
            case WALK_STATE:
            case RUN_STATE:
               if(this.destX < posX)
               {
                  mcs.faceLeft();
                  if(posX - this.destX < walkSpeed)
                  {
                     this.AI();
                  }
                  else
                  {
                     movePositionX(-walkSpeed);
                  }
               }
               else
               {
                  mcs.faceRight();
                  if(this.destX - posX < walkSpeed)
                  {
                     this.AI();
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
            case CHARGING_STATE:
               if(mcs.getAnim() == GOB_POUNCE_MID)
               {
                  if(mcs.isFacingRight())
                  {
                     movePositionX(20);
                  }
                  else
                  {
                     movePositionX(-20);
                  }
                  target.checkHitObject(mcs.partList[MCSCharacter.PART_r_hand],new Damage(damage,level));
               }
               break;
            case DYING_STATE:
               doDying();
               break;
            case JUMP_STATE:
               if(getAnim() == GOB_JUMP_MID)
               {
                  mcs.y += velY;
                  velY += 4;
                  if(mcs.isFacingRight())
                  {
                     movePositionX(8);
                  }
                  else
                  {
                     movePositionX(-8);
                  }
                  if(mcs.y >= StageManager.getGroundY())
                  {
                     mcs.y = StageManager.getGroundY();
                     this.startAction(LAND_STATE);
                  }
               }
               break;
            case DASH_STATE:
               if(getAnim() == GOB_DASH_MID)
               {
                  if(mcs.isFacingRight())
                  {
                     movePositionX(-40);
                  }
                  else
                  {
                     movePositionX(40);
                  }
               }
         }
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
         if(actionState == GOTLAUNCHED_STATE)
         {
            dead = true;
            return;
         }
         if(isDowned())
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
               dice = Math.random() * 5;
               if(dice <= 1)
               {
                  startAnim(GOB_DEATH);
                  bloodEmitter = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_torso),StageManager.getGameStageCanvas(),80);
                  bloodEmitter.setAngleVariance(15);
               }
               else if(dice == 2)
               {
                  startAnim(ENEMYDEATH);
                  bloodEmitter = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(MCSCharacter.PART_torso),StageManager.getGameStageCanvas(),80);
                  bloodEmitter.setAngleVariance(15);
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
            }
         }
         else
         {
            dice = Math.random() * 3;
            if(dice <= 1)
            {
               startAnim(GOB_DEATH);
            }
            else if(dice == 2)
            {
               startAnim(ENEMYDEATH);
            }
         }
         dead = true;
         mcs.hideHealthBar();
      }
      
      internal function AI() : *
      {
         var dist:int = 0;
         if(animFrozen || dead || isDowned() || isAirborne() || actionState == GOTLAUNCHED_STATE || actionState == JUMP_STATE || actionState == DASH_STATE)
         {
            return;
         }
         if(this.isUnderSlash())
         {
            if(int(Math.random() * 2) == 0)
            {
               this.startAction(JUMP_STATE);
            }
            else
            {
               this.startAction(DASH_STATE);
            }
            return;
         }
         target = NPCManager.getNearestEnemy(getMapPosition(),true);
         var targetX:int = target.posX;
         if(targetX < posX)
         {
            dist = posX - targetX;
            if(dist <= 50)
            {
               mcs.faceLeft();
               if(actionState != ATTACK_STATE && !target.isAirborne())
               {
                  this.startAction(ATTACK_STATE);
               }
            }
            else if(dist <= 300)
            {
               mcs.faceLeft();
               this.destX = targetX;
               if(this.isPouncer)
               {
                  if(actionState != CHARGING_STATE)
                  {
                     this.startAction(CHARGING_STATE);
                  }
               }
               else if(actionState != RUN_STATE)
               {
                  this.startAction(RUN_STATE);
               }
            }
            else
            {
               mcs.faceLeft();
               this.destX = targetX;
               if(actionState != WALK_STATE)
               {
                  this.startAction(WALK_STATE);
               }
            }
         }
         else
         {
            dist = targetX - posX;
            if(dist <= 50)
            {
               mcs.faceRight();
               if(actionState != ATTACK_STATE)
               {
                  this.startAction(ATTACK_STATE);
               }
            }
            else if(dist <= 300)
            {
               mcs.faceRight();
               this.destX = targetX;
               if(this.isPouncer)
               {
                  if(actionState != CHARGING_STATE)
                  {
                     this.startAction(CHARGING_STATE);
                  }
               }
               else if(actionState != RUN_STATE)
               {
                  this.startAction(RUN_STATE);
               }
            }
            else
            {
               mcs.faceRight();
               this.destX = targetX;
               if(actionState != WALK_STATE)
               {
                  this.startAction(WALK_STATE);
               }
            }
         }
      }
      
      internal function isUnderSlash() : Boolean
      {
         var pt:Point = null;
         var slashArray:Vector.<Point> = StageManager.getPlayer().getSlashArray();
         var offset:int = StageManager.getStagePosition();
         var max:int = int(slashArray.length);
         for(var i:int = 0; i < max; i++)
         {
            pt = slashArray[i];
            if(mcs.hitTestPoint(pt.x - offset,pt.y))
            {
               return true;
            }
         }
         return false;
      }
   }
}

