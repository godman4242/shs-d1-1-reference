package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1172")]
   public class §1t6517s0§ extends MovieClip
   {
      
      public var arrow:MovieClip;
      
      public var §1t5438s0§:§1t5488s0§;
      
      public var dialogueBodyText:TextField;
      
      public var npcName:TextField;
      
      public var portraitCanvas:§1t5016s0§;
      
      public var shade:§1t6775s0§;
      
      internal var §1t6776s0§:MovieClip = null;
      
      public function §1t6517s0§()
      {
         super();
         this.§1t5438s0§.§1t5492s0§();
         this.visible = false;
         §1t1521s0§.§1t9290s0§(this.npcName,true);
         §1t1521s0§.§1t9290s0§(this.dialogueBodyText);
         this.dialogueBodyText.condenseWhite = true;
         this.shade.visible = false;
      }
      
      public function show(param1:int, param2:String, param3:String = "") : *
      {
         if(param2 == null)
         {
            param2 = "";
         }
         if(this.§1t6776s0§ != null)
         {
            this.portraitCanvas.removeChild(this.§1t6776s0§);
            this.§1t6776s0§ = null;
         }
         if(param1 == -2)
         {
            this.npcName.text = §1t1523s0§.charname;
            if(param3 == "")
            {
               this.§1t5438s0§.§1t5490s0§();
            }
         }
         else
         {
            this.npcName.text = §1t1524s0§.§1t1582s0§(param1);
            if(param3 == "")
            {
               this.§1t5438s0§.§1t5489s0§(param1);
            }
         }
         this.dialogueBodyText.text = "";
         this.dialogueBodyText.htmlText = param2;
         this.addEventListener(MouseEvent.CLICK,this.§1t6777s0§);
         this.hitArea = this.shade;
         this.visible = true;
         this.arrow.visible = true;
         if(param3 != "")
         {
            this.§1t5438s0§.visible = false;
            this.§1t6776s0§ = §1t1522s0§.§1t9316s0§(param3);
            this.portraitCanvas.addChild(this.§1t6776s0§);
            this.§1t6776s0§.x = 800;
            this.§1t6776s0§.y = 0;
         }
         else
         {
            this.§1t5438s0§.visible = true;
         }
         mouseEnabled = true;
      }
      
      public function §1t6777s0§(param1:MouseEvent) : *
      {
         this.removeEventListener(MouseEvent.CLICK,this.§1t6777s0§);
         this.visible = false;
         if(this.§1t6776s0§ != null)
         {
            this.portraitCanvas.removeChild(this.§1t6776s0§);
            this.§1t6776s0§ = null;
         }
         §1t126s0§.§1t9190s0§().§1t813s0§();
      }
      
      public function §1t6778s0§() : *
      {
         this.removeEventListener(MouseEvent.CLICK,this.§1t6777s0§);
         this.visible = false;
         if(this.§1t6776s0§ != null)
         {
            this.portraitCanvas.removeChild(this.§1t6776s0§);
            this.§1t6776s0§ = null;
         }
      }
      
      public function §1t6779s0§() : *
      {
         this.removeEventListener(MouseEvent.CLICK,this.§1t6777s0§);
         this.arrow.visible = false;
         if(this.§1t6776s0§ != null)
         {
            this.portraitCanvas.removeChild(this.§1t6776s0§);
            this.§1t6776s0§ = null;
         }
         mouseEnabled = false;
      }
      
      public function §1t6780s0§(param1:int) : *
      {
         if(param1 == 0)
         {
            §1t1643s0§.§1t3311s0§(this.§1t5438s0§);
         }
         else
         {
            §1t1643s0§.§1t11217s0§(this.§1t5438s0§,-200,2);
         }
      }
   }
}

