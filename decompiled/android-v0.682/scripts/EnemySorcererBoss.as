package
{
   public class EnemySorcererBoss extends NPC
   {
      
      internal var cooldown_chiburst:int = 0;
      
      internal var cooldown_chiburst_max:int = 360;
      
      internal var cooldown_zombie:int = 0;
      
      internal var cooldown_zombie_max:int = 480;
      
      internal var cooldown_voidskull:int = 0;
      
      internal var cooldown_voidskull_max:int = 360;
      
      public function EnemySorcererBoss(mcs:MCSCharacter = null)
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
         StageManager.getGameStage().createRoomObject(55,650,StageManager.getGameStage().getGroundY(),"2");
      }
      
      override public function init(xml:XMLNpc) : *
      {
         initMCSFromXML(xml.mcs);
         damage = xml.attack;
         defense = xml.defense;
         maxhp = xml.hp;
         level = xml.lvl;
         xp = level * 2 + 20;
         reset();
         if(mcs.y == StageManager.getGroundY())
         {
            this.startAction(IDLE_STATE);
         }
         else
         {
            this.startAction(FALL_STATE);
         }
         reward = new XMLReward(xml.reward);
         STAT_FIREATK = xml.STAT_FIREATK;
         STAT_WINDATK = xml.STAT_WINDATK;
         STAT_WATERATK = xml.STAT_WATERATK;
         STAT_EARTHATK = xml.STAT_EARTHATK;
         STAT_FIREDEF = xml.STAT_FIREDEF;
         STAT_WINDDEF = xml.STAT_WINDDEF;
         STAT_WATERDEF = xml.STAT_WATERDEF;
         STAT_EARTHDEF = xml.STAT_EARTHDEF;
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
               case GROUNDPUNCH_PARTA:
                  if(actionState == SKILL_CHIBURST_STATE)
                  {
                     if(getMCS().isFacingRight())
                     {
                        ProjectileManager.createProjectile(ProjectileManager.PROJ_CHIBURST,getMapPosition() + 40,getMCS().y,0,0,0,-1,this);
                     }
                     else
                     {
                        ProjectileManager.createProjectile(ProjectileManager.PROJ_CHIBURST,getMapPosition() - 40,getMCS().y,0,0,0,11,this);
                     }
                  }
                  startAnim(GROUNDPUNCH_PARTB);
                  break;
               case GROUNDPUNCH_PARTB:
                  this.startAction(WALK_STATE);
                  break;
               case JUTSU_GROUND_PARTA:
                  startAnim(JUTSU_GROUND_PARTB);
                  if(actionState == SKILL_SUMMON_STATE)
                  {
                     NPCManager.createEnemy(87,Math.random() * StageManager.getGameStage().getGameStageWidth(),0,true,level - 2);
                     NPCManager.createEnemy(87,Math.random() * StageManager.getGameStage().getGameStageWidth(),0,true,level - 2);
                     NPCManager.createEnemy(87,Math.random() * StageManager.getGameStage().getGameStageWidth(),0,true,level - 2);
                     NPCManager.createEnemy(87,Math.random() * StageManager.getGameStage().getGameStageWidth(),0,true,level - 2);
                  }
                  break;
               case JUTSU_GROUND_PARTB:
                  this.startAction(WALK_STATE);
                  break;
               case JUTSU_AIR:
                  this.startAction(WALK_STATE);
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
         if(this.cooldown_chiburst > 0)
         {
            --this.cooldown_chiburst;
         }
         if(this.cooldown_zombie > 0)
         {
            --this.cooldown_zombie;
         }
         if(this.cooldown_voidskull > 0)
         {
            --this.cooldown_voidskull;
         }
      }
      
      override internal function startAction(actionState:int) : *
      {
         this.actionState = actionState;
         switch(actionState)
         {
            case IDLE_STATE:
               faceTarget();
               mcs.startAnim(SIT);
               break;
            case WALK_STATE:
               if(getMapPosition() > 625 && getMapPosition() < 675)
               {
                  this.startAction(IDLE_STATE);
               }
               else
               {
                  if(getMapPosition() < 650)
                  {
                     walkSpeed = 6;
                     mcs.faceRight();
                  }
                  else
                  {
                     walkSpeed = -6;
                     mcs.faceLeft();
                  }
                  startAnim(WALK);
               }
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
            case SKILL_CHIBURST_STATE:
               startAnim(GROUNDPUNCH_PARTA);
               this.cooldown_chiburst = this.cooldown_chiburst_max;
               break;
            case SKILL_SUMMON_STATE:
               startAnim(JUTSU_GROUND_PARTA);
               this.cooldown_zombie = this.cooldown_zombie_max;
               break;
            case THROW_STATE:
               faceTarget();
               startAnim(JUTSU_AIR);
               this.cooldown_voidskull = this.cooldown_voidskull_max;
               if(getMCS().isFacingRight())
               {
                  ProjectileManager.createProjectile(ProjectileManager.PROJ_VOIDSKULL,getMapPosition() + 100,getMCS().y - 50,5,0,0,1,this);
               }
               else
               {
                  ProjectileManager.createProjectile(ProjectileManager.PROJ_VOIDSKULL,getMapPosition() - 100,getMCS().y - 50,-5,0,0,1,this);
               }
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
               break;
            case WALK_STATE:
               movePositionX(walkSpeed);
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
         }
      }
      
      internal function AI() : *
      {
         var dice:int = 0;
         if(animFrozen || dead || isDowned() || isAirborne() || actionState == GOTLAUNCHED_STATE)
         {
            return;
         }
         var playerX:int = target.mcs.x;
         var playerY:int = target.mcs.y;
         switch(actionState)
         {
            case IDLE_STATE:
               if(getHP() < maxhp)
               {
                  setHP(getHP() + 10);
                  updateHealthBar();
               }
               dice = Math.random() * 2;
               if(this.cooldown_chiburst == 0 && Math.abs(mcs.x - playerX) < 50 && mcs.y - playerY < 50)
               {
                  this.startAction(SKILL_CHIBURST_STATE);
               }
               else if(dice == 1)
               {
                  if(this.cooldown_zombie == 0 && NPCManager.getEnemyCount() < 8)
                  {
                     this.startAction(SKILL_SUMMON_STATE);
                  }
                  else if(this.cooldown_voidskull == 0)
                  {
                     this.startAction(THROW_STATE);
                  }
               }
               break;
            case WALK_STATE:
               dice = Math.random() * 2;
               if(this.cooldown_chiburst == 0 && Math.abs(mcs.x - playerX) < 50 && mcs.y - playerY < 50)
               {
                  this.startAction(SKILL_CHIBURST_STATE);
               }
               else if(dice == 1)
               {
                  if(this.cooldown_zombie == 0 && NPCManager.getEnemyCount() < 8)
                  {
                     this.startAction(SKILL_SUMMON_STATE);
                  }
                  else if(this.cooldown_voidskull == 0)
                  {
                     this.startAction(THROW_STATE);
                  }
               }
               if(getMapPosition() > 625 && getMapPosition() < 675)
               {
                  this.startAction(IDLE_STATE);
               }
         }
      }
   }
}

