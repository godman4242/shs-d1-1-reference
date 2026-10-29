package
{
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class XMLQuestCutscene extends XMLQuestIntro
   {
      
      internal var actionList:XMLList;
      
      internal var timer:Timer;
      
      internal var currentIndex:int;
      
      internal var nextRun:Number;
      
      public function XMLQuestCutscene(xml:XML)
      {
         super();
         type = "cutscene";
         this.actionList = XMLList(xml.data);
      }
      
      public function startCutscene() : *
      {
         this.timer = new Timer(100);
         this.timer.addEventListener(TimerEvent.TIMER,this.runCutscene);
         this.currentIndex = 0;
         this.nextRun = 0;
         this.timer.start();
         this.runCutscene(null);
      }
      
      internal function runCutscene(event:Event) : *
      {
         var actor:Obj_NPCAnimated = null;
         var actionXML:XML = null;
         var ypos:int = 0;
         var strArray:Array = null;
         var skilllvl:int = 0;
         while(this.nextRun <= this.timer.currentCount / 10)
         {
            actionXML = this.actionList[this.currentIndex];
            if(actionXML.action == "create")
            {
               ypos = 400;
               if(actionXML.y.toString() != "")
               {
                  ypos = int(actionXML.y);
               }
               StageManager.getGameStage().createRoomObject(41,actionXML.x,ypos,actionXML.param,actionXML.id,null,false);
            }
            else if(actionXML.action == "createobject")
            {
               ypos = 400;
               if(actionXML.y.toString() != "")
               {
                  ypos = int(actionXML.y);
               }
               strArray = actionXML.param.split("|");
               if(strArray.length == 2)
               {
                  StageManager.getGameStage().createRoomObject(strArray[0],actionXML.x,ypos,strArray[1],actionXML.id,null,false);
               }
            }
            else if(actionXML.action == "createprojectile")
            {
               strArray = actionXML.param.split(",");
               skilllvl = 1;
               if(strArray.length > 5)
               {
                  skilllvl = int(strArray[5]);
               }
               ProjectileManager.createProjectile(strArray[0],strArray[1],strArray[2],strArray[3],strArray[4],0,skilllvl,null);
            }
            else if(actionXML.action == "music")
            {
               StatsManager.setStat(111,int(actionXML.param));
            }
            else if(actionXML.action == "sound")
            {
               StatsManager.setStat(112,int(actionXML.param));
            }
            else
            {
               if(actionXML.action == "end")
               {
                  this.endCutscene();
                  return;
               }
               if(actionXML.id == "player")
               {
                  StatsManager.getPlayer().performCutsceneAction(actionXML.action,actionXML.param);
               }
               else
               {
                  actor = StageManager.getGameStage().getRoomInteractiveObject(actionXML.id) as Obj_NPCAnimated;
                  if(actor != null)
                  {
                     actor.performCutsceneAction(actionXML.action,actionXML.param);
                  }
               }
            }
            ++this.currentIndex;
            if(this.currentIndex >= this.actionList.length())
            {
               this.endCutscene();
               break;
            }
            this.nextRun = Number(this.actionList[this.currentIndex].time);
         }
      }
      
      internal function endCutscene() : *
      {
         this.timer.stop();
         this.timer.removeEventListener(TimerEvent.TIMER,this.runCutscene);
         CutsceneManager.instance.nextStep();
      }
   }
}

