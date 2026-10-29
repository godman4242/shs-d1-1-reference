package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1369")]
   public class InteractUI_chikako extends MovieClip
   {
      
      public var lovebarTextShadow:TextField;
      
      public var leftButton:ScrollButton;
      
      public var lovelvlText:TextField;
      
      public var lovebarText:TextField;
      
      public var rightButton:ScrollButton;
      
      public var portrait:MovieClip;
      
      public var lovebar:MovieClip;
      
      internal var expArray:Array = [0,10,30,60,100,150];
      
      internal var maxLevel:int = 5;
      
      internal var currentPortrait:int = 0;
      
      public function InteractUI_chikako()
      {
         super();
         LangManager.initTextField(this.lovelvlText,false);
         LangManager.initTextField(this.lovebarText,false);
         LangManager.initTextField(this.lovebarTextShadow,false);
      }
      
      internal function getXP() : int
      {
         return StatsManager.getPlayerStats(StatsManager.STAT_CHIKAKOLOVE) + QuestEngine.getAchievementScore();
      }
      
      public function updateBar() : *
      {
         var XPtoLevel:int = 0;
         var XPtoPrevLevel:int = 0;
         var XPfromPrev:int = 0;
         var XPthisLevel:int = 0;
         var num:int = 0;
         var charlevel:int = this.getLevel();
         var currentXP:int = this.getXP();
         if(currentXP < this.expArray[this.maxLevel - 1])
         {
            XPtoLevel = this.getXPLevelThreshhold(charlevel);
            XPtoPrevLevel = this.getXPLevelThreshhold(charlevel - 1);
            XPfromPrev = currentXP - this.getXPLevelThreshhold(charlevel - 1);
            XPthisLevel = this.getXPLevelThreshhold(charlevel) - this.getXPLevelThreshhold(charlevel - 1);
            this.lovebarText.text = currentXP - XPtoPrevLevel + " / " + (XPtoLevel - XPtoPrevLevel);
            this.lovebar.bar.scaleX = XPfromPrev / XPthisLevel;
         }
         else
         {
            num = this.expArray[this.maxLevel - 1] - this.expArray[this.maxLevel - 2];
            this.lovebarText.text = num + " / " + num;
            this.lovebar.bar.scaleX = 1;
         }
         this.lovebarTextShadow.text = this.lovebarText.text;
         this.setPortrait(charlevel);
         this.currentPortrait = charlevel;
      }
      
      public function getLevel() : int
      {
         var currentXP:int = this.getXP();
         for(var q:int = 0; q < this.maxLevel; q++)
         {
            if(this.expArray[q] > currentXP)
            {
               return q;
            }
         }
         return this.maxLevel;
      }
      
      public function getXPtoLevel() : int
      {
         return this.expArray[this.getLevel()] - this.getXP();
      }
      
      public function getXPLevelThreshhold(level:int) : int
      {
         return this.expArray[level];
      }
      
      public function getPortraitFrame() : int
      {
         return this.currentPortrait;
      }
      
      public function setPortrait(num:int) : *
      {
         this.portrait.gotoAndStop(num);
         this.currentPortrait = num;
         this.lovelvlText.text = num.toString();
         this.leftButton.visible = num != 1;
         this.rightButton.visible = num != this.maxLevel && num != this.getLevel();
      }
   }
}

