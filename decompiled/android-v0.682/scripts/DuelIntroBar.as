package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2861")]
   public class DuelIntroBar extends MovieClip
   {
      
      public var rightbust:MCSBust;
      
      public var leftbust:MCSBust;
      
      public var actionWord:MovieClip;
      
      public var leftbustname:TextField;
      
      public var rightbustname:TextField;
      
      public function DuelIntroBar()
      {
         super();
         addFrameScript(0,this.frame1,19,this.frame20,68,this.frame69,87,this.frame88);
         this.visible = false;
         this.leftbust.scaleX = 4;
         this.leftbust.scaleY = 4;
         this.rightbust.scaleX = -4;
         this.rightbust.scaleY = 4;
         this.actionWord.visible = false;
         LangManager.initTextField(this.actionWord.textmask.colorText);
         LangManager.initTextField(this.leftbustname);
         LangManager.initTextField(this.rightbustname);
      }
      
      public function init(playerOnLeft:Boolean) : *
      {
         if(GameEngine.isPlayBack())
         {
            this.leftbust.initMCSFromNPCID(XMLNpc.INDEX_PLAYER1);
            this.rightbust.initMCSFromNPCID(XMLNpc.INDEX_PLAYER2);
            this.leftbustname.text = QuestEngine.getNPCName(XMLNpc.INDEX_PLAYER1);
            this.leftbustname.textColor = 16777215;
            this.rightbustname.text = QuestEngine.getNPCName(XMLNpc.INDEX_PLAYER2);
            this.rightbustname.textColor = 16777215;
         }
         else if(playerOnLeft)
         {
            this.leftbust.initMCSFromPlayer();
            this.rightbust.initMCSFromNPCID(XMLNpc.INDEX_DUELIST);
            this.leftbustname.text = StatsManager.charname;
            this.leftbustname.textColor = 16763904;
            this.rightbustname.text = QuestEngine.getNPCName(XMLNpc.INDEX_DUELIST);
            this.rightbustname.textColor = 16777215;
         }
         else
         {
            this.rightbust.initMCSFromPlayer();
            this.leftbust.initMCSFromNPCID(XMLNpc.INDEX_DUELIST);
            this.rightbustname.text = StatsManager.charname;
            this.rightbustname.textColor = 16763904;
            this.leftbustname.text = QuestEngine.getNPCName(XMLNpc.INDEX_DUELIST);
            this.leftbustname.textColor = 16777215;
         }
         this.visible = true;
         this.leftbust.visible = false;
         this.rightbust.visible = false;
         this.leftbustname.visible = false;
         this.rightbustname.visible = false;
         this.actionWord.textmask.colorText.text = LangManager.getString(104);
      }
      
      public function showText() : *
      {
         this.leftbustname.visible = true;
         this.rightbustname.visible = true;
         this.leftbust.visible = true;
         this.rightbust.visible = true;
      }
      
      public function introEnd() : *
      {
         this.visible = false;
      }
      
      internal function frame1() : *
      {
         this.actionWord.visible = false;
      }
      
      internal function frame20() : *
      {
         this.showText();
      }
      
      internal function frame69() : *
      {
         this.actionWord.visible = true;
      }
      
      internal function frame88() : *
      {
         this.introEnd();
         stop();
      }
   }
}

