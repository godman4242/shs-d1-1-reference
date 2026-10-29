package
{
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol463")]
   public class WarSelectUI extends MovieClip
   {
      
      public static var WARMARKERSHIFTX:int = 8;
      
      public static var TERRSHIFTX:int = 21;
      
      public static var TERRSHIFTY:int = 51;
      
      public static var DTERRSHIFTX:int = TERRSHIFTX;
      
      public static var DTERRSHIFTY:int = TERRSHIFTY;
      
      public var selectionmarker:MovieClip;
      
      public var hqtext:TextField;
      
      public var nextbattlelabel:TextField;
      
      public var warmarkercanvas:Canvas;
      
      public var warstat:TextField;
      
      public var flagcanvas:Canvas;
      
      public var zoominbutton:RedButtonSmall;
      
      public var cropstext:TextField;
      
      public var titletext:TextField;
      
      public var zoomoutbutton:RedButtonSmall;
      
      public var closewindowbutton:SimpleButton;
      
      public var clanemblem:MovieClip;
      
      public var selectbattlelabel:TextField;
      
      public var map:MovieClip;
      
      public var grid:MovieClip;
      
      internal var warMarkerArray:Array;
      
      internal var warMarkerList:Array;
      
      internal var warFlagList:Array;
      
      internal var worldState:String;
      
      internal var activeBattleList:Array;
      
      internal var selfSentryMapID:int = -1;
      
      internal var selfSentryX:int = -1;
      
      internal var selfSentryY:int = -1;
      
      internal var doDrag:Boolean = false;
      
      internal var oldX:int;
      
      internal var oldY:int;
      
      internal var mouseMoved:Boolean;
      
      internal var playermarker:MCSCharacter;
      
      internal var gotoClanLocation:Boolean = false;
      
      internal var mapWidth:int = 63;
      
      internal var mapHeight:int = 72;
      
      internal var zoomLevel:Number = 1;
      
      internal var mapBitmapData:BitmapData;
      
      internal var topLeftWarMarkerTerrX:int;
      
      internal var topLeftWarMarkerTerrY:int;
      
      internal var SCROLLDIST:int = 10;
      
      internal var MAPSTARTX:int = 21;
      
      internal var MAPSTARTY:int = 63;
      
      internal var MAPWIDTH:int = 800;
      
      internal var MAPHEIGHT:int = 800;
      
      internal var SPACEWIDTH:int = 700;
      
      internal var SPACEHEIGHT:int = 330;
      
      internal var WARMARKERCOLS:int = 14;
      
      internal var WARMARKERROWS:int = 7;
      
      internal var cornerMarkerIndexX:int = 0;
      
      internal var cornerMarkerIndexY:int = 0;
      
      internal var friendlyHQCount:int;
      
      public function WarSelectUI()
      {
         var warMarker:WarMarker = null;
         var j:int = 0;
         super();
         this.warMarkerArray = new Array();
         this.warMarkerList = new Array();
         this.warFlagList = new Array();
         LangManager.initTextField(this.selectbattlelabel,true);
         LangManager.initTextField(this.cropstext,true);
         this.cropstext.text = "";
         this.cropstext.mouseEnabled = false;
         LangManager.initTextField(this.hqtext,true);
         this.hqtext.text = "";
         this.hqtext.mouseEnabled = false;
         this.selectbattlelabel.text = LangManager.getString(307);
         LangManager.initTextField(this.nextbattlelabel);
         this.nextbattlelabel.text = LangManager.getString(564);
         this.zoominbutton.setText(LangManager.getString(760));
         this.zoomoutbutton.setText(LangManager.getString(761));
         this.playermarker = new MCSCharacter();
         this.playermarker.setPose("lightstanceidle",0);
         this.playermarker.scaleX = 0.5;
         this.playermarker.scaleY = 0.5;
         this.playermarker.x = 25;
         this.playermarker.y = 42;
         this.flagcanvas.addChild(this.playermarker);
         this.flagcanvas.addChild(this.selectionmarker);
         if(StatsManager.isMobile)
         {
            this.selectionmarker.visible = false;
         }
         this.flagcanvas.mouseEnabled = false;
         this.flagcanvas.mouseChildren = false;
         this.mapBitmapData = QuestEngine.getMapBitmapData();
         this.warMarkerList = QuestEngine.getWarMarkerList();
         for(var i:int = 0; i < this.WARMARKERCOLS; i++)
         {
            this.warMarkerArray[i] = new Array();
            for(j = 0; j < this.WARMARKERROWS; j++)
            {
               warMarker = new WarMarker();
               warMarker.scaleX = 1 / 5 * 5.5;
               warMarker.scaleY = 1 / 5 * 5.5;
               warMarker.x = i * 10 * 5.5;
               warMarker.y = j * 10 * 5.5;
               this.warmarkercanvas.addChild(warMarker);
               this.warMarkerArray[i][j] = warMarker;
            }
         }
      }
      
      internal function hasTerritory(territoryx:int, territoryy:int) : *
      {
         return this.mapBitmapData.getPixel(territoryx + TERRSHIFTX - WARMARKERSHIFTX,territoryy + TERRSHIFTY) != 0;
      }
      
      public function initWarMarkers(worldStateStr:String, activeBattleStr:String) : *
      {
         var innerStrArray:Array = null;
         var warActiveBattle:WarActiveBattle = null;
         var max:int = 0;
         var terrx:int = 0;
         var terry:int = 0;
         var mapid:int = 0;
         var warFlag:WarFlag = null;
         var j:int = 0;
         if(worldStateStr != "")
         {
            this.worldState = worldStateStr;
         }
         this.friendlyHQCount = 0;
         var strArray:* = activeBattleStr.split("|");
         this.activeBattleList = new Array();
         for(var i:int = 0; i < strArray.length; i++)
         {
            innerStrArray = strArray[i].split(",");
            warActiveBattle = null;
            for(j = 0; j < this.activeBattleList.length; j++)
            {
               if(this.activeBattleList[j].getMapId() == innerStrArray[0])
               {
                  warActiveBattle = this.activeBattleList[j];
                  break;
               }
            }
            if(warActiveBattle == null)
            {
               warActiveBattle = new WarActiveBattle(innerStrArray[0]);
            }
            warActiveBattle.setState(innerStrArray[1],innerStrArray[2],innerStrArray[3],innerStrArray[4]);
            this.activeBattleList.push(warActiveBattle);
            if(innerStrArray[1] == StatsManager.getSide() && innerStrArray[2] != WarActiveBattle.MAPSTATE_DISABLED)
            {
               ++this.friendlyHQCount;
            }
         }
         this.resetZoom();
         max = int(this.warFlagList.length);
         for(i = 0; i < max; i++)
         {
            this.flagcanvas.removeChild(this.warFlagList[i]);
         }
         this.warFlagList.length = 0;
         this.activeBattleList.sortOn("territoryY",Array.NUMERIC);
         max = int(this.activeBattleList.length);
         for(i = 0; i < max; i++)
         {
            if(this.activeBattleList[i].isShowFlag())
            {
               mapid = int(this.activeBattleList[i].mapid);
               terrx = (mapid >> 12 & 0x0FFF) - 341;
               terry = (mapid & 0x0FFF) - 341;
               warFlag = new WarFlag(this.activeBattleList[i].getFlagSide(),this.getHexOwner(terrx,terry));
               warFlag.x = (terrx + TERRSHIFTX) * 10 + 4.5;
               warFlag.y = (terry + TERRSHIFTY) * 10 + 8.8;
               this.flagcanvas.addChild(warFlag);
               this.warFlagList.push(warFlag);
            }
         }
         this.placePlayerMarker();
         QueryManagerPIO.instance.getCrops(StatsManager.getSide(),this.gotCrops);
      }
      
      internal function placePlayerMarker() : *
      {
         var mapid:int = 0;
         var terrx:int = 0;
         var terry:int = 0;
         if(this.selfSentryMapID != -1)
         {
            mapid = this.selfSentryMapID;
            terrx = (mapid >> 12 & 0x0FFF) - 341;
            terry = (mapid & 0x0FFF) - 341;
            this.playermarker.x = (terrx + TERRSHIFTX) * 10 + 5;
            this.playermarker.y = (terry + TERRSHIFTY) * 10 + 8.5;
            this.playermarker.visible = true;
            this.flagcanvas.setChildIndex(this.playermarker,this.flagcanvas.numChildren - 1);
         }
         else
         {
            this.playermarker.visible = false;
         }
         this.flagcanvas.setChildIndex(this.selectionmarker,this.flagcanvas.numChildren - 1);
      }
      
      public function gotCrops(num:int) : *
      {
         var maxHQ:int = 0;
         var owned:int = 0;
         var cropsStr:String = null;
         if(StatsManager.isCustomClan(StatsManager.getSide()))
         {
            owned = StatsManager.getCustomClanOwned();
            cropsStr = "";
            if(owned == 0)
            {
               cropsStr = LangManager.getString(832);
            }
            else if(owned < 5)
            {
               cropsStr = LangManager.getString(833,[owned.toString(),"5"]);
            }
            else if(owned < 10)
            {
               cropsStr = LangManager.getString(833,[owned.toString(),"10"]);
            }
            else if(owned < StatsManager.MAJORCUSTOMCLANTHRESHHOLD)
            {
               cropsStr = LangManager.getString(834,[owned.toString()]);
            }
            else
            {
               cropsStr = LangManager.getString(835,[owned.toString()]);
            }
            this.cropstext.text = cropsStr;
            if(owned == 0)
            {
               maxHQ = 0;
            }
            else if(owned < 5)
            {
               maxHQ = 1;
            }
            else if(owned < 10)
            {
               maxHQ = 2;
            }
            else
            {
               maxHQ = 3;
            }
            if(this.friendlyHQCount > maxHQ)
            {
               maxHQ = this.friendlyHQCount;
            }
            if(StatsManager.getWarRank() >= 9)
            {
               this.hqtext.text = LangManager.getString(808) + ":  " + this.friendlyHQCount + " / " + maxHQ;
            }
            else
            {
               this.hqtext.text = "";
            }
            return;
         }
         this.cropstext.text = LangManager.getString(807) + ": " + num;
         if(num >= 200)
         {
            this.cropstext.appendText(" (+2 HQ)");
         }
         else if(num >= 100)
         {
            this.cropstext.appendText(" (+1 HQ)");
         }
         maxHQ = 3 + Math.floor(num / 100);
         if(maxHQ > 5)
         {
            maxHQ = 5;
         }
         if(this.friendlyHQCount > maxHQ)
         {
            maxHQ = this.friendlyHQCount;
         }
         if(StatsManager.getWarRank() >= 9)
         {
            this.hqtext.text = LangManager.getString(808) + ":  " + this.friendlyHQCount + " / " + maxHQ;
         }
         else
         {
            this.hqtext.text = "";
         }
      }
      
      public function initSelfSentry(s_mapid:int, s_x:int, s_y:int) : *
      {
         var doPlaceMapMarker:Boolean = this.selfSentryMapID != s_mapid;
         this.selfSentryMapID = s_mapid;
         this.selfSentryX = s_x;
         this.selfSentryY = s_y;
         if(doPlaceMapMarker)
         {
            this.placePlayerMarker();
         }
      }
      
      public function show() : *
      {
         var sidename:String = null;
         var warFlag:WarFlag = null;
         visible = true;
         this.addEventListeners();
         var side:int = StatsManager.getSide();
         if(StatsManager.isCustomClan(side))
         {
            this.clanemblem.gotoAndStop(7);
            this.clanemblem.custom.init(StatsManager.getCustomClanColor(),StatsManager.getCustomClanLogoId(),StatsManager.getCustomClanLogoColor());
         }
         else
         {
            this.clanemblem.gotoAndStop(side);
         }
         if(side == 1)
         {
            sidename = LangManager.getString(275);
         }
         else if(side == 2)
         {
            sidename = LangManager.getString(276);
         }
         else if(side == 3)
         {
            sidename = LangManager.getString(277);
         }
         else if(side == 4)
         {
            sidename = LangManager.getString(278);
         }
         else
         {
            sidename = LangManager.getString(563) + " " + StatsManager.getCustomClanName();
         }
         this.warstat.text = LangManager.getString(245) + ": " + sidename + "\n";
         this.warstat.appendText(LangManager.getString(153) + ": " + StatsManager.getWarRankName() + " (" + StatsManager.getMaxWarMoves() + LangManager.getString(329) + ")\n");
         var warMovesMade:int = StatsManager.getStat(StatsManager.STAT_WARMOVESMADE) + int(StatsManager.getStat(StatsManager.STAT_WARCOINSDONATED) / 1000);
         if(StatsManager.getWarRank() < 10)
         {
            this.warstat.appendText(LangManager.getString(397) + ": " + warMovesMade + "/" + StatsManager.getWarMovesToNextRank());
         }
         this.playermarker.initMCSFromEqString(StatsManager.getEquipmentString());
         this.resetMapPos();
         var max:int = int(this.warFlagList.length);
         var moveX:int = 0;
         var moveY:int = 0;
         for(var i:int = 0; i < max; i++)
         {
            warFlag = this.warFlagList[i];
            warFlag.playFlag();
            if(warFlag.getSide() == StatsManager.getSide())
            {
               moveX = this.SPACEWIDTH / 2 - warFlag.x;
               moveY = this.SPACEHEIGHT / 2 - warFlag.y;
            }
         }
         this.moveMap(moveX,moveY);
      }
      
      public function hide() : *
      {
         visible = false;
         this.removeEventListeners();
         var max:int = int(this.warFlagList.length);
         for(var i:int = 0; i < max; i++)
         {
            this.warFlagList[i].stopFlag();
         }
      }
      
      public function addEventListeners() : *
      {
         if(StatsManager.canChangeSide)
         {
            this.clanemblem.addEventListener(MouseEvent.CLICK,this.clanemblemClick);
         }
         addEventListener(MouseEvent.MOUSE_DOWN,this.doMouseDown);
         addEventListener(MouseEvent.MOUSE_UP,this.doMouseUp);
         this.zoominbutton.addEventListener(MouseEvent.CLICK,this.onZoomInClick);
         this.zoomoutbutton.addEventListener(MouseEvent.CLICK,this.zoomOutMap);
      }
      
      public function removeEventListeners() : *
      {
         if(StatsManager.canChangeSide)
         {
            this.clanemblem.removeEventListener(MouseEvent.CLICK,this.clanemblemClick);
         }
         removeEventListener(MouseEvent.MOUSE_DOWN,this.doMouseDown);
         removeEventListener(MouseEvent.MOUSE_UP,this.doMouseUp);
         this.zoominbutton.removeEventListener(MouseEvent.CLICK,this.onZoomInClick);
         this.zoomoutbutton.removeEventListener(MouseEvent.CLICK,this.zoomOutMap);
      }
      
      internal function doMouseDown(event:MouseEvent) : *
      {
         this.doDrag = true;
         this.oldX = (event.stageX - StatsManager.stageOffsetX) / StatsManager.stageScale;
         this.oldY = (event.stageY - StatsManager.stageOffsetY) / StatsManager.stageScale;
         this.mouseMoved = false;
      }
      
      internal function doMouseUp(event:MouseEvent) : *
      {
         var warActiveBattle:WarActiveBattle = null;
         var max:int = 0;
         var mapid:int = 0;
         var i:int = 0;
         var mouseX:int = (event.stageX - StatsManager.stageOffsetX) / StatsManager.stageScale;
         var mouseY:int = (event.stageY - StatsManager.stageOffsetY) / StatsManager.stageScale;
         this.doDrag = false;
         if(this.mouseMoved || mouseX < this.MAPSTARTX || mouseX > this.MAPSTARTX + this.SPACEWIDTH || mouseY < this.MAPSTARTY || mouseY > this.MAPSTARTY + this.SPACEHEIGHT)
         {
            return;
         }
         var territoryx:int = Math.floor((-this.map.x + mouseX) / (10 * this.zoomLevel)) - TERRSHIFTX;
         var territoryy:int = Math.floor((-this.map.y + mouseY) / (10 * this.zoomLevel)) - TERRSHIFTY;
         if(this.zoomLevel < 5.5)
         {
            this.zoomInMap(mouseX,mouseY);
         }
         else if(this.hasTerritory(territoryx,territoryy))
         {
            if(StatsManager.isMobile)
            {
               this.selectionmarker.visible = true;
            }
            max = int(this.activeBattleList.length);
            mapid = territoryx + 341 << 12 | territoryy + 341;
            for(i = 0; i < max; i++)
            {
               if(this.activeBattleList[i].getMapId() == mapid)
               {
                  warActiveBattle = this.activeBattleList[i];
                  break;
               }
            }
            OverworldHUD.instance.warUI.showHex(mapid,this.getHexOwner(territoryx,territoryy),warActiveBattle);
         }
         else
         {
            this.zoomOutMap(null);
         }
      }
      
      internal function getHexOwner(territoryx:int, territoryy:int) : int
      {
         if(!this.hasTerritory(territoryx,territoryy))
         {
            return -1;
         }
         var mapid:int = territoryx + 341 << 12 | territoryy + 341;
         var max:int = int(this.warMarkerList.length);
         for(var i:int = 0; i < max; i++)
         {
            if(this.warMarkerList[i] == mapid)
            {
               if(i < this.worldState.length)
               {
                  return this.worldState.charAt(i).charCodeAt(0) - QueryManagerPIO.WORLDSTATESTR_ASCIIADD;
               }
               return 0;
            }
         }
         return 0;
      }
      
      internal function updateHexOwner(mapid:int, side:int) : *
      {
         var str:String = null;
         var max:int = int(this.warMarkerList.length);
         for(var i:int = 0; i < max; i++)
         {
            if(this.warMarkerList[i] == mapid)
            {
               str = this.worldState.substr(0,i) + String.fromCharCode(side) + this.worldState.substr(i + 1);
               OverworldHUD.instance.warUI.worldStateCache = str;
               this.worldState = str;
               return;
            }
         }
      }
      
      internal function update() : *
      {
         var terrX:int = 0;
         var terrY:int = 0;
         var territoryid:int = 0;
         var xpos:int = 0;
         var ypos:int = 0;
         var diffx:int = 0;
         var diffy:int = 0;
         var mousex:int = (stage.mouseX - StatsManager.stageOffsetX) / StatsManager.stageScale;
         var mousey:int = (stage.mouseY - StatsManager.stageOffsetY) / StatsManager.stageScale;
         var oldstr:String = this.selectbattlelabel.text;
         var newstr:String = "";
         if(mousex < this.MAPSTARTX || mousex > this.MAPSTARTX + this.SPACEWIDTH || mousey < this.MAPSTARTY || mousey > this.MAPSTARTY + this.SPACEHEIGHT)
         {
            this.doDrag = false;
            newstr = LangManager.getString(307);
            if(oldstr != newstr)
            {
               this.selectbattlelabel.text = newstr;
            }
            if(this.zoomLevel == 5.5)
            {
               this.selectionmarker.visible = false;
            }
            return;
         }
         if(!this.doDrag)
         {
            terrX = Math.floor((-this.map.x + mousex) / (10 * this.zoomLevel)) - TERRSHIFTX;
            terrY = Math.floor((-this.map.y + mousey) / (10 * this.zoomLevel)) - TERRSHIFTY;
            territoryid = terrX + 341 << 12 | terrY + 341;
            if(this.zoomLevel == 5.5)
            {
               if(!StatsManager.isMobile && Boolean(this.hasTerritory(terrX,terrY)))
               {
                  newstr = LangManager.getString(307) + " (" + (terrX + DTERRSHIFTX) + "," + (terrY + DTERRSHIFTY) + "): " + NameGenerator.instance.getPlaceName(territoryid);
                  if(oldstr != newstr)
                  {
                     this.selectbattlelabel.text = newstr;
                  }
               }
               else
               {
                  newstr = LangManager.getString(307);
                  if(oldstr != newstr)
                  {
                     this.selectbattlelabel.text = newstr;
                  }
               }
               xpos = (terrX + TERRSHIFTX) * 10 + 5;
               ypos = (terrY + TERRSHIFTY) * 10 + 5;
               if(this.selectionmarker.x != xpos)
               {
                  this.selectionmarker.x = xpos;
               }
               if(this.selectionmarker.y != ypos)
               {
                  this.selectionmarker.y = ypos;
               }
               if(!StatsManager.isMobile)
               {
                  this.selectionmarker.visible = true;
               }
            }
            else
            {
               newstr = LangManager.getString(758);
               if(oldstr != newstr)
               {
                  this.selectbattlelabel.text = LangManager.getString(758);
               }
               this.selectionmarker.visible = false;
            }
         }
         if(this.doDrag && mousex != this.oldX && mousey != this.oldY)
         {
            diffx = mousex - this.oldX;
            diffy = mousey - this.oldY;
            if(Math.abs(diffx) + Math.abs(diffy) < 3)
            {
               if(!this.mouseMoved)
               {
                  this.mouseMoved = false;
               }
               return;
            }
            this.mouseMoved = true;
            this.oldX = mousex;
            this.oldY = mousey;
            this.moveMap(diffx,diffy);
         }
      }
      
      internal function resetMapPos() : *
      {
         var moveX:int = this.MAPSTARTX - this.map.x;
         var moveY:int = this.MAPSTARTY - this.map.y;
         this.moveMap(moveX,moveY);
      }
      
      internal function moveMap(diffx:int, diffy:int) : *
      {
         var warMarker:WarMarker = null;
         var colShifted:int = 0;
         var colShiftedLeft:Boolean = false;
         var rowShifted:int = 0;
         var rowShiftedDown:Boolean = false;
         var i:int = 0;
         var j:int = 0;
         var iIndex:int = 0;
         var jIndex:int = 0;
         if(diffx > 0 && this.map.x + diffx > this.MAPSTARTX)
         {
            diffx = this.MAPSTARTX - this.map.x;
         }
         else if(diffx < 0 && this.map.x + diffx < this.MAPSTARTX - (this.MAPWIDTH * this.zoomLevel - this.SPACEWIDTH))
         {
            diffx = this.MAPSTARTX - (this.MAPWIDTH * this.zoomLevel - this.SPACEWIDTH) - this.map.x;
         }
         if(diffy > 0 && this.map.y + diffy > this.MAPSTARTY)
         {
            diffy = this.MAPSTARTY - this.map.y;
         }
         else if(diffy < 0 && this.map.y + diffy < this.MAPSTARTY - (this.MAPHEIGHT * this.zoomLevel - this.SPACEHEIGHT))
         {
            diffy = this.MAPSTARTY - (this.MAPHEIGHT * this.zoomLevel - this.SPACEHEIGHT) - this.map.y;
         }
         if(this.zoomLevel == 5.5)
         {
            if(diffx > 55)
            {
               diffx = 55;
            }
            else if(diffx < -55)
            {
               diffx = -55;
            }
            if(diffy > 55)
            {
               diffy = 55;
            }
            else if(diffy < -55)
            {
               diffy = -55;
            }
         }
         this.map.x += diffx;
         this.grid.x = this.map.x;
         this.flagcanvas.x = this.map.x;
         this.map.y += diffy;
         this.grid.y = this.map.y;
         this.flagcanvas.y = this.map.y;
         if(this.zoomLevel == 5.5)
         {
            colShifted = -1;
            colShiftedLeft = false;
            rowShifted = -1;
            rowShiftedDown = false;
            for(i = 0; i < this.WARMARKERCOLS; i++)
            {
               for(j = 0; j < this.WARMARKERROWS; j++)
               {
                  warMarker = this.warMarkerArray[i][j];
                  warMarker.x += diffx;
                  warMarker.y += diffy;
                  if(warMarker.x < -55)
                  {
                     warMarker.x += this.WARMARKERCOLS * 55;
                     if(colShifted == -1)
                     {
                        ++this.topLeftWarMarkerTerrX;
                        ++this.cornerMarkerIndexX;
                        if(this.cornerMarkerIndexX == this.WARMARKERCOLS)
                        {
                           this.cornerMarkerIndexX = 0;
                        }
                        colShifted = i;
                        colShiftedLeft = false;
                     }
                  }
                  else if(warMarker.x > (this.WARMARKERCOLS - 1) * 55)
                  {
                     warMarker.x -= this.WARMARKERCOLS * 55;
                     if(colShifted == -1)
                     {
                        --this.topLeftWarMarkerTerrX;
                        --this.cornerMarkerIndexX;
                        if(this.cornerMarkerIndexX == -1)
                        {
                           this.cornerMarkerIndexX = this.WARMARKERCOLS - 1;
                        }
                        colShifted = i;
                        colShiftedLeft = true;
                     }
                  }
                  if(warMarker.y < -55)
                  {
                     warMarker.y += this.WARMARKERROWS * 55;
                     if(rowShifted == -1)
                     {
                        ++this.topLeftWarMarkerTerrY;
                        ++this.cornerMarkerIndexY;
                        if(this.cornerMarkerIndexY == this.WARMARKERROWS)
                        {
                           this.cornerMarkerIndexY = 0;
                        }
                        rowShifted = j;
                        rowShiftedDown = true;
                     }
                  }
                  else if(warMarker.y > (this.WARMARKERROWS - 1) * 55)
                  {
                     warMarker.y -= this.WARMARKERROWS * 55;
                     if(rowShifted == -1)
                     {
                        --this.topLeftWarMarkerTerrY;
                        --this.cornerMarkerIndexY;
                        if(this.cornerMarkerIndexY == -1)
                        {
                           this.cornerMarkerIndexY = this.WARMARKERROWS - 1;
                        }
                        rowShifted = j;
                        rowShiftedDown = false;
                     }
                  }
                  iIndex = i - this.cornerMarkerIndexX;
                  jIndex = j - this.cornerMarkerIndexY;
                  if(iIndex < 0)
                  {
                     iIndex = this.WARMARKERCOLS + iIndex;
                  }
                  if(jIndex < 0)
                  {
                     jIndex = this.WARMARKERROWS + jIndex;
                  }
                  if(i == colShifted || j == rowShifted)
                  {
                     this.initWarMarker(warMarker,iIndex,jIndex);
                  }
               }
            }
         }
      }
      
      internal function onZoomInClick(event:MouseEvent) : *
      {
         var centerX:int = this.MAPSTARTX + this.SPACEWIDTH / 2;
         var centerY:int = this.MAPSTARTY + this.SPACEHEIGHT / 2;
         this.zoomInMap(centerX,centerY);
      }
      
      internal function zoomInMap(centerX:int, centerY:int) : *
      {
         var max:int = 0;
         var warFlag:WarFlag = null;
         var i:int = 0;
         var diffx:int = 0;
         var diffy:int = 0;
         var warMarker:WarMarker = null;
         var j:int = 0;
         if(this.zoomLevel < 5.5)
         {
            if(this.zoomLevel == 1)
            {
               this.zoomLevel = 5.5;
               this.zoomoutbutton.visible = true;
               this.zoominbutton.visible = false;
               this.warmarkercanvas.visible = true;
               if(!StatsManager.isMobile)
               {
                  this.selectionmarker.visible = true;
               }
            }
            this.scaleAround(this.map,centerX,centerY,this.zoomLevel);
            max = int(this.warFlagList.length);
            for(i = 0; i < max; i++)
            {
               warFlag = this.warFlagList[i];
               warFlag.scaleX = 1 / this.zoomLevel;
               warFlag.scaleY = 1 / this.zoomLevel;
            }
            this.playermarker.scaleX = 0.5 / this.zoomLevel;
            this.playermarker.scaleY = 0.5 / this.zoomLevel;
            this.selectionmarker.scaleX = 1 / this.zoomLevel;
            this.selectionmarker.scaleY = 1 / this.zoomLevel;
            this.grid.scaleX = this.zoomLevel;
            this.grid.scaleY = this.zoomLevel;
            this.flagcanvas.scaleX = this.zoomLevel;
            this.flagcanvas.scaleY = this.zoomLevel;
            this.grid.x = this.map.x;
            this.flagcanvas.x = this.map.x;
            this.grid.y = this.map.y;
            this.flagcanvas.y = this.map.y;
            this.cornerMarkerIndexX = 0;
            this.cornerMarkerIndexY = 0;
            if(this.warmarkercanvas.visible)
            {
               diffx = (this.map.x - this.MAPSTARTX) % 55;
               diffy = (this.map.y - this.MAPSTARTY) % 55;
               this.topLeftWarMarkerTerrX = Math.ceil((diffx - (this.map.x + this.MAPSTARTX)) / 55) - 8;
               this.topLeftWarMarkerTerrY = Math.ceil((diffy - (this.map.y + this.MAPSTARTY)) / 55) + 2;
               for(i = 0; i < this.WARMARKERCOLS; i++)
               {
                  for(j = 0; j < this.WARMARKERROWS; j++)
                  {
                     warMarker = this.warMarkerArray[i][j];
                     warMarker.x = i * 10 * 5.5 + diffx;
                     warMarker.y = j * 10 * 5.5 + diffy;
                     this.initWarMarker(warMarker,i,j);
                  }
               }
            }
         }
      }
      
      internal function initWarMarker(warMarker:WarMarker, i:int, j:int) : *
      {
         if(this.mapBitmapData.getPixel(i + this.topLeftWarMarkerTerrX,j + this.topLeftWarMarkerTerrY) != 0)
         {
            warMarker.visible = true;
            warMarker.setOwner(this.getHexOwner(i + this.topLeftWarMarkerTerrX - TERRSHIFTX + 8,j + this.topLeftWarMarkerTerrY - TERRSHIFTY));
         }
         else
         {
            warMarker.visible = false;
         }
      }
      
      internal function zoomOutMap(event:MouseEvent) : *
      {
         var centerX:int = 0;
         var centerY:int = 0;
         var max:int = 0;
         var warFlag:WarFlag = null;
         var i:int = 0;
         if(this.zoomLevel > 1)
         {
            centerX = this.MAPSTARTX + this.SPACEWIDTH / 2;
            centerY = this.MAPSTARTY + this.SPACEHEIGHT / 2;
            if(this.zoomLevel == 5.5)
            {
               this.zoomLevel = 1;
               this.zoominbutton.visible = true;
               this.zoomoutbutton.visible = false;
               this.warmarkercanvas.visible = false;
               this.selectionmarker.visible = false;
            }
            this.scaleAround(this.map,centerX,centerY,this.zoomLevel);
            max = int(this.warFlagList.length);
            for(i = 0; i < max; i++)
            {
               warFlag = this.warFlagList[i];
               warFlag.scaleX = 1 / this.zoomLevel;
               warFlag.scaleY = 1 / this.zoomLevel;
            }
            this.playermarker.scaleX = 0.5 / this.zoomLevel;
            this.playermarker.scaleY = 0.5 / this.zoomLevel;
            this.selectionmarker.scaleX = 1 / this.zoomLevel;
            this.selectionmarker.scaleY = 1 / this.zoomLevel;
            if(this.map.x > this.MAPSTARTX)
            {
               this.map.x = this.MAPSTARTX;
            }
            else if(this.map.x < this.MAPSTARTX - (this.MAPWIDTH * this.zoomLevel - this.SPACEWIDTH))
            {
               this.map.x = this.MAPSTARTX - (this.MAPWIDTH * this.zoomLevel - this.SPACEWIDTH);
            }
            if(this.map.y > this.MAPSTARTY)
            {
               this.map.y = this.MAPSTARTY;
            }
            else if(this.map.y < this.MAPSTARTY - (this.MAPHEIGHT * this.zoomLevel - this.SPACEHEIGHT))
            {
               this.map.y = this.MAPSTARTY - (this.MAPHEIGHT * this.zoomLevel - this.SPACEHEIGHT);
            }
            this.grid.scaleX = this.zoomLevel;
            this.grid.scaleY = this.zoomLevel;
            this.flagcanvas.scaleX = this.zoomLevel;
            this.flagcanvas.scaleY = this.zoomLevel;
            this.grid.x = this.map.x;
            this.flagcanvas.x = this.map.x;
            this.grid.y = this.map.y;
            this.flagcanvas.y = this.map.y;
         }
      }
      
      internal function resetZoom() : *
      {
         var warMarker:WarMarker = null;
         var j:int = 0;
         this.zoomLevel = 5.5;
         this.zoomOutMap(null);
         for(var i:int = 0; i < this.WARMARKERCOLS; i++)
         {
            for(j = 0; j < this.WARMARKERROWS; j++)
            {
               warMarker = this.warMarkerArray[i][j];
               warMarker.cacheAsBitmap = false;
            }
         }
      }
      
      internal function scaleAround(target:MovieClip, offsetX:int, offsetY:int, scale:Number) : *
      {
         var point:Point = new Point(offsetX,offsetY);
         var scaleFactor:Number = scale / target.scaleX;
         var m:Matrix = target.transform.matrix;
         m.translate(-point.x,-point.y);
         m.scale(scaleFactor,scaleFactor);
         m.translate(point.x,point.y);
         target.transform.matrix = m;
      }
      
      internal function clanemblemClick(event:MouseEvent) : *
      {
         this.hide();
         OverworldHUD.instance.warUI.showChooseSide();
      }
   }
}

