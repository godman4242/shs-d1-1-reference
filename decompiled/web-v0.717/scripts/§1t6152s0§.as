package
{
   import flash.display.MovieClip;
   import flash.display.StageQuality;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3478")]
   public class §1t6152s0§ extends MovieClip
   {
      
      public var §1t6153s0§:TextField;
      
      public var button_hitarea:§1t5267s0§;
      
      public var §1t6155s0§:§1t5050s0§;
      
      public var §1t6156s0§:§1t5852s0§;
      
      public var §1t6138s0§:§1t6059s0§;
      
      public var logoutbutton:§1t5050s0§;
      
      public var §1t6158s0§:§1t5852s0§;
      
      public var §1t6159s0§:§1t6160s0§;
      
      public var §1t6161s0§:§1t5852s0§;
      
      public var §1t6162s0§:§1t5852s0§;
      
      public function §1t6152s0§()
      {
         super();
         this.logoutbutton.§1t5769s0§(§1t1521s0§.getString(26));
         this.§1t6155s0§.§1t5769s0§(§1t1521s0§.getString(384));
         this.§1t6162s0§.§1t5769s0§(§1t1521s0§.getString(27));
         this.§1t6161s0§.§1t5769s0§(§1t1521s0§.getString(28));
         this.§1t6156s0§.§1t5769s0§(§1t1521s0§.getString(624));
         this.§1t6158s0§.§1t5769s0§(§1t1521s0§.getString(29));
         §1t1521s0§.§1t9290s0§(this.§1t6153s0§);
         this.button_hitarea.visible = false;
      }
      
      public function §1t5339s0§() : *
      {
         this.§1t6162s0§.addEventListener(MouseEvent.CLICK,this.§1t6164s0§);
         this.§1t6161s0§.addEventListener(MouseEvent.CLICK,this.§1t6165s0§);
         this.§1t6156s0§.addEventListener(MouseEvent.CLICK,this.§1t6168s0§);
         this.§1t6158s0§.addEventListener(MouseEvent.CLICK,this.§1t6166s0§);
         this.logoutbutton.addEventListener(MouseEvent.CLICK,this.§1t1856s0§);
         this.logoutbutton.§1t5004s0§();
         this.§1t6155s0§.addEventListener(MouseEvent.CLICK,this.§1t6167s0§);
         this.§1t6155s0§.§1t5004s0§();
         this.§1t6162s0§.§1t5004s0§();
         this.§1t6161s0§.§1t5004s0§();
         this.§1t6158s0§.§1t5004s0§();
         this.§1t6156s0§.§1t5004s0§();
         this.§1t6138s0§.§1t5004s0§();
         this.§1t6159s0§.§1t5004s0§();
         this.§1t6159s0§.addEventListener(MouseEvent.CLICK,this.§1t6169s0§);
         this.§1t6170s0§();
         if(§1t1523s0§.§1t9497s0§ || §1t3318s0§.instance.§1t3327s0§ || §1t1523s0§.§1t9521s0§ || §1t1523s0§.§1t9522s0§ || §1t1523s0§.§1t9523s0§)
         {
            this.logoutbutton.visible = false;
         }
         else
         {
            this.logoutbutton.visible = true;
         }
         if(§1t1523s0§.§1t9503s0§)
         {
            this.§1t6155s0§.visible = false;
            this.logoutbutton.x = this.§1t6155s0§.x;
            this.logoutbutton.hitArea = this.button_hitarea;
         }
         else
         {
            this.§1t6155s0§.visible = true;
         }
         this.§1t6138s0§.visible = §1t1523s0§.§1t9512s0§;
      }
      
      internal function §1t5340s0§() : *
      {
         this.§1t6162s0§.removeEventListener(MouseEvent.CLICK,this.§1t6164s0§);
         this.§1t6161s0§.removeEventListener(MouseEvent.CLICK,this.§1t6165s0§);
         this.§1t6156s0§.removeEventListener(MouseEvent.CLICK,this.§1t6168s0§);
         this.§1t6158s0§.removeEventListener(MouseEvent.CLICK,this.§1t6166s0§);
         this.logoutbutton.removeEventListener(MouseEvent.CLICK,this.§1t1856s0§);
         this.logoutbutton.removeEventListeners();
         this.§1t6155s0§.removeEventListener(MouseEvent.CLICK,this.§1t6167s0§);
         this.§1t6155s0§.removeEventListeners();
         this.§1t6162s0§.removeEventListeners();
         this.§1t6161s0§.removeEventListeners();
         this.§1t6158s0§.removeEventListeners();
         this.§1t6156s0§.removeEventListeners();
         this.§1t6138s0§.removeEventListeners();
         this.§1t6159s0§.removeEventListeners();
         this.§1t6159s0§.removeEventListener(MouseEvent.CLICK,this.§1t6169s0§);
      }
      
      internal function §1t6163s0§() : *
      {
         this.§1t6153s0§.text = §1t3317s0§.instance.username + " " + §1t1521s0§.getString(30);
      }
      
      internal function §1t6164s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_challenge");
         if(§1t1523s0§.§1t9476s0§)
         {
            §1t1540s0§.§1t10017s0§();
         }
         §1t1540s0§.§1t10035s0§();
         this.§1t5340s0§();
         §1t3318s0§.instance.§1t3360s0§();
      }
      
      internal function §1t6165s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         this.§1t5340s0§();
         §1t7017s0§.instance.§1t7036s0§();
      }
      
      internal function §1t6166s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         this.§1t5340s0§();
         §1t7017s0§.instance.§1t7035s0§();
      }
      
      internal function §1t6167s0§(param1:MouseEvent) : void
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         this.§1t5340s0§();
         §1t7017s0§.instance.§1t7032s0§();
      }
      
      internal function §1t1856s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_back");
         this.§1t5340s0§();
         §1t7017s0§.instance.§1t7039s0§();
         this.visible = false;
         §1t3317s0§.instance.§1t1856s0§();
         §1t7017s0§.instance.§1t7030s0§();
         §1t7017s0§.instance.login.§1t6145s0§();
      }
      
      internal function §1t6168s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         param1.stopPropagation();
         §1t88s0§.instance.§1t1500s0§();
         new §1t103s0§(true);
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
            this.§1t6159s0§.§1t5769s0§(§1t1521s0§.getString(11454));
         }
         else if(_loc1_ == StageQuality.HIGH.toUpperCase())
         {
            this.§1t6159s0§.§1t5769s0§(§1t1521s0§.getString(11455));
         }
         else if(_loc1_ == StageQuality.MEDIUM.toUpperCase())
         {
            this.§1t6159s0§.§1t5769s0§(§1t1521s0§.getString(11456));
         }
         else if(_loc1_ == StageQuality.LOW.toUpperCase())
         {
            this.§1t6159s0§.§1t5769s0§(§1t1521s0§.getString(11147));
         }
      }
   }
}

