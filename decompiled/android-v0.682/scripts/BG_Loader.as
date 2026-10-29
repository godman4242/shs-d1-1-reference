package
{
   import flash.display.MovieClip;
   
   public class BG_Loader extends GameStage
   {
      
      internal var stageContent:MovieClip;
      
      internal var bgType:int;
      
      public function BG_Loader(_bgType:int, bgParam:int = 0, bgParam2:int = 0)
      {
         var bgXML:XMLBG = null;
         var rng:RNG = null;
         var i:* = 0;
         var type:int = 0;
         var remainder:int = 0;
         super();
         this.bgType = _bgType;
         bgXML = QuestEngine.getBGData(this.bgType);
         groundY = bgXML.groundY;
         flatGround = bgXML.flatGround;
         contentWidth = bgXML.contentWidth;
         wrapAround = bgXML.wrapAround;
         farthestLayerCount = bgXML.farthestLayerCount;
         farLayerCount = bgXML.farLayerCount;
         playerPlaneLayerCount = bgXML.playerPlaneLayerCount;
         groundLayerCount = bgXML.groundLayerCount;
         foregroundLayerCount = bgXML.foregroundLayerCount;
         farthestLayerCount = bgXML.farthestLayerCount;
         farLayerCount = bgXML.farLayerCount;
         playerPlaneLayerCount = bgXML.playerPlaneLayerCount;
         groundLayerCount = bgXML.groundLayerCount;
         foregroundLayerCount = bgXML.foregroundLayerCount;
         farthestLayerWrap = bgXML.farthestLayerWrap;
         farLayerWrap = bgXML.farLayerWrap;
         playerPlaneLayerWrap = bgXML.playerPlaneLayerWrap;
         groundLayerWrap = bgXML.groundLayerWrap;
         foregroundLayerWrap = bgXML.foregroundLayerWrap;
         farthestLayerBlur = bgXML.farthestLayerBlur;
         farLayerBlur = bgXML.farLayerBlur;
         playerPlaneLayerBlur = bgXML.playerPlaneLayerBlur;
         groundLayerBlur = bgXML.groundLayerBlur;
         foregroundLayerBlur = bgXML.foregroundLayerBlur;
         farthestLayerScroll = bgXML.farthestLayerScroll;
         farLayerScroll = bgXML.farLayerScroll;
         playerPlaneLayerScroll = bgXML.playerPlaneLayerScroll;
         groundLayerScroll = bgXML.groundLayerScroll;
         foregroundLayerScroll = bgXML.foregroundLayerScroll;
         this.stageContent = ResourceManager.getBG(bgXML.name);
         addChild(this.stageContent);
         this.stageContent.redBG.visible = false;
         this.registerMC();
         if(this.bgType == BG_KITCHEN && bgParam == 1)
         {
            farArray[3].gotoAndStop(2);
         }
         else if(this.bgType == BG_NINJAVILLAGE)
         {
            rng = new RNG(StageManager.getCurrentNode() * (StageManager.getCurrentRoom() + 21));
            this.scrollStage(-rng.rand(2000));
            stagePosition = 0;
         }
         else if(this.bgType == BG_TEMPLEINTERIOR || this.bgType == BG_TEMPLEINTERIOR2)
         {
            rng = new RNG(StageManager.getCurrentNode() * StageManager.getCurrentRoom());
            if(this.bgType == BG_TEMPLEINTERIOR)
            {
               type = rng.rand(4) + 1;
            }
            else
            {
               type = rng.rand(3) + 1;
            }
            for(i = 0; i < playerPlaneLayerCount; i++)
            {
               playerPlaneArray[i].gotoAndStop(type);
            }
            if(bgParam2 != 0)
            {
               playerPlaneArray[bgParam2 - 1].gotoAndStop(5);
            }
         }
         else if(this.bgType == BG_DENSEFOREST)
         {
            rng = new RNG(StageManager.getCurrentNode() * (StageManager.getCurrentRoom() + 21));
            for(i = int(playerPlaneLayerCount - 1); i >= 0; i--)
            {
               if(rng.rand(3) == 0)
               {
                  this.stageContent.removeChild(playerPlaneArray[i]);
                  playerPlaneArray.splice(i,1);
                  --playerPlaneLayerCount;
               }
            }
            for(i = int(foregroundLayerCount - 1); i >= 0; i--)
            {
               if(rng.rand(3) == 0)
               {
                  this.stageContent.removeChild(foregroundArray[i]);
                  foregroundArray.splice(i,1);
                  --foregroundLayerCount;
               }
            }
         }
         else if((this.bgType == BG_DUNGEON || this.bgType == BG_DUNGEON_FOG) && bgParam != 0)
         {
            for(i = 0; i < farLayerCount; i++)
            {
               ColorCode.setMCTint(farArray[i].base,0.1,bgParam);
            }
         }
         else if((this.bgType == BG_CASTLEWALLS || this.bgType == BG_CASTLEWALLS_INNER) && bgParam != 0)
         {
            this.stageContent.bg.castle.visible = false;
         }
         else if(this.bgType == BG_CASTLEWALKWAY && bgParam != 0)
         {
            farArray[bgParam].gotoAndStop(2);
         }
         else if(this.bgType == BG_CASTLEHALLWAY && bgParam != 0)
         {
            remainder = bgParam % 3;
            if(remainder == 0)
            {
               farArray[(bgParam - remainder) / 3].door1.gotoAndStop(2);
            }
            else if(remainder == 1)
            {
               farArray[(bgParam - remainder) / 3].door2.gotoAndStop(2);
            }
            else if(remainder == 2)
            {
               farArray[(bgParam - remainder) / 3].door3.gotoAndStop(2);
            }
         }
         else if(this.bgType == BG_CASTLEROOM)
         {
            this.initCastleRoom(bgParam);
         }
         else if(this.bgType == BG_DOJO3)
         {
            this.initDojo3(bgParam);
         }
         else if(this.bgType == BG_HUTINSIDE)
         {
            this.initHutInside(bgParam);
         }
         else if(this.bgType == BG_INN)
         {
            this.initInn(bgParam);
         }
         else if(this.bgType == BG_GAMBLINGDEN)
         {
            this.initGamblingDen(bgParam);
         }
         else if(this.bgType == BG_JINMAKU || this.bgType == BG_JINMAKU_NIGHT)
         {
            this.initJinmaku(bgParam,bgParam2,this.bgType == BG_JINMAKU_NIGHT);
         }
         else if(this.bgType == BG_JINMAKU_OUTSIDE || this.bgType == BG_JINMAKU_NIGHT_OUTSIDE)
         {
            this.initJinmakuOutside(bgParam);
         }
         else if(this.bgType == BG_ANCIENTRUINS)
         {
            this.initAncientRuins(bgParam2);
         }
         else if(this.bgType == BG_BANDITHIDEOUT)
         {
            this.initBanditHideout(bgParam);
         }
      }
      
      override public function registerMC() : *
      {
         var i:int = 0;
         var mc:MovieClip = null;
         for(i = 1; i <= farthestLayerCount; i++)
         {
            mc = MovieClip(this.stageContent.getChildByName("ff_" + i));
            farthestArray.push(mc);
            mc.cacheAsBitmap = true;
            mc.flipped = this.scaleX < 0 || mc.transform.matrix.a < 0;
            if(!(this.bgType == BG_FORESTSPOOKY && i > 2))
            {
               if(farthestLayerBlur != 0)
               {
                  ColorCode.blur(mc,farthestLayerBlur);
               }
            }
            if(Boolean(mc.flipped) && (mc.x < 0 || mc.x - mc.width > screenWidth))
            {
               mc.visible = false;
            }
            else if(!mc.flipped && (mc.x + mc.width < 0 || mc.x > screenWidth))
            {
               mc.visible = false;
            }
         }
         farthestArray.fixed = true;
         for(i = 1; i <= farLayerCount; i++)
         {
            mc = MovieClip(this.stageContent.getChildByName("f_" + i));
            farArray.push(mc);
            mc.cacheAsBitmap = true;
            mc.flipped = this.scaleX < 0 || mc.transform.matrix.a < 0;
            if(farLayerBlur != 0)
            {
               ColorCode.blur(mc,farLayerBlur);
            }
            if(Boolean(mc.flipped) && (mc.x < 0 || mc.x - mc.width > screenWidth))
            {
               mc.visible = false;
            }
            else if(!mc.flipped && (mc.x + mc.width < 0 || mc.x > screenWidth))
            {
               mc.visible = false;
            }
         }
         farArray.fixed = true;
         for(i = 1; i <= playerPlaneLayerCount; i++)
         {
            mc = MovieClip(this.stageContent.getChildByName("pp_" + i));
            playerPlaneArray.push(mc);
            mc.cacheAsBitmap = true;
            mc.flipped = this.scaleX < 0 || mc.transform.matrix.a < 0;
            if(playerPlaneLayerBlur != 0)
            {
               ColorCode.blur(mc,playerPlaneLayerBlur);
            }
            if(Boolean(mc.flipped) && (mc.x < 0 || mc.x - mc.width > screenWidth))
            {
               mc.visible = false;
            }
            else if(!mc.flipped && (mc.x + mc.width < 0 || mc.x > screenWidth))
            {
               mc.visible = false;
            }
         }
         playerPlaneArray.fixed = true;
         for(i = 1; i <= groundLayerCount; i++)
         {
            mc = MovieClip(this.stageContent.getChildByName("ground_" + i));
            groundArray.push(mc);
            mc.flipped = this.scaleX < 0 || mc.transform.matrix.a < 0;
            if(i <= 2 && groundLayerBlur != 0)
            {
               ColorCode.blur(mc,groundLayerBlur);
               mc.cacheAsBitmap = true;
            }
         }
         groundArray.fixed = true;
         for(i = 1; i <= foregroundLayerCount; i++)
         {
            mc = MovieClip(this.stageContent.getChildByName("fg_" + i));
            foregroundArray.push(mc);
            mc.cacheAsBitmap = true;
            mc.flipped = this.scaleX < 0 || mc.transform.matrix.a < 0;
            if(foregroundLayerBlur != 0)
            {
               ColorCode.blur(mc,foregroundLayerBlur);
            }
            if(Boolean(mc.flipped) && (mc.x < 0 || mc.x - mc.width > screenWidth))
            {
               mc.visible = false;
            }
            else if(!mc.flipped && (mc.x + mc.width < 0 || mc.x > screenWidth))
            {
               mc.visible = false;
            }
         }
         foregroundArray.fixed = true;
      }
      
      override public function scrollStage(dist:int) : *
      {
         var i:int = 0;
         var thing:MovieClip = null;
         var nextThing:MovieClip = null;
         for(i = 0; i < farthestLayerCount; i++)
         {
            thing = farthestArray[i];
            thing.x += dist * farthestLayerScroll;
            checkWrapAround(thing,4,dist);
            if(!thing.visible)
            {
               checkMakeVisible(thing,dist);
            }
         }
         for(i = 0; i < farLayerCount; i++)
         {
            thing = farArray[i];
            thing.x += dist * farLayerScroll;
            checkWrapAround(thing,3,dist);
            if(!thing.visible)
            {
               checkMakeVisible(thing,dist);
            }
         }
         for(i = 0; i < playerPlaneLayerCount; i++)
         {
            thing = playerPlaneArray[i];
            thing.x += dist * playerPlaneLayerScroll;
            checkWrapAround(thing,2,dist);
            if(!thing.visible)
            {
               checkMakeVisible(thing,dist);
            }
         }
         for(i = 0; i < groundLayerCount; i++)
         {
            thing = groundArray[i];
            thing.x += dist * groundLayerScroll;
            checkWrapAround(thing,1,dist);
            if(!thing.visible)
            {
               checkMakeVisible(thing,dist);
            }
         }
         for(i = 0; i < foregroundLayerCount; i++)
         {
            thing = foregroundArray[i];
            thing.x += dist * foregroundLayerScroll;
            checkWrapAround(thing,0,dist);
            if(!thing.visible)
            {
               checkMakeVisible(thing,dist);
            }
         }
         stagePosition += dist;
      }
      
      override public function getPlayerCanvas() : MovieClip
      {
         return this.stageContent.playercanvas;
      }
      
      override public function getFarCanvas() : MovieClip
      {
         if(this.stageContent.farcanvas == null)
         {
            return this.stageContent.playercanvas;
         }
         return this.stageContent.farcanvas;
      }
      
      override public function getRedBG() : MovieClip
      {
         return this.stageContent.redBG;
      }
      
      internal function initCastleRoom(bgParam:int) : *
      {
         var rng:RNG = new RNG(StageManager.getCurrentNode() * (StageManager.getCurrentRoom() + 21));
         this.stageContent.bg.flower1.gotoAndStop(rng.rand(5) + 1);
         this.stageContent.bg.flower2.gotoAndStop(rng.rand(5) + 1);
         this.stageContent.bg.flower3.gotoAndStop(rng.rand(5) + 1);
         this.stageContent.bg.flower4.gotoAndStop(rng.rand(5) + 1);
         this.stageContent.bg.flower5.gotoAndStop(rng.rand(5) + 1);
         this.stageContent.bg.flower6.gotoAndStop(rng.rand(5) + 1);
         this.stageContent.bg.sidepiece1.gotoAndStop(rng.rand(8) + 1);
         this.stageContent.bg.sidepiece2.gotoAndStop(rng.rand(8) + 1);
         this.stageContent.bg.centerpiece.gotoAndStop(rng.rand(9) + 1);
         var bgColor:int = 0;
         if(bgParam == 1)
         {
            this.stageContent.leftdoor.gotoAndStop(2);
            this.stageContent.rightdoor.gotoAndStop(1);
         }
         else if(bgParam == 2)
         {
            this.stageContent.leftdoor.gotoAndStop(1);
            this.stageContent.rightdoor.gotoAndStop(2);
         }
         else if(bgParam == 3)
         {
            this.stageContent.leftdoor.gotoAndStop(2);
            this.stageContent.rightdoor.gotoAndStop(2);
         }
         else if(bgParam == 4)
         {
            this.stageContent.leftdoor.gotoAndStop(4);
            this.stageContent.rightdoor.gotoAndStop(3);
            bgColor = 9398845;
         }
         else if(bgParam == 5)
         {
            this.stageContent.leftdoor.gotoAndStop(3);
            this.stageContent.rightdoor.gotoAndStop(4);
            bgColor = 9398845;
         }
         else if(bgParam == 6)
         {
            this.stageContent.leftdoor.gotoAndStop(4);
            this.stageContent.rightdoor.gotoAndStop(4);
            bgColor = 9398845;
         }
         if(bgColor != 0)
         {
            ColorCode.changeColor(this.stageContent.bg.basecolor,bgColor);
            if(this.stageContent.leftdoor.currentFrame <= 2)
            {
               ColorCode.changeColor(this.stageContent.leftdoor.basecolor,bgColor);
            }
            if(this.stageContent.rightdoor.currentFrame <= 2)
            {
               ColorCode.changeColor(this.stageContent.rightdoor.basecolor,bgColor);
            }
         }
      }
      
      internal function initDojo3(bgParam:int) : *
      {
         if(bgParam == 0)
         {
            farArray[0].door.visible = false;
            farArray[7].door.visible = false;
         }
         else if(bgParam == 1)
         {
            farArray[0].door.gotoAndStop(3);
            farArray[7].door.gotoAndStop(4);
         }
         else if(bgParam == 2)
         {
            farArray[0].door.gotoAndStop(4);
            farArray[7].door.gotoAndStop(3);
         }
         else if(bgParam == 3)
         {
            farArray[0].door.gotoAndStop(3);
            farArray[7].door.gotoAndStop(3);
         }
      }
      
      internal function initHutInside(bgParam:int) : *
      {
         var rng:RNG = new RNG(StageManager.getCurrentNode());
         this.stageContent.window1.visible = false;
         this.stageContent.window2.visible = false;
         this.stageContent.window3.visible = false;
         this.stageContent.window4.visible = false;
         this.stageContent.window5.visible = false;
         this.stageContent.window6.visible = false;
         this.stageContent.banner.visible = false;
         this.stageContent.cooking.visible = false;
         this.stageContent.anvil.visible = false;
         this.stageContent.wood1.visible = false;
         this.stageContent.wood2.visible = false;
         this.stageContent.banner.visible = false;
         this.stageContent.shelf.visible = false;
         this.stageContent.table.visible = false;
         this.stageContent.bag0.visible = false;
         this.stageContent.bag1.visible = false;
         this.stageContent.bag2.visible = false;
         this.stageContent.bag3.visible = false;
         this.stageContent.bag4.visible = false;
         this.stageContent.hat.visible = false;
         if(StageManager.getCurrentNode() == 8390657)
         {
            this.stageContent.banner.visible = true;
            this.stageContent.anvil.visible = true;
            this.stageContent.table.visible = true;
            this.stageContent.window4.visible = true;
            this.stageContent.shelf.visible = true;
            this.stageContent.wood1.visible = true;
            this.stageContent.wood2.visible = true;
            this.stageContent.hat.visible = true;
            return;
         }
         var dice:int = rng.rand(7);
         if(dice == 0)
         {
            this.stageContent.window2.visible = true;
         }
         else if(dice == 1)
         {
            this.stageContent.window4.visible = true;
         }
         else if(dice == 2)
         {
            this.stageContent.window1.visible = true;
         }
         else if(dice == 3)
         {
            this.stageContent.window6.visible = true;
         }
         else if(dice == 4)
         {
            this.stageContent.window2.visible = true;
            this.stageContent.window3.visible = true;
         }
         else if(dice == 5)
         {
            this.stageContent.window4.visible = true;
            this.stageContent.window5.visible = true;
         }
         else if(dice == 6)
         {
            this.stageContent.window2.visible = true;
            this.stageContent.window4.visible = true;
         }
         this.stageContent.bag0.visible = rng.rand(2) == 0;
         this.stageContent.bag1.visible = this.stageContent.bag0.visible;
         this.stageContent.bag2.visible = rng.rand(2) == 0;
         this.stageContent.bag3.visible = rng.rand(2) == 0;
         this.stageContent.bag4.visible = rng.rand(2) == 0;
         this.stageContent.bag5.visible = rng.rand(2) == 0;
         this.stageContent.wood1.visible = rng.rand(2) == 0;
         this.stageContent.wood2.visible = rng.rand(2) == 0;
         this.stageContent.hat.visible = !this.stageContent.window1.visible && rng.rand(2) == 0;
         this.stageContent.cooking.visible = rng.rand(2) == 0;
         this.stageContent.shelf.visible = rng.rand(2) == 0;
         this.stageContent.table.visible = rng.rand(2) == 0;
      }
      
      internal function initInn(bgParam:int) : *
      {
         var npc:Obj_NPC = null;
         var pose:String = null;
         var posedice:int = 0;
         if(bgParam == 1)
         {
            this.stageContent.f_11.gotoAndStop(2);
         }
         var rng:RNG = new RNG(StageManager.getCurrentNode() * 2);
         this.stageContent.f_1.gotoAndStop(rng.rand(3) + 1);
         var patronArray:Array = new Array();
         if(rng.rand(2) == 0)
         {
            posedice = rng.rand(3);
            if(posedice == 0)
            {
               pose = MCSActor.SIT;
            }
            else if(posedice == 1)
            {
               pose = MCSActor.SIT2;
            }
            else if(posedice == 2)
            {
               pose = MCSActor.SIT3;
            }
            npc = new Obj_NPC((50 + rng.rand(4)).toString() + "," + pose + ",1","patron1");
            npc.x = 150;
            patronArray.push(npc);
         }
         if(rng.rand(2) == 0)
         {
            posedice = rng.rand(3);
            if(posedice == 0)
            {
               pose = MCSActor.SIT;
            }
            else if(posedice == 1)
            {
               pose = MCSActor.SIT2;
            }
            else if(posedice == 2)
            {
               pose = MCSActor.SIT3;
            }
            npc = new Obj_NPC((50 + rng.rand(4)).toString() + "," + pose,"patron2");
            npc.x = 340;
            patronArray.push(npc);
         }
         if(rng.rand(2) == 0)
         {
            posedice = rng.rand(3);
            if(posedice == 0)
            {
               pose = MCSActor.SIT;
            }
            else if(posedice == 1)
            {
               pose = MCSActor.SIT2;
            }
            else if(posedice == 2)
            {
               pose = MCSActor.SIT3;
            }
            npc = new Obj_NPC((50 + rng.rand(4)).toString() + "," + pose,"patron3");
            npc.x = 435;
            patronArray.push(npc);
         }
         if(rng.rand(2) == 0)
         {
            posedice = rng.rand(3);
            if(posedice == 0)
            {
               pose = MCSActor.SIT;
            }
            else if(posedice == 1)
            {
               pose = MCSActor.SIT2;
            }
            else if(posedice == 2)
            {
               pose = MCSActor.SIT3;
            }
            npc = new Obj_NPC((50 + rng.rand(4)).toString() + "," + pose + ",1","patron4");
            npc.x = 520;
            patronArray.push(npc);
         }
         if(rng.rand(2) == 0)
         {
            posedice = rng.rand(3);
            if(posedice == 0)
            {
               pose = MCSActor.SIT;
            }
            else if(posedice == 1)
            {
               pose = MCSActor.SIT2;
            }
            else if(posedice == 2)
            {
               pose = MCSActor.SIT3;
            }
            npc = new Obj_NPC((50 + rng.rand(4)).toString() + "," + pose,"patron5");
            npc.x = 695;
            patronArray.push(npc);
         }
         if(rng.rand(2) == 0)
         {
            posedice = rng.rand(3);
            if(posedice == 0)
            {
               pose = MCSActor.SIT;
            }
            else if(posedice == 1)
            {
               pose = MCSActor.SIT2;
            }
            else if(posedice == 2)
            {
               pose = MCSActor.SIT3;
            }
            npc = new Obj_NPC((50 + rng.rand(4)).toString() + "," + pose,"patron6");
            npc.x = 795;
            patronArray.push(npc);
         }
         for(var i:int = 0; i < patronArray.length; i++)
         {
            npc = patronArray[i] as Obj_NPC;
            npc.y = 365;
            npc.mcs.setDisplayName("");
            this.stageContent.ff_1.addChild(npc);
         }
      }
      
      internal function initGamblingDen(bgParam:int) : *
      {
         var npc:Obj_NPC = null;
         if(bgParam == 1)
         {
            this.stageContent.f_2.gotoAndStop(2);
         }
         var rng:RNG = new RNG(StageManager.getCurrentNode() * 2);
         if(rng.rand(2) == 0)
         {
            npc = new Obj_NPC((50 + rng.rand(4)).toString() + "," + MCSActor.SIT + ",1","patron1");
            npc.x = 220;
            npc.y = groundY;
            npc.mcs.setDisplayName("");
            npc.cacheAsBitmap = true;
            this.stageContent.playercanvas.addChild(npc);
            roomObjectList.fixed = false;
            roomObjectList.push(npc);
            roomObjectList.fixed = true;
         }
         if(rng.rand(2) == 0)
         {
            npc = new Obj_NPC((50 + rng.rand(4)).toString() + "," + MCSActor.SIT + ",1","patron2");
            npc.x = 550;
            npc.y = groundY;
            npc.mcs.setDisplayName("");
            npc.cacheAsBitmap = true;
            this.stageContent.playercanvas.addChild(npc);
            roomObjectList.fixed = false;
            roomObjectList.push(npc);
            roomObjectList.fixed = true;
         }
      }
      
      internal function initJinmaku(side:int, bgParam2:int, isNight:Boolean) : *
      {
         var mc:MovieClip = null;
         var rng:RNG = new RNG(StageManager.getCurrentNode() * (StageManager.getCurrentRoom() + 21));
         for(var i:int = 0; i < playerPlaneLayerCount - 1; i++)
         {
            mc = playerPlaneArray[i];
            mc.decor1.visible = rng.rand(2) == 0;
            mc.decor2.visible = rng.rand(2) == 0;
            mc.decor3.visible = rng.rand(2) == 0;
            mc.decor4.visible = rng.rand(2) == 0;
            mc.decor5.visible = rng.rand(2) == 0;
            mc.decor6.visible = rng.rand(2) == 0;
            mc.decor7.visible = rng.rand(2) == 0;
            mc.decor7.gotoAndStop(side + 1);
            mc.decor8.visible = rng.rand(2) == 0;
            mc.decor9.visible = rng.rand(2) == 0;
            mc.decor10.visible = rng.rand(2) == 0;
            mc.decor11.visible = rng.rand(2) == 0;
            mc.decor12.visible = rng.rand(2) == 0;
            mc.decor13.visible = rng.rand(8) == 0;
            mc.decor1.x = rng.rand(500 - mc.decor1.width);
            mc.decor2.x = rng.rand(500 - mc.decor2.width);
            mc.decor3.x = rng.rand(500 - mc.decor3.width);
            mc.decor4.x = rng.rand(500 - mc.decor4.width);
            mc.decor5.x = rng.rand(500 - mc.decor5.width);
            mc.decor6.x = rng.rand(500 - mc.decor6.width);
            mc.decor7.x = rng.rand(500 - mc.decor7.width);
            mc.decor8.x = rng.rand(500 - mc.decor8.width);
            mc.decor9.x = rng.rand(500 - mc.decor9.width);
            mc.decor10.x = rng.rand(500 - mc.decor10.width);
            mc.decor11.x = rng.rand(500 - mc.decor11.width);
            mc.decor12.x = rng.rand(500 - mc.decor12.width);
            mc.decor13.x = rng.rand(500 - mc.decor13.width);
            if(isNight && Boolean(mc.decor2.visible))
            {
               mc.cacheAsBitmap = false;
               mc.curtains.cacheAsBitmap = true;
               if(mc.decor1.visible)
               {
                  mc.decor1.cacheAsBitmap = true;
               }
               if(mc.decor3.visible)
               {
                  mc.decor3.cacheAsBitmap = true;
               }
               if(mc.decor4.visible)
               {
                  mc.decor4.cacheAsBitmap = true;
               }
               if(mc.decor5.visible)
               {
                  mc.decor5.cacheAsBitmap = true;
               }
               if(mc.decor6.visible)
               {
                  mc.decor6.cacheAsBitmap = true;
               }
               if(mc.decor7.visible)
               {
                  mc.decor7.cacheAsBitmap = true;
               }
               if(mc.decor8.visible)
               {
                  mc.decor8.cacheAsBitmap = true;
               }
               if(mc.decor9.visible)
               {
                  mc.decor9.cacheAsBitmap = true;
               }
               if(mc.decor10.visible)
               {
                  mc.decor10.cacheAsBitmap = true;
               }
               if(mc.decor11.visible)
               {
                  mc.decor11.cacheAsBitmap = true;
               }
               if(mc.decor12.visible)
               {
                  mc.decor12.cacheAsBitmap = true;
               }
               if(mc.decor13.visible)
               {
                  mc.decor13.cacheAsBitmap = true;
               }
            }
         }
         if(bgParam2 > 0)
         {
            this.stageContent.pp_6.x = playerPlaneArray[bgParam2 - 1].x;
            playerPlaneArray[bgParam2 - 1].visible = false;
            this.stageContent.pp_6.visible = true;
         }
         else
         {
            this.stageContent.pp_6.visible = false;
         }
      }
      
      internal function initJinmakuOutside(side:int = 6) : *
      {
         var mc:MovieClip = null;
         var rng:RNG = new RNG(StageManager.getCurrentNode() * (StageManager.getCurrentRoom() + 21));
         for(var i:int = 0; i < playerPlaneLayerCount; i++)
         {
            if(i != 2)
            {
               mc = playerPlaneArray[i];
               mc.decor1.visible = false;
               mc.decor2.visible = false;
               mc.decor3.visible = false;
               mc.decor4.visible = false;
               mc.decor5.visible = false;
               mc.decor6.visible = false;
               mc.decor7.visible = true;
               mc.decor7.gotoAndStop(side + 1);
               mc.decor8.visible = false;
               mc.decor9.visible = false;
               mc.decor10.visible = false;
               mc.decor11.visible = false;
               mc.decor12.visible = false;
               mc.decor13.visible = false;
            }
         }
         for(i = 2; i <= 6; i++)
         {
            farArray[i].gotoAndStop(side + 1);
         }
      }
      
      internal function initAncientRuins(bgParam:int) : *
      {
         var dice:int = 0;
         var temp:int = 0;
         var thing:MovieClip = null;
         var i:int = 0;
         var dist:int = 0;
         var mc:MovieClip = null;
         var rng:RNG = new RNG(StageManager.getCurrentNode() * (StageManager.getCurrentRoom() + 21));
         this.stageContent.f_1.decor.gotoAndStop(rng.rand(9) + 1);
         dice = rng.rand(5);
         this.stageContent.f_1.decor.tear1.visible = dice == 0;
         this.stageContent.f_1.decor.tear2.visible = dice == 1;
         this.stageContent.f_2.decor.gotoAndStop(rng.rand(9) + 1);
         dice = rng.rand(5);
         this.stageContent.f_1.decor.tear1.visible = dice == 0;
         this.stageContent.f_1.decor.tear2.visible = dice == 1;
         if(bgParam == 0)
         {
            dice = rng.rand(3);
            if(dice == 0)
            {
               thing = this.stageContent.f_2;
            }
            else if(dice == 1)
            {
               thing = this.stageContent.f_3;
            }
            if(dice != 2)
            {
               temp = thing.x;
               thing.x = this.stageContent.f_1.x;
               this.stageContent.f_1.x = temp;
            }
         }
         if(bgParam == 1)
         {
            temp = int(this.stageContent.f_1.x);
            this.stageContent.f_1.x = this.stageContent.f_3.x;
            this.stageContent.f_3.x = temp;
            this.stageContent.f_3.rocks.visible = false;
            this.scrollStage(-250);
            stagePosition = 0;
            dist = -600;
            for(i = 0; i < playerPlaneLayerCount; i++)
            {
               thing = playerPlaneArray[i];
               thing.x += dist * playerPlaneLayerScroll;
               checkWrapAround(thing,2,dist * playerPlaneLayerScroll);
            }
         }
         else if(bgParam == 2)
         {
            temp = int(this.stageContent.f_2.x);
            this.stageContent.f_2.x = this.stageContent.f_3.x;
            this.stageContent.f_3.x = temp;
            this.stageContent.f_3.rocks.visible = false;
            this.scrollStage(-440);
            stagePosition = 0;
            dist = 650;
            for(i = 0; i < playerPlaneLayerCount; i++)
            {
               thing = playerPlaneArray[i];
               thing.x += dist * playerPlaneLayerScroll;
               checkWrapAround(thing,2,dist * playerPlaneLayerScroll);
            }
         }
         else if(bgParam == 3)
         {
            temp = int(this.stageContent.f_2.x);
            this.stageContent.f_2.x = this.stageContent.f_3.x;
            this.stageContent.f_3.x = temp;
            this.stageContent.f_3.rocks.visible = false;
            this.scrollStage(-1000);
            stagePosition = 0;
            dist = 700;
            for(i = 0; i < playerPlaneLayerCount; i++)
            {
               thing = playerPlaneArray[i];
               thing.x += dist * playerPlaneLayerScroll;
               checkWrapAround(thing,2,dist * playerPlaneLayerScroll);
            }
         }
         for(i = 1; i <= farLayerCount; i++)
         {
            mc = MovieClip(this.stageContent.getChildByName("f_" + i));
            if(Boolean(mc.flipped) && (mc.x < 0 || mc.x - mc.width > screenWidth))
            {
               mc.visible = false;
            }
            else if(!mc.flipped && (mc.x + mc.width < 0 || mc.x > screenWidth))
            {
               mc.visible = false;
            }
            else
            {
               mc.visible = true;
            }
         }
      }
      
      internal function initBanditHideout(bgParam:int) : *
      {
         var mc:MovieClip = null;
         var i:* = 0;
         var dice:int = 0;
         var swap1:int = 0;
         var swap2:int = 0;
         var swap3:int = 0;
         var swap4:int = 0;
         var swap5:int = 0;
         var swap6:int = 0;
         var temppos:int = 0;
         var rng:RNG = new RNG(StageManager.getCurrentNode() * (StageManager.getCurrentRoom() + 21));
         for(i = int(playerPlaneLayerCount - 1); i >= 0; i--)
         {
            mc = playerPlaneArray[i];
            if(i == 7 || i == 9)
            {
               if(rng.rand(6) != 0)
               {
                  this.stageContent.removeChild(mc);
                  playerPlaneArray.splice(i,1);
                  --playerPlaneLayerCount;
               }
            }
            else if(rng.rand(3) == 0)
            {
               this.stageContent.removeChild(mc);
               playerPlaneArray.splice(i,1);
               --playerPlaneLayerCount;
            }
            mc.x = rng.rand(contentWidth - 300) + 150;
         }
         this.stageContent.f_1.decor1.visible = rng.rand(4) == 0;
         this.stageContent.f_1.decor2.visible = rng.rand(4) == 0;
         this.stageContent.f_1.decor3.visible = false;
         this.stageContent.f_1.decor4.visible = false;
         this.stageContent.f_1.decor5.visible = rng.rand(4) == 0;
         this.stageContent.f_1.decor6.visible = rng.rand(4) == 0;
         this.stageContent.f_1.decor7.visible = false;
         this.stageContent.f_2.decor1.visible = rng.rand(4) == 0;
         this.stageContent.f_2.decor2.visible = rng.rand(4) == 0;
         this.stageContent.f_2.decor3.visible = rng.rand(4) == 0;
         this.stageContent.f_2.decor4.visible = false;
         this.stageContent.f_2.decor5.visible = false;
         this.stageContent.f_2.decor6.visible = rng.rand(4) == 0;
         this.stageContent.f_2.decor7.visible = rng.rand(4) == 0;
         this.stageContent.f_2.decor8.visible = false;
         this.stageContent.f_3.decor1.visible = rng.rand(4) == 0;
         this.stageContent.f_3.decor2.visible = rng.rand(4) == 0;
         this.stageContent.f_3.decor3.visible = false;
         this.stageContent.f_3.decor4.visible = false;
         this.stageContent.f_3.decor5.visible = rng.rand(4) == 0;
         this.stageContent.f_3.decor6.visible = rng.rand(4) == 0;
         this.stageContent.f_3.decor7.visible = false;
         this.stageContent.f_3.door.visible = false;
         this.stageContent.f_4.decor1.visible = rng.rand(4) == 0;
         this.stageContent.f_4.decor2.visible = rng.rand(4) == 0;
         this.stageContent.f_4.decor3.visible = false;
         this.stageContent.f_4.decor4.visible = false;
         this.stageContent.f_5.decor1.visible = rng.rand(4) == 0;
         this.stageContent.f_5.decor2.visible = rng.rand(4) == 0;
         this.stageContent.f_5.decor3.visible = false;
         this.stageContent.f_5.decor4.visible = false;
         this.stageContent.f_5.decor5.visible = rng.rand(4) == 0;
         this.stageContent.f_5.decor6.visible = rng.rand(4) == 0;
         this.stageContent.f_5.decor7.visible = rng.rand(4) == 0;
         this.stageContent.f_5.decor8.visible = false;
         this.stageContent.f_6.decor1.visible = rng.rand(4) == 0;
         this.stageContent.f_6.decor2.visible = rng.rand(4) == 0;
         this.stageContent.f_6.decor3.visible = rng.rand(4) == 0;
         this.stageContent.f_6.decor4.visible = false;
         this.stageContent.f_6.door.visible = false;
         swap1 = rng.rand(6);
         swap2 = rng.rand(6);
         swap3 = rng.rand(6);
         swap4 = rng.rand(6);
         swap5 = rng.rand(6);
         swap6 = rng.rand(6);
         temppos = farArray[swap1].x;
         farArray[swap1].x = farArray[swap2].x;
         farArray[swap2].x = temppos;
         temppos = farArray[swap3].x;
         farArray[swap3].x = farArray[swap4].x;
         farArray[swap4].x = temppos;
         temppos = farArray[swap5].x;
         farArray[swap5].x = farArray[swap6].x;
         farArray[swap6].x = temppos;
         dice = rng.rand(4);
         this.stageContent.ff_1.decor1.visible = dice == 3;
         dice = rng.rand(5);
         this.stageContent.ff_2.decor1.visible = dice == 3;
         this.stageContent.ff_2.decor2.visible = dice == 4;
         dice = rng.rand(6);
         this.stageContent.ff_3.decor1.visible = dice == 3;
         this.stageContent.ff_3.decor2.visible = dice == 4;
         this.stageContent.ff_3.decor2.visible = dice == 5;
         dice = rng.rand(5);
         this.stageContent.ff_4.decor1.visible = dice == 3;
         this.stageContent.ff_4.decor2.visible = dice == 4;
         swap1 = rng.rand(4);
         swap2 = rng.rand(4);
         swap3 = rng.rand(4);
         swap4 = rng.rand(4);
         temppos = farthestArray[swap1].x;
         farthestArray[swap1].x = farthestArray[swap2].x;
         farthestArray[swap2].x = temppos;
         temppos = farthestArray[swap3].x;
         farthestArray[swap3].x = farthestArray[swap4].x;
         farthestArray[swap4].x = temppos;
         for(i = 1; i <= farLayerCount; i++)
         {
            mc = MovieClip(this.stageContent.getChildByName("f_" + i));
            if(Boolean(mc.flipped) && (mc.x < 0 || mc.x - mc.width > screenWidth))
            {
               mc.visible = false;
            }
            else if(!mc.flipped && (mc.x + mc.width < 0 || mc.x > screenWidth))
            {
               mc.visible = false;
            }
            else
            {
               mc.visible = true;
            }
         }
         for(i = 1; i <= farthestLayerCount; i++)
         {
            mc = MovieClip(this.stageContent.getChildByName("ff_" + i));
            if(Boolean(mc.flipped) && (mc.x < 0 || mc.x - mc.width > screenWidth))
            {
               mc.visible = false;
            }
            else if(!mc.flipped && (mc.x + mc.width < 0 || mc.x > screenWidth))
            {
               mc.visible = false;
            }
            else
            {
               mc.visible = true;
            }
         }
      }
      
      override public function redFreeze() : *
      {
         var i:int = 0;
         super.redFreeze();
         if(this.bgType == BG_CASTLEWALKWAY)
         {
            for(i = 0; i < playerPlaneLayerCount; i++)
            {
               ColorCode.makeBlack(playerPlaneArray[i]);
               playerPlaneArray[i].visible = true;
            }
         }
      }
   }
}

