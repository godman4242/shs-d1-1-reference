package
{
   public class EnemyArcher extends NPC
   {
      
      internal var destX:int;
      
      public function EnemyArcher(mcs:MCSCharacter = null)
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
            target = NPCManager.getNearestEnemy(getMapPosition(),!isFriendly);
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
                  this.destX = Math.random() * StageManager.getGameStageWidth();
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
               case ARROWRELOAD:
                  startAnim(ARROWPULLBACK);
                  break;
               case ARROWPULLBACK:
                  this.startAction(AIM_STATE);
                  break;
               case ARROWFIRE:
                  this.startAction(RELOAD_STATE);
                  break;
               case KNIFEATTACK:
                  target.checkHitObject(mcs.partList[MCSCharacter.PART_weapon],new Damage(damage,level));
                  this.startAction(WALK_STATE);
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
               mcs.startAnim(BOWIDLE);
               break;
            case WALK_STATE:
               this.destX = 20 + Math.random() * (StageManager.getGameStageWidth() - 40);
               walkSpeed = Math.random() * 2 + 5;
               startAnim(KNIFEWALK);
               break;
            case AIM_STATE:
               startAnim(ARROWPULLBACK);
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
            case RELOAD_STATE:
               if(target.mcs.x < mcs.x)
               {
                  mcs.faceLeft();
               }
               else
               {
                  mcs.faceRight();
               }
               startAnim(ARROWRELOAD);
               break;
            case ATTACK_STATE:
               startAnim(KNIFEATTACK);
         }
      }
      
      override internal function doAction() : *
      {
         var playerX:* = target.mcs.x;
         switch(actionState)
         {
            case IDLE_STATE:
               this.startAction(WALK_STATE);
               break;
            case WALK_STATE:
               if(Math.abs(this.destX - posX) < 10)
               {
                  this.startAction(RELOAD_STATE);
                  return;
               }
               if(this.destX > posX)
               {
                  mcs.faceRight();
                  movePositionX(walkSpeed);
               }
               else
               {
                  mcs.faceLeft();
                  movePositionX(-walkSpeed);
               }
               if(Math.abs(target.mcs.x - mcs.x) < 100)
               {
                  this.startAction(ATTACK_STATE);
               }
               else if(posX > 20 && posX < StageManager.getGameStageWidth() - 20 && int(Math.random() * 10) == 0)
               {
                  this.startAction(RELOAD_STATE);
               }
               break;
            case AIM_STATE:
               if(checkAITrigger())
               {
                  target = NPCManager.getNearestEnemy(getMapPosition(),!isFriendly);
                  if(target == null)
                  {
                     return;
                  }
                  if(Math.abs(target.mcs.x - mcs.x) < 100)
                  {
                     this.startAction(ATTACK_STATE);
                  }
                  else
                  {
                     if(mcs.x < target.mcs.x)
                     {
                        mcs.faceRight();
                     }
                     else
                     {
                        mcs.faceLeft();
                     }
                     if(isFriendly)
                     {
                        this.fireArrow();
                     }
                     else if(int(Math.random() * 2) == 0)
                     {
                        this.fireArrow();
                     }
                  }
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
         }
      }
      
      internal function fireArrow() : *
      {
         var fireX:int = mcs.x;
         var fireY:int = mcs.y - 60;
         var targetX:int = target.mcs.x;
         var targetY:int = target.mcs.y - 60;
         var velA:Number = Projectile.GRAVITY * Math.abs(targetX - fireX) / 0.866;
         velA = Math.sqrt(velA);
         var velXa:Number = velA * 0.866;
         var t:Number = Math.abs(targetX - fireX) / velXa;
         var velYa:Number = (targetY - fireY - 0.5 * Projectile.GRAVITY * t * t) / t;
         if(fireX > targetX)
         {
            velXa = -velXa;
         }
         velYa += Math.random() * 8 - 4;
         var doLaunch:Boolean = false;
         if(level > 50)
         {
            doLaunch = int(Math.random() * 2) > 0;
         }
         else if(level > 20)
         {
            doLaunch = int(Math.random() * 3) == 0;
         }
         else if(level > 10)
         {
            doLaunch = int(Math.random() * 4) == 0;
         }
         ProjectileManager.createArrow(fireX,fireY,velXa,velYa,damage,doLaunch,this);
         startAnim(ARROWFIRE);
      }
      
      override public function die() : *
      {
         super.die();
         mcs.setProp(13000);
      }
   }
}

