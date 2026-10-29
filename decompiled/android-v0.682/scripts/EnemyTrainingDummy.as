package
{
   import flash.display.MovieClip;
   
   public class EnemyTrainingDummy extends NPC
   {
      
      internal var line:DottedLine;
      
      public function EnemyTrainingDummy(mcs:MCSCharacter = null)
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
      
      override public function setLevel(lvl:int) : *
      {
         level = lvl;
         if(lvl == 1)
         {
            TutorialUI.instance.setState(1);
         }
         else if(lvl == 2)
         {
            startAnim(IDLE_LIGHT);
            TutorialUI.instance.setState(5);
            mcs.setSpeechText(LangManager.getString(629));
         }
         else if(lvl == 3)
         {
            startAnim(IDLE_HEAVY);
            maxhp = 8;
            setHP(maxhp);
            mcs.setSpeechText(LangManager.getString(630));
            BattleUI.instance.readyAllSkills();
         }
         else if(lvl == 4)
         {
            TutorialUI.instance.setState(13);
         }
      }
      
      override public function update() : *
      {
         if(mcs == null || animFrozen)
         {
            return;
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
               case KNIFEATTACK:
               case DOWNSTAB_UP:
                  this.startAction(WALK_STATE);
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
                     startAnim(GOTLAUNCHEDDOWNEDEND);
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
            case WALK_STATE:
               break;
            case ATTACK_STATE:
               startAnim(KNIFEATTACK);
               break;
            case GOTLAUNCHED_STATE:
               startAnim(GOTLAUNCHED_RISE);
               break;
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
               startAnim(DOWNSTAB);
         }
      }
      
      override internal function doAction() : *
      {
         switch(actionState)
         {
            case IDLE_STATE:
            case WALK_STATE:
            case ATTACK_STATE:
               break;
            case GOTLAUNCHED_STATE:
               doLaunched();
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
      
      override public function checkHit(hitX:int, hitY:int, damageObj:Damage) : Boolean
      {
         var mc:MovieClip = null;
         if(level == 2 && damageObj.stance != 2)
         {
            return false;
         }
         var max:int = mcs.getPartListLength();
         var partList:Vector.<MovieClip> = mcs.partList;
         var i:* = int(max - 1);
         while(i >= 0 && !gotHitFlag)
         {
            mc = partList[i];
            if(mc.hitTestPoint(hitX,hitY))
            {
               if(gotHit(mc,damageObj))
               {
                  return true;
               }
               return false;
            }
            i--;
         }
         return false;
      }
      
      override public function checkHitObject(thing:MovieClip, damage:Damage, checkByAttacker:Boolean = false) : Boolean
      {
         var mc:MovieClip = null;
         if(level == 2 && damage.stance != 2)
         {
            return false;
         }
         var max:int = mcs.getPartListLength();
         var partList:Vector.<MovieClip> = mcs.partList;
         var i:* = int(max - 1);
         while(i >= 0 && !gotHitFlag)
         {
            mc = partList[i];
            if(mc.hitTestObject(thing))
            {
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
         if(actionState != GOTLAUNCHED_STATE && actionState != DYING_STATE)
         {
            animFrozen = true;
         }
         mcs.setSpeechText("");
         TutorialUI.instance.setState(0);
         if(this.line != null)
         {
            mcs.removeChild(this.line);
         }
      }
      
      override public function die() : *
      {
         if(level == 1)
         {
            super.die();
         }
         else
         {
            SoundManager.instance.playDie();
            createLoot();
            rewardXP();
            actionState = DYING_STATE;
            if(level == 3)
            {
               startAnim(DEATHINHALF);
            }
            else
            {
               startAnim(ENEMYDEATHNOHAND);
            }
            dead = true;
            mcs.hideHealthBar();
         }
      }
   }
}

