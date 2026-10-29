package
{
   public class XMLQuestStep
   {
      
      public var nodeID:int;
      
      public var teleportNodeID:int;
      
      public var teleportPosX:int;
      
      public var action:int;
      
      public var title:String;
      
      public var stitle:String;
      
      public var condition:XMLList;
      
      public var failtext:String;
      
      public var auto:int;
      
      public var ap:int;
      
      public var stagedesign:int;
      
      public var bg:int = -1;
      
      public var time:int;
      
      public var wave:Vector.<XMLQuestWave>;
      
      public var reward:XMLList;
      
      public var intro:Vector.<XMLQuestIntro>;
      
      public var ending:Vector.<XMLQuestIntro>;
      
      public var stagewidth:int;
      
      public var roomObj:XMLList = null;
      
      public function XMLQuestStep(xml:XML)
      {
         super();
         if(xml == null)
         {
            return;
         }
         this.nodeID = xml.node;
         if(xml.teleportnode.toString() != "")
         {
            this.teleportNodeID = xml.teleportnode;
         }
         else
         {
            this.teleportNodeID = this.nodeID;
         }
         this.action = xml.action;
         if(xml.teleportposx.toString() != "")
         {
            this.teleportPosX = xml.teleportposx;
         }
         else
         {
            this.teleportPosX = 150;
         }
         if(xml.title.toString() != "")
         {
            this.title = LangManager.getQuestString(xml.title);
         }
         else
         {
            this.title = "";
         }
         if(xml.stitle.toString() != "")
         {
            this.stitle = LangManager.getQuestString(xml.stitle);
         }
         else
         {
            this.stitle = this.title;
         }
         this.condition = xml.condition;
         if(xml.failtext.toString() == "")
         {
            this.failtext = LangManager.getQuestString(xml.failtext);
         }
         else
         {
            this.failtext = "";
         }
         if(xml.auto.toString() == "")
         {
            this.auto = 0;
         }
         else
         {
            this.auto = xml.auto;
         }
         if(xml.ap.toString() == "")
         {
            this.ap = 0;
         }
         else
         {
            this.ap = xml.ap;
         }
         if(xml.stagedesign.toString() == "")
         {
            this.stagedesign = 0;
         }
         else
         {
            this.stagedesign = xml.stagedesign;
         }
         if(xml.bg.toString() != "")
         {
            this.bg = xml.bg;
         }
         this.time = xml.time;
         var length:int = xml.wave.length();
         this.wave = new Vector.<XMLQuestWave>();
         for(var i:int = 0; i < length; i++)
         {
            this.wave.push(new XMLQuestWave(xml.wave[i]));
         }
         this.reward = xml.reward;
         this.intro = this.getXMLIntroList(xml.intro);
         this.ending = this.getXMLIntroList(xml.ending);
         if(xml.stagewidth.toString() == "")
         {
            this.stagewidth = 1000;
         }
         else
         {
            this.stagewidth = xml.stagewidth;
         }
         if(xml.roomobj.toString() != "")
         {
            this.roomObj = xml.roomobj;
         }
      }
      
      public function getRoomObj() : XMLList
      {
         return this.roomObj;
      }
      
      public function getRoomId() : int
      {
         if(this.roomObj == null)
         {
            return 0;
         }
         return this.roomObj.room;
      }
      
      public function getXMLIntroList(xml:XMLList) : Vector.<XMLQuestIntro>
      {
         var currentDisplay:XML = null;
         var name:String = null;
         var questOption:XMLQuestOption = null;
         var max:int = 0;
         var j:int = 0;
         var vectorList:Vector.<XMLQuestIntro> = new Vector.<XMLQuestIntro>();
         var length:int = xml.children().length();
         for(var i:int = 0; i < length; i++)
         {
            currentDisplay = xml.children()[i];
            name = currentDisplay.name();
            switch(name)
            {
               case "label":
                  vectorList.push(new XMLQuestLabel(currentDisplay));
                  break;
               case "goto":
                  vectorList.push(new XMLQuestGotoLabel(currentDisplay));
                  break;
               case "text":
                  vectorList.push(new XMLQuestText(currentDisplay));
                  break;
               case "dialogue":
                  vectorList.push(new XMLQuestDialogue(currentDisplay));
                  break;
               case "img":
                  vectorList.push(new XMLQuestImage(currentDisplay));
                  break;
               case "imageurl":
                  vectorList.push(new XMLQuestImageURL(currentDisplay));
                  break;
               case "option":
                  questOption = new XMLQuestOption(currentDisplay);
                  vectorList.push(questOption);
                  max = int(questOption.choice.length);
                  for(j = 0; j < max; j++)
                  {
                     vectorList.push(null);
                  }
                  break;
               case "choice":
                  break;
               case "outcome":
                  vectorList.push(new XMLQuestOutcome(currentDisplay));
                  break;
               case "cutscene":
                  vectorList.push(new XMLQuestCutscene(currentDisplay));
                  break;
               default:
                  trace("XMLQuestStep.getXMLIntroList: incorrect type " + name);
            }
         }
         return vectorList;
      }
      
      public function hasIntro() : Boolean
      {
         return this.intro.length > 0;
      }
      
      public function hasEnding() : Boolean
      {
         return this.ending.length > 0;
      }
   }
}

