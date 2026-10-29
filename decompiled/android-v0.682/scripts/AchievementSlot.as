package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1570")]
   public class AchievementSlot extends MovieClip
   {
      
      public var barnumbershadow:TextField;
      
      public var achname:TextField;
      
      public var barnumber:TextField;
      
      public var achdesc:TextField;
      
      public var bar:MovieClip;
      
      internal var image:MovieClip;
      
      public function AchievementSlot()
      {
         super();
         LangManager.initTextField(this.achname);
         LangManager.initTextField(this.achdesc);
         LangManager.initTextField(this.barnumber);
         LangManager.initTextField(this.barnumbershadow);
      }
      
      public function init(index:int) : *
      {
         var current:int = 0;
         var max:int = 0;
         var xmlAchievement:XMLAchievement = QuestEngine.getAchievement(index);
         if(xmlAchievement != null)
         {
            this.achname.text = xmlAchievement.displayname;
            this.achdesc.text = xmlAchievement.desc;
            current = 0;
            if(xmlAchievement.condition == null)
            {
               current = StatsManager.getStat(xmlAchievement.reqid);
            }
            else if(StatsManager.checkConditions(xmlAchievement.condition))
            {
               current = 1;
            }
            max = xmlAchievement.reqvalue;
            if(current >= max)
            {
               current = max;
               this.barnumber.text = LangManager.getString(720);
            }
            else
            {
               this.barnumber.text = current + "/" + max;
            }
            this.barnumbershadow.text = this.barnumber.text;
            this.bar.bar.scaleX = current / max;
            visible = true;
            if(this.image != null)
            {
               removeChild(this.image);
            }
            if(current >= max)
            {
               this.image = ResourceManager.getAchievementImage(xmlAchievement.image);
            }
            else
            {
               this.image = ResourceManager.getAchievementImage(0);
            }
            this.image.x = 35;
            this.image.y = 40;
            addChild(this.image);
         }
         else
         {
            visible = false;
         }
      }
   }
}

