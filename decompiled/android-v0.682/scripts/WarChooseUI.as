package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol504")]
   public class WarChooseUI extends MovieClip
   {
      
      public var blueside:MovieClip;
      
      public var choosebutton:RedButton;
      
      public var notacceptinglabel:TextField;
      
      public var sidename:TextField;
      
      public var yellowside:MovieClip;
      
      public var msgText:TextField;
      
      public var scrollUpButton:ScrollButton;
      
      public var redside:MovieClip;
      
      public var sidedesc:TextField;
      
      public var scrollDownButton:ScrollButton;
      
      public var randomside:MovieClip;
      
      public var clanemblem:MovieClip;
      
      public var greenside:MovieClip;
      
      internal var selectedSide:MovieClip = null;
      
      internal var sideArray:Array = new Array(5);
      
      internal var countArray:Array = new Array(5);
      
      public function WarChooseUI()
      {
         super();
         LangManager.initTextField(this.msgText,true);
         LangManager.initTextField(this.sidename,true);
         LangManager.initTextField(this.sidedesc,false);
         LangManager.initTextField(this.notacceptinglabel,true);
         this.msgText.text = LangManager.getString(321);
         this.sideArray = new Array();
         this.sideArray[0] = this.redside;
         this.sideArray[1] = this.greenside;
         this.sideArray[2] = this.blueside;
         this.sideArray[3] = this.yellowside;
         this.sideArray[4] = this.randomside;
         this.choosebutton.setText(LangManager.getString(323));
         this.notacceptinglabel.text = LangManager.getString(385);
      }
      
      public function show() : *
      {
         visible = true;
         for(var i:int = 0; i < this.sideArray.length; i++)
         {
            this.sideArray[i].gotoAndStop("mouseout");
            this.sideArray[i].buttonMode = true;
            this.countArray[i] = 0;
         }
         this.addEventListeners();
         this.scrollUpButton.visible = false;
         this.scrollDownButton.visible = false;
         this.sidename.text = "";
         this.sidedesc.text = "";
         this.choosebutton.visible = false;
         this.clanemblem.visible = false;
         this.selectedSide = null;
         this.notacceptinglabel.visible = false;
         OverworldHUD.instance.warUI.loading.visible = true;
         if(!StatsManager.usePlayerIO)
         {
            QueryManager.instance.getClanMemberCount();
         }
         else
         {
            OverworldHUD.instance.warUI.loading.visible = false;
            this.selectRandomSide();
         }
      }
      
      public function gotClanMemberCount(red:int, green:int, blue:int, yellow:int) : *
      {
         OverworldHUD.instance.warUI.loading.visible = false;
         this.countArray[0] = red;
         this.countArray[1] = green;
         this.countArray[2] = blue;
         this.countArray[3] = yellow;
         this.countArray[4] = (red + green + blue + yellow) / 4 + (red + green + blue + yellow) / 8;
         trace("max per side: " + this.countArray[4]);
         if(StatsManager.canChangeSide)
         {
            this.countArray[4] = red + green + blue + yellow + 100;
         }
         this.selectRandomSide();
      }
      
      public function hide() : *
      {
         visible = false;
         this.removeEventListeners();
      }
      
      public function addEventListeners() : *
      {
         for(var i:int = 0; i < this.sideArray.length; i++)
         {
            this.sideArray[i].addEventListener(MouseEvent.CLICK,this.onClick,false,0,true);
            this.sideArray[i].addEventListener(MouseEvent.ROLL_OVER,this.onMouseRollOver,false,0,true);
            this.sideArray[i].addEventListener(MouseEvent.ROLL_OUT,this.onMouseRollOut,false,0,true);
         }
         this.choosebutton.addEventListener(MouseEvent.CLICK,this.onChooseClick);
         this.choosebutton.addEventListeners();
      }
      
      public function removeEventListeners() : *
      {
         for(var i:int = 0; i < this.sideArray.length; i++)
         {
            this.sideArray[i].removeEventListener(MouseEvent.CLICK,this.onClick);
            this.sideArray[i].removeEventListener(MouseEvent.ROLL_OVER,this.onMouseRollOver);
            this.sideArray[i].removeEventListener(MouseEvent.ROLL_OUT,this.onMouseRollOut);
         }
         this.choosebutton.removeEventListener(MouseEvent.CLICK,this.onChooseClick);
         this.choosebutton.removeEventListeners();
      }
      
      internal function onClick(event:MouseEvent) : *
      {
         this.selectSide(event.target as MovieClip);
      }
      
      internal function selectRandomSide() : *
      {
         var sideArray:Array = null;
         if(!StatsManager.usePlayerIO)
         {
            sideArray = new Array();
            if(this.countArray[0] < this.countArray[4])
            {
               sideArray.push(this.redside);
            }
            else if(this.countArray[1] < this.countArray[4])
            {
               sideArray.push(this.greenside);
            }
            else if(this.countArray[2] < this.countArray[4])
            {
               sideArray.push(this.blueside);
            }
            else if(this.countArray[3] < this.countArray[4])
            {
               sideArray.push(this.yellowside);
            }
         }
         else
         {
            sideArray = [this.redside,this.greenside,this.blueside,this.yellowside];
         }
         this.selectSide(sideArray[int(Math.random() * sideArray.length)]);
      }
      
      internal function selectSide(mc:MovieClip) : *
      {
         if(this.selectedSide != null)
         {
            this.selectedSide.gotoAndStop("mouseout");
         }
         this.selectedSide = mc;
         this.selectedSide.gotoAndStop("selected");
         this.scrollUpButton.visible = false;
         this.scrollDownButton.visible = false;
         this.choosebutton.visible = true;
         this.clanemblem.visible = true;
         if(this.selectedSide == this.redside)
         {
            this.sidename.text = LangManager.getString(275);
            this.sidedesc.text = LangManager.getString(324);
            this.clanemblem.gotoAndStop(1);
            this.notacceptinglabel.visible = !this.choosebutton.visible;
         }
         else if(this.selectedSide == this.greenside)
         {
            this.sidename.text = LangManager.getString(276);
            this.sidedesc.text = LangManager.getString(325);
            this.clanemblem.gotoAndStop(2);
            this.notacceptinglabel.visible = !this.choosebutton.visible;
         }
         else if(this.selectedSide == this.blueside)
         {
            this.sidename.text = LangManager.getString(277);
            this.sidedesc.text = LangManager.getString(326);
            this.clanemblem.gotoAndStop(3);
            this.notacceptinglabel.visible = !this.choosebutton.visible;
         }
         else if(this.selectedSide == this.yellowside)
         {
            this.sidename.text = LangManager.getString(278);
            this.sidedesc.text = LangManager.getString(327);
            this.clanemblem.gotoAndStop(4);
            this.notacceptinglabel.visible = !this.choosebutton.visible;
         }
         else if(this.selectedSide == this.randomside)
         {
            this.sidename.text = LangManager.getString(322);
            this.sidedesc.text = LangManager.getString(328);
            this.clanemblem.gotoAndStop(5);
            this.notacceptinglabel.visible = false;
         }
      }
      
      internal function onMouseRollOver(event:MouseEvent) : *
      {
         if(this.selectedSide != null)
         {
            return;
         }
         event.target.gotoAndStop("mouseover");
         this.choosebutton.visible = true;
         this.clanemblem.visible = true;
         if(event.target == this.redside)
         {
            this.sidename.text = LangManager.getString(275);
            this.sidedesc.text = LangManager.getString(324);
            this.clanemblem.gotoAndStop(1);
         }
         else if(event.target == this.greenside)
         {
            this.sidename.text = LangManager.getString(276);
            this.sidedesc.text = LangManager.getString(325);
            this.clanemblem.gotoAndStop(2);
         }
         else if(event.target == this.blueside)
         {
            this.sidename.text = LangManager.getString(277);
            this.sidedesc.text = LangManager.getString(326);
            this.clanemblem.gotoAndStop(3);
         }
         else if(event.target == this.yellowside)
         {
            this.sidename.text = LangManager.getString(278);
            this.sidedesc.text = LangManager.getString(327);
            this.clanemblem.gotoAndStop(4);
         }
         else if(event.target == this.randomside)
         {
            this.sidename.text = LangManager.getString(322);
            this.sidedesc.text = LangManager.getString(328);
            this.clanemblem.gotoAndStop(5);
         }
      }
      
      internal function onMouseRollOut(event:MouseEvent) : *
      {
         if(this.selectedSide == null)
         {
            event.target.gotoAndStop("mouseout");
         }
      }
      
      internal function onChooseClick(event:MouseEvent) : *
      {
         var side:int = 0;
         if(this.selectedSide == null)
         {
            return;
         }
         if(this.selectedSide == this.redside)
         {
            side = 1;
         }
         else if(this.selectedSide == this.greenside)
         {
            side = 2;
         }
         else if(this.selectedSide == this.blueside)
         {
            side = 3;
         }
         else if(this.selectedSide == this.yellowside)
         {
            side = 4;
         }
         else if(this.selectedSide == this.randomside)
         {
            side = Math.random() * 4 + 1;
         }
         if(StatsManager.getSide() != side)
         {
            if(StatsManager.getSide() != 0)
            {
               QueryManager.instance.delWarSentry(-1,StatsManager.id);
               OverworldHUD.instance.warUI.initSelfSentry(-1,-1,-1);
            }
            else
            {
               OverworldHUD.instance.showAchievementUnlocked(52);
            }
            StatsManager.setStat(StatsManager.STAT_SIDE,side);
            QueryManager.instance.saveModifiedCharData();
         }
         this.hide();
         OverworldHUD.instance.warUI.onLeave(null);
         OverworldHUD.instance.warUI.onShow();
         OverworldHUD.instance.warUI.warrules.show();
      }
   }
}

