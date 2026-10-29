package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class NPCManager
   {
      
      internal static var canvas:MovieClip;
      
      internal static var currentWave:int;
      
      internal static var currentFriendWave:int;
      
      internal static var waveCount:int;
      
      internal static var friendWaveCount:int;
      
      internal static var endless:Boolean;
      
      internal static var totalKilled:int;
      
      internal static var totalBeheading:int;
      
      internal static var allyList:Array = new Array();
      
      internal static var enemyList:Array = new Array();
      
      internal static var friendList:Array = new Array();
      
      internal static var neutralList:Array = new Array();
      
      internal static var objectiveList:Vector.<NPC> = new Vector.<NPC>();
      
      internal static var networkPlayerList:Vector.<NPC> = new Vector.<NPC>();
      
      internal static var enemyWave:Vector.<Vector.<NPCHolder>> = new Vector.<Vector.<NPCHolder>>();
      
      internal static var friendWave:Vector.<Vector.<NPCHolder>> = new Vector.<Vector.<NPCHolder>>();
      
      internal static var neutralWave:Vector.<Vector.<NPCHolder>> = new Vector.<Vector.<NPCHolder>>();
      
      internal static var objectiveWave:Vector.<Vector.<NPCHolder>> = new Vector.<Vector.<NPCHolder>>();
      
      internal static var networkPlayerCount:int = 0;
      
      internal static var npcDataCache:Vector.<XMLNpc> = new Vector.<XMLNpc>();
      
      public function NPCManager()
      {
         super();
      }
      
      public static function reset() : *
      {
         objectiveList.fixed = false;
         networkPlayerList.fixed = false;
         npcDataCache.fixed = false;
         enemyList.length = 0;
         friendList.length = 0;
         neutralList.length = 0;
         objectiveList.length = 0;
         networkPlayerList.length = 0;
         npcDataCache.length = 0;
         enemyWave.fixed = false;
         friendWave.fixed = false;
         neutralWave.fixed = false;
         objectiveWave.fixed = false;
         enemyWave.length = 0;
         friendWave.length = 0;
         neutralWave.length = 0;
         objectiveWave.length = 0;
         currentWave = -1;
         currentFriendWave = -1;
         endless = false;
         canvas = null;
         networkPlayerCount = 0;
         totalKilled = 0;
         totalBeheading = 0;
      }
      
      public static function init(wave:Vector.<XMLQuestWave>) : *
      {
         var j:int = 0;
         var k:int = 0;
         var qty:int = 0;
         var id:int = 0;
         var fatal:String = null;
         var count:int = 0;
         var xpos:String = null;
         var lvl:String = null;
         var npcIdStrArray:Array = null;
         var i:int = 0;
         reset();
         canvas = StageManager.getGameStageCanvas();
         for(var max:int = int(wave.length); i < max; )
         {
            if(wave[i].endless == 1)
            {
               endless = true;
            }
            neutralWave.push(new Vector.<NPCHolder>());
            objectiveWave.push(new Vector.<NPCHolder>());
            count = wave[i].enemy.length();
            if(count > 0)
            {
               enemyWave.push(new Vector.<NPCHolder>());
            }
            for(j = 0; j < count; j++)
            {
               qty = int(wave[i].enemy[j].qty);
               fatal = wave[i].enemy[j].fatal;
               xpos = wave[i].enemy[j].x;
               lvl = wave[i].enemy[j].lvl;
               for(k = 0; k < qty; k++)
               {
                  npcIdStrArray = wave[i].enemy[j].id.split("|");
                  if(npcIdStrArray.length == 1)
                  {
                     id = int(npcIdStrArray[0]);
                  }
                  else
                  {
                     id = int(npcIdStrArray[int(Math.random() * npcIdStrArray.length)]);
                  }
                  cacheNPCData(id);
                  if(xpos != "")
                  {
                     xpos = int(int(xpos) + Math.random() * 80 - 40).toString();
                  }
                  enemyWave[i].push(new NPCHolder(id,fatal,xpos,lvl));
               }
            }
            count = wave[i].friend.length();
            if(count > 0)
            {
               friendWave.push(new Vector.<NPCHolder>());
            }
            for(j = 0; j < count; j++)
            {
               qty = int(wave[i].friend[j].qty);
               fatal = wave[i].friend[j].fatal;
               xpos = wave[i].friend[j].x;
               lvl = wave[i].friend[j].lvl;
               for(k = 0; k < qty; k++)
               {
                  npcIdStrArray = wave[i].friend[j].id.split("|");
                  if(npcIdStrArray.length == 1)
                  {
                     id = int(npcIdStrArray[0]);
                  }
                  else
                  {
                     id = int(npcIdStrArray[int(Math.random() * npcIdStrArray.length)]);
                  }
                  cacheNPCData(id);
                  friendWave[i].push(new NPCHolder(id,fatal,xpos,lvl));
               }
            }
            count = wave[i].neutral.length();
            for(j = 0; j < count; j++)
            {
               qty = int(wave[i].neutral[j].qty);
               fatal = wave[i].neutral[j].fatal;
               xpos = wave[i].neutral[j].x;
               lvl = wave[i].neutral[j].lvl;
               for(k = 0; k < qty; k++)
               {
                  npcIdStrArray = wave[i].neutral[j].id.split("|");
                  if(npcIdStrArray.length == 1)
                  {
                     id = int(npcIdStrArray[0]);
                  }
                  else
                  {
                     id = int(npcIdStrArray[int(Math.random() * npcIdStrArray.length)]);
                  }
                  cacheNPCData(id);
                  neutralWave[i].push(new NPCHolder(id,fatal,xpos,lvl));
               }
            }
            count = wave[i].objective.length();
            for(j = 0; j < count; j++)
            {
               id = int(wave[i].objective[j].id);
               qty = int(wave[i].objective[j].qty);
               fatal = wave[i].objective[j].fatal;
               xpos = wave[i].objective[j].x;
               lvl = wave[i].objective[j].lvl;
               cacheNPCData(id);
               for(k = 0; k < qty; k++)
               {
                  objectiveWave[i].push(new NPCHolder(id,fatal,xpos,lvl));
               }
            }
            i++;
         }
         waveCount = enemyWave.length;
         friendWaveCount = friendWave.length;
         enemyWave.fixed = true;
         friendWave.fixed = true;
         neutralWave.fixed = true;
         objectiveWave.fixed = true;
         nextWave();
         nextFriendWave();
      }
      
      internal static function cacheNPCData(npcID:int) : *
      {
         var max:int = int(npcDataCache.length);
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            if(npcDataCache[i].id == npcID)
            {
               return;
            }
         }
         var npcData:XMLNpc = QuestEngine.getNPCData(npcID);
         if(npcData != null)
         {
            npcDataCache.fixed = false;
            npcDataCache.push(npcData);
            npcDataCache.fixed = true;
         }
      }
      
      public static function getNPCDataFromCache(npcID:int) : XMLNpc
      {
         var max:int = int(npcDataCache.length);
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            if(npcDataCache[i].id == npcID)
            {
               return npcDataCache[i];
            }
         }
         return null;
      }
      
      public static function update() : *
      {
         var max:* = undefined;
         var i:* = 0;
         max = enemyList.length;
         for(i = int(max - 1); i >= 0; i--)
         {
            if(enemyList[i] != null)
            {
               enemyList[i].update();
            }
         }
         max = friendList.length;
         for(i = int(max - 1); i >= 0; i--)
         {
            if(friendList[i] != null)
            {
               friendList[i].update();
            }
         }
         max = neutralList.length;
         for(i = int(max - 1); i >= 0; i--)
         {
            if(neutralList[i] != null)
            {
               neutralList[i].update();
            }
         }
      }
      
      public static function updateAnimation() : *
      {
         var max:* = undefined;
         var i:* = 0;
         max = enemyList.length;
         for(i = int(max - 1); i >= 0; i--)
         {
            if(enemyList[i] != null)
            {
               enemyList[i].updateAnimation();
            }
         }
         max = friendList.length;
         for(i = int(max - 1); i >= 0; i--)
         {
            if(friendList[i] != null)
            {
               friendList[i].updateAnimation();
            }
         }
         max = neutralList.length;
         for(i = int(max - 1); i >= 0; i--)
         {
            if(neutralList[i] != null)
            {
               neutralList[i].updateAnimation();
            }
         }
      }
      
      public static function checkNextWave() : *
      {
         if(GameEngine.isPvPRoomMode())
         {
            return;
         }
         var callNextWave:Boolean = true;
         var max:int = int(enemyList.length);
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            if(!enemyList[i].dead)
            {
               callNextWave = false;
            }
         }
         if(callNextWave)
         {
            cleanUp();
            nextWave();
         }
      }
      
      public static function checkNextFriendWave() : *
      {
         if(GameEngine.isPvPRoomMode())
         {
            return;
         }
         var callNextWave:Boolean = true;
         var max:int = int(friendList.length);
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            if(!friendList[i].dead)
            {
               callNextWave = false;
            }
         }
         if(callNextWave)
         {
            cleanUp();
            nextFriendWave();
         }
      }
      
      public static function gotoWave(num:int) : *
      {
         currentWave = num;
         if(currentWave >= waveCount)
         {
            currentWave = waveCount - 1;
         }
         --currentWave;
      }
      
      public static function nextFriendWave() : *
      {
         var i:int = 0;
         var max:int = 0;
         var posX:int = 0;
         var posY:int = 0;
         var npcHolder:NPCHolder = null;
         ++currentFriendWave;
         if(currentFriendWave < friendWaveCount)
         {
            posY = StageManager.getGroundY();
            max = int(friendWave[currentFriendWave].length);
            for(i = 0; i < max; i++)
            {
               npcHolder = friendWave[currentFriendWave][i];
               createFriend(npcHolder.getNPCID(),npcHolder.getXPos(),posY,npcHolder.getFatal(),npcHolder.getLvl());
            }
         }
      }
      
      public static function nextWave() : *
      {
         var i:int = 0;
         var max:int = 0;
         var posX:int = 0;
         var posY:int = 0;
         var npcHolder:NPCHolder = null;
         ++currentWave;
         if(currentWave >= waveCount)
         {
            if(endless && !StageManager.isSurviveCleanUp())
            {
               currentWave -= 2;
               nextWave();
            }
         }
         else
         {
            objectiveList.fixed = false;
            if(currentWave == 0)
            {
               posY = StageManager.getGroundY();
            }
            else
            {
               posY = 0;
            }
            max = int(enemyWave[currentWave].length);
            for(i = 0; i < max; i++)
            {
               npcHolder = enemyWave[currentWave][i];
               if(currentWave == 0)
               {
                  createEnemy(npcHolder.getNPCID(),npcHolder.getXPos(),posY,npcHolder.getFatal(),npcHolder.getLvl());
               }
               else
               {
                  createEnemy(npcHolder.getNPCID(),npcHolder.getXPos(),posY - Math.random() * 200,npcHolder.getFatal(),npcHolder.getLvl());
               }
            }
            max = int(neutralWave[currentWave].length);
            for(i = 0; i < max; i++)
            {
               npcHolder = neutralWave[currentWave][i];
               if(currentWave == 0)
               {
                  createNeutral(npcHolder.getNPCID(),npcHolder.getXPos(),posY,npcHolder.getFatal(),npcHolder.getLvl());
               }
               else
               {
                  createNeutral(npcHolder.getNPCID(),npcHolder.getXPos(),posY - Math.random() * 200,npcHolder.getFatal(),npcHolder.getLvl());
               }
            }
            max = int(objectiveWave[currentWave].length);
            for(i = 0; i < max; i++)
            {
               npcHolder = objectiveWave[currentWave][i];
               if(currentWave == 0)
               {
                  createObjective(npcHolder.getNPCID(),npcHolder.getXPos(),posY,npcHolder.getFatal(),npcHolder.getLvl());
               }
               else
               {
                  createObjective(npcHolder.getNPCID(),npcHolder.getXPos(),posY - Math.random() * 200,npcHolder.getFatal(),npcHolder.getLvl());
               }
            }
            objectiveList.fixed = true;
         }
      }
      
      public static function createClone(owner:MCSPlayer) : *
      {
         if(StageManager.isRedFreeze())
         {
            return;
         }
         var npc:EnemyClone = new EnemyClone(MCSPool.getMCS());
         npc.addToCanvas(canvas);
         npc.setPosition(owner.getMapPosition(),owner.getMCS().y);
         npc.cloneMCSPlayer(owner,false);
         ProjectileManager.createSmoke3(npc.getMapPosition(),npc.getMCS().y);
         npc.startAnim(MCSActor.FOCUS_START);
         npc.actionState = MCSActor.DOSKILL_STATE;
         if(npc.isPlayerAI())
         {
            friendList.push(npc);
         }
         else
         {
            enemyList.push(npc);
         }
         networkPlayerList.fixed = false;
         networkPlayerList.push(npc);
         networkPlayerList.fixed = true;
      }
      
      public static function createMassClone(owner:MCSPlayer) : *
      {
         var npc:EnemyClone = null;
         if(StageManager.isRedFreeze())
         {
            return;
         }
         for(var i:int = 0; i < 5; i++)
         {
            npc = new EnemyClone(MCSPool.getMCS());
            npc.addToCanvas(canvas);
            npc.setPosition(owner.getMapPosition() - 100 + i * 50,owner.getMCS().y);
            npc.cloneMCSPlayer(owner,true);
            ProjectileManager.createSmoke3(npc.getMapPosition(),npc.getMCS().y);
            npc.startAnim(MCSActor.FOCUS_START);
            npc.actionState = MCSActor.DOSKILL_STATE;
            if(npc.isPlayerAI())
            {
               friendList.push(npc);
            }
            else
            {
               enemyList.push(npc);
            }
            networkPlayerList.fixed = false;
            networkPlayerList.push(npc);
            networkPlayerList.fixed = true;
         }
      }
      
      internal static function createNPC(npcID:int, x:int, y:int, fatal:Boolean) : NPC
      {
         var actor:NPC = null;
         var xml:XMLNpc = getNPCDataFromCache(npcID);
         if(xml == null)
         {
            trace("getNPCDataFromCache(" + npcID + ") returns null");
            xml = QuestEngine.getNPCData(npcID);
            if(xml == null)
            {
               trace("createNPC error: npcID does not exist");
               checkNextWave();
               return null;
            }
            cacheNPCData(npcID);
         }
         switch(xml.ai)
         {
            case 0:
               actor = new EnemyPlayer(MCSPool.getMCS(),true,false);
               break;
            case 1:
               actor = new EnemyKnife(MCSPool.getMCS());
               break;
            case 2:
               actor = new EnemyArcher(MCSPool.getMCS());
               break;
            case 3:
               actor = new EnemyKatana(MCSPool.getMCS());
               break;
            case 4:
               actor = new EnemySpear(MCSPool.getMCS());
               break;
            case 5:
               actor = new EnemyShield(MCSPool.getMCS());
               break;
            case 6:
               actor = new EnemyNinja(MCSPool.getMCS());
               break;
            case 7:
               actor = new EnemyCivilian(MCSPool.getMCS());
               break;
            case 8:
               actor = new EnemyWolf();
               break;
            case 9:
               actor = new EnemyPlayer(MCSPool.getMCS(),false,false);
               break;
            case 10:
               actor = new EnemyWolf2();
               break;
            case 11:
               actor = new EnemyWolfAlpha();
               break;
            case 12:
               actor = new EnemyHorse();
               break;
            case 13:
               actor = new EnemyTrainingDummy();
               break;
            case 14:
               actor = new EnemyPlayer(MCSPool.getMCS(),false,true);
               break;
            case 15:
               actor = new EnemyPlayerGiant(MCSPool.getMCS(),false);
               break;
            case 16:
               actor = new EnemyNianMonster();
               break;
            case 17:
               actor = new EnemyBear();
               break;
            case 18:
               actor = new EnemyBoar();
               break;
            case 19:
               actor = new EnemyDeer();
               break;
            case 20:
               actor = new EnemyVegePatch(MCSPool.getMCS());
               break;
            case 21:
               actor = new EnemyStag();
               break;
            case 22:
               actor = new EnemyGoblin(MCSPool.getMCS());
               break;
            case 23:
               actor = new EnemyOgre(MCSPool.getMCS());
               break;
            case 24:
               actor = new EnemyFox();
               break;
            case 25:
               actor = new EnemyGoblinThrower(MCSPool.getMCS());
               break;
            case 26:
               actor = new EnemyZombie(MCSPool.getMCS());
               break;
            case 27:
               actor = new EnemyJiangSi(MCSPool.getMCS());
               break;
            case 28:
               actor = new EnemySpearElite(MCSPool.getMCS(),false);
               break;
            case 29:
               actor = new EnemyElite(MCSPool.getMCS());
               break;
            case 30:
               actor = new FriendlyElite(MCSPool.getMCS());
               break;
            case 31:
               actor = new FriendlySpearElite(MCSPool.getMCS());
               break;
            case 32:
               actor = new EnemyCivilianOld(MCSPool.getMCS());
               break;
            case 33:
               actor = new EnemyCivilianFemale(MCSPool.getMCS());
               break;
            case 34:
               actor = new FriendlyArcher(MCSPool.getMCS());
               break;
            case 35:
               actor = new EnemySorcererBoss(MCSPool.getMCS());
               break;
            case 36:
               actor = new EnemyKanjiGuardian(MCSPool.getMCS());
               break;
            case 37:
               actor = new EnemySpearElite(MCSPool.getMCS(),true);
               break;
            default:
               trace("createNPC error: " + xml.ai);
         }
         actor.addToCanvas(canvas);
         actor.setPosition(x,y);
         actor.init(xml);
         if(xml.scaleX != 1 || xml.scaleY != 1)
         {
            actor.getMCS().changeScale(xml.scaleX,xml.scaleY);
         }
         actor.setFatal(fatal);
         if(GameEngine.isDuelMode() && xml.ai == 0)
         {
            if(xml.rightPos)
            {
               actor.setPosition(650,y);
               actor.mcs.faceLeft();
            }
            else
            {
               actor.setPosition(150,y);
               actor.mcs.faceRight();
            }
            actor.startAnim(MCSActor.BOW2);
            networkPlayerList.fixed = false;
            networkPlayerList.push(actor);
            networkPlayerList.fixed = true;
         }
         else if(StatsManager.getPlayer().mcs.x < actor.getMCS().x)
         {
            actor.getMCS().faceLeft();
         }
         else
         {
            actor.mcs.faceRight();
         }
         return actor;
      }
      
      public static function createRoomNPC(npcID:int, x:int, y:int, doChase:Boolean = false) : NPC
      {
         var actor:NPC = null;
         if(canvas == null)
         {
            canvas = StageManager.getGameStageCanvas();
         }
         var xml:XMLNpc = QuestEngine.getNPCData(npcID);
         if(xml == null)
         {
            trace("NPCManager.createNPC error: xml returns null: " + npcID);
            return null;
         }
         if(xml.ai == 8)
         {
            actor = new EnemyWolf();
         }
         else if(xml.ai == 11 || xml.ai == 16)
         {
            actor = new EnemyWolfAlpha();
         }
         else if(xml.ai == 12)
         {
            actor = new EnemyHorse(null,doChase);
         }
         else if(xml.ai == 17)
         {
            actor = new EnemyBear(null,doChase);
         }
         else if(xml.ai == 18)
         {
            actor = new EnemyBoar(null,doChase);
         }
         else if(xml.ai == 19)
         {
            actor = new EnemyDeer();
         }
         else if(xml.ai == 22)
         {
            actor = new RoomGoblin(null,doChase);
         }
         else if(xml.ai == 23)
         {
            actor = new RoomOgre(null,doChase);
         }
         else if(xml.ai == 24)
         {
            actor = new EnemyFox();
         }
         else if(xml.ai == 26)
         {
            actor = new RoomZombie(null,doChase);
         }
         else if(xml.ai == 32)
         {
            actor = new EnemyCivilianOld(MCSPool.getMCS());
         }
         else if(xml.ai == 33)
         {
            actor = new EnemyCivilianFemale(MCSPool.getMCS(),doChase);
         }
         else
         {
            actor = new EnemyCivilian(MCSPool.getMCS(),doChase);
         }
         canvas.addChild(actor.mcs);
         actor.setPosition(x,y);
         actor.init(xml);
         if(xml.scaleX != 1 || xml.scaleY != 1)
         {
            actor.getMCS().changeScale(xml.scaleX,xml.scaleY);
         }
         neutralList.fixed = false;
         neutralList.push(actor);
         neutralList.fixed = true;
         return actor;
      }
      
      public static function createRoomNPCProcGen(xml:XMLNpc, x:int, y:int, doChase:Boolean = false) : NPC
      {
         var actor:NPC = null;
         if(canvas == null)
         {
            canvas = StageManager.getGameStageCanvas();
         }
         if(xml.ai == 32)
         {
            actor = new EnemyCivilianOld(MCSPool.getMCS());
         }
         else if(xml.ai == 33)
         {
            actor = new EnemyCivilianFemale(MCSPool.getMCS(),doChase);
         }
         else
         {
            actor = new EnemyCivilian(MCSPool.getMCS(),doChase);
         }
         canvas.addChild(actor.mcs);
         actor.setPosition(x,y);
         actor.init(xml);
         if(xml.scaleX != 1 || xml.scaleY != 1)
         {
            actor.getMCS().changeScale(xml.scaleX,xml.scaleY);
         }
         neutralList.fixed = false;
         neutralList.push(actor);
         neutralList.fixed = true;
         return actor;
      }
      
      public static function getChatBot() : NPC
      {
         var actor:NPC = null;
         var civilian:EnemyCivilian = null;
         var max:int = int(neutralList.length);
         var playerMapPos:int = StatsManager.getPlayer().getMapPosition();
         for(var i:int = 0; i < max; i++)
         {
            actor = neutralList[i];
            if(actor is EnemyCivilian)
            {
               civilian = EnemyCivilian(actor);
               if(!civilian.doChase && !civilian.onAlert && !civilian.dead)
               {
                  if(Math.abs(civilian.getMapPosition() - playerMapPos) < 500)
                  {
                     actor.startAction(MCSActor.IDLE_STATE);
                     return actor;
                  }
                  return null;
               }
            }
         }
         return null;
      }
      
      public static function hasChatBot() : Boolean
      {
         return getChatBot() != null;
      }
      
      public static function createCutsceneActor(npcID:int, x:int, y:int) : CutsceneActor
      {
         var actor:CutsceneActor = null;
         if(canvas == null)
         {
            canvas = StageManager.getGameStageCanvas();
         }
         var xml:XMLNpc = QuestEngine.getNPCData(npcID);
         if(xml == null)
         {
            trace("NPCManager.createNPC error: xml returns null: " + npcID);
            return null;
         }
         actor = new CutsceneActor(MCSPool.getMCS());
         canvas.addChild(actor.mcs);
         actor.setPosition(x,y);
         actor.init(xml);
         if(xml.scaleX != 1 || xml.scaleY != 1)
         {
            actor.getMCS().changeScale(xml.scaleX,xml.scaleY);
         }
         neutralList.fixed = false;
         neutralList.push(actor);
         neutralList.fixed = true;
         return actor;
      }
      
      public static function removeRoomNPC(npc:NPC) : *
      {
         npc.removeFromCanvas(StageManager.getGameStageCanvas());
         npc.disposeMCS();
         var max:int = int(neutralList.length);
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            if(npc == neutralList[i])
            {
               neutralList.fixed = false;
               neutralList.splice(i,1);
               neutralList.fixed = true;
            }
         }
      }
      
      public static function getEnemyCount() : int
      {
         var max:int = int(enemyList.length);
         var output:int = 0;
         for(var i:int = 0; i < max; i++)
         {
            if(!enemyList[i].dead)
            {
               output++;
            }
         }
         return output;
      }
      
      public static function createEnemy(npcID:int, x:int, y:int, fatal:Boolean, lvl:int = 0) : NPC
      {
         var actor:NPC = createNPC(npcID,x,y,fatal);
         if(actor == null)
         {
            return null;
         }
         enemyList.push(actor);
         if(lvl != 0)
         {
            actor.setLevel(lvl);
         }
         return actor;
      }
      
      public static function createFriend(npcID:int, x:int, y:int, fatal:Boolean, lvl:int = 0) : NPC
      {
         var actor:NPC = createNPC(npcID,x,y,fatal);
         if(actor == null)
         {
            return null;
         }
         friendList.push(actor);
         actor.setIsFriendly();
         if(lvl != 0)
         {
            actor.setLevel(lvl);
         }
         return actor;
      }
      
      public static function createNeutral(npcID:int, x:int, y:int, fatal:Boolean, lvl:int = 0) : NPC
      {
         var actor:NPC = createNPC(npcID,x,y,fatal);
         if(actor == null)
         {
            return null;
         }
         neutralList.push(actor);
         if(lvl != 0)
         {
            actor.setLevel(lvl);
         }
         return actor;
      }
      
      public static function createObjective(npcID:int, x:int, y:int, fatal:Boolean, lvl:int = 0) : NPC
      {
         var actor:NPC = createNPC(npcID,x,y,fatal);
         if(actor == null)
         {
            return null;
         }
         objectiveList.push(actor);
         if(StageManager.getAction() == GameEngine.ACTION_FIGHT || StageManager.getAction() == GameEngine.ACTION_ASSASSINATE)
         {
            enemyList.push(actor);
         }
         else if(StageManager.getAction() == GameEngine.ACTION_ESCORT)
         {
            friendList.push(actor);
         }
         actor.setPosition(x - StageManager.getStagePosition(),y);
         if(lvl != 0)
         {
            actor.setLevel(lvl);
         }
         return actor;
      }
      
      public static function createNetworkPlayer(id:String, charname:String, charlvl:int, equip:String, nid:String, xpos:int, side:int, facingRight:Boolean, pose:String, stats:String, skills:String, taunt:String, justEntered:Boolean) : *
      {
         var roomWidth:int = 0;
         if(getNetworkPlayer(nid) != null)
         {
            return;
         }
         var existingNetworkPlayer:EnemyPlayer = getNetworkPlayerByName(charname);
         if(existingNetworkPlayer != null && existingNetworkPlayer.nid != nid)
         {
            existingNetworkPlayer.nid = nid;
            return;
         }
         if(networkPlayerCount > 20)
         {
            return;
         }
         if(charname == StatsManager.charname)
         {
            if(nid != NetworkManager.instance.getNid() && !StatsManager.canMultiClient)
            {
               NetworkManager.instance.pingMultiClient(nid);
               return;
            }
            return;
         }
         ++networkPlayerCount;
         if(canvas == null)
         {
            canvas = StageManager.getGameStageCanvas();
         }
         var actor:EnemyPlayer = new EnemyPlayer(MCSPool.getMCS(),true,false);
         canvas.addChild(actor.mcs);
         actor.setPosition(xpos,StageManager.getGroundY());
         if(StageManager.getRoomPrivate() != XMLRoomData.ROOMTYPE_PVPCLAN)
         {
            side = 0;
         }
         actor.initNetworkPlayer(id,nid,charname,charlvl,equip,stats,skills,taunt,side);
         networkPlayerList.fixed = false;
         networkPlayerList.push(actor);
         networkPlayerList.fixed = true;
         if(GameEngine.isPvPRoomMode())
         {
            if(StageManager.getRoomPrivate() == XMLRoomData.ROOMTYPE_PVPCLAN)
            {
               if(side == StatsManager.getSide())
               {
                  friendList.push(actor);
               }
               else
               {
                  enemyList.push(actor);
               }
            }
            else if(isAlly(charname))
            {
               addAlly(charname);
               friendList.push(actor);
            }
            else
            {
               enemyList.push(actor);
            }
         }
         else
         {
            neutralList.push(actor);
         }
         if(facingRight)
         {
            actor.getMCS().faceRight();
         }
         else
         {
            actor.getMCS().faceLeft();
         }
         if(pose != "")
         {
            actor.startAnim(pose);
         }
         if(justEntered)
         {
            roomWidth = StageManager.getGameStageWidth();
            if(xpos < 150)
            {
               actor.walkTo(150);
            }
            else if(xpos > roomWidth - 150)
            {
               actor.walkTo(roomWidth - 150);
            }
         }
      }
      
      public static function networkPlayerChat(nid:String, str:String) : *
      {
         var actor:EnemyPlayer = getNetworkEnemyPlayer(nid);
         if(actor != null)
         {
            actor.say(str);
         }
      }
      
      public static function networkPlayerUpdateEq(nid:String, equip:String) : *
      {
         var actor:EnemyPlayer = getNetworkEnemyPlayer(nid);
         if(actor != null)
         {
            actor.getMCS().initMCSFromEqString(equip);
            actor.equipmentStr = equip;
         }
      }
      
      public static function networkPlayerUpdateLvl(nid:String, charlvl:int) : *
      {
         var actor:EnemyPlayer = getNetworkEnemyPlayer(nid);
         if(actor != null)
         {
            actor.level = charlvl;
         }
      }
      
      public static function networkPlayerUpdateBusy(nid:String, busy:Boolean) : *
      {
         var actor:EnemyPlayer = getNetworkEnemyPlayer(nid);
         if(actor != null)
         {
            actor.updateBusy(busy);
         }
      }
      
      public static function networkPlayerEmote(nid:String, animName:String) : *
      {
         var actor:EnemyPlayer = getNetworkEnemyPlayer(nid);
         if(actor != null)
         {
            actor.startAnim(animName);
         }
      }
      
      public static function removeNetworkPlayer(nid:String) : *
      {
         var max:int = 0;
         var npc:NPC = null;
         var i:* = 0;
         var actor:NPC = getNetworkPlayer(nid);
         if(actor != null)
         {
            actor.removeFromCanvas(StageManager.getGameStageCanvas());
            actor.disposeMCS();
            cleanUp();
            max = int(networkPlayerList.length);
            for(i = int(max - 1); i >= 0; i--)
            {
               npc = networkPlayerList[i];
               if(npc == actor)
               {
                  networkPlayerList.fixed = false;
                  networkPlayerList.splice(i,1);
                  networkPlayerList.fixed = true;
               }
            }
            --networkPlayerCount;
         }
      }
      
      public static function getNetworkPlayer(nid:String) : NPC
      {
         var npc:EnemyPlayer = null;
         var max:int = int(networkPlayerList.length);
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            npc = networkPlayerList[i] as EnemyPlayer;
            if(nid == npc.getNetworkPlayer())
            {
               return npc;
            }
         }
         return null;
      }
      
      public static function getNetworkEnemyPlayer(nid:String) : EnemyPlayer
      {
         var npc:EnemyPlayer = null;
         var max:int = int(networkPlayerList.length);
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            npc = networkPlayerList[i] as EnemyPlayer;
            if(nid == npc.getNetworkPlayer())
            {
               return npc;
            }
         }
         return null;
      }
      
      public static function getNetworkPlayerByName(charname:String) : EnemyPlayer
      {
         var npc:EnemyPlayer = null;
         var max:int = int(networkPlayerList.length);
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            npc = networkPlayerList[i] as EnemyPlayer;
            if(charname == npc.charname)
            {
               return npc;
            }
         }
         return null;
      }
      
      public static function getNetworkPlayerList() : Vector.<NPC>
      {
         return networkPlayerList;
      }
      
      public static function checkMouseOverNetworkPlayer(xmouse:int, ymouse:int) : EnemyPlayer
      {
         var npc:NPC = null;
         var max:int = int(networkPlayerList.length);
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            npc = networkPlayerList[i];
            if(npc.getMCS().hitTestPoint(xmouse,ymouse))
            {
               return npc as EnemyPlayer;
            }
         }
         return null;
      }
      
      public static function doScroll(dist:int) : *
      {
         var i:* = 0;
         var mcs:MCSCharacter = null;
         var max:* = enemyList.length;
         for(i = int(max - 1); i >= 0; i--)
         {
            mcs = enemyList[i].mcs;
            if(mcs != null)
            {
               mcs.x -= dist;
            }
         }
         max = friendList.length;
         for(i = int(max - 1); i >= 0; i--)
         {
            mcs = friendList[i].mcs;
            if(mcs != null)
            {
               mcs.x -= dist;
            }
         }
         max = neutralList.length;
         for(i = int(max - 1); i >= 0; i--)
         {
            mcs = neutralList[i].mcs;
            if(mcs != null)
            {
               mcs.x -= dist;
            }
         }
      }
      
      public static function checkHit(slashArray:Vector.<Point>, offset:int, damage:Damage, checkDeath:Boolean = true) : *
      {
         var max:* = undefined;
         var i:* = undefined;
         var j:int = 0;
         var enemy:NPC = null;
         var bladeslash:bladeslashfx = null;
         var dist:int = 0;
         var scaledX:int = 0;
         var scaledY:int = 0;
         var ptA:int = 0;
         var ptB:int = 0;
         var slashMax:int = int(slashArray.length);
         var comboCount:int = 0;
         max = enemyList.length;
         for(i = max - 1; i >= 0; i--)
         {
            enemy = enemyList[i];
            if(!enemy.isDead() && enemy.canHit())
            {
               j = 0;
               while(j < slashMax && !enemy.gotHitFlag)
               {
                  dist = enemy.mcs.x - slashArray[j].x + offset;
                  scaledX = (slashArray[j].x - offset) * StatsManager.stageScale + StatsManager.stageOffsetX;
                  scaledY = slashArray[j].y * StatsManager.stageScale + StatsManager.stageOffsetY;
                  if(dist * dist < 40000 && enemy.mcs.hitTestPoint(scaledX,scaledY,false))
                  {
                     if(enemy.checkHit(scaledX,scaledY,damage))
                     {
                        if(!StageManager.isRedFreeze())
                        {
                           bladeslash = new bladeslashfx();
                           canvas.addChild(bladeslash);
                           bladeslash.x = slashArray[j].x - offset;
                           bladeslash.y = slashArray[j].y;
                           ptA = j;
                           ptB = j - 1;
                           if(ptB < 0)
                           {
                              ptB = j + 1;
                           }
                           bladeslash.rotation = Math.atan2(slashArray[ptB].y - slashArray[ptA].y,slashArray[ptB].x - slashArray[ptA].x) * 57.2727;
                        }
                     }
                  }
                  j++;
               }
               if(enemy.gotHitFlag)
               {
                  comboCount++;
               }
               enemy.gotHitFlag = false;
            }
         }
         max = neutralList.length;
         for(i = max - 1; i >= 0; i--)
         {
            enemy = neutralList[i];
            if(!enemy.isDead() && enemy.canHit())
            {
               j = 0;
               while(j < slashMax && !enemy.gotHitFlag)
               {
                  dist = enemy.mcs.x - slashArray[j].x + offset;
                  scaledX = (slashArray[j].x - offset) * StatsManager.stageScale + StatsManager.stageOffsetX;
                  scaledY = slashArray[j].y * StatsManager.stageScale + StatsManager.stageOffsetY;
                  if(dist * dist < 40000 && enemy.mcs.hitTestPoint(scaledX,scaledY,false))
                  {
                     enemy.checkHit(scaledX,scaledY,damage);
                  }
                  j++;
               }
               if(enemy.gotHitFlag)
               {
                  comboCount++;
               }
               enemy.gotHitFlag = false;
            }
         }
         if(comboCount > 0)
         {
            StatsManager.addCombo(comboCount);
         }
         if(checkDeath)
         {
            if(checkRedFreeze())
            {
               StageManager.redFreeze();
            }
            else
            {
               checkDie();
            }
         }
      }
      
      public static function checkPlayerHit(slashArray:Vector.<Point>, offset:int, damage:Damage, checkDeath:Boolean = true) : *
      {
         var max:* = undefined;
         var i:* = undefined;
         var j:int = 0;
         var enemy:NPC = null;
         var bladeslash:bladeslashfx = null;
         var dist:int = 0;
         var scaledX:int = 0;
         var scaledY:int = 0;
         var ptA:int = 0;
         var ptB:int = 0;
         var slashMax:int = int(slashArray.length);
         max = friendList.length;
         for(i = max; i >= 0; i--)
         {
            if(i != max)
            {
               enemy = friendList[i];
            }
            else
            {
               enemy = StatsManager.getPlayer();
            }
            if(enemy != null && !enemy.isDead() && enemy.canHit())
            {
               j = 0;
               while(j < slashMax && !enemy.gotHitFlag)
               {
                  dist = enemy.mcs.x - slashArray[j].x + offset;
                  scaledX = (slashArray[j].x - offset) * StatsManager.stageScale + StatsManager.stageOffsetX;
                  scaledY = slashArray[j].y * StatsManager.stageScale + StatsManager.stageOffsetY;
                  if(dist * dist < 40000 && enemy.mcs.hitTestPoint(scaledX,scaledY,false))
                  {
                     if(enemy.checkHit(scaledX,scaledY,damage))
                     {
                        if(!StageManager.isRedFreeze())
                        {
                           bladeslash = new bladeslashfx();
                           canvas.addChild(bladeslash);
                           bladeslash.x = slashArray[j].x - offset;
                           bladeslash.y = slashArray[j].y;
                           ptA = j;
                           ptB = j - 1;
                           if(ptB < 0)
                           {
                              ptB = j + 1;
                           }
                           bladeslash.rotation = Math.atan2(slashArray[ptB].y - slashArray[ptA].y,slashArray[ptB].x - slashArray[ptA].x) * 57.2727;
                        }
                     }
                  }
                  j++;
               }
               enemy.gotHitFlag = false;
            }
         }
      }
      
      public static function getNearestEnemy(xpos:int, isEnemy:Boolean = false) : NPC
      {
         var enemy:NPC = null;
         var targetList:Array = null;
         var pos:int = 0;
         var maxdist:int = 99999;
         var dist:int = 0;
         var selectedEnemy:NPC = null;
         if(!isEnemy)
         {
            targetList = enemyList;
         }
         else
         {
            targetList = friendList;
         }
         var max:int = int(targetList.length);
         var stageWidth:int = StageManager.getGameStageWidth();
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            enemy = targetList[i] as NPC;
            pos = enemy.getMapPosition();
            if(pos > -10 && pos < stageWidth + 10)
            {
               dist = Math.abs(xpos - pos);
               if(!enemy.isDead() && dist < maxdist && enemy.actionState != MCSActor.SKILL_UNDYING_STATE)
               {
                  selectedEnemy = enemy;
                  maxdist = dist;
               }
            }
         }
         if(isEnemy)
         {
            enemy = StatsManager.getPlayer() as NPC;
            dist = Math.abs(xpos - enemy.getMapPosition());
            if(!enemy.isDead() && dist < maxdist)
            {
               selectedEnemy = enemy;
               maxdist = dist;
            }
         }
         return selectedEnemy;
      }
      
      public static function checkHitTrap(thing:MovieClip, damage:Damage) : Boolean
      {
         var max:int = 0;
         var i:* = 0;
         var enemy:NPC = null;
         max = int(enemyList.length);
         for(i = int(max - 1); i >= 0; i--)
         {
            enemy = enemyList[i];
            if(!enemy.isDead() && enemy.canHit() && enemy.checkHitTrap(thing,damage))
            {
               return true;
            }
         }
         return false;
      }
      
      public static function checkHitObject(thing:MovieClip, damage:Damage, dist:int = 100, checkByAttacker:Boolean = false, objectToCheckDist:MovieClip = null) : Boolean
      {
         var max:int = 0;
         var i:* = 0;
         var enemy:NPC = null;
         var enemydist:int = 0;
         var comboCount:int = 0;
         var distsq:int = dist * dist;
         max = int(enemyList.length);
         for(i = int(max - 1); i >= 0; i--)
         {
            enemy = enemyList[i];
            if(enemy != null && !enemy.isDead() && enemy.canHit())
            {
               if(objectToCheckDist != null)
               {
                  enemydist = enemy.getMCS().x - objectToCheckDist.x;
               }
               else
               {
                  enemydist = enemy.getMCS().x - thing.x;
               }
               if(enemydist * enemydist < distsq && enemy.checkHitObject(thing,damage,checkByAttacker))
               {
                  comboCount++;
               }
            }
         }
         max = int(neutralList.length);
         for(i = int(max - 1); i >= 0; i--)
         {
            enemy = neutralList[i];
            if(enemy != null && !enemy.isDead() && enemy.canHit())
            {
               if(objectToCheckDist != null)
               {
                  enemydist = enemy.getMCS().x - objectToCheckDist.x;
               }
               else
               {
                  enemydist = enemy.getMCS().x - thing.x;
               }
               if(enemydist * enemydist < distsq && enemy.checkHitObject(thing,damage,checkByAttacker))
               {
                  comboCount++;
               }
            }
         }
         if(comboCount > 0)
         {
            StatsManager.addCombo(comboCount);
         }
         if(checkRedFreeze())
         {
            StageManager.redFreeze();
         }
         else
         {
            checkDie();
         }
         return comboCount > 0;
      }
      
      public static function checkPlayerHitObject(thing:MovieClip, damage:Damage, dist:int = 100, checkByAttacker:Boolean = false, objectToCheckDist:MovieClip = null, attacker:NPC = null) : Boolean
      {
         var max:int = 0;
         var i:* = 0;
         var enemy:NPC = null;
         var enemydist:int = 0;
         var flag:Boolean = false;
         var distsq:int = dist * dist;
         enemy = StatsManager.getPlayer();
         if(!enemy.isDead() && enemy.canHit())
         {
            if(objectToCheckDist != null)
            {
               enemydist = enemy.getMCS().x - objectToCheckDist.x;
            }
            else
            {
               enemydist = enemy.getMCS().x - thing.x;
            }
            if(enemydist * enemydist < distsq && enemy.checkHitObject(thing,damage,checkByAttacker))
            {
               flag = true;
            }
         }
         max = int(friendList.length);
         for(i = int(max - 1); i >= 0; i--)
         {
            enemy = friendList[i];
            if(enemy != null && enemy != attacker && !enemy.isDead() && enemy.canHit())
            {
               if(objectToCheckDist != null)
               {
                  enemydist = enemy.getMCS().x - objectToCheckDist.x;
               }
               else
               {
                  enemydist = enemy.getMCS().x - thing.x;
               }
               if(enemydist * enemydist < distsq && enemy.checkHitObject(thing,damage,checkByAttacker))
               {
                  enemy.checkDie();
                  flag = true;
               }
            }
         }
         max = int(neutralList.length);
         for(i = int(max - 1); i >= 0; i--)
         {
            enemy = neutralList[i];
            if(enemy != null && enemy != attacker && !enemy.isDead() && enemy.canHit())
            {
               if(objectToCheckDist != null)
               {
                  enemydist = enemy.getMCS().x - objectToCheckDist.x;
               }
               else
               {
                  enemydist = enemy.getMCS().x - thing.x;
               }
               if(enemydist * enemydist < distsq && enemy.checkHitObject(thing,damage,checkByAttacker))
               {
                  enemy.checkDie();
                  flag = true;
               }
            }
         }
         return flag;
      }
      
      public static function getHitArray(thing:MovieClip, singleHitOnly:Boolean = false) : Array
      {
         var max:int = 0;
         var i:* = 0;
         var enemy:NPC = null;
         var hitArray:Array = new Array();
         max = int(enemyList.length);
         for(i = int(max - 1); i >= 0; i--)
         {
            enemy = enemyList[i];
            if(!enemy.isDead() && enemy.canHit() && enemy.testHit(thing))
            {
               hitArray.push(enemy);
               if(singleHitOnly)
               {
                  break;
               }
            }
         }
         if(!(singleHitOnly && hitArray.length > 0))
         {
            max = int(neutralList.length);
            for(i = int(max - 1); i >= 0; i--)
            {
               enemy = neutralList[i];
               if(!enemy.isDead() && enemy.canHit() && enemy.testHit(thing))
               {
                  hitArray.push(enemy);
                  if(singleHitOnly)
                  {
                     break;
                  }
               }
            }
         }
         return hitArray;
      }
      
      public static function checkDownStab(thing:MovieClip, damage:Damage) : Boolean
      {
         var max:int = 0;
         var i:* = 0;
         var enemy:NPC = null;
         var comboCount:int = 0;
         max = int(enemyList.length);
         for(i = int(max - 1); i >= 0; i--)
         {
            enemy = enemyList[i];
            if(!enemy.isDead() && enemy.isDowned() && enemy.checkHitObject(thing,damage,true))
            {
               comboCount++;
            }
         }
         max = int(neutralList.length);
         for(i = int(max - 1); i >= 0; i--)
         {
            enemy = neutralList[i];
            if(!enemy.isDead() && enemy.isDowned() && enemy.checkHitObject(thing,damage,true))
            {
               comboCount++;
            }
         }
         if(comboCount > 0)
         {
            StatsManager.addCombo(comboCount);
         }
         checkDie();
         --currentWave;
         if(checkRedFreeze())
         {
            StageManager.redFreeze();
         }
         ++currentWave;
         return comboCount > 0;
      }
      
      public static function checkRedFreeze() : *
      {
         var max:int = 0;
         var enemy:NPC = null;
         var i:* = 0;
         if(currentWave == enemyWave.length - 1 && (!endless || StageManager.isSurviveCleanUp()) && !GameEngine.isPvPRoomMode())
         {
            max = int(enemyList.length);
            for(i = int(max - 1); i >= 0; i--)
            {
               enemy = enemyList[i];
               if(!enemy.isDead() && !enemy.isGoingToDie())
               {
                  return false;
               }
            }
            return true;
         }
         return false;
      }
      
      public static function externalRedFreezeCheck() : *
      {
         if(checkRedFreeze())
         {
            StageManager.redFreeze();
         }
         else
         {
            checkDie();
         }
      }
      
      public static function externalInstantRedFreezeCheck() : *
      {
         checkDie();
         --currentWave;
         if(checkRedFreeze())
         {
            StageManager.redFreeze();
         }
         ++currentWave;
      }
      
      public static function checkDie() : *
      {
         var max:int = 0;
         var i:* = 0;
         var enemy:NPC = null;
         var deathCount:int = 0;
         var beheadingCount:int = 0;
         max = int(enemyList.length);
         for(i = int(max - 1); i >= 0; i--)
         {
            enemy = enemyList[i];
            if(!enemy.isDead() && enemy.checkDie())
            {
               if(enemy.behead)
               {
                  beheadingCount++;
               }
               deathCount++;
            }
         }
         max = int(neutralList.length);
         for(i = int(max - 1); i >= 0; i--)
         {
            enemy = neutralList[i];
            if(!enemy.isDead() && enemy.checkDie())
            {
               if(enemy.behead)
               {
                  beheadingCount++;
               }
               deathCount++;
            }
         }
         checkNextWave();
         checkNextFriendWave();
         if(deathCount > 0)
         {
            StatsManager.getPlayer().bonusReload();
         }
         totalKilled += deathCount;
         totalBeheading += beheadingCount;
      }
      
      public static function redFreeze() : *
      {
         var max:* = undefined;
         var i:* = 0;
         cleanUp();
         max = enemyList.length;
         i = int(max - 1);
         while(i >= 0)
         {
            enemyList[i].redFreeze();
            i--;
         }
         max = friendList.length;
         i = int(max - 1);
         while(i >= 0)
         {
            friendList[i].redFreeze();
            i--;
         }
         max = neutralList.length;
         i = int(max - 1);
         while(i >= 0)
         {
            neutralList[i].redFreeze();
            i--;
         }
      }
      
      public static function unRedFreeze() : *
      {
         var max:* = undefined;
         var i:* = 0;
         max = enemyList.length;
         i = int(max - 1);
         while(i >= 0)
         {
            enemyList[i].unRedFreeze();
            i--;
         }
         max = friendList.length;
         i = int(max - 1);
         while(i >= 0)
         {
            friendList[i].unRedFreeze();
            i--;
         }
         max = neutralList.length;
         i = int(max - 1);
         while(i >= 0)
         {
            neutralList[i].unRedFreeze();
            i--;
         }
         checkDie();
      }
      
      public static function clearFilter() : *
      {
         var max:* = undefined;
         var i:* = 0;
         max = enemyList.length;
         i = int(max - 1);
         while(i >= 0)
         {
            enemyList[i].clearFilter();
            i--;
         }
         max = friendList.length;
         i = int(max - 1);
         while(i >= 0)
         {
            friendList[i].clearFilter();
            i--;
         }
         max = neutralList.length;
         i = int(max - 1);
         while(i >= 0)
         {
            neutralList[i].clearFilter();
            i--;
         }
      }
      
      public static function cleanUp() : *
      {
         var actor:MCSActor = null;
         var i:* = 0;
         var max:* = enemyList.length;
         for(i = int(max - 1); i >= 0; i--)
         {
            actor = enemyList[i];
            if(actor.mcs == null)
            {
               enemyList.splice(i,1);
            }
         }
         max = neutralList.length;
         for(i = int(max - 1); i >= 0; i--)
         {
            actor = neutralList[i];
            if(actor.mcs == null)
            {
               neutralList.splice(i,1);
            }
         }
         max = friendList.length;
         for(i = int(max - 1); i >= 0; i--)
         {
            actor = friendList[i];
            if(actor.mcs == null)
            {
               friendList.splice(i,1);
            }
         }
      }
      
      public static function getTotalKilled() : int
      {
         return totalKilled;
      }
      
      public static function getTotalBeheading() : int
      {
         return totalBeheading;
      }
      
      public static function checkClick(mousex:int, mousey:int) : NPC
      {
         var max:int = 0;
         var i:* = 0;
         var enemy:NPC = null;
         max = int(enemyList.length);
         for(i = int(max - 1); i >= 0; i--)
         {
            enemy = enemyList[i];
            if(!enemy.isDead())
            {
               if(enemy.mcs.hitTestPoint(mousex,mousey))
               {
                  return enemy;
               }
            }
         }
         max = int(neutralList.length);
         for(i = int(max - 1); i >= 0; i--)
         {
            enemy = neutralList[i];
            if(!enemy.isDead())
            {
               if(enemy.mcs.hitTestPoint(mousex,mousey))
               {
                  return enemy;
               }
            }
         }
         max = int(friendList.length);
         for(i = int(max - 1); i >= 0; i--)
         {
            enemy = friendList[i];
            if(!enemy.isDead())
            {
               if(enemy.mcs.hitTestPoint(mousex,mousey))
               {
                  return enemy;
               }
            }
         }
         return null;
      }
      
      public static function refreshRoom(removeNetworkPlayers:Boolean) : *
      {
         var max:int = 0;
         var i:* = 0;
         var npc:NPC = null;
         max = int(enemyList.length);
         for(i = int(max - 1); i >= 0; i--)
         {
            npc = enemyList[i];
            npc.removeFromCanvas(canvas);
            npc.disposeMCS();
         }
         max = int(friendList.length);
         for(i = int(max - 1); i >= 0; i--)
         {
            npc = friendList[i];
            npc.removeFromCanvas(canvas);
            npc.disposeMCS();
         }
         max = int(neutralList.length);
         for(i = int(max - 1); i >= 0; i--)
         {
            npc = neutralList[i];
            if(removeNetworkPlayers || npc.getNetworkPlayer() == "")
            {
               npc.removeFromCanvas(canvas);
               npc.disposeMCS();
            }
         }
         if(removeNetworkPlayers)
         {
            reset();
         }
         else
         {
            objectiveList.fixed = false;
            networkPlayerList.fixed = false;
            npcDataCache.fixed = false;
            enemyList.length = 0;
            friendList.length = 0;
            neutralList.length = 0;
            objectiveList.length = 0;
            npcDataCache.length = 0;
            objectiveWave.fixed = false;
            enemyWave.fixed = false;
            friendWave.fixed = false;
            neutralWave.fixed = false;
            objectiveWave.fixed = false;
            enemyWave.length = 0;
            friendWave.length = 0;
            neutralWave.length = 0;
            objectiveWave.length = 0;
            currentWave = -1;
            currentFriendWave = -1;
            endless = false;
            max = int(networkPlayerList.length);
            for(i = int(max - 1); i >= 0; i--)
            {
               neutralList.push(networkPlayerList[i]);
            }
         }
      }
      
      public static function addAlly(str:String) : *
      {
         var networkPlayer:EnemyPlayer = null;
         var index:int = 0;
         if(StageManager.getRoomPrivate() == XMLRoomData.ROOMTYPE_PVPCLAN)
         {
            return;
         }
         var lowstr:* = str.toLowerCase();
         var firstChar:String = str.substr(0,1);
         var restOfString:String = lowstr.substr(1,str.length);
         str = firstChar.toUpperCase() + restOfString;
         var max:int = int(allyList.length);
         for(var i:int = 0; i < max; i++)
         {
            if(allyList[i] == str)
            {
               return;
            }
         }
         allyList.push(str);
         if(GameEngine.isPvPRoomMode())
         {
            max = int(networkPlayerList.length);
            for(i = 0; i < max; i++)
            {
               networkPlayer = networkPlayerList[i] as EnemyPlayer;
               if(networkPlayer.charname.toLowerCase() == lowstr)
               {
                  index = enemyList.indexOf(networkPlayer);
                  if(index != -1)
                  {
                     enemyList.splice(index,1);
                     friendList.push(networkPlayer);
                  }
                  return;
               }
            }
         }
      }
      
      public static function removeAlly(str:String) : *
      {
         var index:int = 0;
         var max:int = 0;
         var networkPlayer:EnemyPlayer = null;
         var i:int = 0;
         if(StageManager.getRoomPrivate() == XMLRoomData.ROOMTYPE_PVPCLAN)
         {
            return;
         }
         var lowstr:* = str.toLowerCase();
         var firstChar:String = str.substr(0,1);
         var restOfString:String = lowstr.substr(1,str.length);
         str = firstChar.toUpperCase() + restOfString;
         index = allyList.indexOf(str);
         if(index != -1)
         {
            allyList.splice(index,1);
         }
         if(GameEngine.isPvPRoomMode())
         {
            max = int(networkPlayerList.length);
            for(i = 0; i < max; i++)
            {
               networkPlayer = networkPlayerList[i] as EnemyPlayer;
               if(networkPlayer.charname.toLowerCase() == lowstr)
               {
                  index = friendList.indexOf(networkPlayer);
                  if(index != -1)
                  {
                     friendList.splice(index,1);
                     enemyList.push(networkPlayer);
                  }
                  return;
               }
            }
         }
      }
      
      public static function getAllyListString() : String
      {
         var str:String = "Allies: ";
         var max:int = int(allyList.length);
         for(var i:int = 0; i < max; i++)
         {
            str += allyList[i];
            if(i != max - 1)
            {
               str += ", ";
            }
         }
         return str;
      }
      
      public static function isAlly(str:String) : Boolean
      {
         var firstChar:String = str.substr(0,1);
         var restOfString:String = str.substr(1,str.length);
         str = firstChar.toUpperCase() + restOfString.toLowerCase();
         var max:int = int(allyList.length);
         for(var i:int = 0; i < max; i++)
         {
            if(allyList[i] == str)
            {
               return true;
            }
         }
         return false;
      }
   }
}

