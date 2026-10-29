package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2846")]
   public class TitleUI extends MovieClip
   {
      
      internal static var instance:TitleUI;
      
      public var options:OptionsForm;
      
      public var charselect:CharacterSelectForm;
      
      public var motd:MOTDDialogBox;
      
      public var logonready:LogonReadyForm;
      
      public var rankings:LeaderboardUI;
      
      public var screenTransition:ScreenTransition;
      
      public var charcreate:CreateCharForm;
      
      public var lutbutton:SimpleButton;
      
      public var titleshadebar:MovieClip;
      
      public var edit:EditUserForm;
      
      public var login:LoginForm;
      
      public var versiontext:TextField;
      
      public var register:RegistrationForm;
      
      public var title_english:shs3title_english;
      
      public var loadingscreen:MovieClip;
      
      public var resend:ResendValidationForm;
      
      public var title_chinese:MovieClip;
      
      public function TitleUI()
      {
         super();
         instance = this;
         this.login.visible = false;
         this.register.visible = false;
         this.edit.visible = false;
         this.logonready.visible = false;
         this.options.visible = false;
         this.resend.visible = false;
         this.charselect.visible = false;
         this.charcreate.visible = false;
         this.rankings.visible = false;
         this.motd.visible = false;
         this.versiontext.text = "v" + StatsManager.clientVersion.toString();
         this.loadingscreen.visible = false;
         LangManager.initTextField(this.loadingscreen.prompt);
         this.loadingscreen.prompt.text = LangManager.getString(25);
         if(!StatsManager.isKongregate)
         {
            if(!QueryManager.instance.loggedIn && StatsManager.useFlashVarsLogin && QueryManager.instance.hasFlashVars())
            {
               QueryManager.instance.checkFlashVarsLogin();
               TitleUI.instance.loadingScreenOn();
            }
            else if(!QueryManager.instance.loggedIn && StatsManager.useExternalLogin)
            {
               QueryManager.instance.checkExternalLogin();
               TitleUI.instance.loadingScreenOn();
            }
            else if(!QueryManager.instance.loggedIn && QueryManager.instance.autoLogin())
            {
               if(!QueryManager.instance.offlineMode)
               {
                  TitleUI.instance.loadingScreenOn();
               }
            }
            else
            {
               this.switchToLogin();
            }
         }
         QueryManager.instance.getSavedOptions();
         this.title_english.visible = false;
         this.title_chinese.visible = false;
         if(LangManager.getLanguage() == LangManager.ENGLISH)
         {
            this.title_english.visible = true;
         }
         else if(LangManager.getLanguage() == LangManager.CHINESE)
         {
            this.title_chinese.visible = true;
         }
         this.lutbutton.addEventListener(MouseEvent.CLICK,this.logoClick,false,0,true);
         this.doResize();
      }
      
      public function logoClick(event:MouseEvent) : *
      {
         QueryManager.instance.showEBWebsite();
      }
      
      public function switchToLogin() : *
      {
         this.login.reAddListeners();
         this.login.errormessage.text = "";
         this.login.visible = true;
         this.register.visible = false;
         this.edit.visible = false;
         this.logonready.visible = false;
         this.options.visible = false;
         this.resend.visible = false;
         this.loadingscreen.visible = false;
      }
      
      public function switchToRegister() : *
      {
         this.register.reAddListeners();
         this.register.errormessage.text = "";
         this.login.visible = false;
         this.register.visible = true;
         this.edit.visible = false;
         this.logonready.visible = false;
         this.options.visible = false;
         this.loadingscreen.visible = false;
      }
      
      public function switchToEdit() : *
      {
         this.edit.reAddListeners();
         this.edit.errormessage.text = "";
         this.login.visible = false;
         this.register.visible = false;
         this.edit.show();
         this.logonready.visible = false;
         this.options.visible = false;
         this.loadingscreen.visible = false;
      }
      
      public function switchToResend() : *
      {
         this.resend.reAddListeners();
         this.resend.errormessage.text = "";
         this.resend.visible = true;
         this.login.visible = false;
         this.register.visible = false;
         this.edit.visible = false;
         this.logonready.visible = false;
         this.options.visible = false;
         this.loadingscreen.visible = false;
      }
      
      public function switchToReady() : *
      {
         this.logonready.reAddListeners();
         this.logonready.updateLoginNotification();
         this.login.visible = false;
         this.register.visible = false;
         this.edit.visible = false;
         this.logonready.visible = true;
         this.options.visible = false;
         this.charselect.visible = false;
         this.loadingscreen.visible = false;
         this.lutbutton.visible = true;
      }
      
      public function switchToOptions() : *
      {
         this.options.reAddListeners();
         this.login.visible = false;
         this.register.visible = false;
         this.edit.visible = false;
         this.logonready.visible = false;
         this.options.visible = true;
         this.loadingscreen.visible = false;
         this.lutbutton.visible = false;
      }
      
      public function switchToRankings() : *
      {
         this.rankings.show();
         this.logonready.visible = false;
         this.lutbutton.visible = false;
      }
      
      public function switchToCharacterSelect() : *
      {
         this.charselect.reAddListeners();
         trace("characterselect");
         this.logonready.visible = false;
         this.options.visible = false;
         this.charcreate.visible = false;
         this.loadingscreen.visible = false;
         if(!StatsManager.singleCharacter)
         {
            this.charselect.visible = true;
         }
         this.charselect.loadCharacters();
         this.lutbutton.visible = false;
      }
      
      public function switchToCharacterCreate() : *
      {
         this.charselect.visible = false;
         this.logonready.visible = false;
         this.options.visible = false;
         this.charcreate.visible = true;
         this.loadingscreen.visible = false;
         GameEngine.resetTitleMCS();
         this.lutbutton.visible = false;
         this.charcreate.reAddListeners();
      }
      
      public function loadingScreenOn() : *
      {
         this.loadingscreen.visible = true;
      }
      
      public function loadingScreenOff() : *
      {
         this.loadingscreen.visible = false;
      }
      
      public function setLoadingScreenText(str:String) : *
      {
         this.loadingscreen.prompt.text = str;
      }
      
      public function setLoadingScreenTextBig(str:String) : *
      {
         this.loadingscreen.prompt.text = str;
         this.loadingscreen.gotoAndStop(2);
      }
      
      public function showMOTD(str:String) : *
      {
         if(str == "")
         {
            return;
         }
         this.motd.show(str,LangManager.getString(5));
      }
      
      public function hideTitle() : *
      {
         this.versiontext.visible = false;
         this.title_english.visible = false;
         this.title_chinese.visible = false;
         this.titleshadebar.visible = false;
         this.lutbutton.visible = false;
      }
      
      public function loginAsGuest() : *
      {
         this.login.playasguest(null);
      }
      
      public function doResize() : *
      {
         scaleX = StatsManager.stageScale;
         scaleY = StatsManager.stageScale;
         x = StatsManager.stageOffsetX;
         y = StatsManager.stageOffsetY;
         GameEngine.placeBlockers();
      }
      
      public function hideForIntroVideo() : *
      {
         this.logonready.visible = false;
         this.title_english.visible = false;
         this.title_chinese.visible = false;
         this.titleshadebar.visible = false;
         this.lutbutton.visible = false;
         this.versiontext.visible = false;
      }
      
      public function showForIntroVideo() : *
      {
         this.logonready.visible = true;
         if(LangManager.getLanguage() == LangManager.ENGLISH)
         {
            this.title_english.visible = true;
         }
         else if(LangManager.getLanguage() == LangManager.CHINESE)
         {
            this.title_chinese.visible = true;
         }
         this.titleshadebar.visible = true;
         this.lutbutton.visible = true;
         this.versiontext.visible = true;
      }
   }
}

