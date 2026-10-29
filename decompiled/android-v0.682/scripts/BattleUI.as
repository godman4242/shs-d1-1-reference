package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2952")]
   public class BattleUI extends MovieClip
   {
      
      public static var instance:BattleUI;
      
      public var chibar:MovieClip;
      
      public var logo:shs3title_english;
      
      public var chitextshadow:TextField;
      
      public var pauseScreen:MovieClip;
      
      public var hpbar:MovieClip;
      
      public var battlemodebust:MovieClip;
      
      public var hptext:TextField;
      
      public var chitext:TextField;
      
      public var chatButton:SimpleButton;
      
      public var playbackendui:PlaybackEndUI;
      
      public var changestancelabel:TextField;
      
      public var hptextshadow:TextField;
      
      public var loseui:LoseUI;
      
      public var chatText:MovieClip;
      
      public var timer:MovieClip;
      
      public var pausebutton:SimpleButton;
      
      public var crittext:TextField;
      
      public var selectedSkill:SkillSlotButton;
      
      public var winui:WinUI;
      
      public var autoslashofflabel:TextField;
      
      public var combo:MovieClip;
      
      public var skillButton:SimpleButton;
      
      public var reloadbar:MovieClip;
      
      public var autoslashbutton:MovieClip;
      
      public var hurtred:MovieClip;
      
      public var autoslashonlabel:TextField;
      
      internal var playerBust:MCSBust;
      
      internal var selectTargetMode:Boolean = false;
      
      internal var skillSlotButtonsArray:Array;
      
      internal var mouseDownX:int;
      
      internal var mouseDownY:int;
      
      internal var hasSelectedSkill:Boolean = false;
      
      internal var selectedSkillButton:SkillSlotButton;
      
      internal var isDraw:Boolean = false;
      
      internal var latency:int = -1;
      
      internal var initiator:Boolean;
      
      internal var chatMode:int;
      
      internal var slotCount:int;
      
      public function BattleUI()
      {
         var skillSlotButton:SkillSlotButton = null;
         this.skillSlotButtonsArray = new Array();
         super();
         instance = this;
         LangManager.initTextField(this.combo.combolabel,true);
         this.combo.combolabel.text = LangManager.getString(45);
         this.combo.mouseEnabled = false;
         LangManager.initTextField(this.crittext);
         this.crittext.text = LangManager.getString(175);
         LangManager.initTextField(this.timer.timertext);
         LangManager.initTextField(this.autoslashonlabel);
         this.autoslashonlabel.mouseEnabled = false;
         LangManager.initTextField(this.autoslashofflabel);
         this.autoslashofflabel.mouseEnabled = false;
         this.autoslashbutton.buttonMode = true;
         LangManager.initTextField(this.changestancelabel,true);
         this.changestancelabel.text = LangManager.getString(208);
         this.changestancelabel.mouseEnabled = false;
         this.battlemodebust.highlight.visible = false;
         this.battlemodebust.buttonMode = true;
         if(StatsManager.language == LangManager.CHINESE)
         {
            this.chatText.words.maxChars = 32;
         }
         else
         {
            this.chatText.words.maxChars = 55;
         }
         LangManager.initTextField(this.chatText.words,false);
         LangManager.initTextField(this.chatText.chatlog,true);
         this.autoslashofflabel.text = LangManager.getString(619);
         this.autoslashonlabel.text = LangManager.getString(620);
         this.chatText.chatlog.text = "";
         this.autoslashofflabel.cacheAsBitmap = true;
         this.autoslashonlabel.cacheAsBitmap = true;
         this.changestancelabel.cacheAsBitmap = true;
         for(var i:int = 0; i < 8; i++)
         {
            skillSlotButton = new SkillSlotButton();
            skillSlotButton.x = 760 - i * 60;
            skillSlotButton.y = 450;
            this.skillSlotButtonsArray.push(skillSlotButton);
            addChild(skillSlotButton);
            skillSlotButton.visible = false;
         }
      }
      
      public function init() : *
      {
         for(var i:int = 0; i < numChildren; i++)
         {
            getChildAt(i).visible = true;
         }
         this.playerBust = StatsManager.createPlayerBust();
         this.battlemodebust.bustcanvas.addChild(this.playerBust);
         this.playerBust.scaleX = 2;
         this.playerBust.scaleY = 2;
         this.hideCombo();
         this.timer.visible = false;
         this.chatText.visible = false;
         if(GameEngine.isPvPRoomMode() && !StatsManager.getChatShowing())
         {
            this.chatText.chatlog.text = "";
         }
         this.chatText.words.text = "";
         this.hurtred.visible = false;
         this.changestancelabel.visible = false;
         this.battlemodebust.highlight.visible = false;
         this.winui.visible = false;
         this.loseui.visible = false;
         this.playbackendui.visible = false;
         this.selectedSkill.visible = false;
         this.selectedSkill.cacheAsBitmap = false;
         this.selectedSkill.initDragButton();
         if(GameEngine.isPvPRoomMode())
         {
            this.chatText.gotoAndStop(2);
         }
         else
         {
            this.chatText.gotoAndStop(1);
         }
         this.enable();
         this.isDraw = false;
         this.chatButton.visible = GameEngine.isDuelMode() || GameEngine.isPvPRoomMode();
         this.pausebutton.visible = !GameEngine.isDuelMode() && !GameEngine.isPvPRoomMode();
         this.pauseScreen.visible = false;
         this.logo.visible = false;
         this.skillButton.visible = false;
         this.initAutoButton();
         this.latency = -1;
         this.doResize();
      }
      
      public function enable() : *
      {
         visible = true;
         this.autoslashbutton.addEventListener(MouseEvent.CLICK,this.autobuttonClick);
         this.battlemodebust.addEventListener(MouseEvent.MOUSE_OVER,this.showChangeStanceLabel);
         this.battlemodebust.addEventListener(MouseEvent.MOUSE_OUT,this.hideChangeStanceLabel);
         for(var i:int = 0; i < 8; i++)
         {
            this.skillSlotButtonsArray[i].addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillButtonDown);
         }
         if(GameEngine.isPvPRoomMode())
         {
            this.chatText.chatModeButton.addEventListener(MouseEvent.CLICK,this.onChatMode);
            this.chatText.chatModeButton.addEventListeners();
         }
         this.chatText.words.addEventListener(MouseEvent.CLICK,this.onChatClick);
         this.chatText.words.addEventListener(KeyboardEvent.KEY_UP,this.onChatTextKeyUp);
         this.initSkillSlotButtons();
      }
      
      public function disable() : *
      {
         visible = false;
         this.selectedSkill.cacheAsBitmap = false;
         this.autoslashbutton.removeEventListener(MouseEvent.CLICK,this.autobuttonClick);
         this.battlemodebust.removeEventListener(MouseEvent.MOUSE_OVER,this.showChangeStanceLabel);
         this.battlemodebust.removeEventListener(MouseEvent.MOUSE_OUT,this.hideChangeStanceLabel);
         for(var i:int = 0; i < 8; i++)
         {
            this.skillSlotButtonsArray[i].removeEventListener(MouseEvent.MOUSE_DOWN,this.onSkillButtonDown);
         }
         if(GameEngine.isPvPRoomMode())
         {
            this.chatText.chatModeButton.removeEventListener(MouseEvent.CLICK,this.onChatMode);
            this.chatText.chatModeButton.removeEventListeners();
         }
         this.chatText.words.removeEventListener(MouseEvent.CLICK,this.onChatClick);
         this.chatText.words.removeEventListener(KeyboardEvent.KEY_UP,this.onChatTextKeyUp);
      }
      
      public function checkSkillDisabled() : *
      {
         var chi:int = StatsManager.getPlayer().getChi();
         for(var i:int = 0; i < 8; i++)
         {
            this.skillSlotButtonsArray[i].checkSkillDisabled(chi);
         }
      }
      
      public function setMax(hp:int, chi:int) : *
      {
      }
      
      public function setReloadMax(reload:int) : *
      {
      }
      
      public function updateHp(hp:int, maxhp:int) : *
      {
         this.hptext.text = hp + "/" + maxhp;
         this.hptextshadow.text = hp + "/" + maxhp;
         this.hpbar.bar.scaleX = hp / maxhp;
      }
      
      public function updateChi(chi:int, maxchi:int) : *
      {
         this.chitext.text = chi + "/" + maxchi;
         this.chitextshadow.text = chi + "/" + maxchi;
         this.chibar.bar.scaleX = chi / maxchi;
      }
      
      public function updateReload(percentage:Number) : *
      {
         this.reloadbar.bar.scaleX = percentage;
         this.crittext.visible = percentage >= 1 && this.reloadbar.visible;
      }
      
      public function gotClicked(mousex:int, mousey:int) : Boolean
      {
         var i:int = 0;
         if(GameEngine.isPaused)
         {
            GameEngine.setPaused(false);
            this.pauseScreen.visible = false;
            return true;
         }
         var player:MCSPlayer = StatsManager.getPlayer();
         if(this.battlemodebust.hitTestPoint(mousex,mousey))
         {
            this.stanceButtonClick();
            InputManager.clearCanvas();
            if(TutorialUI.instance.getState() == 5)
            {
               TutorialUI.instance.setState(0);
            }
            return true;
         }
         if(this.chatButton.visible && this.chatButton.hitTestPoint(mousex,mousey))
         {
            if(GameEngine.isPvPRoomMode())
            {
               if(!this.chatText.visible)
               {
                  OverworldHUD.instance.showPVPChatMode();
                  this.chatText.words.text = LangManager.getString(184);
                  GameEngine.getStageMC().focus = this.chatText.words;
                  this.chatText.words.setSelection(0,this.chatText.words.text.length);
                  this.chatMode = StatsManager.chatMode - 1;
                  this.onChatMode(null);
               }
               else
               {
                  OverworldHUD.instance.showPVPNormalMode();
               }
               StatsManager.setChatShowing(!this.chatText.visible);
            }
            this.chatText.visible = !this.chatText.visible;
            if(this.chatText.visible)
            {
               GameEngine.getStageMC().focus = this.chatText.words;
            }
            else
            {
               GameEngine.getStageMC().focus = GameEngine.getStageMC();
            }
            return true;
         }
         if(this.chatText.visible && Boolean(this.chatText.chatEnterButton.hitTestPoint(mousex,mousey)))
         {
            this.processChat();
            return true;
         }
         if(this.chatText.visible && this.chatText.hitTestPoint(mousex,mousey))
         {
            return true;
         }
         if(this.pausebutton.visible && this.pausebutton.hitTestPoint(mousex,mousey))
         {
            GameEngine.togglePaused();
            this.pauseScreen.visible = true;
            setChildIndex(this.pauseScreen,numChildren - 1);
            return true;
         }
         if(this.autoslashbutton.hitTestPoint(mousex,mousey))
         {
            if(TutorialUI.instance.getState() == 6)
            {
               TutorialUI.instance.setState(0);
            }
            return true;
         }
         if(mousey > 420 * StatsManager.stageScale + StatsManager.stageOffsetY)
         {
            for(i = 0; i < 8; i++)
            {
               if(this.skillSlotButtonsArray[i].hitTestPoint(mousex,mousey))
               {
                  this.onSkillButtonUp();
                  this.skillSlotButtonsArray[i].onClick();
                  return true;
               }
            }
         }
         if(this.selectedSkill.visible)
         {
            this.onSkillButtonUp();
            this.selectedSkillButton.onClick(mousex,mousey);
            return true;
         }
         return false;
      }
      
      internal function stanceButtonClick() : *
      {
         if(StatsManager.getPlayer().canChangeStance())
         {
            StatsManager.getPlayer().nextStance();
         }
         if(GameEngine.isPvPRoomMode())
         {
            StatsManager.stance = StatsManager.getPlayer().getStance();
         }
      }
      
      public function setStanceColor(num:int) : *
      {
         this.battlemodebust.stancecolor1.gotoAndStop(num);
      }
      
      public function setSelectTargetMode() : *
      {
         this.selectTargetMode = true;
      }
      
      public function showCombo(num:int) : *
      {
         if(StageManager.isRedFreeze())
         {
            return;
         }
         this.combo.visible = true;
         this.combo.combo.text = num.toString();
         this.combo.comboshadow.text = num.toString();
      }
      
      public function hideCombo() : *
      {
         this.combo.visible = false;
      }
      
      public function showTimer(flag:Boolean) : *
      {
         this.timer.visible = flag;
      }
      
      public function setTimerNumber(num:int) : *
      {
         if(num < 0)
         {
            num = 0;
            if(StageManager.getAction() == GameEngine.ACTION_SURVIVECLEANUP)
            {
               this.timer.timertext.text = LangManager.getString(868);
               return;
            }
         }
         if(StageManager.getAction() == GameEngine.ACTION_SURVIVE || StageManager.getAction() == GameEngine.ACTION_SURVIVECLEANUP)
         {
            this.timer.timertext.text = LangManager.getString(713) + num.toString();
         }
         else
         {
            this.timer.timertext.text = LangManager.getString(126) + num.toString();
         }
      }
      
      public function showHurtRed() : *
      {
         this.hurtred.visible = true;
         this.hurtred.gotoAndPlay(1);
      }
      
      internal function showChangeStanceLabel(event:MouseEvent) : *
      {
         this.changestancelabel.visible = true;
         this.battlemodebust.highlight.visible = true;
      }
      
      internal function hideChangeStanceLabel(event:MouseEvent) : *
      {
         this.changestancelabel.visible = false;
         this.battlemodebust.highlight.visible = false;
      }
      
      public function showWin() : *
      {
         this.winui.show();
      }
      
      public function showWinButtons() : *
      {
         this.winui.showButtons();
      }
      
      public function showLose() : *
      {
         this.loseui.show();
      }
      
      public function showPlaybackEnd() : *
      {
         this.playbackendui.show();
      }
      
      public function setDraw() : *
      {
         this.isDraw = true;
         this.winui.winwords.gotoAndStop(2);
      }
      
      public function getIsDraw() : Boolean
      {
         return this.isDraw;
      }
      
      public function hideWin() : *
      {
         this.winui.visible = false;
      }
      
      public function hideAll() : *
      {
         for(var i:int = 0; i < numChildren; i++)
         {
            getChildAt(i).visible = false;
         }
         if(this.hasSelectedSkill)
         {
            this.selectedSkill.visible = false;
            this.selectedSkill.cacheAsBitmap = false;
            this.hasSelectedSkill = false;
         }
      }
      
      public function initSkillSlotButtons() : *
      {
         var skillSlotButton:SkillSlotButton = null;
         var equippedSkillsCount:* = StatsManager.skillSlots.length;
         this.slotCount = StatsManager.getSkillSlotCount();
         var chi:int = StatsManager.getPlayer().getChi();
         for(var i:int = 0; i < 8; i++)
         {
            skillSlotButton = this.skillSlotButtonsArray[i];
            skillSlotButton.visible = i < this.slotCount;
            if(i < equippedSkillsCount && StatsManager.skillSlots[i] != null)
            {
               skillSlotButton.initKeyPressText(this.slotCount - i);
               skillSlotButton.initSkill(StatsManager.skillSlots[i]);
               skillSlotButton.checkSkillDisabled(chi);
            }
            else
            {
               skillSlotButton.initEmpty();
            }
         }
      }
      
      public function update() : *
      {
         var player:MCSPlayer = null;
         var mouseX:int = 0;
         var mouseY:int = 0;
         for(var i:int = 0; i < 8; i++)
         {
            this.skillSlotButtonsArray[i].update();
         }
         if(this.hasSelectedSkill)
         {
            player = StatsManager.getPlayer();
            if(!(player.canChangeStance() || player.isCharging()))
            {
               this.hasSelectedSkill = false;
               this.selectedSkill.visible = false;
               this.selectedSkill.cacheAsBitmap = false;
            }
            else
            {
               mouseX = (GameEngine.getStageMC().mouseX - StatsManager.stageOffsetX) / StatsManager.stageScale;
               mouseY = (GameEngine.getStageMC().mouseY - StatsManager.stageOffsetY) / StatsManager.stageScale;
               this.selectedSkill.x = mouseX;
               this.selectedSkill.y = mouseY;
               if(!this.selectedSkill.visible && ((this.mouseDownX - mouseX) * (this.mouseDownX - mouseX) > 100 || (this.mouseDownY - mouseY) * (this.mouseDownY - mouseY) > 100))
               {
                  this.selectedSkill.visible = true;
                  this.selectedSkill.cacheAsBitmap = true;
               }
               this.selectedSkill.shade.gotoAndStop(1);
            }
         }
      }
      
      public function readyAllSkills() : *
      {
         for(var i:int = 0; i < 8; i++)
         {
            this.skillSlotButtonsArray[i].cooldown = 1;
         }
      }
      
      public function numberKeyPressed(num:int) : *
      {
         if(num > this.slotCount || this.hasSelectedSkill)
         {
            return;
         }
         var skillButton:SkillSlotButton = this.skillSlotButtonsArray[this.slotCount - num];
         if(skillButton.canDrag())
         {
            this.selectedSkill.initSkill(new IntStat(skillButton.getSkillId(),skillButton.getSkillLevel()));
            this.hasSelectedSkill = true;
            this.mouseDownX = (GameEngine.getStageMC().mouseX - StatsManager.stageOffsetX) / StatsManager.stageScale;
            this.mouseDownY = (GameEngine.getStageMC().mouseY - StatsManager.stageOffsetY) / StatsManager.stageScale;
            this.selectedSkillButton = skillButton;
            if(skillButton.getSkillId() == SkillManager.SKILL_CHARGEDSHOT || skillButton.getSkillId() == SkillManager.SKILL_SHUNPO || skillButton.getSkillId() == SkillManager.SKILL_THOUSANDSTABS || skillButton.getSkillId() == SkillManager.SKILL_DEADLYCLEAVE)
            {
               SkillManager.getInstance().startSkill(skillButton.getSkillId(),skillButton.getSkillLevel(),StatsManager.getPlayer(),null,null,0,0);
            }
         }
      }
      
      public function numberKeyReleased(num:int) : *
      {
         if(num > this.slotCount)
         {
            return;
         }
         this.onSkillButtonUp();
         if(this.selectedSkillButton != null)
         {
            this.selectedSkillButton.onClick();
         }
         this.selectedSkillButton = null;
         this.hasSelectedSkill = false;
      }
      
      internal function onSkillButtonDown(event:MouseEvent) : *
      {
         var skillButton:SkillSlotButton = null;
         var mouseX:int = (event.stageX - StatsManager.stageOffsetX) / StatsManager.stageScale;
         var mouseY:int = (event.stageY - StatsManager.stageOffsetY) / StatsManager.stageScale;
         skillButton = event.target.parent;
         if(mouseY < 435)
         {
            return;
         }
         if(skillButton.canDrag())
         {
            this.selectedSkill.initSkill(new IntStat(skillButton.getSkillId(),skillButton.getSkillLevel()));
            this.hasSelectedSkill = true;
            this.mouseDownX = mouseX;
            this.mouseDownY = mouseY;
            this.selectedSkillButton = skillButton;
            if(skillButton.getSkillId() == SkillManager.SKILL_CHARGEDSHOT || skillButton.getSkillId() == SkillManager.SKILL_SHUNPO || skillButton.getSkillId() == SkillManager.SKILL_THOUSANDSTABS || skillButton.getSkillId() == SkillManager.SKILL_DEADLYCLEAVE)
            {
               SkillManager.getInstance().startSkill(skillButton.getSkillId(),skillButton.getSkillLevel(),StatsManager.getPlayer(),null,null,0,0);
            }
         }
      }
      
      internal function onSkillButtonUp() : *
      {
         var player:MCSPlayer = null;
         if(this.selectedSkill.visible && this.selectedSkill.getSkillId() != SkillManager.SKILL_DASHRIGHT && this.selectedSkill.getSkillId() != SkillManager.SKILL_DASHLEFT)
         {
            player = StatsManager.getPlayer();
            if(this.selectedSkill.x < player.mcs.x)
            {
               player.mcs.faceLeft();
            }
            else
            {
               player.mcs.faceRight();
            }
         }
         this.selectedSkill.visible = false;
         this.selectedSkill.cacheAsBitmap = false;
         this.hasSelectedSkill = false;
      }
      
      public function isDraggingSkill() : Boolean
      {
         return this.hasSelectedSkill;
      }
      
      public function playerGotHit() : *
      {
         if(this.isDraggingSkill() && (this.selectedSkill.getSkillId() == SkillManager.SKILL_CHARGEDSHOT || this.selectedSkill.getSkillId() == SkillManager.SKILL_SHUNPO || this.selectedSkill.getSkillId() == SkillManager.SKILL_THOUSANDSTABS || this.selectedSkill.getSkillId() == SkillManager.SKILL_DEADLYCLEAVE))
         {
            this.selectedSkill.visible = false;
            this.selectedSkill.cacheAsBitmap = false;
            this.hasSelectedSkill = false;
            this.selectedSkillButton.restartCooldown();
         }
      }
      
      internal function onChatTextKeyUp(keyboardEvent:KeyboardEvent) : *
      {
         if(keyboardEvent.keyCode == 13)
         {
            this.processChat();
         }
      }
      
      internal function processChat() : *
      {
         var censoredWords:String = null;
         var color:String = null;
         var side:int = 0;
         var strArray:Array = this.chatText.words.text.split(" ");
         switch(strArray[0])
         {
            case "/fart":
               SoundManager.instance.playFart();
               NetworkManager.instance.startAnim("fart");
               break;
            case "/ping":
               if(!GameEngine.isPvPRoomMode())
               {
                  NetworkManager.instance.duelPing(false);
               }
               break;
            case "/seppuku":
               StatsManager.getPlayer().startAnim(MCSActor.SEPPUKU_START);
               NetworkManager.instance.startAnim(MCSActor.SEPPUKU_START);
               break;
            case "/ally":
               if(strArray.length == 2)
               {
                  NPCManager.addAlly(strArray[1]);
                  if(GameEngine.isPvPRoomMode())
                  {
                     this.updateChatLogWordsOnly(NPCManager.getAllyListString());
                  }
               }
               break;
            case "/stopally":
               if(strArray.length == 2)
               {
                  NPCManager.removeAlly(strArray[1]);
                  if(GameEngine.isPvPRoomMode())
                  {
                     this.updateChatLogWordsOnly(NPCManager.getAllyListString());
                  }
               }
               break;
            case "/showally":
               if(GameEngine.isPvPRoomMode())
               {
                  this.updateChatLogWordsOnly(NPCManager.getAllyListString());
               }
               break;
            default:
               censoredWords = OverworldHUD.instance.censorWords(this.chatText.words.text);
               if(censoredWords != "")
               {
                  if(GameEngine.isPvPRoomMode())
                  {
                     color = "#FFFFFF";
                     if(this.chatMode == 2)
                     {
                        side = StatsManager.getSide();
                        if(side == 1)
                        {
                           color = "#FF0000";
                        }
                        else if(side == 2)
                        {
                           color = "#00FF00";
                        }
                        else if(side == 3)
                        {
                           color = "#00FFFF";
                        }
                        else if(side == 4)
                        {
                           color = "#FFCC00";
                        }
                        else if(StatsManager.isCustomClan(side))
                        {
                           color = "#FF9900";
                        }
                     }
                     else if(this.chatMode == 1)
                     {
                        color = "#CCCCCC";
                     }
                     if(!StatsManager.hasBuff(StatsManager.BUFF_FULLMUTE))
                     {
                        this.updateChatLog(StatsManager.charname,censoredWords,color);
                        if(!StatsManager.hasBuff(StatsManager.BUFF_MUTE))
                        {
                           if(this.chatMode == 1)
                           {
                              NetworkManager.getInstance().duelChat(censoredWords);
                           }
                           else
                           {
                              NetworkManager.getInstance().globalChat(censoredWords,this.chatMode);
                           }
                        }
                     }
                  }
                  else
                  {
                     NetworkManager.getInstance().duelChat(censoredWords);
                     this.updateChatLog(StatsManager.charname,censoredWords,"#FFCC00");
                  }
                  QueryManager.instance.logMessage(censoredWords);
               }
         }
         this.chatText.words.text = "";
      }
      
      public function updateChatLog(speaker:String, words:String, color:String = "") : *
      {
         var strArray:Array = null;
         if(speaker == "")
         {
            this.updateChatLogWordsOnly(words,color);
            return;
         }
         var firstChar:String = speaker.substr(0,1);
         var restOfString:String = speaker.substr(1,speaker.length);
         speaker = firstChar.toUpperCase() + restOfString;
         if(color != "")
         {
            this.chatText.chatlog.htmlText += "<b><font color=\'" + color + "\'>" + speaker + ":   " + words + "</font></b>";
         }
         else
         {
            this.chatText.chatlog.htmlText += "<b>" + speaker + ":   " + words + "</b>";
         }
         if(this.chatText.chatlog.numLines > 50)
         {
            strArray = this.chatText.chatlog.htmlText.split("</P>");
            strArray.splice(0,1);
            this.chatText.chatlog.htmlText = strArray.join("</P>") + "</P>";
         }
         if(this.chatText.chatlog.numLines > 10)
         {
            this.chatText.chatlog.scrollV = this.chatText.chatlog.maxScrollV;
         }
      }
      
      public function updateChatLogWordsOnly(words:String, color:String = "") : *
      {
         var strArray:Array = null;
         if(color != "")
         {
            this.chatText.chatlog.htmlText += "<b><font color=\'" + color + "\'>" + words + "</font></b>";
         }
         else
         {
            this.chatText.chatlog.htmlText += "<b>" + words + "</b>";
         }
         if(this.chatText.chatlog.numLines > 50)
         {
            strArray = this.chatText.chatlog.htmlText.split("</P>");
            strArray.splice(0,1);
            this.chatText.chatlog.htmlText = strArray.join("</P>") + "</P>";
         }
         if(this.chatText.chatlog.numLines > 10)
         {
            this.chatText.chatlog.scrollV = this.chatText.chatlog.maxScrollV;
         }
      }
      
      public function keepChatOpen() : *
      {
         if(!this.chatText.visible)
         {
            OverworldHUD.instance.showPVPChatMode();
            this.chatText.words.text = LangManager.getString(184);
            GameEngine.getStageMC().focus = this.chatText.words;
            this.chatText.words.setSelection(0,this.chatText.words.text.length);
            this.chatMode = StatsManager.chatMode - 1;
            this.onChatMode(null);
         }
         this.chatText.visible = true;
         if(this.chatText.visible)
         {
            GameEngine.getStageMC().focus = this.chatText.words;
         }
      }
      
      internal function onChatMode(event:MouseEvent) : *
      {
         ++this.chatMode;
         if(this.chatMode == 3 || this.chatMode == 2 && StatsManager.getSide() == 0)
         {
            this.chatMode = 0;
         }
         if(this.chatMode == 0)
         {
            this.chatText.chatModeButton.setText(LangManager.getString(419));
         }
         else if(this.chatMode == 1)
         {
            this.chatText.chatModeButton.setText(LangManager.getString(420));
         }
         else if(this.chatMode == 2)
         {
            this.chatText.chatModeButton.setText(LangManager.getString(421));
         }
         StatsManager.chatMode = this.chatMode;
      }
      
      internal function onChatClick(mouseEvent:MouseEvent) : *
      {
         mouseEvent.stopPropagation();
         if(this.chatText.words.text == LangManager.getString(184))
         {
            this.chatText.words.text = "";
         }
      }
      
      internal function autobuttonClick(event:Event) : *
      {
         if(StageManager.isRedFreeze() || GameEngine.isPvPRoomMode())
         {
            return;
         }
         StatsManager.toggleAutoSlash();
         this.initAutoButton();
         TutorialUI.instance.setState(0);
      }
      
      internal function initAutoButton() : *
      {
         var player:MCSPlayer = StatsManager.getPlayer();
         if(!StatsManager.autoSlash)
         {
            this.autoslashbutton.gotoAndStop(1);
            this.autoslashofflabel.visible = true;
            this.autoslashonlabel.visible = false;
            player.setAutoSlash(false);
            InputManager.setBattleMode();
         }
         else
         {
            this.autoslashbutton.gotoAndStop(2);
            this.autoslashofflabel.visible = false;
            this.autoslashonlabel.visible = true;
            player.setAutoSlash(true);
            InputManager.setBattleAutoSlashMode();
         }
      }
      
      public function setLatency(num:int) : *
      {
         if(num != 0)
         {
            this.updateChatLog("latency",num.toString() + " ms");
         }
         this.latency = num;
         if(StageManager.timeCounter >= 3 && StageManager.isPeaceful())
         {
            StageManager.setActionState(StageManager.STATE_BATTLE);
         }
      }
      
      public function hasLatency() : Boolean
      {
         return this.latency != -1;
      }
      
      public function getLatency() : int
      {
         return this.latency;
      }
      
      public function doResize() : *
      {
         scaleX = StatsManager.stageScale;
         scaleY = StatsManager.stageScale;
         x = StatsManager.stageOffsetX;
         y = StatsManager.stageOffsetY;
         GameEngine.placeBlockers();
      }
   }
}

