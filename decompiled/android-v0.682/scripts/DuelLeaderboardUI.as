package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1472")]
   public class DuelLeaderboardUI extends MovieClip
   {
      
      public var typeButton:RedButtonSmall;
      
      public var namelabel:TextField;
      
      public var winlosslabel:TextField;
      
      public var nextButton:RedButtonSmall;
      
      public var leaderboardtype:TextField;
      
      public var prevButton:RedButtonSmall;
      
      public var closewindowbutton:RedButtonSmall;
      
      public var ranklabel:TextField;
      
      internal var page:int = 0;
      
      internal var slots:Vector.<DuelLeaderboardField>;
      
      internal var totalSlots:int = 10;
      
      internal var loading:MovieClip;
      
      internal var isWeekly:Boolean = true;
      
      public function DuelLeaderboardUI()
      {
         var slot:DuelLeaderboardField = null;
         this.slots = new Vector.<DuelLeaderboardField>();
         super();
         for(var i:int = 0; i < this.totalSlots; i++)
         {
            slot = new DuelLeaderboardField();
            this.slots.push(slot);
            addChild(slot);
            slot.x = 147;
            slot.y = 113 + i * 32;
            slot.visible = false;
         }
         this.nextButton.setText(LangManager.getString(150));
         this.prevButton.setText(LangManager.getString(151));
         this.closewindowbutton.setText(LangManager.getString(173));
         this.typeButton.setText(LangManager.getString(415));
         LangManager.initTextField(this.leaderboardtype,true);
         this.leaderboardtype.text = LangManager.getString(418);
         LangManager.initTextField(this.ranklabel,true);
         this.ranklabel.text = LangManager.getString(153);
         LangManager.initTextField(this.namelabel,true);
         this.namelabel.text = LangManager.getString(154);
         LangManager.initTextField(this.winlosslabel,true);
         this.winlosslabel.text = LangManager.getString(152);
      }
      
      public function show(loadingmc:MovieClip) : *
      {
         this.addEventListeners();
         this.page = 0;
         this.visible = true;
         this.prevButton.visible = false;
         this.nextButton.visible = false;
         this.loading = loadingmc;
         this.refreshSlots();
      }
      
      internal function refreshSlots() : *
      {
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
            this.slots[i].showIndicator(leaderboardArray[0] == StatsManager.charname);
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
      
      public function onLeave(event:MouseEvent) : void
      {
         this.removeEventListeners();
         visible = false;
         DuelModeUI.instance.returnFromRankings();
         this.loading = null;
      }
      
      internal function addEventListeners() : *
      {
         this.closewindowbutton.addEventListener(MouseEvent.CLICK,this.onLeave);
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
         this.closewindowbutton.removeEventListener(MouseEvent.CLICK,this.onLeave);
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

