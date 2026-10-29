package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import playerio.DatabaseObject;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol632")]
   public class WarHexUI extends MovieClip
   {
      
      internal static const SurvivalModeData:Class = WarHexUI_SurvivalModeData;
      
      public var spybutton:RedButtonSmall;
      
      public var postsidebutton:RedButton;
      
      public var attackbutton:RedButtonSmall;
      
      public var backbutton:RedButtonSmall;
      
      public var selectsectorlabel:TextField;
      
      public var msgtext:TextField;
      
      public var postallbutton:RedButton;
      
      public var buildbutton:RedButton;
      
      public var descText:TextField;
      
      public var movebutton:RedButtonSmall;
      
      public var hexarrow:MovieClip;
      
      public var warhexbg:MovieClip;
      
      public var words:TextField;
      
      public var messageboardlabel:TextField;
      
      public var scrollUpButton:ScrollButton;
      
      public var scrollDownButton:ScrollButton;
      
      public var leftRoad:MovieClip;
      
      public var rightRoad:MovieClip;
      
      public var troopsloading:MovieClip;
      
      public var dayendslabel:TextField;
      
      public var numbertext:TextField;
      
      public var buildmenu:WarHexUIBuildMenu;
      
      public var actionslabel:TextField;
      
      public var deploybutton:RedButton;
      
      internal var hexArray:Array;
      
      internal var terrainArray:Array;
      
      internal var selectedHex:WarHex;
      
      internal var mapid:int;
      
      internal var territoryOwner:int;
      
      internal var ht:int;
      
      internal var wt:int;
      
      internal var nextUpdate:int;
      
      internal var playerside:int;
      
      internal var targetside:int;
      
      internal var messages:String = "";
      
      internal var playermarker:MCSCharacter;
      
      internal var troopsmarker:WarTroopsMarker;
      
      internal var troopsmarkerCounter:int;
      
      internal var killedSentries:Array = new Array();
      
      internal var castleGateTime:int;
      
      internal var activeState:WarActiveBattle;
      
      internal var sideState:int;
      
      internal var isMapActive:Boolean;
      
      internal var isNoMansLand:Boolean = false;
      
      internal var territoryName:String;
      
      internal var leftTerrain:WarTerrain;
      
      internal var rightTerrain:WarTerrain;
      
      internal var selfSentryMapID:int = -1;
      
      internal var selfSentryX:int = -1;
      
      internal var selfSentryY:int = -1;
      
      internal var alreadyRefreshed:Boolean = false;
      
      public var canClose:Boolean = true;
      
      public function WarHexUI()
      {
         super();
         LangManager.initTextField(this.selectsectorlabel,true);
         LangManager.initTextField(this.actionslabel,true);
         LangManager.initTextField(this.dayendslabel,true);
         LangManager.initTextField(this.descText);
         LangManager.initTextField(this.messageboardlabel,true);
         LangManager.initTextField(this.msgtext);
         LangManager.initTextField(this.numbertext);
         LangManager.initTextField(this.troopsloading.prompttext);
         this.messageboardlabel.text = LangManager.getString(317);
         this.selectsectorlabel.text = LangManager.getString(310);
         this.actionslabel.text = LangManager.getString(315);
         this.backbutton.setText(LangManager.getString(9));
         this.deploybutton.setText(LangManager.getString(311));
         this.attackbutton.setText(LangManager.getString(312));
         this.movebutton.setText(LangManager.getString(313));
         this.spybutton.setText(LangManager.getString(367));
         this.buildbutton.setText(LangManager.getString(422));
         this.postsidebutton.setText(LangManager.getString(316));
         this.postallbutton.setText(LangManager.getString(386));
         this.hexarrow.mouseEnabled = false;
         this.backbutton.visible = false;
         this.playermarker = new MCSCharacter();
         this.playermarker.setPose("lightstanceidle",0);
         addChild(this.playermarker);
         this.playermarker.scaleX = 0.5;
         this.playermarker.scaleY = 0.5;
         this.playermarker.mouseEnabled = false;
         this.troopsmarker = new WarTroopsMarker();
         addChild(this.troopsmarker);
         this.troopsmarker.visible = false;
         this.numbertext.visible = false;
         this.buildmenu.visible = false;
      }
      
      public function setNextUpdate(str:String) : *
      {
         this.nextUpdate = int(str) + 60;
      }
      
      public function initHex(str:String, troops:Array, castleGateTime:int) : *
      {
         var territoryData:TerritoryData = null;
         var nodeid:int = 0;
         var warTerrain:WarTerrain = null;
         var strArray:Array = null;
         var hex:WarHex = null;
         var xpos:int = 0;
         var ypos:int = 0;
         var owner:int = 0;
         var adjacentTerrOwner:int = 0;
         var frontline:Boolean = false;
         var j:int = 0;
         var sstate:IntStat = null;
         this.ht = 6;
         this.wt = 6;
         this.castleGateTime = castleGateTime;
         if(this.activeState == null)
         {
            this.sideState = WarActiveBattle.MAPSTATE_DISABLED;
            this.isMapActive = false;
         }
         else
         {
            this.sideState = this.activeState.getSideState(this.playerside);
            this.isMapActive = this.activeState.isMapActive();
         }
         this.isNoMansLand = NodeGenerator.instance.isNoChangeTown(this.mapid);
         territoryData = NodeGenerator.instance.getTerritoryData(this.mapid >> 12 & 0x0FFF,this.mapid & 0x0FFF,false);
         this.territoryName = territoryData.townName;
         this.selectsectorlabel.text = this.territoryName + ": " + LangManager.getString(310);
         this.leftRoad.visible = false;
         this.rightRoad.visible = false;
         var controlPointList:Array = territoryData.getControlPointList();
         var zeronodex:int = (this.mapid >> 12 & 0x0FFF) * 6;
         var zeronodey:int = (this.mapid & 0x0FFF) * 6;
         var zeronodeid:int = zeronodex << 12 | zeronodey;
         this.terrainArray = new Array();
         for(var i:int = 0; i < this.wt; i++)
         {
            this.terrainArray.push(new Array(this.ht));
            for(j = 0; j < this.ht; j++)
            {
               warTerrain = new WarTerrain();
               this.terrainArray[i][j] = warTerrain;
               warTerrain.x = 90 + i * 55;
               warTerrain.y = 92 + j * 55;
               nodeid = NodeGenerator.instance.getShiftedNodeId(zeronodeid,i,j);
               warTerrain.setTerrain(NodeGenerator.instance.getRoomBG(nodeid),territoryData.getLocationType(nodeid),territoryData.getNodeExitsNum(i,j));
               addChild(warTerrain);
               if(warTerrain.isExit())
               {
                  if(i == 0 && this.getExitOwner(i,j) != -1)
                  {
                     this.leftRoad.y = warTerrain.y - 7.5;
                     this.leftRoad.visible = true;
                  }
                  else if(i == 5 && this.getExitOwner(i,j) != -1)
                  {
                     this.rightRoad.y = warTerrain.y - 7.5;
                     this.rightRoad.visible = true;
                  }
               }
            }
         }
         this.hexArray = new Array();
         for(i = 0; i < this.wt; i++)
         {
            this.hexArray.push(new Array(this.ht));
         }
         var hexList:Array = str.split("|");
         if(this.isMapActive && str != "")
         {
            for(i = 0; i < hexList.length; i++)
            {
               if(hexList[i] != "")
               {
                  strArray = hexList[i].split(",");
                  if(strArray.length == 7)
                  {
                     xpos = int(strArray[0]);
                     ypos = int(strArray[1]);
                     hex = new WarHex(xpos,ypos,strArray[2],strArray[3],strArray[4],strArray[5]);
                     if(troops != null)
                     {
                        hex.setTroops(troops[xpos][ypos]);
                     }
                     else
                     {
                        hex.setStrength(this.playerside,strArray[6]);
                     }
                     this.hexArray[xpos][ypos] = hex;
                     hex.x = 90 + xpos * 55;
                     hex.y = 92 + ypos * 55;
                     warTerrain = this.terrainArray[xpos][ypos];
                     if(warTerrain.isExit())
                     {
                        owner = int(strArray[2]);
                        adjacentTerrOwner = this.getExitOwner(xpos,ypos);
                        if(this.activeState.getState(adjacentTerrOwner,xpos,ypos) == 0)
                        {
                           sstate = this.activeState.getAllSidesState(xpos,ypos);
                           if(sstate.getValue() == 0)
                           {
                              hex.setOwner(adjacentTerrOwner);
                              hex.setHexType(WarHex.HEX_POTENTIALSPAWNPOINT);
                           }
                           else if(sstate.getId() != adjacentTerrOwner)
                           {
                              hex.setOwner(sstate.getId());
                              if(strArray[2] != adjacentTerrOwner)
                              {
                                 hex.setOverrunBy(strArray[2]);
                              }
                              if(this.activeState.getState(hex.getOwner(),xpos,ypos) == 3)
                              {
                                 hex.setHexType(WarHex.HEX_DEMOLISHEDSPAWNPOINT);
                              }
                              else
                              {
                                 hex.setHexType(WarHex.HEX_DISABLEDSPAWNPOINT);
                              }
                           }
                        }
                        else if(this.activeState.getState(adjacentTerrOwner,xpos,ypos) == 2)
                        {
                           hex.setOwner(adjacentTerrOwner);
                           hex.setHexType(WarHex.HEX_UPCOMINGSPAWNPOINT);
                        }
                        else if(this.activeState.getState(adjacentTerrOwner,xpos,ypos) == 3)
                        {
                           hex.setOwner(adjacentTerrOwner);
                           if(strArray[2] != adjacentTerrOwner)
                           {
                              hex.setOverrunBy(strArray[2]);
                           }
                           hex.setHexType(WarHex.HEX_DEMOLISHEDSPAWNPOINT);
                        }
                        else if(this.activeState.getState(adjacentTerrOwner,xpos,ypos) == 1 && adjacentTerrOwner == owner)
                        {
                           hex.setOwner(adjacentTerrOwner);
                           hex.setHexType(WarHex.HEX_SPAWNPOINT);
                        }
                        else
                        {
                           hex.setOwner(adjacentTerrOwner);
                           if(strArray[2] != adjacentTerrOwner)
                           {
                              hex.setOverrunBy(strArray[2]);
                           }
                           hex.setHexType(WarHex.HEX_DISABLEDSPAWNPOINT);
                        }
                     }
                     else if(warTerrain.isControlPoint())
                     {
                        hex.setHexType(WarHex.HEX_CONTROLPOINT);
                     }
                     else if(warTerrain.isTown() && hex.cost <= 0)
                     {
                        if(territoryData.getTownLevel() <= 2)
                        {
                           hex.setHexType(WarHex.HEX_VILLAGE);
                        }
                        else if(territoryData.getTownLevel() == 3)
                        {
                           hex.setHexType(WarHex.HEX_TOWN);
                        }
                        else if(territoryData.getTownLevel() == 4)
                        {
                           hex.setHexType(WarHex.HEX_CITY);
                        }
                        else if(territoryData.getTownLevel() == 5)
                        {
                           hex.setHexType(WarHex.HEX_CASTLE);
                        }
                     }
                     else if(strArray[4] == WarHex.HEX_SPAWNPOINT)
                     {
                        hex.setHexType(WarHex.HEX_DISABLEDSPAWNPOINT);
                     }
                     hex.setWarTerrain(warTerrain);
                     addChild(hex);
                     hex.addEventListener(MouseEvent.CLICK,this.hexClick,false,0,true);
                  }
               }
            }
         }
         else
         {
            for(i = 0; i < 6; i++)
            {
               for(j = 0; j < 6; j++)
               {
                  xpos = j;
                  ypos = i;
                  hex = new WarHex(xpos,ypos,0,0,0,0);
                  hex.setStrength(this.playerside,0);
                  this.hexArray[xpos][ypos] = hex;
                  hex.x = 90 + xpos * 55;
                  hex.y = 92 + ypos * 55;
                  warTerrain = this.terrainArray[xpos][ypos];
                  if(!this.isNoMansLand && warTerrain.isExit())
                  {
                     hex.setOwner(this.getExitOwner(xpos,ypos));
                     if(this.sideState == WarActiveBattle.MAPSTATE_DISABLED || this.activeState.getState(this.playerside,xpos,ypos) == 0)
                     {
                        hex.setHexType(WarHex.HEX_POTENTIALSPAWNPOINT);
                     }
                     else if(this.activeState.getState(this.playerside,xpos,ypos) == 2)
                     {
                        hex.setHexType(WarHex.HEX_UPCOMINGSPAWNPOINT);
                     }
                     else if(this.activeState.getState(this.playerside,xpos,ypos) == 3)
                     {
                        hex.setHexType(WarHex.HEX_DEMOLISHEDSPAWNPOINT);
                     }
                  }
                  else if(warTerrain.isControlPoint())
                  {
                     hex.setOwner(this.territoryOwner);
                     hex.setHexType(WarHex.HEX_CONTROLPOINT);
                  }
                  else if(warTerrain.isTown())
                  {
                     hex.setOwner(this.territoryOwner);
                     if(territoryData.getTownLevel() <= 2)
                     {
                        hex.setHexType(WarHex.HEX_VILLAGE);
                     }
                     else if(territoryData.getTownLevel() == 3)
                     {
                        hex.setHexType(WarHex.HEX_TOWN);
                     }
                     else if(territoryData.getTownLevel() == 4)
                     {
                        hex.setHexType(WarHex.HEX_CITY);
                     }
                     else if(territoryData.getTownLevel() == 5)
                     {
                        hex.setHexType(WarHex.HEX_CASTLE);
                     }
                  }
                  hex.setWarTerrain(warTerrain);
                  addChild(hex);
                  hex.addEventListener(MouseEvent.CLICK,this.hexClick,false,0,true);
               }
            }
         }
         setChildIndex(this.hexarrow,numChildren - 1);
         setChildIndex(this.troopsmarker,numChildren - 1);
         setChildIndex(this.playermarker,numChildren - 1);
         setChildIndex(this.numbertext,numChildren - 1);
         setChildIndex(this.troopsloading,numChildren - 1);
         for(i = 0; i < this.wt; i++)
         {
            for(j = 0; j < this.ht; j++)
            {
               if(this.hexArray[i] != null && this.hexArray[i][j] != null)
               {
                  hex = this.hexArray[i][j];
                  hex.isFrontline = this.isFrontline(i,j,this.playerside);
               }
            }
         }
         if(this.selfSentryMapID == this.mapid)
         {
            this.playermarker.x = this.hexArray[this.selfSentryX][this.selfSentryY].x;
            this.playermarker.y = this.hexArray[this.selfSentryX][this.selfSentryY].y + 17;
            if(this.selfSentryX + 1 > this.wt / 2)
            {
               this.playermarker.scaleX = -0.5;
            }
            else
            {
               this.playermarker.scaleX = 0.5;
            }
            this.playermarker.visible = true;
         }
         this.updateHexCanClick();
         this.canClose = true;
      }
      
      internal function getExitOwner(xpos:int, ypos:int) : int
      {
         var territoryx:int = (this.mapid >> 12 & 0x0FFF) - 341;
         var territoryy:int = (this.mapid & 0x0FFF) - 341;
         if(xpos == 0)
         {
            return OverworldHUD.instance.warUI.getOwner(territoryx - 1,territoryy);
         }
         if(xpos == 5)
         {
            return OverworldHUD.instance.warUI.getOwner(territoryx + 1,territoryy);
         }
         if(ypos == 0)
         {
            return OverworldHUD.instance.warUI.getOwner(territoryx,territoryy - 1);
         }
         if(ypos == 5)
         {
            return OverworldHUD.instance.warUI.getOwner(territoryx,territoryy + 1);
         }
         return 0;
      }
      
      public function initSelfSentry(s_mapid:int, s_x:int, s_y:int) : *
      {
         this.selfSentryMapID = s_mapid;
         this.selfSentryX = s_x;
         this.selfSentryY = s_y;
      }
      
      internal function isFrontline(xpos:int, ypos:int, myside:int) : Boolean
      {
         var hex:WarHex = null;
         var hexside:int = 0;
         if(this.hexArray[xpos] == null || this.hexArray[xpos][ypos] == null)
         {
            return false;
         }
         var side:int = int(this.hexArray[xpos][ypos].owner);
         hexside = this.getOwner(xpos,ypos - 1);
         if(hexside != side && hexside != 0)
         {
            return true;
         }
         hexside = this.getOwner(xpos - 1,ypos);
         if(hexside != side && hexside != 0)
         {
            return true;
         }
         hexside = this.getOwner(xpos + 1,ypos);
         if(hexside != side && hexside != 0)
         {
            return true;
         }
         hexside = this.getOwner(xpos,ypos + 1);
         if(hexside != side && hexside != 0)
         {
            return true;
         }
         return false;
      }
      
      internal function getOwner(xpos:int, ypos:int) : int
      {
         if(xpos < 0 || xpos >= this.wt || ypos < 0 || ypos >= this.ht)
         {
            return 0;
         }
         var hex:WarHex = this.hexArray[xpos][ypos];
         if(hex != null)
         {
            return hex.owner;
         }
         return 0;
      }
      
      internal function isOnFriendly() : Boolean
      {
         return this.getOwner(this.selfSentryX,this.selfSentryY) == this.playerside;
      }
      
      public function show() : *
      {
         visible = true;
         this.playerside = StatsManager.getSide();
         this.warhexbgClick(null);
         this.addEventListeners();
         this.words.text = LangManager.getString(318);
         this.msgtext.text = LangManager.getString(90);
         QueryManager.instance.getWarMessage(this.mapid,this.playerside);
         this.playermarker.visible = false;
         this.playermarker.initMCSFromEqString(StatsManager.getEquipmentString());
         this.troopsmarker.initSide(this.playerside);
         this.troopsmarker.visible = false;
         this.numbertext.visible = false;
         this.troopsloading.visible = false;
         this.dayendslabel.text = "";
      }
      
      public function hide() : *
      {
         var i:int = 0;
         var j:int = 0;
         visible = false;
         this.removeEventListeners();
         if(this.hexArray != null)
         {
            for(i = 0; i < this.wt; i++)
            {
               for(j = 0; j < this.ht; j++)
               {
                  if(this.hexArray[i][j] != null)
                  {
                     removeChild(this.hexArray[i][j]);
                     removeChild(this.terrainArray[i][j]);
                  }
               }
            }
         }
         this.hexArray = null;
         this.terrainArray = null;
      }
      
      public function stopFlagAnimations() : *
      {
         var i:int = 0;
         var j:int = 0;
         if(this.hexArray != null)
         {
            for(i = 0; i < this.wt; i++)
            {
               for(j = 0; j < this.ht; j++)
               {
                  if(this.hexArray[i][j] != null && this.hexArray[i][j].flag != null)
                  {
                     this.hexArray[i][j].flag.stop();
                  }
               }
            }
         }
      }
      
      public function playFlagAnimations() : *
      {
         var i:int = 0;
         var j:int = 0;
         if(this.hexArray != null)
         {
            for(i = 0; i < this.wt; i++)
            {
               for(j = 0; j < this.ht; j++)
               {
                  if(this.hexArray[i][j] != null && this.hexArray[i][j].flag != null)
                  {
                     this.hexArray[i][j].flag.play();
                  }
               }
            }
         }
      }
      
      public function addEventListeners() : void
      {
         this.deploybutton.addEventListeners();
         this.attackbutton.addEventListeners();
         this.movebutton.addEventListeners();
         this.postsidebutton.addEventListeners();
         this.postallbutton.addEventListeners();
         this.spybutton.addEventListeners();
         this.buildbutton.addEventListeners();
         this.deploybutton.addEventListener(MouseEvent.CLICK,this.deployClick);
         this.attackbutton.addEventListener(MouseEvent.CLICK,this.attackClick);
         this.movebutton.addEventListener(MouseEvent.CLICK,this.moveClick);
         this.spybutton.addEventListener(MouseEvent.CLICK,this.spyClick);
         this.buildbutton.addEventListener(MouseEvent.CLICK,this.buildClick);
         this.postsidebutton.addEventListener(MouseEvent.CLICK,this.postSideClick);
         this.postallbutton.addEventListener(MouseEvent.CLICK,this.postAllClick);
         this.warhexbg.addEventListener(MouseEvent.CLICK,this.warhexbgClick);
         this.words.addEventListener(MouseEvent.CLICK,this.wordsClick);
         this.scrollUpButton.addEventListener(MouseEvent.CLICK,this.scrollUpClick);
         this.scrollDownButton.addEventListener(MouseEvent.CLICK,this.scrollDownClick);
      }
      
      public function removeEventListeners() : void
      {
         this.deploybutton.removeEventListeners();
         this.attackbutton.removeEventListeners();
         this.movebutton.removeEventListeners();
         this.postsidebutton.removeEventListeners();
         this.postallbutton.removeEventListeners();
         this.spybutton.removeEventListeners();
         this.buildbutton.removeEventListeners();
         this.deploybutton.removeEventListener(MouseEvent.CLICK,this.deployClick);
         this.attackbutton.removeEventListener(MouseEvent.CLICK,this.attackClick);
         this.movebutton.removeEventListener(MouseEvent.CLICK,this.moveClick);
         this.spybutton.removeEventListener(MouseEvent.CLICK,this.spyClick);
         this.buildbutton.removeEventListener(MouseEvent.CLICK,this.buildClick);
         this.postsidebutton.removeEventListener(MouseEvent.CLICK,this.postSideClick);
         this.postallbutton.removeEventListener(MouseEvent.CLICK,this.postAllClick);
         this.warhexbg.removeEventListener(MouseEvent.CLICK,this.warhexbgClick);
         this.words.removeEventListener(MouseEvent.CLICK,this.wordsClick);
         this.scrollUpButton.removeEventListener(MouseEvent.CLICK,this.scrollUpClick);
         this.scrollDownButton.removeEventListener(MouseEvent.CLICK,this.scrollDownClick);
      }
      
      internal function canHexClick(warHex:WarHex) : Boolean
      {
         if(warHex == null)
         {
            return false;
         }
         if(StatsManager.warCheat)
         {
            return true;
         }
         if((warHex.hextype == WarHex.HEX_POTENTIALSPAWNPOINT || warHex.hextype == WarHex.HEX_UPCOMINGSPAWNPOINT) && warHex.owner == this.playerside && StatsManager.getWarRank() >= 9)
         {
            return true;
         }
         if((warHex.hextype == WarHex.HEX_SPAWNPOINT || warHex.hextype == WarHex.HEX_DISABLEDSPAWNPOINT || warHex.hextype == WarHex.HEX_DEMOLISHEDSPAWNPOINT) && warHex.owner == this.playerside)
         {
            return true;
         }
         if(this.selfSentryMapID == this.mapid && warHex.hextype == 2 && warHex.cost == 0 && warHex.owner == this.playerside)
         {
            return true;
         }
         if(Boolean(this.isMapActive && this.terrainArray[warHex.xpos][warHex.ypos].isTown() && warHex.hextype != WarHex.HEX_VILLAGE) && Boolean(warHex.owner == this.playerside) && warHex.cost <= 0)
         {
            return true;
         }
         return this.isNextToPlayer(warHex);
      }
      
      internal function isNextToPlayer(warHex:WarHex) : Boolean
      {
         if(this.selfSentryMapID == this.mapid)
         {
            if(warHex.ypos == this.selfSentryY && Math.abs(warHex.xpos - this.selfSentryX) <= 1)
            {
               return true;
            }
            if(warHex.xpos == this.selfSentryX && Math.abs(warHex.ypos - this.selfSentryY) <= 1)
            {
               return true;
            }
         }
         return false;
      }
      
      internal function hasExitTo(warHex:WarHex) : Boolean
      {
         if(this.selfSentryX == -1 || this.selfSentryY == -1 || this.selfSentryMapID != this.mapid)
         {
            return false;
         }
         if(warHex.xpos == this.selfSentryX && warHex.ypos == this.selfSentryY)
         {
            return true;
         }
         if(this.hexArray[this.selfSentryX][this.selfSentryY].hextype == WarHex.HEX_LADDER && this.hexArray[this.selfSentryX][this.selfSentryY].cost == 0)
         {
            if(this.selfSentryY == warHex.ypos)
            {
               if(this.selfSentryX == warHex.xpos - 1)
               {
                  return true;
               }
               if(this.selfSentryX == warHex.xpos + 1)
               {
                  return true;
               }
            }
            else if(this.selfSentryX == warHex.xpos)
            {
               if(this.selfSentryY == warHex.ypos - 1)
               {
                  return true;
               }
               if(this.selfSentryY == warHex.ypos + 1)
               {
                  return true;
               }
            }
         }
         var warTerrain:WarTerrain = this.terrainArray[this.selfSentryX][this.selfSentryY];
         if(this.selfSentryY == warHex.ypos)
         {
            if(this.selfSentryX == warHex.xpos - 1 && warTerrain.getExitArray()[2] == 1)
            {
               return true;
            }
            if(this.selfSentryX == warHex.xpos + 1 && warTerrain.getExitArray()[3] == 1)
            {
               return true;
            }
         }
         else if(this.selfSentryX == warHex.xpos)
         {
            if(this.selfSentryY == warHex.ypos - 1 && warTerrain.getExitArray()[1] == 1)
            {
               return true;
            }
            if(this.selfSentryY == warHex.ypos + 1 && warTerrain.getExitArray()[0] == 1)
            {
               return true;
            }
         }
         return false;
      }
      
      internal function isSpecialHex(warHex:WarHex) : Boolean
      {
         var warTerrain:WarTerrain = this.terrainArray[warHex.xpos][warHex.ypos];
         if(warTerrain.isControlPoint())
         {
            return true;
         }
         if(warTerrain.isExit())
         {
            return true;
         }
         return false;
      }
      
      internal function updateHexCanClick() : *
      {
         var hex:WarHex = null;
         var j:int = 0;
         for(var i:int = 0; i < this.wt; i++)
         {
            for(j = 0; j < this.ht; j++)
            {
               hex = this.hexArray[i][j];
               if(hex != null)
               {
                  hex.setCanClick(this.canHexClick(hex));
               }
            }
         }
      }
      
      internal function hexClick(event:MouseEvent) : *
      {
         var hex:WarHex = event.target.parent as WarHex;
         if(!this.canHexClick(hex))
         {
            this.warhexbgClick(event);
            return;
         }
         if(this.selectedHex != null)
         {
            this.selectedHex.setIsSelected(false);
         }
         this.selectedHex = event.target.parent as WarHex;
         this.selectedHex.setIsSelected(true);
         this.selectsectorlabel.text = this.territoryName + ": " + LangManager.getString(314) + "(" + this.selectedHex.xpos.toString() + "," + this.selectedHex.ypos.toString() + ")\n";
         this.messageboardlabel.text = LangManager.getString(319) + " (" + this.selectedHex.xpos.toString() + "," + this.selectedHex.ypos.toString() + ")\n";
         this.actionslabel.visible = true;
         this.msgtext.visible = false;
         this.words.visible = false;
         this.postsidebutton.visible = false;
         this.postallbutton.visible = false;
         this.scrollUpButton.y = 100;
         this.scrollDownButton.y = 360;
         this.descText.visible = true;
         this.showDesc();
         this.hexarrow.visible = true;
         this.hexarrow.gotoAndStop(1);
         this.hexarrow.x = 90 + this.selfSentryX * 55;
         this.hexarrow.y = 92 + this.selfSentryY * 55;
         if(this.selfSentryMapID != this.mapid)
         {
            this.hexarrow.x = 90 + this.selectedHex.xpos * 55;
            this.hexarrow.y = 92 + this.selectedHex.ypos * 55;
            this.hexarrow.rotation = 180;
            this.hexarrow.y -= 55;
         }
         else if(this.selectedHex.xpos == this.selfSentryX && this.selectedHex.ypos == this.selfSentryY)
         {
            this.hexarrow.gotoAndStop(2);
            this.hexarrow.rotation = 0;
         }
         else if(this.selectedHex.xpos == this.selfSentryX + 1 && this.selectedHex.ypos == this.selfSentryY && this.hasExitTo(this.selectedHex))
         {
            this.hexarrow.rotation = 90;
         }
         else if(this.selectedHex.xpos == this.selfSentryX - 1 && this.selectedHex.ypos == this.selfSentryY && this.hasExitTo(this.selectedHex))
         {
            this.hexarrow.rotation = -90;
         }
         else if(this.selectedHex.xpos == this.selfSentryX && this.selectedHex.ypos == this.selfSentryY - 1 && this.hasExitTo(this.selectedHex))
         {
            this.hexarrow.rotation = 0;
         }
         else if(this.selectedHex.xpos == this.selfSentryX && this.selectedHex.ypos == this.selfSentryY + 1 && this.hasExitTo(this.selectedHex))
         {
            this.hexarrow.rotation = 180;
         }
         else
         {
            this.hexarrow.x = 90 + this.selectedHex.xpos * 55;
            this.hexarrow.y = 92 + this.selectedHex.ypos * 55;
            this.hexarrow.gotoAndStop(2);
            this.hexarrow.rotation = 0;
         }
      }
      
      internal function isProtectedCastle(warHex:WarHex) : Boolean
      {
         return warHex.hextype == WarHex.HEX_CASTLE && warHex.owner == this.territoryOwner && QueryManager.instance.getServerTime() - this.castleGateTime > 3 * 60 * 60;
      }
      
      internal function showDesc() : *
      {
         if(!this.selectedHex.hasData)
         {
            OverworldHUD.instance.warUI.loading.visible = true;
            QueryManager.instance.getWarHexData(this.mapid,this.selectedHex.xpos,this.selectedHex.ypos,this.playerside);
            this.descText.text = "";
         }
         else
         {
            this.descText.text = this.selectedHex.getDesc(this.playerside,this.castleGateTime);
         }
         this.scrollUpButton.visible = false;
         this.scrollDownButton.visible = false;
         this.deploybutton.visible = false;
         this.attackbutton.visible = false;
         this.movebutton.visible = false;
         this.spybutton.visible = false;
         this.buildbutton.visible = false;
         this.buildmenu.hide();
         if((this.selectedHex.hextype == WarHex.HEX_POTENTIALSPAWNPOINT || this.selectedHex.hextype == WarHex.HEX_DEMOLISHEDSPAWNPOINT) && this.selectedHex.isFriendly(this.playerside))
         {
            if(StatsManager.getWarRank() >= 9 || StatsManager.warCheat)
            {
               this.buildbutton.visible = true;
               if(this.selectedHex.hextype == WarHex.HEX_DEMOLISHEDSPAWNPOINT)
               {
                  if(this.selectedHex.getOverrunBy() != 0 && this.selectedHex.getOverrunBy() != this.getExitOwner(this.selectedHex.xpos,this.selectedHex.ypos))
                  {
                     this.buildbutton.visible = false;
                  }
                  else
                  {
                     this.buildbutton.setText(LangManager.getString(765));
                  }
               }
               else
               {
                  this.buildbutton.setText(LangManager.getString(575));
               }
            }
         }
         else if(this.selectedHex.hextype == WarHex.HEX_DISABLEDSPAWNPOINT || (this.selectedHex.hextype == WarHex.HEX_SPAWNPOINT || this.selectedHex.hextype == WarHex.HEX_UPCOMINGSPAWNPOINT) && this.selectedHex.isFriendly(this.playerside))
         {
            if(StatsManager.getWarRank() >= 9 || StatsManager.warCheat)
            {
               this.buildbutton.visible = true;
               this.buildbutton.setText(LangManager.getString(576));
            }
         }
         this.deploybutton.visible = this.selectedHex.canReinforce(this.playerside) && this.isNextToPlayer(this.selectedHex) && this.isOnFriendly();
         if(this.hasExitTo(this.selectedHex))
         {
            this.deploybutton.setText(LangManager.getString(311));
         }
         else if(this.selectedHex.hasEnemy(this.playerside) || this.selectedHex.cost > 0)
         {
            this.deploybutton.setText(LangManager.getString(577));
         }
         else
         {
            this.deploybutton.visible = false;
         }
         if(this.isMapActive)
         {
            this.attackbutton.visible = this.hasExitTo(this.selectedHex) && this.selectedHex.canAttack() && this.isNextToPlayer(this.selectedHex) && this.selectedHex.hasEnemy(this.playerside) && this.isOnFriendly();
            if(this.selectedHex.owner == this.playerside)
            {
               this.attackbutton.setText(LangManager.getString(366));
            }
            else
            {
               this.attackbutton.setText(LangManager.getString(312));
            }
            this.movebutton.visible = (this.hasExitTo(this.selectedHex) || this.selectedHex.hextype == WarHex.HEX_SPAWNPOINT || (this.selectedHex.hextype == WarHex.HEX_FORWARDBASE || this.terrainArray[this.selectedHex.xpos][this.selectedHex.ypos].isTown()) && this.selectedHex.cost <= 0) && this.selectedHex.isFriendly(this.playerside) && !(this.selectedHex.xpos == this.selfSentryX && this.selectedHex.ypos == this.selfSentryY && this.selfSentryMapID == this.mapid);
            this.spybutton.visible = !this.selectedHex.hasSpyData && this.selectedHex.owner != this.playerside && this.isOnFriendly();
            if(!this.buildbutton.visible)
            {
               this.buildbutton.visible = this.selfSentryMapID == this.mapid && this.selectedHex.xpos == this.selfSentryX && this.selectedHex.ypos == this.selfSentryY && this.isOnFriendly() && (this.selectedHex.hextype == WarHex.HEX_NOTHING && StatsManager.getWarRank() >= 6 || (this.selectedHex.hextype == WarHex.HEX_VILLAGE || this.selectedHex.hextype == WarHex.HEX_POTENTIALSPAWNPOINT) && StatsManager.getWarRank() >= 9 || this.selectedHex.cost > 0);
               if(this.selectedHex.cost > 0)
               {
                  this.buildbutton.setText(LangManager.getString(422));
               }
               else
               {
                  this.buildbutton.setText(LangManager.getString(792));
               }
            }
            if(this.selectedHex.hextype == WarHex.HEX_CASTLE && this.selectedHex.owner == this.territoryOwner && this.isNextToPlayer(this.selectedHex) && this.selectedHex.isFrontline)
            {
               this.buildbutton.visible = QueryManager.instance.getServerTime() - this.castleGateTime > 2.5 * 60 * 60;
               if(this.playerside == this.territoryOwner)
               {
                  this.buildbutton.setText(LangManager.getString(793));
               }
               else
               {
                  this.buildbutton.setText(LangManager.getString(794));
               }
               if(this.playerside != this.selectedHex.owner && QueryManager.instance.getServerTime() - this.castleGateTime > 3 * 60 * 60)
               {
                  this.deploybutton.visible = false;
                  this.attackbutton.visible = false;
               }
            }
         }
         if(StatsManager.warCheat)
         {
            this.deploybutton.visible = true;
            this.attackbutton.visible = true;
            this.movebutton.visible = true;
            this.spybutton.visible = true;
            this.buildbutton.visible = true;
            this.buildbutton.x = 436;
         }
      }
      
      internal function warhexbgClick(event:MouseEvent) : *
      {
         if(this.selectedHex != null)
         {
            this.selectedHex.setIsSelected(false);
            this.selectedHex = null;
         }
         this.deploybutton.visible = false;
         this.attackbutton.visible = false;
         this.movebutton.visible = false;
         this.spybutton.visible = false;
         this.buildbutton.visible = false;
         this.hexarrow.visible = false;
         this.buildmenu.hide();
         this.selectsectorlabel.text = this.territoryName + ": " + LangManager.getString(310);
         this.showMessages();
      }
      
      internal function wordsClick(event:MouseEvent) : *
      {
         if(this.words.text == LangManager.getString(318))
         {
            this.words.text = "";
         }
      }
      
      internal function getControlPointStr() : String
      {
         var warTerrain:WarTerrain = null;
         var j:* = undefined;
         var townstr:String = "";
         var controlptstr:String = "";
         for(var i:* = 0; i < 6; i++)
         {
            for(j = 0; j < 6; j++)
            {
               warTerrain = this.terrainArray[i][j];
               if(warTerrain.isControlPoint())
               {
                  controlptstr += i + "-" + j + "|";
               }
               else if(warTerrain.isTown())
               {
                  townstr = i + "-" + j + "|";
               }
            }
         }
         controlptstr = controlptstr.substr(0,controlptstr.length - 1);
         return townstr + controlptstr;
      }
      
      internal function hasTown() : Boolean
      {
         var warTerrain:WarTerrain = null;
         var j:* = undefined;
         for(var i:* = 0; i < 6; i++)
         {
            for(j = 0; j < 6; j++)
            {
               warTerrain = this.terrainArray[i][j];
               if(warTerrain.isTown())
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      internal function deployClick(event:MouseEvent) : *
      {
         var deployvalue:int = 0;
         var num:int = 0;
         trace("deploy");
         if(StatsManager.getStat(StatsManager.STAT_WARMOVES) > 0)
         {
            OverworldHUD.instance.warUI.useWarMove(1);
            if(this.hasExitTo(this.selectedHex))
            {
               deployvalue = 100 * this.getTerrainModifier();
               QueryManager.instance.setWarHex(this.mapid,this.selectedHex.xpos,this.selectedHex.ypos,this.playerside,deployvalue);
               if(StatsManager.usePlayerIO)
               {
                  this.troopsloading.visible = true;
                  this.troopsloading.prompttext.text = LangManager.getString(672);
               }
               this.selectedHex.setStrength(this.playerside,this.selectedHex.getStrength(this.playerside) + deployvalue);
               this.showDesc();
               this.troopsmarker.x = this.selectedHex.x;
               this.troopsmarker.y = this.selectedHex.y + 17;
               this.troopsmarker.setDirection(this.hexarrow.rotation);
               if(this.troopsmarker.x < this.playermarker.x)
               {
                  this.troopsmarker.faceLeft();
               }
               else
               {
                  this.troopsmarker.faceRight();
               }
               this.numbertext.x = this.selectedHex.x - this.numbertext.width / 2;
               this.numbertext.y = this.selectedHex.y - this.numbertext.height / 2;
               this.numbertext.text = "+" + deployvalue.toString();
               if(this.playerside == 1)
               {
                  this.numbertext.textColor = 16711680;
               }
               else if(this.playerside == 2)
               {
                  this.numbertext.textColor = 39168;
               }
               else if(this.playerside == 3)
               {
                  this.numbertext.textColor = 26367;
               }
               else if(this.playerside == 4)
               {
                  this.numbertext.textColor = 16776960;
               }
               else if(StatsManager.isCustomClan(this.playerside))
               {
                  this.numbertext.textColor = StatsManager.getCustomClanColor();
               }
               else
               {
                  this.numbertext.textColor = 16777215;
               }
               this.troopsmarkerAnimationStart();
            }
            else
            {
               this.targetside = this.selectedHex.getRandomEnemy(this.playerside);
               num = 80 + Math.random() * 40 * this.getTerrainModifier();
               this.numbertext.text = "-" + num.toString();
               if(this.targetside == 1)
               {
                  this.numbertext.textColor = 16711680;
               }
               else if(this.targetside == 2)
               {
                  this.numbertext.textColor = 39168;
               }
               else if(this.targetside == 3)
               {
                  this.numbertext.textColor = 26367;
               }
               else if(this.targetside == 4)
               {
                  this.numbertext.textColor = 16776960;
               }
               else if(StatsManager.isCustomClan(this.targetside))
               {
                  this.numbertext.textColor = StatsManager.getEnemyCustomClanColor();
               }
               else
               {
                  this.numbertext.textColor = 16777215;
               }
               this.numbertext.x = this.selectedHex.x - this.numbertext.width / 2;
               this.numbertext.y = this.selectedHex.y - this.numbertext.height / 2;
               this.numberAnimationStart();
               QueryManager.instance.setWarHex(this.mapid,this.selectedHex.xpos,this.selectedHex.ypos,this.targetside,-num);
               if(StatsManager.usePlayerIO)
               {
                  this.troopsloading.visible = true;
                  this.troopsloading.prompttext.text = LangManager.getString(673);
               }
               this.selectedHex.changeStrength(this.targetside,-num);
               if(this.selectedHex.cost > 0)
               {
                  QueryManager.instance.doBuild(this.mapid,this.selectedHex.xpos,this.selectedHex.ypos,-num);
                  this.selectedHex.cost += num;
               }
               this.showDesc();
            }
         }
         else
         {
            OverworldHUD.instance.showDialog(LangManager.getString(715),LangManager.getString(5));
            OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
         }
      }
      
      internal function attackClick(event:MouseEvent) : *
      {
         trace("attack");
         if(StatsManager.getStat(StatsManager.STAT_WARMOVES) > 0)
         {
            this.targetside = this.selectedHex.getRandomEnemy(this.playerside);
            QueryManager.instance.getWarEnemySentry(this.mapid,this.selectedHex.xpos,this.selectedHex.ypos,this.targetside);
            this.stopFlagAnimations();
            OverworldHUD.instance.warUI.loading.visible = true;
         }
         else
         {
            OverworldHUD.instance.showDialog(LangManager.getString(715),LangManager.getString(5));
            OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
         }
      }
      
      internal function spyClick(event:MouseEvent) : *
      {
         trace("spy");
         if(StatsManager.getStat(StatsManager.STAT_WARMOVES) > 0)
         {
            OverworldHUD.instance.warUI.useWarMove(1);
            this.selectedHex.hasSpyData = true;
            this.showDesc();
         }
         else
         {
            OverworldHUD.instance.showDialog(LangManager.getString(715),LangManager.getString(5));
            OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
         }
      }
      
      internal function buildClick(event:MouseEvent) : *
      {
         var territory:Point = null;
         var territoryData:TerritoryData = null;
         var currentLocation:int = 0;
         var sideStr:String = null;
         var tx:int = 0;
         var ty:int = 0;
         var displayname:String = null;
         var buildcost:int = 0;
         if(this.selectedHex.hextype == WarHex.HEX_CASTLE)
         {
            territory = NodeGenerator.instance.getTerritory(StageManager.getCurrentNode());
            territoryData = NodeGenerator.instance.getTerritoryData(territory.x,territory.y,false);
            if(Boolean(StageManager.getCurrentRoom() > 0) && Boolean(territoryData.isTown(StageManager.getCurrentNode())) && territoryData.territoryAtWar())
            {
               OverworldHUD.instance.showDialog(LangManager.getString(795),LangManager.getString(5));
               OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
               return;
            }
            if(StatsManager.getStat(StatsManager.STAT_WARMOVES) > 0)
            {
               OverworldHUD.instance.warUI.useWarMove(1);
               territoryData = NodeGenerator.instance.getTerritoryData(this.mapid >> 12 & 0x0FFF,this.mapid & 0x0FFF,false);
               currentLocation = StageManager.getCurrentNode();
               StatsManager.setStat(30021,currentLocation);
               sideStr = "";
               switch(territoryData.getTownSide())
               {
                  case 1:
                     sideStr = LangManager.getString(796) + " ";
                     break;
                  case 2:
                     sideStr = LangManager.getString(797) + " ";
                     break;
                  case 3:
                     sideStr = LangManager.getString(798) + " ";
                     break;
                  case 4:
                     sideStr = LangManager.getString(799) + " ";
               }
               tx = (this.mapid >> 12 & 0x0FFF) - 341 + WarSelectUI.DTERRSHIFTX;
               ty = (this.mapid & 0x0FFF) - 341 + WarSelectUI.DTERRSHIFTY;
               displayname = StatsManager.getChatDisplayCharname();
               StageManager.getGameStage().visible = true;
               if(this.playerside == this.territoryOwner)
               {
                  StageManager.gotoRoom(40,400,territoryData.getTown());
                  StatsManager.saveLocation(currentLocation);
                  OverworldHUD.instance.showDialog(LangManager.getString(777),LangManager.getString(5));
                  NetworkManager.instance.globalAnnouncement("","[PvP]   " + LangManager.getString(800,[displayname,sideStr,territoryData.townName,tx,ty]));
                  this.hide();
               }
               else
               {
                  StageManager.gotoRoom(7,530,territoryData.getTown());
                  StatsManager.saveLocation(currentLocation);
                  OverworldHUD.instance.showDialog(LangManager.getString(778),LangManager.getString(5));
                  if(this.territoryOwner != 0)
                  {
                     NetworkManager.instance.globalAnnouncement("","[PvP]   " + LangManager.getString(801,[displayname,sideStr,territoryData.townName,tx,ty]));
                  }
                  this.hide();
               }
            }
            else
            {
               OverworldHUD.instance.showDialog(LangManager.getString(715),LangManager.getString(5));
               OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
            }
            return;
         }
         trace("build");
         if(this.selectedHex.hextype == WarHex.HEX_POTENTIALSPAWNPOINT || this.selectedHex.hextype == WarHex.HEX_DEMOLISHEDSPAWNPOINT)
         {
            if(StatsManager.getStat(StatsManager.STAT_WARMOVES) > 0)
            {
               this.canClose = false;
               QueryManager.instance.createSpawnPoint(this.mapid,this.playerside,this.selectedHex.xpos,this.selectedHex.ypos,this.getControlPointStr(),this.hasTown());
               this.buildbutton.visible = false;
            }
            else
            {
               OverworldHUD.instance.showDialog(LangManager.getString(715),LangManager.getString(5));
               OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
            }
         }
         else if((this.selectedHex.hextype == WarHex.HEX_SPAWNPOINT || this.selectedHex.hextype == WarHex.HEX_UPCOMINGSPAWNPOINT || this.selectedHex.hextype == WarHex.HEX_DISABLEDSPAWNPOINT) && this.selectedHex.isFriendly(this.playerside))
         {
            if(StatsManager.getStat(StatsManager.STAT_WARMOVES) > 0)
            {
               OverworldHUD.instance.warUI.useWarMove(1);
               this.canClose = false;
               QueryManager.instance.destroySpawnPoint(this.mapid,this.selectedHex.xpos,this.selectedHex.ypos);
            }
            else
            {
               OverworldHUD.instance.showDialog(LangManager.getString(715),LangManager.getString(5));
               OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
            }
         }
         else if(this.selectedHex.cost != 0)
         {
            buildcost = 500;
            if(StatsManager.getStat(StatsManager.STAT_WARMOVES) > 0 && StatsManager.getStat(StatsManager.STAT_GOLD) >= buildcost)
            {
               this.selectedHex.cost -= buildcost;
               if(StatsManager.usePlayerIO)
               {
                  this.troopsloading.visible = true;
                  this.troopsloading.prompttext.text = LangManager.getString(675);
               }
               QueryManager.instance.doBuild(this.mapid,this.selectedHex.xpos,this.selectedHex.ypos,buildcost);
               StatsManager.changeStat(StatsManager.STAT_GOLD,-buildcost);
               StatsManager.changeStat(StatsManager.STAT_WARCOINSDONATED,buildcost);
               this.showDesc();
               OverworldHUD.instance.warUI.useWarMove(1);
               if(this.selectedHex.cost <= 0)
               {
                  this.selectedHex.cost = 0;
                  this.selectedHex.setHexType(this.selectedHex.hextype);
                  OverworldHUD.instance.showDialog(LangManager.getString(582),LangManager.getString(5));
                  OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
                  if(!StatsManager.usePlayerIO && this.selectedHex.hextype == WarHex.HEX_TOWN)
                  {
                     trace("town complete");
                     QueryManager.instance.createTown(this.mapid >> 12 & 0x0FFF,this.mapid & 0x0FFF);
                  }
               }
            }
            else
            {
               OverworldHUD.instance.showDialog(LangManager.getString(583),LangManager.getString(5));
               OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
            }
         }
         else
         {
            this.buildmenu.show(this.selectedHex);
         }
      }
      
      public function startBuild(buildtarget:int) : *
      {
         var buildcost:int = 500;
         if(StatsManager.getStat(StatsManager.STAT_WARMOVES) > 0 && StatsManager.getStat(StatsManager.STAT_GOLD) >= buildcost)
         {
            if(buildtarget == WarHex.HEX_FORWARDBASE)
            {
               this.selectedHex.hextype = buildtarget;
               this.selectedHex.cost = 10000;
               this.selectedHex.gotoAndStop(this.selectedHex.owner + 100);
               QueryManager.instance.startBuild(this.mapid,this.selectedHex.xpos,this.selectedHex.ypos,this.selectedHex.hextype);
               OverworldHUD.instance.showDialog(LangManager.getString(578),LangManager.getString(5));
               OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
            }
            else if(buildtarget == WarHex.HEX_LADDER)
            {
               this.selectedHex.hextype = buildtarget;
               this.selectedHex.cost = 5000;
               this.selectedHex.gotoAndStop(this.selectedHex.owner + 100);
               QueryManager.instance.startBuild(this.mapid,this.selectedHex.xpos,this.selectedHex.ypos,this.selectedHex.hextype);
               OverworldHUD.instance.showDialog(LangManager.getString(579),LangManager.getString(5));
               OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
            }
            else if(buildtarget == WarHex.HEX_DEFENSE)
            {
               this.selectedHex.hextype = buildtarget;
               this.selectedHex.cost = 10000;
               this.selectedHex.gotoAndStop(this.selectedHex.owner + 100);
               QueryManager.instance.startBuild(this.mapid,this.selectedHex.xpos,this.selectedHex.ypos,this.selectedHex.hextype);
               OverworldHUD.instance.showDialog(LangManager.getString(580),LangManager.getString(5));
               OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
            }
            else if(buildtarget == WarHex.HEX_TOWN)
            {
               this.selectedHex.hextype = buildtarget;
               this.selectedHex.cost = 10000;
               this.selectedHex.gotoAndStop(this.selectedHex.owner + 140);
               QueryManager.instance.startBuild(this.mapid,this.selectedHex.xpos,this.selectedHex.ypos,this.selectedHex.hextype);
               OverworldHUD.instance.showDialog(LangManager.getString(581),LangManager.getString(5));
               OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
            }
            else
            {
               this.selectedHex.cost -= buildcost;
               QueryManager.instance.doBuild(this.mapid,this.selectedHex.xpos,this.selectedHex.ypos,buildcost);
            }
            if(this.selectedHex.cost <= 0)
            {
               this.selectedHex.cost = 0;
               this.selectedHex.gotoAndStop(this.selectedHex.owner + this.selectedHex.hextype * 10);
               OverworldHUD.instance.showDialog(LangManager.getString(582),LangManager.getString(5));
               OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
            }
            StatsManager.changeStat(StatsManager.STAT_GOLD,-buildcost);
            StatsManager.changeStat(StatsManager.STAT_WARCOINSDONATED,buildcost);
            this.showDesc();
            OverworldHUD.instance.warUI.useWarMove(1);
         }
         else
         {
            OverworldHUD.instance.showDialog(LangManager.getString(583),LangManager.getString(5));
            OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
         }
      }
      
      public function startBattle(sentryStr:String) : *
      {
         var innerStrArray:Array = null;
         var npcXML:XMLNpc = null;
         var dice:int = 0;
         QuestEngine.clearPlayersInNPCData();
         var strArray:Array = sentryStr.split(String.fromCharCode(30));
         for(var i:int = 0; i < strArray.length; i++)
         {
            if(strArray[i] != "")
            {
               innerStrArray = strArray[i].split(String.fromCharCode(31));
               npcXML = new XMLNpc(null);
               if(innerStrArray[4] == null)
               {
                  QueryManagerPIO.instance.client.errorLog.writeError("WarHexUI.startBattle: eqString null " + StatsManager.charname + " " + innerStrArray[1],"","",null);
               }
               npcXML.initDuelist(innerStrArray[1],innerStrArray[2],innerStrArray[3],innerStrArray[4],innerStrArray[5],1,innerStrArray[0],false);
               npcXML.id = 700 + i;
               QuestEngine.insertNPCData(npcXML);
            }
         }
         StageManager.getGameStage().visible = true;
         OverworldHUD.instance.warUI.loading.visible = false;
         NetworkManager.getInstance().leaveRoom();
         var wavelist:Vector.<XMLQuestWave> = this.createWarRoomWaveList(this.targetside);
         Overworld.setCurrentQuest(-1);
         var zeronodex:int = (this.mapid >> 12 & 0x0FFF) * 6;
         var zeronodey:int = (this.mapid & 0x0FFF) * 6;
         var nodeid:int = zeronodex + this.selectedHex.xpos << 12 | zeronodey + this.selectedHex.ypos;
         var rng:RNG = new RNG(nodeid);
         var bg:int = 0;
         var roomData:Array = [new XMLRoomData(null)];
         if(this.selectedHex.hextype == WarHex.HEX_VILLAGE)
         {
            bg = GameStage.BG_TOWNPROCGEN_VILLAGE;
         }
         else if(this.selectedHex.hextype == WarHex.HEX_TOWN)
         {
            bg = GameStage.BG_TOWNPROCGEN_TOWN;
         }
         else if(this.selectedHex.hextype == WarHex.HEX_CITY)
         {
            bg = GameStage.BG_TOWNPROCGEN_CITY;
         }
         else if(this.selectedHex.hextype == WarHex.HEX_CASTLE)
         {
            dice = rng.rand(5);
            if(dice == 0)
            {
               bg = GameStage.BG_CASTLEWALLS;
            }
            else if(dice == 1)
            {
               bg = GameStage.BG_CASTLEWALKWAY;
            }
            else if(dice == 2)
            {
               bg = GameStage.BG_CASTLEHALLWAY;
            }
            else if(dice == 3)
            {
               bg = GameStage.BG_DOJO3;
            }
            else if(dice == 4)
            {
               bg = GameStage.BG_CASTLEWALLS_INNER;
            }
         }
         else if(this.selectedHex.hextype == WarHex.HEX_FORWARDBASE || this.selectedHex.hextype == WarHex.HEX_SPAWNPOINT)
         {
            dice = rng.rand(4);
            if(dice == 0)
            {
               bg = GameStage.BG_JINMAKU_OUTSIDE;
            }
            else if(dice == 1)
            {
               bg = GameStage.BG_JINMAKU_NIGHT_OUTSIDE;
            }
            else if(dice == 2)
            {
               bg = GameStage.BG_JINMAKU;
            }
            else if(dice == 3)
            {
               bg = GameStage.BG_JINMAKU_NIGHT;
            }
            if(StatsManager.isCustomClan(this.selectedHex.getOwner()))
            {
               if(this.selectedHex.getOwner() == this.playerside)
               {
                  roomData[0].bgParam = 9;
               }
               else
               {
                  roomData[0].bgParam = 5;
               }
            }
            else
            {
               roomData[0].bgParam = this.selectedHex.getOwner();
            }
         }
         else
         {
            bg = NodeGenerator.instance.getRoomBG(nodeid);
         }
         GameEngine.initBattleMode(-1,10,bg,1000,0,wavelist,400,roomData);
         this.numbertext.x = this.selectedHex.x - this.numbertext.width / 2;
         this.numbertext.y = this.selectedHex.y - this.numbertext.height / 2;
      }
      
      public function startBattlePIO(array:Array) : *
      {
         var npcXML:XMLNpc = null;
         var o:DatabaseObject = null;
         var dice:int = 0;
         QuestEngine.clearPlayersInNPCData();
         for(var i:int = 0; i < array.length; i++)
         {
            o = array[i];
            npcXML = new XMLNpc(null);
            if(o.equipment == null)
            {
               QueryManagerPIO.instance.client.errorLog.writeError("WarHexUI.startBattlePIO: eqString null " + StatsManager.charname + " " + o.key,"","",null);
            }
            npcXML.initDuelist(o.key,o.playerlevel,o.battlestats,o.equipment,o.skillstats,1,o.key,false);
            npcXML.id = 700 + i;
            QuestEngine.insertNPCData(npcXML);
         }
         StageManager.getGameStage().visible = true;
         OverworldHUD.instance.warUI.loading.visible = false;
         NetworkManager.getInstance().leaveRoom();
         var wavelist:Vector.<XMLQuestWave> = this.createWarRoomWaveList(this.targetside);
         Overworld.setCurrentQuest(-1);
         var zeronodex:int = (this.mapid >> 12 & 0x0FFF) * 6;
         var zeronodey:int = (this.mapid & 0x0FFF) * 6;
         var nodeid:int = zeronodex + this.selectedHex.xpos << 12 | zeronodey + this.selectedHex.ypos;
         var rng:RNG = new RNG(nodeid);
         var bg:int = 0;
         var roomData:Array = [new XMLRoomData(null)];
         if(this.selectedHex.hextype == WarHex.HEX_VILLAGE)
         {
            bg = GameStage.BG_TOWNPROCGEN_VILLAGE;
         }
         else if(this.selectedHex.hextype == WarHex.HEX_TOWN)
         {
            bg = GameStage.BG_TOWNPROCGEN_TOWN;
         }
         else if(this.selectedHex.hextype == WarHex.HEX_CITY)
         {
            bg = GameStage.BG_TOWNPROCGEN_CITY;
         }
         else if(this.selectedHex.hextype == WarHex.HEX_CASTLE)
         {
            dice = rng.rand(5);
            if(dice == 0)
            {
               bg = GameStage.BG_CASTLEWALLS;
            }
            else if(dice == 1)
            {
               bg = GameStage.BG_CASTLEWALKWAY;
            }
            else if(dice == 2)
            {
               bg = GameStage.BG_CASTLEHALLWAY;
            }
            else if(dice == 3)
            {
               bg = GameStage.BG_DOJO3;
            }
            else if(dice == 4)
            {
               bg = GameStage.BG_CASTLEWALLS_INNER;
            }
         }
         else if(this.selectedHex.hextype == WarHex.HEX_FORWARDBASE || this.selectedHex.hextype == WarHex.HEX_SPAWNPOINT)
         {
            dice = rng.rand(4);
            if(dice == 0)
            {
               bg = GameStage.BG_JINMAKU_OUTSIDE;
            }
            else if(dice == 1)
            {
               bg = GameStage.BG_JINMAKU_NIGHT_OUTSIDE;
            }
            else if(dice == 2)
            {
               bg = GameStage.BG_JINMAKU;
            }
            else if(dice == 3)
            {
               bg = GameStage.BG_JINMAKU_NIGHT;
            }
            roomData[0].bgParam = this.selectedHex.getOwner();
         }
         else
         {
            bg = NodeGenerator.instance.getRoomBG(nodeid);
         }
         GameEngine.initBattleMode(-1,10,bg,1000,0,wavelist,400,roomData);
         this.numbertext.x = this.selectedHex.x - this.numbertext.width / 2;
         this.numbertext.y = this.selectedHex.y - this.numbertext.height / 2;
      }
      
      public function getDefeatMessage(target:String, lvl:int) : String
      {
         var colorstr1:String = "<font color=\'#333333\'>";
         if(this.playerside == 1)
         {
            colorstr1 = "<font color=\'#990000\'>";
         }
         else if(this.playerside == 2)
         {
            colorstr1 = "<font color=\'#006600\'>";
         }
         else if(this.playerside == 3)
         {
            colorstr1 = "<font color=\'#000099\'>";
         }
         else if(this.playerside == 4)
         {
            colorstr1 = "<font color=\'#85762E\'>";
         }
         else if(StatsManager.isCustomClan(this.playerside))
         {
            colorstr1 = "<font color=\'" + StatsManager.getCustomClanTextColor() + "\'>";
         }
         var colorstr2:String = "<font color=\'#333333\'>";
         if(this.targetside == 1)
         {
            colorstr2 = "<font color=\'#990000\'>";
         }
         else if(this.targetside == 2)
         {
            colorstr2 = "<font color=\'#006600\'>";
         }
         else if(this.targetside == 3)
         {
            colorstr2 = "<font color=\'#000099\'>";
         }
         else if(this.targetside == 4)
         {
            colorstr2 = "<font color=\'#85762E\'>";
         }
         else if(StatsManager.isCustomClan(this.targetside))
         {
            colorstr2 = "<font color=\'" + StatsManager.getEnemyCustomClanTextColor() + "\'>";
         }
         this.messages += "(" + this.selectedHex.xpos + "," + this.selectedHex.ypos + "): " + colorstr1 + StatsManager.charname + "(" + StatsManager.getLevel().toString() + ")</font>" + "<font color=\'#333333\'>" + LangManager.getString(354) + "</font>" + colorstr2 + target + "(" + lvl.toString() + ")</font><br>";
         return this.selectedHex.xpos + "," + this.selectedHex.ypos + "," + StatsManager.charname + "(" + StatsManager.getLevel().toString() + ")" + "," + target + "(" + lvl.toString() + ")" + "," + this.playerside + "," + this.targetside;
      }
      
      public function showWarRoomKills(num:int) : *
      {
         this.playFlagAnimations();
         OverworldHUD.instance.warUI.useWarMove(1);
         this.numbertext.text = "-" + num.toString();
         if(this.targetside == 1)
         {
            this.numbertext.textColor = 16711680;
         }
         else if(this.targetside == 2)
         {
            this.numbertext.textColor = 39168;
         }
         else if(this.targetside == 3)
         {
            this.numbertext.textColor = 26367;
         }
         else if(this.targetside == 4)
         {
            this.numbertext.textColor = 16776960;
         }
         else
         {
            this.numbertext.textColor = 16777215;
         }
         this.numberAnimationStart();
         QueryManager.instance.setWarHex(this.mapid,this.selectedHex.xpos,this.selectedHex.ypos,this.targetside,-num);
         this.selectedHex.changeStrength(this.targetside,-num);
         this.showDesc();
         var max:int = int(this.killedSentries.length);
         var killedList:String = "";
         for(var i:int = 0; i < max; i++)
         {
            if(StatsManager.usePlayerIO)
            {
               if(i == 0)
               {
                  killedList = this.killedSentries[i];
               }
               else
               {
                  killedList += "," + this.killedSentries[i];
               }
            }
            else
            {
               QueryManager.instance.delWarSentry(this.mapid,this.killedSentries[i]);
            }
         }
         if(StatsManager.usePlayerIO && killedList != "")
         {
            NetworkManager.instance.delWarSentry(this.mapid,killedList);
         }
      }
      
      public function killSentry(id:String) : *
      {
         this.killedSentries.push(id);
      }
      
      internal function createWarRoomWaveList(targetside:int) : Vector.<XMLQuestWave>
      {
         var waveXML:XMLQuestWave = null;
         var tempid:int = 0;
         var strArray:Array = null;
         var j:int = 0;
         var k:int = 0;
         var remainder:int = 0;
         var xml:XML = XML(new SurvivalModeData());
         var length:int = xml.wave.length();
         var wave:Vector.<XMLQuestWave> = new Vector.<XMLQuestWave>();
         for(var i:int = 0; i < length; i++)
         {
            waveXML = new XMLQuestWave(xml.wave[i]);
            for(j = 0; j < waveXML.enemy.length(); j++)
            {
               strArray = waveXML.enemy[j].id.split("|");
               for(k = 0; k < strArray.length; k++)
               {
                  if(strArray[k] != "")
                  {
                     tempid = int(strArray[k]);
                     if(tempid >= 200 && tempid < 600)
                     {
                        remainder = tempid % 100;
                        if(targetside == 1)
                        {
                           strArray[k] = remainder + 200;
                        }
                        else if(targetside == 2)
                        {
                           strArray[k] = remainder + 400;
                        }
                        else if(targetside == 3)
                        {
                           strArray[k] = remainder + 300;
                        }
                        else if(targetside == 4)
                        {
                           strArray[k] = remainder + 500;
                        }
                        else if(targetside == 0 || targetside == 5 || StatsManager.isCustomClan(targetside))
                        {
                           strArray[k] = remainder + 600;
                        }
                     }
                  }
               }
               waveXML.enemy[j].id = strArray.join("|");
            }
            wave.push(waveXML);
         }
         return wave;
      }
      
      internal function moveClick(event:MouseEvent) : *
      {
         trace("move");
         if(StatsManager.getStat(StatsManager.STAT_WARMOVES) > 0)
         {
            OverworldHUD.instance.warUI.useWarMove(1);
            this.canClose = false;
            QueryManager.instance.addWarSentry(this.mapid,this.playerside,this.selectedHex.xpos,this.selectedHex.ypos,StatsManager.id);
            this.playermarker.x = this.selectedHex.x;
            this.playermarker.y = this.selectedHex.y + 17;
            OverworldHUD.instance.warUI.initSelfSentry(this.mapid,this.selectedHex.xpos,this.selectedHex.ypos);
            if(this.selectedHex.xpos + 1 > this.wt / 2)
            {
               this.playermarker.scaleX = -0.5;
            }
            else
            {
               this.playermarker.scaleX = 0.5;
            }
            this.playermarker.visible = true;
            this.updateHexCanClick();
            this.warhexbgClick(null);
            if(StatsManager.usePlayerIO)
            {
               this.troopsloading.visible = true;
               this.troopsloading.prompttext.text = LangManager.getString(704);
            }
         }
         else
         {
            OverworldHUD.instance.showDialog(LangManager.getString(715),LangManager.getString(5));
            OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
         }
      }
      
      internal function postSideClick(event:MouseEvent) : *
      {
         var msg:String = null;
         var colorstr:String = null;
         if(this.words.text != LangManager.getString(318) && this.words.text != "")
         {
            msg = this.words.text.split("|").join("");
            msg = msg.split("\"").join("\'");
            msg = msg.split("\r").join("");
            msg = OverworldHUD.instance.censorWords(msg);
            colorstr = "<font color=\'#333333\'>";
            if(this.playerside == 1)
            {
               colorstr = "<font color=\'#990000\'>";
            }
            else if(this.playerside == 2)
            {
               colorstr = "<font color=\'#006600\'>";
            }
            else if(this.playerside == 3)
            {
               colorstr = "<font color=\'#000099\'>";
            }
            else if(this.playerside == 4)
            {
               colorstr = "<font color=\'#85762E\'>";
            }
            else if(StatsManager.isCustomClan(this.playerside))
            {
               colorstr = "<font color=\'" + StatsManager.getCustomClanTextColor() + "\'>";
            }
            this.msgtext.htmlText += colorstr + StatsManager.charname + ": </font><font color=\'#333333\'>" + msg + "</font><br>";
            QueryManager.instance.addWarMessage(this.mapid,this.playerside,this.playerside,StatsManager.charname,msg);
         }
         this.words.text = "";
      }
      
      internal function postAllClick(event:MouseEvent) : *
      {
         var msg:String = null;
         var colorstr:String = null;
         if(this.words.text != LangManager.getString(318) && this.words.text != "")
         {
            msg = this.words.text.split("|").join("");
            msg = msg.split("\"").join("\'");
            msg = msg.split("\r").join("");
            msg = OverworldHUD.instance.censorWords(msg);
            colorstr = "<font color=\'#333333\'>";
            this.msgtext.htmlText += colorstr + StatsManager.charname + ": </font><font color=\'#333333\'>" + msg + "</font><br>";
            QueryManager.instance.addWarMessage(this.mapid,0,this.playerside,StatsManager.charname,msg);
         }
         this.words.text = "";
      }
      
      internal function showMessages() : *
      {
         this.messageboardlabel.text = LangManager.getString(317);
         this.msgtext.htmlText = this.messages;
         this.scrollUpButton.visible = false;
         this.scrollDownButton.visible = false;
         this.actionslabel.visible = false;
         this.messageboardlabel.visible = true;
         this.msgtext.visible = true;
         this.words.visible = true;
         this.postsidebutton.visible = true;
         this.postallbutton.visible = true;
         this.scrollUpButton.y = 120;
         this.scrollDownButton.y = 300;
         this.descText.visible = false;
         if(this.msgtext.numLines > 12)
         {
            this.scrollUpButton.visible = true;
            this.scrollDownButton.visible = true;
         }
      }
      
      public function initMessages(str:String) : *
      {
         var innerStrArray:Array = null;
         var inner2StrArray:Array = null;
         var colorstr:String = null;
         var colorstr1:String = null;
         var colorstr2:String = null;
         var strArray:Array = str.split(String.fromCharCode(30));
         this.messages = "";
         for(var i:int = 0; i < strArray.length; i++)
         {
            if(strArray[i] != "")
            {
               innerStrArray = strArray[i].split(String.fromCharCode(31));
               colorstr = "<font color=\'#333333\'>";
               if(innerStrArray[2] == 1)
               {
                  colorstr = "<font color=\'#990000\'>";
               }
               else if(innerStrArray[2] == 2)
               {
                  colorstr = "<font color=\'#006600\'>";
               }
               else if(innerStrArray[2] == 3)
               {
                  colorstr = "<font color=\'#000099\'>";
               }
               else if(innerStrArray[2] == 4)
               {
                  colorstr = "<font color=\'#85762E\'>";
               }
               else if(StatsManager.isCustomClan(inner2StrArray[2]))
               {
                  if(this.playerside == inner2StrArray[2])
                  {
                     colorstr = "<font color=\'" + StatsManager.getCustomClanTextColor() + "\'>";
                  }
                  else
                  {
                     colorstr = "<font color=\'" + StatsManager.getEnemyCustomClanTextColor() + "\'>";
                  }
               }
               if(innerStrArray[0] != "[d]")
               {
                  this.messages += colorstr + innerStrArray[0] + ": </font><font color=\'#333333\'>" + innerStrArray[1] + "</font><br>";
               }
               else
               {
                  inner2StrArray = innerStrArray[1].split(",");
                  colorstr1 = "<font color=\'#333333\'>";
                  if(inner2StrArray[4] == 1)
                  {
                     colorstr1 = "<font color=\'#990000\'>";
                  }
                  else if(inner2StrArray[4] == 2)
                  {
                     colorstr1 = "<font color=\'#006600\'>";
                  }
                  else if(inner2StrArray[4] == 3)
                  {
                     colorstr1 = "<font color=\'#000099\'>";
                  }
                  else if(inner2StrArray[4] == 4)
                  {
                     colorstr1 = "<font color=\'#85762E\'>";
                  }
                  else if(StatsManager.isCustomClan(inner2StrArray[4]))
                  {
                     if(this.playerside == inner2StrArray[4])
                     {
                        colorstr1 = "<font color=\'" + StatsManager.getCustomClanTextColor() + "\'>";
                     }
                     else
                     {
                        colorstr1 = "<font color=\'" + StatsManager.getEnemyCustomClanTextColor() + "\'>";
                     }
                  }
                  colorstr2 = "<font color=\'#333333\'>";
                  if(inner2StrArray[5] == 1)
                  {
                     colorstr2 = "<font color=\'#990000\'>";
                  }
                  else if(inner2StrArray[5] == 2)
                  {
                     colorstr2 = "<font color=\'#006600\'>";
                  }
                  else if(inner2StrArray[5] == 3)
                  {
                     colorstr2 = "<font color=\'#000099\'>";
                  }
                  else if(inner2StrArray[5] == 4)
                  {
                     colorstr2 = "<font color=\'#85762E\'>";
                  }
                  else if(StatsManager.isCustomClan(inner2StrArray[5]))
                  {
                     if(this.playerside == inner2StrArray[5])
                     {
                        colorstr2 = "<font color=\'" + StatsManager.getCustomClanTextColor() + "\'>";
                     }
                     else
                     {
                        colorstr2 = "<font color=\'" + StatsManager.getEnemyCustomClanTextColor() + "\'>";
                     }
                  }
                  this.messages += "<font color=\'#333333\'>(" + inner2StrArray[0] + "," + inner2StrArray[1] + "):</font> " + colorstr1 + inner2StrArray[2] + "</font><font color=\'#333333\'>" + LangManager.getString(354) + "</font>" + colorstr2 + inner2StrArray[3] + "</font><br>";
               }
            }
         }
         this.msgtext.htmlText = this.messages;
         if(this.msgtext.numLines > 12)
         {
            this.msgtext.scrollV = this.msgtext.maxScrollV;
            this.scrollUpButton.visible = true;
            this.scrollDownButton.visible = true;
         }
      }
      
      public function initMessagesPIO(array:Array) : *
      {
         var inner2StrArray:Array = null;
         var colorstr:String = null;
         var colorstr1:String = null;
         var colorstr2:String = null;
         var o:DatabaseObject = null;
         array.sortOn("created",Array.NUMERIC);
         this.messages = "";
         for(var i:int = 0; i < array.length; i++)
         {
            o = array[i];
            colorstr = "<font color=\'#333333\'>";
            if(o.side == 1)
            {
               colorstr = "<font color=\'#990000\'>";
            }
            else if(o.side == 2)
            {
               colorstr = "<font color=\'#006600\'>";
            }
            else if(o.side == 3)
            {
               colorstr = "<font color=\'#000099\'>";
            }
            else if(o.side == 4)
            {
               colorstr = "<font color=\'#85762E\'>";
            }
            else if(StatsManager.isCustomClan(o.side))
            {
               if(o.side == this.playerside)
               {
                  colorstr = "<font color=\'" + StatsManager.getCustomClanTextColor() + "\'>";
               }
               else
               {
                  colorstr = "<font color=\'" + StatsManager.getEnemyCustomClanTextColor() + "\'>";
               }
            }
            if(o.charname != "[d]")
            {
               this.messages += colorstr + o.charname + ": </font><font color=\'#333333\'>" + o.msg + "</font><br>";
            }
            else
            {
               inner2StrArray = o.msg.split(",");
               colorstr1 = "<font color=\'#333333\'>";
               if(inner2StrArray[4] == 1)
               {
                  colorstr1 = "<font color=\'#990000\'>";
               }
               else if(inner2StrArray[4] == 2)
               {
                  colorstr1 = "<font color=\'#006600\'>";
               }
               else if(inner2StrArray[4] == 3)
               {
                  colorstr1 = "<font color=\'#000099\'>";
               }
               else if(inner2StrArray[4] == 4)
               {
                  colorstr1 = "<font color=\'#85762E\'>";
               }
               else if(StatsManager.isCustomClan(inner2StrArray[4]))
               {
                  if(inner2StrArray[4] == this.playerside)
                  {
                     colorstr1 = "<font color=\'" + StatsManager.getCustomClanTextColor() + "\'>";
                  }
                  else
                  {
                     colorstr1 = "<font color=\'" + StatsManager.getEnemyCustomClanTextColor() + "\'>";
                  }
               }
               colorstr2 = "<font color=\'#333333\'>";
               if(inner2StrArray[5] == 1)
               {
                  colorstr2 = "<font color=\'#990000\'>";
               }
               else if(inner2StrArray[5] == 2)
               {
                  colorstr2 = "<font color=\'#006600\'>";
               }
               else if(inner2StrArray[5] == 3)
               {
                  colorstr2 = "<font color=\'#000099\'>";
               }
               else if(inner2StrArray[5] == 4)
               {
                  colorstr2 = "<font color=\'#85762E\'>";
               }
               else if(StatsManager.isCustomClan(inner2StrArray[5]))
               {
                  if(inner2StrArray[5] == this.playerside)
                  {
                     colorstr2 = "<font color=\'" + StatsManager.getCustomClanTextColor() + "\'>";
                  }
                  else
                  {
                     colorstr2 = "<font color=\'" + StatsManager.getEnemyCustomClanTextColor() + "\'>";
                  }
               }
               this.messages += "<font color=\'#333333\'>(" + inner2StrArray[0] + "," + inner2StrArray[1] + "):</font> " + colorstr1 + inner2StrArray[2] + "</font><font color=\'#333333\'>" + LangManager.getString(354) + "</font>" + colorstr2 + inner2StrArray[3] + "</font><br>";
            }
         }
         this.msgtext.htmlText = this.messages;
         if(this.msgtext.numLines > 12)
         {
            this.msgtext.scrollV = this.msgtext.maxScrollV;
            this.scrollUpButton.visible = true;
            this.scrollDownButton.visible = true;
         }
      }
      
      internal function scrollUpClick(event:MouseEvent) : *
      {
         --this.msgtext.scrollV;
      }
      
      internal function scrollDownClick(event:MouseEvent) : *
      {
         ++this.msgtext.scrollV;
      }
      
      public function initWarHexData(hexStr:String, sentryStr:String) : *
      {
         this.selectedHex.initEnemyStrengthAndCost(hexStr);
         this.selectedHex.initSentry(sentryStr);
         this.selectedHex.hasData = true;
         OverworldHUD.instance.warUI.loading.visible = false;
         this.showDesc();
      }
      
      public function initWarHexDataPIO(sentryStr:String) : *
      {
         this.selectedHex.initSentry(sentryStr);
         this.selectedHex.hasData = true;
         OverworldHUD.instance.warUI.loading.visible = false;
         this.showDesc();
      }
      
      internal function troopsmarkerAnimationStart() : *
      {
         this.troopsmarkerCounter = 60;
         this.troopsmarker.visible = true;
      }
      
      internal function numberAnimationStart() : *
      {
         this.troopsmarkerCounter = 48;
         this.troopsmarker.visible = false;
         this.numbertext.visible = true;
         this.numbertext.alpha = 0;
      }
      
      public function updateAnimation(servertime:int) : *
      {
         if(!visible || !OverworldHUD.instance.warUI.visible)
         {
            return;
         }
         if(this.troopsmarkerCounter > 48)
         {
            this.troopsmarker.update();
            --this.troopsmarkerCounter;
            if(this.troopsmarkerCounter == 48)
            {
               this.troopsmarker.visible = false;
               this.numbertext.visible = true;
               this.numbertext.alpha = 0;
            }
         }
         else if(this.troopsmarkerCounter > 0)
         {
            this.numbertext.alpha = 1 - Math.abs(this.troopsmarkerCounter - 24) / 24;
            --this.troopsmarkerCounter;
            if(this.troopsmarkerCounter == 0)
            {
               this.numbertext.visible = false;
            }
         }
      }
      
      public function updateTime(servertime:int) : *
      {
         if(this.nextUpdate == 0)
         {
            return;
         }
         var timediff:int = this.nextUpdate - servertime;
         if(timediff > 5 * 60)
         {
            if(!this.isMapActive)
            {
               if(this.isNoMansLand)
               {
                  this.dayendslabel.text = LangManager.getString(584);
               }
               else if(this.territoryOwner == 0)
               {
                  this.dayendslabel.text = LangManager.getString(585);
               }
               else
               {
                  this.dayendslabel.text = LangManager.getString(586);
               }
            }
            else if(this.sideState == WarActiveBattle.MAPSTATE_INCOMING)
            {
               this.dayendslabel.text = LangManager.getString(587) + " " + this.getTimeString(timediff - 5 * 60);
            }
            else if(this.sideState == WarActiveBattle.MAPSTATE_OUTGOING)
            {
               this.dayendslabel.text = "Troops leaving in" + " " + this.getTimeString(timediff - 5 * 60);
            }
            else
            {
               this.dayendslabel.text = LangManager.getString(353) + this.getTimeString(timediff - 5 * 60);
            }
         }
         else if(timediff > 0)
         {
            this.troopsloading.visible = true;
            if(this.sideState == WarActiveBattle.MAPSTATE_INCOMING)
            {
               this.troopsloading.prompttext.text = LangManager.getString(587) + ": " + this.getTimeString(timediff);
            }
            if(this.sideState == WarActiveBattle.MAPSTATE_OUTGOING)
            {
               this.troopsloading.prompttext.text = "Troops leaving in" + ": " + this.getTimeString(timediff);
            }
            else
            {
               this.troopsloading.prompttext.text = LangManager.getString(355) + ": " + this.getTimeString(timediff);
            }
            this.dayendslabel.text = "";
         }
         else if(timediff <= 0)
         {
            this.troopsloading.visible = false;
            if(!this.alreadyRefreshed)
            {
               this.hide();
               OverworldHUD.instance.warUI.clearCache();
               this.alreadyRefreshed = true;
               OverworldHUD.instance.warUI.onShow();
            }
         }
         if(this.isMapActive && this.selectedHex != null && this.selectedHex.hextype == WarHex.HEX_CASTLE && this.selectedHex.owner == this.territoryOwner && this.isNextToPlayer(this.selectedHex) && this.selectedHex.isFrontline && QueryManager.instance.getServerTime() - this.castleGateTime <= 3 * 60 * 60)
         {
            this.descText.text = this.selectedHex.getDesc(this.playerside,this.castleGateTime);
         }
      }
      
      internal function getTimeString(totalSecs:int) : String
      {
         var secStr:String = null;
         var minStr:String = null;
         var secs:int = totalSecs % 60;
         var temp:int = (totalSecs - secs) / 60;
         var mins:int = temp % 60;
         var hours:int = (temp - mins) / 60;
         if(secs < 10)
         {
            secStr = "0" + secs.toString();
         }
         else
         {
            secStr = secs.toString();
         }
         if(mins < 10)
         {
            minStr = "0" + mins.toString();
         }
         else
         {
            minStr = mins.toString();
         }
         if(hours == 0)
         {
            return minStr + ":" + secStr;
         }
         return hours + ":" + minStr + ":" + secStr;
      }
      
      internal function getTerrainModifier() : Number
      {
         var fromValue:int = this.getTerrainValue(this.selfSentryX,this.selfSentryY);
         var toValue:int = this.getTerrainValue(this.selectedHex.xpos,this.selectedHex.ypos);
         if(this.selectedHex.hextype == WarHex.HEX_DEFENSE && this.selectedHex.cost == 0 || this.selectedHex.hextype == WarHex.HEX_CITY || this.selectedHex.hextype == WarHex.HEX_CASTLE)
         {
            toValue += 2;
         }
         switch(fromValue - toValue)
         {
            case 2:
               return 1.5;
            case 1:
               return 1.2;
            case 0:
               return 1;
            case -1:
               return 0.75;
            case -2:
               return 0.6;
            case -3:
               return 0.5;
            case -4:
               return 0.25;
            default:
               return 1;
         }
      }
      
      internal function getTerrainValue(x:int, y:int) : int
      {
         if(x < 0 || y < 0 || x > 5 || y > 5)
         {
            return 0;
         }
         return this.terrainArray[x][y].getTerrainValue();
      }
      
      public function setWarHexCallBack(status:int) : *
      {
         this.troopsloading.visible = false;
      }
      
      public function addWarSentryCallBack(status:int) : *
      {
         this.canClose = true;
         this.troopsloading.visible = false;
         if(status == 1)
         {
            OverworldHUD.instance.warUI.initSelfSentry(-1,-1,-1);
            OverworldHUD.instance.warUI.onLeave(null);
            OverworldHUD.instance.showDialog(LangManager.getString(705),LangManager.getString(5));
            OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
            OverworldHUD.instance.warUI.warSelectUI.placePlayerMarker();
         }
         else if(status == 2)
         {
            OverworldHUD.instance.warUI.initSelfSentry(-1,-1,-1);
            OverworldHUD.instance.warUI.onLeave(null);
            OverworldHUD.instance.showDialog(LangManager.getString(706),LangManager.getString(5));
            OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
            OverworldHUD.instance.warUI.warSelectUI.placePlayerMarker();
         }
         else if(status == 3)
         {
            OverworldHUD.instance.warUI.initSelfSentry(-1,-1,-1);
            OverworldHUD.instance.warUI.onLeave(null);
            OverworldHUD.instance.showDialog(LangManager.getString(831),LangManager.getString(5));
            OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
            OverworldHUD.instance.warUI.warSelectUI.placePlayerMarker();
         }
      }
      
      public function delSpawnPointCallBack(status:int) : *
      {
         var colorstr:String = null;
         var msg:String = null;
         this.canClose = true;
         if(status == 0)
         {
            if(this.selectedHex.getHexType() == WarHex.HEX_UPCOMINGSPAWNPOINT)
            {
               this.selectedHex.setHexType(WarHex.HEX_POTENTIALSPAWNPOINT);
               this.sideState = WarActiveBattle.MAPSTATE_DISABLED;
               this.activeState.updateState(this.playerside,0,this.selectedHex.xpos,this.selectedHex.ypos);
            }
            else
            {
               this.selectedHex.setHexType(WarHex.HEX_DEMOLISHEDSPAWNPOINT);
               this.sideState = WarActiveBattle.MAPSTATE_OUTGOING;
               this.activeState.updateState(this.playerside,3,this.selectedHex.xpos,this.selectedHex.ypos);
            }
            OverworldHUD.instance.showDialog(LangManager.getString(592),LangManager.getString(5));
            OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
            this.showDesc();
            if(!StatsManager.consoleEnabled)
            {
               msg = LangManager.getString(593) + "(" + this.selectedHex.xpos + "," + this.selectedHex.ypos + ")";
               this.warhexbgClick(null);
               colorstr = "<font color=\'#333333\'>";
               if(this.playerside == 1)
               {
                  colorstr = "<font color=\'#990000\'>";
               }
               else if(this.playerside == 2)
               {
                  colorstr = "<font color=\'#006600\'>";
               }
               else if(this.playerside == 3)
               {
                  colorstr = "<font color=\'#000099\'>";
               }
               else if(this.playerside == 4)
               {
                  colorstr = "<font color=\'#85762E\'>";
               }
               else if(StatsManager.isCustomClan(this.playerside))
               {
                  colorstr = "<font color=\'" + StatsManager.getCustomClanTextColor() + "\'>";
               }
               this.msgtext.htmlText += colorstr + StatsManager.charname + ": </font><font color=\'#333333\'>" + msg + "</font><br>";
               QueryManager.instance.addWarMessage(this.mapid,this.playerside,this.playerside,StatsManager.charname,msg);
            }
            OverworldHUD.instance.warUI.updateActiveBattleCache();
         }
         else
         {
            OverworldHUD.instance.showDialog(LangManager.getString(762),LangManager.getString(5));
            OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
         }
      }
      
      public function createSpawnPointCallBack(status:int) : *
      {
         var colorstr:String = null;
         var msg:String = null;
         this.canClose = true;
         if(status == 0)
         {
            OverworldHUD.instance.warUI.useWarMove(1);
            this.selectedHex.setHexType(WarHex.HEX_UPCOMINGSPAWNPOINT);
            if(this.activeState == null)
            {
               this.activeState = new WarActiveBattle(this.mapid);
               OverworldHUD.instance.warUI.warSelectUI.activeBattleList.push(this.activeState);
            }
            this.activeState.updateState(this.playerside,2,this.selectedHex.xpos,this.selectedHex.ypos);
            this.sideState = WarActiveBattle.MAPSTATE_INCOMING;
            OverworldHUD.instance.showDialog(LangManager.getString(589),LangManager.getString(5));
            OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
            this.showDesc();
            if(!StatsManager.consoleEnabled)
            {
               msg = LangManager.getString(590) + "(" + this.selectedHex.xpos + "," + this.selectedHex.ypos + ")";
               this.warhexbgClick(null);
               colorstr = "<font color=\'#333333\'>";
               if(this.playerside == 1)
               {
                  colorstr = "<font color=\'#990000\'>";
               }
               else if(this.playerside == 2)
               {
                  colorstr = "<font color=\'#006600\'>";
               }
               else if(this.playerside == 3)
               {
                  colorstr = "<font color=\'#000099\'>";
               }
               else if(this.playerside == 4)
               {
                  colorstr = "<font color=\'#85762E\'>";
               }
               else if(StatsManager.isCustomClan(this.playerside))
               {
                  colorstr = "<font color=\'" + StatsManager.getCustomClanTextColor() + "\'>";
               }
               this.msgtext.htmlText += colorstr + StatsManager.charname + ": </font><font color=\'#333333\'>" + msg + "</font><br>";
               QueryManager.instance.addWarMessage(this.mapid,this.playerside,this.playerside,StatsManager.charname,msg);
            }
            if(!StatsManager.usePlayerIO)
            {
               OverworldHUD.instance.warUI.updateActiveBattleCache();
            }
            else
            {
               QueryManagerPIO.instance.getSpawnPoints();
            }
         }
         else if(status == 1)
         {
            OverworldHUD.instance.warUI.useWarMove(1);
            this.selectedHex.setHexType(WarHex.HEX_SPAWNPOINT);
            this.activeState.updateState(this.playerside,1,this.selectedHex.xpos,this.selectedHex.ypos);
            this.sideState = WarActiveBattle.MAPSTATE_ENABLED;
            OverworldHUD.instance.showDialog(LangManager.getString(763),LangManager.getString(5));
            OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
            this.showDesc();
            if(!StatsManager.consoleEnabled)
            {
               msg = LangManager.getString(764) + "(" + this.selectedHex.xpos + "," + this.selectedHex.ypos + ")";
               this.warhexbgClick(null);
               colorstr = "<font color=\'#333333\'>";
               if(this.playerside == 1)
               {
                  colorstr = "<font color=\'#990000\'>";
               }
               else if(this.playerside == 2)
               {
                  colorstr = "<font color=\'#006600\'>";
               }
               else if(this.playerside == 3)
               {
                  colorstr = "<font color=\'#000099\'>";
               }
               else if(this.playerside == 4)
               {
                  colorstr = "<font color=\'#85762E\'>";
               }
               else if(StatsManager.isCustomClan(this.playerside))
               {
                  colorstr = "<font color=\'" + StatsManager.getCustomClanTextColor() + "\'>";
               }
               this.msgtext.htmlText += colorstr + StatsManager.charname + ": </font><font color=\'#333333\'>" + msg + "</font><br>";
               QueryManager.instance.addWarMessage(this.mapid,this.playerside,this.playerside,StatsManager.charname,msg);
            }
            if(!StatsManager.usePlayerIO)
            {
               OverworldHUD.instance.warUI.updateActiveBattleCache();
            }
            else
            {
               QueryManagerPIO.instance.getSpawnPoints();
            }
         }
         else if(status == 3)
         {
            OverworldHUD.instance.showDialog(LangManager.getString(591),LangManager.getString(5));
            OverworldHUD.instance.dialog.notifyDontChangeInputModeAfter();
         }
         QueryManagerPIO.instance.getCrops(StatsManager.getSide(),OverworldHUD.instance.warUI.warSelectUI.gotCrops);
      }
   }
}

