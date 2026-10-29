package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3565")]
   public class §1t5777s0§ extends MovieClip
   {
      
      public var gold:MovieClip;
      
      public var §1t5054s0§:TextField;
      
      public var msgText:TextField;
      
      public var §1t5365s0§:§1t5000s0§;
      
      public var registertext:TextField;
      
      public var §1t5366s0§:§1t5003s0§;
      
      internal var §1t5478s0§:Boolean = true;
      
      internal var §1t5779s0§:int;
      
      internal var §1t5780s0§:int = 0;
      
      internal var §1t5781s0§:int = 1;
      
      internal var §1t5782s0§:int = 2;
      
      internal var §1t5783s0§:int = 3;
      
      internal var §1t5784s0§:int = 4;
      
      internal var §1t5785s0§:int = 5;
      
      internal var §1t5786s0§:int = 11;
      
      internal var §1t5787s0§:int = 12;
      
      internal var §1t5788s0§:int = 13;
      
      internal var §1t5789s0§:int = 14;
      
      internal var §1t5790s0§:int = 15;
      
      internal var §1t5791s0§:int = 16;
      
      internal var §1t5792s0§:int = 17;
      
      internal var §1t5793s0§:int = 18;
      
      public function §1t5777s0§()
      {
         super();
         §1t1521s0§.§1t9290s0§(this.msgText);
         this.§1t5366s0§.§1t5769s0§(§1t1521s0§.getString(1));
         this.§1t5365s0§.§1t5769s0§(§1t1521s0§.getString(0));
         §1t1521s0§.§1t9290s0§(this.registertext,true);
         this.registertext.text = §1t1521s0§.getString(913);
         this.registertext.visible = false;
      }
      
      public function show(param1:int) : *
      {
         this.§1t5779s0§ = this.§1t5780s0§;
         this.msgText.text = §1t1521s0§.getString(914,[(param1 - §1t1523s0§.§1t9613s0§()).toString()]);
         if(§1t1540s0§.§1t9550s0§())
         {
            §1t1541s0§.§1t10099s0§();
         }
         this.visible = true;
         this.§1t5004s0§();
         this.gold.visible = false;
         this.§1t5054s0§.text = "";
         this.registertext.visible = false;
      }
      
      public function §1t5480s0§() : *
      {
         if(§1t1523s0§.§1t9714s0§(40001) == 0)
         {
            §1t1523s0§.§1t9712s0§(13,§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9415s0§));
            §1t1523s0§.§1t9712s0§(40001,1);
            §1t406s0§.instance.§1t6578s0§();
            §1t406s0§.instance.§1t6534s0§(§1t1521s0§.getString(210),§1t1521s0§.getString(5));
            §1t88s0§.instance.§1t1513s0§();
            return;
         }
         if(§1t3317s0§.instance.§1t1833s0§)
         {
            §1t406s0§.instance.§1t6534s0§(§1t1521s0§.getString(911),§1t1521s0§.getString(5));
            return;
         }
         this.§1t5779s0§ = this.§1t5781s0§;
         this.msgText.text = §1t1521s0§.getString(100);
         if(§1t1540s0§.§1t9550s0§())
         {
            §1t1541s0§.§1t10099s0§();
         }
         this.visible = true;
         this.§1t5004s0§();
         this.§1t5478s0§ = false;
         this.gold.visible = true;
         this.§1t5054s0§.text = "5";
      }
      
      public function §1t5794s0§() : *
      {
         if(§1t3317s0§.instance.§1t1833s0§)
         {
            return;
         }
         this.§1t5779s0§ = this.§1t5785s0§;
         this.msgText.text = §1t1521s0§.getString(701);
         this.visible = true;
         this.§1t5004s0§();
         this.§1t5478s0§ = true;
         this.gold.visible = true;
         this.§1t5054s0§.text = "5";
      }
      
      public function §1t5795s0§() : *
      {
         if(§1t3317s0§.instance.§1t1833s0§)
         {
            return;
         }
         this.§1t5779s0§ = this.§1t5790s0§;
         this.msgText.text = §1t1521s0§.getString(11507);
         this.visible = true;
         this.§1t5004s0§();
         this.§1t5478s0§ = true;
         this.gold.visible = true;
         this.§1t5054s0§.text = "10";
      }
      
      public function §1t5796s0§() : *
      {
         if(§1t3317s0§.instance.§1t1833s0§)
         {
            return;
         }
         this.§1t5779s0§ = this.§1t5792s0§;
         this.msgText.text = §1t1521s0§.getString(11509);
         this.visible = true;
         this.§1t5004s0§();
         this.§1t5478s0§ = true;
         this.gold.visible = true;
         this.§1t5054s0§.text = "";
      }
      
      public function §1t5797s0§() : *
      {
         if(§1t3317s0§.instance.§1t1833s0§)
         {
            return;
         }
         this.§1t5779s0§ = this.§1t5782s0§;
         this.msgText.text = §1t1521s0§.getString(61);
         if(§1t1540s0§.§1t9550s0§())
         {
            §1t1541s0§.§1t10099s0§();
         }
         this.visible = true;
         this.§1t5004s0§();
         this.gold.visible = true;
         this.§1t5054s0§.text = "5";
      }
      
      public function §1t5798s0§() : *
      {
         if(§1t3317s0§.instance.§1t1833s0§)
         {
            return;
         }
         this.§1t5779s0§ = this.§1t5783s0§;
         this.msgText.text = §1t1521s0§.getString(669);
         if(§1t1540s0§.§1t9550s0§())
         {
            §1t1541s0§.§1t10099s0§();
         }
         this.visible = true;
         this.§1t5004s0§();
         this.§1t5478s0§ = false;
         this.gold.visible = true;
         this.§1t5054s0§.text = "10";
      }
      
      public function §1t5799s0§() : *
      {
         if(§1t3317s0§.instance.§1t1833s0§)
         {
            return;
         }
         this.§1t5779s0§ = this.§1t5784s0§;
         this.msgText.text = §1t1521s0§.getString(915);
         if(§1t1540s0§.§1t9550s0§())
         {
            §1t1541s0§.§1t10099s0§();
         }
         this.visible = true;
         this.§1t5004s0§();
         this.gold.visible = false;
         this.§1t5054s0§.text = "";
         this.§1t5478s0§ = false;
      }
      
      internal function §1t5004s0§() : *
      {
         this.§1t5366s0§.addEventListener(MouseEvent.CLICK,this.§1t5370s0§);
         this.§1t5366s0§.§1t5004s0§();
         this.§1t5365s0§.addEventListener(MouseEvent.CLICK,this.§1t5371s0§);
         this.§1t5365s0§.§1t5004s0§();
      }
      
      internal function removeEventListeners() : *
      {
         this.§1t5366s0§.removeEventListener(MouseEvent.CLICK,this.§1t5370s0§);
         this.§1t5366s0§.removeEventListeners();
         this.§1t5365s0§.removeEventListener(MouseEvent.CLICK,this.§1t5371s0§);
         this.§1t5365s0§.removeEventListeners();
      }
      
      public function §1t5370s0§(param1:MouseEvent) : *
      {
         var mouseEvent:MouseEvent = param1;
         if(§1t3317s0§.instance.§1t1833s0§)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            this.registertext.visible = true;
            return;
         }
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         this.removeEventListeners();
         this.visible = false;
         if(this.§1t5779s0§ == this.§1t5780s0§)
         {
            if(§1t3317s0§.instance.§1t1833s0§)
            {
               §1t88s0§.instance.§1t1516s0§("Snd_error");
            }
            else if(§1t1540s0§.§1t9982s0§ == §1t1540s0§.§1t9992s0§)
            {
               §1t5177s0§.instance.§1t6221s0§.show();
            }
            else
            {
               §1t406s0§.instance.§1t6498s0§.show();
            }
         }
         else if(this.§1t5779s0§ == this.§1t5781s0§)
         {
            §1t1523s0§.§1t9615s0§(5,function():*
            {
               §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t9414s0§,10);
               §1t406s0§.instance.§1t6578s0§(true);
               §1t5371s0§(null);
            },function():*
            {
               show(5);
               §1t5779s0§ = §1t5786s0§;
            });
         }
         else if(this.§1t5779s0§ == this.§1t5785s0§)
         {
            §1t1523s0§.§1t9615s0§(5,function():*
            {
               §1t5045s0§.instance.§1t5125s0§();
               §1t5371s0§(null);
            },function():*
            {
               show(5);
               §1t5779s0§ = §1t5789s0§;
            });
         }
         else if(this.§1t5779s0§ == this.§1t5790s0§)
         {
            §1t1523s0§.§1t9615s0§(10,function():*
            {
               §1t412s0§.instance.§1t7634s0§(true);
               §1t5371s0§(null);
            },function():*
            {
               show(10);
               §1t5779s0§ = §1t5791s0§;
            });
         }
         else if(this.§1t5779s0§ == this.§1t5792s0§)
         {
            §1t1523s0§.§1t9615s0§(1,function():*
            {
               §1t406s0§.instance.§1t6518s0§.§1t6901s0§();
               §1t5371s0§(null);
            },function():*
            {
               show(1);
               §1t5779s0§ = §1t5793s0§;
            });
         }
         else if(this.§1t5779s0§ == this.§1t5783s0§)
         {
            if(§1t1523s0§.§1t9613s0§() >= 10)
            {
               §1t406s0§.instance.§1t6504s0§.show(§1t5313s0§.§1t12346s0§);
            }
            else
            {
               this.show(10);
               this.§1t5779s0§ = this.§1t5788s0§;
            }
         }
         else if(this.§1t5779s0§ == this.§1t5784s0§)
         {
            §1t406s0§.instance.§1t5947s0§.show(§1t401s0§.§1t12359s0§,4);
         }
         else if(this.§1t5779s0§ == this.§1t5788s0§)
         {
            §1t406s0§.instance.§1t6498s0§.show();
            this.§1t5798s0§();
         }
         else if(this.§1t5779s0§ == this.§1t5786s0§)
         {
            §1t406s0§.instance.§1t6498s0§.show();
            this.§1t5480s0§();
         }
         else if(this.§1t5779s0§ == this.§1t5787s0§)
         {
            §1t406s0§.instance.§1t6498s0§.show();
            this.§1t5797s0§();
         }
         else if(this.§1t5779s0§ == this.§1t5789s0§)
         {
            §1t406s0§.instance.§1t6498s0§.show();
            this.§1t5794s0§();
         }
         else if(this.§1t5779s0§ == this.§1t5791s0§)
         {
            §1t406s0§.instance.§1t6498s0§.show();
            this.§1t5795s0§();
         }
         else if(this.§1t5779s0§ == this.§1t5793s0§)
         {
            §1t406s0§.instance.§1t6498s0§.show();
            this.§1t5796s0§();
         }
      }
      
      public function §1t5371s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_back");
         this.removeEventListeners();
         if(this.§1t5779s0§ == this.§1t5786s0§)
         {
            this.§1t5480s0§();
         }
         else if(this.§1t5779s0§ == this.§1t5787s0§)
         {
            this.§1t5797s0§();
         }
         else if(this.§1t5779s0§ == this.§1t5789s0§)
         {
            this.§1t5794s0§();
         }
         else if(this.§1t5779s0§ == this.§1t5791s0§)
         {
            this.§1t5795s0§();
         }
         else if(this.§1t5779s0§ == this.§1t5788s0§)
         {
            this.§1t5798s0§();
         }
         else
         {
            if(!this.§1t5478s0§ && §1t1540s0§.§1t9550s0§())
            {
               §1t1541s0§.§1t10045s0§();
            }
            this.visible = false;
            this.§1t5478s0§ = true;
         }
         if(this.§1t5779s0§ == this.§1t5783s0§)
         {
            §1t406s0§.instance.§1t6534s0§(§1t1521s0§.getString(393),§1t1521s0§.getString(5));
         }
      }
      
      public function §1t5800s0§() : *
      {
         this.§1t5478s0§ = false;
      }
   }
}

