package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1466")]
   public class DuelSlot extends MovieClip
   {
      
      public var bust:PortraitBust;
      
      public var opponentname:TextField;
      
      public var opponentlevel:TextField;
      
      public var duelbutton:RedButton;
      
      public var onlinetext:TextField;
      
      internal var charname:String;
      
      internal var equipment:String;
      
      internal var level:int;
      
      internal var timesince:int;
      
      public function DuelSlot()
      {
         super();
         this.duelbutton.setText(LangManager.getString(57));
         this.onlinetext.text = LangManager.getString(202);
         LangManager.initTextField(this.onlinetext);
         LangManager.initTextField(this.opponentname,true);
         LangManager.initTextField(this.opponentlevel);
      }
      
      public function setDuelInfo(charname:String, level:int, equipment:String, timesince:int) : *
      {
         if(equipment == "")
         {
            equipment = "0|0|6001|0|8006|0|0|0|12000|13002|13002|0|0";
            trace("error: " + charname + " equipment null");
         }
         this.charname = charname;
         this.equipment = equipment;
         this.level = level;
         this.timesince = timesince;
         this.visible = true;
         this.opponentname.text = charname;
         this.opponentlevel.text = LangManager.getString(47) + String(level);
         this.bust.initMCSFromEqString(equipment);
         this.onlinetext.visible = timesince < 300;
      }
      
      public function clearSlot() : *
      {
         this.charname = "";
         this.equipment = "";
         this.level = -1;
      }
      
      public function addEventListeners() : *
      {
         this.duelbutton.addEventListeners();
         this.duelbutton.addEventListener(MouseEvent.CLICK,this.startDuel);
      }
      
      public function removeEventListeners() : *
      {
         this.duelbutton.removeEventListeners();
         this.duelbutton.removeEventListener(MouseEvent.CLICK,this.startDuel);
      }
      
      internal function startDuel(event:MouseEvent) : *
      {
         DuelModeUI.instance.startDuel(this.charname,this.level,this.equipment);
         Tracker.instance.trackDuelUIChallenge();
      }
   }
}

