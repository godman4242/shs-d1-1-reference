package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1901")]
   public class §1t7523s0§ extends MovieClip
   {
      
      public var §1t5268s0§:§1t5003s0§;
      
      public var §1t7524s0§:TextField;
      
      public var §1t7525s0§:TextField;
      
      public var §1t7502s0§:MovieClip;
      
      public var §1t7479s0§:MovieClip;
      
      public var §1t5284s0§:TextField;
      
      public var §1t7526s0§:MovieClip;
      
      internal var §1t7508s0§:§1t28s0§;
      
      internal var counter:int;
      
      internal var §1t916s0§:§1t24s0§;
      
      public function §1t7523s0§()
      {
         super();
         visible = false;
         this.§1t7524s0§.mouseEnabled = false;
         this.§1t5284s0§.mouseEnabled = false;
      }
      
      public function init(param1:§1t24s0§) : *
      {
         this.§1t916s0§ = param1;
      }
      
      public function show(param1:§1t28s0§) : *
      {
         visible = true;
         this.§1t7508s0§ = param1;
         this.counter = 0;
         this.§1t7524s0§.text = this.§1t7508s0§.§1t926s0§.§1t509s0§();
         this.§1t5284s0§.text = "";
         this.§1t7525s0§.text = "";
         if(param1.§1t928s0§() == §1t24s0§.§1t8769s0§)
         {
            this.§1t5268s0§.§1t5769s0§(§1t1521s0§.getString(22029));
            this.§1t5268s0§.visible = true;
         }
         else if(param1.§1t928s0§() == §1t24s0§.§1t8767s0§)
         {
            this.§1t5268s0§.§1t5769s0§(§1t1521s0§.getString(22074));
            this.§1t5268s0§.visible = true;
         }
         else
         {
            this.§1t5268s0§.visible = false;
         }
         this.§1t5004s0§();
         if(param1.§1t926s0§.§1t969s0§ != -1)
         {
            this.§1t7502s0§.gotoAndStop(param1.§1t926s0§.§1t969s0§ + 1);
            this.§1t7502s0§.visible = true;
            this.§1t7525s0§.text = param1.§1t942s0§().toString();
            this.§1t5284s0§.text = §1t1521s0§.getString(22030,["-:--"]);
         }
         else
         {
            this.§1t7502s0§.visible = false;
         }
         if(param1.§1t926s0§.§1t960s0§ != -1)
         {
            this.§1t7479s0§.gotoAndStop(param1.§1t926s0§.§1t960s0§);
            this.§1t7479s0§.visible = true;
         }
         else
         {
            this.§1t7479s0§.visible = false;
         }
         if(param1.§1t926s0§.§1t961s0§ != -1)
         {
            this.§1t7526s0§.gotoAndStop(param1.§1t926s0§.§1t961s0§);
            this.§1t7526s0§.visible = true;
         }
         else
         {
            this.§1t7526s0§.visible = false;
         }
         if(!this.§1t7526s0§.visible && !this.§1t7502s0§.visible && !this.§1t7479s0§.visible)
         {
            this.§1t7524s0§.y = 445;
         }
         else
         {
            this.§1t7524s0§.y = 415;
         }
         if(param1.§1t928s0§() == §1t24s0§.§1t8767s0§)
         {
            this.§1t7524s0§.y = 415;
            this.§1t5284s0§.text = §1t1521s0§.getString(22030,["-:--"]);
            this.§1t7479s0§.gotoAndStop(2);
            this.§1t7479s0§.visible = true;
         }
      }
      
      internal function §1t5004s0§() : *
      {
         this.§1t5268s0§.addEventListener(MouseEvent.CLICK,this.§1t5299s0§);
      }
      
      internal function removeEventListeners() : *
      {
         this.§1t5268s0§.removeEventListener(MouseEvent.CLICK,this.§1t5299s0§);
      }
      
      public function hide() : *
      {
         if(!visible)
         {
            return;
         }
         visible = false;
         this.removeEventListeners();
      }
      
      public function update(param1:int) : *
      {
         if(!visible)
         {
            return;
         }
         if(this.§1t7508s0§.§1t924s0§ != -1)
         {
            if(this.counter == 0)
            {
               this.§1t5284s0§.text = this.§1t7508s0§.§1t936s0§(param1);
               this.counter = 24;
            }
            else
            {
               --this.counter;
            }
         }
      }
      
      internal function §1t7527s0§(param1:int, param2:int) : String
      {
         var _loc3_:int = param2 - param1;
         if(_loc3_ <= 0)
         {
            return §1t1521s0§.getString(22031);
         }
         return §1t1521s0§.getString(22030,[this.§1t7508s0§.§1t937s0§(_loc3_)]);
      }
      
      internal function §1t5299s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         if(this.§1t7508s0§.§1t928s0§() == §1t24s0§.§1t8769s0§)
         {
            §1t412s0§.instance.§1t7544s0§.show(this.§1t7508s0§);
         }
         else if(this.§1t7508s0§.§1t928s0§() == §1t24s0§.§1t8767s0§)
         {
            §1t406s0§.instance.§1t6549s0§(§1t412s0§.instance.§1t916s0§);
         }
      }
      
      public function destroy() : *
      {
         this.§1t7508s0§ = null;
      }
   }
}

