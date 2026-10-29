package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2772")]
   public class CreateCharForm extends MovieClip
   {
      
      public var pantslabel:TextField;
      
      public var shirtnext:SimpleButton;
      
      public var errormessage:TextField;
      
      public var gendernext:SimpleButton;
      
      public var facenext:SimpleButton;
      
      public var namelabel:TextField;
      
      public var hatnext:SimpleButton;
      
      public var hatlabel:TextField;
      
      public var hatprev:SimpleButton;
      
      public var bustui:MovieClip;
      
      public var pantsnext:SimpleButton;
      
      public var facelabel:TextField;
      
      public var shirtprev:SimpleButton;
      
      public var genderprev:SimpleButton;
      
      public var createchar:YellowButtonSmall;
      
      public var charnamefield:TextField;
      
      public var pantsprev:SimpleButton;
      
      public var titletext:TextField;
      
      public var hairprev:SimpleButton;
      
      public var genderlabel:TextField;
      
      public var shirtlabel:TextField;
      
      public var hairnext:SimpleButton;
      
      public var hairlabel:TextField;
      
      public var gobackbutton:YellowButtonSmall;
      
      public var faceprev:SimpleButton;
      
      internal var hairvalue:int = 0;
      
      internal var maleHairArray:Array = [6019,6020,6007,6009,6006,6010,6011,6013,6008,6014,6015,6017,6018,6002,6003,6004,6001];
      
      internal var femaleHairArray:Array = [6504,6501,6502,6503,6505,6506,6507,6508,6509,6019,6007,6009,6006,6010,6011,6017,6018,6004,6001];
      
      internal var hairArray:Array = this.maleHairArray;
      
      internal var facevalue:int = 0;
      
      internal var maleFaceArray:Array = [8005,8006,8004];
      
      internal var femaleFaceArray:Array = [8500,8502,8503];
      
      internal var faceArray:Array = this.maleFaceArray;
      
      internal var shirtvalue:int = 0;
      
      internal var shirtArray:Array = [4017,4018,4019,4027,0];
      
      internal var pantsvalue:int = 0;
      
      internal var pantsArray:Array = [11017,11018,11019,11027,0];
      
      internal var shoesvalue:int = 0;
      
      internal var shoesArray:Array = [12017,12011,12011,12011,12011,12011,12011,12012,12011,12014];
      
      internal var hatvalue:int = 0;
      
      internal var hatArray:Array = [0,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017];
      
      internal var bust:MCSBust;
      
      internal var isFemale:Boolean = false;
      
      public function CreateCharForm()
      {
         super();
         this.bust = StatsManager.createPlayerBust();
         this.bust.scaleX = 2;
         this.bust.scaleY = 2;
         this.bustui.bustcanvas.addChild(this.bust);
         this.bustui.stancecolor1.gotoAndStop(2);
         this.bustui.highlight.visible = false;
         LangManager.initTextField(this.errormessage);
         LangManager.initTextField(this.titletext,true);
         this.titletext.text = LangManager.getString(32);
         LangManager.initTextField(this.namelabel);
         this.namelabel.text = LangManager.getString(33);
         LangManager.initTextField(this.genderlabel);
         this.genderlabel.text = LangManager.getString(618);
         LangManager.initTextField(this.hairlabel);
         this.hairlabel.text = LangManager.getString(34);
         LangManager.initTextField(this.facelabel);
         this.facelabel.text = LangManager.getString(35);
         this.shirtlabel.text = LangManager.getString(36);
         this.pantslabel.text = LangManager.getString(37);
         LangManager.initTextField(this.shirtlabel);
         LangManager.initTextField(this.pantslabel);
         LangManager.initTextField(this.hatlabel);
         this.hatlabel.text = LangManager.getString(38);
         this.createchar.setText(LangManager.getString(39));
         this.gobackbutton.setText(LangManager.getString(9));
         this.genderlabel.mouseEnabled = false;
         this.namelabel.mouseEnabled = false;
         this.hairlabel.mouseEnabled = false;
         this.facelabel.mouseEnabled = false;
         this.shirtlabel.mouseEnabled = false;
         this.pantslabel.mouseEnabled = false;
         this.hatlabel.mouseEnabled = false;
         this.shirtlabel.visible = false;
         this.shirtnext.visible = false;
         this.shirtprev.visible = false;
         this.pantslabel.visible = false;
         this.pantsnext.visible = false;
         this.pantsprev.visible = false;
      }
      
      public function clearFields() : *
      {
         this.charnamefield.text = "";
         this.errormessage.text = "";
         this.hairvalue = 0;
         this.facevalue = 0;
         this.shirtvalue = 0;
         this.pantsvalue = 0;
         this.hatvalue = 0;
         this.isFemale = false;
      }
      
      public function reAddListeners() : *
      {
         this.clearFields();
         this.gobackbutton.addEventListener(MouseEvent.CLICK,this.goBack);
         this.createchar.addEventListener(MouseEvent.CLICK,this.createCharacter);
         this.gobackbutton.addEventListeners();
         this.createchar.addEventListeners();
         this.gendernext.addEventListener(MouseEvent.CLICK,this.genderNext);
         this.genderprev.addEventListener(MouseEvent.CLICK,this.genderNext);
         this.hairnext.addEventListener(MouseEvent.CLICK,this.hairNext);
         this.hairprev.addEventListener(MouseEvent.CLICK,this.hairPrev);
         this.facenext.addEventListener(MouseEvent.CLICK,this.faceNext);
         this.faceprev.addEventListener(MouseEvent.CLICK,this.facePrev);
         this.hatnext.addEventListener(MouseEvent.CLICK,this.hatNext);
         this.hatprev.addEventListener(MouseEvent.CLICK,this.hatPrev);
         this.shirtnext.addEventListener(MouseEvent.CLICK,this.shirtNext);
         this.shirtprev.addEventListener(MouseEvent.CLICK,this.shirtPrev);
         this.pantsnext.addEventListener(MouseEvent.CLICK,this.pantsNext);
         this.pantsprev.addEventListener(MouseEvent.CLICK,this.pantsPrev);
         stage.focus = this.charnamefield;
         if(QueryManager.instance.offlineMode)
         {
            this.charnamefield.text = "Guest";
            this.charnamefield.type = TextFieldType.DYNAMIC;
            this.charnamefield.background = false;
            this.charnamefield.border = false;
            this.charnamefield.textColor = 13421772;
            this.createCharacter(null);
            visible = false;
         }
         else
         {
            this.charnamefield.text = "";
            this.charnamefield.type = TextFieldType.INPUT;
            this.charnamefield.background = true;
            this.charnamefield.border = true;
            this.charnamefield.textColor = 0;
         }
      }
      
      internal function removeListeners() : *
      {
         this.gobackbutton.removeEventListener(MouseEvent.CLICK,this.goBack);
         this.createchar.removeEventListener(MouseEvent.CLICK,this.createCharacter);
         this.gobackbutton.removeEventListeners();
         this.createchar.removeEventListeners();
         this.gendernext.removeEventListener(MouseEvent.CLICK,this.genderNext);
         this.genderprev.removeEventListener(MouseEvent.CLICK,this.genderNext);
         this.hairnext.removeEventListener(MouseEvent.CLICK,this.hairNext);
         this.hairprev.removeEventListener(MouseEvent.CLICK,this.hairPrev);
         this.facenext.removeEventListener(MouseEvent.CLICK,this.faceNext);
         this.faceprev.removeEventListener(MouseEvent.CLICK,this.facePrev);
         this.hatnext.removeEventListener(MouseEvent.CLICK,this.hatNext);
         this.hatprev.removeEventListener(MouseEvent.CLICK,this.hatPrev);
         this.shirtnext.removeEventListener(MouseEvent.CLICK,this.shirtNext);
         this.shirtprev.removeEventListener(MouseEvent.CLICK,this.shirtPrev);
         this.pantsnext.removeEventListener(MouseEvent.CLICK,this.pantsNext);
         this.pantsprev.removeEventListener(MouseEvent.CLICK,this.pantsPrev);
      }
      
      internal function getTitleMCS() : MCSCharacter
      {
         return GameEngine.titleMCS;
      }
      
      internal function genderNext(event:MouseEvent) : *
      {
         this.isFemale = !this.isFemale;
         this.hairvalue = 0;
         this.facevalue = 0;
         this.hatvalue = 0;
         if(!this.isFemale)
         {
            this.faceArray = this.maleFaceArray;
            this.hairArray = this.maleHairArray;
            this.getTitleMCS().setNeck(10000);
            this.bust.setNeck(10000);
         }
         else
         {
            this.faceArray = this.femaleFaceArray;
            this.hairArray = this.femaleHairArray;
            this.getTitleMCS().setNeck(10001);
            this.bust.setNeck(10001);
         }
         this.getTitleMCS().setHair(this.hairArray[0]);
         this.bust.setHair(this.hairArray[0]);
         this.getTitleMCS().setHead(this.faceArray[0]);
         this.bust.setHead(this.faceArray[0]);
         this.getTitleMCS().setHat(0);
         this.bust.setHat(0);
      }
      
      internal function hairNext(event:MouseEvent) : *
      {
         ++this.hairvalue;
         if(this.hairvalue > this.hairArray.length - 1)
         {
            this.hairvalue = 0;
         }
         if(this.hatvalue == 0)
         {
            this.getTitleMCS().setHair(this.hairArray[this.hairvalue]);
            this.bust.setHair(this.hairArray[this.hairvalue]);
         }
      }
      
      internal function hairPrev(event:MouseEvent) : *
      {
         --this.hairvalue;
         if(this.hairvalue < 0)
         {
            this.hairvalue = this.hairArray.length - 1;
         }
         if(this.hatvalue == 0)
         {
            this.getTitleMCS().setHair(this.hairArray[this.hairvalue]);
            this.bust.setHair(this.hairArray[this.hairvalue]);
         }
      }
      
      internal function faceNext(event:MouseEvent) : *
      {
         ++this.facevalue;
         if(this.facevalue > this.faceArray.length - 1)
         {
            this.facevalue = 0;
         }
         this.bust.setHead(this.faceArray[this.facevalue]);
      }
      
      internal function facePrev(event:MouseEvent) : *
      {
         --this.facevalue;
         if(this.facevalue < 0)
         {
            this.facevalue = this.faceArray.length - 1;
         }
         this.bust.setHead(this.faceArray[this.facevalue]);
      }
      
      internal function outfitNext(event:MouseEvent) : *
      {
         this.shirtNext(null);
         this.pantsNext(null);
         this.shoesNext(null);
      }
      
      internal function outfitPrev(event:MouseEvent) : *
      {
         this.shirtPrev(null);
         this.pantsPrev(null);
         this.shoesPrev(null);
      }
      
      internal function shirtNext(event:MouseEvent) : *
      {
         ++this.shirtvalue;
         if(this.shirtvalue > this.shirtArray.length - 1)
         {
            this.shirtvalue = 0;
         }
         this.getTitleMCS().setArmor(this.shirtArray[this.shirtvalue]);
         this.bust.setArmor(this.shirtArray[this.shirtvalue]);
      }
      
      internal function shirtPrev(event:MouseEvent) : *
      {
         --this.shirtvalue;
         if(this.shirtvalue < 0)
         {
            this.shirtvalue = this.shirtArray.length - 1;
         }
         this.getTitleMCS().setArmor(this.shirtArray[this.shirtvalue]);
         this.bust.setArmor(this.shirtArray[this.shirtvalue]);
      }
      
      internal function pantsNext(event:MouseEvent) : *
      {
         ++this.pantsvalue;
         if(this.pantsvalue > this.pantsArray.length - 1)
         {
            this.pantsvalue = 0;
         }
         this.getTitleMCS().setPants(this.pantsArray[this.pantsvalue]);
      }
      
      internal function pantsPrev(event:MouseEvent) : *
      {
         --this.pantsvalue;
         if(this.pantsvalue < 0)
         {
            this.pantsvalue = this.pantsArray.length - 1;
         }
         this.getTitleMCS().setPants(this.pantsArray[this.pantsvalue]);
      }
      
      internal function shoesNext(event:MouseEvent) : *
      {
         ++this.shoesvalue;
         if(this.shoesvalue > this.shoesArray.length - 1)
         {
            this.shoesvalue = 0;
         }
         this.getTitleMCS().setShoes(this.shoesArray[this.shoesvalue]);
      }
      
      internal function shoesPrev(event:MouseEvent) : *
      {
         --this.shoesvalue;
         if(this.shoesvalue < 0)
         {
            this.shoesvalue = this.shoesArray.length - 1;
         }
         this.getTitleMCS().setShoes(this.shoesArray[this.shoesvalue]);
      }
      
      internal function hatNext(event:MouseEvent) : *
      {
         ++this.hatvalue;
         if(this.hatvalue > this.hatArray.length - 1)
         {
            this.hatvalue = 0;
         }
         this.getTitleMCS().setHat(this.hatArray[this.hatvalue]);
         this.bust.setHat(this.hatArray[this.hatvalue]);
         if(this.hatvalue == 0)
         {
            this.getTitleMCS().removeHat();
            this.bust.setHair(this.hairArray[this.hairvalue]);
         }
         else
         {
            this.getTitleMCS().wearHat();
            if(this.hairArray[this.hairvalue] != 6001)
            {
               this.bust.setHair(6000);
            }
         }
      }
      
      internal function hatPrev(event:MouseEvent) : *
      {
         --this.hatvalue;
         if(this.hatvalue < 0)
         {
            this.hatvalue = this.hatArray.length - 1;
         }
         this.getTitleMCS().setHat(this.hatArray[this.hatvalue]);
         this.bust.setHat(this.hatArray[this.hatvalue]);
         if(this.hatvalue == 0)
         {
            this.getTitleMCS().removeHat();
            this.bust.setHair(this.hairArray[this.hairvalue]);
         }
         else
         {
            this.getTitleMCS().wearHat();
            if(this.hairArray[this.hairvalue] != 6001)
            {
               this.bust.setHair(6000);
            }
         }
      }
      
      internal function goBack(event:MouseEvent) : *
      {
         this.removeListeners();
         if(!StatsManager.singleCharacter)
         {
            TitleUI.instance.switchToCharacterSelect();
         }
         else
         {
            visible = false;
            this.removeListeners();
            TitleUI.instance.switchToReady();
         }
      }
      
      internal function createCharacter(event:MouseEvent) : *
      {
         if(this.charnamefield.text == "")
         {
            this.errormessage.text = LangManager.getString(41);
            return;
         }
         if(escape(this.charnamefield.text).length > 24)
         {
            this.errormessage.text = LangManager.getString(4);
            return;
         }
         var nameEx:RegExp = /[^a-zA-Z0-9]/;
         if(LangManager.getLanguage() == LangManager.ENGLISH && nameEx.test(this.charnamefield.text))
         {
            this.errormessage.text = LangManager.getString(137);
            return;
         }
         if(this.charnamefield.text.indexOf("!") != -1 || this.charnamefield.text.indexOf("@") != -1 || this.charnamefield.text.indexOf("#") != -1 || this.charnamefield.text.indexOf("$") != -1 || this.charnamefield.text.indexOf("%") != -1 || this.charnamefield.text.indexOf("^") != -1 || this.charnamefield.text.indexOf("&") != -1 || this.charnamefield.text.indexOf("*") != -1 || this.charnamefield.text.indexOf("(") != -1 || this.charnamefield.text.indexOf(")") != -1 || this.charnamefield.text.indexOf("-") != -1 || this.charnamefield.text.indexOf("_") != -1 || this.charnamefield.text.indexOf("=") != -1 || this.charnamefield.text.indexOf("+") != -1 || this.charnamefield.text.indexOf("\\") != -1 || this.charnamefield.text.indexOf("|") != -1 || this.charnamefield.text.indexOf("[") != -1 || this.charnamefield.text.indexOf("{") != -1 || this.charnamefield.text.indexOf("]") != -1 || this.charnamefield.text.indexOf("}") != -1 || this.charnamefield.text.indexOf(";") != -1 || this.charnamefield.text.indexOf(":") != -1 || this
         .charnamefield.text.indexOf("\'") != -1 || this.charnamefield.text.indexOf("\"") != -1 || this.charnamefield.text.indexOf("<") != -1 || this.charnamefield.text.indexOf(",") != -1 || this.charnamefield.text.indexOf(">") != -1 || this.charnamefield.text.indexOf(".") != -1 || this.charnamefield.text.indexOf("?") != -1 || this.charnamefield.text.indexOf("/") != -1 || this.charnamefield.text.indexOf("~") != -1 || this.charnamefield.text.indexOf(" ") != -1 || this.charnamefield.text.indexOf("`") != -1)
         {
            this.errormessage.text = LangManager.getString(137);
            return;
         }
         this.charnamefield.text = this.charnamefield.text.split("\'").join();
         this.charnamefield.text = this.charnamefield.text.split("&").join();
         this.charnamefield.text = this.charnamefield.text.toLowerCase();
         StatsManager.initNewPlayer(this.charnamefield.text,this.hairArray[this.hairvalue],this.faceArray[this.facevalue],this.shirtArray[this.shirtvalue],this.pantsArray[this.pantsvalue],this.hatArray[this.hatvalue],this.shoesArray[this.shoesvalue],this.isFemale);
         trace("message sent");
         this.removeListeners();
         TitleUI.instance.loadingScreenOn();
         QueryManager.instance.createCharacter(this.charnamefield.text);
      }
      
      public function serverResponse(input:int) : *
      {
         switch(input)
         {
            case 0:
               StatsManager.reset();
               Tracker.instance.trackCreateCharacter();
               StatsManager.charname = this.charnamefield.text;
               GameEngine.setCounter(0);
               GameEngine.setGameMode(GameEngine.MODE_TITLESTOP);
               TitleUI.instance.loadingScreenOff();
               TitleUI.instance.hideTitle();
               this.visible = false;
               break;
            case 1:
               trace("not logged in");
               this.errormessage.text = LangManager.getString(42);
               this.removeListeners();
               StatsManager.reset();
               TitleUI.instance.switchToLogin();
               break;
            case 2:
               trace("wrong magic number");
               this.errormessage.text = LangManager.getString(43);
               this.removeListeners();
               StatsManager.reset();
               TitleUI.instance.switchToLogin();
               break;
            case 3:
               trace("charname exists");
               TitleUI.instance.loadingScreenOff();
               this.reAddListeners();
               this.errormessage.text = LangManager.getString(44);
               break;
            case 4:
               trace("sql error");
               TitleUI.instance.loadingScreenOff();
               this.reAddListeners();
               this.errormessage.text = LangManager.getString(24);
               break;
            case 5:
               trace("too many alts");
               TitleUI.instance.loadingScreenOff();
               this.reAddListeners();
               this.errormessage.text = "Too many alts";
         }
      }
   }
}

