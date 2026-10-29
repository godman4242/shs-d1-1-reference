package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3464")]
   public class §1t6407s0§ extends MovieClip
   {
      
      public var bloodcheck:§1t6409s0§;
      
      public var chardeleteform:§1t5331s0§;
      
      public var chatcheck:§1t6409s0§;
      
      public var §1t6411s0§:§1t5852s0§;
      
      public var fullscreencheck:§1t6409s0§;
      
      public var gobackbutton:§1t5334s0§;
      
      public var musiccheck:§1t6409s0§;
      
      public var recordcheck:§1t6409s0§;
      
      public var soundcheck:§1t6409s0§;
      
      public var §1t5021s0§:TextField;
      
      public function §1t6407s0§()
      {
         super();
         this.musiccheck.§1t5769s0§(§1t1521s0§.getString(6));
         this.soundcheck.§1t5769s0§(§1t1521s0§.getString(7));
         this.bloodcheck.§1t5769s0§(§1t1521s0§.getString(8));
         this.chatcheck.§1t5769s0§(§1t1521s0§.getString(396));
         this.recordcheck.§1t5769s0§(§1t1521s0§.getString(492));
         this.fullscreencheck.§1t5769s0§(§1t1521s0§.getString(752));
         this.gobackbutton.§1t5769s0§(§1t1521s0§.getString(9));
         §1t1521s0§.§1t9290s0§(this.§1t5021s0§,true);
         this.§1t5021s0§.text = §1t1521s0§.getString(10);
         this.§1t6411s0§.§1t5769s0§(§1t1521s0§.getString(183));
         if(§1t1523s0§.§1t9475s0§)
         {
            this.bloodcheck.visible = false;
         }
         this.chardeleteform.visible = false;
         if(§1t1523s0§.§1t9528s0§ || §1t1523s0§.§1t9521s0§)
         {
            this.fullscreencheck.visible = false;
         }
      }
      
      public function §1t5339s0§() : *
      {
         this.musiccheck.§1t5004s0§();
         this.soundcheck.§1t5004s0§();
         this.bloodcheck.§1t5004s0§();
         this.chatcheck.§1t5004s0§();
         this.recordcheck.§1t5004s0§();
         this.fullscreencheck.§1t5004s0§();
         this.§1t6411s0§.§1t5004s0§();
         this.musiccheck.addEventListener(MouseEvent.CLICK,this.§1t6416s0§);
         this.soundcheck.addEventListener(MouseEvent.CLICK,this.§1t6417s0§);
         this.bloodcheck.addEventListener(MouseEvent.CLICK,this.§1t6418s0§);
         this.chatcheck.addEventListener(MouseEvent.CLICK,this.§1t6419s0§);
         this.recordcheck.addEventListener(MouseEvent.CLICK,this.§1t6420s0§);
         this.fullscreencheck.addEventListener(MouseEvent.CLICK,this.§1t6421s0§);
         this.§1t6411s0§.addEventListener(MouseEvent.CLICK,this.§1t5350s0§);
         this.gobackbutton.addEventListener(MouseEvent.CLICK,this.§1t5341s0§);
         this.gobackbutton.§1t5004s0§();
         this.musiccheck.§1t5041s0§(§1t88s0§.instance.§1t1486s0§);
         this.soundcheck.§1t5041s0§(§1t88s0§.instance.§1t1485s0§);
         this.bloodcheck.§1t5041s0§(!§1t1523s0§.§1t9471s0§);
         this.chatcheck.§1t5041s0§(§1t1523s0§.§1t9472s0§);
         this.recordcheck.§1t5041s0§(§1t1523s0§.§1t9473s0§);
         this.fullscreencheck.§1t5041s0§(§1t1523s0§.§1t9476s0§);
         if(§1t3318s0§.instance.§1t3379s0§())
         {
            this.§1t6411s0§.visible = false;
         }
         else
         {
            this.§1t6411s0§.visible = true;
         }
      }
      
      internal function §1t5340s0§() : *
      {
         this.musiccheck.removeEventListeners();
         this.soundcheck.removeEventListeners();
         this.bloodcheck.removeEventListeners();
         this.chatcheck.removeEventListeners();
         this.recordcheck.removeEventListeners();
         this.fullscreencheck.removeEventListeners();
         this.§1t6411s0§.removeEventListeners();
         this.musiccheck.removeEventListener(MouseEvent.CLICK,this.§1t6416s0§);
         this.soundcheck.removeEventListener(MouseEvent.CLICK,this.§1t6417s0§);
         this.bloodcheck.removeEventListener(MouseEvent.CLICK,this.§1t6418s0§);
         this.chatcheck.removeEventListener(MouseEvent.CLICK,this.§1t6419s0§);
         this.recordcheck.removeEventListener(MouseEvent.CLICK,this.§1t6420s0§);
         this.fullscreencheck.removeEventListener(MouseEvent.CLICK,this.§1t6421s0§);
         this.§1t6411s0§.removeEventListener(MouseEvent.CLICK,this.§1t5350s0§);
         this.gobackbutton.removeEventListener(MouseEvent.CLICK,this.§1t5341s0§);
         this.gobackbutton.removeEventListeners();
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
      }
      
      internal function §1t5341s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_back");
         this.§1t5340s0§();
         §1t7017s0§.instance.§1t7034s0§();
      }
      
      internal function §1t5350s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         this.§1t5340s0§();
         §1t3318s0§.instance.§1t3378s0§();
      }
   }
}

