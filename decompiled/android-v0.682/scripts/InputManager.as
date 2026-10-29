package
{
   import flash.display.CapsStyle;
   import flash.display.JointStyle;
   import flash.display.LineScaleMode;
   import flash.display.MovieClip;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   
   public class InputManager
   {
      
      internal static var stageMC:Stage;
      
      internal static var canvas:MovieClip;
      
      internal static var debugcanvas:MovieClip;
      
      internal static var mousePressed:Boolean = false;
      
      internal static var drawArray:Vector.<Point> = new Vector.<Point>();
      
      internal static var oldMouseX:int = 0;
      
      internal static var oldMouseY:int = 0;
      
      internal static var distanceLeft:int = 0;
      
      internal static var touchX:int = 0;
      
      internal static var touchY:int = 0;
      
      internal static var OVERWORLD_MODE:int = 0;
      
      internal static var BATTLE_MODE:int = 1;
      
      internal static var NOINPUT_MODE:int = 3;
      
      internal static var ADVENTURE_MODE:int = 4;
      
      internal static var BATTLEAUTOSLASH_MODE:int = 5;
      
      internal static var inputMode:int = OVERWORLD_MODE;
      
      internal static var debug:Boolean = false;
      
      internal static var maxDistance:int = 200;
      
      internal static var lengthThreshhold:int = 4;
      
      internal static var distThreshhold:int = 400;
      
      internal static var thickness:int = 8;
      
      internal static var largestUnit:int = 20;
      
      internal static var adventureCounter:int = 0;
      
      public function InputManager()
      {
         super();
      }
      
      public static function initStage(stage:Stage) : *
      {
         stageMC = stage;
         if(canvas == null)
         {
            canvas = new Canvas();
         }
         stageMC.addChild(canvas);
         if(debug)
         {
            debugcanvas = new Canvas();
            stageMC.addChild(debugcanvas);
         }
         if(!StatsManager.isMobile)
         {
            stageMC.addEventListener(Event.DEACTIVATE,flashDeactivate);
            stageMC.addEventListener(Event.ACTIVATE,flashActivate);
         }
         stageMC.addEventListener(KeyboardEvent.KEY_UP,keyUpEvent);
         stageMC.addEventListener(KeyboardEvent.KEY_DOWN,keyDownEvent);
      }
      
      internal static function flashActivate(event:Event) : *
      {
         if(inputMode == ADVENTURE_MODE)
         {
            NetworkManager.instance.playerUpdateBusy(false);
         }
      }
      
      internal static function flashDeactivate(event:Event) : *
      {
         if(inputMode == ADVENTURE_MODE)
         {
            NetworkManager.instance.playerUpdateBusy(true);
         }
      }
      
      public static function setMaxDistance(num:int) : *
      {
         maxDistance = num;
      }
      
      public static function initBattleMode() : *
      {
         stageMC.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownEvent);
         stageMC.addEventListener(MouseEvent.MOUSE_UP,mouseUpEvent);
         stageMC.addEventListener(Event.MOUSE_LEAVE,mouseLeaveEvent);
         inputMode = BATTLE_MODE;
         mousePressed = false;
      }
      
      public static function initOverworldMode() : *
      {
         stageMC.removeEventListener(MouseEvent.MOUSE_DOWN,mouseDownEvent);
         stageMC.removeEventListener(MouseEvent.MOUSE_UP,mouseUpEvent);
         stageMC.removeEventListener(Event.MOUSE_LEAVE,mouseLeaveEvent);
         inputMode = OVERWORLD_MODE;
      }
      
      public static function setOverworldMode() : *
      {
         inputMode = OVERWORLD_MODE;
      }
      
      public static function setBattleMode() : *
      {
         if(StatsManager.autoSlash)
         {
            setBattleAutoSlashMode();
         }
         else
         {
            inputMode = BATTLE_MODE;
            clearCanvas();
            mousePressed = false;
         }
      }
      
      public static function setBattleAutoSlashMode() : *
      {
         inputMode = BATTLEAUTOSLASH_MODE;
         clearCanvas();
         mousePressed = false;
      }
      
      public static function setAdventureMode() : *
      {
         inputMode = ADVENTURE_MODE;
         clearCanvas();
         mousePressed = false;
      }
      
      public static function disableInput() : *
      {
         inputMode = NOINPUT_MODE;
         mousePressed = false;
      }
      
      public static function isDisabled() : Boolean
      {
         return inputMode == NOINPUT_MODE;
      }
      
      public static function greenLine() : *
      {
         canvas.graphics.lineStyle(thickness,39168,1,false,LineScaleMode.NONE,CapsStyle.ROUND,JointStyle.ROUND,3);
      }
      
      public static function redLine() : *
      {
         canvas.graphics.lineStyle(thickness,10027008,1,false,LineScaleMode.NONE,CapsStyle.ROUND,JointStyle.ROUND,3);
      }
      
      internal static function mouseDownEvent(args:MouseEvent) : *
      {
         var mouseX:int = 0;
         mouseX = (args.stageX - StatsManager.stageOffsetX) / StatsManager.stageScale;
         var mouseY:int = (args.stageY - StatsManager.stageOffsetY) / StatsManager.stageScale;
         mousePressed = true;
         if(inputMode == BATTLE_MODE)
         {
            canvas.graphics.clear();
         }
         canvas.x = 0;
         drawArray.length = 0;
         drawArray.push(new Point(mouseX,mouseY));
         canvas.graphics.moveTo(args.stageX,args.stageY);
         oldMouseX = mouseX;
         oldMouseY = mouseY;
         distanceLeft = maxDistance;
         touchX = mouseX;
         touchY = mouseY;
      }
      
      internal static function mouseUpEvent(args:MouseEvent) : *
      {
         var mouseX:Number = NaN;
         var mouseY:Number = NaN;
         var drawArrayLength:int = 0;
         var firstPoint:Point = null;
         var lastPoint:Point = null;
         var isLine:Boolean = false;
         if(!mousePressed || inputMode == NOINPUT_MODE || OverworldHUD.instance.screenTransition.isTransitioning())
         {
            return;
         }
         mousePressed = false;
         if(GameEngine.getGameMode() == GameEngine.MODE_BATTLELOADINGDONE_WAITINGFORCLICK)
         {
            GameEngine.startBattleMode();
            return;
         }
         if(args != null)
         {
            mouseX = (args.stageX - StatsManager.stageOffsetX) / StatsManager.stageScale;
            mouseY = (args.stageY - StatsManager.stageOffsetY) / StatsManager.stageScale;
         }
         else
         {
            mouseX = (stageMC.mouseX - StatsManager.stageOffsetX) / StatsManager.stageScale;
            mouseY = (stageMC.mouseY - StatsManager.stageOffsetY) / StatsManager.stageScale;
         }
         if(mouseY > 480)
         {
            return;
         }
         if(args != null)
         {
            if(inputMode == ADVENTURE_MODE)
            {
               if(isOverAdventureNonMoveAreas(args.stageX,args.stageY))
               {
                  return;
               }
               StageManager.checkClickOnInteractiveObject(args.stageX,args.stageY);
               drawArray[0].x = int(mouseX);
               drawArray[0].y = int(mouseY);
            }
            if(OverworldHUD.instance.lootDialog.visible)
            {
               return;
            }
            drawArrayLength = int(drawArray.length);
            if(drawArrayLength <= lengthThreshhold && (inputMode == BATTLE_MODE || inputMode == BATTLEAUTOSLASH_MODE) && BattleUI.instance.visible)
            {
               if(BattleUI.instance.gotClicked(args.stageX,args.stageY))
               {
                  return;
               }
            }
            if(GameEngine.isPvPRoomMode() && !isLine)
            {
               StageManager.checkClickOnInteractiveObject(args.stageX,args.stageY);
            }
         }
         if(drawArrayLength > 0)
         {
            firstPoint = drawArray[0];
            lastPoint = drawArray[drawArrayLength - 1];
            isLine = drawArrayLength > lengthThreshhold && getDistanceSQ(firstPoint,lastPoint) > distThreshhold;
            if(!isLine)
            {
               clearCanvas();
            }
         }
         else
         {
            clearCanvas();
         }
         if(inputMode != BATTLEAUTOSLASH_MODE)
         {
            StatsManager.getPlayer().gotInput(drawArray,isLine);
         }
      }
      
      public static function gotNetworkInput(lineArrayStr:String, sender:String, posX:int) : *
      {
         var split:Array = null;
         var networkPlayer:NPC = NPCManager.getNetworkPlayer(sender);
         if(networkPlayer == null)
         {
            return;
         }
         var lineArray:Vector.<Point> = new Vector.<Point>();
         var lineArrayStrSplit:Array = lineArrayStr.split("|");
         var max:int = int(lineArrayStrSplit.length);
         for(var i:* = 0; i < max; i++)
         {
            split = lineArrayStrSplit[i].split(",");
            lineArray.push(new Point(split[0],split[1]));
         }
         var lineArrayLength:int = int(lineArray.length);
         var firstPoint:Point = lineArray[0];
         var lastPoint:Point = lineArray[lineArrayLength - 1];
         var isLine:Boolean = lineArrayLength > lengthThreshhold && getDistanceSQ(firstPoint,lastPoint) > distThreshhold;
         EnemyPlayer(networkPlayer).gotInput(lineArray,isLine,posX);
      }
      
      public static function update() : *
      {
         if(OverworldHUD.instance.screenTransition.isTransitioning())
         {
            return;
         }
         if(inputMode == ADVENTURE_MODE)
         {
            adventureMouseMoveEvent();
         }
         else if(inputMode == BATTLE_MODE)
         {
            battleMouseMoveEvent();
         }
      }
      
      internal static function mouseLeaveEvent(event:Event) : *
      {
         if(mousePressed)
         {
            mouseUpEvent(null);
         }
      }
      
      internal static function battleMouseMoveEvent() : *
      {
         var mouseX:int = 0;
         var mouseY:int = 0;
         var distanceTravelledSQ:* = undefined;
         var distanceTravelled:* = undefined;
         var originalDistanceTravelled:* = undefined;
         var unitVecX:Number = NaN;
         var unitVecY:Number = NaN;
         var divisions:int = 0;
         var i:* = undefined;
         mouseX = (stageMC.mouseX - StatsManager.stageOffsetX) / StatsManager.stageScale;
         mouseY = (stageMC.mouseY - StatsManager.stageOffsetY) / StatsManager.stageScale;
         if(GameEngine.isPvPRoomMode())
         {
            StageManager.checkMouseOver(stageMC.mouseX,stageMC.mouseY);
         }
         if(mouseX <= 0 || mouseX >= StatsManager.stageWidth || mouseY <= 0 || mouseY >= StatsManager.stageHeight)
         {
            mouseUpEvent(null);
            return;
         }
         if(mousePressed && distanceLeft > 0 && !BattleUI.instance.isDraggingSkill())
         {
            distanceTravelledSQ = getDistanceSQ2(oldMouseX,oldMouseY,mouseX,mouseY);
            if(distanceTravelledSQ < 4)
            {
               return;
            }
            canvas.graphics.lineStyle(thickness - thickness * ((maxDistance - distanceLeft) / maxDistance),10027008,1,false,LineScaleMode.NONE,CapsStyle.ROUND,JointStyle.ROUND,3);
            distanceTravelled = Math.sqrt(distanceTravelledSQ);
            originalDistanceTravelled = distanceTravelled;
            if(distanceTravelled > distanceLeft)
            {
               distanceTravelled = distanceLeft;
            }
            distanceLeft -= distanceTravelled;
            if(mouseX != oldMouseX || mouseY != oldMouseY)
            {
               if(distanceTravelled > largestUnit)
               {
                  unitVecX = (mouseX - oldMouseX) * largestUnit / originalDistanceTravelled;
                  unitVecY = (mouseY - oldMouseY) * largestUnit / originalDistanceTravelled;
                  divisions = distanceTravelled / largestUnit;
                  for(i = 0; i < divisions; i++)
                  {
                     drawArray.push(new Point(int(oldMouseX + i * unitVecX),int(oldMouseY + i * unitVecY)));
                     canvas.graphics.lineTo(int(oldMouseX + i * unitVecX) * StatsManager.stageScale + StatsManager.stageOffsetX,int(oldMouseY + i * unitVecY) * StatsManager.stageScale + StatsManager.stageOffsetY);
                  }
               }
               else
               {
                  drawArray.push(new Point(mouseX,mouseY));
                  canvas.graphics.lineTo(mouseX * StatsManager.stageScale + StatsManager.stageOffsetX,mouseY * StatsManager.stageScale + StatsManager.stageOffsetY);
               }
            }
            oldMouseX = mouseX;
            oldMouseY = mouseY;
         }
      }
      
      internal static function isOverAdventureNonMoveAreas(mouseX:int, mouseY:int) : Boolean
      {
         var overworldHUD:OverworldHUD = OverworldHUD.instance;
         var scaledMouseX:int = (mouseX - StatsManager.stageOffsetX) / StatsManager.stageScale;
         var scaledMouseY:int = (mouseY - StatsManager.stageOffsetY) / StatsManager.stageScale;
         if(Boolean(overworldHUD.chatText.visible && (scaledMouseY > 400 && scaledMouseX > 245 || scaledMouseY > 70 && scaledMouseY < 220 && scaledMouseX > 240 && scaledMouseX < 620) || scaledMouseY > 430 && scaledMouseX > 200 || scaledMouseY < 35 || scaledMouseY > 480 || scaledMouseY < 220 && scaledMouseX > 630 || overworldHUD.bustUI.battlemodebust.hitTestPoint(mouseX,mouseY,true) || overworldHUD.getPlayerPanel().visible && overworldHUD.getPlayerPanel().hitTestPoint(mouseX,mouseY) || overworldHUD.interactUI.visible && overworldHUD.interactUI.hitTestPoint(mouseX,mouseY)) || Boolean(overworldHUD.getNodeUI().visible && overworldHUD.getNodeUI().doHitTest(mouseX,mouseY)) || overworldHUD.showItemUI.visible && scaledMouseX < 240 && scaledMouseY < 360 && scaledMouseY > 70)
         {
            return true;
         }
         return false;
      }
      
      internal static function adventureMouseMoveEvent() : *
      {
         var mouseX:int = 0;
         var mouseY:int = 0;
         var offset:int = 0;
         mouseX = stageMC.mouseX - StatsManager.stageOffsetX;
         mouseY = stageMC.mouseY - StatsManager.stageOffsetY;
         StageManager.checkMouseOver(stageMC.mouseX,stageMC.mouseY);
         if(isOverAdventureNonMoveAreas(stageMC.mouseX,stageMC.mouseY))
         {
            return;
         }
         if(mousePressed)
         {
            offset = StageManager.getStagePosition();
            StatsManager.getPlayer().initMove(new Point(mouseX / StatsManager.stageScale + offset,mouseY / StatsManager.stageScale));
         }
         ++adventureCounter;
         if(adventureCounter >= 12)
         {
            adventureCounter = 0;
            if(mousePressed && NetworkManager.instance.isP2P())
            {
               NetworkManager.instance.sendMove(drawArray,offset,-1);
            }
         }
      }
      
      internal static function clearCanvas() : *
      {
         if(!mousePressed && canvas != null)
         {
            canvas.graphics.clear();
            canvas.x = 0;
         }
      }
      
      internal static function getCanvas() : MovieClip
      {
         return canvas;
      }
      
      internal static function getDebugCanvas() : MovieClip
      {
         return debugcanvas;
      }
      
      internal static function drawLineDebug(slashArray:Vector.<Point>, offset:int) : *
      {
         if(!debug)
         {
            return;
         }
         debugcanvas.graphics.clear();
         debugcanvas.graphics.lineStyle(3,10066329,1,false,LineScaleMode.NONE,CapsStyle.ROUND,JointStyle.ROUND,3);
         for(var i:* = 0; i < slashArray.length; i++)
         {
            debugcanvas.graphics.drawCircle((slashArray[i].x - offset) * StatsManager.stageScale + StatsManager.stageOffsetX,slashArray[i].y * StatsManager.stageScale + StatsManager.stageOffsetY,1);
         }
      }
      
      internal static function drawLine(slashArray:Vector.<Point>, offset:int) : *
      {
         var distLeft:int = maxDistance;
         canvas.graphics.clear();
         var scaledThickness:int = thickness * StatsManager.stageScale;
         for(var i:* = 0; i < slashArray.length; i++)
         {
            canvas.graphics.lineStyle(scaledThickness - scaledThickness * ((maxDistance - distLeft) / maxDistance),10027008,1,false,LineScaleMode.NONE,CapsStyle.ROUND,JointStyle.ROUND,3);
            if(i == 0)
            {
               canvas.graphics.moveTo((slashArray[i].x - offset) * StatsManager.stageScale + StatsManager.stageOffsetX,slashArray[i].y * StatsManager.stageScale + StatsManager.stageOffsetY);
            }
            else
            {
               canvas.graphics.lineTo((slashArray[i].x - offset) * StatsManager.stageScale + StatsManager.stageOffsetX,slashArray[i].y * StatsManager.stageScale + StatsManager.stageOffsetY);
               distLeft -= getDistance(slashArray[i].x,slashArray[i].y,slashArray[i - 1].x,slashArray[i - 1].y);
            }
         }
      }
      
      public static function drawEnemyLine(slashArray:Vector.<Point>, offset:int, slashLength:int) : *
      {
         var distLeft:int = slashLength;
         var scaledThickness:int = thickness * StatsManager.stageScale;
         canvas.graphics.clear();
         for(var i:* = 0; i < slashArray.length; i++)
         {
            canvas.graphics.lineStyle(scaledThickness - scaledThickness * ((slashLength - distLeft) / slashLength),0,1,false,LineScaleMode.NONE,CapsStyle.ROUND,JointStyle.ROUND,3);
            if(i == 0)
            {
               canvas.graphics.moveTo((slashArray[i].x - offset) * StatsManager.stageScale + StatsManager.stageOffsetX,slashArray[i].y * StatsManager.stageScale + StatsManager.stageOffsetY);
            }
            else
            {
               canvas.graphics.lineTo((slashArray[i].x - offset) * StatsManager.stageScale + StatsManager.stageOffsetX,slashArray[i].y * StatsManager.stageScale + StatsManager.stageOffsetY);
               distLeft -= getDistance(slashArray[i].x,slashArray[i].y,slashArray[i - 1].x,slashArray[i - 1].y);
            }
         }
      }
      
      internal static function getDistance(x1:int, y1:int, x2:int, y2:int) : int
      {
         var xdiff:* = Math.abs(x1 - x2);
         var ydiff:* = Math.abs(y1 - y2);
         return Math.sqrt(xdiff * xdiff + ydiff * ydiff);
      }
      
      internal static function getDistanceSQ(pt1:Point, pt2:Point) : int
      {
         var xdiff:* = Math.abs(pt2.x - pt1.x);
         var ydiff:* = Math.abs(pt2.y - pt1.y);
         return xdiff * xdiff + ydiff * ydiff;
      }
      
      internal static function getDistanceSQ2(x1:int, y1:int, x2:int, y2:int) : int
      {
         var xdiff:* = Math.abs(x1 - x2);
         var ydiff:* = Math.abs(y1 - y2);
         return xdiff * xdiff + ydiff * ydiff;
      }
      
      internal static function keyDownEvent(event:KeyboardEvent) : *
      {
         if(StatsManager.isAndroid && (event.keyCode == Keyboard.BACK || event.keyCode == Keyboard.MENU || event.keyCode == Keyboard.SEARCH))
         {
            Mobile.getInstance().handleMobileDeactivate(null);
         }
         if(inputMode != BATTLE_MODE && inputMode != BATTLEAUTOSLASH_MODE && inputMode != ADVENTURE_MODE)
         {
            return;
         }
         if(isDisabled())
         {
            return;
         }
         if(GameEngine.getStageMC().focus == BattleUI.instance.chatText.words)
         {
            return;
         }
         if(GameEngine.getStageMC().focus == OverworldHUD.instance.chatText.words)
         {
            return;
         }
         switch(event.keyCode)
         {
            case 49:
               BattleUI.instance.numberKeyPressed(1);
               break;
            case 50:
               BattleUI.instance.numberKeyPressed(2);
               break;
            case 51:
               BattleUI.instance.numberKeyPressed(3);
               break;
            case 52:
               BattleUI.instance.numberKeyPressed(4);
               break;
            case 53:
               BattleUI.instance.numberKeyPressed(5);
               break;
            case 54:
               BattleUI.instance.numberKeyPressed(6);
               break;
            case 55:
               BattleUI.instance.numberKeyPressed(7);
               break;
            case 56:
               BattleUI.instance.numberKeyPressed(8);
         }
      }
      
      internal static function keyUpEvent(event:KeyboardEvent) : *
      {
         var player:MCSPlayer = null;
         if(inputMode != BATTLE_MODE && inputMode != BATTLEAUTOSLASH_MODE && inputMode != ADVENTURE_MODE)
         {
            return;
         }
         if(isDisabled())
         {
            return;
         }
         if(GameEngine.getStageMC().focus == BattleUI.instance.chatText.words)
         {
            return;
         }
         if(GameEngine.getStageMC().focus == OverworldHUD.instance.chatText.words)
         {
            return;
         }
         switch(event.keyCode)
         {
            case Keyboard.SPACE:
               player = StatsManager.getPlayer();
               if(!mousePressed && player.canChangeStance())
               {
                  player.nextStance();
               }
               break;
            case Keyboard.ENTER:
               if(inputMode == ADVENTURE_MODE)
               {
                  if(!OverworldHUD.instance.chatText.visible && OverworldHUD.instance.chatText.words.text != "/hidehud")
                  {
                     return;
                  }
                  if(!OverworldHUD.instance.chatText.visible)
                  {
                     OverworldHUD.instance.onShowChat(null);
                  }
                  else
                  {
                     GameEngine.getStageMC().focus = OverworldHUD.instance.chatText.words;
                  }
               }
               break;
            case 49:
               if(inputMode != ADVENTURE_MODE)
               {
                  BattleUI.instance.numberKeyReleased(1);
               }
               break;
            case 50:
               if(inputMode != ADVENTURE_MODE)
               {
                  BattleUI.instance.numberKeyReleased(2);
               }
               break;
            case 51:
               if(inputMode != ADVENTURE_MODE)
               {
                  BattleUI.instance.numberKeyReleased(3);
               }
               break;
            case 52:
               if(inputMode != ADVENTURE_MODE)
               {
                  BattleUI.instance.numberKeyReleased(4);
               }
               break;
            case 53:
               if(inputMode != ADVENTURE_MODE)
               {
                  BattleUI.instance.numberKeyReleased(5);
               }
               break;
            case 54:
               if(inputMode != ADVENTURE_MODE)
               {
                  BattleUI.instance.numberKeyReleased(6);
               }
               break;
            case 55:
               if(inputMode != ADVENTURE_MODE)
               {
                  BattleUI.instance.numberKeyReleased(7);
               }
               break;
            case 56:
               if(inputMode != ADVENTURE_MODE)
               {
                  BattleUI.instance.numberKeyReleased(8);
               }
         }
      }
   }
}

