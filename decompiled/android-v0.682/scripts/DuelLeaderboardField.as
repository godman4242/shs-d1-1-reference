package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol719")]
   public class DuelLeaderboardField extends MovieClip
   {
      
      public var indicator1:MovieClip;
      
      public var namefield:TextField;
      
      public var rankfield:TextField;
      
      public var winlosefield:TextField;
      
      public var indicator2:MovieClip;
      
      public function DuelLeaderboardField()
      {
         super();
      }
      
      public function setInfo(lbname:String, lblevel:int, lbwin:int, lblose:int, lbdraw:int, lbdan:int) : *
      {
         LangManager.initTextField(this.namefield);
         LangManager.initTextField(this.winlosefield);
         this.winlosefield.text = String(lbwin) + "/" + String(lblose) + "/" + String(lbdraw);
         this.namefield.text = lbname;
      }
      
      public function setRank(rank:int) : *
      {
         LangManager.initTextField(this.rankfield);
         this.rankfield.text = String(rank);
      }
      
      public function showIndicator(flag:Boolean) : *
      {
         this.indicator1.visible = flag;
         this.indicator2.visible = flag;
      }
   }
}

