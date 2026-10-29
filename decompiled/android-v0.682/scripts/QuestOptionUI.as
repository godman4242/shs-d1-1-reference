package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol943")]
   public class QuestOptionUI extends MovieClip
   {
      
      internal static var spacingY:int = 35;
      
      internal static var startY:int = 366;
      
      internal static var startX:int = 15;
      
      public var bust:DialogueBust;
      
      public var optionBodyText:TextField;
      
      public var npcName:TextField;
      
      internal var buttonList:Vector.<OptionButton>;
      
      public function QuestOptionUI()
      {
         super();
         addFrameScript(0,this.frame1);
         this.buttonList = new Vector.<OptionButton>();
         this.bust.visible = false;
         this.visible = false;
         LangManager.initTextField(this.optionBodyText);
         LangManager.initTextField(this.npcName);
         this.bust.faceLeft();
         this.optionBodyText.condenseWhite = true;
         this.optionBodyText.mouseEnabled = false;
      }
      
      internal function clearButtonList() : *
      {
         var button:OptionButton = null;
         var i:int = 0;
         var length:int = int(this.buttonList.length);
         if(length > 0)
         {
            for(i = 0; i < length; i++)
            {
               button = this.buttonList.pop();
               button.removeEventListener(MouseEvent.CLICK,this.onHide);
               removeChild(button);
            }
         }
      }
      
      public function show(ID:int, mainTxt:String, choiceList:Vector.<XMLQuestChoice>) : *
      {
         var button:OptionButton = null;
         var dice:int = 0;
         if(mainTxt == "")
         {
            gotoAndStop(2);
         }
         else
         {
            gotoAndStop(1);
         }
         this.npcName.text = StatsManager.charname;
         this.optionBodyText.text = "";
         this.optionBodyText.htmlText = mainTxt;
         var displayed:int = 0;
         var length:int = int(choiceList.length);
         for(var i:int = 0; i < length; i++)
         {
            if(choiceList[i].passCondition())
            {
               button = new OptionButton(choiceList[i],startX,startY + spacingY * displayed);
               button.addEventListener(MouseEvent.CLICK,this.onHide);
               addChild(button);
               this.buttonList.push(button);
               displayed++;
            }
         }
         this.visible = true;
         if(ID != -999)
         {
            if(ID == -2)
            {
               this.bust.initMCSFromPlayer();
            }
            else
            {
               this.bust.initMCSFromNPCID(ID);
            }
            this.bust.visible = true;
            setChildIndex(this.bust,numChildren - 1);
         }
         if(mainTxt == "random")
         {
            dice = Math.random() * length;
            button = this.buttonList[dice];
            this.bust.visible = false;
            this.visible = false;
            button.applyOutcome();
            CutsceneManager.getInstance().gotoStep(button);
            this.clearButtonList();
         }
         else if(mainTxt == "auto")
         {
            button = this.buttonList[0];
            this.bust.visible = false;
            this.visible = false;
            button.applyOutcome();
            CutsceneManager.getInstance().gotoStep(button);
            this.clearButtonList();
         }
      }
      
      public function onHide(mouseEvent:MouseEvent) : *
      {
         this.bust.visible = false;
         this.visible = false;
         this.clearButtonList();
         mouseEvent.currentTarget.applyOutcome();
         CutsceneManager.getInstance().gotoStep(mouseEvent.currentTarget as OptionButton);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

