package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol615")]
   public class §1t7722s0§ extends MovieClip
   {
      
      public var blueside:MovieClip;
      
      public var §1t7724s0§:§1t5050s0§;
      
      public var §1t7725s0§:MovieClip;
      
      public var greenside:MovieClip;
      
      public var msgText:TextField;
      
      public var §1t7727s0§:TextField;
      
      public var randomside:MovieClip;
      
      public var redside:MovieClip;
      
      public var §1t5019s0§:§1t4912s0§;
      
      public var §1t5020s0§:§1t4912s0§;
      
      public var sidedesc:TextField;
      
      public var sidename:TextField;
      
      public var yellowside:MovieClip;
      
      internal var §1t7733s0§:MovieClip = null;
      
      internal var §1t7734s0§:Array = new Array(5);
      
      internal var §1t7735s0§:Array = new Array(5);
      
      public function §1t7722s0§()
      {
         super();
         §1t1521s0§.§1t9290s0§(this.msgText,true);
         §1t1521s0§.§1t9290s0§(this.sidename,true);
         §1t1521s0§.§1t9290s0§(this.sidedesc,false);
         §1t1521s0§.§1t9290s0§(this.§1t7727s0§,true);
         this.msgText.text = §1t1521s0§.getString(321);
         this.§1t7734s0§ = new Array();
         this.§1t7734s0§[0] = this.redside;
         this.§1t7734s0§[1] = this.greenside;
         this.§1t7734s0§[2] = this.blueside;
         this.§1t7734s0§[3] = this.yellowside;
         this.§1t7734s0§[4] = this.randomside;
         this.§1t7724s0§.§1t5769s0§(§1t1521s0§.getString(323));
         this.§1t7727s0§.text = §1t1521s0§.getString(385);
      }
      
      public function show() : *
      {
         visible = true;
         var _loc1_:int = 0;
         while(_loc1_ < this.§1t7734s0§.length)
         {
            this.§1t7734s0§[_loc1_].gotoAndStop("mouseout");
            this.§1t7734s0§[_loc1_].buttonMode = true;
            this.§1t7735s0§[_loc1_] = 0;
            _loc1_++;
         }
         this.§1t5004s0§();
         this.§1t5020s0§.visible = false;
         this.§1t5019s0§.visible = false;
         this.sidename.text = "";
         this.sidedesc.text = "";
         this.§1t7724s0§.visible = false;
         this.§1t7725s0§.visible = false;
         this.§1t7733s0§ = null;
         this.§1t7727s0§.visible = false;
         §1t406s0§.instance.§1t6482s0§.§1t8024s0§();
         §1t3317s0§.instance.§1t1897s0§();
      }
      
      public function §1t7736s0§(param1:int, param2:int, param3:int, param4:int) : *
      {
         §1t406s0§.instance.§1t6482s0§.§1t8025s0§();
         this.§1t7735s0§[0] = param1;
         this.§1t7735s0§[1] = param2;
         this.§1t7735s0§[2] = param3;
         this.§1t7735s0§[3] = param4;
         this.§1t7735s0§[4] = (param1 + param2 + param3 + param4) / 4 + (param1 + param2 + param3 + param4) / 16;
         if(this.§1t7735s0§[4] < 10)
         {
            this.§1t7735s0§[4] = 20;
         }
         this.§1t7737s0§();
      }
      
      public function hide() : *
      {
         visible = false;
         this.removeEventListeners();
      }
      
      public function §1t5004s0§() : *
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§1t7734s0§.length)
         {
            this.§1t7734s0§[_loc1_].addEventListener(MouseEvent.CLICK,this.§1t5484s0§,false,0,true);
            this.§1t7734s0§[_loc1_].addEventListener(MouseEvent.ROLL_OVER,this.§1t7739s0§,false,0,true);
            this.§1t7734s0§[_loc1_].addEventListener(MouseEvent.ROLL_OUT,this.§1t7740s0§,false,0,true);
            _loc1_++;
         }
         this.§1t7724s0§.addEventListener(MouseEvent.CLICK,this.§1t7741s0§);
         this.§1t7724s0§.§1t5004s0§();
      }
      
      public function removeEventListeners() : *
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§1t7734s0§.length)
         {
            this.§1t7734s0§[_loc1_].removeEventListener(MouseEvent.CLICK,this.§1t5484s0§);
            this.§1t7734s0§[_loc1_].removeEventListener(MouseEvent.ROLL_OVER,this.§1t7739s0§);
            this.§1t7734s0§[_loc1_].removeEventListener(MouseEvent.ROLL_OUT,this.§1t7740s0§);
            _loc1_++;
         }
         this.§1t7724s0§.removeEventListener(MouseEvent.CLICK,this.§1t7741s0§);
         this.§1t7724s0§.removeEventListeners();
      }
      
      internal function §1t5484s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         this.§1t7738s0§(param1.target as MovieClip);
      }
      
      internal function §1t7737s0§() : *
      {
         var _loc1_:Array = null;
         if(!§1t1523s0§.§1t9503s0§)
         {
            _loc1_ = new Array();
            if(this.§1t7735s0§[0] < this.§1t7735s0§[4])
            {
               _loc1_.push(this.redside);
            }
            else if(this.§1t7735s0§[1] < this.§1t7735s0§[4])
            {
               _loc1_.push(this.greenside);
            }
            else if(this.§1t7735s0§[2] < this.§1t7735s0§[4])
            {
               _loc1_.push(this.blueside);
            }
            else if(this.§1t7735s0§[3] < this.§1t7735s0§[4])
            {
               _loc1_.push(this.yellowside);
            }
         }
         else
         {
            _loc1_ = [this.redside,this.greenside,this.blueside,this.yellowside];
         }
         this.§1t7738s0§(_loc1_[int(Math.random() * _loc1_.length)]);
      }
      
      internal function §1t7738s0§(param1:MovieClip) : *
      {
         if(this.§1t7733s0§ != null)
         {
            this.§1t7733s0§.gotoAndStop("mouseout");
         }
         this.§1t7733s0§ = param1;
         this.§1t7733s0§.gotoAndStop("selected");
         this.§1t5020s0§.visible = false;
         this.§1t5019s0§.visible = false;
         this.§1t7724s0§.visible = true;
         this.§1t7725s0§.visible = true;
         if(this.§1t7733s0§ == this.redside)
         {
            this.sidename.text = §1t1521s0§.getString(275);
            this.sidedesc.text = §1t1521s0§.getString(324);
            this.§1t7725s0§.gotoAndStop(1);
            this.§1t7724s0§.visible = this.§1t7735s0§[0] < this.§1t7735s0§[4];
            this.§1t7727s0§.visible = !this.§1t7724s0§.visible;
         }
         else if(this.§1t7733s0§ == this.greenside)
         {
            this.sidename.text = §1t1521s0§.getString(276);
            this.sidedesc.text = §1t1521s0§.getString(325);
            this.§1t7725s0§.gotoAndStop(2);
            this.§1t7724s0§.visible = this.§1t7735s0§[1] < this.§1t7735s0§[4];
            this.§1t7727s0§.visible = !this.§1t7724s0§.visible;
         }
         else if(this.§1t7733s0§ == this.blueside)
         {
            this.sidename.text = §1t1521s0§.getString(277);
            this.sidedesc.text = §1t1521s0§.getString(326);
            this.§1t7725s0§.gotoAndStop(3);
            this.§1t7724s0§.visible = this.§1t7735s0§[2] < this.§1t7735s0§[4];
            this.§1t7727s0§.visible = !this.§1t7724s0§.visible;
         }
         else if(this.§1t7733s0§ == this.yellowside)
         {
            this.sidename.text = §1t1521s0§.getString(278);
            this.sidedesc.text = §1t1521s0§.getString(327);
            this.§1t7725s0§.gotoAndStop(4);
            this.§1t7724s0§.visible = this.§1t7735s0§[3] < this.§1t7735s0§[4];
            this.§1t7727s0§.visible = !this.§1t7724s0§.visible;
         }
         else if(this.§1t7733s0§ == this.randomside)
         {
            this.sidename.text = §1t1521s0§.getString(322);
            this.sidedesc.text = §1t1521s0§.getString(328);
            this.§1t7725s0§.gotoAndStop(5);
            this.§1t7727s0§.visible = false;
         }
      }
      
      internal function §1t7739s0§(param1:MouseEvent) : *
      {
         if(this.§1t7733s0§ != null)
         {
            return;
         }
         param1.target.gotoAndStop("mouseover");
         this.§1t7724s0§.visible = true;
         this.§1t7725s0§.visible = true;
         if(param1.target == this.redside)
         {
            this.sidename.text = §1t1521s0§.getString(275);
            this.sidedesc.text = §1t1521s0§.getString(324);
            this.§1t7725s0§.gotoAndStop(1);
         }
         else if(param1.target == this.greenside)
         {
            this.sidename.text = §1t1521s0§.getString(276);
            this.sidedesc.text = §1t1521s0§.getString(325);
            this.§1t7725s0§.gotoAndStop(2);
         }
         else if(param1.target == this.blueside)
         {
            this.sidename.text = §1t1521s0§.getString(277);
            this.sidedesc.text = §1t1521s0§.getString(326);
            this.§1t7725s0§.gotoAndStop(3);
         }
         else if(param1.target == this.yellowside)
         {
            this.sidename.text = §1t1521s0§.getString(278);
            this.sidedesc.text = §1t1521s0§.getString(327);
            this.§1t7725s0§.gotoAndStop(4);
         }
         else if(param1.target == this.randomside)
         {
            this.sidename.text = §1t1521s0§.getString(322);
            this.sidedesc.text = §1t1521s0§.getString(328);
            this.§1t7725s0§.gotoAndStop(5);
         }
      }
      
      internal function §1t7740s0§(param1:MouseEvent) : *
      {
         if(this.§1t7733s0§ == null)
         {
            param1.target.gotoAndStop("mouseout");
         }
      }
      
      internal function §1t7741s0§(param1:MouseEvent) : *
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         if(this.§1t7733s0§ == null)
         {
            return;
         }
         §1t88s0§.instance.§1t1516s0§("Snd_wrAttack");
         if(this.§1t7733s0§ == this.redside)
         {
            _loc2_ = 1;
         }
         else if(this.§1t7733s0§ == this.greenside)
         {
            _loc2_ = 2;
         }
         else if(this.§1t7733s0§ == this.blueside)
         {
            _loc2_ = 3;
         }
         else if(this.§1t7733s0§ == this.yellowside)
         {
            _loc2_ = 4;
         }
         else if(this.§1t7733s0§ == this.randomside)
         {
            _loc2_ = Math.random() * 4 + 1;
         }
         if(§1t1523s0§.§1t7746s0§() != _loc2_)
         {
            if(§1t1523s0§.§1t7746s0§() != 0)
            {
               §1t3317s0§.instance.§1t1918s0§(-1,§1t1523s0§.charname);
               §1t406s0§.instance.§1t6482s0§.§1t7837s0§(-1,-1,-1);
            }
            else
            {
               §1t406s0§.instance.§1t6644s0§(52);
            }
            §1t1523s0§.§1t9712s0§(§1t1523s0§.§1t9422s0§,_loc2_);
            §1t1523s0§.§1t9712s0§(§1t1523s0§.§1t9438s0§,§1t3317s0§.instance.§1t1847s0§());
            §1t3317s0§.instance.§1t1946s0§();
         }
         this.hide();
         §1t406s0§.instance.§1t6482s0§.§1t5026s0§(null);
         §1t406s0§.instance.§1t6482s0§.§1t8010s0§();
         §1t406s0§.instance.§1t6482s0§.§1t8005s0§.show();
         if(_loc2_ == 1)
         {
            _loc3_ = §1t1521s0§.getString(275);
         }
         else if(_loc2_ == 2)
         {
            _loc3_ = §1t1521s0§.getString(276);
         }
         else if(_loc2_ == 3)
         {
            _loc3_ = §1t1521s0§.getString(277);
         }
         else if(_loc2_ == 4)
         {
            _loc3_ = §1t1521s0§.getString(278);
         }
         §1t251s0§.instance.§1t3524s0§("",901,[§1t1523s0§.§1t9765s0§(),_loc3_]);
      }
   }
}

