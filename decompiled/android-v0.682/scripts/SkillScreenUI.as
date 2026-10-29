package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol753")]
   public class SkillScreenUI extends MovieClip
   {
      
      public var elementdisplay:MovieClip;
      
      public var cat1:SkillSlot;
      
      public var categoriesbutton:RedButton;
      
      public var cat2:SkillSlot;
      
      public var skillpointsLabel:TextField;
      
      public var cat3:SkillSlot;
      
      public var cat4:SkillSlot;
      
      public var categorylabel:TextField;
      
      public var cat5:SkillSlot;
      
      public var cat6:SkillSlot;
      
      public var pointsrequiredText:TextField;
      
      public var displayslot:SkillSlot;
      
      public var skilldesc:TextField;
      
      public var cat7:SkillSlot;
      
      public var cat8:SkillSlot;
      
      public var dragitem:SkillSlot;
      
      public var cat9:SkillSlot;
      
      public var equippedlabel:TextField;
      
      public var upgradebutton:RedButton;
      
      public var bg:MovieClip;
      
      public var titletext:TextField;
      
      public var closewindowbutton:SimpleButton;
      
      public var cat10:SkillSlot;
      
      public var equipbutton:RedButton;
      
      internal var skillSlotCount:int = 32;
      
      internal var skillSlots:Vector.<SkillSlot>;
      
      internal var equippedSlotCount:int = 8;
      
      internal var equippedSlots:Vector.<SkillSlot>;
      
      internal var startX:int = 328;
      
      internal var startY:int = 135;
      
      internal var spacingX:int = 57;
      
      internal var spacingY:int = 60;
      
      internal var selectedSkill:SkillSlot = null;
      
      internal var selectedEquippedSkill:SkillSlot = null;
      
      internal var unequipFlag:Boolean;
      
      internal var currentCategory:int = 0;
      
      internal var categoryCount:int = 10;
      
      internal var categorySlots:Vector.<SkillSlot>;
      
      internal var categoryIcons:Array;
      
      internal var categoryDesc:Array;
      
      internal var mousedown:Boolean;
      
      internal var dragequipflag:Boolean;
      
      public function SkillScreenUI()
      {
         var skillSlot:SkillSlot = null;
         var i:int = 0;
         this.skillSlots = new Vector.<SkillSlot>(this.skillSlotCount);
         this.equippedSlots = new Vector.<SkillSlot>(this.equippedSlotCount);
         this.categorySlots = new Vector.<SkillSlot>();
         this.categoryIcons = [1,2,3,4,5,6,7,8,9,10];
         this.categoryDesc = [6024,6025,6026,6027,6028,6029,6030,6031,6032,6033];
         super();
         for(i = 0; i < this.skillSlotCount; i++)
         {
            skillSlot = new SkillSlot();
            addChild(skillSlot);
            this.skillSlots[i] = skillSlot;
            skillSlot.x = this.startX + i % 8 * this.spacingX;
            skillSlot.y = this.startY + Math.floor(i / 8) * this.spacingY;
            skillSlot.visible = false;
            skillSlot.doubleClickEnabled = true;
         }
         for(i = 0; i < this.equippedSlotCount; i++)
         {
            skillSlot = new SkillSlot();
            addChild(skillSlot);
            this.equippedSlots[i] = skillSlot;
            skillSlot.x = 727 - i * this.spacingX;
            skillSlot.y = 430;
            skillSlot.visible = true;
            skillSlot.doubleClickEnabled = true;
         }
         this.cat1.initSkill(this.categoryIcons[0],1);
         this.cat2.initSkill(this.categoryIcons[1],1);
         this.cat3.initSkill(this.categoryIcons[2],1);
         this.cat4.initSkill(this.categoryIcons[3],1);
         this.cat5.initSkill(this.categoryIcons[4],1);
         this.cat6.initSkill(this.categoryIcons[5],1);
         this.cat7.initSkill(this.categoryIcons[6],1);
         this.cat8.initSkill(this.categoryIcons[7],1);
         this.cat9.initSkill(this.categoryIcons[8],1);
         this.cat10.initSkill(this.categoryIcons[9],1);
         this.categorySlots.push(this.cat1);
         this.categorySlots.push(this.cat2);
         this.categorySlots.push(this.cat3);
         this.categorySlots.push(this.cat4);
         this.categorySlots.push(this.cat5);
         this.categorySlots.push(this.cat6);
         this.categorySlots.push(this.cat7);
         this.categorySlots.push(this.cat8);
         this.categorySlots.push(this.cat9);
         this.categorySlots.push(this.cat10);
         this.upgradebutton.setText(LangManager.getString(80));
         this.upgradebutton.visible = false;
         this.equipbutton.setText(LangManager.getString(298));
         this.equipbutton.visible = false;
         this.categoriesbutton.setText(LangManager.getString(686));
         this.categoriesbutton.visible = false;
         this.displayslot.mouseEnabled = false;
         this.dragitem.mouseEnabled = false;
         this.dragitem.visible = false;
         this.titletext.text = LangManager.getString(81);
         LangManager.initTextField(this.skilldesc,true);
         LangManager.initTextField(this.equippedlabel,true);
         LangManager.initTextField(this.skillpointsLabel,true);
         LangManager.initTextField(this.titletext,true);
         LangManager.initTextField(this.pointsrequiredText,true);
         LangManager.initTextField(this.elementdisplay.atklabel,true);
         this.elementdisplay.atklabel.text = LangManager.getString(224);
         setChildIndex(this.dragitem,numChildren - 1);
      }
      
      internal function updateSkillPoints() : *
      {
         this.skillpointsLabel.text = LangManager.getString(82) + String(StatsManager.getStat(StatsManager.STAT_SKILLPOINTS));
      }
      
      internal function displaySkill(skillid:int, showUnequip:Boolean = false) : *
      {
         var skillXML:XMLSkill = QuestEngine.getSkillData(skillid);
         if(skillXML == null)
         {
            return;
         }
         this.hideSkillDetails(false);
         var skillLevel:int = StatsManager.getStat(skillid);
         this.skilldesc.htmlText = skillXML.getSkillDescription(skillLevel);
         this.pointsrequiredText.htmlText = skillXML.getPointsRequiredText(skillLevel);
         this.pointsrequiredText.visible = true;
         this.displayslot.initSkill(skillid,skillLevel);
         this.dragitem.initSkill(skillid,skillLevel);
         if(skillXML.canLearn())
         {
            this.upgradebutton.visible = true;
            this.upgradebutton.setText(LangManager.getString(299));
         }
         else if(skillXML.canUpgrade())
         {
            this.upgradebutton.visible = true;
            this.upgradebutton.setText(LangManager.getString(80));
         }
         else
         {
            this.upgradebutton.visible = false;
            if(!skillXML.isNotEnoughSkillPoints())
            {
               this.pointsrequiredText.visible = false;
            }
         }
         if(!showUnequip && skillXML.canEquip())
         {
            this.equipbutton.visible = true;
            this.equipbutton.setText(LangManager.getString(298));
            this.unequipFlag = false;
         }
         else if(showUnequip)
         {
            this.equipbutton.visible = true;
            this.equipbutton.setText(LangManager.getString(300));
            this.unequipFlag = true;
         }
         else
         {
            this.equipbutton.visible = false;
         }
      }
      
      internal function onSkillClick(event:MouseEvent) : *
      {
         if(this.selectedEquippedSkill != null)
         {
            this.selectedEquippedSkill.setGotSelected(false);
         }
         this.selectedEquippedSkill = null;
         var skillid:int = int(event.target.getSkillId());
         if(this.selectedSkill != null)
         {
            this.selectedSkill.setGotSelected(false);
         }
         this.selectedSkill = event.target as SkillSlot;
         this.selectedSkill.setGotSelected(true);
         this.displaySkill(event.target.getSkillId(),this.isEquipped(skillid));
      }
      
      internal function onEquippedSlotClick(event:MouseEvent) : *
      {
         if(this.selectedSkill != null)
         {
            this.selectedSkill.setGotSelected(false);
         }
         this.selectedSkill = null;
         var skillid:int = int(event.target.getSkillId());
         if(skillid == 0)
         {
            return;
         }
         if(this.selectedEquippedSkill != null)
         {
            this.selectedEquippedSkill.setGotSelected(false);
         }
         this.selectedEquippedSkill = event.target as SkillSlot;
         this.selectedEquippedSkill.setGotSelected(true);
         this.displaySkill(this.selectedEquippedSkill.getSkillId(),this.isEquipped(skillid));
      }
      
      internal function onCategorySlotClick(event:MouseEvent) : *
      {
         for(var i:int = 0; i < this.categoryCount; i++)
         {
            if(this.categorySlots[i] == event.target)
            {
               this.showCategory(i + 1);
               return;
            }
         }
      }
      
      internal function onCategorySlotMouseOver(event:MouseEvent) : *
      {
         var cat:int = 0;
         this.displayslot.visible = true;
         this.skilldesc.visible = true;
         for(var i:int = 0; i < this.categoryCount; i++)
         {
            if(this.categorySlots[i] == event.target)
            {
               cat = i + 1;
               break;
            }
         }
         this.displayslot.initSkill(this.categoryIcons[cat - 1],1);
         this.skilldesc.htmlText = LangManager.getString(this.categoryDesc[cat - 1]);
      }
      
      internal function onCategorySlotMouseOut(event:MouseEvent) : *
      {
         this.hideSkillDetails(true);
      }
      
      internal function onUpgradeClick(event:MouseEvent) : *
      {
         StatsManager.changeStat(StatsManager.STAT_SKILLPOINTS,-QuestEngine.getSkillData(this.displayslot.getSkillId()).getSkillPointsRequired(StatsManager.getStat(this.displayslot.getSkillId())));
         StatsManager.changeStat(this.displayslot.getSkillId(),1);
         this.updateSkillPoints();
         this.displaySkill(this.displayslot.getSkillId());
         this.updateSkillIcons(this.displayslot.getSkillId());
         this.updateEquippedSlots();
      }
      
      internal function updateSkillIcons(skillid:int) : *
      {
         var skilllvl:int = 0;
         for(var i:int = 0; i < this.skillSlotCount; i++)
         {
            if(this.skillSlots[i].getSkillId() == skillid)
            {
               this.skillSlots[i].initSkill(skillid,StatsManager.getStat(skillid));
               break;
            }
         }
         for(i = 0; i < this.equippedSlotCount; i++)
         {
            if(this.equippedSlots[i].getSkillId() == skillid)
            {
               skilllvl = StatsManager.getStat(skillid);
               this.equippedSlots[i].initSkill(skillid,skilllvl);
               StatsManager.skillSlots[i].setValue(skilllvl);
               QueryManager.instance.reportDataModified(StatsManager.SKILLSLOT);
               break;
            }
         }
      }
      
      internal function onEquipClick(event:MouseEvent) : *
      {
         var idToCheck:int = 0;
         var i:int = 0;
         var slot:int = StatsManager.getSkillSlotCount() - 1;
         if(this.unequipFlag)
         {
            if(this.selectedEquippedSkill != null)
            {
               idToCheck = this.selectedEquippedSkill.getSkillId();
            }
            else
            {
               idToCheck = this.selectedSkill.getSkillId();
            }
            for(i = 0; i <= slot; i++)
            {
               if(this.equippedSlots[i].getSkillId() == idToCheck)
               {
                  slot = i;
                  break;
               }
            }
            this.doUnequip(slot);
         }
         else
         {
            for(i = 0; i <= slot; i++)
            {
               if(this.equippedSlots[i].getSkillId() == 0)
               {
                  slot = i;
                  break;
               }
            }
            this.doEquip(this.selectedSkill.getSkillId(),this.selectedSkill.getSkillLevel(),slot);
         }
      }
      
      internal function doEquip(skillid:*, skilllevel:*, slot:int) : *
      {
         if(TutorialUI.instance.getState() == 9)
         {
            TutorialUI.instance.setState(0);
         }
         var prevslot:int = -1;
         for(var i:int = 0; i < this.equippedSlotCount; i++)
         {
            if(this.equippedSlots[i].getSkillId() == skillid)
            {
               prevslot = i;
               break;
            }
         }
         if(prevslot != -1)
         {
            this.doUnequip(prevslot);
         }
         if(this.selectedEquippedSkill != null)
         {
            this.selectedEquippedSkill.setGotSelected(false);
         }
         this.selectedEquippedSkill = this.equippedSlots[slot];
         this.selectedEquippedSkill.setGotSelected(true);
         if(this.selectedSkill != null)
         {
            this.selectedSkill.setGotSelected(false);
         }
         this.selectedSkill = null;
         StatsManager.skillSlots[slot] = new IntStat(skillid,skilllevel);
         this.updateEquippedSlots();
         this.displaySkill(skillid,true);
         QueryManager.instance.reportDataModified(StatsManager.SKILLSLOT);
      }
      
      internal function doUnequip(slot:int) : *
      {
         StatsManager.skillSlots[slot] = new IntStat(0,0);
         this.updateEquippedSlots();
         QueryManager.instance.reportDataModified(StatsManager.SKILLSLOT);
         if(this.selectedEquippedSkill != null)
         {
            this.selectedEquippedSkill.setGotSelected(false);
         }
         this.selectedEquippedSkill = null;
         if(this.selectedSkill != null)
         {
            this.selectedSkill.setGotSelected(false);
         }
         this.selectedSkill = null;
         this.equipbutton.visible = false;
         this.hideSkillDetails(true);
      }
      
      internal function isEquipped(skillid:int) : *
      {
         for(var i:int = 0; i < this.equippedSlotCount; i++)
         {
            if(this.equippedSlots[i].getSkillId() == skillid)
            {
               return true;
            }
         }
         return false;
      }
      
      internal function addEventListeners() : *
      {
         this.closewindowbutton.addEventListener(MouseEvent.CLICK,this.onLeave);
         this.upgradebutton.addEventListeners();
         this.upgradebutton.addEventListener(MouseEvent.CLICK,this.onUpgradeClick);
         this.equipbutton.addEventListeners();
         this.equipbutton.addEventListener(MouseEvent.CLICK,this.onEquipClick);
         this.categoriesbutton.addEventListeners();
         this.categoriesbutton.addEventListener(MouseEvent.CLICK,this.onCategoriesClick);
         for(var i:int = 0; i < this.skillSlotCount; i++)
         {
            this.skillSlots[i].addEventListener(MouseEvent.CLICK,this.onSkillClick);
            this.skillSlots[i].addEventListener(MouseEvent.DOUBLE_CLICK,this.onMouseDOUBLECLICK);
            this.skillSlots[i].addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDOWN);
            this.skillSlots[i].addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseDRAG);
            this.skillSlots[i].addMouseOverListeners();
         }
         for(i = 0; i < this.equippedSlotCount; i++)
         {
            this.equippedSlots[i].addEventListener(MouseEvent.CLICK,this.onEquippedSlotClick);
            this.equippedSlots[i].addEventListener(MouseEvent.DOUBLE_CLICK,this.onMouseDOUBLECLICK);
            this.equippedSlots[i].addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDOWN);
            this.equippedSlots[i].addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseDRAG);
            this.equippedSlots[i].addMouseOverListeners();
         }
         for(i = 0; i < this.categoryCount; i++)
         {
            this.categorySlots[i].addEventListener(MouseEvent.CLICK,this.onCategorySlotClick);
            this.categorySlots[i].addEventListener(MouseEvent.ROLL_OVER,this.onCategorySlotMouseOver);
            this.categorySlots[i].addEventListener(MouseEvent.ROLL_OUT,this.onCategorySlotMouseOut);
            this.categorySlots[i].addMouseOverListeners();
         }
         addEventListener(MouseEvent.MOUSE_UP,this.onMouseUP);
         this.dragitem.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUP);
         this.bg.addEventListener(MouseEvent.CLICK,this.bgClick);
         this.bg.cacheAsBitmap = true;
      }
      
      internal function removeEventListeners() : *
      {
         this.closewindowbutton.removeEventListener(MouseEvent.CLICK,this.onLeave);
         this.upgradebutton.removeEventListeners();
         this.upgradebutton.removeEventListener(MouseEvent.CLICK,this.onUpgradeClick);
         this.equipbutton.removeEventListeners();
         this.equipbutton.removeEventListener(MouseEvent.CLICK,this.onEquipClick);
         this.categoriesbutton.removeEventListeners();
         this.categoriesbutton.removeEventListener(MouseEvent.CLICK,this.onCategoriesClick);
         for(var i:int = 0; i < this.skillSlotCount; i++)
         {
            this.skillSlots[i].removeEventListener(MouseEvent.CLICK,this.onSkillClick);
            this.skillSlots[i].removeEventListener(MouseEvent.DOUBLE_CLICK,this.onMouseDOUBLECLICK);
            this.skillSlots[i].removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDOWN);
            this.skillSlots[i].removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseDRAG);
            this.skillSlots[i].removeMouseOverListeners();
         }
         for(i = 0; i < this.equippedSlotCount; i++)
         {
            this.equippedSlots[i].removeEventListener(MouseEvent.CLICK,this.onEquippedSlotClick);
            this.equippedSlots[i].removeEventListener(MouseEvent.DOUBLE_CLICK,this.onMouseDOUBLECLICK);
            this.equippedSlots[i].removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDOWN);
            this.equippedSlots[i].removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseDRAG);
            this.equippedSlots[i].removeMouseOverListeners();
         }
         for(i = 0; i < this.categoryCount; i++)
         {
            this.categorySlots[i].removeEventListener(MouseEvent.CLICK,this.onCategorySlotClick);
            this.categorySlots[i].removeEventListener(MouseEvent.ROLL_OVER,this.onCategorySlotMouseOver);
            this.categorySlots[i].removeEventListener(MouseEvent.ROLL_OUT,this.onCategorySlotMouseOut);
            this.categorySlots[i].removeMouseOverListeners();
         }
         removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUP);
         this.dragitem.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUP);
         this.bg.removeEventListener(MouseEvent.CLICK,this.bgClick);
         this.bg.cacheAsBitmap = false;
      }
      
      public function unAssignSkillPoints() : *
      {
         var id:int = 0;
         for(var i:int = 0; i < this.skillSlotCount; i++)
         {
            id = this.skillSlots[i].getSkillId();
            if(id != 0)
            {
               this.skillSlots[i].initSkill(id,StatsManager.getStat(id));
            }
         }
         for(i = 0; i < this.equippedSlotCount; i++)
         {
            id = this.equippedSlots[i].getSkillId();
            if(id != 0)
            {
               this.equippedSlots[i].initSkill(id,StatsManager.getStat(id));
            }
         }
      }
      
      public function show() : *
      {
         this.visible = true;
         this.addEventListeners();
         this.updateSkillPoints();
         Tracker.instance.trackShowSkillUI();
         if(GameEngine.isAdventureMode())
         {
            NetworkManager.instance.playerUpdateBusy(true);
         }
         this.updateEquippedSlots();
         this.showCategory(0);
      }
      
      internal function showCategory(num:int) : *
      {
         var i:int = 0;
         var skillSlot:SkillSlot = null;
         var xmlSkill:XMLSkill = null;
         var skills:Vector.<XMLSkill> = null;
         var skillsmax:int = 0;
         this.currentCategory = num;
         if(num == 0)
         {
            this.showCategory0(true);
            this.hideSkillDetails(true);
            for(i = 0; i < this.skillSlotCount; i++)
            {
               this.skillSlots[i].visible = false;
            }
            if(TutorialUI.instance.getState() == 9 || TutorialUI.instance.getState() == 10)
            {
               TutorialUI.instance.setState(8);
            }
         }
         else
         {
            this.showCategory0(false);
            skills = QuestEngine.getSkillDataByCategory(num);
            skillsmax = int(skills.length);
            for(i = 0; i < this.skillSlotCount; i++)
            {
               skillSlot = this.skillSlots[i];
               if(i < skillsmax)
               {
                  xmlSkill = skills[i];
                  skillSlot.initSkill(xmlSkill.id,StatsManager.getStat(xmlSkill.id));
                  skillSlot.visible = true;
               }
               else
               {
                  skillSlot.visible = false;
               }
            }
            this.hideSkillDetails(false);
            if(TutorialUI.instance.getState() == 8)
            {
               if(num == 4)
               {
                  TutorialUI.instance.setState(9);
               }
               else
               {
                  TutorialUI.instance.setState(10);
               }
            }
         }
      }
      
      internal function showCategory0(flag:Boolean) : *
      {
         var i:int = 0;
         var categoryVisible:Array = null;
         var startX:Number = NaN;
         var startY:Number = NaN;
         var xSpacing:int = 0;
         var ySpacing:int = 0;
         this.categorylabel.visible = flag;
         for(i = 0; i < this.categoryCount; i++)
         {
            this.categorySlots[i].visible = false;
         }
         this.displayslot.visible = !flag;
         this.skilldesc.visible = !flag;
         this.pointsrequiredText.visible = !flag;
         this.upgradebutton.visible = !flag;
         this.equipbutton.visible = false;
         this.categoriesbutton.visible = !flag;
         if(flag)
         {
            categoryVisible = [0,1,2,3,4,5,6,7,8,9];
            if(!StatsManager.canEquipAllSkills)
            {
               if(StatsManager.getPlayerStats(StatsManager.STAT_EARTHATK) == 0)
               {
                  categoryVisible.splice(9,1);
               }
               if(StatsManager.getPlayerStats(StatsManager.STAT_WINDATK) == 0)
               {
                  categoryVisible.splice(8,1);
               }
               if(StatsManager.getPlayerStats(StatsManager.STAT_WATERATK) == 0)
               {
                  categoryVisible.splice(7,1);
               }
               if(StatsManager.getPlayerStats(StatsManager.STAT_FIREATK) == 0)
               {
                  categoryVisible.splice(6,1);
               }
            }
            startX = 396.65;
            startY = 187.3;
            xSpacing = 70;
            ySpacing = 70;
            for(i = 0; i < categoryVisible.length; i++)
            {
               this.categorySlots[categoryVisible[i]].visible = true;
               this.categorySlots[categoryVisible[i]].x = startX + xSpacing * (i % 5);
               this.categorySlots[categoryVisible[i]].y = startY + ySpacing * Math.floor(i / 5);
            }
         }
      }
      
      internal function hideSkillDetails(flag:Boolean) : *
      {
         var bonusatk:int = 0;
         var bonusdef:int = 0;
         this.displayslot.visible = !flag;
         this.skilldesc.visible = !flag;
         this.pointsrequiredText.visible = false;
         this.upgradebutton.visible = false;
         this.equipbutton.visible = false;
         this.elementdisplay.visible = false;
         if(this.currentCategory != 0 && flag)
         {
            this.displayslot.visible = true;
            this.skilldesc.visible = true;
            this.displayslot.initSkill(this.categoryIcons[this.currentCategory - 1],1);
            this.skilldesc.htmlText = LangManager.getString(this.categoryDesc[this.currentCategory - 1]);
            if(this.currentCategory == 7)
            {
               this.elementdisplay.visible = true;
               this.elementdisplay.gotoAndStop(1);
               bonusatk = StatsManager.findBonusStat(StatsManager.STAT_FIREATK);
               this.elementdisplay.atk.htmlText = StatsManager.getPlayerStats(StatsManager.STAT_FIREATK);
            }
            else if(this.currentCategory == 8)
            {
               this.elementdisplay.visible = true;
               this.elementdisplay.gotoAndStop(2);
               bonusatk = StatsManager.findBonusStat(StatsManager.STAT_WATERATK);
               this.elementdisplay.atk.htmlText = StatsManager.getPlayerStats(StatsManager.STAT_WATERATK);
            }
            else if(this.currentCategory == 9)
            {
               this.elementdisplay.visible = true;
               this.elementdisplay.gotoAndStop(3);
               bonusatk = StatsManager.findBonusStat(StatsManager.STAT_WINDATK);
               this.elementdisplay.atk.htmlText = StatsManager.getPlayerStats(StatsManager.STAT_WINDATK);
            }
            else if(this.currentCategory == 10)
            {
               this.elementdisplay.visible = true;
               this.elementdisplay.gotoAndStop(4);
               bonusatk = StatsManager.findBonusStat(StatsManager.STAT_EARTHATK);
               this.elementdisplay.atk.htmlText = StatsManager.getPlayerStats(StatsManager.STAT_EARTHATK);
            }
            if(bonusatk > 0)
            {
               this.elementdisplay.atk.htmlText += "<font color=\'#FFCC00\'> + " + bonusatk.toString() + "</font>";
            }
         }
      }
      
      internal function updateEquippedSlots() : *
      {
         var skillSlot:SkillSlot = null;
         var equippedCount:int = int(StatsManager.skillSlots.length);
         var maxslots:int = StatsManager.getSkillSlotCount();
         for(var i:int = 0; i < this.equippedSlotCount; i++)
         {
            skillSlot = this.equippedSlots[i];
            if(i < equippedCount)
            {
               if(StatsManager.skillSlots[i] != null && StatsManager.skillSlots[i].getId() != 0)
               {
                  skillSlot.initSkill(StatsManager.skillSlots[i].getId(),StatsManager.skillSlots[i].getValue());
               }
               else
               {
                  skillSlot.initEmpty();
               }
            }
            else
            {
               skillSlot.initEmpty();
            }
            skillSlot.visible = i < maxslots;
         }
      }
      
      internal function bgClick(mouseEvent:MouseEvent) : *
      {
         this.hideSkillDetails(true);
         if(this.selectedSkill != null)
         {
            this.selectedSkill.setGotSelected(false);
         }
         this.selectedSkill = null;
         if(this.selectedEquippedSkill != null)
         {
            this.selectedEquippedSkill.setGotSelected(false);
         }
         this.selectedEquippedSkill = null;
      }
      
      internal function onMouseDOWN(mouseEvent:MouseEvent) : *
      {
         if(mouseEvent.target.getSkillId() == 0)
         {
            return;
         }
         this.mousedown = true;
         this.dragitem.x = mouseX;
         this.dragitem.y = mouseY;
         if((mouseEvent.stageY - StatsManager.stageOffsetY) / StatsManager.stageScale < 360)
         {
            this.onSkillClick(mouseEvent);
            this.dragequipflag = false;
            if(this.selectedSkill != null && !this.selectedSkill.canEquip())
            {
               this.mousedown = false;
            }
         }
         else
         {
            this.onEquippedSlotClick(mouseEvent);
            this.dragequipflag = true;
            if(this.selectedEquippedSkill != null && !this.selectedEquippedSkill.canEquip())
            {
               this.mousedown = false;
            }
         }
      }
      
      internal function onMouseDRAG(mouseEvent:MouseEvent) : *
      {
         if(this.mousedown && !this.dragitem.visible)
         {
            if(!StatsManager.isMobile)
            {
               this.dragitem.alpha = 0.8;
            }
            this.dragitem.visible = true;
            this.dragitem.cacheAsBitmap = true;
            this.dragitem.startDrag();
         }
      }
      
      internal function onMouseUP(mouseEvent:MouseEvent) : *
      {
         var slotnum:int = 0;
         var i:int = 0;
         if(this.mousedown && this.dragitem.visible && this.dragitem.x > 265)
         {
            if(this.dragitem.y > 360)
            {
               slotnum = -1;
               for(i = 0; i < this.equippedSlotCount; i++)
               {
                  if(this.equippedSlots[i].visible && this.equippedSlots[i].hitTestPoint(mouseEvent.stageX,mouseEvent.stageY))
                  {
                     slotnum = i;
                     break;
                  }
               }
               if(!this.dragequipflag)
               {
                  if(slotnum != -1)
                  {
                     this.doEquip(this.selectedSkill.getSkillId(),this.selectedSkill.getSkillLevel(),slotnum);
                  }
                  else if(!this.isEquipped(this.dragitem.getSkillId()))
                  {
                     this.onEquipClick(null);
                  }
               }
               else if(slotnum == -1)
               {
                  this.onEquipClick(null);
               }
               else
               {
                  this.doEquip(this.selectedEquippedSkill.getSkillId(),this.selectedEquippedSkill.getSkillLevel(),slotnum);
               }
            }
            else if(this.dragequipflag)
            {
               this.onEquipClick(null);
            }
         }
         this.mousedown = false;
         this.dragitem.visible = false;
         this.dragitem.cacheAsBitmap = false;
         this.dragitem.stopDrag();
      }
      
      internal function onMouseDOUBLECLICK(mouseEvent:MouseEvent) : *
      {
         if(mouseEvent.target.getSkillId() == 0)
         {
            return;
         }
         if(mouseEvent.stageY < 360)
         {
            this.onSkillClick(mouseEvent);
            if(this.selectedSkill.canEquip())
            {
               this.onEquipClick(null);
            }
         }
         else
         {
            this.onEquippedSlotClick(mouseEvent);
            if(this.selectedEquippedSkill.canEquip())
            {
               this.onEquipClick(null);
            }
         }
      }
      
      internal function onCategoriesClick(event:MouseEvent) : *
      {
         if(this.selectedSkill != null)
         {
            this.selectedSkill.setGotSelected(false);
         }
         this.selectedSkill = null;
         if(this.selectedEquippedSkill != null)
         {
            this.selectedEquippedSkill.setGotSelected(false);
         }
         this.selectedEquippedSkill = null;
         if(this.currentCategory > 0)
         {
            this.showCategory(0);
         }
      }
      
      public function onLeave(event:MouseEvent) : void
      {
         if(this.selectedSkill != null)
         {
            this.selectedSkill.setGotSelected(false);
         }
         this.selectedSkill = null;
         if(this.selectedEquippedSkill != null)
         {
            this.selectedEquippedSkill.setGotSelected(false);
         }
         this.selectedEquippedSkill = null;
         if(GameEngine.isOverworld())
         {
            Overworld.refreshMap();
            Overworld.showOverworldMap(true);
         }
         else
         {
            InputManager.setAdventureMode();
            NetworkManager.instance.playerUpdateBusy(false);
            OverworldHUD.instance.updateHUD();
         }
         QueryManager.instance.saveModifiedCharData();
         this.removeEventListeners();
         this.visible = false;
         OverworldHUD.instance.unHideAll();
         TutorialUI.instance.setState(0);
      }
   }
}

