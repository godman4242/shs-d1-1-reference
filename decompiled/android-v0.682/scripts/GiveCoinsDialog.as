package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol991")]
   public class GiveCoinsDialog extends MovieClip
   {
      
      public var submitbutton:YellowButtonSmall;
      
      public var msgText:TextField;
      
      public var coinimg:MovieClip;
      
      public var cancelbutton:GreyButtonSmall;
      
      public var coinsText:TextField;
      
      public var add100button:GreyButtonSmall;
      
      public var add1button:GreyButtonSmall;
      
      public var resetbutton:GreyButtonSmall;
      
      public var add10button:GreyButtonSmall;
      
      internal var coins:int;
      
      public function GiveCoinsDialog()
      {
         super();
         LangManager.initTextField(this.msgText);
         LangManager.initTextField(this.coinsText);
         this.add1button.setText("+1");
         this.add10button.setText("+10");
         this.add100button.setText("+100");
         this.resetbutton.setText(LangManager.getString(248));
         this.submitbutton.setText(LangManager.getString(228));
         this.cancelbutton.setText(LangManager.getString(17));
      }
      
      public function show() : void
      {
         this.add1button.addEventListener(MouseEvent.CLICK,this.add1Click);
         this.add10button.addEventListener(MouseEvent.CLICK,this.add10Click);
         this.add100button.addEventListener(MouseEvent.CLICK,this.add100Click);
         this.resetbutton.addEventListener(MouseEvent.CLICK,this.resetClick);
         this.submitbutton.addEventListener(MouseEvent.CLICK,this.submitClick);
         this.cancelbutton.addEventListener(MouseEvent.CLICK,this.cancelClick);
         this.add1button.addEventListeners();
         this.add10button.addEventListeners();
         this.add100button.addEventListeners();
         this.resetbutton.addEventListeners();
         this.submitbutton.addEventListeners();
         this.cancelbutton.addEventListeners();
         this.resetClick(null);
         this.msgText.text = LangManager.getString(228) + " " + OverworldHUD.instance.playerPanelDisplay.ppcharname;
         this.visible = true;
      }
      
      internal function removeEventListeners() : *
      {
         this.add1button.removeEventListener(MouseEvent.CLICK,this.add1Click);
         this.add10button.removeEventListener(MouseEvent.CLICK,this.add10Click);
         this.add100button.removeEventListener(MouseEvent.CLICK,this.add100Click);
         this.resetbutton.removeEventListener(MouseEvent.CLICK,this.resetClick);
         this.submitbutton.removeEventListener(MouseEvent.CLICK,this.submitClick);
         this.cancelbutton.removeEventListener(MouseEvent.CLICK,this.cancelClick);
         this.add1button.removeEventListeners();
         this.add10button.removeEventListeners();
         this.add100button.removeEventListeners();
         this.resetbutton.removeEventListeners();
         this.submitbutton.removeEventListeners();
         this.cancelbutton.removeEventListeners();
      }
      
      internal function add1Click(event:MouseEvent) : *
      {
         if(StatsManager.getGold() >= this.coins + 1)
         {
            this.coins += 1;
            this.coinsText.text = this.coins.toString();
         }
      }
      
      internal function add10Click(event:MouseEvent) : *
      {
         if(StatsManager.getGold() >= this.coins + 10)
         {
            this.coins += 10;
            this.coinsText.text = this.coins.toString();
         }
      }
      
      internal function add100Click(event:MouseEvent) : *
      {
         if(StatsManager.getGold() >= this.coins + 100)
         {
            this.coins += 100;
            this.coinsText.text = this.coins.toString();
         }
      }
      
      internal function resetClick(event:MouseEvent) : *
      {
         this.coins = 0;
         this.coinsText.text = this.coins.toString();
      }
      
      internal function submitClick(event:MouseEvent) : *
      {
         this.removeEventListeners();
         this.visible = false;
         if(this.coins == 0)
         {
            return;
         }
         if(StatsManager.hackReported)
         {
            trace("hacked cannot give");
            OverworldHUD.instance.showDialog(LangManager.getString(679),LangManager.getString(5));
            return;
         }
         StatsManager.changeStat(StatsManager.STAT_GOLD,-this.coins);
         StatsManager.reportAchievementStat(60009,this.coins);
         QueryManager.instance.giveItem(OverworldHUD.instance.playerPanelDisplay.ppcharname,StatsManager.charname,"",this.coins);
         OverworldHUD.instance.playerPanelDisplay.visible = true;
         OverworldHUD.instance.showDialog(LangManager.getString(251) + OverworldHUD.instance.playerPanelDisplay.ppcharname + " " + this.coins + " " + LangManager.getString(63) + ".",LangManager.getString(5));
      }
      
      internal function cancelClick(event:MouseEvent) : *
      {
         this.removeEventListeners();
         this.visible = false;
         OverworldHUD.instance.playerPanelDisplay.visible = true;
      }
   }
}

