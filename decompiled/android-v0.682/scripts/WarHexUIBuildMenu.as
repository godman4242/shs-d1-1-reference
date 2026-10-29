package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol628")]
   public class WarHexUIBuildMenu extends MovieClip
   {
      
      public var buildlabel2:TextField;
      
      public var buildlabel1:TextField;
      
      public var hex1:WarHex;
      
      public var backbutton:RedButtonSmall;
      
      public var hex2:WarHex;
      
      public var hex3:WarHex;
      
      public var scrollUpButton:ScrollButton;
      
      public var scrollDownButton:ScrollButton;
      
      public var titlelabel:TextField;
      
      public var desctext2:TextField;
      
      public var desctext3:TextField;
      
      public var buildlabel3:TextField;
      
      public var desctext1:TextField;
      
      internal var hexArray:Array = new Array();
      
      internal var buildlabelArray:Array = new Array();
      
      internal var descArray:Array = new Array();
      
      public function WarHexUIBuildMenu()
      {
         super();
         LangManager.initTextField(this.titlelabel,true);
         LangManager.initTextField(this.buildlabel1);
         LangManager.initTextField(this.buildlabel2);
         LangManager.initTextField(this.buildlabel3);
         LangManager.initTextField(this.desctext1);
         LangManager.initTextField(this.desctext2);
         LangManager.initTextField(this.desctext3);
         this.hexArray.push(this.hex1);
         this.hexArray.push(this.hex2);
         this.hexArray.push(this.hex3);
         this.buildlabelArray.push(this.buildlabel1);
         this.buildlabelArray.push(this.buildlabel2);
         this.buildlabelArray.push(this.buildlabel3);
         this.descArray.push(this.desctext1);
         this.descArray.push(this.desctext2);
         this.descArray.push(this.desctext3);
         this.buildlabel1.mouseEnabled = false;
         this.buildlabel2.mouseEnabled = false;
         this.buildlabel3.mouseEnabled = false;
         this.titlelabel.text = LangManager.getString(565);
         this.buildlabel1.text = LangManager.getString(422);
         this.buildlabel2.text = LangManager.getString(422);
         this.buildlabel3.text = LangManager.getString(422);
         this.hideAll();
         this.scrollUpButton.visible = false;
         this.scrollDownButton.visible = false;
         this.backbutton.setText(LangManager.getString(9));
      }
      
      internal function hideAll() : *
      {
         this.showItem(0,false);
         this.showItem(1,false);
         this.showItem(2,false);
      }
      
      public function show(selectedHex:WarHex) : *
      {
         if(!visible)
         {
            visible = true;
            this.addEventListeners();
            this.hideAll();
            if(selectedHex.hextype == WarHex.HEX_POTENTIALSPAWNPOINT)
            {
               this.showItem(0,true);
               this.hexArray[0].setOwner(selectedHex.owner);
               this.hexArray[0].setHexType(WarHex.HEX_SPAWNPOINT);
               this.hexArray[0].setFull();
               this.descArray[0].text = this.getDesc(WarHex.HEX_SPAWNPOINT);
            }
            else if(selectedHex.hextype == WarHex.HEX_NOTHING)
            {
               this.showItem(0,true);
               this.hexArray[0].setOwner(selectedHex.owner);
               this.hexArray[0].setHexType(WarHex.HEX_FORWARDBASE);
               this.hexArray[0].setFull();
               this.descArray[0].text = this.getDesc(WarHex.HEX_FORWARDBASE);
               this.showItem(1,true);
               this.hexArray[1].setOwner(selectedHex.owner);
               this.hexArray[1].setHexType(WarHex.HEX_DEFENSE);
               this.hexArray[1].setFull();
               this.descArray[1].text = this.getDesc(WarHex.HEX_DEFENSE);
               this.showItem(2,true);
               this.hexArray[2].setOwner(selectedHex.owner);
               this.hexArray[2].setHexType(WarHex.HEX_LADDER);
               this.hexArray[2].setFull();
               this.descArray[2].text = this.getDesc(WarHex.HEX_LADDER);
            }
            else if(selectedHex.hextype == WarHex.HEX_VILLAGE)
            {
               this.showItem(0,true);
               this.hexArray[0].setOwner(selectedHex.owner);
               this.hexArray[0].setHexType(WarHex.HEX_TOWN);
               this.hexArray[0].setFull();
               this.descArray[0].text = this.getDesc(WarHex.HEX_TOWN);
            }
         }
      }
      
      public function hide() : *
      {
         if(visible)
         {
            visible = false;
            this.removeEventListeners();
         }
      }
      
      internal function backClick(event:MouseEvent) : *
      {
         this.hide();
      }
      
      internal function showItem(index:int, flag:Boolean) : *
      {
         this.buildlabelArray[index].visible = flag;
         this.hexArray[index].visible = flag;
         this.descArray[index].visible = flag;
      }
      
      public function addEventListeners() : *
      {
         this.hex1.addEventListener(MouseEvent.CLICK,this.hex1Click);
         this.hex2.addEventListener(MouseEvent.CLICK,this.hex2Click);
         this.hex3.addEventListener(MouseEvent.CLICK,this.hex3Click);
         this.backbutton.addEventListeners();
         this.backbutton.addEventListener(MouseEvent.CLICK,this.backClick);
      }
      
      public function removeEventListeners() : *
      {
         this.hex1.removeEventListener(MouseEvent.CLICK,this.hex1Click);
         this.hex2.removeEventListener(MouseEvent.CLICK,this.hex2Click);
         this.hex3.removeEventListener(MouseEvent.CLICK,this.hex3Click);
         this.backbutton.removeEventListeners();
         this.backbutton.removeEventListener(MouseEvent.CLICK,this.backClick);
      }
      
      internal function hex1Click(event:MouseEvent) : *
      {
         this.doHexClick(0);
      }
      
      internal function hex2Click(event:MouseEvent) : *
      {
         this.doHexClick(1);
      }
      
      internal function hex3Click(event:MouseEvent) : *
      {
         this.doHexClick(2);
      }
      
      internal function doHexClick(index:int) : *
      {
         OverworldHUD.instance.warUI.warHexUI.startBuild(this.hexArray[index].hextype);
      }
      
      internal function getDesc(type:int) : String
      {
         var str:String = "";
         switch(type)
         {
            case WarHex.HEX_FORWARDBASE:
               str = LangManager.getString(350) + "\n";
               str += "- " + LangManager.getString(566) + 10000 + " " + LangManager.getString(63) + "\n";
               str += "- " + LangManager.getString(567);
               break;
            case WarHex.HEX_LADDER:
               str = LangManager.getString(568) + "\n";
               str += "- " + LangManager.getString(566) + 5000 + " " + LangManager.getString(63) + "\n";
               str += "- " + LangManager.getString(569);
               break;
            case WarHex.HEX_DEFENSE:
               str = LangManager.getString(570) + "\n";
               str += "- " + LangManager.getString(566) + 10000 + " " + LangManager.getString(63) + "\n";
               str += "- " + LangManager.getString(571);
               break;
            case WarHex.HEX_TOWN:
               str = LangManager.getString(572) + "\n";
               str += "- " + LangManager.getString(566) + 10000 + " " + LangManager.getString(63) + "\n";
               str += "- " + LangManager.getString(573);
               break;
            case WarHex.HEX_SPAWNPOINT:
               str = LangManager.getString(349) + "\n";
               str += "- " + LangManager.getString(574);
         }
         return str;
      }
   }
}

