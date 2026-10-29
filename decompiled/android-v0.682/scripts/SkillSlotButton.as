package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2915")]
   public class SkillSlotButton extends MovieClip
   {
      
      public var levelText:TextField;
      
      public var keypressText:TextField;
      
      public var shade:MovieClip;
      
      public var canvas:Canvas;
      
      internal var _skillId:int = 0;
      
      internal var _skillLevel:int = 0;
      
      internal var image:MovieClip = null;
      
      internal var cooldown:int = 0;
      
      internal var cooldownmax:int = 0;
      
      internal var chiCost:int = 0;
      
      internal var disabled:Boolean;
      
      public function SkillSlotButton()
      {
         super();
         this.canvas.mouseEnabled = false;
         this.levelText.mouseEnabled = false;
         this.shade.gotoAndStop(1);
      }
      
      public function initSkill(intStat:IntStat) : *
      {
         this._skillId = intStat.getId();
         this._skillLevel = intStat.getValue();
         this.shade.visible = true;
         if(this._skillId == 0)
         {
            this.initEmpty();
            return;
         }
         switch(this._skillLevel)
         {
            case 0:
            case 1:
               this.levelText.text = "";
               break;
            case 2:
               this.levelText.text = "II";
               break;
            case 3:
               this.levelText.text = "III";
               break;
            case 4:
               this.levelText.text = "IV";
               break;
            case 5:
               this.levelText.text = "V";
               break;
            case 6:
               this.levelText.text = "VI";
               break;
            case 7:
               this.levelText.text = "VII";
               break;
            case 8:
               this.levelText.text = "VIII";
               break;
            case 9:
               this.levelText.text = "IX";
               break;
            case 10:
               this.levelText.text = "X";
         }
         if(this.image != null)
         {
            this.canvas.removeChild(this.image);
         }
         this.image = ResourceManager.getSkillImage(this._skillId);
         if(this.image != null)
         {
            this.canvas.addChild(this.image);
            this.image.mouseEnabled = false;
         }
         var skillData:XMLSkill = QuestEngine.getSkillData(this._skillId);
         if(skillData == null)
         {
            trace("initskill error: " + this._skillId);
            return;
         }
         this.cooldownmax = skillData.getCooldown(this._skillLevel);
         this.chiCost = skillData.getChiCost(this._skillLevel);
         this.cooldown = this.cooldownmax;
         this.disabled = false;
         if(this.cooldown > 0)
         {
            this.shade.gotoAndStop(12);
            mouseEnabled = false;
         }
         if(this.usesKunaiAmmo(this._skillId))
         {
            this.levelText.text = String(StatsManager.getStat(2501));
         }
         else if(this._skillId == SkillManager.SKILL_WINDMILL)
         {
            this.levelText.text = String(Math.floor(StatsManager.getStat(2501) / 4));
         }
      }
      
      internal function usesKunaiAmmo(_skillId:int) : Boolean
      {
         return _skillId == SkillManager.SKILL_KUNAITHROW || _skillId == SkillManager.SKILL_KUNAIFIRE || _skillId == SkillManager.SKILL_KUNAIWATER || _skillId == SkillManager.SKILL_KUNAIWIND || _skillId == SkillManager.SKILL_KUNAIEARTH || _skillId == SkillManager.SKILL_TRAP || _skillId == SkillManager.SKILL_TRAPFIRE || _skillId == SkillManager.SKILL_TRAPWATER || _skillId == SkillManager.SKILL_TRAPWIND || _skillId == SkillManager.SKILL_TRAPEARTH;
      }
      
      public function initEmpty() : *
      {
         this._skillId = 0;
         this._skillLevel = 0;
         this.levelText.text = "";
         this.keypressText.text = "";
         this.shade.visible = false;
         if(this.image != null)
         {
            this.canvas.removeChild(this.image);
            this.image = null;
         }
      }
      
      public function initKeyPressText(num:int) : *
      {
         this.keypressText.text = num.toString();
         this.keypressText.cacheAsBitmap = true;
      }
      
      public function disableButton() : *
      {
         this.disabled = true;
         this.shade.gotoAndStop(13);
      }
      
      public function checkSkillDisabled(chi:int) : *
      {
         var ammo:int = 0;
         var stance:int = StatsManager.getPlayer().stance;
         if(chi < this.chiCost || this._skillId == SkillManager.SKILL_SHUNPO && stance != MCSPlayer.LIGHT_STANCE || this._skillId == SkillManager.SKILL_THOUSANDSTABS && stance != MCSPlayer.BALANCED_STANCE || this._skillId == SkillManager.SKILL_DEADLYCLEAVE && stance != MCSPlayer.HEAVY_STANCE)
         {
            this.disabled = true;
            this.shade.gotoAndStop(13);
            return;
         }
         if(this.usesKunaiAmmo(this._skillId))
         {
            ammo = StatsManager.getStat(2501);
            this.levelText.text = ammo.toString();
            if(ammo <= 0)
            {
               this.disabled = true;
               this.shade.gotoAndStop(13);
               return;
            }
         }
         else if(this._skillId == SkillManager.SKILL_WINDMILL)
         {
            ammo = Math.floor(StatsManager.getStat(2501) / 4);
            this.levelText.text = ammo.toString();
            if(ammo <= 0)
            {
               this.disabled = true;
               this.shade.gotoAndStop(13);
               return;
            }
         }
         if((this._skillId == SkillManager.SKILL_SHADOWCLONE || this._skillId == SkillManager.SKILL_MASSCLONE) && GameEngine.isPvPRoomMode())
         {
            this.disabled = true;
            this.shade.gotoAndStop(13);
            return;
         }
         if(this.disabled)
         {
            this.disabled = false;
            if(this.cooldown == 0)
            {
               this.cooldown = 1;
            }
            this.update();
         }
      }
      
      public function update() : *
      {
         var newframe:int = 0;
         if(this.disabled)
         {
            return;
         }
         if(this.cooldown > 0)
         {
            if(this._skillId == SkillManager.SKILL_SHUNPO && StatsManager.getPlayer().stance != MCSPlayer.LIGHT_STANCE && this.cooldown < this.cooldownmax)
            {
               return;
            }
            if(this._skillId == SkillManager.SKILL_THOUSANDSTABS && StatsManager.getPlayer().stance != MCSPlayer.BALANCED_STANCE && this.cooldown < this.cooldownmax)
            {
               return;
            }
            if(this._skillId == SkillManager.SKILL_DEADLYCLEAVE && StatsManager.getPlayer().stance != MCSPlayer.HEAVY_STANCE && this.cooldown < this.cooldownmax)
            {
               return;
            }
            --this.cooldown;
            newframe = int(this.cooldown / this.cooldownmax * 12) + 1;
            if(this.shade.currentFrame != newframe)
            {
               this.shade.gotoAndStop(newframe);
            }
            if(this.cooldown == 0)
            {
               mouseEnabled = true;
            }
         }
      }
      
      public function onClick(xpos:int = -1, ypos:int = -1) : *
      {
         var skillsuccess:Boolean = false;
         if(this.cooldown > 0 || this._skillId == 0)
         {
            return;
         }
         var player:MCSPlayer = StatsManager.getPlayer();
         var skillData:XMLSkill = QuestEngine.getSkillData(this._skillId);
         if(skillData == null)
         {
            return;
         }
         if(xpos != -1 || ypos != -1)
         {
            skillsuccess = SkillManager.getInstance().startSkill(this._skillId,this._skillLevel,player,null,skillData,xpos,ypos);
         }
         else
         {
            skillsuccess = SkillManager.getInstance().startSkill(this._skillId,this._skillLevel,player,null,skillData);
         }
         if(skillsuccess)
         {
            this.cooldownmax = skillData.getCooldown(this._skillLevel);
            this.cooldown = this.cooldownmax;
            if(this.cooldown > 0)
            {
               mouseEnabled = false;
            }
         }
      }
      
      public function restartCooldown() : *
      {
         var skillData:XMLSkill = QuestEngine.getSkillData(this._skillId);
         if(skillData == null)
         {
            return;
         }
         this.cooldownmax = skillData.getCooldown(this._skillLevel);
         this.cooldown = this.cooldownmax;
         if(this.cooldown > 0)
         {
            mouseEnabled = false;
         }
      }
      
      public function getSkillId() : int
      {
         return this._skillId;
      }
      
      public function getSkillLevel() : int
      {
         return this._skillLevel;
      }
      
      public function canDrag() : Boolean
      {
         return this.cooldown == 0 && this._skillId != 0;
      }
      
      public function initDragButton() : *
      {
         this.shade.visible = false;
         this.keypressText.visible = false;
      }
   }
}

