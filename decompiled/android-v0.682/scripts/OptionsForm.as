package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2788")]
   public class OptionsForm extends MovieClip
   {
      
      public var chardeleteform:CharDelete;
      
      public var deletecharbutton:GreyWordsButton;
      
      public var fullscreencheck:XCheckBox;
      
      public var recordcheck:XCheckBox;
      
      public var soundcheck:XCheckBox;
      
      public var musiccheck:XCheckBox;
      
      public var bloodcheck:XCheckBox;
      
      public var chatcheck:XCheckBox;
      
      public var titletext:TextField;
      
      public var gobackbutton:YellowButtonSmall;
      
      public function OptionsForm()
      {
         super();
         this.musiccheck.setText(LangManager.getString(6));
         this.soundcheck.setText(LangManager.getString(7));
         this.bloodcheck.setText(LangManager.getString(8));
         this.chatcheck.setText(LangManager.getString(396));
         this.recordcheck.setText(LangManager.getString(492));
         this.fullscreencheck.setText(LangManager.getString(752));
         this.gobackbutton.setText(LangManager.getString(9));
         LangManager.initTextField(this.titletext,true);
         this.titletext.text = LangManager.getString(10);
         this.deletecharbutton.setText(LangManager.getString(183));
         if(StatsManager.hideBloodOption)
         {
            this.bloodcheck.visible = false;
         }
         this.chardeleteform.visible = false;
         if(StatsManager.isMobile)
         {
            this.fullscreencheck.visible = false;
         }
      }
      
      public function reAddListeners() : *
      {
         this.musiccheck.addEventListeners();
         this.soundcheck.addEventListeners();
         this.bloodcheck.addEventListeners();
         this.chatcheck.addEventListeners();
         this.recordcheck.addEventListeners();
         this.fullscreencheck.addEventListeners();
         this.deletecharbutton.addEventListeners();
         this.musiccheck.addEventListener(MouseEvent.CLICK,this.togglemusic);
         this.soundcheck.addEventListener(MouseEvent.CLICK,this.togglesound);
         this.bloodcheck.addEventListener(MouseEvent.CLICK,this.toggleblood);
         this.chatcheck.addEventListener(MouseEvent.CLICK,this.togglechat);
         this.recordcheck.addEventListener(MouseEvent.CLICK,this.togglerecord);
         this.fullscreencheck.addEventListener(MouseEvent.CLICK,this.toggledofullscreen);
         this.deletecharbutton.addEventListener(MouseEvent.CLICK,this.deleteChar);
         this.gobackbutton.addEventListener(MouseEvent.CLICK,this.goBack);
         this.gobackbutton.addEventListeners();
         this.musiccheck.setCheck(SoundManager.instance.hasMusic);
         this.soundcheck.setCheck(SoundManager.instance.hasSound);
         this.bloodcheck.setCheck(!StatsManager.censored);
         this.chatcheck.setCheck(StatsManager.hasChatNotification);
         this.recordcheck.setCheck(StatsManager.recordDuels);
         this.fullscreencheck.setCheck(StatsManager.doFullScreen);
         if(!StatsManager.singleCharacter || QueryManager.instance.charstring.length == 0)
         {
            this.deletecharbutton.visible = false;
         }
      }
      
      internal function removeListeners() : *
      {
         this.musiccheck.removeEventListeners();
         this.soundcheck.removeEventListeners();
         this.bloodcheck.removeEventListeners();
         this.chatcheck.removeEventListeners();
         this.recordcheck.removeEventListeners();
         this.fullscreencheck.removeEventListeners();
         this.deletecharbutton.removeEventListeners();
         this.musiccheck.removeEventListener(MouseEvent.CLICK,this.togglemusic);
         this.soundcheck.removeEventListener(MouseEvent.CLICK,this.togglesound);
         this.bloodcheck.removeEventListener(MouseEvent.CLICK,this.toggleblood);
         this.chatcheck.removeEventListener(MouseEvent.CLICK,this.togglechat);
         this.recordcheck.removeEventListener(MouseEvent.CLICK,this.togglerecord);
         this.fullscreencheck.removeEventListener(MouseEvent.CLICK,this.toggledofullscreen);
         this.deletecharbutton.removeEventListener(MouseEvent.CLICK,this.deleteChar);
         this.gobackbutton.removeEventListener(MouseEvent.CLICK,this.goBack);
         this.gobackbutton.removeEventListeners();
      }
      
      internal function togglemusic(event:MouseEvent) : *
      {
         this.musiccheck.toggleCheck();
         SoundManager.instance.toggleMusic();
      }
      
      internal function togglesound(event:MouseEvent) : *
      {
         this.soundcheck.toggleCheck();
         SoundManager.instance.toggleSound();
      }
      
      internal function toggleblood(event:MouseEvent) : *
      {
         this.bloodcheck.toggleCheck();
         StatsManager.toggleBlood();
      }
      
      internal function togglechat(event:MouseEvent) : *
      {
         this.chatcheck.toggleCheck();
         StatsManager.toggleChat();
      }
      
      internal function togglerecord(event:MouseEvent) : *
      {
         this.recordcheck.toggleCheck();
         StatsManager.toggleRecordDuel();
      }
      
      internal function toggledofullscreen(event:MouseEvent) : *
      {
         this.fullscreencheck.toggleCheck();
         StatsManager.toggleDoFullScreen();
      }
      
      internal function goBack(event:MouseEvent) : *
      {
         this.removeListeners();
         TitleUI.instance.switchToReady();
      }
      
      internal function deleteChar(event:MouseEvent) : *
      {
         var tempArray:Array = null;
         this.removeListeners();
         var strArray:Array = QueryManager.instance.charstring.split("|");
         tempArray = strArray[0].split(",");
         this.chardeleteform.reAddListeners(tempArray[0]);
         this.chardeleteform.visible = true;
      }
   }
}

