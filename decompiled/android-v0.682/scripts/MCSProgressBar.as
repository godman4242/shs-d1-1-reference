package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1494")]
   public class MCSProgressBar extends MovieClip
   {
      
      public var nametext:TextField;
      
      public var bar:MovieClip;
      
      internal var max:int = -1;
      
      internal var counter:int = 0;
      
      internal var actionID:int;
      
      public function MCSProgressBar()
      {
         super();
      }
      
      public function startProgress(num:int, actionID:int) : *
      {
         this.counter = 0;
         this.max = num;
         this.actionID = actionID;
         switch(actionID)
         {
            case NodeUI.ACTION_SEARCH:
               this.nametext.text = LangManager.getString(209);
               break;
            case NodeUI.ACTION_MINE:
               this.nametext.text = LangManager.getString(649);
         }
         this.visible = true;
      }
      
      public function cancel() : *
      {
         this.counter = this.max + 1;
         this.visible = false;
      }
      
      public function isProgressing() : Boolean
      {
         return this.counter < this.max;
      }
      
      public function getAction() : *
      {
         return this.actionID;
      }
      
      public function update() : *
      {
         if(this.counter < this.max)
         {
            ++this.counter;
            this.bar.scaleX = this.counter / this.max;
            if(this.counter == this.max)
            {
               this.visible = false;
               switch(this.actionID)
               {
                  case NodeUI.ACTION_SEARCH:
                     OverworldHUD.instance.getNodeUI().doSearch();
                     break;
                  case NodeUI.ACTION_MINE:
                     OverworldHUD.instance.getNodeUI().doMine();
               }
            }
         }
      }
   }
}

