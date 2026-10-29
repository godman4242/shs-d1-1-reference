package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1558")]
   public class AchievementUnlockedUI extends MovieClip
   {
      
      public var inside:MovieClip;
      
      internal var image:MovieClip;
      
      public function AchievementUnlockedUI()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,95,this.frame96);
         LangManager.initTextField(this.inside.titlelabel);
         this.inside.titlelabel.text = LangManager.getString(721);
      }
      
      public function show(index:*) : *
      {
         var xmlAchievement:XMLAchievement = QuestEngine.getAchievement(index);
         this.inside.achievementtext.text = xmlAchievement.desc;
         if(this.image != null)
         {
            this.inside.removeChild(this.image);
         }
         this.image = ResourceManager.getAchievementImage(xmlAchievement.image);
         this.image.x = 50;
         this.image.y = 45;
         this.inside.addChild(this.image);
         gotoAndPlay(2);
         visible = true;
         SoundManager.instance.playSumo();
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         this.inside.cacheAsBitmap = true;
      }
      
      internal function frame96() : *
      {
         stop();
         visible = false;
         this.inside.cacheAsBitmap = false;
      }
   }
}

