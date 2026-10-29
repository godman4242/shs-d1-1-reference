package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2874")]
   public class PlaybackEndUI extends MovieClip
   {
      
      public static var instance:PlaybackEndUI;
      
      public var words:TextField;
      
      public var continuebutton:GreyButton;
      
      public var respawnbutton:YellowButton;
      
      internal var winner:int;
      
      internal var taunt:String;
      
      internal var displaytext:String = "";
      
      public function PlaybackEndUI()
      {
         super();
         addFrameScript(6,this.frame7,9,this.frame10,10,this.frame11,59,this.frame60);
         instance = this;
         this.continuebutton.setText(LangManager.getString(482));
      }
      
      public function setWinner(str:String, taunt:String, id:int) : *
      {
         this.displaytext = str + " " + LangManager.getString(241) + "!";
         this.winner = id;
         this.taunt = taunt;
      }
      
      public function setDraw() : *
      {
         this.displaytext = LangManager.getString(394);
         this.winner = 0;
      }
      
      public function getDisplayText() : String
      {
         return this.displaytext;
      }
      
      public function showButtons() : *
      {
         if(!GameEngine.isPlayBackClient())
         {
            this.continuebutton.visible = true;
         }
      }
      
      public function showPlaybackModeButton() : *
      {
         this.respawnbutton.visible = true;
         OverworldHUD.instance.questDialogueUI.visible = false;
      }
      
      public function show() : *
      {
         this.continuebutton.visible = false;
         this.respawnbutton.visible = false;
         this.addEventListeners();
         visible = true;
         gotoAndPlay(1);
         if(this.winner != 0)
         {
            OverworldHUD.instance.questDialogueUI.show(this.winner,this.taunt);
            OverworldHUD.instance.questDialogueUI.disableClick();
         }
         if(GameEngine.isPlayBackClient())
         {
            this.respawnbutton.setText("Play the game!");
            this.respawnbutton.y = this.continuebutton.y;
         }
      }
      
      internal function addEventListeners() : *
      {
         this.respawnbutton.addEventListener(MouseEvent.CLICK,this.onRespawn);
         this.respawnbutton.addEventListeners();
         this.continuebutton.addEventListener(MouseEvent.CLICK,this.onContinue);
         this.continuebutton.addEventListeners();
      }
      
      internal function removeEventListeners() : *
      {
         this.respawnbutton.removeEventListener(MouseEvent.CLICK,this.onRespawn);
         this.respawnbutton.removeEventListeners();
         this.continuebutton.removeEventListener(MouseEvent.CLICK,this.onContinue);
         this.continuebutton.removeEventListeners();
      }
      
      internal function onRespawn(mouseEvent:MouseEvent) : *
      {
         this.removeEventListeners();
         if(GameEngine.isPlayBackClient())
         {
            QueryManager.instance.showPlayOnlineWebsite();
         }
         else
         {
            GameEngine.stopBattleMode();
         }
      }
      
      internal function onContinue(mouseEvent:MouseEvent) : *
      {
         this.removeEventListeners();
         GameEngine.stopBattleMode();
      }
      
      internal function frame7() : *
      {
         LangManager.initTextField(this.words);
         this.words.text = this.getDisplayText();
      }
      
      internal function frame10() : *
      {
         LangManager.initTextField(this.words);
         this.words.text = this.getDisplayText();
      }
      
      internal function frame11() : *
      {
         LangManager.initTextField(this.words);
         this.words.text = this.getDisplayText();
         if(!GameEngine.isPlayBackClient())
         {
            stop();
         }
         this.showButtons();
      }
      
      internal function frame60() : *
      {
         stop();
         this.showPlaybackModeButton();
      }
   }
}

