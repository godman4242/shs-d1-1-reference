package
{
   public class EnemyFox extends EnemyWolf
   {
      
      public function EnemyFox(mcs:MCSCharacter = null)
      {
         super();
         if(mcs == null)
         {
            this.mcs = new MCSWolf();
         }
         else
         {
            this.mcs = mcs;
         }
      }
      
      override public function init(xml:XMLNpc) : *
      {
         initMCSFromXML(xml.mcs);
         damage = xml.attack;
         defense = xml.defense;
         maxhp = xml.hp;
         level = xml.lvl;
         xp = level * 5 + 45;
         reset();
         if(mcs.y == StageManager.getGroundY())
         {
            startAction(WALK_STATE);
         }
         else
         {
            startAction(FALL_STATE);
         }
         reward = new XMLReward(xml.reward);
      }
      
      override internal function doAction() : *
      {
         var dice:int = 0;
         var dist:int = 0;
         var str:String = null;
         switch(actionState)
         {
            case IDLE_STATE:
               --idleCounter;
               if(idleCounter <= 0)
               {
                  idleCounter = 12;
                  faceTarget();
                  if(int(Math.random() * 3) < 2)
                  {
                     startAction(WALK_STATE);
                     mcs.setSpeechText("");
                  }
                  if(GameEngine.isAdventureMode() && int(Math.random() * 5) == 0)
                  {
                     dice = Math.random() * 9;
                     if(dice == 0)
                     {
                        str = "Gering-ding-ding-ding-dingeringeding!";
                     }
                     else if(dice == 1)
                     {
                        str = "Wa-pa-pa-pa-pa-pa-pow!";
                     }
                     else if(dice == 2)
                     {
                        str = "Hatee-hatee-hatee-ho!";
                     }
                     else if(dice == 3)
                     {
                        str = "Joff-tchoff-tchoffo-tchoffo-tchoff!";
                     }
                     else if(dice == 4)
                     {
                        str = "Jacha-chacha-chacha-chow!";
                     }
                     else if(dice == 5)
                     {
                        str = "Fraka-kaka-kaka-kaka-kow!";
                     }
                     else if(dice == 6)
                     {
                        str = "A-hee-ahee ha-hee!";
                     }
                     else if(dice == 7)
                     {
                        str = "A-oo-oo-oo-ooo!";
                     }
                     else if(dice == 8)
                     {
                        str = ".... --- .-. ... .";
                     }
                     mcs.setSpeechText(str);
                  }
               }
               this.checkPlayer();
               break;
            case WALK_STATE:
               movePositionX(walkSpeed);
               if(Math.abs(destX - posX) < 10)
               {
                  dice = Math.random() * 2;
                  if(dice == 0)
                  {
                     startAction(IDLE_STATE);
                  }
                  else
                  {
                     startAction(WALK_STATE);
                  }
               }
               this.checkPlayer();
               if(!GameEngine.isAdventureMode())
               {
                  dist = Math.abs(mcs.x - target.mcs.x);
                  if(dist < 100 && dist > 50)
                  {
                     startAction(ATTACK_STATE);
                  }
                  else if(dist >= 100 && dist < 250 && int(Math.random() * 3) == 0)
                  {
                     startAction(CHARGING_STATE);
                  }
               }
               break;
            case RUN_STATE:
               movePositionX(walkSpeed);
               if(Math.abs(destX - posX) < 10)
               {
                  dice = Math.random() * 3;
                  if(dice == 0)
                  {
                     startAction(IDLE_STATE);
                  }
                  else if(dice == 1)
                  {
                     startAction(WALK_STATE);
                  }
                  else
                  {
                     destX = Math.random() * StageManager.getGameStageWidth();
                     startAction(RUN_STATE);
                  }
                  if(GameEngine.isAdventureMode() && (posX <= -50 || posX > StageManager.getGameStageWidth() + 50))
                  {
                     startAction(REDFREEZE_STATE);
                     startAnim(WOLF_IDLE);
                  }
               }
               if(!GameEngine.isAdventureMode())
               {
                  dist = Math.abs(mcs.x - target.mcs.x);
                  if(dist < 100 && dist > 50)
                  {
                     startAction(ATTACK_STATE);
                  }
                  else if(dist >= 100 && dist < 250 && int(Math.random() * 3) == 0)
                  {
                     startAction(CHARGING_STATE);
                  }
               }
               break;
            case ATTACK_STATE:
               if(!GameEngine.isAdventureMode())
               {
                  target.checkHitObject(mcs.partList[MCSCharacter.PART_weapon],new Damage(damage,level));
               }
               break;
            case CHARGING_STATE:
               if(mcs.getAnim() == WOLF_POUNCE_MID || mcs.getAnim() == WOLF_POUNCE_MIDHIGH)
               {
                  if(mcs.isFacingRight())
                  {
                     movePositionX(15);
                  }
                  else
                  {
                     movePositionX(-15);
                  }
                  if(!GameEngine.isAdventureMode())
                  {
                     target.checkHitObject(mcs.partList[MCSCharacter.PART_head],new Damage(damage,level));
                     target.checkHitObject(mcs.partList[MCSCharacter.PART_r_hand],new Damage(damage,level));
                  }
               }
               break;
            case GOTLAUNCHED_STATE:
               doLaunched();
               break;
            case DOWNED_STATE:
               --idleCounter;
               if(idleCounter <= 0)
               {
                  startAnim(WOLF_DOWNEDTOIDLE);
               }
               break;
            case FALL_STATE:
               mcs.y += velY;
               velY += 3;
               if(mcs.y >= StageManager.getGroundY())
               {
                  mcs.y = StageManager.getGroundY();
                  startAction(LAND_STATE);
               }
               break;
            case LAND_STATE:
               break;
            case DYING_STATE:
               doDying();
         }
      }
      
      internal function checkPlayer() : *
      {
         var playerX:int = target.mcs.x;
         if(playerX < mcs.x && !mcs.isFacingRight())
         {
            if(mcs.x - playerX < 200)
            {
               destX = StageManager.getGameStageWidth() + 100;
               startAction(RUN_STATE);
               mcs.setSpeechText("");
            }
         }
         else if(playerX > mcs.x && mcs.isFacingRight())
         {
            if(playerX - mcs.x < 200)
            {
               destX = -100;
               startAction(RUN_STATE);
               mcs.setSpeechText("");
            }
         }
      }
   }
}

