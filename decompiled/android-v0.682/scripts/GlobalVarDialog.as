package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol988")]
   public class GlobalVarDialog extends MovieClip
   {
      
      public var button:YellowButton;
      
      public var titleText:TextField;
      
      public var globalText:TextField;
      
      internal var globalVarList:Vector.<IntStat> = new Vector.<IntStat>();
      
      internal var dontRefreshAfter:Boolean = false;
      
      internal var dontChangeInputModeAfter:Boolean = false;
      
      internal var additionalText:String = "";
      
      public function GlobalVarDialog()
      {
         super();
         this.button.setText(LangManager.getString(5));
         LangManager.initTextField(this.titleText,true);
         LangManager.initTextField(this.globalText,false);
      }
      
      public function show() : *
      {
         var globalVar:IntStat = null;
         if(!this.hasGlobalVar())
         {
            this.button.removeEventListener(MouseEvent.CLICK,this.onClick);
            this.button.removeEventListeners();
            this.visible = false;
            return;
         }
         this.button.setText(LangManager.getString(5));
         this.button.addEventListener(MouseEvent.CLICK,this.onClick);
         this.button.addEventListeners();
         this.visible = true;
         this.titleText.text = LangManager.getString(288);
         var max:int = int(this.globalVarList.length);
         var str:String = "";
         for(var i:int = 0; i < max; i++)
         {
            globalVar = this.globalVarList[i];
            str += this.getGlobalVarLabel(globalVar.getId());
            str += "<font color=\'#CCCCCC\'>";
            if(globalVar.getValue() > 0 && globalVar.getId() != 50006)
            {
               str += "+";
            }
            str += globalVar.getValue() + "</font><br>";
         }
         str += this.additionalText;
         this.globalText.htmlText = str;
         this.clearGlobalVar();
         OverworldHUD.instance.initForCutscene();
      }
      
      internal function getGlobalVarLabel(num:int) : String
      {
         switch(num)
         {
            case 50000:
               return "<font color=\'#FF0000\'>" + LangManager.getString(289) + ":  </font>";
            case 50001:
               return "<font color=\'#00FF00\'>" + LangManager.getString(290) + ":  </font>";
            case 50002:
               return "<font color=\'#00FFFF\'>" + LangManager.getString(291) + ":  </font>";
            case 50003:
               return "<font color=\'#FFFF00\'>" + LangManager.getString(292) + ":  </font>";
            case 50004:
               return "<font color=\'#6666FF\'>" + LangManager.getString(293) + ":  </font>";
            case 50005:
               return "<font color=\'#FFFFFF\'>" + LangManager.getString(303) + ":  </font>";
            case 50006:
               return "<font color=\'#FFFFFF\'>" + LangManager.getString(352) + ":  </font>";
            case 50007:
               return "<font color=\'#FFFFFF\'>" + LangManager.getString(454) + ":  </font>";
            case 50008:
               return "<font color=\'#FF0000\'>" + LangManager.getString(497) + ":  </font>";
            case 50009:
               return "<font color=\'#00FF00\'>" + LangManager.getString(498) + ":  </font>";
            case 50010:
               return "<font color=\'#00FFFF\'>" + LangManager.getString(499) + ":  </font>";
            case 50011:
               return "<font color=\'#FFFF00\'>" + LangManager.getString(450) + ":  </font>";
            case 50012:
               return "<font color=\'#FFFFFF\'>" + LangManager.getString(451) + ":  </font>";
            case 50013:
               return "<font color=\'#FF0000\'>" + LangManager.getString(502) + ":  </font>";
            case 50014:
               return "<font color=\'#00FF00\'>" + LangManager.getString(503) + ":  </font>";
            case 50015:
               return "<font color=\'#00FFFF\'>" + LangManager.getString(504) + ":  </font>";
            case 50016:
               return "<font color=\'#FFFF00\'>" + LangManager.getString(505) + ":  </font>";
            case 50017:
               return "<font color=\'#FFFFFF\'>" + LangManager.getString(506) + ":  </font>";
            case 50018:
               return "<font color=\'" + StatsManager.getCustomClanTextColor() + "\'>" + LangManager.getString(812) + ":  </font>";
            case 50019:
               return "<font color=\'#FFFFFF\'>" + LangManager.getString(638) + ":  </font>";
            default:
               return "?";
         }
      }
      
      public function onClick(mouseEvent:MouseEvent) : void
      {
         this.button.removeEventListener(MouseEvent.CLICK,this.onClick);
         this.button.removeEventListeners();
         this.visible = false;
         if(OverworldHUD.instance.lootDialog.visible)
         {
            return;
         }
         if(OverworldHUD.instance.warUI.visible)
         {
            return;
         }
         if(!this.dontChangeInputModeAfter)
         {
            if(GameEngine.isAdventureMode())
            {
               OverworldHUD.instance.initForAdventureMode();
               InputManager.setAdventureMode();
               if(!this.dontRefreshAfter)
               {
                  OverworldHUD.instance.screenTransition.startClose(ScreenTransition.ACTION_REFRESHROOM);
               }
            }
            else if(GameEngine.isOverworld())
            {
               OverworldHUD.instance.initForOverworld();
            }
            else
            {
               GameEngine.stopBattleMode();
            }
         }
         this.dontRefreshAfter = false;
         this.dontChangeInputModeAfter = false;
      }
      
      public function addGlobalVar(id:int, value:int) : *
      {
         this.globalVarList.push(new IntStat(id,value));
      }
      
      public function hasGlobalVar() : Boolean
      {
         return this.globalVarList.length > 0;
      }
      
      public function clearGlobalVar() : *
      {
         this.globalVarList.length = 0;
         this.additionalText = "";
      }
      
      public function notifyDontRefreshAfter() : *
      {
         this.dontRefreshAfter = true;
      }
      
      public function notifyDontChangeInputModeAfter() : *
      {
         this.dontChangeInputModeAfter = true;
      }
      
      internal function getClanColor(side:int) : String
      {
         if(side == 0)
         {
            return "#FFFFFF";
         }
         if(side == 1)
         {
            return "#FF0000";
         }
         if(side == 2)
         {
            return "#00FF00";
         }
         if(side == 3)
         {
            return "#00FFFF";
         }
         if(side == 4)
         {
            return "#FFFF00";
         }
         if(side == 5)
         {
            return "#FFFFFF";
         }
         if(StatsManager.isCustomClan(side))
         {
            return StatsManager.getCustomClanTextColor();
         }
         return "#FFFFFF";
      }
      
      public function updateTownProsperity(value:int, side:int, terrx:int, terry:int) : *
      {
         this.globalVarList.push(new IntStat(50007,value));
         if(NodeGenerator.instance.getNodeLevel(StageManager.getCurrentNode()) <= 5 || side == 0)
         {
            return;
         }
         if(side == 1)
         {
            this.globalVarList.push(new IntStat(50013,5));
         }
         else if(side == 2)
         {
            this.globalVarList.push(new IntStat(50014,5));
         }
         else if(side == 3)
         {
            this.globalVarList.push(new IntStat(50015,5));
         }
         else if(side == 4)
         {
            this.globalVarList.push(new IntStat(50016,5));
         }
         else if(side == 5)
         {
            this.globalVarList.push(new IntStat(50017,5));
         }
         else if(StatsManager.isCustomClan(side))
         {
            this.globalVarList.push(new IntStat(50018,5));
         }
         var territoryData:TerritoryData = NodeGenerator.instance.getTerritoryData(terrx,terry,false);
         territoryData.addToClanInfluence(side,5);
         territoryData.changeProsperity(5);
      }
   }
}

