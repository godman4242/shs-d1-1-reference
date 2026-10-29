package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1133")]
   public class OptionsUI extends MovieClip
   {
      
      public var fullscreencheck:XCheckBox;
      
      public var recordcheck:XCheckBox;
      
      public var soundcheck:XCheckBox;
      
      public var musiccheck:XCheckBox;
      
      public var bloodcheck:XCheckBox;
      
      public var titletext:TextField;
      
      public var chatcheck:XCheckBox;
      
      public var quitdialog:QuitDialog;
      
      public var closewindowbutton:YellowButton;
      
      public var backtomainmenubutton:GreyButton;
      
      public function OptionsUI()
      {
         super();
         this.musiccheck.setText(LangManager.getString(6));
         this.soundcheck.setText(LangManager.getString(7));
         this.bloodcheck.setText(LangManager.getString(8));
         this.chatcheck.setText(LangManager.getString(396));
         this.recordcheck.setText(LangManager.getString(492));
         this.fullscreencheck.setText(LangManager.getString(752));
         this.backtomainmenubutton.setText(LangManager.getString(74));
         this.closewindowbutton.setText(LangManager.getString(75));
         LangManager.initTextField(this.titletext,true);
         this.titletext.text = LangManager.getString(10);
         if(StatsManager.hideBloodOption)
         {
            this.bloodcheck.visible = false;
         }
         if(StatsManager.isMobile)
         {
            this.fullscreencheck.visible = false;
         }
      }
      
      public function show() : *
      {
         OverworldHUD.instance.showNodeUI(false);
         this.visible = true;
         this.addEventListeners();
         Overworld.setMapEnabled(false);
         this.quitdialog.visible = false;
         if(GameEngine.isAdventureMode())
         {
            NetworkManager.instance.playerUpdateBusy(true);
         }
      }
      
      internal function addEventListeners() : *
      {
         this.backtomainmenubutton.addEventListener(MouseEvent.CLICK,this.backtomainmenu);
         this.backtomainmenubutton.addEventListeners();
         this.musiccheck.addEventListeners();
         this.soundcheck.addEventListeners();
         this.bloodcheck.addEventListeners();
         this.chatcheck.addEventListeners();
         this.recordcheck.addEventListeners();
         this.fullscreencheck.addEventListeners();
         this.musiccheck.addEventListener(MouseEvent.CLICK,this.togglemusic);
         this.soundcheck.addEventListener(MouseEvent.CLICK,this.togglesound);
         this.bloodcheck.addEventListener(MouseEvent.CLICK,this.toggleblood);
         this.chatcheck.addEventListener(MouseEvent.CLICK,this.togglechat);
         this.recordcheck.addEventListener(MouseEvent.CLICK,this.togglerecord);
         this.fullscreencheck.addEventListener(MouseEvent.CLICK,this.toggledofullscreen);
         this.closewindowbutton.addEventListener(MouseEvent.CLICK,this.onLeave);
         this.closewindowbutton.addEventListeners();
         this.musiccheck.setCheck(SoundManager.instance.hasMusic);
         this.soundcheck.setCheck(SoundManager.instance.hasSound);
         this.bloodcheck.setCheck(!StatsManager.censored);
         this.chatcheck.setCheck(StatsManager.hasChatNotification);
         this.recordcheck.setCheck(StatsManager.recordDuels);
         this.fullscreencheck.setCheck(StatsManager.doFullScreen);
      }
      
      internal function removeEventListeners() : *
      {
         this.backtomainmenubutton.removeEventListener(MouseEvent.CLICK,this.backtomainmenu);
         this.backtomainmenubutton.removeEventListeners();
         this.musiccheck.removeEventListeners();
         this.soundcheck.removeEventListeners();
         this.bloodcheck.removeEventListeners();
         this.chatcheck.removeEventListeners();
         this.recordcheck.removeEventListeners();
         this.fullscreencheck.removeEventListeners();
         this.musiccheck.removeEventListener(MouseEvent.CLICK,this.togglemusic);
         this.soundcheck.removeEventListener(MouseEvent.CLICK,this.togglesound);
         this.bloodcheck.removeEventListener(MouseEvent.CLICK,this.toggleblood);
         this.chatcheck.removeEventListener(MouseEvent.CLICK,this.togglechat);
         this.recordcheck.removeEventListener(MouseEvent.CLICK,this.togglerecord);
         this.fullscreencheck.removeEventListener(MouseEvent.CLICK,this.toggledofullscreen);
         this.closewindowbutton.removeEventListener(MouseEvent.CLICK,this.onLeave);
         this.closewindowbutton.removeEventListeners();
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
         if(StatsManager.doFullScreen)
         {
            GameEngine.setFullScreen();
         }
         else
         {
            GameEngine.leaveFullScreen();
         }
      }
      
      internal function backtomainmenu(event:MouseEvent) : *
      {
         this.quitdialog.visible = true;
         this.quitdialog.addListeners();
      }
      
      public function onLeave(event:MouseEvent) : void
      {
         this.removeEventListeners();
         this.visible = false;
         QueryManager.instance.saveModifiedCharData();
         if(GameEngine.isOverworld())
         {
            OverworldHUD.getInstance().initForOverworld();
         }
         else
         {
            OverworldHUD.getInstance().initForAdventureMode();
            InputManager.setAdventureMode();
            NetworkManager.instance.playerUpdateBusy(false);
         }
      }
   }
}

