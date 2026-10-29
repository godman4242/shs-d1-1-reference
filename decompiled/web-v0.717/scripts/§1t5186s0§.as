package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3584")]
   public class §1t5186s0§ extends MovieClip
   {
      
      public static var instance:§1t5186s0§;
      
      public var brushStroke:MovieClip;
      
      public var §1t6214s0§:§1t5000s0§;
      
      public var savereplaybutton:§1t5003s0§;
      
      public var urltext:TextField;
      
      public var winwords:MovieClip;
      
      public function §1t5186s0§()
      {
         super();
         addFrameScript(0,this.frame1,6,this.frame7,10,this.frame11);
         instance = this;
         this.§1t6214s0§.§1t5769s0§(§1t1521s0§.getString(482));
         this.savereplaybutton.§1t5769s0§(§1t1521s0§.getString(483));
      }
      
      public function §1t6384s0§() : *
      {
         if(§1t251s0§.instance.§1t3506s0§())
         {
            if(§1t5565s0§.instance.§1t5616s0§())
            {
               this.savereplaybutton.visible = false;
               this.§1t6214s0§.visible = false;
            }
            else
            {
               this.§1t6214s0§.visible = true;
               this.savereplaybutton.visible = true;
            }
         }
         else if(§1t113s0§.instance.§1t5222s0§())
         {
            this.§1t6214s0§.visible = true;
         }
      }
      
      public function show() : *
      {
         this.§1t6214s0§.visible = false;
         this.savereplaybutton.visible = false;
         this.urltext.visible = false;
         this.§1t5004s0§();
         visible = true;
         gotoAndPlay(1);
         if(!§1t113s0§.instance.§1t5222s0§())
         {
            this.winwords.gotoAndStop(1);
         }
         else
         {
            this.winwords.gotoAndStop(2);
         }
      }
      
      internal function §1t5004s0§() : *
      {
         this.savereplaybutton.addEventListener(MouseEvent.CLICK,this.§1t8030s0§);
         this.savereplaybutton.§1t5004s0§();
         this.§1t6214s0§.addEventListener(MouseEvent.CLICK,this.§1t6228s0§);
         this.§1t6214s0§.§1t5004s0§();
      }
      
      internal function removeEventListeners() : *
      {
         this.savereplaybutton.removeEventListener(MouseEvent.CLICK,this.§1t8030s0§);
         this.savereplaybutton.removeEventListeners();
         this.§1t6214s0§.removeEventListener(MouseEvent.CLICK,this.§1t6228s0§);
         this.§1t6214s0§.removeEventListeners();
      }
      
      internal function §1t8030s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         §1t251s0§.instance.§1t3511s0§();
         this.savereplaybutton.visible = false;
      }
      
      internal function §1t6228s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         this.removeEventListeners();
         §1t6427s0§.§1t12477s0§();
         this.urltext.visible = false;
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
      
      internal function frame1() : *
      {
         this.winwords.visible = false;
      }
      
      internal function frame7() : *
      {
         this.winwords.visible = true;
      }
      
      internal function frame11() : *
      {
         stop();
      }
   }
}

