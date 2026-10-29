package
{
   import flash.display.MovieClip;
   
   public class CutsceneActor extends NPC
   {
      
      internal var destX:int;
      
      internal var obj_NPCAnimated:Obj_NPCAnimated;
      
      internal var idleCounter:int;
      
      internal var walkEndPose:String = "";
      
      internal var walkEndPoseFrame:int = 0;
      
      public function CutsceneActor(mcs:MCSCharacter = null)
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
         dontGiveLoot = true;
      }
      
      override public function init(xml:XMLNpc) : *
      {
         initMCSFromXML(xml.mcs);
         reset();
         this.startAction(IDLE_STATE);
         mcs.hideHealthBar();
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
               startAnim(IDLE2);
               break;
            case WALK_STATE:
               startAnim(WALK_SHEATHED);
               if(this.destX < posX)
               {
                  mcs.faceLeft();
               }
               else
               {
                  mcs.faceRight();
               }
         }
      }
      
      override internal function doAction() : *
      {
         switch(actionState)
         {
            case IDLE_STATE:
               break;
            case WALK_STATE:
               movePositionX(walkSpeed);
               if(Math.abs(this.destX - posX) < 10)
               {
                  trace(this.obj_NPCAnimated.objectName);
                  this.startAction(IDLE_STATE);
                  if(this.walkEndPose != "")
                  {
                     if(this.walkEndPoseFrame == -1)
                     {
                        startAnim(this.walkEndPose);
                        this.walkEndPose = "";
                        this.walkEndPoseFrame = 0;
                     }
                     else
                     {
                        getMCS().setPose(this.walkEndPose,this.walkEndPoseFrame);
                        this.walkEndPose = "";
                        this.walkEndPoseFrame = 0;
                     }
                  }
               }
               break;
            case MOVE_STATE:
               movePositionX(velX);
               mcs.y += velY;
         }
      }
      
      public function performCutsceneAction(action:String, param:String) : *
      {
         var strArray:Array = null;
         var ypos:int = 0;
         switch(action)
         {
            case "anim":
               startAnim(param);
               break;
            case "stopmoving":
               this.destX = posX;
               break;
            case "pose":
               strArray = param.split(",");
               getMCS().setPose(strArray[0],strArray[1]);
               break;
            case "face":
               if(param == "right")
               {
                  getMCS().faceRight();
               }
               else
               {
                  getMCS().faceLeft();
               }
               break;
            case "walk":
               strArray = param.split(",");
               this.destX = strArray[0];
               walkSpeed = strArray[1];
               this.startAction(WALK_STATE);
               if(strArray.length >= 3)
               {
                  startAnim(strArray[2]);
               }
               if(strArray.length >= 4)
               {
                  this.walkEndPose = strArray[3];
               }
               if(strArray.length >= 5)
               {
                  this.walkEndPoseFrame = int(strArray[4]);
               }
               break;
            case "say":
               getMCS().setSpeechText(LangManager.getString(int(param)));
               break;
            case "remove":
               NPCManager.removeRoomNPC(this);
               this.obj_NPCAnimated.destroy();
               break;
            case "setposition":
               if(actionState == WALK_STATE)
               {
                  actionState = IDLE_STATE;
               }
               strArray = param.split(",");
               if(strArray.length == 2)
               {
                  ypos = int(strArray[1]);
               }
               else
               {
                  ypos = StageManager.getGroundY();
               }
               setPosition(int(strArray[0]),ypos);
               break;
            case "move":
               velX = int(strArray[0]);
               if(strArray.length == 2)
               {
                  velY = int(strArray[1]);
               }
               else
               {
                  velY = 0;
               }
               this.startAction(MOVE_STATE);
               break;
            case "addemitter":
               strArray = param.split(",");
               bloodEmitter = ParticleSystemManager.getInstance().createEmitter(0,mcs.getPart(int(strArray[0])),StageManager.getGameStageCanvas(),int(strArray[1]));
               bloodEmitter.setAngleVariance(int(strArray[2]));
               break;
            case "removeemitter":
               if(bloodEmitter != null)
               {
                  bloodEmitter.destroy();
               }
               break;
            case "darkblur":
               if(param == "0")
               {
                  ColorCode.clearFilter(getMCS());
               }
               else
               {
                  ColorCode.makeDark_blur(getMCS(),-200,4);
               }
         }
      }
      
      public function setNPCAnimated(obj:Obj_NPCAnimated) : *
      {
         this.obj_NPCAnimated = obj;
      }
      
      override public function die() : *
      {
      }
      
      override public function gotHit(target:MovieClip, damageObj:Damage) : Boolean
      {
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
         return true;
      }
   }
}

