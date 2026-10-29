package
{
   public class CutsceneManager
   {
      
      internal static var instance:CutsceneManager;
      
      internal var currentDisplayNo:int = -1;
      
      internal var displayList:Vector.<XMLQuestIntro>;
      
      internal var ending:Boolean;
      
      internal var showing:Boolean;
      
      public function CutsceneManager()
      {
         super();
         instance = this;
      }
      
      public static function getInstance() : CutsceneManager
      {
         if(instance == null)
         {
            instance = new CutsceneManager();
         }
         return instance;
      }
      
      public function loadQuestIntro(intro:Vector.<XMLQuestIntro>, startAt:int = 0) : *
      {
         this.displayList = intro;
         this.currentDisplayNo = startAt - 1;
         this.ending = false;
         this.showing = true;
         OverworldHUD.instance.initForCutscene();
         if(!GameEngine.isOverworld())
         {
            InputManager.disableInput();
            StatsManager.getPlayer().stopMoving();
         }
         this.nextStep();
      }
      
      public function loadQuestEnding(intro:Vector.<XMLQuestIntro>) : *
      {
         this.displayList = intro;
         this.currentDisplayNo = -1;
         this.ending = true;
         this.showing = true;
         OverworldHUD.instance.initForCutscene();
         if(!GameEngine.isOverworld())
         {
            InputManager.disableInput();
            StatsManager.getPlayer().stopMoving();
         }
         this.nextStep();
      }
      
      public function nextStep() : *
      {
         ++this.currentDisplayNo;
         if(this.displayList != null && this.currentDisplayNo < this.displayList.length)
         {
            this.display();
         }
         else
         {
            this.leaveOK();
         }
      }
      
      public function previousStep() : *
      {
         --this.currentDisplayNo;
         this.display();
      }
      
      public function gotoStep(button:OptionButton) : *
      {
         var gotolabel:String = button.getGotoLabel();
         var goto:int = button.getGoto();
         var num:int = this.findLabel(gotolabel);
         if(num == -1)
         {
            if(goto == -1)
            {
               this.leaveCancel();
            }
            else
            {
               this.currentDisplayNo = goto;
               this.display();
            }
         }
         else
         {
            this.currentDisplayNo = num;
            this.display();
         }
      }
      
      internal function gotoStepLabel(gotolabel:String) : *
      {
         var num:int = this.findLabel(gotolabel);
         if(num != -1)
         {
            this.currentDisplayNo = num;
            this.display();
         }
         else
         {
            this.currentDisplayNo = int(gotolabel);
            this.display();
         }
      }
      
      public function leaveCancel() : *
      {
         if(GameEngine.isAdventureMode())
         {
            OverworldHUD.instance.initForAdventureMode();
            InputManager.setAdventureMode();
         }
         else if(GameEngine.isOverworld())
         {
            OverworldHUD.instance.initForOverworld();
         }
         this.showing = false;
      }
      
      public function leaveOK() : *
      {
         if(this.ending)
         {
            Overworld.endQuestStep();
         }
         else
         {
            Overworld.startQuestStep();
         }
         this.showing = false;
      }
      
      internal function findLabel(str:String) : int
      {
         var xmlQuestIntro:XMLQuestIntro = null;
         if(str == "")
         {
            return -1;
         }
         var max:int = int(this.displayList.length);
         for(var i:int = 0; i < max; i++)
         {
            xmlQuestIntro = this.displayList[i];
            if(xmlQuestIntro != null && xmlQuestIntro.type == "label" && XMLQuestLabel(xmlQuestIntro).label == str)
            {
               return i;
            }
         }
         return -1;
      }
      
      public function display() : *
      {
         var currentDisplay:XMLQuestIntro = null;
         var currentDialogue:XMLQuestDialogue = null;
         var npcID:int = 0;
         var currentOption:XMLQuestOption = null;
         var outcome:XMLQuestOutcome = null;
         var currentCutscene:XMLQuestCutscene = null;
         var currentGotoLabel:XMLQuestGotoLabel = null;
         currentDisplay = this.displayList[this.currentDisplayNo];
         if(currentDisplay == null)
         {
            trace("CutsceneManager.display() displaying null");
            this.nextStep();
            return;
         }
         var tagName:String = currentDisplay.type;
         switch(tagName)
         {
            case "text":
               OverworldHUD.instance.questTextUI.show(XMLQuestText(currentDisplay).text);
               break;
            case "dialogue":
               currentDialogue = XMLQuestDialogue(currentDisplay);
               npcID = currentDialogue.id;
               OverworldHUD.instance.questDialogueUI.show(npcID,currentDialogue.text,currentDialogue.portrait);
               break;
            case "image":
               OverworldHUD.instance.questImageUI.show(XMLQuestImage(currentDisplay).image);
               break;
            case "imageurl":
               OverworldHUD.instance.questImageUI.show(XMLQuestImageURL(currentDisplay).imageurl,1);
               break;
            case "option":
               currentOption = XMLQuestOption(currentDisplay);
               OverworldHUD.instance.questOptionUI.show(currentOption.id,currentOption.text,currentOption.choice);
               break;
            case "outcome":
               outcome = XMLQuestOutcome(currentDisplay);
               outcome.applyOutcome();
               break;
            case "cutscene":
               currentCutscene = XMLQuestCutscene(currentDisplay);
               currentCutscene.startCutscene();
               break;
            case "label":
               this.nextStep();
               break;
            case "goto":
               currentGotoLabel = XMLQuestGotoLabel(currentDisplay);
               this.gotoStepLabel(currentGotoLabel.label);
               break;
            default:
               trace("Invalid tag " + tagName);
         }
      }
      
      public function clean() : *
      {
         this.displayList.length = 0;
         this.currentDisplayNo = -1;
      }
      
      public function destroy() : *
      {
         instance = null;
      }
      
      public function isShowing() : Boolean
      {
         return this.showing;
      }
   }
}

