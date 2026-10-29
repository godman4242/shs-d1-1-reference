package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1562")]
   public class AchievementUI extends MovieClip
   {
      
      public static var instance:AchievementUI;
      
      public var pagelabel:TextField;
      
      public var scrollUpButton:ScrollButton;
      
      public var bg:MovieClip;
      
      public var scrollDownButton:ScrollButton;
      
      public var titletext:TextField;
      
      public var closewindowbutton:SimpleButton;
      
      internal var slotList:Array;
      
      internal var totalSlots:int = 8;
      
      internal var maxPage:int;
      
      internal var page:int;
      
      public function AchievementUI()
      {
         var achievementSlot:AchievementSlot = null;
         this.maxPage = Math.ceil(QuestEngine.achievementList.length / this.totalSlots);
         super();
         instance = this;
         this.slotList = new Array();
         for(var i:int = 0; i < this.totalSlots; i++)
         {
            achievementSlot = new AchievementSlot();
            addChild(achievementSlot);
            this.slotList.push(achievementSlot);
            achievementSlot.x = 105 + i % 2 * 310;
            achievementSlot.y = 74 + Math.floor(i / 2) * 88;
         }
         LangManager.initTextField(this.titletext);
         LangManager.initTextField(this.pagelabel);
         this.titletext.text = LangManager.getString(140);
      }
      
      public function show() : *
      {
         this.visible = true;
         this.page = 0;
         this.refreshAchievementSlots();
         this.addEventListeners();
         StageManager.getGameStage().visible = false;
      }
      
      internal function refreshAchievementSlots() : *
      {
         for(var i:int = 0; i < this.totalSlots; i++)
         {
            this.slotList[i].init(this.page * this.totalSlots + i);
         }
         this.scrollUpButton.visible = this.page != 0;
         this.scrollDownButton.visible = this.page != this.maxPage - 1;
         this.pagelabel.text = LangManager.getString(719) + (this.page + 1) + "/" + this.maxPage;
      }
      
      public function onLeave(event:MouseEvent) : void
      {
         this.removeEventListeners();
         this.visible = false;
         StageManager.getGameStage().visible = true;
      }
      
      internal function addEventListeners() : *
      {
         this.closewindowbutton.addEventListener(MouseEvent.CLICK,this.onLeave);
         this.scrollUpButton.addEventListener(MouseEvent.CLICK,this.scrollUp);
         this.scrollDownButton.addEventListener(MouseEvent.CLICK,this.scrollDown);
         this.bg.cacheAsBitmap = true;
      }
      
      internal function removeEventListeners() : *
      {
         this.closewindowbutton.removeEventListener(MouseEvent.CLICK,this.onLeave);
         this.scrollUpButton.removeEventListener(MouseEvent.CLICK,this.scrollUp);
         this.scrollDownButton.removeEventListener(MouseEvent.CLICK,this.scrollDown);
         this.bg.cacheAsBitmap = false;
      }
      
      internal function scrollUp(event:MouseEvent) : *
      {
         --this.page;
         this.refreshAchievementSlots();
      }
      
      internal function scrollDown(event:MouseEvent) : *
      {
         ++this.page;
         this.refreshAchievementSlots();
      }
   }
}

