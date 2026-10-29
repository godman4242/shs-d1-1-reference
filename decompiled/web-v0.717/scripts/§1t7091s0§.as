package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol905")]
   public class §1t7091s0§ extends MovieClip
   {
      
      public var autostartfield:TextField;
      
      public var autostartlabel:TextField;
      
      public var autostartnext:SimpleButton;
      
      public var autostartprev:SimpleButton;
      
      public var entryfeefield:TextField;
      
      public var entryfeelabel:TextField;
      
      public var entryfeenext:SimpleButton;
      
      public var entryfeeprev:SimpleButton;
      
      public var goldentokenicon:MovieClip;
      
      public var §1t5055s0§:MovieClip;
      
      public var maxlvlfield:TextField;
      
      public var maxlvllabel:TextField;
      
      public var maxlvlnext:SimpleButton;
      
      public var maxlvlprev:SimpleButton;
      
      public var minlvlfield:TextField;
      
      public var minlvllabel:TextField;
      
      public var minlvlnext:SimpleButton;
      
      public var minlvlprev:SimpleButton;
      
      public var playerfield:TextField;
      
      public var §1t6449s0§:TextField;
      
      public var playernext:SimpleButton;
      
      public var playerprev:SimpleButton;
      
      public var prizefield:TextField;
      
      public var prizelabel:TextField;
      
      public var rounddurationfield:TextField;
      
      public var rounddurationlabel:TextField;
      
      public var rounddurationnext:SimpleButton;
      
      public var rounddurationprev:SimpleButton;
      
      public var titlefield:TextField;
      
      public var titlelabel:TextField;
      
      internal var §1t7120s0§:int;
      
      internal var §1t7121s0§:int;
      
      internal var §1t7122s0§:int;
      
      internal var §1t7123s0§:int;
      
      internal var §1t7124s0§:Number;
      
      internal var §1t7125s0§:Boolean;
      
      public function §1t7091s0§()
      {
         super();
         §1t1521s0§.§1t9290s0§(this.titlelabel,true);
         this.titlelabel.text = §1t1521s0§.getString(11053);
         §1t1521s0§.§1t9290s0§(this.titlefield);
         §1t1521s0§.§1t9290s0§(this.§1t6449s0§,true);
         this.§1t6449s0§.text = §1t1521s0§.getString(11054);
         §1t1521s0§.§1t9290s0§(this.playerfield);
         §1t1521s0§.§1t9290s0§(this.entryfeelabel,true);
         this.entryfeelabel.text = §1t1521s0§.getString(11055);
         §1t1521s0§.§1t9290s0§(this.entryfeefield);
         §1t1521s0§.§1t9290s0§(this.minlvllabel,true);
         this.minlvllabel.text = §1t1521s0§.getString(11056);
         §1t1521s0§.§1t9290s0§(this.minlvlfield);
         §1t1521s0§.§1t9290s0§(this.maxlvllabel,true);
         this.maxlvllabel.text = §1t1521s0§.getString(11057);
         §1t1521s0§.§1t9290s0§(this.maxlvlfield);
         §1t1521s0§.§1t9290s0§(this.rounddurationlabel,true);
         this.rounddurationlabel.text = §1t1521s0§.getString(11058);
         §1t1521s0§.§1t9290s0§(this.rounddurationfield);
         §1t1521s0§.§1t9290s0§(this.prizelabel,true);
         this.prizelabel.text = §1t1521s0§.getString(11059);
         §1t1521s0§.§1t9290s0§(this.prizefield);
      }
      
      public function §1t5004s0§() : *
      {
         this.playerprev.addEventListener(MouseEvent.CLICK,this.§1t7126s0§);
         this.playernext.addEventListener(MouseEvent.CLICK,this.§1t7127s0§);
         this.entryfeeprev.addEventListener(MouseEvent.CLICK,this.§1t7128s0§);
         this.entryfeenext.addEventListener(MouseEvent.CLICK,this.§1t7129s0§);
         this.minlvlprev.addEventListener(MouseEvent.CLICK,this.§1t7130s0§);
         this.minlvlnext.addEventListener(MouseEvent.CLICK,this.§1t7131s0§);
         this.maxlvlprev.addEventListener(MouseEvent.CLICK,this.§1t7134s0§);
         this.maxlvlnext.addEventListener(MouseEvent.CLICK,this.§1t7135s0§);
         this.rounddurationprev.addEventListener(MouseEvent.CLICK,this.§1t7136s0§);
         this.rounddurationnext.addEventListener(MouseEvent.CLICK,this.§1t7137s0§);
         this.autostartprev.addEventListener(MouseEvent.CLICK,this.§1t7139s0§);
         this.autostartnext.addEventListener(MouseEvent.CLICK,this.§1t7140s0§);
         this.minlvlfield.addEventListener(Event.CHANGE,this.§1t7132s0§);
         this.maxlvlfield.addEventListener(Event.CHANGE,this.§1t7133s0§);
      }
      
      public function removeEventListeners() : *
      {
         this.playerprev.removeEventListener(MouseEvent.CLICK,this.§1t7126s0§);
         this.playernext.removeEventListener(MouseEvent.CLICK,this.§1t7127s0§);
         this.entryfeeprev.removeEventListener(MouseEvent.CLICK,this.§1t7128s0§);
         this.entryfeenext.removeEventListener(MouseEvent.CLICK,this.§1t7129s0§);
         this.minlvlprev.removeEventListener(MouseEvent.CLICK,this.§1t7130s0§);
         this.minlvlnext.removeEventListener(MouseEvent.CLICK,this.§1t7131s0§);
         this.maxlvlprev.removeEventListener(MouseEvent.CLICK,this.§1t7134s0§);
         this.maxlvlnext.removeEventListener(MouseEvent.CLICK,this.§1t7135s0§);
         this.rounddurationprev.removeEventListener(MouseEvent.CLICK,this.§1t7136s0§);
         this.rounddurationnext.removeEventListener(MouseEvent.CLICK,this.§1t7137s0§);
         this.autostartprev.removeEventListener(MouseEvent.CLICK,this.§1t7139s0§);
         this.autostartnext.removeEventListener(MouseEvent.CLICK,this.§1t7140s0§);
         this.minlvlfield.removeEventListener(Event.CHANGE,this.§1t7132s0§);
         this.maxlvlfield.removeEventListener(Event.CHANGE,this.§1t7133s0§);
      }
      
      internal function §1t7126s0§(param1:MouseEvent) : *
      {
         if(this.§1t7120s0§ == 16)
         {
            this.§1t7120s0§ = 8;
         }
         else if(this.§1t7120s0§ == 8)
         {
            this.§1t7120s0§ = 4;
         }
         else if(§1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9464s0§) && this.§1t7120s0§ == 4)
         {
            this.§1t7120s0§ = 2;
         }
         this.playerfield.text = this.§1t7120s0§.toString();
         this.§1t7141s0§();
      }
      
      internal function §1t7127s0§(param1:MouseEvent) : *
      {
         if(this.§1t7120s0§ == 2)
         {
            this.§1t7120s0§ = 4;
         }
         else if(this.§1t7120s0§ == 4)
         {
            this.§1t7120s0§ = 8;
         }
         else if(this.§1t7120s0§ == 8)
         {
            this.§1t7120s0§ = 16;
         }
         this.playerfield.text = this.§1t7120s0§.toString();
         this.§1t7141s0§();
      }
      
      internal function §1t7128s0§(param1:MouseEvent) : *
      {
         if(this.§1t7121s0§ > 0)
         {
            --this.§1t7121s0§;
         }
         this.entryfeefield.text = this.§1t7121s0§.toString();
         this.§1t7141s0§();
      }
      
      internal function §1t7129s0§(param1:MouseEvent) : *
      {
         if(this.§1t7121s0§ < 100)
         {
            ++this.§1t7121s0§;
         }
         this.entryfeefield.text = this.§1t7121s0§.toString();
         this.§1t7141s0§();
      }
      
      internal function §1t7130s0§(param1:MouseEvent) : *
      {
         if(this.minlvlfield.text == "")
         {
            this.minlvlfield.text = "5";
         }
         this.§1t7122s0§ = int(this.minlvlfield.text);
         if(this.§1t7122s0§ < 5 || this.§1t7122s0§ > 80)
         {
            this.§1t7122s0§ = 5;
         }
         if(this.§1t7122s0§ > 5)
         {
            --this.§1t7122s0§;
         }
         this.minlvlfield.text = this.§1t7122s0§.toString();
      }
      
      internal function §1t7131s0§(param1:MouseEvent) : *
      {
         if(this.minlvlfield.text == "")
         {
            this.minlvlfield.text = "5";
         }
         this.§1t7122s0§ = int(this.minlvlfield.text);
         if(this.§1t7122s0§ < 5 || this.§1t7122s0§ > 80)
         {
            this.§1t7122s0§ = 5;
         }
         if(this.§1t7122s0§ < 80)
         {
            ++this.§1t7122s0§;
         }
         this.minlvlfield.text = this.§1t7122s0§.toString();
      }
      
      internal function §1t7132s0§(param1:Event) : *
      {
         if(this.minlvlfield.text == "")
         {
            return;
         }
         this.§1t7122s0§ = int(this.minlvlfield.text);
         if(this.§1t7122s0§ <= 0 || this.§1t7122s0§ > 80)
         {
            this.§1t7122s0§ = 5;
            this.minlvlfield.text = this.§1t7122s0§.toString();
         }
      }
      
      internal function §1t7133s0§(param1:Event) : *
      {
         if(this.maxlvlfield.text == "")
         {
            return;
         }
         this.§1t7123s0§ = int(this.maxlvlfield.text);
         if(this.§1t7123s0§ <= 0 || this.§1t7123s0§ > 80)
         {
            this.§1t7123s0§ = 80;
            this.maxlvlfield.text = this.§1t7123s0§.toString();
         }
      }
      
      internal function §1t7134s0§(param1:MouseEvent) : *
      {
         if(this.maxlvlfield.text == "")
         {
            this.maxlvlfield.text = "80";
         }
         this.§1t7123s0§ = int(this.maxlvlfield.text);
         if(this.§1t7123s0§ < 5 || this.§1t7123s0§ > 80)
         {
            this.§1t7123s0§ = 80;
         }
         if(this.§1t7123s0§ > 5)
         {
            --this.§1t7123s0§;
         }
         this.maxlvlfield.text = this.§1t7123s0§.toString();
      }
      
      internal function §1t7135s0§(param1:MouseEvent) : *
      {
         if(this.maxlvlfield.text == "")
         {
            this.maxlvlfield.text = "80";
         }
         this.§1t7123s0§ = int(this.maxlvlfield.text);
         if(this.§1t7123s0§ < 5 || this.§1t7123s0§ > 80)
         {
            this.§1t7123s0§ = 80;
         }
         if(this.§1t7123s0§ < 80)
         {
            ++this.§1t7123s0§;
         }
         this.maxlvlfield.text = this.§1t7123s0§.toString();
      }
      
      internal function §1t7136s0§(param1:MouseEvent) : *
      {
         if(this.§1t7124s0§ == 48)
         {
            this.§1t7124s0§ = 24;
         }
         else if(this.§1t7124s0§ == 24)
         {
            this.§1t7124s0§ = 2;
         }
         else if(this.§1t7124s0§ == 2)
         {
            this.§1t7124s0§ = 1;
         }
         else if(this.§1t7124s0§ == 1)
         {
            this.§1t7124s0§ = 0.5;
         }
         else if(§1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9464s0§) && this.§1t7124s0§ == 0.5)
         {
            this.§1t7124s0§ = 0;
         }
         if(this.§1t7124s0§ == 0)
         {
            this.rounddurationfield.text = "-";
         }
         else if(this.§1t7124s0§ == 0.5)
         {
            this.rounddurationfield.text = §1t1521s0§.getString(11052,["30"]);
         }
         else
         {
            this.rounddurationfield.text = §1t1521s0§.getString(11051,[this.§1t7124s0§.toString()]);
         }
      }
      
      internal function §1t7137s0§(param1:MouseEvent) : *
      {
         if(this.§1t7124s0§ == 0)
         {
            this.§1t7124s0§ = 0.5;
         }
         else if(this.§1t7124s0§ == 0.5)
         {
            this.§1t7124s0§ = 1;
         }
         else if(this.§1t7124s0§ == 1)
         {
            this.§1t7124s0§ = 2;
         }
         else if(this.§1t7124s0§ == 2)
         {
            this.§1t7124s0§ = 24;
         }
         else if(this.§1t7124s0§ == 24)
         {
            this.§1t7124s0§ = 48;
         }
         if(this.§1t7124s0§ == 0)
         {
            this.rounddurationfield.text = "-";
         }
         else if(this.§1t7124s0§ == 0.5)
         {
            this.rounddurationfield.text = §1t1521s0§.getString(11052,["30"]);
         }
         else
         {
            this.rounddurationfield.text = §1t1521s0§.getString(11051,[this.§1t7124s0§.toString()]);
         }
      }
      
      public function §1t7138s0§() : int
      {
         return this.§1t7124s0§ * 60 * 60;
      }
      
      internal function §1t7139s0§(param1:MouseEvent) : *
      {
         this.§1t7125s0§ = !this.§1t7125s0§;
         if(this.§1t7125s0§)
         {
            this.autostartfield.text = §1t1521s0§.getString(1);
         }
         else
         {
            this.autostartfield.text = §1t1521s0§.getString(0);
         }
      }
      
      internal function §1t7140s0§(param1:MouseEvent) : *
      {
         this.§1t7125s0§ = !this.§1t7125s0§;
         if(this.§1t7125s0§)
         {
            this.autostartfield.text = §1t1521s0§.getString(1);
         }
         else
         {
            this.autostartfield.text = §1t1521s0§.getString(0);
         }
      }
      
      internal function §1t7141s0§() : *
      {
         var _loc1_:int = Math.floor((this.§1t7121s0§ * this.§1t7120s0§ + 5) * 0.75 / 7);
         var _loc2_:int = _loc1_ * 4;
         var _loc3_:int = _loc1_ * 2;
         var _loc4_:int = _loc1_;
         this.prizefield.text = _loc2_ + " / " + _loc3_ + " / " + _loc4_;
      }
      
      public function show() : *
      {
         if(!visible)
         {
            this.§1t5004s0§();
            visible = true;
            this.titlefield.text = "";
            this.playerfield.text = "8";
            this.entryfeefield.text = "5";
            this.minlvlfield.text = "5";
            this.maxlvlfield.text = "80";
            this.rounddurationfield.text = §1t1521s0§.getString(11051,["1"]);
            this.§1t7141s0§();
            this.§1t7120s0§ = 8;
            this.§1t7121s0§ = 5;
            this.§1t7122s0§ = 5;
            this.§1t7123s0§ = 80;
            this.§1t7124s0§ = 1;
            this.§1t7125s0§ = true;
         }
      }
      
      public function §1t7142s0§() : Boolean
      {
         if(this.titlefield.text == "" || this.minlvlfield.text == "" || this.maxlvlfield.text == "")
         {
            return false;
         }
         return true;
      }
      
      public function §1t7143s0§() : Boolean
      {
         if(this.minlvlfield.text == "" || this.§1t7122s0§ < 5)
         {
            this.§1t7122s0§ = 5;
            this.minlvlfield.text = "5";
         }
         if(this.maxlvlfield.text == "" || this.§1t7123s0§ < 5)
         {
            this.§1t7123s0§ = 5;
            this.maxlvlfield.text = "5";
         }
         if(this.§1t7122s0§ > this.§1t7123s0§)
         {
            return false;
         }
         return true;
      }
      
      public function hide() : *
      {
         if(visible)
         {
            this.removeEventListeners();
            visible = false;
         }
      }
   }
}

