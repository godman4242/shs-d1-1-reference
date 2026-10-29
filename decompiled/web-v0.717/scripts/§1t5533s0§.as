package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3549")]
   public class §1t5533s0§ extends MovieClip
   {
      
      public var §1t5147s0§:MovieClip;
      
      public var §1t5534s0§:§1t74s0§;
      
      public var leftbustname:TextField;
      
      public var §1t5536s0§:§1t74s0§;
      
      public var §1t5537s0§:TextField;
      
      public function §1t5533s0§()
      {
         super();
         addFrameScript(19,this.frame20,68,this.frame69,87,this.frame88);
         this.visible = false;
         this.§1t5534s0§.scaleX = 4;
         this.§1t5534s0§.scaleY = 4;
         this.§1t5536s0§.scaleX = -4;
         this.§1t5536s0§.scaleY = 4;
         this.§1t5147s0§.visible = false;
         §1t1521s0§.§1t9290s0§(this.§1t5147s0§.§1t15877s0§.colorText);
         §1t1521s0§.§1t9290s0§(this.leftbustname);
         §1t1521s0§.§1t9290s0§(this.§1t5537s0§);
         this.§1t5147s0§.visible = false;
      }
      
      public function init(param1:Boolean) : *
      {
         gotoAndPlay(1);
         if(§1t1540s0§.§1t10049s0§())
         {
            this.§1t5534s0§.§1t5489s0§(§1t76s0§.§1t9202s0§);
            this.§1t5536s0§.§1t5489s0§(§1t76s0§.§1t9203s0§);
            this.leftbustname.text = §1t1524s0§.§1t1582s0§(§1t76s0§.§1t9202s0§);
            this.leftbustname.textColor = 16777215;
            this.§1t5537s0§.text = §1t1524s0§.§1t1582s0§(§1t76s0§.§1t9203s0§);
            this.§1t5537s0§.textColor = 16777215;
         }
         else if(param1)
         {
            this.§1t5534s0§.§1t5490s0§();
            this.§1t5536s0§.§1t5489s0§(§1t76s0§.§1t9196s0§);
            this.leftbustname.text = §1t1523s0§.charname;
            this.leftbustname.textColor = 16763904;
            this.§1t5537s0§.text = §1t1524s0§.§1t1582s0§(§1t76s0§.§1t9196s0§);
            this.§1t5537s0§.textColor = 16777215;
         }
         else
         {
            this.§1t5536s0§.§1t5490s0§();
            this.§1t5534s0§.§1t5489s0§(§1t76s0§.§1t9196s0§);
            this.§1t5537s0§.text = §1t1523s0§.charname;
            this.§1t5537s0§.textColor = 16763904;
            this.leftbustname.text = §1t1524s0§.§1t1582s0§(§1t76s0§.§1t9196s0§);
            this.leftbustname.textColor = 16777215;
         }
         this.visible = true;
         this.§1t5534s0§.visible = false;
         this.§1t5536s0§.visible = false;
         this.leftbustname.visible = false;
         this.§1t5537s0§.visible = false;
         this.§1t5147s0§.visible = false;
         this.§1t5147s0§.§1t15877s0§.colorText.text = §1t1521s0§.getString(104);
      }
      
      public function §1t5538s0§() : *
      {
         this.leftbustname.visible = true;
         this.§1t5537s0§.visible = true;
         this.§1t5534s0§.visible = true;
         this.§1t5536s0§.visible = true;
      }
      
      public function §1t5539s0§() : *
      {
         this.leftbustname.visible = false;
         this.§1t5537s0§.visible = false;
         this.§1t5534s0§.visible = false;
         this.§1t5536s0§.visible = false;
         this.§1t5147s0§.visible = true;
      }
      
      public function introEnd() : *
      {
         this.visible = false;
         this.§1t5534s0§.§1t5494s0§();
         this.§1t5536s0§.§1t5494s0§();
      }
      
      internal function frame20() : *
      {
         this.§1t5538s0§();
      }
      
      internal function frame69() : *
      {
         this.§1t5539s0§();
      }
      
      internal function frame88() : *
      {
         this.introEnd();
         stop();
      }
   }
}

