package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol646")]
   public class WarRules extends MovieClip
   {
      
      public var warruleswords:TextField;
      
      public var nextbutton:RedButtonSmall;
      
      public var prompttext:TextField;
      
      public var prevbutton:RedButtonSmall;
      
      public var warrulestitle:TextField;
      
      internal var page:int;
      
      internal var max:int = 6;
      
      public function WarRules()
      {
         super();
         LangManager.initTextField(this.warrulestitle,true);
         LangManager.initTextField(this.warruleswords);
         this.prevbutton.setText(LangManager.getString(151));
         this.nextbutton.setText(LangManager.getString(150));
         stop();
      }
      
      public function addEventListeners() : *
      {
         this.prevbutton.addEventListener(MouseEvent.CLICK,this.prevClick);
         this.prevbutton.addEventListeners();
         this.nextbutton.addEventListener(MouseEvent.CLICK,this.nextClick);
         this.nextbutton.addEventListeners();
      }
      
      public function removeEventListeners() : *
      {
         this.prevbutton.removeEventListener(MouseEvent.CLICK,this.prevClick);
         this.prevbutton.removeEventListeners();
         this.nextbutton.removeEventListener(MouseEvent.CLICK,this.nextClick);
         this.nextbutton.removeEventListeners();
      }
      
      internal function prevClick(event:MouseEvent) : *
      {
         --this.page;
         if(this.page < 1)
         {
            this.page = this.max;
         }
         this.showPage();
      }
      
      internal function nextClick(event:MouseEvent) : *
      {
         ++this.page;
         if(this.page > this.max)
         {
            this.page = 1;
         }
         this.showPage();
      }
      
      public function show() : *
      {
         visible = true;
         this.page = 1;
         this.showPage();
         this.addEventListeners();
      }
      
      internal function closeClick(event:MouseEvent) : *
      {
         visible = false;
         this.removeEventListeners();
      }
      
      internal function showPage() : *
      {
         this.prevbutton.visible = true;
         this.nextbutton.visible = true;
         this.prevbutton.x = 280;
         this.nextbutton.x = 380;
         switch(this.page)
         {
            case 1:
               this.warrulestitle.text = LangManager.getString(369);
               this.warruleswords.text = LangManager.getString(370);
               this.prevbutton.visible = false;
               this.nextbutton.x = 330;
               break;
            case 2:
               this.warrulestitle.text = LangManager.getString(371);
               this.warruleswords.text = LangManager.getString(372);
               break;
            case 3:
               this.warrulestitle.text = LangManager.getString(373);
               this.warruleswords.text = LangManager.getString(374);
               break;
            case 4:
               this.warrulestitle.text = LangManager.getString(375);
               this.warruleswords.text = LangManager.getString(376);
               break;
            case 5:
               this.warrulestitle.text = LangManager.getString(377);
               this.warruleswords.text = LangManager.getString(378);
               break;
            case 6:
               this.warrulestitle.text = LangManager.getString(379);
               this.warruleswords.text = LangManager.getString(380);
               this.nextbutton.visible = false;
               this.prevbutton.x = 330;
         }
      }
   }
}

