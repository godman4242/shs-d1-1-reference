package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3561")]
   public class §1t5181s0§ extends MovieClip
   {
      
      public static var instance:§1t5181s0§;
      
      public var §1t6214s0§:§1t5000s0§;
      
      public var §1t6216s0§:§1t5003s0§;
      
      public var words:TextField;
      
      internal var winner:int;
      
      internal var taunt:String;
      
      internal var displaytext:String = "";
      
      public function §1t5181s0§()
      {
         super();
         addFrameScript(6,this.frame7,9,this.frame10,10,this.frame11,59,this.frame60);
         instance = this;
         this.§1t6214s0§.§1t5769s0§(§1t1521s0§.getString(482));
      }
      
      public function §1t6732s0§(param1:String, param2:String, param3:int) : *
      {
         this.displaytext = §1t1521s0§.getString(293,[param1]);
         this.winner = param3;
         this.taunt = param2;
      }
      
      public function §1t5221s0§() : *
      {
         this.displaytext = §1t1521s0§.getString(394);
         this.winner = 0;
      }
      
      public function §1t6733s0§() : String
      {
         return this.displaytext;
      }
      
      public function §1t6384s0§() : *
      {
         if(!§1t1540s0§.§1t10062s0§())
         {
            this.§1t6214s0§.visible = true;
         }
      }
      
      public function §1t6734s0§() : *
      {
         this.§1t6216s0§.visible = true;
         §1t406s0§.instance.§1t6516s0§.visible = false;
      }
      
      public function show() : *
      {
         this.§1t6214s0§.visible = false;
         this.§1t6216s0§.visible = false;
         this.§1t5004s0§();
         visible = true;
         gotoAndPlay(1);
         if(this.winner != 0)
         {
            §1t406s0§.instance.§1t6516s0§.show(this.winner,this.taunt);
            §1t406s0§.instance.§1t6516s0§.§1t6779s0§();
         }
         if(§1t1540s0§.§1t10062s0§())
         {
            this.§1t6216s0§.§1t5769s0§(§1t1521s0§.getString(668));
            this.§1t6216s0§.y = this.§1t6214s0§.y;
         }
      }
      
      internal function §1t5004s0§() : *
      {
         this.§1t6216s0§.addEventListener(MouseEvent.CLICK,this.§1t6223s0§);
         this.§1t6216s0§.§1t5004s0§();
         this.§1t6214s0§.addEventListener(MouseEvent.CLICK,this.§1t6228s0§);
         this.§1t6214s0§.§1t5004s0§();
      }
      
      internal function removeEventListeners() : *
      {
         this.§1t6216s0§.removeEventListener(MouseEvent.CLICK,this.§1t6223s0§);
         this.§1t6216s0§.removeEventListeners();
         this.§1t6214s0§.removeEventListener(MouseEvent.CLICK,this.§1t6228s0§);
         this.§1t6214s0§.removeEventListeners();
      }
      
      internal function §1t6223s0§(param1:MouseEvent) : *
      {
         this.removeEventListeners();
         if(§1t1540s0§.§1t10062s0§())
         {
            §1t3317s0§.instance.§1t2016s0§();
         }
         else
         {
            §1t1540s0§.§1t9895s0§();
         }
      }
      
      internal function §1t6228s0§(param1:MouseEvent) : *
      {
         this.removeEventListeners();
         §1t1540s0§.§1t9895s0§();
      }
      
      internal function frame7() : *
      {
         §1t1521s0§.§1t9290s0§(this.words);
         this.words.text = this.§1t6733s0§();
      }
      
      internal function frame10() : *
      {
         §1t1521s0§.§1t9290s0§(this.words);
         this.words.text = this.§1t6733s0§();
      }
      
      internal function frame11() : *
      {
         §1t1521s0§.§1t9290s0§(this.words);
         this.words.text = this.§1t6733s0§();
         if(!§1t1540s0§.§1t10062s0§())
         {
            stop();
         }
         this.§1t6384s0§();
      }
      
      internal function frame60() : *
      {
         stop();
         this.§1t6734s0§();
      }
   }
}

