package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1090")]
   public class NewQuestActionIcon extends MovieClip
   {
      
      public var normalNewBox:TextField;
      
      public var dailyNewBox:TextField;
      
      public var highLvlNewBox:TextField;
      
      public var lowLvlNewBox:TextField;
      
      public var type:int;
      
      public function NewQuestActionIcon(iconType:int)
      {
         super();
         this.type = iconType;
         this.normalNewBox.text = "";
         this.normalNewBox.mouseEnabled = false;
         this.dailyNewBox.text = "";
         this.dailyNewBox.mouseEnabled = false;
         this.highLvlNewBox.text = "";
         this.highLvlNewBox.mouseEnabled = false;
         this.lowLvlNewBox.text = "";
         this.lowLvlNewBox.mouseEnabled = false;
         switch(this.type)
         {
            case QuestType.RepeatableSideQuest:
            case QuestType.NormalSideQuest:
               this.normalNewBox.text = "!";
               break;
            case QuestType.HighLvlQuest:
               this.highLvlNewBox.text = "!";
               break;
            case QuestType.LowLvlQuest:
               this.lowLvlNewBox.text = "!";
               break;
            case QuestType.DailySideQuest:
               this.dailyNewBox.text = "!";
               break;
            default:
               trace("NewQuestActionIcon(" + this.type + ") is invalid!");
         }
      }
   }
}

