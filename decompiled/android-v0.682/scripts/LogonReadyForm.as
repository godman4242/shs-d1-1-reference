package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2796")]
   public class LogonReadyForm extends MovieClip
   {
      
      public var rankingsbutton:GreyWordsButton;
      
      public var introbutton:GreyWordsButton;
      
      public var startgamebutton:GreyWordsButton;
      
      public var editbutton:GreyButtonSmall;
      
      public var button_hitarea:Blocker;
      
      public var LoginNotification:TextField;
      
      public var logoutbutton:GreyButtonSmall;
      
      public var optionsbutton:GreyWordsButton;
      
      public function LogonReadyForm()
      {
         super();
         this.logoutbutton.setText(LangManager.getString(26));
         this.editbutton.setText(LangManager.getString(384));
         this.startgamebutton.setText(LangManager.getString(27));
         this.rankingsbutton.setText(LangManager.getString(28));
         this.introbutton.setText(LangManager.getString(624));
         this.optionsbutton.setText(LangManager.getString(29));
         LangManager.initTextField(this.LoginNotification);
         this.button_hitarea.visible = false;
      }
      
      public function reAddListeners() : *
      {
         this.startgamebutton.addEventListener(MouseEvent.CLICK,this.startgame);
         this.rankingsbutton.addEventListener(MouseEvent.CLICK,this.switchtoranking);
         this.introbutton.addEventListener(MouseEvent.CLICK,this.replayIntro);
         this.optionsbutton.addEventListener(MouseEvent.CLICK,this.switchtooptions);
         this.logoutbutton.addEventListener(MouseEvent.CLICK,this.logout);
         this.logoutbutton.addEventListeners();
         this.editbutton.addEventListener(MouseEvent.CLICK,this.switchtoedit);
         this.editbutton.addEventListeners();
         this.startgamebutton.addEventListeners();
         this.rankingsbutton.addEventListeners();
         this.optionsbutton.addEventListeners();
         this.introbutton.addEventListeners();
         if(StatsManager.useExternalLogin || QueryManagerPIO.instance.facebookTokenLogin || StatsManager.isKongregate)
         {
            this.logoutbutton.visible = false;
         }
         else
         {
            this.logoutbutton.visible = true;
         }
         if(StatsManager.usePlayerIO)
         {
            this.editbutton.visible = false;
            this.logoutbutton.x = this.editbutton.x;
            this.logoutbutton.hitArea = this.button_hitarea;
         }
         else
         {
            this.editbutton.visible = true;
         }
      }
      
      internal function removeListeners() : *
      {
         this.startgamebutton.removeEventListener(MouseEvent.CLICK,this.startgame);
         this.rankingsbutton.removeEventListener(MouseEvent.CLICK,this.switchtoranking);
         this.introbutton.removeEventListener(MouseEvent.CLICK,this.replayIntro);
         this.optionsbutton.removeEventListener(MouseEvent.CLICK,this.switchtooptions);
         this.logoutbutton.removeEventListener(MouseEvent.CLICK,this.logout);
         this.logoutbutton.removeEventListeners();
         this.editbutton.removeEventListener(MouseEvent.CLICK,this.switchtoedit);
         this.editbutton.removeEventListeners();
         this.startgamebutton.removeEventListeners();
         this.rankingsbutton.removeEventListeners();
         this.optionsbutton.removeEventListeners();
         this.introbutton.removeEventListeners();
      }
      
      internal function updateLoginNotification() : *
      {
         this.LoginNotification.text = QueryManager.instance.username + " " + LangManager.getString(30);
      }
      
      internal function startgame(event:MouseEvent) : void
      {
         if(StatsManager.doFullScreen)
         {
            GameEngine.setFullScreen();
         }
         this.removeListeners();
         TitleUI.instance.switchToCharacterSelect();
      }
      
      internal function switchtoranking(event:MouseEvent) : void
      {
         this.removeListeners();
         TitleUI.instance.switchToRankings();
      }
      
      internal function switchtoachievements(event:MouseEvent) : void
      {
      }
      
      internal function switchtooptions(event:MouseEvent) : void
      {
         this.removeListeners();
         TitleUI.instance.switchToOptions();
      }
      
      internal function switchtoedit(event:MouseEvent) : void
      {
         this.removeListeners();
         TitleUI.instance.switchToEdit();
      }
      
      internal function logout(event:MouseEvent) : *
      {
         this.removeListeners();
         TitleUI.instance.loadingScreenOn();
         this.visible = false;
         QueryManager.instance.logout();
         TitleUI.instance.switchToLogin();
         TitleUI.instance.login.errormessage.text = LangManager.getString(31);
      }
      
      internal function replayIntro(event:MouseEvent) : *
      {
         SoundManager.instance.stopMusic();
         new IntroVideo(MovieClip(parent),true);
      }
   }
}

