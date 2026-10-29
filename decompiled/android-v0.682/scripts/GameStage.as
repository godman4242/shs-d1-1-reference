package
{
   import flash.display.MovieClip;
   
   public class GameStage extends MovieClip
   {
      
      internal static var visibleBuffer:int = 400;
      
      public static var BG_FOREST:int = 0;
      
      public static var BG_MOUNTAIN:int = 1;
      
      public static var BG_BATTLEFIELD:int = 2;
      
      public static var BG_CASTLEWALLS:int = 3;
      
      public static var BG_BAMBOOFOREST:int = 4;
      
      public static var BG_BEACH:int = 5;
      
      public static var BG_FORESTSPOOKY:int = 6;
      
      public static var BG_PADIFIELD:int = 7;
      
      public static var BG_RIVERDOCK:int = 8;
      
      public static var BG_TEMPLERUINS:int = 9;
      
      public static var BG_VILLAGEROOFS:int = 10;
      
      public static var BG_WATERFALL:int = 11;
      
      public static var BG_DOJO:int = 12;
      
      public static var BG_DOJO2:int = 13;
      
      public static var BG_FOREST2:int = 14;
      
      public static var BG_DUNGEON:int = 15;
      
      public static var BG_CAVE:int = 16;
      
      public static var BG_CAVELAKE:int = 17;
      
      public static var BG_CAVELAVA:int = 18;
      
      public static var BG_BAMBOOFORESTHUT:int = 19;
      
      public static var BG_HUTINSIDE:int = 20;
      
      public static var BG_FOREST3:int = 21;
      
      public static var BG_MINE:int = 22;
      
      public static var BG_TOWNPROCGEN_VILLAGE:int = 23;
      
      public static var BG_TOWNPROCGEN_TOWN:int = 24;
      
      public static var BG_TOWNPROCGEN_CITY:int = 25;
      
      public static var BG_JINMAKU_NIGHT:int = 26;
      
      public static var BG_DESTROYEDVILLAGE:int = 27;
      
      public static var BG_MOUNTAINPATH:int = 28;
      
      public static var BG_TEMPLEEXTERIOR:int = 29;
      
      public static var BG_TEMPLEINTERIOR:int = 30;
      
      public static var BG_DESTROYEDVILLAGE_OUTSIDE:int = 31;
      
      public static var BG_GRAVEYARD:int = 32;
      
      public static var BG_BANDITHIDEOUT:int = 33;
      
      public static var BG_JINMAKU:int = 34;
      
      public static var BG_DENSEFOREST:int = 35;
      
      public static var BG_NINJAVILLAGE:int = 36;
      
      public static var BG_ANCIENTRUINS:int = 37;
      
      public static var BG_INN:int = 38;
      
      public static var BG_GAMBLINGDEN:int = 39;
      
      public static var BG_KITCHEN:int = 40;
      
      public static var BG_CASTLEHALLWAY:int = 41;
      
      public static var BG_CASTLEROOM:int = 42;
      
      public static var BG_BAMBOOFORESTDOJO:int = 43;
      
      public static var BG_FOREST4:int = 44;
      
      public static var BG_CASTLEWALKWAY:int = 45;
      
      public static var BG_JINMAKU_OUTSIDE:int = 46;
      
      public static var BG_JINMAKU_NIGHT_OUTSIDE:int = 47;
      
      public static var BG_TEMPLEEXTERIOR_FOG:int = 48;
      
      public static var BG_TEMPLERUINS_FOG:int = 49;
      
      public static var BG_TEMPLEINTERIOR2:int = 50;
      
      public static var BG_DUNGEON_FOG:int = 51;
      
      public static var BG_WATERFALL_DAY:int = 52;
      
      public static var BG_CASTLEWALLS_INNER:int = 53;
      
      public static var BG_DOJO3:int = 54;
      
      public static var BG_BAMBOOFORESTTOWN:int = 55;
      
      public static var BG_MINE2:int = 46;
      
      public static var BG_RIVERBANK:int = 47;
      
      public static var BG_DOJO4:int = 49;
      
      public static var BG_DOJO5:int = 50;
      
      public static var screenWidth:int = 800;
      
      internal var gameStageWidth:int = 800;
      
      internal var stagePosition:int = 0;
      
      public var hasHostile:Boolean = false;
      
      internal var groundY:int = 400;
      
      internal var flatGround:Boolean = true;
      
      internal var wrapAround:Boolean = true;
      
      internal var contentWidth:int = 1600;
      
      internal var farthestLayerCount:int = 0;
      
      internal var farLayerCount:int = 0;
      
      internal var playerPlaneLayerCount:int = 0;
      
      internal var groundLayerCount:int = 0;
      
      internal var foregroundLayerCount:int = 0;
      
      internal var farthestLayerWrap:int = 1600;
      
      internal var farLayerWrap:int = 1600;
      
      internal var playerPlaneLayerWrap:int = 1600;
      
      internal var groundLayerWrap:int = 1600;
      
      internal var foregroundLayerWrap:int = 1600;
      
      internal var farthestLayerBlur:int = 8;
      
      internal var farLayerBlur:int = 4;
      
      internal var playerPlaneLayerBlur:int = 0;
      
      internal var groundLayerBlur:int = 4;
      
      internal var foregroundLayerBlur:int = 8;
      
      internal var farthestLayerScroll:Number = 0.25;
      
      internal var farLayerScroll:Number = 0.3333333333333333;
      
      internal var playerPlaneLayerScroll:Number = 0.5;
      
      internal var groundLayerScroll:Number = 1;
      
      internal var foregroundLayerScroll:Number = 2;
      
      internal var farthestArray:Vector.<MovieClip> = new Vector.<MovieClip>();
      
      internal var farArray:Vector.<MovieClip> = new Vector.<MovieClip>();
      
      internal var playerPlaneArray:Vector.<MovieClip> = new Vector.<MovieClip>();
      
      internal var groundArray:Vector.<MovieClip> = new Vector.<MovieClip>();
      
      internal var foregroundArray:Vector.<MovieClip> = new Vector.<MovieClip>();
      
      internal var roomObjectList:Vector.<StageObject> = new Vector.<StageObject>();
      
      internal var roomInteractiveObjectList:Vector.<InteractiveStageObject> = new Vector.<InteractiveStageObject>();
      
      internal var updateObjectList:Vector.<StageObject> = new Vector.<StageObject>();
      
      internal var interactTarget:InteractiveStageObject;
      
      internal var junction:MovieClip;
      
      public function GameStage()
      {
         super();
      }
      
      public function update() : *
      {
      }
      
      public function setGameStageWidth(num:int) : *
      {
         this.gameStageWidth = num;
         if(!this.wrapAround && this.contentWidth < this.gameStageWidth)
         {
            trace("GameStage.setGameStageWidth error: gameStageWidth exceeds contentWidth");
            this.gameStageWidth = this.contentWidth;
         }
      }
      
      public function getGameStageWidth() : int
      {
         return this.gameStageWidth;
      }
      
      public function getGroundY() : int
      {
         return this.groundY;
      }
      
      public function isFlatGround() : Boolean
      {
         return this.flatGround;
      }
      
      public function registerMC() : *
      {
         var i:int = 0;
         var mc:MovieClip = null;
         for(i = 1; i <= this.farthestLayerCount; i++)
         {
            mc = MovieClip(this.getChildByName("ff_" + i));
            this.farthestArray.push(mc);
            mc.cacheAsBitmap = true;
            mc.flipped = this.scaleX < 0 || mc.transform.matrix.a < 0;
            ColorCode.blur(mc,8);
            if(Boolean(mc.flipped) && (mc.x < 0 || mc.x - mc.width > screenWidth))
            {
               mc.visible = false;
            }
            else if(!mc.flipped && (mc.x + mc.width < 0 || mc.x > screenWidth))
            {
               mc.visible = false;
            }
         }
         this.farthestArray.fixed = true;
         for(i = 1; i <= this.farLayerCount; i++)
         {
            mc = MovieClip(this.getChildByName("f_" + i));
            this.farArray.push(mc);
            mc.cacheAsBitmap = true;
            mc.flipped = this.scaleX < 0 || mc.transform.matrix.a < 0;
            ColorCode.blur(mc,4);
            if(Boolean(mc.flipped) && (mc.x < 0 || mc.x - mc.width > screenWidth))
            {
               mc.visible = false;
            }
            else if(!mc.flipped && (mc.x + mc.width < 0 || mc.x > screenWidth))
            {
               mc.visible = false;
            }
         }
         this.farArray.fixed = true;
         for(i = 1; i <= this.playerPlaneLayerCount; i++)
         {
            mc = MovieClip(this.getChildByName("pp_" + i));
            this.playerPlaneArray.push(mc);
            mc.cacheAsBitmap = true;
            mc.flipped = this.scaleX < 0 || mc.transform.matrix.a < 0;
            if(Boolean(mc.flipped) && (mc.x < 0 || mc.x - mc.width > screenWidth))
            {
               mc.visible = false;
            }
            else if(!mc.flipped && (mc.x + mc.width < 0 || mc.x > screenWidth))
            {
               mc.visible = false;
            }
         }
         this.playerPlaneArray.fixed = true;
         for(i = 1; i <= this.groundLayerCount; i++)
         {
            mc = MovieClip(this.getChildByName("ground_" + i));
            this.groundArray.push(mc);
            mc.cacheAsBitmap = true;
            mc.flipped = this.scaleX < 0 || mc.transform.matrix.a < 0;
            if(i == 1 && i == 2)
            {
               ColorCode.blur(mc,4);
            }
         }
         this.groundArray.fixed = true;
         for(i = 1; i <= this.foregroundLayerCount; i++)
         {
            mc = MovieClip(this.getChildByName("fg_" + i));
            this.foregroundArray.push(mc);
            mc.cacheAsBitmap = true;
            mc.flipped = this.scaleX < 0 || mc.transform.matrix.a < 0;
            ColorCode.blur(mc,8);
            if(Boolean(mc.flipped) && (mc.x < 0 || mc.x - mc.width > screenWidth))
            {
               mc.visible = false;
            }
            else if(!mc.flipped && (mc.x + mc.width < 0 || mc.x > screenWidth))
            {
               mc.visible = false;
            }
         }
         this.foregroundArray.fixed = true;
      }
      
      public function scrollStage(dist:int) : *
      {
         var i:int = 0;
         var thing:MovieClip = null;
         var nextThing:MovieClip = null;
         for(i = 0; i < this.farthestLayerCount; i++)
         {
            thing = this.farthestArray[i];
            thing.x += dist / 4;
            this.checkWrapAround(thing,4,dist);
            if(!thing.visible)
            {
               this.checkMakeVisible(thing,dist);
            }
         }
         for(i = 0; i < this.farLayerCount; i++)
         {
            thing = this.farArray[i];
            thing.x += dist / 3;
            this.checkWrapAround(thing,3,dist);
            if(!thing.visible)
            {
               this.checkMakeVisible(thing,dist);
            }
         }
         for(i = 0; i < this.playerPlaneLayerCount; i++)
         {
            thing = this.playerPlaneArray[i];
            thing.x += dist / 2;
            this.checkWrapAround(thing,2,dist);
            if(!thing.visible)
            {
               this.checkMakeVisible(thing,dist);
            }
         }
         for(i = 0; i < this.groundLayerCount; i++)
         {
            thing = this.groundArray[i];
            thing.x += dist;
            this.checkWrapAround(thing,1,dist);
            this.checkMakeVisible(thing,dist);
         }
         for(i = 0; i < this.foregroundLayerCount; i++)
         {
            thing = this.foregroundArray[i];
            thing.x += dist * 2;
            this.checkWrapAround(thing,0,dist);
            if(!thing.visible)
            {
               this.checkMakeVisible(thing,dist);
            }
         }
         this.stagePosition += dist;
      }
      
      public function scrollRoomObjects(dist:int) : *
      {
         var obj:StageObject = null;
         var max:int = int(this.roomObjectList.length);
         for(var i:int = 0; i < max; i++)
         {
            obj = this.roomObjectList[i];
            obj.doScroll(dist);
         }
         max = int(this.roomInteractiveObjectList.length);
         for(i = 0; i < max; i++)
         {
            obj = this.roomInteractiveObjectList[i];
            obj.doScroll(dist);
         }
      }
      
      public function setStagePosition(num:int) : *
      {
         var diff:int = num - this.stagePosition;
         this.scrollStage(diff);
         this.scrollRoomObjects(diff);
         StatsManager.getPlayer().posX = StatsManager.getPlayer().posX + diff;
         this.stagePosition = num;
      }
      
      public function resetStagePosition() : *
      {
         this.setStagePosition(0);
      }
      
      public function getStagePosition() : int
      {
         return -this.stagePosition;
      }
      
      internal function checkWrapAround(thing:MovieClip, layer:int, dist:int) : *
      {
         var wrap:int = 0;
         if(!this.wrapAround && layer != 1)
         {
            return;
         }
         if(layer == 1)
         {
            if(dist < 0 && thing.x < -800)
            {
               thing.x += this.groundLayerWrap;
            }
            else if(dist > 0 && thing.x > 800)
            {
               thing.x -= this.groundLayerWrap;
            }
         }
         else
         {
            if(layer == 0)
            {
               wrap = this.foregroundLayerWrap;
            }
            else if(layer == 2)
            {
               wrap = this.playerPlaneLayerWrap;
            }
            else if(layer == 3)
            {
               wrap = this.farLayerWrap;
            }
            else if(layer == 4)
            {
               wrap = this.farthestLayerWrap;
            }
            if(wrap == 0)
            {
               return;
            }
            if(thing.flipped)
            {
               if(dist < 0 && thing.x < 0)
               {
                  thing.x += wrap;
                  thing.visible = false;
               }
               else if(dist > 0 && thing.x > wrap)
               {
                  thing.x -= wrap;
                  thing.visible = false;
               }
            }
            else if(dist < 0 && thing.x < -thing.width)
            {
               thing.x += wrap;
               thing.visible = false;
            }
            else if(dist > 0 && thing.x + thing.width > wrap)
            {
               thing.x -= wrap;
               thing.visible = false;
            }
         }
      }
      
      internal function checkMakeVisible(thing:MovieClip, dist:int) : *
      {
         if(thing.flipped)
         {
            if(dist < 0 && thing.x - thing.width < screenWidth)
            {
               thing.visible = true;
            }
            else if(dist > 0 && thing.x > 0)
            {
               thing.visible = true;
            }
         }
         else if(dist < 0 && thing.x < screenWidth)
         {
            thing.visible = true;
         }
         else if(dist > 0 && thing.x + thing.width > 0)
         {
            thing.visible = true;
         }
      }
      
      public function canScroll(dist:int) : Boolean
      {
         if(this.stagePosition - dist > 0 || this.stagePosition - dist < -this.gameStageWidth + 800)
         {
            return false;
         }
         return true;
      }
      
      public function redFreeze() : *
      {
         var i:int = 0;
         var thing:MovieClip = null;
         for(i = 0; i < this.farthestLayerCount; i++)
         {
            this.farthestArray[i].visible = false;
         }
         for(i = 0; i < this.farLayerCount; i++)
         {
            this.farArray[i].visible = false;
         }
         for(i = 0; i < this.playerPlaneLayerCount; i++)
         {
            this.playerPlaneArray[i].visible = false;
         }
         for(i = 0; i < this.groundLayerCount; i++)
         {
            if(i <= 1)
            {
               ColorCode.makeBlack(this.groundArray[i]);
            }
            else
            {
               this.groundArray[i].visible = false;
            }
         }
         for(i = 0; i < this.foregroundLayerCount; i++)
         {
            this.foregroundArray[i].visible = false;
         }
         this.getRedBG().visible = true;
         OverworldHUD.instance.showInteractLabel(0,0,"");
         var max:int = int(this.roomObjectList.length);
         for(i = 0; i < max; i++)
         {
            this.roomObjectList[i].visible = false;
         }
         max = int(this.roomInteractiveObjectList.length);
         for(i = 0; i < max; i++)
         {
            this.roomInteractiveObjectList[i].visible = false;
         }
      }
      
      public function unRedFreeze() : *
      {
         var i:int = 0;
         var thing:MovieClip = null;
         for(i = 0; i < this.farthestLayerCount; i++)
         {
            this.farthestArray[i].visible = true;
         }
         for(i = 0; i < this.farLayerCount; i++)
         {
            this.farArray[i].visible = true;
         }
         for(i = 0; i < this.playerPlaneLayerCount; i++)
         {
            this.playerPlaneArray[i].visible = true;
         }
         for(i = 0; i < this.groundLayerCount; i++)
         {
            if(i <= 1)
            {
               ColorCode.clearFilter(this.groundArray[i]);
               ColorCode.blur(this.groundArray[i],4);
            }
            else
            {
               this.groundArray[i].visible = true;
            }
         }
         for(i = 0; i < this.foregroundLayerCount; i++)
         {
            this.foregroundArray[i].visible = true;
         }
         this.getRedBG().visible = false;
      }
      
      public function desaturateAll() : *
      {
      }
      
      public function clearFilterAll() : *
      {
      }
      
      public function createRoomObjects(objectList:XMLList, roomDeadList:Vector.<String>, questAction:QuestAction = null, arrangeBottom:Boolean = true, isGroupObj:Boolean = false) : *
      {
         var xml:XML = null;
         var ypos:int = 0;
         var j:int = 0;
         var leverprop:Array = null;
         var leverpropstr:String = null;
         if(objectList == null)
         {
            return;
         }
         var max:int = objectList.length();
         var deadmax:int = int(roomDeadList.length);
         var skipFlag:Boolean = false;
         for(var i:int = 0; i < max; i++)
         {
            xml = objectList[i];
            skipFlag = false;
            if(xml.condition != "" && !StatsManager.checkConditions(xml.condition))
            {
               skipFlag = true;
            }
            j = 0;
            while(j < deadmax && !skipFlag)
            {
               if(xml.name == roomDeadList[j])
               {
                  skipFlag = true;
               }
               j++;
            }
            if(!skipFlag || xml.id == 18 || xml.id == 19 || xml.id == 22 || xml.id == 30 || xml.id == 33 || xml.id == 58)
            {
               if(xml.y.toString() == "")
               {
                  ypos = this.getGroundY();
               }
               else
               {
                  ypos = int(xml.y);
               }
               if(skipFlag && (xml.id == 18 || xml.id == 19 || xml.id == 22))
               {
                  this.createRoomObject(xml.id,xml.x,ypos,xml.property + ",1",xml.name);
               }
               else if(skipFlag && xml.id == 30)
               {
                  this.createRoomObject(xml.id,xml.x,ypos,xml.property + ",1",xml.name);
               }
               else if(skipFlag && xml.id == 58)
               {
                  this.createRoomObject(xml.id,xml.x,ypos,xml.property + ",1",xml.name);
               }
               else if(skipFlag && xml.id == 33)
               {
                  leverprop = xml.property.split(",");
                  leverprop[1] = "2";
                  leverpropstr = leverprop.join(",");
                  this.createRoomObject(xml.id,xml.x,ypos,leverpropstr,xml.name);
               }
               else if(i == max - 1)
               {
                  this.createRoomObject(xml.id,xml.x,ypos,xml.property,xml.name,questAction,arrangeBottom,isGroupObj);
               }
               else
               {
                  this.createRoomObject(xml.id,xml.x,ypos,xml.property,xml.name,null,arrangeBottom,isGroupObj);
               }
            }
         }
      }
      
      public function createRoomObject(objId:int, objX:int, objY:int, objProperty:String, objName:String = "", questAction:QuestAction = null, arrangeBottom:Boolean = true, isGroupObj:Boolean = false) : StageObject
      {
         var obj:StageObject = null;
         var max:int = 0;
         var dupobj:InteractiveStageObject = null;
         var i:* = undefined;
         var cacheBitmap:Boolean = true;
         switch(objId)
         {
            case 0:
               obj = new Obj_DirectionSign(objProperty,objName);
               if(objProperty.split(",").length >= 7)
               {
                  cacheBitmap = false;
               }
               break;
            case 1:
               obj = new Obj_TextSign(objProperty,objName);
               break;
            case 2:
               obj = new Obj_Bush(objProperty);
               break;
            case 3:
               obj = new Obj_NPC(objProperty,objName);
               cacheBitmap = false;
               break;
            case 4:
               obj = new Obj_NPCCivilian(objX,objY,objProperty,objName);
               cacheBitmap = false;
               break;
            case 5:
               obj = new Obj_NPCShop(objProperty,objName);
               break;
            case 6:
               obj = new Obj_ShopStand(objProperty);
               break;
            case 7:
               obj = new Obj_FloorSwitch(objProperty,objName);
               break;
            case 8:
               obj = new Obj_Door(objProperty,objName);
               break;
            case 9:
               obj = new Obj_NPCAggro(objX,objY,objProperty,objName);
               this.hasHostile = true;
               cacheBitmap = false;
               break;
            case 10:
               obj = new Obj_Chest(objProperty,objName);
               break;
            case 11:
               obj = new Obj_NPCBlocking(objProperty,objName);
               cacheBitmap = false;
               break;
            case 12:
               obj = new Marker_Blocking(objProperty,objName);
               break;
            case 13:
               obj = new Obj_Bed(objProperty,objName);
               break;
            case 14:
               obj = new Obj_VegePatch(objProperty,objName);
               break;
            case 15:
               obj = new Obj_FarmersMarket(objProperty,objName);
               break;
            case 16:
               obj = new Obj_PickableItem(objProperty,objName);
               break;
            case 17:
               obj = new Obj_Jizo(objProperty);
               break;
            case 18:
               obj = new Obj_ChestLoot(objProperty,objName);
               if(objX < 400)
               {
                  obj.scaleX = -1;
               }
               break;
            case 19:
               obj = new Obj_ChestGoodLoot(objProperty,objName);
               if(objX < 400)
               {
                  obj.scaleX = -1;
               }
               break;
            case 20:
               obj = new Obj_DoorDungeon(objProperty);
               break;
            case 21:
               obj = new Obj_DecorDungeon(objProperty);
               break;
            case 22:
               obj = new Obj_DoorDungeonLocked(objProperty,objName);
               break;
            case 23:
               obj = new Obj_NPCProcGen(objX,objY,objProperty,objName);
               cacheBitmap = false;
               break;
            case 24:
               obj = new Obj_PickableItemProcGen(objProperty,objName);
               break;
            case 25:
               obj = new Obj_TownOutside(objProperty,objName);
               cacheBitmap = false;
               break;
            case 26:
               obj = new Obj_TownMarker(objProperty,objName);
               break;
            case 27:
               obj = new Obj_TownBuilding(objProperty,objName);
               break;
            case 28:
               obj = new Obj_DojoOutside(objProperty,objName);
               break;
            case 29:
               obj = new Marker_Trigger(objProperty,objName);
               break;
            case 30:
               obj = new Obj_OreDeposit(objProperty,objName);
               break;
            case 31:
               obj = new Obj_Hut(objProperty);
               break;
            case 32:
               obj = new Trap_Kunai(objProperty,objName);
               break;
            case 33:
               obj = new Obj_LeverSwitch(objProperty,objName);
               break;
            case 34:
               obj = new Obj_Tent();
               break;
            case 35:
               obj = new Obj_DoorNinjaTrail(objProperty,objName);
               break;
            case 36:
               obj = new Obj_Corpse(objX,objY,objProperty,objName);
               break;
            case 37:
               obj = new Obj_GamblingTable();
               break;
            case 38:
               obj = new Obj_InnBar();
               break;
            case 39:
               obj = new Marker_TriggerAuto(objProperty,objName);
               break;
            case 40:
               obj = new Obj_Cart(objProperty);
               break;
            case 41:
               obj = new Obj_NPCAnimated(objX,objY,objProperty,objName);
               cacheBitmap = false;
               break;
            case 42:
               obj = new Trap_KunaiAuto(objProperty,objName);
               break;
            case 43:
               obj = new Trap_SawBladesAuto(objX,objY,objProperty,objName);
               cacheBitmap = false;
               break;
            case 44:
               obj = new Trap_CrusherBlockAuto(objX,objY,objProperty,objName);
               break;
            case 45:
               obj = new Trap_CrusherColumnAuto(objX,objY,objProperty,objName);
               break;
            case 46:
               obj = new Trap_ElementAuto(objProperty,objName);
               break;
            case 47:
               obj = new Trap_Jump(objProperty,objName);
               break;
            case 48:
               obj = new Trap_SpikesAuto(objProperty,objName);
               cacheBitmap = false;
               break;
            case 49:
               obj = new Trap_Boulder(objProperty,objName);
               break;
            case 50:
               obj = new Trap_SpikeBallAuto(objProperty,objName);
               break;
            case 51:
               obj = new Obj_LowCeiling(objProperty);
               break;
            case 52:
               obj = new Obj_DungeonEntrance(objProperty);
               break;
            case 53:
               obj = new Obj_PathBush(objProperty,objName);
               break;
            case 54:
               obj = new Obj_BonePile(objProperty);
               break;
            case 55:
               obj = new Obj_Platform(objProperty);
               break;
            case 56:
               obj = new Obj_Bell(objProperty,objName);
               break;
            case 57:
               obj = new Obj_DragonDanceStatue(objProperty,objName);
               break;
            case 58:
               obj = new Obj_HiddenTemple(objProperty,objName);
               break;
            case 59:
               obj = new Obj_DragonDancePath(objProperty,objName);
               break;
            case 60:
               obj = new Obj_DragonDanceLoot(objProperty,objName);
               break;
            case 61:
               obj = new Obj_Bird();
               cacheBitmap = false;
               break;
            case 62:
               obj = new Obj_WarBanner(objProperty);
               break;
            case 63:
               obj = new Obj_CastleGate(objProperty,objName);
               break;
            case 64:
               obj = new Obj_Stairs(objProperty);
               break;
            case 65:
               obj = new Obj_LadderPoint(objX,objY,objProperty,objName);
               break;
            case 66:
               obj = new Obj_CastleFlag(objProperty,objName);
               break;
            case 67:
               obj = new Obj_CollapsingTemple();
               break;
            case 68:
               obj = new Obj_RitualSpike(objProperty,objName);
               cacheBitmap = false;
               break;
            case 69:
               obj = new Marker_RumbleTrigger(objProperty,objName);
               break;
            case 70:
               obj = new Obj_GourdVoid(objProperty);
               cacheBitmap = false;
               break;
            case 71:
               obj = new Obj_TownSign(objProperty,objName);
               cacheBitmap = false;
               break;
            case 72:
               obj = new Obj_MountainEntrance(objProperty);
               break;
            case 100:
               this.createRoomObjects(new XMLList(objProperty).obj,StageManager.roomDeadList,questAction,false,true);
               return null;
         }
         if(obj == null)
         {
            return null;
         }
         obj.typeid = objId;
         if(cacheBitmap)
         {
            obj.cacheAsBitmap = true;
         }
         var childindex:int = 0;
         if(obj.isInteractive())
         {
            if(questAction != null || isGroupObj)
            {
               if(questAction != null)
               {
                  obj.showQuestIndicator(questAction);
               }
               max = int(this.roomInteractiveObjectList.length);
               for(i = max - 1; i >= 0; i--)
               {
                  dupobj = this.roomInteractiveObjectList[i];
                  if(dupobj.getObjectName() == objName)
                  {
                     if(dupobj.hasQuestAction())
                     {
                        if(objId == 4)
                        {
                           obj.removeFromCanvas(this.getPlayerCanvas());
                        }
                        return null;
                     }
                     childindex = this.getPlayerCanvas().getChildIndex(dupobj);
                     dupobj.removeFromCanvas(this.getPlayerCanvas());
                     this.roomInteractiveObjectList.fixed = false;
                     this.roomInteractiveObjectList.splice(i,1);
                     this.roomInteractiveObjectList.fixed = true;
                  }
               }
            }
            this.roomInteractiveObjectList.fixed = false;
            this.roomInteractiveObjectList.push(obj);
            this.roomInteractiveObjectList.fixed = true;
            if(questAction != null)
            {
               InteractiveStageObject(obj).setQuestAction(questAction);
               arrangeBottom = false;
            }
         }
         else
         {
            this.roomObjectList.fixed = false;
            this.roomObjectList.push(obj);
            this.roomObjectList.fixed = true;
         }
         if(obj.needsUpdate())
         {
            this.updateObjectList.fixed = false;
            this.updateObjectList.push(obj);
            this.updateObjectList.fixed = true;
         }
         if(objId != 4)
         {
            obj.x = objX;
            obj.y = objY;
            obj.doScroll(this.stagePosition);
         }
         if(obj.forFarCanvas())
         {
            this.getFarCanvas().addChild(obj);
            if(arrangeBottom || childindex != 0)
            {
               this.getFarCanvas().setChildIndex(obj,childindex);
            }
         }
         else
         {
            this.getPlayerCanvas().addChild(obj);
            if(arrangeBottom || childindex != 0)
            {
               this.getPlayerCanvas().setChildIndex(obj,childindex);
            }
         }
         return obj;
      }
      
      public function clearRoomObjects() : *
      {
         var obj:StageObject = null;
         var max:int = int(this.roomObjectList.length);
         for(var i:int = 0; i < max; i++)
         {
            obj = this.roomObjectList[i];
            if(obj.forFarCanvas())
            {
               this.getFarCanvas().removeChild(obj);
            }
            else
            {
               this.getPlayerCanvas().removeChild(obj);
            }
         }
         this.roomObjectList.fixed = false;
         this.roomObjectList.length = 0;
         max = int(this.roomInteractiveObjectList.length);
         for(i = 0; i < max; i++)
         {
            obj = this.roomInteractiveObjectList[i];
            if(obj.forFarCanvas())
            {
               this.getFarCanvas().removeChild(obj);
            }
            else
            {
               this.getPlayerCanvas().removeChild(obj);
            }
         }
         this.roomInteractiveObjectList.fixed = false;
         this.roomInteractiveObjectList.length = 0;
         this.updateObjectList.fixed = false;
         this.updateObjectList.length = 0;
         this.hasHostile = false;
      }
      
      public function removeInteractiveRoomObject(objname:String) : *
      {
         var obj:InteractiveStageObject = null;
         var max:int = int(this.roomInteractiveObjectList.length);
         this.roomInteractiveObjectList.fixed = false;
         for(var i:int = 0; i < max; i++)
         {
            obj = this.roomInteractiveObjectList[i];
            if(obj.getObjectName() == objname)
            {
               if(obj.forFarCanvas())
               {
                  this.getFarCanvas().removeChild(obj);
               }
               else
               {
                  this.getPlayerCanvas().removeChild(obj);
               }
               this.roomInteractiveObjectList.splice(i,1);
               this.roomInteractiveObjectList.fixed = true;
               return;
            }
         }
         this.roomInteractiveObjectList.fixed = true;
      }
      
      public function abs(value:Number) : Number
      {
         return value < 0 ? -value : value;
      }
      
      public function checkClickOnInteractiveObject(mouseX:int, mouseY:int) : *
      {
         var obj:InteractiveStageObject = null;
         var max:int = int(this.roomInteractiveObjectList.length);
         this.interactTarget = null;
         for(var i:* = int(max - 1); i >= 0; i--)
         {
            obj = this.roomInteractiveObjectList[i];
            if(obj.isInteractive() && obj.isMouseOver(mouseX,mouseY))
            {
               this.interactTarget = obj;
            }
         }
      }
      
      public function checkMouseOver(mouseX:int, mouseY:int) : *
      {
         var obj:InteractiveStageObject = null;
         var max:int = int(this.roomInteractiveObjectList.length);
         for(var i:int = 0; i < max; i++)
         {
            obj = this.roomInteractiveObjectList[i];
            if(obj.isInteractive() && obj.isMouseOver(mouseX,mouseY))
            {
               if(obj.getAPUse() == 0)
               {
                  OverworldHUD.instance.showInteractLabel(mouseX,mouseY,obj.getDisplayText());
               }
               else
               {
                  OverworldHUD.instance.showInteractLabel(mouseX,mouseY,obj.getDisplayText() + " (" + obj.getAPUse().toString() + " " + LangManager.getString(223) + ")");
               }
               obj.onMouseOver();
               return;
            }
         }
         OverworldHUD.instance.showInteractLabel(0,0,"");
      }
      
      public function clearInteractTarget() : *
      {
         this.interactTarget = null;
      }
      
      public function showInteractAction(mc:MovieClip) : *
      {
         var obj:InteractiveStageObject = null;
         var objX:int = 0;
         var max:int = 0;
         var blockingRange:int = 0;
         var networkPlayerList:Vector.<NPC> = null;
         var npc:NPC = null;
         var mcX:int = mc.x;
         var player:MCSPlayer = StatsManager.getPlayer();
         var facingRight:Boolean = Boolean(mc.isFacingRight());
         for(var i:int = 0; i < this.roomInteractiveObjectList.length; i++)
         {
            obj = this.roomInteractiveObjectList[i];
            if(obj.isInInteractRange(mc))
            {
               if(obj == this.interactTarget)
               {
                  this.interactTarget = null;
                  obj.interactClick();
               }
               else
               {
                  OverworldHUD.instance.getNodeUI().registerInteractiveObject(obj);
                  objX = obj.x;
                  blockingRange = obj.getBlockingRange();
                  if(obj.isBlocking() && this.abs(objX - mcX) < blockingRange)
                  {
                     if(objX >= mcX && facingRight)
                     {
                        player.setPosition(objX - blockingRange - this.stagePosition,mc.y);
                     }
                     else if(objX <= mcX && !facingRight)
                     {
                        player.setPosition(objX + blockingRange - this.stagePosition,mc.y);
                     }
                     player.stopMoving();
                  }
               }
            }
         }
         if(!GameEngine.isPvPRoomMode())
         {
            networkPlayerList = NPCManager.getNetworkPlayerList();
            max = int(networkPlayerList.length);
            for(i = 0; i < max; i++)
            {
               npc = networkPlayerList[i];
               if(npc != null && npc.getMCS() != null)
               {
                  objX = npc.getMCS().x;
                  if(this.abs(objX - mcX) < 100)
                  {
                     OverworldHUD.instance.getNodeUI().registerEnemyPlayer(npc as EnemyPlayer);
                  }
               }
            }
         }
         OverworldHUD.instance.getNodeUI().showButtons();
      }
      
      public function doUpdateObjectList() : *
      {
         for(var i:int = 0; i < this.updateObjectList.length; i++)
         {
            this.updateObjectList[i].update();
         }
      }
      
      public function isNPCBlocked(mcX:int, facingRight:Boolean) : Boolean
      {
         var obj:InteractiveStageObject = null;
         var objX:int = 0;
         var max:int = int(this.roomInteractiveObjectList.length);
         for(var i:int = 0; i < max; i++)
         {
            obj = this.roomInteractiveObjectList[i];
            objX = obj.x;
            if(obj.isNPCBlocking() && this.abs(objX - mcX) < 50)
            {
               if(objX >= mcX && facingRight || objX <= mcX && !facingRight)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function getRoomInteractiveObject(id:String) : InteractiveStageObject
      {
         var obj:InteractiveStageObject = null;
         var max:int = int(this.roomInteractiveObjectList.length);
         for(var i:int = 0; i < max; i++)
         {
            obj = this.roomInteractiveObjectList[i];
            if(obj.objectName == id)
            {
               return obj;
            }
         }
         return null;
      }
      
      public function hideForeground() : *
      {
         var arrayLength:int = int(this.foregroundArray.length);
         for(var i:int = 0; i < arrayLength; i++)
         {
            this.foregroundArray[i].visible = false;
         }
      }
      
      public function doResize() : *
      {
         scaleX = StatsManager.stageScale;
         scaleY = StatsManager.stageScale;
         x = StatsManager.stageOffsetX;
         y = StatsManager.stageOffsetY;
         GameEngine.placeBlockers();
      }
      
      public function getPlayerCanvas() : MovieClip
      {
         return MovieClip(this).playercanvas;
      }
      
      public function getFarCanvas() : MovieClip
      {
         return MovieClip(this).farcanvas;
      }
      
      public function getRedBG() : MovieClip
      {
         return MovieClip(this).redBG;
      }
   }
}

