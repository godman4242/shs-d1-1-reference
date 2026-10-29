package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2784")]
   public class CharacterSelectForm extends MovieClip
   {
      
      public var chardeleteform:CharDelete;
      
      public var slot0:MovieClip;
      
      public var slot1:MovieClip;
      
      public var slot2:MovieClip;
      
      public var titletext:TextField;
      
      public var gobackbutton:YellowButtonSmall;
      
      public function CharacterSelectForm()
      {
         super();
         LangManager.initTextField(this.slot0.inside);
         LangManager.initTextField(this.slot0.insidelevel);
         this.slot0.inside.text = "";
         LangManager.initTextField(this.slot1.inside);
         LangManager.initTextField(this.slot1.insidelevel);
         this.slot1.inside.text = "";
         LangManager.initTextField(this.slot2.inside);
         LangManager.initTextField(this.slot2.insidelevel);
         this.slot2.inside.text = "";
         this.slot0.chardeletebutton.visible = false;
         this.slot1.chardeletebutton.visible = false;
         this.slot2.chardeletebutton.visible = false;
         this.chardeleteform.visible = false;
         this.gobackbutton.setText(LangManager.getString(9));
         LangManager.initTextField(this.titletext,true);
         this.titletext.text = LangManager.getString(46);
      }
      
      public function reAddListeners() : *
      {
         this.gobackbutton.addEventListener(MouseEvent.CLICK,this.goBack);
         this.gobackbutton.addEventListeners();
      }
      
      internal function removeListeners() : *
      {
         this.gobackbutton.removeEventListener(MouseEvent.CLICK,this.goBack);
         this.gobackbutton.removeEventListeners();
         this.slot0.removeEventListener(MouseEvent.CLICK,this.gotoCharacterCreation);
         this.slot1.removeEventListener(MouseEvent.CLICK,this.gotoCharacterCreation);
         this.slot2.removeEventListener(MouseEvent.CLICK,this.gotoCharacterCreation);
         this.slot0.chardeletebutton.removeEventListener(MouseEvent.CLICK,this.deleteChar);
         this.slot1.chardeletebutton.removeEventListener(MouseEvent.CLICK,this.deleteChar);
         this.slot2.chardeletebutton.removeEventListener(MouseEvent.CLICK,this.deleteChar);
         this.slot0.button.removeEventListener(MouseEvent.CLICK,this.startGame0);
         this.slot1.button.removeEventListener(MouseEvent.CLICK,this.startGame1);
         this.slot2.button.removeEventListener(MouseEvent.CLICK,this.startGame2);
      }
      
      internal function loadCharacters() : *
      {
         var tempArray:Array = null;
         TitleUI.instance.loadingScreenOn();
         var strArray:Array = QueryManager.instance.charstring.split("|");
         var numChar:* = strArray.length;
         if(strArray[0])
         {
            tempArray = strArray[0].split(",");
            this.slot0.inside.text = tempArray[0];
            this.slot0.insidelevel.text = LangManager.getString(47) + tempArray[1];
            this.slot0.button.addEventListener(MouseEvent.CLICK,this.startGame0);
            this.slot0.chardeletebutton.visible = true;
            this.slot0.chardeletebutton.addEventListener(MouseEvent.CLICK,this.deleteChar);
            if(StatsManager.singleCharacter || QueryManager.instance.offlineMode)
            {
               this.startGame0(null);
               return;
            }
         }
         else
         {
            this.slot0.inside.text = LangManager.getString(48);
            this.slot0.insidelevel.text = LangManager.getString(39);
            this.slot0.addEventListener(MouseEvent.CLICK,this.gotoCharacterCreation);
            this.slot0.chardeletebutton.visible = false;
            if(StatsManager.singleCharacter || QueryManager.instance.offlineMode)
            {
               this.gotoCharacterCreation(null);
               return;
            }
         }
         if(strArray[1])
         {
            tempArray = strArray[1].split(",");
            this.slot1.inside.text = tempArray[0];
            this.slot1.insidelevel.text = LangManager.getString(47) + tempArray[1];
            this.slot1.button.addEventListener(MouseEvent.CLICK,this.startGame1);
            this.slot1.chardeletebutton.visible = true;
            this.slot1.chardeletebutton.addEventListener(MouseEvent.CLICK,this.deleteChar);
         }
         else if(StatsManager.singleCharacter)
         {
            this.slot1.inside.text = LangManager.getString(49);
            this.slot1.insidelevel.text = "";
            this.slot1.chardeletebutton.visible = false;
         }
         else
         {
            this.slot1.inside.text = LangManager.getString(48);
            this.slot1.insidelevel.text = LangManager.getString(39);
            this.slot1.addEventListener(MouseEvent.CLICK,this.gotoCharacterCreation);
            this.slot1.chardeletebutton.visible = false;
         }
         if(strArray[2])
         {
            tempArray = strArray[2].split(",");
            this.slot2.inside.text = tempArray[0];
            this.slot2.insidelevel.text = LangManager.getString(47) + tempArray[1];
            this.slot2.button.addEventListener(MouseEvent.CLICK,this.startGame2);
            this.slot2.chardeletebutton.visible = true;
            this.slot2.chardeletebutton.addEventListener(MouseEvent.CLICK,this.deleteChar);
         }
         else if(StatsManager.singleCharacter)
         {
            this.slot2.inside.text = LangManager.getString(49);
            this.slot2.insidelevel.text = "";
            this.slot2.chardeletebutton.visible = false;
         }
         else
         {
            this.slot2.inside.text = LangManager.getString(48);
            this.slot2.insidelevel.text = LangManager.getString(39);
            this.slot2.addEventListener(MouseEvent.CLICK,this.gotoCharacterCreation);
            this.slot2.chardeletebutton.visible = false;
         }
         TitleUI.instance.loadingScreenOff();
      }
      
      internal function deleteChar(event:MouseEvent) : *
      {
         var tempArray:Array = null;
         this.removeListeners();
         var strArray:Array = QueryManager.instance.charstring.split("|");
         tempArray = strArray[event.currentTarget.parent.name.substr(4,1)].split(",");
         this.chardeleteform.reAddListeners(tempArray[0]);
         this.chardeleteform.visible = true;
      }
      
      internal function goBack(event:MouseEvent) : *
      {
         this.removeListeners();
         TitleUI.instance.switchToReady();
      }
      
      internal function gotoCharacterCreation(event:MouseEvent) : *
      {
         this.removeListeners();
         TitleUI.instance.switchToCharacterCreate();
      }
      
      internal function startGame0(event:MouseEvent) : *
      {
         StatsManager.charname = this.slot0.inside.text;
         this.startGame();
      }
      
      internal function startGame1(event:MouseEvent) : *
      {
         StatsManager.charname = this.slot1.inside.text;
         this.startGame();
      }
      
      internal function startGame2(event:MouseEvent) : *
      {
         StatsManager.charname = this.slot2.inside.text;
         this.startGame();
      }
      
      internal function startGame() : *
      {
         this.removeListeners();
         GameEngine.leaveTitleScreen();
         if(!GameEngine.isPlayBackClient())
         {
            Tracker.instance.trackGameStart();
         }
         else
         {
            Tracker.instance.trackPlaybackClient();
         }
      }
      
      public function autoClickFirstSlot() : *
      {
         this.slot0.click();
      }
   }
}

