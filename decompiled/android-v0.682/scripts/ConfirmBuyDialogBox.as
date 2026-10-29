package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol823")]
   public class ConfirmBuyDialogBox extends MovieClip
   {
      
      public var bodyBox:TextField;
      
      public var noButton:GreyButtonSmall;
      
      public var yesButton:YellowButtonSmall;
      
      public function ConfirmBuyDialogBox()
      {
         super();
         this.yesButton.setText(LangManager.getString(1));
         this.noButton.setText(LangManager.getString(0));
         LangManager.initTextField(this.bodyBox);
      }
      
      public function addEventListeners() : void
      {
         this.yesButton.addEventListener(MouseEvent.CLICK,this.onBuy);
         this.yesButton.addEventListeners();
         this.noButton.addEventListener(MouseEvent.CLICK,this.onCancel);
         this.noButton.addEventListeners();
      }
      
      public function removeEventListeners() : void
      {
         this.yesButton.removeEventListener(MouseEvent.CLICK,this.onBuy);
         this.yesButton.removeEventListeners();
         this.noButton.removeEventListener(MouseEvent.CLICK,this.onCancel);
         this.noButton.removeEventListeners();
      }
      
      public function onBuy(mouseEvent:MouseEvent) : void
      {
         StatsManager.spendHeavenlyGold(MovieClip(parent).displayItem.getHCost(),MovieClip(parent).purchaseSuccess,MovieClip(parent).purchaseError);
         this.removeEventListeners();
         this.visible = false;
      }
      
      public function onCancel(mouseEvent:MouseEvent) : void
      {
         this.removeEventListeners();
         this.visible = false;
      }
      
      public function show(itemName:String) : *
      {
         this.addEventListeners();
         this.bodyBox.htmlText = LangManager.getString(83) + " " + itemName + "?";
         this.visible = true;
      }
   }
}

