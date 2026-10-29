package
{
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol226")]
   public class WorldMapUI extends MovieClip
   {
      
      public static var WARMARKERSHIFTX:int = 8;
      
      public static var TERRSHIFTX:int = 21;
      
      public static var TERRSHIFTY:int = 51;
      
      public static var DTERRSHIFTX:int = TERRSHIFTX;
      
      public static var DTERRSHIFTY:int = TERRSHIFTY;
      
      public var castlelabel:TextField;
      
      public var citylabel:TextField;
      
      public var townlabel:TextField;
      
      public var villagelabel:TextField;
      
      public var selectionmarker:MovieClip;
      
      public var warmarkercanvas:Canvas;
      
      public var button_hitarea:Blocker;
      
      public var flagcanvas:Canvas;
      
      public var zoominbutton:RedButtonSmall;
      
      public var destroyedlabel:TextField;
      
      public var legendlabel:TextField;
      
      public var titletext:TextField;
      
      public var zoomoutbutton:RedButtonSmall;
      
      public var loading:MovieClip;
      
      public var colorlabel:TextField;
      
      public var closewindowbutton:SimpleButton;
      
      public var questlabel:TextField;
      
      public var destinationmarker:MovieClip;
      
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
      
      internal var destinationMapID:int = -1;
      
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
      
      internal var topLeftWorldMapMarkerTerrX:int;
      
      internal var topLeftWorldMapMarkerTerrY:int;
      
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
      
      internal var townState:String = "";
      
      public function WorldMapUI()
      {
         var i:int = 0;
         var warMarker:WorldMapMarker = null;
         var j:int = 0;
         super();
         LangManager.initTextField(this.titletext,true);
         var str:String = LangManager.getString(759);
         var outputstr:String = "";
         for(i = 0; i < str.length; i++)
         {
            outputstr += str.charAt(i) + "\n";
         }
         this.titletext.text = outputstr;
         this.warMarkerArray = new Array();
         this.warMarkerList = new Array();
         this.warFlagList = new Array();
         LangManager.initTextField(this.selectbattlelabel,true);
         this.selectbattlelabel.text = LangManager.getString(758);
         this.zoominbutton.setText(LangManager.getString(760));
         this.zoomoutbutton.setText(LangManager.getString(761));
         LangManager.initTextField(this.legendlabel,true);
         LangManager.initTextField(this.villagelabel,false);
         LangManager.initTextField(this.townlabel,false);
         LangManager.initTextField(this.citylabel,false);
         LangManager.initTextField(this.castlelabel,false);
         LangManager.initTextField(this.questlabel,false);
         LangManager.initTextField(this.colorlabel,false);
         this.destroyedlabel.text = LangManager.getString(811);
         this.legendlabel.text = LangManager.getString(767);
         this.villagelabel.text = LangManager.getString(450);
         this.townlabel.text = LangManager.getString(451);
         this.citylabel.text = LangManager.getString(452);
         this.castlelabel.text = LangManager.getString(453);
         this.questlabel.text = LangManager.getString(769);
         this.colorlabel.text = LangManager.getString(768);
         this.loading.prompt.text = LangManager.getString(25);
         this.playermarker = new MCSCharacter();
         this.playermarker.setPose("lightstanceidle",0);
         this.playermarker.scaleX = 0.5;
         this.playermarker.scaleY = 0.5;
         this.playermarker.x = 25;
         this.playermarker.y = 42;
         this.flagcanvas.addChild(this.playermarker);
         this.flagcanvas.addChild(this.destinationmarker);
         this.flagcanvas.addChild(this.selectionmarker);
         this.flagcanvas.mouseEnabled = false;
         this.flagcanvas.mouseChildren = false;
         this.button_hitarea.visible = false;
         if(StatsManager.isMobile)
         {
            this.zoominbutton.hitArea = this.button_hitarea;
            this.zoomoutbutton.hitArea = this.button_hitarea;
         }
         this.mapBitmapData = QuestEngine.getMapBitmapData();
         this.warMarkerList = QuestEngine.getWarMarkerList();
         for(i = 0; i < this.WARMARKERCOLS; i++)
         {
            this.warMarkerArray[i] = new Array();
            for(j = 0; j < this.WARMARKERROWS; j++)
            {
               warMarker = new WorldMapMarker();
               warMarker.scaleX = 1 / 5 * 5.5;
               warMarker.scaleY = 1 / 5 * 5.5;
               warMarker.x = i * 10 * 5.5;
               warMarker.y = j * 10 * 5.5;
               this.warmarkercanvas.addChild(warMarker);
               this.warMarkerArray[i][j] = warMarker;
            }
         }
         this.townState = QuestEngine.getTownsData();
      }
      
      internal function hasTerritory(territoryx:int, territoryy:int) : *
      {
         return this.mapBitmapData.getPixel(territoryx + TERRSHIFTX - WARMARKERSHIFTX,territoryy + TERRSHIFTY) != 0;
      }
      
      public function initWorldMapMarkers(worldStateStr:String) : *
      {
         if(worldStateStr != "")
         {
            this.worldState = worldStateStr;
         }
         this.loading.visible = false;
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
      }
      
      internal function placeDestinationMarker() : *
      {
         var mapid:int = 0;
         var terrx:int = 0;
         var terry:int = 0;
         if(this.destinationMapID != -1)
         {
            mapid = this.destinationMapID;
            terrx = (mapid >> 12 & 0x0FFF) - 341;
            terry = (mapid & 0x0FFF) - 341;
            this.destinationmarker.x = (terrx + TERRSHIFTX) * 10 + 5;
            this.destinationmarker.y = (terry + TERRSHIFTY) * 10 + 5;
            this.destinationmarker.visible = true;
            this.flagcanvas.setChildIndex(this.destinationmarker,this.flagcanvas.numChildren - 1);
         }
         else
         {
            this.destinationmarker.visible = false;
         }
         this.flagcanvas.setChildIndex(this.selectionmarker,this.flagcanvas.numChildren - 1);
      }
      
      public function initSelfSentry(s_mapid:int) : *
      {
         this.selfSentryMapID = s_mapid;
      }
      
      public function initDestination(s_mapid:int) : *
      {
         this.destinationMapID = s_mapid;
      }
      
      public function show() : *
      {
         visible = true;
         this.addEventListeners();
         StatsManager.getPlayer().stopMoving(false);
         if(!GameEngine.isOverworld())
         {
            InputManager.disableInput();
         }
         if(GameEngine.isAdventureMode())
         {
            NetworkManager.instance.playerUpdateBusy(true);
         }
         this.playermarker.initMCSFromEqString(StatsManager.getEquipmentString());
         this.initSelfSentry(NodeGenerator.instance.getTerritoryId(StageManager.getCurrentNode()));
         this.initDestination(NodeGenerator.instance.getTerritoryId(QuestGenerator.instance.getMarkedNode()));
         this.resetMapPos();
         var moveX:int = this.SPACEWIDTH / 2 - this.playermarker.x;
         var moveY:int = this.SPACEHEIGHT / 2 - this.playermarker.y;
         this.moveMap(moveX,moveY);
         TutorialUI.instance.setState(0);
         this.resetZoom();
         this.placePlayerMarker();
         this.placeDestinationMarker();
         if(this.worldState == null)
         {
            this.loading.visible = true;
            QueryManagerPIO.instance.getWorldMapTerritoryOwners();
         }
         else
         {
            this.initWorldMapMarkers("");
         }
      }
      
      internal function onLeave(event:MouseEvent) : *
      {
         this.hide();
      }
      
      public function hide() : *
      {
         visible = false;
         this.removeEventListeners();
         InputManager.setAdventureMode();
         OverworldHUD.instance.initForAdventureMode();
         NetworkManager.instance.playerUpdateBusy(false);
         this.resetZoom();
         OverworldHUD.instance.unHideAll();
      }
      
      public function addEventListeners() : *
      {
         addEventListener(MouseEvent.MOUSE_DOWN,this.doMouseDown);
         addEventListener(MouseEvent.MOUSE_UP,this.doMouseUp);
         this.zoominbutton.addEventListener(MouseEvent.CLICK,this.onZoomInClick);
         this.zoomoutbutton.addEventListener(MouseEvent.CLICK,this.zoomOutMap);
         this.closewindowbutton.addEventListener(MouseEvent.CLICK,this.onLeave);
      }
      
      public function removeEventListeners() : *
      {
         removeEventListener(MouseEvent.MOUSE_DOWN,this.doMouseDown);
         removeEventListener(MouseEvent.MOUSE_UP,this.doMouseUp);
         this.zoominbutton.removeEventListener(MouseEvent.CLICK,this.onZoomInClick);
         this.zoomoutbutton.removeEventListener(MouseEvent.CLICK,this.zoomOutMap);
         this.closewindowbutton.removeEventListener(MouseEvent.CLICK,this.onLeave);
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
         else if(!this.hasTerritory(territoryx,territoryy))
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
      
      internal function update() : *
      {
         var terrX:int = 0;
         var terrY:int = 0;
         var territoryid:int = 0;
         var xpos:int = 0;
         var ypos:int = 0;
         var diffx:int = 0;
         var diffy:int = 0;
         if(!visible)
         {
            return;
         }
         var mousex:int = (stage.mouseX - StatsManager.stageOffsetX) / StatsManager.stageScale;
         var mousey:int = (stage.mouseY - StatsManager.stageOffsetY) / StatsManager.stageScale;
         var oldstr:String = this.selectbattlelabel.text;
         var newstr:String = "";
         if(mousex < this.MAPSTARTX || mousex > this.MAPSTARTX + this.SPACEWIDTH || mousey < this.MAPSTARTY || mousey > this.MAPSTARTY + this.SPACEHEIGHT)
         {
            this.doDrag = false;
            if(this.zoomLevel == 5.5)
            {
               if(oldstr != "")
               {
                  this.selectbattlelabel.text = "";
               }
               this.selectionmarker.visible = false;
            }
            else
            {
               newstr = LangManager.getString(758);
               if(oldstr != newstr)
               {
                  this.selectbattlelabel.text = newstr;
               }
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
               if(this.hasTerritory(terrX,terrY))
               {
                  newstr = NameGenerator.instance.getPlaceName(territoryid) + " (" + (terrX + DTERRSHIFTX) + "," + (terrY + DTERRSHIFTY) + ") Level: " + NodeGenerator.instance.getTerritoryLevel(territoryid);
                  if(oldstr != newstr)
                  {
                     this.selectbattlelabel.text = newstr;
                  }
               }
               else if(oldstr != "")
               {
                  this.selectbattlelabel.text = "";
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
               this.selectionmarker.visible = true;
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
         var warMarker:WorldMapMarker = null;
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
                        ++this.topLeftWorldMapMarkerTerrX;
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
                        --this.topLeftWorldMapMarkerTerrX;
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
                        ++this.topLeftWorldMapMarkerTerrY;
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
                        --this.topLeftWorldMapMarkerTerrY;
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
                     this.initWorldMapMarker(warMarker,iIndex,jIndex);
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
         var warMarker:WorldMapMarker = null;
         var j:int = 0;
         if(this.zoomLevel < 5.5)
         {
            if(this.zoomLevel == 1)
            {
               this.zoomLevel = 5.5;
               this.zoomoutbutton.visible = true;
               this.zoominbutton.visible = false;
               this.warmarkercanvas.visible = true;
               this.selectionmarker.visible = true;
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
            this.destinationmarker.scaleX = 1 / this.zoomLevel;
            this.destinationmarker.scaleY = 1 / this.zoomLevel;
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
               this.topLeftWorldMapMarkerTerrX = Math.ceil((diffx - (this.map.x + this.MAPSTARTX)) / 55) - 8;
               this.topLeftWorldMapMarkerTerrY = Math.ceil((diffy - (this.map.y + this.MAPSTARTY)) / 55) + 2;
               for(i = 0; i < this.WARMARKERCOLS; i++)
               {
                  for(j = 0; j < this.WARMARKERROWS; j++)
                  {
                     warMarker = this.warMarkerArray[i][j];
                     warMarker.x = i * 10 * 5.5 + diffx;
                     warMarker.y = j * 10 * 5.5 + diffy;
                     this.initWorldMapMarker(warMarker,i,j);
                  }
               }
            }
         }
      }
      
      internal function initWorldMapMarker(warMarker:WorldMapMarker, i:int, j:int) : *
      {
         var territoryx:int = 0;
         var territoryy:int = 0;
         var mapid:int = 0;
         var tlvl:int = 0;
         var plvl:int = 0;
         var leveltype:int = 0;
         if(this.mapBitmapData.getPixel(i + this.topLeftWorldMapMarkerTerrX,j + this.topLeftWorldMapMarkerTerrY) != 0)
         {
            warMarker.visible = true;
            territoryx = i + this.topLeftWorldMapMarkerTerrX - TERRSHIFTX + 8;
            territoryy = j + this.topLeftWorldMapMarkerTerrY - TERRSHIFTY;
            mapid = territoryx + 341 << 12 | territoryy + 341;
            tlvl = NodeGenerator.instance.getTerritoryLevel(mapid);
            plvl = StatsManager.getLevel();
            leveltype = 0;
            if(tlvl - plvl > 3)
            {
               leveltype = 1;
            }
            else if(tlvl - plvl < -3)
            {
               leveltype = 2;
            }
            warMarker.setTownState(QuestEngine.getTownState(mapid),leveltype,this.getHexOwner(territoryx,territoryy));
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
            this.destinationmarker.scaleX = 1 / this.zoomLevel;
            this.destinationmarker.scaleY = 1 / this.zoomLevel;
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
         var warMarker:WorldMapMarker = null;
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
      
      public function setWorldState(str:String) : *
      {
         this.worldState = str;
      }
   }
}

