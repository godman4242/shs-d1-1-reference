package
{
   public class EnemyNinja extends NPC
   {
      
      public function EnemyNinja(mcs:MCSCharacter = null)
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
               case NINJAJUMPLAND:
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
               case NINJATHROW:
                  this.startAction(WALK_STATE);
                  break;
               case NINJAJUMPTHROW:
                  if(velY < 0)
                  {
                     startAnim(NINJAJUMPRISE);
                  }
                  else
                  {
                     startAnim(NINJAJUMPFALL);
                  }
                  break;
               case NINJASMOKEBOMB:
                  this.createSmoke();
                  setPosition(Math.random() * StageManager.getGameStageWidth(),mcs.y);
                  this.createSmoke();
                  this.startAction(WALK_STATE);
                  break;
               case NINJAJUMPSTART:
                  startAnim(NINJAJUMPRISE);
                  break;
               case NINJASLASH:
                  startAnim(NINJARUN);
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
               mcs.setPose(NINJAWALK,0);
               break;
            case WALK_STATE:
               startAnim(NINJAWALK);
               break;
            case ATTACK_STATE:
               startAnim(NINJARUN);
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
               startAnim(NINJAJUMPLAND);
               break;
            case DYING_STATE:
               break;
            case THROW_STATE:
               this.throwKnife();
               startAnim(NINJATHROW);
               break;
            case JUMPTHROW_STATE:
               velY = -(Math.random() * 15 + 30);
               startAnim(NINJAJUMPSTART);
               break;
            case SMOKEBOMB_STATE:
               startAnim(NINJASMOKEBOMB);
         }
      }
      
      override internal function doAction() : *
      {
         var playerX:int = 0;
         var playerY:int = 0;
         var distanceAway:int = 0;
         var absDist:int = 0;
         var dice:int = 0;
         switch(actionState)
         {
            case IDLE_STATE:
               this.startAction(WALK_STATE);
               break;
            case WALK_STATE:
               playerX = target.mcs.x;
               playerY = target.mcs.y;
               if(playerX < mcs.x)
               {
                  mcs.faceLeft();
                  if(mcs.x - playerX < 200 && mcs.y - playerY < 10 && int(Math.random() * 2) == 0)
                  {
                     this.startAction(ATTACK_STATE);
                  }
                  else
                  {
                     movePositionX(-2);
                  }
               }
               else
               {
                  mcs.faceRight();
                  if(playerX - mcs.x < 200 && mcs.y - playerY < 50 && int(Math.random() * 2) == 0)
                  {
                     this.startAction(ATTACK_STATE);
                  }
                  else
                  {
                     movePositionX(2);
                  }
               }
               if(checkAITrigger())
               {
                  target = NPCManager.getNearestEnemy(getMapPosition(),true);
                  dice = Math.random() * 20;
                  if(dice == 0)
                  {
                     this.startAction(SMOKEBOMB_STATE);
                  }
                  else if(dice == 1)
                  {
                     this.startAction(THROW_STATE);
                  }
                  else if(dice == 2)
                  {
                     this.startAction(JUMPTHROW_STATE);
                  }
                  else if(dice == 3)
                  {
                     this.startAction(ATTACK_STATE);
                  }
               }
               break;
            case ATTACK_STATE:
               if(mcs.scaleX == 1)
               {
                  movePositionX(12);
               }
               else
               {
                  movePositionX(-12);
               }
               distanceAway = mcs.x - target.mcs.x;
               absDist = Math.abs(distanceAway);
               if(absDist < 200)
               {
                  if(mcs.scaleX == 1 && distanceAway < 0 || mcs.scaleX == -1 && distanceAway > 0)
                  {
                     startAnim(NINJASLASH);
                  }
                  target.checkHitObject(mcs.partList[MCSCharacter.PART_weapon],new Damage(damage,level));
               }
               else if(absDist > 500)
               {
                  this.startAction(WALK_STATE);
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
            case JUMPTHROW_STATE:
               if(mcs.animation == NINJAJUMPSTART)
               {
                  return;
               }
               mcs.y += velY;
               velY += 3;
               if(velY > 0 && mcs.animation != NINJAJUMPFALL && mcs.animation != NINJAJUMPTHROW)
               {
                  startAnim(NINJAJUMPTHROW);
                  if(int(Math.random() * 10) == 0)
                  {
                     this.throwThreeKnife();
                  }
                  else
                  {
                     this.throwKnife();
                  }
               }
               if(mcs.y >= StageManager.getGroundY())
               {
                  mcs.y = StageManager.getGroundY();
                  this.startAction(LAND_STATE);
               }
         }
      }
      
      internal function createSmoke() : *
      {
         var ninjaSmoke:NinjaSmoke = null;
         ninjaSmoke = new NinjaSmoke();
         ninjaSmoke.x = mcs.x;
         ninjaSmoke.y = mcs.y;
         StageManager.getGameStageCanvas().addChild(ninjaSmoke);
      }
      
      internal function throwKnife() : *
      {
         this.throwKnifeAtTarget(60);
      }
      
      internal function throwThreeKnife() : *
      {
         this.throwKnifeAtTarget(-100);
         this.throwKnifeAtTarget(0);
         this.throwKnifeAtTarget(100);
      }
      
      internal function throwKnifeAtTarget(num:*) : *
      {
         var fireX:int = mcs.x;
         var fireY:int = mcs.y - 60;
         var targetX:int = target.mcs.x;
         var targetY:int = target.mcs.y - num;
         var xdiff:int = targetX - fireX;
         var ydiff:int = targetY - fireY;
         var dist:int = Math.sqrt(xdiff * xdiff + ydiff * ydiff);
         if(dist == 0)
         {
            dist = 1;
         }
         var velXa:int = xdiff * 20 / dist;
         var velYa:int = ydiff * 20 / dist;
         ProjectileManager.createProjectile(ProjectileManager.PROJ_KUNAI,fireX + StageManager.getStagePosition(),fireY,velXa,velYa,damage,1,this);
      }
   }
}

