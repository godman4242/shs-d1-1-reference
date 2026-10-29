package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol976")]
   public class LevelUpDialog extends MovieClip
   {
      
      public var skilllabel:TextField;
      
      public var xptolevellabel:TextField;
      
      public var xpText:TextField;
      
      public var button:YellowButton;
      
      public var line1:TextField;
      
      public var line2:TextField;
      
      public var skillText:TextField;
      
      public var statlabel:TextField;
      
      public var statText:TextField;
      
      internal var nextDialog:MovieClip;
      
      public function LevelUpDialog()
      {
         super();
         this.button.setText(LangManager.getString(5));
         LangManager.initTextField(this.line1,true);
         LangManager.initTextField(this.line2,true);
         LangManager.initTextField(this.statlabel,true);
         LangManager.initTextField(this.skilllabel,true);
         LangManager.initTextField(this.xptolevellabel,true);
      }
      
      public function setNextDialog(mc:MovieClip) : *
      {
         this.nextDialog = mc;
      }
      
      public function show(level:int, xptolevel:int, numOfLevels:int) : *
      {
         this.line1.text = LangManager.getString(133);
         this.line2.text = LangManager.getString(120) + " " + level;
         this.statlabel.text = LangManager.getString(134);
         this.skilllabel.text = LangManager.getString(135);
         this.xptolevellabel.text = LangManager.getString(136);
         this.statText.text = "+" + numOfLevels * 3;
         this.skillText.text = "+" + numOfLevels * 1;
         this.xpText.text = xptolevel + " " + LangManager.getString(119);
         this.button.addEventListener(MouseEvent.CLICK,this.onClick);
         this.button.addEventListeners();
         this.visible = true;
         SoundManager.instance.playMusic(MusicManager.MUSIC_LEVELUP);
      }
      
      public function onClick(mouseEvent:MouseEvent) : *
      {
         this.button.removeEventListener(MouseEvent.CLICK,this.onClick);
         this.button.removeEventListeners();
         this.visible = false;
         if(this.nextDialog != null)
         {
            this.nextDialog.visible = true;
         }
      }
   }
}

