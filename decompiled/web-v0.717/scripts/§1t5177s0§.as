package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3579")]
   public class §1t5177s0§ extends MovieClip
   {
      
      public static var instance:§1t5177s0§;
      
      public var brushStroke:MovieClip;
      
      public var coin:MovieClip;
      
      public var §1t6212s0§:TextField;
      
      public var §1t6213s0§:§1t5367s0§;
      
      public var §1t6214s0§:§1t5000s0§;
      
      public var §1t6215s0§:§1t5777s0§;
      
      public var gold:MovieClip;
      
      public var moneybar:§1t5874s0§;
      
      public var §1t6216s0§:§1t5003s0§;
      
      public var §1t6217s0§:§1t5000s0§;
      
      public var urltext:TextField;
      
      internal var §1t6219s0§:Boolean = false;
      
      internal var §1t6220s0§:Boolean = false;
      
      internal var §1t6221s0§:§1t410s0§;
      
      internal var §1t6222s0§:int;
      
      public function §1t5177s0§()
      {
         super();
         instance = this;
         this.§1t6217s0§.§1t5769s0§(§1t1521s0§.getString(480));
         this.§1t6221s0§ = new §1t410s0§();
         addChild(this.§1t6221s0§);
         this.gold.mouseEnabled = false;
         this.coin.mouseEnabled = false;
         this.§1t6212s0§.mouseEnabled = false;
         this.brushStroke.mouseEnabled = false;
      }
      
      public function show() : *
      {
         this.§1t6215s0§.visible = false;
         this.§1t6221s0§.visible = false;
         this.§1t6216s0§.visible = false;
         this.§1t6217s0§.visible = false;
         this.gold.visible = false;
         this.coin.visible = false;
         this.§1t6212s0§.visible = false;
         this.moneybar.visible = false;
         this.§1t6220s0§ = false;
         this.§1t6213s0§.visible = false;
         this.§1t6222s0§ = §1t1523s0§.§1t9616s0§();
         if(§1t1540s0§.§1t10051s0§())
         {
            this.§1t6216s0§.visible = true;
            this.gold.visible = true;
            if(§1t1523s0§.getLevel() < 10 && §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9426s0§) == 0)
            {
               this.gold.visible = false;
               this.§1t6216s0§.§1t5769s0§(§1t1521s0§.getString(884));
            }
            else
            {
               this.§1t6216s0§.§1t5769s0§(§1t1521s0§.getString(480));
               this.coin.visible = true;
               this.§1t6212s0§.visible = true;
               this.§1t6217s0§.visible = true;
               this.moneybar.visible = true;
               this.moneybar.§1t6660s0§();
               this.moneybar.§1t6662s0§(false);
               this.moneybar.§1t6663s0§(§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9413s0§) == 0 && !§1t3317s0§.instance.§1t1833s0§);
               if(§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9412s0§) < 1000)
               {
                  this.§1t6212s0§.htmlText = "<font color=\"#FF0000\">1000</font>";
               }
               else
               {
                  this.§1t6212s0§.htmlText = "<font color=\"#FFFFFF\">1000</font>";
               }
            }
            this.§1t6214s0§.§1t5769s0§(§1t1521s0§.getString(481));
         }
         else
         {
            this.§1t6214s0§.§1t5769s0§(§1t1521s0§.getString(482));
            if(§1t251s0§.instance.§1t3506s0§())
            {
               if(§1t5565s0§.instance.§1t5616s0§())
               {
                  this.§1t6216s0§.visible = false;
                  this.§1t6214s0§.visible = false;
               }
               else
               {
                  this.§1t6216s0§.§1t5769s0§(§1t1521s0§.getString(483));
                  this.§1t6216s0§.visible = true;
                  this.§1t6214s0§.visible = true;
                  this.§1t6220s0§ = true;
               }
            }
            else
            {
               this.§1t6214s0§.visible = true;
            }
         }
         this.§1t5004s0§();
         visible = true;
         this.urltext.visible = false;
         this.brushStroke.gotoAndPlay(1);
         if(§1t1540s0§.§1t10047s0§())
         {
            §1t1523s0§.§1t9726s0§(§1t1523s0§.§1t9463s0§,30);
            if(§1t1524s0§.§1t9874s0§(§1t76s0§.§1t9196s0§) != null)
            {
               §1t406s0§.instance.§1t6516s0§.show(§1t76s0§.§1t9196s0§,§1t5565s0§.instance.§1t5608s0§());
               §1t406s0§.instance.§1t6516s0§.§1t6779s0§();
               §1t1524s0§.§1t9881s0§();
            }
            §1t251s0§.instance.§1t3521s0§();
            if(§1t1523s0§.§1t9766s0§)
            {
               §1t1523s0§.§1t9775s0§();
            }
         }
      }
      
      internal function §1t5004s0§() : *
      {
         this.§1t6216s0§.addEventListener(MouseEvent.CLICK,this.§1t6223s0§);
         this.§1t6217s0§.addEventListener(MouseEvent.CLICK,this.§1t6226s0§);
         this.§1t6214s0§.addEventListener(MouseEvent.CLICK,this.§1t6228s0§);
         this.moneybar.§1t5776s0§.addEventListener(MouseEvent.CLICK,this.§1t6225s0§);
      }
      
      internal function removeEventListeners() : *
      {
         this.§1t6216s0§.removeEventListener(MouseEvent.CLICK,this.§1t6223s0§);
         this.§1t6217s0§.removeEventListener(MouseEvent.CLICK,this.§1t6226s0§);
         this.§1t6214s0§.removeEventListener(MouseEvent.CLICK,this.§1t6228s0§);
         this.moneybar.§1t5776s0§.removeEventListener(MouseEvent.CLICK,this.§1t6225s0§);
      }
      
      internal function §1t6223s0§(param1:MouseEvent) : *
      {
         if(this.§1t6220s0§)
         {
            this.§1t6224s0§();
         }
         else if(§1t1523s0§.getLevel() < 10 && §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9426s0§) == 0)
         {
            this.§1t6224s0§();
         }
         else
         {
            this.§1t6213s0§.show(§1t1521s0§.getString(11135),this.§1t6224s0§);
         }
      }
      
      internal function §1t6224s0§() : *
      {
         if(!this.§1t6220s0§ && §1t1523s0§.getLevel() < 10 && §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9426s0§) == 0)
         {
            this.§1t6227s0§();
            return;
         }
         this.§1t6216s0§.visible = false;
         this.§1t6217s0§.visible = false;
         this.gold.visible = false;
         this.coin.visible = false;
         this.§1t6212s0§.visible = false;
         if(this.§1t6220s0§)
         {
            §1t251s0§.instance.§1t3511s0§();
            §1t88s0§.instance.§1t1516s0§("Snd_click");
         }
         else
         {
            §1t1523s0§.§1t9615s0§(1,function():*
            {
               §1t3317s0§.instance.§1t1986s0§(3,§1t1521s0§.getString(480),1);
               §1t6227s0§();
            },function():*
            {
               §1t6215s0§.show(1);
               §1t406s0§.instance.§1t6516s0§.§1t6778s0§();
               §1t6216s0§.visible = true;
               §1t6217s0§.visible = true;
               gold.visible = true;
               coin.visible = true;
               §1t6212s0§.visible = true;
               §1t88s0§.instance.§1t1516s0§("Snd_error");
            });
         }
      }
      
      internal function §1t6225s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         §1t406s0§.instance.§1t6498s0§.show();
      }
      
      internal function §1t6226s0§(param1:MouseEvent) : *
      {
         if(§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9412s0§) >= 1000)
         {
            §1t1523s0§.§1t9713s0§(§1t1523s0§.§1t9412s0§,-1000);
            if(§1t1523s0§.§1t9616s0§() >= this.§1t6222s0§)
            {
               §1t3318s0§.instance.§1t3409s0§(§1t1521s0§.getString(480));
            }
            this.§1t6227s0§();
         }
         else
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
         }
      }
      
      internal function §1t6227s0§() : *
      {
         §1t88s0§.instance.§1t1513s0§();
         this.removeEventListeners();
         this.§1t6219s0§ = true;
         §1t1525s0§.§1t9928s0§();
         §1t1540s0§.§1t9895s0§();
         this.§1t6219s0§ = false;
      }
      
      internal function §1t6228s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         this.§1t6219s0§ = false;
         this.removeEventListeners();
         this.urltext.visible = false;
         §1t1540s0§.§1t9895s0§();
      }
      
      public function §1t6229s0§() : Boolean
      {
         return this.§1t6219s0§;
      }
      
      public function §1t6230s0§(param1:String = "") : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_challenge");
         if(param1 == "")
         {
            this.urltext.text = "http://www.strawhatsamuraiduels.com/watch?name=" + §1t1523s0§.charname;
         }
         else
         {
            this.urltext.text = "http://www.strawhatsamuraiduels.com/watch?id=" + param1;
            this.§1t6214s0§.visible = true;
         }
         this.urltext.visible = true;
      }
   }
}

