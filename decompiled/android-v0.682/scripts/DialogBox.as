package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol83")]
   public class DialogBox extends MovieClip
   {
      
      public var button:YellowButton;
      
      public var msgText:TextField;
      
      public var button2:YellowButton;
      
      internal var dontChangeInputModeAfter:Boolean = false;
      
      internal var yesFunction:Function = null;
      
      internal var noFunction:Function = null;
      
      public function DialogBox()
      {
         super();
         LangManager.initTextField(this.msgText);
      }
      
      public function show(msg:String, buttonText:String, showOK:Boolean) : void
      {
         if(OverworldHUD.instance.dialogBig.visible)
         {
            return;
         }
         this.button2.visible = false;
         this.msgText.text = msg;
         this.button.setText(buttonText);
         this.button.addEventListener(MouseEvent.CLICK,this.onClick);
         this.button.addEventListeners();
         if(!GameEngine.isOverworld() && !GameEngine.isTitle())
         {
            InputManager.disableInput();
         }
         this.button.visible = showOK;
         this.button.x = 340;
         if(showOK)
         {
            this.msgText.y = 187.5;
         }
         else
         {
            this.msgText.y = 220;
         }
         this.visible = true;
         var myFormat:TextFormat = new TextFormat();
         if(this.msgText.numLines <= 2)
         {
            myFormat.align = "center";
         }
         else
         {
            myFormat.align = "left";
         }
         this.msgText.defaultTextFormat = myFormat;
         this.msgText.text = msg;
         this.button.removeEventListener(MouseEvent.CLICK,this.onYesClick);
         this.button2.removeEventListener(MouseEvent.CLICK,this.onNoClick);
      }
      
      public function showAP(msg:String, buttonText:String, showOK:Boolean) : void
      {
         if(OverworldHUD.instance.dialogBig.visible)
         {
            return;
         }
         this.msgText.text = msg;
         this.button.setText(buttonText);
         this.button.addEventListener(MouseEvent.CLICK,this.onClick);
         this.button.addEventListeners();
         if(!GameEngine.isOverworld() && !GameEngine.isTitle())
         {
            InputManager.disableInput();
         }
         this.button.visible = showOK;
         this.button.x = 270;
         if(showOK)
         {
            this.msgText.y = 187.5;
         }
         else
         {
            this.msgText.y = 220;
         }
         this.visible = true;
         this.button2.visible = false;
         this.button2.setText(LangManager.getString(227));
         this.button2.addEventListener(MouseEvent.CLICK,this.onClickAP);
         this.button2.addEventListeners();
         if(!GameEngine.isOverworld() && !GameEngine.isTitle())
         {
            InputManager.disableInput();
         }
         this.button2.visible = showOK;
         this.button2.x = 425;
         var myFormat:TextFormat = new TextFormat();
         if(this.msgText.numLines == 1)
         {
            myFormat.align = "center";
         }
         else
         {
            myFormat.align = "left";
         }
         this.msgText.defaultTextFormat = myFormat;
         this.msgText.text = msg;
         this.button.removeEventListener(MouseEvent.CLICK,this.onYesClick);
         this.button2.removeEventListener(MouseEvent.CLICK,this.onNoClick);
      }
      
      public function showYesNoDialog(msg:String, yesFunction:Function = null, noFunction:Function = null, yesText:String = "", noText:String = "") : *
      {
         this.button.visible = true;
         if(noFunction != null)
         {
            if(yesText == "")
            {
               this.button.setText(LangManager.getString(1));
            }
            else
            {
               this.button.setText(yesText);
            }
            this.button.addEventListener(MouseEvent.CLICK,this.onYesClick);
            this.button.addEventListeners();
            this.button.x = 270;
            if(noText == "")
            {
               this.button2.setText(LangManager.getString(0));
            }
            else
            {
               this.button2.setText(noText);
            }
            this.button2.addEventListener(MouseEvent.CLICK,this.onNoClick);
            this.button2.addEventListeners();
            this.button2.x = 425;
            this.button2.visible = true;
         }
         else
         {
            if(yesText == "")
            {
               this.button.setText(LangManager.getString(1));
            }
            else
            {
               this.button.setText(yesText);
            }
            this.button.addEventListener(MouseEvent.CLICK,this.onYesClick);
            this.button.addEventListeners();
            this.button.x = 340;
            this.button2.visible = false;
         }
         this.visible = true;
         if(!GameEngine.isOverworld() && !GameEngine.isTitle())
         {
            InputManager.disableInput();
         }
         var myFormat:TextFormat = new TextFormat();
         myFormat.align = "center";
         this.msgText.defaultTextFormat = myFormat;
         this.msgText.text = msg;
         if(yesFunction != null)
         {
            this.yesFunction = yesFunction;
         }
         else
         {
            this.yesFunction = this.cancelFunction;
         }
         if(noFunction != null)
         {
            this.noFunction = noFunction;
         }
         else
         {
            this.noFunction = this.cancelFunction;
         }
         this.button.removeEventListener(MouseEvent.CLICK,this.onClick);
         this.button2.removeEventListener(MouseEvent.CLICK,this.onClickAP);
      }
      
      public function showHTML(msg:String) : *
      {
         this.msgText.htmlText = msg;
      }
      
      internal function onYesClick(event:MouseEvent) : *
      {
         visible = false;
         this.button.removeEventListener(MouseEvent.CLICK,this.onYesClick);
         this.button.removeEventListeners();
         this.button2.removeEventListener(MouseEvent.CLICK,this.onNoClick);
         this.button2.removeEventListeners();
         this.yesFunction.call();
      }
      
      internal function onNoClick(event:MouseEvent) : *
      {
         visible = false;
         this.button.removeEventListener(MouseEvent.CLICK,this.onYesClick);
         this.button.removeEventListeners();
         this.button2.removeEventListener(MouseEvent.CLICK,this.onNoClick);
         this.button2.removeEventListeners();
         this.noFunction.call();
      }
      
      internal function cancelFunction() : *
      {
         this.button.removeEventListener(MouseEvent.CLICK,this.onYesClick);
         this.button.removeEventListeners();
         this.button2.removeEventListener(MouseEvent.CLICK,this.onNoClick);
         this.button2.removeEventListeners();
         if(GameEngine.isPvPRoomMode())
         {
            InputManager.setBattleMode();
         }
         else if(!this.dontChangeInputModeAfter && !GameEngine.isOverworld() && !GameEngine.isTitle() && !OverworldHUD.instance.inventoryUI.visible && (CutsceneManager.instance == null || !CutsceneManager.instance.isShowing()))
         {
            InputManager.setAdventureMode();
         }
         this.visible = false;
         this.dontChangeInputModeAfter = false;
      }
      
      public function onClick(mouseEvent:MouseEvent) : void
      {
         this.button.removeEventListener(MouseEvent.CLICK,this.onClick);
         this.button.removeEventListeners();
         this.button2.removeEventListener(MouseEvent.CLICK,this.onClickAP);
         this.button2.removeEventListeners();
         if(GameEngine.isPvPRoomMode())
         {
            InputManager.setBattleMode();
         }
         else if(!this.dontChangeInputModeAfter && !GameEngine.isOverworld() && !GameEngine.isTitle() && !OverworldHUD.instance.inventoryUI.visible && (CutsceneManager.instance == null || !CutsceneManager.instance.isShowing()))
         {
            InputManager.setAdventureMode();
         }
         this.visible = false;
         this.dontChangeInputModeAfter = false;
      }
      
      internal function onClickAP(mouseEvent:MouseEvent) : *
      {
         this.button.removeEventListener(MouseEvent.CLICK,this.onClick);
         this.button.removeEventListeners();
         this.button2.removeEventListener(MouseEvent.CLICK,this.onClickAP);
         this.button2.removeEventListeners();
         if(GameEngine.isPvPRoomMode())
         {
            InputManager.setBattleMode();
         }
         else if(!GameEngine.isOverworld() && !GameEngine.isTitle() && !OverworldHUD.instance.inventoryUI.visible)
         {
            InputManager.setAdventureMode();
         }
         Overworld.overworldHUD.showPayUI(mouseEvent);
         this.visible = false;
         this.dontChangeInputModeAfter = false;
      }
      
      public function notifyDontChangeInputModeAfter() : *
      {
         this.dontChangeInputModeAfter = true;
      }
   }
}

