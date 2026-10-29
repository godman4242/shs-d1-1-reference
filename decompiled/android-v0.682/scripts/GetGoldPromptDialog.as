package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2876")]
   public class GetGoldPromptDialog extends MovieClip
   {
      
      public var yesbutton:YellowButton;
      
      public var gold1:MovieClip;
      
      public var msgText:TextField;
      
      public var gold2:MovieClip;
      
      public var nobutton:GreyButton;
      
      internal var dontChangeInputModeAfter:Boolean = true;
      
      internal var promptmode:int;
      
      internal var MODE_GETGOLD:int = 0;
      
      internal var MODE_GETAP:int = 1;
      
      internal var MODE_GETDT:int = 2;
      
      internal var MODE_REPAIRWEAPON:int = 3;
      
      internal var MODE_GETDAILYPRIZE:int = 4;
      
      internal var MODE_GETSTORAGE:int = 5;
      
      internal var MODE_GETGOLDGETAP:int = 11;
      
      internal var MODE_GETGOLDGETDT:int = 12;
      
      internal var MODE_GETGOLDREPAIRWEAPON:int = 13;
      
      internal var MODE_GETGOLDGETSTORAGE:int = 14;
      
      public function GetGoldPromptDialog()
      {
         super();
         LangManager.initTextField(this.msgText);
         this.yesbutton.setText("yes");
         this.nobutton.setText("no");
      }
      
      public function show(num:int) : *
      {
         if(QueryManager.instance.offlineMode)
         {
            return;
         }
         this.promptmode = this.MODE_GETGOLD;
         this.msgText.text = "You need " + num + " more gold.\nWould you like to get more gold?";
         if(GameEngine.isAdventureMode())
         {
            InputManager.disableInput();
         }
         this.visible = true;
         this.addEventListeners();
         this.gold1.visible = false;
         this.gold2.visible = false;
      }
      
      public function showAP() : *
      {
         if(StatsManager.getStat(40001) == 0)
         {
            StatsManager.setStat(13,StatsManager.getStat(StatsManager.STAT_MAXAP));
            StatsManager.setStat(40001,1);
            OverworldHUD.instance.updateHUD();
            OverworldHUD.instance.showDialogBig(LangManager.getString(210),LangManager.getString(5));
            return;
         }
         if(QueryManager.instance.offlineMode)
         {
            return;
         }
         this.promptmode = this.MODE_GETAP;
         this.msgText.text = LangManager.getString(100);
         if(GameEngine.isAdventureMode())
         {
            InputManager.disableInput();
         }
         this.visible = true;
         this.addEventListeners();
         this.dontChangeInputModeAfter = false;
         this.gold1.visible = true;
         this.gold2.visible = false;
      }
      
      public function showIncreaseStorage() : *
      {
         if(QueryManager.instance.offlineMode)
         {
            return;
         }
         this.promptmode = this.MODE_GETSTORAGE;
         this.msgText.text = LangManager.getString(701);
         this.visible = true;
         this.addEventListeners();
         this.dontChangeInputModeAfter = true;
         this.gold1.visible = true;
         this.gold2.visible = false;
      }
      
      public function showDT() : *
      {
         if(QueryManager.instance.offlineMode)
         {
            return;
         }
         this.promptmode = this.MODE_GETDT;
         this.msgText.text = LangManager.getString(61);
         if(GameEngine.isAdventureMode())
         {
            InputManager.disableInput();
         }
         this.visible = true;
         this.addEventListeners();
         this.gold1.visible = true;
         this.gold2.visible = false;
      }
      
      public function showRepairWeapon() : *
      {
         if(QueryManager.instance.offlineMode)
         {
            return;
         }
         this.promptmode = this.MODE_REPAIRWEAPON;
         this.msgText.text = LangManager.getString(669);
         if(GameEngine.isAdventureMode())
         {
            InputManager.disableInput();
         }
         this.visible = true;
         this.addEventListeners();
         this.dontChangeInputModeAfter = false;
         this.gold1.visible = true;
         this.gold2.visible = true;
      }
      
      public function showGetDailyPrize() : *
      {
         if(QueryManager.instance.offlineMode)
         {
            return;
         }
         this.promptmode = this.MODE_GETDAILYPRIZE;
         this.msgText.text = "Your daily prize is ready to be claimed from ninja services! Would you like to claim it now?";
         if(GameEngine.isAdventureMode())
         {
            InputManager.disableInput();
         }
         this.visible = true;
         this.addEventListeners();
         this.gold1.visible = false;
         this.gold2.visible = false;
         this.dontChangeInputModeAfter = false;
      }
      
      internal function addEventListeners() : *
      {
         this.yesbutton.addEventListener(MouseEvent.CLICK,this.onYesClick);
         this.yesbutton.addEventListeners();
         this.nobutton.addEventListener(MouseEvent.CLICK,this.onNoClick);
         this.nobutton.addEventListeners();
      }
      
      internal function removeEventListeners() : *
      {
         this.yesbutton.removeEventListener(MouseEvent.CLICK,this.onYesClick);
         this.yesbutton.removeEventListeners();
         this.nobutton.removeEventListener(MouseEvent.CLICK,this.onNoClick);
         this.nobutton.removeEventListeners();
      }
      
      public function onYesClick(mouseEvent:MouseEvent) : *
      {
         this.removeEventListeners();
         this.visible = false;
         if(this.promptmode == this.MODE_GETGOLD)
         {
            if(GameEngine.gameMode == GameEngine.MODE_BATTLEENDLOSE)
            {
               LoseUI.instance.payui.show();
            }
            else
            {
               OverworldHUD.instance.payUI.show();
            }
         }
         else if(this.promptmode == this.MODE_GETAP)
         {
            StatsManager.spendHeavenlyGold(1,function():*
            {
               StatsManager.changeStat(StatsManager.STAT_AP,10);
               OverworldHUD.instance.updateHUD(true);
               onNoClick(null);
            },function():*
            {
               show(1);
               promptmode = MODE_GETGOLDGETAP;
            });
         }
         else if(this.promptmode == this.MODE_GETSTORAGE)
         {
            StatsManager.spendHeavenlyGold(1,function():*
            {
               BankUI.instance.onIncreaseClick(null);
               onNoClick(null);
            },function():*
            {
               show(1);
               promptmode = MODE_GETGOLDGETSTORAGE;
            });
         }
         else if(this.promptmode == this.MODE_REPAIRWEAPON)
         {
            if(StatsManager.getHeavenlyGold() >= 2)
            {
               OverworldHUD.instance.changeNameDialog.show(ChangeNameDialog.MODE_NAMEWEAPON);
            }
            else
            {
               this.show(2 - StatsManager.getHeavenlyGold());
               this.promptmode = this.MODE_GETGOLDREPAIRWEAPON;
            }
         }
         else if(this.promptmode == this.MODE_GETDAILYPRIZE)
         {
            OverworldHUD.instance.interactUI.show(InteractUI.UIMODE_GETCOINS,4);
         }
         else if(this.promptmode == this.MODE_GETGOLDREPAIRWEAPON)
         {
            OverworldHUD.instance.payUI.show();
            this.showRepairWeapon();
         }
         else if(this.promptmode == this.MODE_GETGOLDGETAP)
         {
            OverworldHUD.instance.payUI.show();
            this.showAP();
         }
         else if(this.promptmode == this.MODE_GETGOLDGETDT)
         {
            OverworldHUD.instance.payUI.show();
            this.showDT();
         }
         else if(this.promptmode == this.MODE_GETGOLDGETSTORAGE)
         {
            OverworldHUD.instance.payUI.show();
            this.showIncreaseStorage();
         }
      }
      
      public function onNoClick(mouseEvent:MouseEvent) : *
      {
         this.removeEventListeners();
         if(this.promptmode == this.MODE_GETGOLDGETAP)
         {
            this.showAP();
         }
         else if(this.promptmode == this.MODE_GETGOLDGETDT)
         {
            this.showDT();
         }
         else if(this.promptmode == this.MODE_GETGOLDGETSTORAGE)
         {
            this.showIncreaseStorage();
         }
         else if(this.promptmode == this.MODE_GETGOLDREPAIRWEAPON)
         {
            this.showRepairWeapon();
         }
         else
         {
            if(!this.dontChangeInputModeAfter && GameEngine.isAdventureMode())
            {
               InputManager.setAdventureMode();
            }
            this.visible = false;
            this.dontChangeInputModeAfter = true;
         }
         if(this.promptmode == this.MODE_REPAIRWEAPON)
         {
            OverworldHUD.instance.showDialogBig(LangManager.getString(393),LangManager.getString(5));
         }
      }
      
      public function notifyChangeInputModeAfter() : *
      {
         this.dontChangeInputModeAfter = false;
      }
   }
}

