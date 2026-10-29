package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol955")]
   public class QuestDialogueUI extends MovieClip
   {
      
      public var bust:DialogueBust;
      
      public var portraitCanvas:Canvas;
      
      public var dialogueBodyText:TextField;
      
      public var shade:MovieClip;
      
      public var npcName:TextField;
      
      public var arrow:MovieClip;
      
      internal var npcPortrait:MovieClip = null;
      
      public function QuestDialogueUI()
      {
         super();
         this.bust.faceLeft();
         this.visible = false;
         LangManager.initTextField(this.npcName,true);
         LangManager.initTextField(this.dialogueBodyText);
         this.dialogueBodyText.condenseWhite = true;
      }
      
      public function show(ID:int, dialogue:String, portrait:String = "") : *
      {
         if(dialogue == null)
         {
            dialogue = "";
         }
         if(this.npcPortrait != null)
         {
            this.portraitCanvas.removeChild(this.npcPortrait);
            this.npcPortrait = null;
         }
         if(ID == -2)
         {
            this.npcName.text = StatsManager.charname;
            if(portrait == "")
            {
               this.bust.initMCSFromPlayer();
            }
         }
         else
         {
            this.npcName.text = QuestEngine.getNPCName(ID);
            if(portrait == "")
            {
               this.bust.initMCSFromNPCID(ID);
            }
         }
         this.dialogueBodyText.text = "";
         this.dialogueBodyText.htmlText = dialogue;
         this.addEventListener(MouseEvent.CLICK,this.onHide);
         this.visible = true;
         this.arrow.visible = true;
         if(portrait != "")
         {
            this.bust.visible = false;
            this.npcPortrait = ResourceManager.getPortrait(portrait);
            this.portraitCanvas.addChild(this.npcPortrait);
            this.npcPortrait.x = 800;
            this.npcPortrait.y = 0;
            this.shade.visible = false;
         }
         else
         {
            this.bust.visible = true;
            this.shade.visible = false;
         }
      }
      
      public function onHide(mouseEvent:MouseEvent) : *
      {
         this.removeEventListener(MouseEvent.CLICK,this.onHide);
         this.visible = false;
         if(this.npcPortrait != null)
         {
            this.portraitCanvas.removeChild(this.npcPortrait);
            this.npcPortrait = null;
         }
         CutsceneManager.getInstance().nextStep();
      }
      
      public function hideOnly() : *
      {
         this.removeEventListener(MouseEvent.CLICK,this.onHide);
         this.visible = false;
         if(this.npcPortrait != null)
         {
            this.portraitCanvas.removeChild(this.npcPortrait);
            this.npcPortrait = null;
         }
      }
      
      public function disableClick() : *
      {
         this.removeEventListener(MouseEvent.CLICK,this.onHide);
         this.arrow.visible = false;
         if(this.npcPortrait != null)
         {
            this.portraitCanvas.removeChild(this.npcPortrait);
            this.npcPortrait = null;
         }
      }
      
      public function darkBlurBust(val:int) : *
      {
         if(val == 0)
         {
            ColorCode.clearFilter(this.bust);
         }
         else
         {
            ColorCode.makeDark_blur(this.bust,-200,2);
         }
      }
   }
}

