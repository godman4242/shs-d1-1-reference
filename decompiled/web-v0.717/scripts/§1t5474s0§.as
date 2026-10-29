package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol91")]
   public class §1t5474s0§ extends MovieClip
   {
      
      public var button:§1t5003s0§;
      
      public var button2:§1t5003s0§;
      
      public var msgText:TextField;
      
      internal var §1t5478s0§:Boolean = false;
      
      internal var §1t5369s0§:Function = null;
      
      internal var §1t5479s0§:Function = null;
      
      public function §1t5474s0§()
      {
         super();
         §1t1521s0§.§1t9290s0§(this.msgText);
      }
      
      public function show(param1:String, param2:String, param3:Boolean) : void
      {
         if(§1t406s0§.instance.§1t6487s0§.visible)
         {
            return;
         }
         this.button2.visible = false;
         this.msgText.text = param1;
         this.button.§1t5769s0§(param2);
         this.button.addEventListener(MouseEvent.CLICK,this.§1t5484s0§);
         this.button.§1t5004s0§();
         if(!§1t1540s0§.§1t10014s0§() && !§1t1540s0§.§1t10012s0§())
         {
            §1t1541s0§.§1t10099s0§();
         }
         this.button.visible = param3;
         this.button.x = 340;
         if(param3)
         {
            this.msgText.y = 187.5;
         }
         else
         {
            this.msgText.y = 220;
         }
         this.visible = true;
         var _loc4_:TextFormat = new TextFormat();
         if(this.msgText.numLines <= 2)
         {
            _loc4_.align = "center";
         }
         else
         {
            _loc4_.align = "left";
         }
         this.msgText.defaultTextFormat = _loc4_;
         this.msgText.text = param1;
         this.button.removeEventListener(MouseEvent.CLICK,this.§1t5370s0§);
         this.button2.removeEventListener(MouseEvent.CLICK,this.§1t5371s0§);
      }
      
      public function §1t5480s0§(param1:String, param2:String, param3:Boolean) : void
      {
         if(§1t406s0§.instance.§1t6487s0§.visible)
         {
            return;
         }
         this.msgText.text = param1;
         this.button.§1t5769s0§(param2);
         this.button.addEventListener(MouseEvent.CLICK,this.§1t5484s0§);
         this.button.§1t5004s0§();
         if(!§1t1540s0§.§1t10014s0§() && !§1t1540s0§.§1t10012s0§())
         {
            §1t1541s0§.§1t10099s0§();
         }
         this.button.visible = param3;
         this.button.x = 270;
         if(param3)
         {
            this.msgText.y = 187.5;
         }
         else
         {
            this.msgText.y = 220;
         }
         this.visible = true;
         this.button2.visible = false;
         this.button2.§1t5769s0§(§1t1521s0§.getString(227));
         this.button2.addEventListener(MouseEvent.CLICK,this.§1t5485s0§);
         this.button2.§1t5004s0§();
         if(!§1t1540s0§.§1t10014s0§() && !§1t1540s0§.§1t10012s0§())
         {
            §1t1541s0§.§1t10099s0§();
         }
         this.button2.visible = param3;
         this.button2.x = 425;
         var _loc4_:TextFormat = new TextFormat();
         if(this.msgText.numLines == 1)
         {
            _loc4_.align = "center";
         }
         else
         {
            _loc4_.align = "left";
         }
         this.msgText.defaultTextFormat = _loc4_;
         this.msgText.text = param1;
         this.button.removeEventListener(MouseEvent.CLICK,this.§1t5370s0§);
         this.button2.removeEventListener(MouseEvent.CLICK,this.§1t5371s0§);
      }
      
      public function §1t5481s0§(param1:String, param2:Function = null, param3:Function = null, param4:String = "", param5:String = "") : *
      {
         this.button.visible = true;
         if(param3 != null)
         {
            if(param4 == "")
            {
               this.button.§1t5769s0§(§1t1521s0§.getString(1));
            }
            else
            {
               this.button.§1t5769s0§(param4);
            }
            this.button.addEventListener(MouseEvent.CLICK,this.§1t5370s0§);
            this.button.§1t5004s0§();
            this.button.x = 270;
            if(param5 == "")
            {
               this.button2.§1t5769s0§(§1t1521s0§.getString(0));
            }
            else
            {
               this.button2.§1t5769s0§(param5);
            }
            this.button2.addEventListener(MouseEvent.CLICK,this.§1t5371s0§);
            this.button2.§1t5004s0§();
            this.button2.x = 425;
            this.button2.visible = true;
         }
         else
         {
            if(param4 == "")
            {
               this.button.§1t5769s0§(§1t1521s0§.getString(1));
            }
            else
            {
               this.button.§1t5769s0§(param4);
            }
            this.button.addEventListener(MouseEvent.CLICK,this.§1t5370s0§);
            this.button.§1t5004s0§();
            this.button.x = 340;
            this.button2.visible = false;
         }
         this.visible = true;
         if(!§1t1540s0§.§1t10014s0§() && !§1t1540s0§.§1t10012s0§())
         {
            §1t1541s0§.§1t10099s0§();
         }
         var _loc6_:TextFormat = new TextFormat();
         _loc6_.align = "center";
         this.msgText.defaultTextFormat = _loc6_;
         this.msgText.text = param1;
         if(param2 != null)
         {
            this.§1t5369s0§ = param2;
         }
         else
         {
            this.§1t5369s0§ = this.§1t5483s0§;
         }
         if(param3 != null)
         {
            this.§1t5479s0§ = param3;
         }
         else
         {
            this.§1t5479s0§ = this.§1t5483s0§;
         }
         this.button.removeEventListener(MouseEvent.CLICK,this.§1t5484s0§);
         this.button2.removeEventListener(MouseEvent.CLICK,this.§1t5485s0§);
      }
      
      public function §1t5482s0§(param1:String) : *
      {
         this.msgText.htmlText = param1;
      }
      
      internal function §1t5370s0§(param1:MouseEvent) : *
      {
         if(§1t88s0§.instance != null)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_click");
         }
         visible = false;
         this.button.removeEventListener(MouseEvent.CLICK,this.§1t5370s0§);
         this.button.removeEventListeners();
         this.button2.removeEventListener(MouseEvent.CLICK,this.§1t5371s0§);
         this.button2.removeEventListeners();
         this.§1t5369s0§.call();
      }
      
      internal function §1t5371s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_back");
         visible = false;
         this.button.removeEventListener(MouseEvent.CLICK,this.§1t5370s0§);
         this.button.removeEventListeners();
         this.button2.removeEventListener(MouseEvent.CLICK,this.§1t5371s0§);
         this.button2.removeEventListeners();
         this.§1t5479s0§.call();
      }
      
      internal function §1t5483s0§() : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_back");
         this.button.removeEventListener(MouseEvent.CLICK,this.§1t5370s0§);
         this.button.removeEventListeners();
         this.button2.removeEventListener(MouseEvent.CLICK,this.§1t5371s0§);
         this.button2.removeEventListeners();
         if(§1t1540s0§.§1t10047s0§())
         {
            §1t1541s0§.§1t10097s0§();
         }
         else if(!this.§1t5478s0§ && !§1t1540s0§.§1t10014s0§() && !§1t1540s0§.§1t10012s0§() && !§1t406s0§.instance.§1t6466s0§.visible && (§1t126s0§.instance == null || !§1t126s0§.instance.§1t1700s0§()))
         {
            §1t1541s0§.§1t10045s0§();
         }
         this.visible = false;
         this.§1t5478s0§ = false;
      }
      
      public function §1t5484s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         this.button.removeEventListener(MouseEvent.CLICK,this.§1t5484s0§);
         this.button.removeEventListeners();
         this.button2.removeEventListener(MouseEvent.CLICK,this.§1t5485s0§);
         this.button2.removeEventListeners();
         if(§1t1540s0§.§1t10047s0§())
         {
            §1t1541s0§.§1t10097s0§();
         }
         else if(!this.§1t5478s0§ && !§1t1540s0§.§1t10014s0§() && !§1t1540s0§.§1t10012s0§() && !§1t406s0§.instance.§1t6466s0§.visible && (§1t126s0§.instance == null || !§1t126s0§.instance.§1t1700s0§()))
         {
            §1t1541s0§.§1t10045s0§();
         }
         this.visible = false;
         this.§1t5478s0§ = false;
      }
      
      internal function §1t5485s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         this.button.removeEventListener(MouseEvent.CLICK,this.§1t5484s0§);
         this.button.removeEventListeners();
         this.button2.removeEventListener(MouseEvent.CLICK,this.§1t5485s0§);
         this.button2.removeEventListeners();
         if(§1t1540s0§.§1t10047s0§())
         {
            §1t1541s0§.§1t10097s0§();
         }
         else if(!§1t1540s0§.§1t10014s0§() && !§1t1540s0§.§1t10012s0§() && !§1t406s0§.instance.§1t6466s0§.visible)
         {
            §1t1541s0§.§1t10045s0§();
         }
         §1t6427s0§.§1t9549s0§.§1t6553s0§(param1);
         this.visible = false;
         this.§1t5478s0§ = false;
      }
      
      public function §1t5486s0§() : *
      {
         this.§1t5478s0§ = true;
      }
   }
}

