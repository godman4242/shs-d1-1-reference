package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol756")]
   public class §1t7924s0§ extends MovieClip
   {
      
      public var nextbutton:§1t5070s0§;
      
      public var prevbutton:§1t5070s0§;
      
      public var prompttext:TextField;
      
      public var warrulestitle:TextField;
      
      public var warruleswords:TextField;
      
      internal var page:int;
      
      internal var max:int = 7;
      
      public function §1t7924s0§()
      {
         super();
         §1t1521s0§.§1t9290s0§(this.warrulestitle,true);
         §1t1521s0§.§1t9290s0§(this.warruleswords);
         this.prevbutton.§1t5769s0§(§1t1521s0§.getString(151));
         this.nextbutton.§1t5769s0§(§1t1521s0§.getString(150));
         stop();
      }
      
      public function §1t5004s0§() : *
      {
         this.prevbutton.addEventListener(MouseEvent.CLICK,this.§1t7930s0§);
         this.prevbutton.§1t5004s0§();
         this.nextbutton.addEventListener(MouseEvent.CLICK,this.§1t7931s0§);
         this.nextbutton.§1t5004s0§();
      }
      
      public function removeEventListeners() : *
      {
         this.prevbutton.removeEventListener(MouseEvent.CLICK,this.§1t7930s0§);
         this.prevbutton.removeEventListeners();
         this.nextbutton.removeEventListener(MouseEvent.CLICK,this.§1t7931s0§);
         this.nextbutton.removeEventListeners();
      }
      
      internal function §1t7930s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         --this.page;
         if(this.page < 1)
         {
            this.page = this.max;
         }
         this.§1t7933s0§();
      }
      
      internal function §1t7931s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         ++this.page;
         if(this.page > this.max)
         {
            this.page = 1;
         }
         this.§1t7933s0§();
      }
      
      public function show() : *
      {
         visible = true;
         this.page = 1;
         this.§1t7933s0§();
         this.§1t5004s0§();
      }
      
      internal function §1t7932s0§(param1:MouseEvent) : *
      {
         visible = false;
         this.removeEventListeners();
      }
      
      internal function §1t7933s0§() : *
      {
         this.prevbutton.visible = true;
         this.nextbutton.visible = true;
         this.prevbutton.x = 280;
         this.nextbutton.x = 380;
         switch(this.page)
         {
            case 1:
               this.warrulestitle.text = §1t1521s0§.getString(369);
               this.warruleswords.text = §1t1521s0§.getString(370);
               this.prevbutton.visible = false;
               this.nextbutton.x = 330;
               break;
            case 2:
               this.warrulestitle.text = §1t1521s0§.getString(371);
               this.warruleswords.text = §1t1521s0§.getString(372);
               break;
            case 3:
               this.warrulestitle.text = §1t1521s0§.getString(373);
               this.warruleswords.text = §1t1521s0§.getString(374);
               break;
            case 4:
               this.warrulestitle.text = §1t1521s0§.getString(375);
               this.warruleswords.text = §1t1521s0§.getString(376);
               break;
            case 5:
               this.warrulestitle.text = §1t1521s0§.getString(377);
               this.warruleswords.text = §1t1521s0§.getString(378);
               break;
            case 6:
               this.warrulestitle.text = §1t1521s0§.getString(379);
               this.warruleswords.text = §1t1521s0§.getString(380);
               break;
            case 7:
               this.warrulestitle.text = §1t1521s0§.getString(11016);
               this.warruleswords.text = §1t1521s0§.getString(11017);
               this.nextbutton.visible = false;
               this.prevbutton.x = 330;
         }
      }
   }
}

