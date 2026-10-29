package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol736")]
   public class SkillSlot extends MovieClip
   {
      
      public var levelText:TextField;
      
      public var bg:MovieClip;
      
      public var shade:MovieClip;
      
      public var canvas:Canvas;
      
      public var unknown:TextField;
      
      internal var _skillId:int = 0;
      
      internal var _skillLevel:int = 0;
      
      internal var image:MovieClip = null;
      
      internal var gotSelected:Boolean = false;
      
      public function SkillSlot()
      {
         super();
         this.canvas.mouseEnabled = false;
         this.levelText.mouseEnabled = false;
         this.unknown.visible = false;
         mouseChildren = false;
         this.shade.visible = false;
      }
      
      public function getSkillId() : int
      {
         return this._skillId;
      }
      
      public function getSkillLevel() : int
      {
         return this._skillLevel;
      }
      
      public function addMouseOverListeners() : void
      {
         this.addEventListener(MouseEvent.ROLL_OVER,this.onMouseOver);
         this.addEventListener(MouseEvent.ROLL_OUT,this.onMouseOut);
      }
      
      public function removeMouseOverListeners() : void
      {
         this.removeEventListener(MouseEvent.ROLL_OVER,this.onMouseOver);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.onMouseOut);
         this.onMouseOut(null);
      }
      
      public function onMouseOver(mouseEvent:MouseEvent) : void
      {
         if(this.gotSelected)
         {
            this.bg.gotoAndStop("selectedover");
         }
         else
         {
            this.bg.gotoAndStop("unselectedover");
         }
      }
      
      public function onMouseOut(mouseEvent:MouseEvent) : void
      {
         if(this.gotSelected)
         {
            this.bg.gotoAndStop("selected");
         }
         else
         {
            this.bg.gotoAndStop("unselected");
         }
      }
      
      public function initSkill(id:int, level:int) : *
      {
         this._skillId = id;
         this._skillLevel = level;
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
            this.unknown.visible = false;
         }
         else
         {
            this.unknown.visible = true;
         }
         this.shade.visible = level == 0;
      }
      
      public function initEmpty() : *
      {
         this._skillId = 0;
         this._skillLevel = 0;
         this.levelText.text = "";
         if(this.image != null)
         {
            this.canvas.removeChild(this.image);
            this.image = null;
         }
         this.unknown.visible = false;
         this.shade.visible = false;
      }
      
      public function initUnknown() : *
      {
         if(this.image != null)
         {
            this.canvas.removeChild(this.image);
            this.image = null;
         }
         this.unknown.visible = true;
         this.shade.visible = true;
      }
      
      public function setGotSelected(flag:Boolean) : *
      {
         if(flag == this.gotSelected)
         {
            return;
         }
         this.gotSelected = flag;
         if(flag)
         {
            this.bg.gotoAndStop("selected");
         }
         else
         {
            this.bg.gotoAndStop("unselected");
         }
      }
      
      public function canEquip() : Boolean
      {
         if(this._skillId == 0)
         {
            return false;
         }
         return QuestEngine.getSkillData(this._skillId).canEquip();
      }
   }
}

