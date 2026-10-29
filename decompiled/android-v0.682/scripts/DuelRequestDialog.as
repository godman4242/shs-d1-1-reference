package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.utils.Timer;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol862")]
   public class DuelRequestDialog extends MovieClip
   {
      
      public var nameWords:TextField;
      
      public var challengeWords:TextField;
      
      public var acceptButton:YellowButton;
      
      public var timertext:TextField;
      
      public var declineButton:GreyButton;
      
      internal var sender:String;
      
      internal var timerCounter:int;
      
      internal var timer:Timer = new Timer(1000);
      
      internal var wasAdventureMode:Boolean = false;
      
      internal var declinedMode:Boolean = false;
      
      public function DuelRequestDialog()
      {
         super();
         LangManager.initTextField(this.nameWords,true);
         LangManager.initTextField(this.challengeWords);
      }
      
      public function addEventListeners() : void
      {
         this.acceptButton.addEventListener(MouseEvent.CLICK,this.onAccept);
         this.acceptButton.addEventListeners();
         this.declineButton.addEventListener(MouseEvent.CLICK,this.onDecline);
         this.declineButton.addEventListeners();
         if(!this.declinedMode)
         {
            this.timer.start();
            this.timer.addEventListener(TimerEvent.TIMER,this.timerListener);
         }
      }
      
      public function removeEventListeners() : void
      {
         this.acceptButton.removeEventListener(MouseEvent.CLICK,this.onAccept);
         this.acceptButton.removeEventListeners();
         this.declineButton.removeEventListener(MouseEvent.CLICK,this.onDecline);
         this.declineButton.removeEventListeners();
         if(!this.declinedMode)
         {
            this.timer.stop();
            this.timer.removeEventListener(TimerEvent.TIMER,this.timerListener);
         }
      }
      
      internal function onAccept(mouseEvent:MouseEvent) : void
      {
         if(!this.declinedMode)
         {
            if(OverworldHUD.instance.inventoryUI.visible)
            {
               OverworldHUD.instance.inventoryUI.onLeave(null);
            }
            this.removeEventListeners();
            NetworkManager.getInstance().duelResponse(true,this.sender);
            this.visible = false;
            DuelModeUI.instance.proceedWithHumanOpponent(this.sender,false);
            Tracker.instance.trackAcceptedDuelChallenge();
         }
         else
         {
            DuelModeUI.instance.proceedWithAI();
         }
      }
      
      internal function onDecline(mouseEvent:MouseEvent) : void
      {
         this.removeEventListeners();
         this.visible = false;
         if(!this.declinedMode)
         {
            NetworkManager.getInstance().duelResponse(false,this.sender);
            Tracker.instance.trackDeclinedDuelChallenge();
            if(!GameEngine.isOverworld() && this.wasAdventureMode)
            {
               InputManager.setAdventureMode();
               OverworldHUD.instance.unHideAll();
            }
         }
         else
         {
            DuelModeUI.instance.onLeave(null);
            OverworldHUD.instance.unHideAll();
            OverworldHUD.instance.initForAdventureMode();
            InputManager.setAdventureMode();
            NetworkManager.getInstance().duelEnd();
         }
      }
      
      public function onCancel() : *
      {
         this.onDecline(null);
      }
      
      public function show(msg:Object, sender:String) : void
      {
         this.declinedMode = false;
         this.challengeWords.text = LangManager.getString(177);
         this.acceptButton.setText(LangManager.getString(178));
         this.declineButton.setText(LangManager.getString(179));
         DuelModeUI.instance.setOpponentFields(msg.charname,msg.charlvl,msg.stats,msg.equip,msg.skills,msg.taunt);
         DuelModeUI.instance.setBG(msg.bg);
         this.wasAdventureMode = InputManager.inputMode == InputManager.ADVENTURE_MODE;
         if(!GameEngine.isOverworld() && this.wasAdventureMode)
         {
            InputManager.disableInput();
         }
         this.addEventListeners();
         this.sender = sender;
         this.nameWords.text = msg.charname + " (" + LangManager.getString(47) + msg.charlvl + ")";
         this.timerCounter = 10;
         this.timertext.text = "10";
         this.visible = true;
      }
      
      internal function timerListener(e:TimerEvent) : *
      {
         --this.timerCounter;
         this.timertext.text = this.timerCounter.toString();
         if(this.timerCounter == 0)
         {
            this.onDecline(null);
         }
      }
      
      public function showDeclinedMode(msg:String) : *
      {
         if(visible)
         {
            return;
         }
         DuelModeUI.instance.stopDuelCounter();
         this.declinedMode = true;
         if(msg == "0")
         {
            this.challengeWords.text = LangManager.getString(468);
         }
         else if(msg == "2")
         {
            this.challengeWords.text = LangManager.getString(641);
         }
         else if(msg == "3")
         {
            this.challengeWords.text = LangManager.getString(642);
         }
         this.acceptButton.setText(LangManager.getString(469));
         this.declineButton.setText(LangManager.getString(470));
         this.timertext.text = "";
         this.addEventListeners();
         this.nameWords.text = DuelModeUI.instance.selectedOpponentName + " (" + LangManager.getString(47) + DuelModeUI.instance.selectedOpponentLvl + ")";
         this.visible = true;
         this.wasAdventureMode = false;
      }
   }
}

