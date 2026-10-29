package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2894")]
   public class WinUI extends MovieClip
   {
      
      public static var instance:WinUI;
      
      public var winwords:MovieClip;
      
      public var urltext:TextField;
      
      public var continuebutton:GreyButton;
      
      public var savereplaybutton:YellowButton;
      
      public var brushStroke:MovieClip;
      
      public function WinUI()
      {
         super();
         addFrameScript(0,this.frame1,6,this.frame7,10,this.frame11);
         instance = this;
         this.continuebutton.setText(LangManager.getString(482));
         this.savereplaybutton.setText(LangManager.getString(483));
      }
      
      public function showButtons() : *
      {
         if(NetworkManager.instance.isRecording())
         {
            this.continuebutton.visible = true;
            this.savereplaybutton.visible = true;
         }
      }
      
      public function show() : *
      {
         this.continuebutton.visible = false;
         this.savereplaybutton.visible = false;
         this.urltext.visible = false;
         this.addEventListeners();
         visible = true;
         gotoAndPlay(1);
         if(!BattleUI.instance.getIsDraw())
         {
            this.winwords.gotoAndStop(1);
         }
         else
         {
            this.winwords.gotoAndStop(2);
         }
      }
      
      internal function addEventListeners() : *
      {
         this.savereplaybutton.addEventListener(MouseEvent.CLICK,this.onSaveReplay);
         this.savereplaybutton.addEventListeners();
         this.continuebutton.addEventListener(MouseEvent.CLICK,this.onContinue);
         this.continuebutton.addEventListeners();
      }
      
      internal function removeEventListeners() : *
      {
         this.savereplaybutton.removeEventListener(MouseEvent.CLICK,this.onSaveReplay);
         this.savereplaybutton.removeEventListeners();
         this.continuebutton.removeEventListener(MouseEvent.CLICK,this.onContinue);
         this.continuebutton.removeEventListeners();
      }
      
      internal function onSaveReplay(mouseEvent:MouseEvent) : *
      {
         NetworkManager.instance.saveRecording();
         this.savereplaybutton.visible = false;
      }
      
      internal function onContinue(mouseEvent:MouseEvent) : *
      {
         this.removeEventListeners();
         Overworld.endQuestStepIntro();
         this.urltext.visible = false;
      }
      
      public function replaySaved() : *
      {
         this.urltext.text = "http://www.strawhatsamuraiduels.com/watch?name=" + StatsManager.charname;
         this.urltext.visible = true;
      }
      
      internal function frame1() : *
      {
         this.winwords.visible = false;
      }
      
      internal function frame7() : *
      {
         this.winwords.visible = true;
      }
      
      internal function frame11() : *
      {
         stop();
      }
   }
}

