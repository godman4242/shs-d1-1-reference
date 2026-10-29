package
{
   import flash.display.MovieClip;
   import flash.display.StageQuality;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1348")]
   public class §1t6422s0§ extends MovieClip
   {
      
      public var backtomainmenubutton:§1t5000s0§;
      
      public var bloodcheck:§1t6409s0§;
      
      public var chatcheck:§1t6409s0§;
      
      public var §1t5017s0§:§1t5003s0§;
      
      public var fullscreencheck:§1t6409s0§;
      
      public var musiccheck:§1t6409s0§;
      
      public var §1t6159s0§:§1t6160s0§;
      
      public var quitdialog:§1t6425s0§;
      
      public var recordcheck:§1t6409s0§;
      
      public var soundcheck:§1t6409s0§;
      
      public var §1t5021s0§:TextField;
      
      public function §1t6422s0§()
      {
         super();
         this.musiccheck.§1t5769s0§(§1t1521s0§.getString(6));
         this.soundcheck.§1t5769s0§(§1t1521s0§.getString(7));
         this.bloodcheck.§1t5769s0§(§1t1521s0§.getString(8));
         this.chatcheck.§1t5769s0§(§1t1521s0§.getString(396));
         this.recordcheck.§1t5769s0§(§1t1521s0§.getString(492));
         this.fullscreencheck.§1t5769s0§(§1t1521s0§.getString(752));
         this.backtomainmenubutton.§1t5769s0§(§1t1521s0§.getString(74));
         this.§1t5017s0§.§1t5769s0§(§1t1521s0§.getString(75));
         §1t1521s0§.§1t9290s0§(this.§1t5021s0§,true);
         this.§1t5021s0§.text = §1t1521s0§.getString(10);
         if(§1t1523s0§.§1t9475s0§)
         {
            this.bloodcheck.visible = false;
         }
         if(§1t1523s0§.§1t9528s0§ || §1t1523s0§.§1t9521s0§)
         {
            this.fullscreencheck.visible = false;
         }
      }
      
      public function show() : *
      {
         §1t406s0§.instance.§1t6575s0§(false);
         this.visible = true;
         this.§1t5004s0§();
         §1t6427s0§.§1t8196s0§(false);
         this.quitdialog.visible = false;
         if(§1t1540s0§.§1t9550s0§())
         {
            §1t251s0§.instance.§1t3532s0§(true);
         }
      }
      
      internal function §1t5004s0§() : *
      {
         this.backtomainmenubutton.addEventListener(MouseEvent.CLICK,this.§1t6426s0§);
         this.backtomainmenubutton.§1t5004s0§();
         this.musiccheck.§1t5004s0§();
         this.soundcheck.§1t5004s0§();
         this.bloodcheck.§1t5004s0§();
         this.chatcheck.§1t5004s0§();
         this.recordcheck.§1t5004s0§();
         this.fullscreencheck.§1t5004s0§();
         this.musiccheck.addEventListener(MouseEvent.CLICK,this.§1t6416s0§);
         this.soundcheck.addEventListener(MouseEvent.CLICK,this.§1t6417s0§);
         this.bloodcheck.addEventListener(MouseEvent.CLICK,this.§1t6418s0§);
         this.chatcheck.addEventListener(MouseEvent.CLICK,this.§1t6419s0§);
         this.recordcheck.addEventListener(MouseEvent.CLICK,this.§1t6420s0§);
         this.fullscreencheck.addEventListener(MouseEvent.CLICK,this.§1t6421s0§);
         this.§1t5017s0§.addEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         this.§1t5017s0§.§1t5004s0§();
         this.musiccheck.§1t5041s0§(§1t88s0§.instance.§1t1486s0§);
         this.soundcheck.§1t5041s0§(§1t88s0§.instance.§1t1485s0§);
         this.bloodcheck.§1t5041s0§(!§1t1523s0§.§1t9471s0§);
         this.chatcheck.§1t5041s0§(§1t1523s0§.§1t9472s0§);
         this.recordcheck.§1t5041s0§(§1t1523s0§.§1t9473s0§);
         this.fullscreencheck.§1t5041s0§(§1t1523s0§.§1t9476s0§);
         this.§1t6159s0§.§1t5004s0§();
         this.§1t6159s0§.addEventListener(MouseEvent.CLICK,this.§1t6169s0§);
         this.§1t6170s0§();
      }
      
      internal function removeEventListeners() : *
      {
         this.backtomainmenubutton.removeEventListener(MouseEvent.CLICK,this.§1t6426s0§);
         this.backtomainmenubutton.removeEventListeners();
         this.musiccheck.removeEventListeners();
         this.soundcheck.removeEventListeners();
         this.bloodcheck.removeEventListeners();
         this.chatcheck.removeEventListeners();
         this.recordcheck.removeEventListeners();
         this.fullscreencheck.removeEventListeners();
         this.musiccheck.removeEventListener(MouseEvent.CLICK,this.§1t6416s0§);
         this.soundcheck.removeEventListener(MouseEvent.CLICK,this.§1t6417s0§);
         this.bloodcheck.removeEventListener(MouseEvent.CLICK,this.§1t6418s0§);
         this.chatcheck.removeEventListener(MouseEvent.CLICK,this.§1t6419s0§);
         this.recordcheck.removeEventListener(MouseEvent.CLICK,this.§1t6420s0§);
         this.fullscreencheck.removeEventListener(MouseEvent.CLICK,this.§1t6421s0§);
         this.§1t5017s0§.removeEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         this.§1t5017s0§.removeEventListeners();
         this.§1t6159s0§.removeEventListeners();
         this.§1t6159s0§.removeEventListener(MouseEvent.CLICK,this.§1t6169s0§);
      }
      
      internal function §1t6416s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         this.musiccheck.§1t5042s0§();
         §1t88s0§.instance.§1t1497s0§();
      }
      
      internal function §1t6417s0§(param1:MouseEvent) : *
      {
         this.soundcheck.§1t5042s0§();
         §1t88s0§.instance.§1t1498s0§();
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
      }
      
      internal function §1t6418s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         this.bloodcheck.§1t5042s0§();
         §1t1523s0§.§1t9533s0§();
      }
      
      internal function §1t6419s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         this.chatcheck.§1t5042s0§();
         §1t1523s0§.§1t9535s0§();
      }
      
      internal function §1t6420s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         this.recordcheck.§1t5042s0§();
         §1t1523s0§.§1t9536s0§();
      }
      
      internal function §1t6421s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         this.fullscreencheck.§1t5042s0§();
         §1t1523s0§.§1t9539s0§();
         if(§1t1523s0§.§1t9476s0§)
         {
            §1t1540s0§.§1t10017s0§();
         }
         else
         {
            §1t1540s0§.§1t10018s0§();
         }
      }
      
      internal function §1t6426s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         this.quitdialog.visible = true;
         this.quitdialog.§1t5773s0§();
      }
      
      public function §1t5026s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_back");
         this.removeEventListeners();
         this.visible = false;
         §1t3317s0§.instance.§1t1946s0§();
         if(§1t406s0§.instance.§1t6509s0§.visible)
         {
            §1t412s0§.instance.§1t7618s0§();
         }
         else if(§1t1540s0§.§1t10014s0§())
         {
            §1t406s0§.§1t9190s0§().§1t6612s0§();
         }
         else
         {
            §1t406s0§.§1t9190s0§().§1t6610s0§();
            §1t1541s0§.§1t10045s0§();
            §1t251s0§.instance.§1t3532s0§(false);
         }
      }
      
      internal function §1t6169s0§(param1:MouseEvent) : *
      {
         var _loc2_:String = §1t1540s0§.§1t10025s0§().quality;
         if(_loc2_ == StageQuality.BEST.toUpperCase())
         {
            §1t1540s0§.§1t10025s0§().quality = StageQuality.HIGH.toUpperCase();
         }
         else if(_loc2_ == StageQuality.HIGH.toUpperCase())
         {
            §1t1540s0§.§1t10025s0§().quality = StageQuality.MEDIUM.toUpperCase();
         }
         else if(_loc2_ == StageQuality.MEDIUM.toUpperCase())
         {
            §1t1540s0§.§1t10025s0§().quality = StageQuality.BEST.toUpperCase();
         }
         else if(_loc2_ == StageQuality.LOW.toUpperCase())
         {
            §1t1540s0§.§1t10025s0§().quality = StageQuality.BEST.toUpperCase();
         }
         this.§1t6170s0§();
      }
      
      internal function §1t6170s0§() : *
      {
         var _loc1_:String = §1t1540s0§.§1t10025s0§().quality;
         if(_loc1_ == StageQuality.BEST.toUpperCase())
         {
            this.§1t6159s0§.§1t5769s0§("Quality: Best");
         }
         else if(_loc1_ == StageQuality.HIGH.toUpperCase())
         {
            this.§1t6159s0§.§1t5769s0§("Quality: High");
         }
         else if(_loc1_ == StageQuality.MEDIUM.toUpperCase())
         {
            this.§1t6159s0§.§1t5769s0§("Quality: Medium");
         }
         else if(_loc1_ == StageQuality.LOW.toUpperCase())
         {
            this.§1t6159s0§.§1t5769s0§("Quality: Low");
         }
      }
   }
}

