package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2889")]
   public class LoseUI extends MovieClip
   {
      
      public static var instance:LoseUI;
      
      public var urltext:TextField;
      
      public var gold:MovieClip;
      
      public var continuebutton:GreyButton;
      
      public var respawnbutton:YellowButton;
      
      public var getgoldpromptdialog:GetGoldPromptDialog;
      
      public var brushStroke:MovieClip;
      
      internal var respawn:Boolean = false;
      
      internal var savereplay:Boolean = false;
      
      internal var payui:PayUI;
      
      public function LoseUI()
      {
         super();
         instance = this;
         this.respawnbutton.setText(LangManager.getString(480));
         this.continuebutton.setText(LangManager.getString(482));
         this.payui = new PayUI();
         addChild(this.payui);
      }
      
      public function show() : *
      {
         this.getgoldpromptdialog.visible = false;
         this.payui.visible = false;
         this.respawnbutton.visible = GameEngine.shouldShowRespawn();
         this.gold.visible = this.respawnbutton.visible;
         this.addEventListeners();
         visible = true;
         this.urltext.visible = false;
         this.brushStroke.gotoAndPlay(1);
         if(NetworkManager.instance.isRecording())
         {
            this.respawnbutton.setText(LangManager.getString(483));
            this.respawnbutton.visible = true;
            this.savereplay = true;
         }
         if(GameEngine.isPvPRoomMode())
         {
            StatsManager.setBuff(StatsManager.BUFF_INJURED,30);
            if(QuestEngine.getNPCData(XMLNpc.INDEX_DUELIST) != null)
            {
               OverworldHUD.instance.questDialogueUI.show(XMLNpc.INDEX_DUELIST,DuelModeUI.instance.getTaunt());
               OverworldHUD.instance.questDialogueUI.disableClick();
               QuestEngine.clearPlayersInNPCData();
            }
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
         this.respawnbutton.visible = false;
         if(this.savereplay)
         {
            NetworkManager.instance.saveRecording();
         }
         else
         {
            StatsManager.spendHeavenlyGold(1,function():*
            {
               QueryManager.instance.reportPremiumBuy(3,"respawn",1);
               removeEventListeners();
               respawn = true;
               StageManager.removeDeadListLatest();
               GameEngine.stopBattleMode();
               respawn = false;
            },function():*
            {
               getgoldpromptdialog.show(1);
               OverworldHUD.instance.questDialogueUI.hideOnly();
            });
         }
      }
      
      internal function onContinue(mouseEvent:MouseEvent) : *
      {
         if(StatsManager.getLevel() < 3)
         {
            this.respawn = true;
            StageManager.removeDeadListLatest();
         }
         this.removeEventListeners();
         GameEngine.stopBattleMode();
         this.urltext.visible = false;
         this.respawn = false;
      }
      
      public function hasRespawn() : Boolean
      {
         return this.respawn;
      }
      
      public function replaySaved() : *
      {
         this.urltext.text = "http://www.strawhatsamuraiduels.com/watch?name=" + StatsManager.charname;
         this.urltext.visible = true;
      }
   }
}

