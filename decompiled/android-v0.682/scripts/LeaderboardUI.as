package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2828")]
   public class LeaderboardUI extends MovieClip
   {
      
      public static var instance:LeaderboardUI;
      
      public var typeButton:GreyButtonSmall;
      
      public var winlosslabel:TextField;
      
      public var namelabel:TextField;
      
      public var nextButton:GreyButtonSmall;
      
      public var leaderboardtype:TextField;
      
      public var titletext:TextField;
      
      public var prevButton:GreyButtonSmall;
      
      public var loading:MovieClip;
      
      public var closewindowbutton:YellowButtonSmall;
      
      public var ranklabel:TextField;
      
      internal var page:int = 0;
      
      internal var slots:Vector.<LeaderboardField>;
      
      internal var totalSlots:int = 10;
      
      internal var isWeekly:Boolean = true;
      
      public function LeaderboardUI()
      {
         var i:int = 0;
         var slot:LeaderboardField = null;
         this.slots = new Vector.<LeaderboardField>();
         super();
         instance = this;
         for(i = 0; i < this.totalSlots; i++)
         {
            slot = new LeaderboardField();
            this.slots.push(slot);
            addChild(slot);
            slot.x = 300;
            slot.y = 162 + i * 28;
         }
         this.nextButton.setText(LangManager.getString(150));
         this.prevButton.setText(LangManager.getString(151));
         this.closewindowbutton.setText(LangManager.getString(9));
         this.typeButton.setText(LangManager.getString(415));
         LangManager.initTextField(this.leaderboardtype,true);
         this.leaderboardtype.text = LangManager.getString(418);
         LangManager.initTextField(this.titletext,true);
         this.titletext.text = LangManager.getString(28);
         LangManager.initTextField(this.ranklabel,true);
         this.ranklabel.text = LangManager.getString(153);
         LangManager.initTextField(this.namelabel,true);
         this.namelabel.text = LangManager.getString(154);
         LangManager.initTextField(this.winlosslabel,true);
         this.winlosslabel.text = LangManager.getString(152);
         LangManager.initTextField(this.loading.prompt);
         setChildIndex(this.loading,numChildren - 1);
      }
      
      public function show() : *
      {
         this.addEventListeners();
         this.page = 0;
         this.visible = true;
         this.refreshSlots();
      }
      
      internal function refreshSlots() : *
      {
         this.loading.prompt.text = LangManager.getString(58);
         this.loading.visible = true;
         this.hideAllSlots();
         QueryManager.instance.getLeaderboards(this.page,this.isWeekly);
         this.prevButton.visible = this.page != 0;
      }
      
      public function setLeaderboard(charlist:String) : *
      {
         var leaderboardArray:Array = null;
         var charArray:Array = charlist.split("^");
         var leaderboardCount:* = charArray.length;
         if(charArray[leaderboardCount - 1] == "")
         {
            leaderboardCount--;
         }
         for(var i:int = 0; i < leaderboardCount; i++)
         {
            leaderboardArray = charArray[i].split("#");
            this.slots[i].setInfo(leaderboardArray[0],leaderboardArray[1],leaderboardArray[2],leaderboardArray[3],leaderboardArray[4],leaderboardArray[5]);
            this.slots[i].setRank(this.page * this.totalSlots + i + 1);
            this.slots[i].visible = true;
         }
         this.loading.visible = false;
         this.nextButton.visible = this.slots[this.totalSlots - 1].visible;
      }
      
      internal function hideAllSlots() : void
      {
         for(var i:int = 0; i < this.totalSlots; i++)
         {
            this.slots[i].visible = false;
         }
      }
      
      public function CloseWindow(event:MouseEvent = null) : void
      {
         this.removeEventListeners();
         visible = false;
         TitleUI.instance.switchToReady();
      }
      
      public function ioError() : *
      {
         this.CloseWindow();
      }
      
      internal function addEventListeners() : *
      {
         this.closewindowbutton.addEventListener(MouseEvent.CLICK,this.CloseWindow);
         this.nextButton.addEventListener(MouseEvent.CLICK,this.nextClicked);
         this.prevButton.addEventListener(MouseEvent.CLICK,this.prevClicked);
         this.typeButton.addEventListener(MouseEvent.CLICK,this.typeClicked);
         this.nextButton.addEventListeners();
         this.prevButton.addEventListeners();
         this.typeButton.addEventListeners();
         this.closewindowbutton.addEventListeners();
      }
      
      internal function removeEventListeners() : *
      {
         this.closewindowbutton.removeEventListener(MouseEvent.CLICK,this.CloseWindow);
         this.nextButton.removeEventListener(MouseEvent.CLICK,this.nextClicked);
         this.prevButton.removeEventListener(MouseEvent.CLICK,this.prevClicked);
         this.typeButton.removeEventListener(MouseEvent.CLICK,this.typeClicked);
         this.nextButton.removeEventListeners();
         this.prevButton.removeEventListeners();
         this.typeButton.removeEventListeners();
         this.closewindowbutton.removeEventListeners();
      }
      
      internal function nextClicked(event:MouseEvent) : *
      {
         this.page += 1;
         this.refreshSlots();
      }
      
      internal function prevClicked(event:MouseEvent) : *
      {
         if(this.page != 0)
         {
            --this.page;
            this.refreshSlots();
         }
      }
      
      internal function typeClicked(event:MouseEvent) : *
      {
         this.isWeekly = !this.isWeekly;
         this.page = 0;
         if(this.isWeekly)
         {
            this.typeButton.setText(LangManager.getString(415));
            this.leaderboardtype.text = LangManager.getString(418);
         }
         else
         {
            this.typeButton.setText(LangManager.getString(416));
            this.leaderboardtype.text = LangManager.getString(417);
         }
         this.refreshSlots();
      }
   }
}

