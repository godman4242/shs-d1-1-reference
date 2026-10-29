package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.utils.getDefinitionByName;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2121")]
   public class §1t412s0§ extends MovieClip
   {
      
      public static var instance:§1t412s0§;
      
      public var bg:§1t7180s0§;
      
      public var §1t7528s0§:MovieClip;
      
      public var §1t7529s0§:§1t5003s0§;
      
      public var §1t7530s0§:§1t7454s0§;
      
      public var §1t6430s0§:MovieClip;
      
      public var §1t5162s0§:SimpleButton;
      
      public var §1t5163s0§:MovieClip;
      
      public var §1t6431s0§:TextField;
      
      public var closeWindow:SimpleButton;
      
      public var §1t7531s0§:MovieClip;
      
      public var §1t7532s0§:TextField;
      
      public var §1t7533s0§:TextField;
      
      public var editButton:§1t5050s0§;
      
      public var §1t7535s0§:§1t7488s0§;
      
      public var §1t7536s0§:TextField;
      
      public var §1t7537s0§:TextField;
      
      public var §1t7538s0§:MovieClip;
      
      public var §1t7539s0§:TextField;
      
      public var §1t7540s0§:SimpleButton;
      
      public var §1t7541s0§:§1t7198s0§;
      
      public var §1t7542s0§:MovieClip;
      
      public var §1t7543s0§:TextField;
      
      public var §1t7544s0§:§1t7216s0§;
      
      public var §1t7545s0§:§1t7289s0§;
      
      public var §1t7546s0§:TextField;
      
      public var §1t7547s0§:TextField;
      
      public var §1t7548s0§:§1t7394s0§;
      
      public var §1t7549s0§:§1t7406s0§;
      
      public var nodeName:MovieClip;
      
      public var §1t7550s0§:TextField;
      
      public var §1t7551s0§:§1t7369s0§;
      
      public var §1t7552s0§:§1t7197s0§;
      
      public var §1t6442s0§:SimpleButton;
      
      public var §1t6443s0§:TextField;
      
      public var §1t7553s0§:§1t7523s0§;
      
      public var §1t7554s0§:§1t7197s0§;
      
      public var §1t7555s0§:§1t7197s0§;
      
      public var §1t7556s0§:MovieClip;
      
      public var §1t6453s0§:SimpleButton;
      
      public var §1t6454s0§:TextField;
      
      public var §1t7557s0§:MovieClip;
      
      public var §1t7558s0§:TextField;
      
      public var §1t7559s0§:SimpleButton;
      
      public var §1t7560s0§:TextField;
      
      public var §1t6457s0§:§1t5874s0§;
      
      public var §1t7561s0§:§1t7368s0§;
      
      public var §1t7562s0§:MovieClip;
      
      public var §1t7563s0§:TextField;
      
      public var §1t7564s0§:§1t5050s0§;
      
      public var §1t7565s0§:§1t5050s0§;
      
      public var §1t7566s0§:§1t5267s0§;
      
      public var §1t7567s0§:§1t5267s0§;
      
      internal var §1t916s0§:§1t24s0§;
      
      internal var §1t7568s0§:Array;
      
      internal var §1t7569s0§:Boolean = true;
      
      internal var §1t7570s0§:Boolean = false;
      
      internal var §1t7571s0§:Boolean = true;
      
      internal var §1t5098s0§:int;
      
      internal var §1t7572s0§:int;
      
      internal var scale:int = 1;
      
      internal var §1t7574s0§:int = 800;
      
      internal var §1t7575s0§:int = 480;
      
      internal var §1t2184s0§:int = 400;
      
      internal var §1t7576s0§:§1t29s0§ = null;
      
      internal var §1t7577s0§:Boolean = false;
      
      internal var §1t7508s0§:§1t28s0§ = null;
      
      internal var §1t5090s0§:MovieClip = null;
      
      internal var §1t7060s0§:Boolean = false;
      
      internal var §1t7058s0§:int;
      
      internal var §1t7059s0§:int;
      
      internal var §1t7578s0§:MovieClip = null;
      
      internal var §1t7579s0§:MovieClip = null;
      
      internal var §1t7580s0§:MovieClip = null;
      
      internal var §1t7581s0§:§1t855s0§;
      
      internal var §1t7582s0§:Array;
      
      internal var §1t7481s0§:Array = new Array();
      
      internal var §1t7589s0§:int = 0;
      
      internal var §1t7590s0§:int = 0;
      
      internal var §1t5195s0§:int;
      
      internal var §1t5237s0§:String = "";
      
      internal var §1t6595s0§:String = "";
      
      internal var §1t5234s0§:String = "";
      
      internal var §1t5235s0§:int = 0;
      
      public function §1t412s0§()
      {
         super();
         instance = this;
         this.§1t7561s0§.mouseEnabled = false;
         this.§1t7561s0§.stop();
         this.§1t7555s0§.mouseEnabled = false;
         this.nodeName.mouseEnabled = false;
         this.§1t7550s0§.mouseEnabled = false;
         if(§1t1523s0§.§1t9528s0§)
         {
            this.§1t7564s0§.hitArea = this.§1t7566s0§;
            this.§1t7565s0§.hitArea = this.§1t7567s0§;
         }
         this.§1t7566s0§.visible = false;
         this.§1t7567s0§.visible = false;
         this.§1t7564s0§.§1t5769s0§(§1t1521s0§.getString(760));
         this.§1t7565s0§.§1t5769s0§(§1t1521s0§.getString(761));
         this.§1t7553s0§.mouseEnabled = false;
         this.§1t7555s0§.addChild(this.§1t7556s0§);
         this.§1t7556s0§.mouseEnabled = false;
         this.§1t7581s0§ = new §1t855s0§(§1t414s0§,5,10,20);
         this.§1t7582s0§ = new Array();
         if(§1t1523s0§.language == §1t1521s0§.CHINESE)
         {
            this.§1t5163s0§.§1t13123s0§.maxChars = 32;
         }
         else
         {
            this.§1t5163s0§.§1t13123s0§.maxChars = 55;
         }
         if(§1t1523s0§.§1t9483s0§)
         {
            this.§1t5163s0§.§1t13123s0§.maxChars = 0;
         }
         §1t1521s0§.§1t9290s0§(this.§1t5163s0§.§1t13123s0§,false);
         §1t1521s0§.§1t9290s0§(this.§1t5163s0§.§1t13358s0§,true);
         §1t1521s0§.§1t9290s0§(this.§1t5163s0§.§1t16184s0§,true);
         this.§1t5163s0§.§1t13358s0§.text = "";
         this.§1t5163s0§.§1t16184s0§.text = "";
         §1t1521s0§.§1t9290s0§(this.§1t5163s0§.§1t6431s0§,true);
         this.§1t5163s0§.chatbutton.§1t5769s0§(§1t1521s0§.getString(206));
         this.§1t5163s0§.§1t6431s0§.text = §1t1521s0§.getString(206);
         §1t1521s0§.§1t9290s0§(this.§1t5163s0§.§1t16185s0§,true);
         this.§1t5163s0§.§1t16186s0§.§1t5769s0§(§1t1521s0§.getString(11075));
         this.§1t5163s0§.§1t16185s0§.text = §1t1521s0§.getString(11075);
         this.§1t5163s0§.chatbutton.visible = false;
         this.§1t5163s0§.§1t6431s0§.visible = false;
         this.§1t5163s0§.§1t16186s0§.visible = false;
         this.§1t5163s0§.§1t16185s0§.visible = false;
         this.§1t7533s0§.mouseEnabled = false;
         this.§1t6431s0§.mouseEnabled = false;
         this.§1t7560s0§.mouseEnabled = false;
         this.§1t7560s0§.text = §1t1521s0§.getString(681);
         this.§1t6454s0§.mouseEnabled = false;
         this.§1t6443s0§.mouseEnabled = false;
         this.§1t6443s0§.text = §1t1521s0§.getString(10);
         this.§1t7557s0§.§1t7502s0§.gotoAndStop(1);
         this.§1t7538s0§.§1t7502s0§.gotoAndStop(3);
         this.§1t7562s0§.§1t7502s0§.gotoAndStop(4);
         this.§1t7531s0§.§1t7502s0§.gotoAndStop(5);
         this.§1t7542s0§.§1t7502s0§.gotoAndStop(6);
      }
      
      public static function §1t9190s0§() : §1t412s0§
      {
         if(instance == null)
         {
            new §1t412s0§();
         }
         return instance;
      }
      
      public function init(param1:§1t24s0§) : *
      {
         var _loc4_:int = 0;
         var _loc6_:§1t28s0§ = null;
         var _loc8_:int = 0;
         var _loc9_:MovieClip = null;
         this.§1t7529s0§.§1t5769s0§(§1t1521s0§.getString(422));
         this.editButton.§1t5769s0§(§1t1521s0§.getString(22088));
         this.§1t6454s0§.text = §1t1521s0§.getString(22094);
         this.§1t7554s0§.y = this.§1t2184s0§;
         this.§1t7552s0§.y = this.§1t2184s0§;
         this.§1t7555s0§.y = this.§1t2184s0§;
         this.bg.§1t7193s0§(this.§1t2184s0§);
         this.§1t7572s0§ = §1t24s0§.§1t8776s0§ * (§1t24s0§.§1t8777s0§ + param1.§1t570s0§ + §1t24s0§.§1t8778s0§);
         this.§1t5098s0§ = §1t24s0§.§1t8776s0§ * §1t24s0§.§1t8777s0§;
         this.§1t916s0§ = param1;
         var _loc2_:Vector.<§1t28s0§> = param1.§1t556s0§;
         var _loc3_:int = param1.§1t568s0§;
         this.§1t7568s0§ = new Array(param1.§1t570s0§);
         _loc4_ = 0;
         while(_loc4_ < param1.§1t570s0§)
         {
            this.§1t7568s0§[_loc4_] = new Array(_loc3_);
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc8_ = 0;
            while(_loc8_ < param1.§1t570s0§)
            {
               _loc9_ = this.§1t7586s0§(_loc4_ == param1.§1t569s0§);
               _loc9_.x = this.§1t7587s0§(_loc8_);
               _loc9_.y = this.§1t7588s0§(_loc4_);
               this.§1t7554s0§.addChild(_loc9_);
               _loc8_++;
            }
            _loc4_++;
         }
         var _loc5_:int = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc2_[_loc4_];
            this.§1t7593s0§(_loc6_.§1t921s0§,_loc6_.§1t922s0§,_loc6_.§1t928s0§(),_loc6_.§1t929s0§(),_loc6_.§1t933s0§(),_loc6_.§1t931s0§());
            _loc4_++;
         }
         this.§1t7540s0§.x = this.§1t7587s0§(param1.§1t570s0§);
         this.§1t7540s0§.y = this.§1t7588s0§(param1.§1t569s0§);
         this.§1t7540s0§.visible = param1.§1t555s0§.length > 0;
         this.§1t7554s0§.addChild(this.§1t7540s0§);
         this.§1t7530s0§.visible = false;
         this.§1t7530s0§.init(param1);
         this.§1t7561s0§.visible = false;
         this.§1t7570s0§ = param1.§1t571s0§ == 4 && param1.§1t569s0§ != 0;
         this.§1t7544s0§.visible = false;
         this.§1t7544s0§.init(param1);
         this.§1t7541s0§.visible = false;
         this.§1t7541s0§.init(param1);
         this.§1t7535s0§.visible = false;
         this.§1t7545s0§.visible = false;
         this.§1t7545s0§.init(param1);
         this.§1t7553s0§.init(param1);
         this.§1t7549s0§.visible = false;
         this.§1t7549s0§.init(param1);
         this.§1t7548s0§.visible = false;
         this.§1t7548s0§.init();
         this.§1t7619s0§();
         this.§1t5004s0§();
         this.§1t7570s0§ = true;
         this.§1t7585s0§(param1.§1t577s0§());
         this.§1t6899s0§();
         this.§1t5163s0§.visible = false;
         this.§1t7584s0§(true);
         var _loc7_:int = §1t1523s0§.§1t9714s0§(20128);
         if(_loc7_ == 0)
         {
            this.§1t7533s0§.text = "";
         }
         else
         {
            this.§1t7533s0§.text = _loc7_.toString();
         }
         if(param1.§1t577s0§() > 2)
         {
            this.§1t7608s0§(1);
         }
      }
      
      public function §1t7583s0§() : *
      {
         this.§1t7540s0§.x = this.§1t7587s0§(this.§1t916s0§.§1t570s0§);
      }
      
      internal function §1t7584s0§(param1:Boolean) : *
      {
         if(param1)
         {
            this.§1t6430s0§.visible = true;
            this.§1t5162s0§.visible = true;
            this.§1t6453s0§.visible = true;
            this.§1t6442s0§.visible = true;
            this.§1t7559s0§.visible = true;
            this.§1t6431s0§.visible = false;
            this.§1t6454s0§.visible = false;
            this.§1t6443s0§.visible = false;
            this.§1t7560s0§.visible = false;
            this.§1t7533s0§.visible = true;
         }
         else
         {
            this.§1t6430s0§.visible = false;
            this.§1t5162s0§.visible = false;
            this.§1t6453s0§.visible = false;
            this.§1t6442s0§.visible = false;
            this.§1t7559s0§.visible = false;
            this.§1t6431s0§.visible = false;
            this.§1t6454s0§.visible = false;
            this.§1t6443s0§.visible = false;
            this.§1t7560s0§.visible = false;
            this.§1t7533s0§.visible = false;
         }
      }
      
      public function §1t7585s0§(param1:int) : *
      {
         if(this.§1t7578s0§ != null)
         {
            this.§1t7554s0§.removeChild(this.§1t7578s0§);
         }
         this.§1t7578s0§ = this.§1t7604s0§(this.§1t916s0§.§1t577s0§());
         this.§1t7554s0§.addChild(this.§1t7578s0§);
         this.§1t7578s0§.x = this.§1t7587s0§(0);
         this.§1t7578s0§.mouseEnabled = false;
         if(param1 >= 2)
         {
            this.§1t7578s0§.y = this.§1t7588s0§(this.§1t916s0§.§1t568s0§) + 8;
            if(this.§1t7579s0§ == null)
            {
               this.§1t7579s0§ = new §1t8054s0§();
               this.§1t7554s0§.addChild(this.§1t7579s0§);
            }
            this.§1t7579s0§.x = this.§1t7587s0§(0) - 4;
            this.§1t7579s0§.y = this.§1t7588s0§(this.§1t916s0§.§1t569s0§) + 9;
            this.§1t7579s0§.height = (this.§1t916s0§.§1t568s0§ - this.§1t916s0§.§1t569s0§) * 48;
            if(this.§1t7580s0§ == null)
            {
               this.§1t7580s0§ = new §1t8054s0§();
               this.§1t7554s0§.addChild(this.§1t7580s0§);
            }
            this.§1t7580s0§.x = this.§1t7587s0§(this.§1t916s0§.§1t570s0§);
            this.§1t7580s0§.y = this.§1t7588s0§(this.§1t916s0§.§1t569s0§) + 9;
            this.§1t7580s0§.height = (this.§1t916s0§.§1t568s0§ - this.§1t916s0§.§1t569s0§) * 48;
         }
         else
         {
            if(this.§1t7579s0§ != null)
            {
               this.§1t7554s0§.removeChild(this.§1t7579s0§);
               this.§1t7579s0§ = null;
            }
            if(this.§1t7580s0§ != null)
            {
               this.§1t7554s0§.removeChild(this.§1t7580s0§);
               this.§1t7580s0§ = null;
            }
         }
         this.§1t7554s0§.setChildIndex(this.§1t7578s0§,0);
      }
      
      internal function §1t7586s0§(param1:Boolean) : MovieClip
      {
         if(!param1)
         {
            return new §1t6993s0§();
         }
         return new §1t6994s0§();
      }
      
      internal function §1t5004s0§() : *
      {
         this.§1t7564s0§.addEventListener(MouseEvent.CLICK,this.§1t7610s0§);
         this.§1t7565s0§.addEventListener(MouseEvent.CLICK,this.§1t7611s0§);
         this.§1t7554s0§.addEventListener(MouseEvent.CLICK,this.§1t7614s0§);
         this.§1t7552s0§.addEventListener(MouseEvent.MOUSE_DOWN,this.§1t7621s0§);
         this.§1t7529s0§.addEventListener(MouseEvent.CLICK,this.§1t7620s0§);
         this.editButton.addEventListener(MouseEvent.CLICK,this.§1t7620s0§);
         this.§1t7540s0§.addEventListener(MouseEvent.CLICK,this.§1t7627s0§);
         addEventListener(MouseEvent.MOUSE_DOWN,this.§1t7071s0§);
         addEventListener(MouseEvent.MOUSE_UP,this.§1t7072s0§);
         this.closeWindow.addEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         this.bg.addEventListener(MouseEvent.CLICK,this.§1t7615s0§);
         this.§1t6457s0§.§1t5776s0§.addEventListener(MouseEvent.CLICK,this.§1t6553s0§);
         this.§1t6457s0§.§1t6658s0§.addEventListener(MouseEvent.CLICK,this.§1t6554s0§);
         this.§1t6442s0§.addEventListener(MouseEvent.CLICK,this.§1t6566s0§);
         this.§1t6442s0§.addEventListener(MouseEvent.MOUSE_OVER,this.§1t6623s0§);
         this.§1t6442s0§.addEventListener(MouseEvent.MOUSE_OUT,this.§1t6624s0§);
         this.§1t6453s0§.addEventListener(MouseEvent.CLICK,this.§1t6557s0§);
         this.§1t6453s0§.addEventListener(MouseEvent.MOUSE_OVER,this.§1t6625s0§);
         this.§1t6453s0§.addEventListener(MouseEvent.MOUSE_OUT,this.§1t6626s0§);
         this.§1t5162s0§.addEventListener(MouseEvent.CLICK,this.§1t6601s0§);
         this.§1t5162s0§.addEventListener(MouseEvent.MOUSE_OVER,this.§1t6629s0§);
         this.§1t5162s0§.addEventListener(MouseEvent.MOUSE_OUT,this.§1t6630s0§);
         this.§1t7559s0§.addEventListener(MouseEvent.CLICK,this.§1t7635s0§);
         this.§1t7559s0§.addEventListener(MouseEvent.MOUSE_OVER,this.§1t7631s0§);
         this.§1t7559s0§.addEventListener(MouseEvent.MOUSE_OUT,this.§1t7632s0§);
         this.§1t5163s0§.§1t13123s0§.addEventListener(MouseEvent.CLICK,this.§1t5244s0§);
         this.§1t5163s0§.§1t13123s0§.addEventListener(KeyboardEvent.KEY_UP,this.§1t5233s0§);
         this.§1t5163s0§.§1t7636s0§.addEventListener(MouseEvent.CLICK,this.§1t6603s0§);
         this.§1t5163s0§.§1t15893s0§.addEventListener(MouseEvent.CLICK,this.§1t5243s0§);
         this.§1t5163s0§.§1t15893s0§.§1t5004s0§();
         this.§1t5163s0§.§1t5020s0§.addEventListener(MouseEvent.CLICK,this.§1t5251s0§);
         this.§1t5163s0§.§1t5019s0§.addEventListener(MouseEvent.CLICK,this.§1t5252s0§);
         this.§1t5163s0§.chatbutton.addEventListener(MouseEvent.CLICK,this.§1t6654s0§);
         this.§1t5163s0§.§1t16186s0§.addEventListener(MouseEvent.CLICK,this.§1t6655s0§);
      }
      
      internal function removeEventListeners() : *
      {
         this.§1t7554s0§.removeEventListener(MouseEvent.CLICK,this.§1t7614s0§);
         this.§1t7552s0§.removeEventListener(MouseEvent.CLICK,this.§1t7621s0§);
         this.§1t7529s0§.removeEventListener(MouseEvent.CLICK,this.§1t7620s0§);
         this.editButton.removeEventListener(MouseEvent.CLICK,this.§1t7620s0§);
         this.§1t7540s0§.removeEventListener(MouseEvent.CLICK,this.§1t7627s0§);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.§1t7071s0§);
         removeEventListener(MouseEvent.MOUSE_UP,this.§1t7072s0§);
         this.closeWindow.removeEventListener(MouseEvent.CLICK,this.§1t5026s0§);
         this.bg.removeEventListener(MouseEvent.CLICK,this.§1t7615s0§);
         this.§1t6457s0§.§1t5776s0§.removeEventListener(MouseEvent.CLICK,this.§1t6553s0§);
         this.§1t6457s0§.§1t6658s0§.removeEventListener(MouseEvent.CLICK,this.§1t6554s0§);
         this.§1t6442s0§.removeEventListener(MouseEvent.CLICK,this.§1t6566s0§);
         this.§1t6442s0§.removeEventListener(MouseEvent.MOUSE_OVER,this.§1t6623s0§);
         this.§1t6442s0§.removeEventListener(MouseEvent.MOUSE_OUT,this.§1t6624s0§);
         this.§1t6453s0§.removeEventListener(MouseEvent.CLICK,this.§1t6557s0§);
         this.§1t6453s0§.removeEventListener(MouseEvent.MOUSE_OVER,this.§1t6625s0§);
         this.§1t6453s0§.removeEventListener(MouseEvent.MOUSE_OUT,this.§1t6626s0§);
         this.§1t5162s0§.removeEventListener(MouseEvent.CLICK,this.§1t6601s0§);
         this.§1t5162s0§.removeEventListener(MouseEvent.MOUSE_OVER,this.§1t6629s0§);
         this.§1t5162s0§.removeEventListener(MouseEvent.MOUSE_OUT,this.§1t6630s0§);
         this.§1t7559s0§.removeEventListener(MouseEvent.CLICK,this.§1t7635s0§);
         this.§1t7559s0§.removeEventListener(MouseEvent.MOUSE_OVER,this.§1t7631s0§);
         this.§1t7559s0§.removeEventListener(MouseEvent.MOUSE_OUT,this.§1t7632s0§);
         this.§1t5163s0§.§1t13123s0§.removeEventListener(MouseEvent.CLICK,this.§1t5244s0§);
         this.§1t5163s0§.§1t13123s0§.removeEventListener(KeyboardEvent.KEY_UP,this.§1t5233s0§);
         this.§1t5163s0§.§1t7636s0§.removeEventListener(MouseEvent.CLICK,this.§1t6603s0§);
         this.§1t5163s0§.§1t15893s0§.removeEventListener(MouseEvent.CLICK,this.§1t5243s0§);
         this.§1t5163s0§.§1t15893s0§.removeEventListeners();
         this.§1t5163s0§.§1t5020s0§.removeEventListener(MouseEvent.CLICK,this.§1t5251s0§);
         this.§1t5163s0§.§1t5019s0§.removeEventListener(MouseEvent.CLICK,this.§1t5252s0§);
         this.§1t5163s0§.chatbutton.removeEventListener(MouseEvent.CLICK,this.§1t6654s0§);
         this.§1t5163s0§.§1t16186s0§.removeEventListener(MouseEvent.CLICK,this.§1t6655s0§);
      }
      
      internal function §1t7587s0§(param1:int) : int
      {
         return param1 * §1t24s0§.§1t8776s0§ + this.§1t5098s0§;
      }
      
      internal function §1t7588s0§(param1:int) : int
      {
         return param1 * -§1t24s0§.§1t8775s0§ + this.§1t916s0§.§1t569s0§ * §1t24s0§.§1t8775s0§;
      }
      
      public function §1t7591s0§(param1:int, param2:int) : *
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc6_:Point = null;
         var _loc8_:MovieClip = null;
         var _loc9_:§1t28s0§ = null;
         this.§1t7589s0§ = param1;
         this.§1t7590s0§ = param2;
         if(param1 == §1t24s0§.§1t8764s0§)
         {
            _loc4_ = 1;
            _loc3_ = this.§1t916s0§.§1t619s0§();
         }
         else if(param1 == §1t24s0§.§1t8763s0§)
         {
            _loc4_ = 1;
            _loc3_ = this.§1t916s0§.§1t618s0§(_loc4_,false);
         }
         else
         {
            _loc4_ = §1t24s0§.§1t8797s0§(param1).§1t919s0§;
            _loc3_ = this.§1t916s0§.§1t618s0§(_loc4_,true);
         }
         var _loc5_:int = int(_loc3_.length);
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_)
         {
            _loc6_ = _loc3_[_loc7_];
            if(_loc4_ == 1)
            {
               _loc8_ = new §1t6991s0§();
            }
            else if(this.§1t916s0§.§1t558s0§[_loc6_.x][_loc6_.y] != null)
            {
               _loc9_ = this.§1t916s0§.§1t558s0§[_loc6_.x][_loc6_.y];
               if(_loc9_.§1t921s0§ == _loc6_.x && _loc9_.§1t922s0§ == _loc6_.y && _loc9_.§1t928s0§() == §1t24s0§.§1t8763s0§)
               {
                  if(_loc9_.§1t933s0§() == 1)
                  {
                     _loc8_ = new §1t6991s0§();
                  }
                  else
                  {
                     _loc8_ = new §1t6992s0§();
                  }
               }
               else
               {
                  _loc8_ = null;
               }
            }
            else
            {
               _loc8_ = new §1t6992s0§();
            }
            if(_loc8_ != null)
            {
               _loc8_.x = this.§1t7587s0§(_loc6_.x);
               _loc8_.y = this.§1t7588s0§(_loc6_.y);
               _loc8_.§1t921s0§ = _loc6_.x;
               _loc8_.§1t922s0§ = _loc6_.y;
               _loc8_.buttonMode = true;
               _loc8_.addEventListener(MouseEvent.CLICK,this.§1t7484s0§);
               this.§1t7555s0§.addChild(_loc8_);
               this.§1t7481s0§.push(_loc8_);
            }
            _loc7_++;
         }
         if(this.§1t7481s0§.length == 0)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(22095),§1t1521s0§.getString(5));
         }
      }
      
      public function §1t7592s0§() : *
      {
         var _loc2_:MovieClip = null;
         var _loc1_:int = int(this.§1t7481s0§.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_)
         {
            _loc2_ = this.§1t7481s0§[_loc3_];
            _loc2_.removeEventListener(MouseEvent.CLICK,this.§1t7484s0§);
            this.§1t7555s0§.removeChild(_loc2_);
            _loc3_++;
         }
         this.§1t7481s0§.length = 0;
         this.§1t7589s0§ = 0;
      }
      
      internal function §1t7484s0§(param1:MouseEvent) : *
      {
         var _loc4_:§1t28s0§ = null;
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         var _loc2_:int = int(param1.target.§1t921s0§);
         var _loc3_:int = int(param1.target.§1t922s0§);
         if(this.§1t7589s0§ == §1t24s0§.§1t8764s0§)
         {
            this.§1t916s0§.§1t598s0§(_loc2_,_loc3_,this.§1t7590s0§);
         }
         else
         {
            _loc4_ = this.§1t916s0§.§1t586s0§(_loc2_,_loc3_,this.§1t7589s0§,this.§1t7590s0§);
            this.§1t7593s0§(_loc4_.§1t921s0§,_loc4_.§1t922s0§,_loc4_.§1t928s0§(),_loc4_.§1t929s0§(),_loc4_.§1t920s0§,_loc4_.§1t915s0§);
         }
         this.§1t7619s0§();
      }
      
      public function §1t7593s0§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : *
      {
         var _loc8_:MovieClip = null;
         if(param3 == §1t24s0§.§1t8769s0§)
         {
            param5 = 2;
         }
         var _loc7_:MovieClip = this.§1t7601s0§(param3,param4,param5,param6);
         _loc7_.x = this.§1t7587s0§(param1);
         _loc7_.y = this.§1t7588s0§(param2);
         this.§1t7568s0§[param1][param2] = _loc7_;
         this.§1t7554s0§.addChild(_loc7_);
         if(param3 == §1t24s0§.§1t8764s0§)
         {
            this.§1t7605s0§(param1,param2,_loc7_.stairs);
         }
         _loc8_ = this.§1t7603s0§(param3,param5,param6);
         _loc8_.x = this.§1t7587s0§(param1);
         _loc8_.y = this.§1t7588s0§(param2);
         _loc7_.§1t12819s0§ = _loc8_;
         this.§1t7555s0§.addChild(_loc8_);
      }
      
      public function §1t7594s0§(param1:§1t29s0§, param2:§1t28s0§, param3:int) : *
      {
         var _loc4_:int = param2.§1t944s0§() * §1t24s0§.§1t8776s0§;
         param1.x = this.§1t7587s0§(param2.§1t921s0§) + _loc4_ / (param2.§1t945s0§() + 1) * (param3 + 1);
         param1.y = this.§1t7588s0§(param2.§1t922s0§);
         this.§1t7552s0§.addChild(param1);
      }
      
      public function §1t948s0§(param1:§1t29s0§) : *
      {
         this.§1t7552s0§.removeChild(param1);
      }
      
      public function §1t7595s0§() : *
      {
         var _loc5_:§1t29s0§ = null;
         var _loc1_:Vector.<§1t29s0§> = this.§1t916s0§.§1t554s0§;
         var _loc2_:int = int(_loc1_.length);
         var _loc3_:int = this.§1t7587s0§(0);
         var _loc4_:int = this.§1t7588s0§(this.§1t916s0§.§1t569s0§);
         var _loc6_:int = 0;
         while(_loc6_ < _loc2_ && _loc6_ < 10)
         {
            _loc5_ = _loc1_[_loc6_];
            _loc5_.x = _loc3_ - (_loc6_ + 1) * 20;
            _loc5_.y = _loc4_;
            _loc5_.mcs.§1t5493s0§();
            _loc5_.§1t3269s0§(§1t1544s0§.§1t11154s0§);
            this.§1t7552s0§.addChild(_loc5_);
            _loc6_++;
         }
      }
      
      internal function §1t7596s0§(param1:MouseEvent) : *
      {
         var _loc4_:MovieClip = null;
         if(param1 != null)
         {
            param1.stopImmediatePropagation();
         }
         var _loc2_:int = this.§1t916s0§.§1t568s0§;
         var _loc3_:int = 0;
         while(_loc3_ < this.§1t916s0§.§1t570s0§)
         {
            _loc4_ = this.§1t7586s0§(false);
            _loc4_.x = this.§1t7587s0§(_loc3_);
            _loc4_.y = this.§1t7588s0§(_loc2_);
            this.§1t7554s0§.addChild(_loc4_);
            _loc3_++;
         }
         this.§1t916s0§.§1t590s0§();
      }
      
      internal function §1t7597s0§(param1:MouseEvent) : *
      {
         var _loc4_:* = 0;
         var _loc5_:MovieClip = null;
         if(param1 != null)
         {
            param1.stopImmediatePropagation();
         }
         this.§1t7570s0§ = true;
         this.§1t916s0§.§1t591s0§();
         var _loc2_:int = this.§1t916s0§.§1t568s0§;
         var _loc3_:int = 0;
         while(_loc3_ < this.§1t916s0§.§1t570s0§)
         {
            _loc4_ = int(_loc2_ - 1);
            while(_loc4_ >= 0)
            {
               if(_loc4_ == 0)
               {
                  this.§1t7568s0§[_loc3_][_loc4_] = null;
               }
               else
               {
                  this.§1t7568s0§[_loc3_][_loc4_] = this.§1t7568s0§[_loc3_][_loc4_ - 1];
               }
               _loc4_--;
            }
            _loc3_++;
         }
         _loc4_ = 0;
         while(_loc4_ < this.§1t916s0§.§1t570s0§)
         {
            _loc5_ = this.§1t7586s0§(false);
            _loc5_.x = this.§1t7587s0§(_loc4_);
            _loc5_.y = this.§1t7588s0§(0);
            this.§1t7554s0§.addChild(_loc5_);
            _loc4_++;
         }
      }
      
      public function §1t7598s0§(param1:MouseEvent) : *
      {
         var _loc3_:MovieClip = null;
         if(param1 != null)
         {
            param1.stopImmediatePropagation();
         }
         this.§1t916s0§.§1t592s0§();
         this.§1t7568s0§.push(new Array());
         var _loc2_:int = 0;
         while(_loc2_ < this.§1t916s0§.§1t568s0§)
         {
            _loc3_ = this.§1t7586s0§(_loc2_ == this.§1t916s0§.§1t569s0§);
            _loc3_.x = this.§1t7587s0§(this.§1t916s0§.§1t570s0§ - 1);
            _loc3_.y = this.§1t7588s0§(_loc2_);
            this.§1t7554s0§.addChild(_loc3_);
            _loc2_++;
         }
         this.§1t7572s0§ = §1t24s0§.§1t8776s0§ * (§1t24s0§.§1t8777s0§ + this.§1t916s0§.§1t570s0§ + §1t24s0§.§1t8778s0§);
      }
      
      public function §1t7599s0§(param1:int, param2:int) : *
      {
         this.§1t7554s0§.removeChild(this.§1t7568s0§[param1][param2]);
         this.§1t7555s0§.removeChild(this.§1t7568s0§[param1][param2].§1t12819s0§);
      }
      
      public function §1t617s0§() : *
      {
         if(this.§1t916s0§.§1t616s0§(this.§1t7508s0§))
         {
            this.§1t7554s0§.removeChild(this.§1t5090s0§);
            this.§1t7555s0§.removeChild(this.§1t5090s0§.§1t12819s0§);
            this.§1t916s0§.§1t617s0§(this.§1t7508s0§);
            this.§1t7619s0§();
         }
      }
      
      public function §1t7600s0§() : int
      {
         if(this.§1t7508s0§.§1t946s0§() > 0)
         {
            return 1;
         }
         if(this.§1t7508s0§.§1t928s0§() == §1t24s0§.§1t8765s0§ && this.§1t916s0§.§1t579s0§(§1t24s0§.§1t8747s0§) > this.§1t916s0§.§1t565s0§[§1t24s0§.§1t8747s0§] - this.§1t7508s0§.§1t939s0§(§1t24s0§.§1t8747s0§))
         {
            return 2;
         }
         if(this.§1t7508s0§.§1t928s0§() == §1t24s0§.§1t8769s0§ && this.§1t916s0§.§1t559s0§.length != 0)
         {
            return 3;
         }
         if(this.§1t7508s0§.§1t928s0§() == §1t24s0§.§1t8769s0§ && this.§1t916s0§.§1t559s0§.length != 0)
         {
            return 4;
         }
         if(this.§1t916s0§.§1t612s0§(this.§1t7508s0§))
         {
            return 0;
         }
         if(this.§1t916s0§.§1t613s0§(this.§1t7508s0§))
         {
            if(this.§1t7508s0§.§1t928s0§() == §1t24s0§.§1t8764s0§ && this.§1t916s0§.§1t629s0§(this.§1t7508s0§.§1t921s0§,this.§1t7508s0§.§1t922s0§,§1t24s0§.§1t8763s0§))
            {
               return 5;
            }
         }
         return 0;
      }
      
      public function §1t615s0§() : Boolean
      {
         if(this.§1t7508s0§.§1t946s0§() > 0)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return false;
         }
         if(this.§1t7508s0§.§1t928s0§() == §1t24s0§.§1t8765s0§ && this.§1t916s0§.§1t579s0§(§1t24s0§.§1t8747s0§) > this.§1t916s0§.§1t565s0§[§1t24s0§.§1t8747s0§] - this.§1t7508s0§.§1t939s0§(§1t24s0§.§1t8747s0§))
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return false;
         }
         if(this.§1t7508s0§.§1t928s0§() == §1t24s0§.§1t8769s0§ && this.§1t916s0§.§1t559s0§.length != 0)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            return false;
         }
         if(this.§1t916s0§.§1t612s0§(this.§1t7508s0§))
         {
            this.§1t7554s0§.removeChild(this.§1t5090s0§);
            this.§1t7555s0§.removeChild(this.§1t5090s0§.§1t12819s0§);
            this.§1t916s0§.§1t615s0§(this.§1t7508s0§);
            this.§1t7619s0§();
         }
         else if(this.§1t916s0§.§1t613s0§(this.§1t7508s0§))
         {
            if(this.§1t7508s0§.§1t928s0§() == §1t24s0§.§1t8764s0§ && this.§1t916s0§.§1t629s0§(this.§1t7508s0§.§1t921s0§,this.§1t7508s0§.§1t922s0§,§1t24s0§.§1t8763s0§))
            {
               §1t88s0§.instance.§1t1516s0§("Snd_error");
               return false;
            }
            this.§1t7554s0§.removeChild(this.§1t5090s0§);
            this.§1t7555s0§.removeChild(this.§1t5090s0§.§1t12819s0§);
            this.§1t916s0§.§1t615s0§(this.§1t7508s0§);
            this.§1t916s0§.createRoom(this.§1t7508s0§.§1t921s0§,this.§1t7508s0§.§1t922s0§,§1t24s0§.§1t8763s0§,§1t24s0§.§1t8797s0§(§1t24s0§.§1t8763s0§).bg,0,this.§1t7508s0§.§1t944s0§(),-1,-1);
            this.§1t7593s0§(this.§1t7508s0§.§1t921s0§,this.§1t7508s0§.§1t922s0§,§1t24s0§.§1t8763s0§,§1t24s0§.§1t8797s0§(§1t24s0§.§1t8763s0§).bg,this.§1t7508s0§.§1t944s0§(),0);
            this.§1t7619s0§();
         }
         return true;
      }
      
      internal function §1t7601s0§(param1:int, param2:int, param3:int, param4:int) : MovieClip
      {
         var _loc8_:Class = null;
         if(param3 <= 0)
         {
            param3 = 1;
         }
         var _loc5_:String = "TowerRoomStyle_" + param2 + "_" + param3;
         var _loc6_:MovieClip = §1t1522s0§.§1t9322s0§(_loc5_);
         if(_loc6_ == null)
         {
            _loc8_ = getDefinitionByName("TowerRoom_x_" + param3 + "_" + param4) as Class;
            _loc6_ = new _loc8_() as MovieClip;
            _loc6_.labeltext.text = §1t24s0§.§1t8797s0§(param1).§1t509s0§();
            return _loc6_;
         }
         var _loc7_:MovieClip = this.§1t7602s0§(param1,param2,param3,param4);
         if(_loc7_ != null)
         {
            _loc6_.addChild(_loc7_);
         }
         if(_loc6_.door != null)
         {
            if(param1 == §1t24s0§.§1t8763s0§ || param1 == §1t24s0§.§1t8764s0§ || param1 == §1t24s0§.§1t8762s0§)
            {
               _loc6_.door.visible = false;
            }
            else
            {
               _loc6_.door.visible = true;
            }
         }
         if(param1 == §1t24s0§.§1t8764s0§)
         {
            _loc6_.stairs = _loc7_;
            _loc7_.stairsup.visible = false;
            _loc7_.stairsdown.visible = false;
         }
         return _loc6_;
      }
      
      internal function §1t7602s0§(param1:int, param2:int, param3:int, param4:int) : MovieClip
      {
         var _loc5_:String = null;
         if(param1 == §1t24s0§.§1t8764s0§)
         {
            _loc5_ = "TowerRoomStairs";
         }
         else if(param1 == §1t24s0§.§1t8768s0§)
         {
            _loc5_ = "TowerRoomHut";
         }
         else if(param2 == 0)
         {
            if(param1 == §1t24s0§.§1t8762s0§)
            {
               _loc5_ = "TowerRoomHutEntrance";
            }
            else if(param1 == §1t24s0§.§1t8766s0§)
            {
               _loc5_ = "TowerRoomHutKitchen";
            }
            else if(param1 == §1t24s0§.§1t8767s0§)
            {
               _loc5_ = "TowerRoomHutWorkshop";
            }
         }
         else
         {
            _loc5_ = "TowerRoom_" + param1 + "_" + param3 + "_" + param4;
         }
         return §1t1522s0§.§1t9322s0§(_loc5_);
      }
      
      internal function §1t7603s0§(param1:int, param2:int, param3:int) : MovieClip
      {
         var _loc4_:MovieClip = null;
         if(param2 <= 0)
         {
            param2 = 1;
         }
         if(param2 == 1)
         {
            _loc4_ = new §1t7517s0§();
         }
         else if(param2 == 2)
         {
            _loc4_ = new §1t7521s0§();
         }
         else if(param2 == 3)
         {
            _loc4_ = new §1t7522s0§();
         }
         var _loc5_:int = §1t24s0§.§1t8797s0§(param1).§1t968s0§;
         if(_loc5_ != -1)
         {
            _loc4_.§1t7519s0§.visible = true;
            _loc4_.§1t7519s0§.gotoAndStop(_loc5_ + param3 * 100);
            this.§1t7612s0§(_loc4_,this.scale);
         }
         else
         {
            _loc4_.§1t7519s0§.visible = false;
            _loc4_.§1t7519s0§.stop();
         }
         var _loc6_:int = §1t24s0§.§1t8797s0§(param1).§1t969s0§;
         if(_loc6_ != -1)
         {
            _loc4_.collectIcon.gotoAndStop(_loc6_ + 1);
            _loc4_.collectIcon.buttonMode = true;
         }
         else if(param1 == §1t24s0§.§1t8767s0§)
         {
            _loc4_.collectIcon.gotoAndStop(7);
            _loc4_.collectIcon.buttonMode = true;
         }
         else if(param1 == §1t24s0§.§1t8769s0§)
         {
            _loc4_.collectIcon.gotoAndStop("1t566s0");
            _loc4_.collectIcon.buttonMode = true;
         }
         else
         {
            _loc4_.collectIcon.stop();
         }
         _loc4_.collectIcon.visible = false;
         _loc4_.mouseEnabled = false;
         _loc4_.mouseChildren = false;
         return _loc4_;
      }
      
      internal function §1t7604s0§(param1:int) : MovieClip
      {
         return §1t1522s0§.§1t9322s0§("bgbuilding_" + param1);
      }
      
      internal function §1t7605s0§(param1:int, param2:int, param3:MovieClip) : *
      {
         var _loc4_:§1t28s0§ = null;
         if(param2 + 1 < this.§1t916s0§.§1t568s0§)
         {
            _loc4_ = this.§1t916s0§.§1t558s0§[param1][param2 + 1];
            param3.stairsup.visible = _loc4_ != null && _loc4_.§1t928s0§() == §1t24s0§.§1t8764s0§;
         }
         if(param2 - 1 >= 0)
         {
            _loc4_ = this.§1t916s0§.§1t558s0§[param1][param2 - 1];
            param3.stairsdown.visible = _loc4_ != null && _loc4_.§1t928s0§() == §1t24s0§.§1t8764s0§;
         }
      }
      
      public function destroy() : *
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         this.§1t7619s0§();
         _loc1_ = this.§1t7554s0§.numChildren;
         _loc2_ = 0;
         while(_loc2_ < _loc1_)
         {
            this.§1t7554s0§.removeChildAt(0);
            _loc2_++;
         }
         _loc1_ = this.§1t7552s0§.numChildren;
         _loc2_ = 0;
         while(_loc2_ < _loc1_)
         {
            this.§1t7552s0§.removeChildAt(0);
            _loc2_++;
         }
         _loc1_ = this.§1t7555s0§.numChildren;
         _loc2_ = 0;
         while(_loc2_ < _loc1_)
         {
            this.§1t7555s0§.removeChildAt(0);
            _loc2_++;
         }
         this.§1t7578s0§ = null;
         this.§1t7579s0§ = null;
         this.§1t7580s0§ = null;
         this.§1t7568s0§ = null;
         this.§1t7530s0§.destroy();
         this.§1t7535s0§.destroy();
         this.§1t7544s0§.destroy();
         this.§1t7541s0§.destroy();
         this.§1t7551s0§.destroy();
         this.§1t7553s0§.destroy();
         this.§1t7545s0§.destroy();
         this.§1t7549s0§.destroy();
         this.§1t916s0§.destroy();
         this.§1t916s0§ = null;
      }
      
      internal function §1t7194s0§(param1:int) : *
      {
         if(this.§1t7572s0§ * this.scale < this.§1t7574s0§)
         {
            return;
         }
         this.§1t7554s0§.x += param1;
         if(param1 < 0 && this.§1t7554s0§.x < this.§1t7574s0§ - this.§1t7572s0§ * this.scale)
         {
            this.§1t7554s0§.x = this.§1t7574s0§ - this.§1t7572s0§ * this.scale;
         }
         else if(param1 > 0 && this.§1t7554s0§.x >= 0)
         {
            this.§1t7554s0§.x = 0;
         }
         this.§1t7552s0§.x = this.§1t7554s0§.x;
         this.§1t7555s0§.x = this.§1t7554s0§.x;
         this.bg.§1t7192s0§(this.§1t7554s0§.x);
      }
      
      internal function §1t7195s0§(param1:int) : *
      {
         if(param1 > 0 && this.§1t7554s0§.y >= (this.§1t916s0§.§1t568s0§ - this.§1t916s0§.§1t569s0§ + 2) * §1t24s0§.§1t8775s0§ * this.scale)
         {
            return;
         }
         if(this.§1t7570s0§ && param1 < 0 && this.§1t7554s0§.y <= this.§1t7575s0§ - (this.§1t916s0§.§1t569s0§ + 2) * §1t24s0§.§1t8775s0§ * this.scale)
         {
            return;
         }
         if(!this.§1t7570s0§ && param1 < 0 && this.§1t7554s0§.y <= this.§1t2184s0§)
         {
            return;
         }
         this.§1t7554s0§.y += param1;
         if(param1 > 0 && this.§1t7554s0§.y > (this.§1t916s0§.§1t568s0§ - this.§1t916s0§.§1t569s0§ + 2) * §1t24s0§.§1t8775s0§ * this.scale)
         {
            this.§1t7554s0§.y = (this.§1t916s0§.§1t568s0§ - this.§1t916s0§.§1t569s0§ + 2) * §1t24s0§.§1t8775s0§ * this.scale;
         }
         else if(this.§1t7570s0§ && param1 < 0 && this.§1t7554s0§.y < this.§1t7575s0§ - (this.§1t916s0§.§1t569s0§ + 2) * §1t24s0§.§1t8775s0§ * this.scale)
         {
            this.§1t7554s0§.y = this.§1t7575s0§ - (this.§1t916s0§.§1t569s0§ + 2) * §1t24s0§.§1t8775s0§ * this.scale;
         }
         else if(!this.§1t7570s0§ && param1 < 0 && this.§1t7554s0§.y < this.§1t2184s0§)
         {
            this.§1t7554s0§.y = this.§1t2184s0§;
         }
         this.§1t7552s0§.y = this.§1t7554s0§.y;
         this.§1t7555s0§.y = this.§1t7554s0§.y;
         this.bg.§1t7193s0§(this.§1t7554s0§.y);
      }
      
      internal function §1t7606s0§() : *
      {
         if(this.§1t7554s0§.x < this.§1t7574s0§ - this.§1t7572s0§ * this.scale)
         {
            this.§1t7554s0§.x = this.§1t7574s0§ - this.§1t7572s0§ * this.scale;
         }
         else if(this.§1t7554s0§.x >= 0)
         {
            this.§1t7554s0§.x = 0;
         }
         if(this.§1t7554s0§.y > (this.§1t916s0§.§1t568s0§ - this.§1t916s0§.§1t569s0§ + 2) * §1t24s0§.§1t8775s0§ * this.scale)
         {
            this.§1t7554s0§.y = (this.§1t916s0§.§1t568s0§ - this.§1t916s0§.§1t569s0§ + 2) * §1t24s0§.§1t8775s0§ * this.scale;
         }
         else if(this.§1t7570s0§ && this.§1t7554s0§.y < this.§1t7575s0§ - (this.§1t916s0§.§1t569s0§ + 2) * §1t24s0§.§1t8775s0§ * this.scale)
         {
            this.§1t7554s0§.y = this.§1t7575s0§ - (this.§1t916s0§.§1t569s0§ + 2) * §1t24s0§.§1t8775s0§ * this.scale;
         }
         else if(!this.§1t7570s0§ && this.§1t7554s0§.y < this.§1t2184s0§)
         {
            this.§1t7554s0§.y = this.§1t2184s0§;
         }
      }
      
      internal function §1t7607s0§(param1:int, param2:int) : *
      {
         this.§1t7194s0§(param1);
         this.§1t7195s0§(param2);
      }
      
      internal function §1t7608s0§(param1:Number) : *
      {
         var _loc3_:MovieClip = null;
         var _loc5_:int = 0;
         var _loc2_:Boolean = param1 < this.scale;
         this.scale = param1;
         this.§1t7561s0§.scaleX = this.scale;
         this.§1t7561s0§.scaleY = this.scale;
         this.§1t7613s0§(this.§1t7554s0§,this.§1t7574s0§ / 2,this.§1t7575s0§ / 2,this.scale);
         this.§1t7552s0§.scaleX = this.scale;
         this.§1t7552s0§.scaleY = this.scale;
         this.§1t7555s0§.scaleX = this.scale;
         this.§1t7555s0§.scaleY = this.scale;
         this.bg.§1t3307s0§(this.scale);
         if(_loc2_)
         {
            if(this.scale == 1)
            {
               this.§1t7554s0§.x = 0;
               this.§1t7554s0§.y = this.§1t2184s0§;
            }
            else
            {
               this.§1t7606s0§();
            }
         }
         this.§1t7552s0§.x = this.§1t7554s0§.x;
         this.§1t7552s0§.y = this.§1t7554s0§.y;
         this.§1t7555s0§.x = this.§1t7554s0§.x;
         this.§1t7555s0§.y = this.§1t7554s0§.y;
         this.bg.§1t7192s0§(this.§1t7554s0§.x);
         this.bg.§1t7193s0§(this.§1t7554s0§.y);
         var _loc4_:int = 0;
         while(_loc4_ < this.§1t916s0§.§1t568s0§)
         {
            _loc5_ = 0;
            while(_loc5_ < this.§1t916s0§.§1t570s0§)
            {
               _loc3_ = this.§1t7568s0§[_loc5_][_loc4_];
               if(_loc3_ != null && _loc3_.§1t12819s0§ != null)
               {
                  this.§1t7612s0§(_loc3_.§1t12819s0§,this.scale);
               }
               _loc5_++;
            }
            _loc4_++;
         }
         this.§1t7609s0§();
         if(_loc2_ && this.scale == 1)
         {
            this.§1t916s0§.§1t605s0§();
         }
         else if(!_loc2_ && this.scale == 2)
         {
            this.§1t916s0§.§1t606s0§();
         }
      }
      
      public function §1t7609s0§() : *
      {
         if(this.scale == 4)
         {
            this.§1t7565s0§.visible = true;
            this.§1t7564s0§.visible = false;
            this.§1t7564s0§.x = 243;
            this.§1t7565s0§.x = 243;
         }
         else if(this.scale == 2)
         {
            this.§1t7565s0§.visible = true;
            this.§1t7564s0§.visible = true;
            this.§1t7564s0§.x = 243;
            this.§1t7565s0§.x = 343;
         }
         else if(this.scale == 1)
         {
            this.§1t7565s0§.visible = false;
            this.§1t7564s0§.visible = true;
            this.§1t7564s0§.x = 243;
            this.§1t7565s0§.x = 343;
         }
         this.§1t7566s0§.x = this.§1t7564s0§.x;
         this.§1t7567s0§.x = this.§1t7565s0§.x;
         if(this.§1t916s0§.§1t577s0§() < 2)
         {
            this.§1t7565s0§.visible = false;
         }
      }
      
      internal function §1t7610s0§(param1:MouseEvent) : *
      {
         if(this.scale < 4)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
            this.§1t7608s0§(this.scale * 2);
         }
      }
      
      internal function §1t7611s0§(param1:MouseEvent) : *
      {
         if(this.scale > 1)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
            this.§1t7608s0§(this.scale / 2);
         }
      }
      
      internal function §1t7612s0§(param1:MovieClip, param2:Number) : *
      {
         if(param2 == 1)
         {
            if(param1.§1t7519s0§.scaleX == 0.8)
            {
               return;
            }
            param1.§1t7519s0§.scaleX = 0.8;
            param1.§1t7519s0§.scaleY = 0.8;
            param1.§1t7519s0§.x = param1.width - 20;
            param1.§1t7519s0§.y = -26;
            param1.collectIcon.scaleX = 0.8;
            param1.collectIcon.scaleY = 0.8;
         }
         else if(param2 == 2)
         {
            if(param1.§1t7519s0§.scaleX == 0.5)
            {
               return;
            }
            param1.§1t7519s0§.scaleX = 0.5;
            param1.§1t7519s0§.scaleY = 0.5;
            param1.§1t7519s0§.x = param1.width - 12;
            param1.§1t7519s0§.y = -30;
            param1.collectIcon.scaleX = 0.8;
            param1.collectIcon.scaleY = 0.8;
         }
         else if(param2 == 4)
         {
            if(param1.§1t7519s0§.scaleX == 0.25)
            {
               return;
            }
            param1.§1t7519s0§.scaleX = 0.25;
            param1.§1t7519s0§.scaleY = 0.25;
            param1.§1t7519s0§.x = param1.width - 8.5;
            param1.§1t7519s0§.y = -33;
            param1.collectIcon.scaleX = 0.8;
            param1.collectIcon.scaleY = 0.8;
         }
      }
      
      internal function §1t7613s0§(param1:MovieClip, param2:int, param3:int, param4:Number) : *
      {
         var _loc5_:Point = new Point(param2,param3);
         var _loc6_:Number = param4 / param1.scaleX;
         var _loc7_:Matrix = param1.transform.matrix;
         _loc7_.translate(-_loc5_.x,-_loc5_.y);
         _loc7_.scale(_loc6_,_loc6_);
         _loc7_.translate(_loc5_.x,_loc5_.y);
         param1.transform.matrix = _loc7_;
      }
      
      internal function §1t7614s0§(param1:MouseEvent) : *
      {
         if(this.§1t7622s0§())
         {
            return;
         }
         var _loc2_:int = (param1.stageX - §1t1523s0§.§1t9359s0§) / §1t1523s0§.§1t9358s0§;
         var _loc3_:int = (param1.stageY - §1t1523s0§.§1t9360s0§) / §1t1523s0§.§1t9358s0§;
         var _loc4_:int = Math.floor(((_loc2_ - this.§1t7554s0§.x) / this.scale - this.§1t5098s0§) / §1t24s0§.§1t8776s0§);
         var _loc5_:int = Math.floor(-((_loc3_ - this.§1t7554s0§.y) / this.scale - 8) / §1t24s0§.§1t8775s0§) + this.§1t916s0§.§1t569s0§;
         if(_loc4_ < 0 || _loc4_ >= this.§1t916s0§.§1t570s0§ || _loc5_ < 0 || _loc5_ > this.§1t916s0§.§1t568s0§)
         {
            this.§1t7619s0§();
         }
         else
         {
            this.§1t7508s0§ = this.§1t916s0§.§1t558s0§[_loc4_][_loc5_];
            if(this.§1t7508s0§ != null)
            {
               this.§1t5090s0§ = this.§1t7568s0§[this.§1t7508s0§.§1t921s0§][this.§1t7508s0§.§1t922s0§];
               if(this.§1t916s0§.§1t577s0§() >= 2)
               {
                  this.editButton.visible = true;
               }
               this.§1t7584s0§(false);
               this.§1t7553s0§.show(this.§1t7508s0§);
               this.§1t7551s0§.hide();
               if(this.§1t7508s0§.§1t925s0§)
               {
                  if(this.§1t7508s0§.§1t928s0§() == §1t24s0§.§1t8767s0§)
                  {
                     §1t406s0§.instance.§1t6549s0§(this.§1t916s0§);
                  }
                  else if(this.§1t7508s0§.§1t928s0§() == §1t24s0§.§1t8769s0§)
                  {
                     this.§1t7544s0§.show(this.§1t7508s0§);
                     this.§1t7508s0§.§1t925s0§ = false;
                     §1t88s0§.instance.§1t1516s0§("Snd_click");
                  }
                  else
                  {
                     this.§1t7508s0§.§1t621s0§(§1t24s0§.§1t1847s0§());
                     this.§1t7616s0§(this.§1t7508s0§.§1t926s0§.getLevel(this.§1t7508s0§.§1t931s0§()),_loc2_,_loc3_);
                     §1t114s0§.instance.§1t1539s0§();
                     §1t88s0§.instance.§1t1516s0§("Snd_upgradeSkill");
                  }
                  this.§1t5090s0§.§1t12819s0§.collectIcon.visible = false;
               }
               else
               {
                  §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
               }
               this.§1t7556s0§.x = this.§1t7587s0§(this.§1t7508s0§.§1t921s0§);
               this.§1t7556s0§.y = this.§1t7588s0§(this.§1t7508s0§.§1t922s0§);
               this.§1t7556s0§.gotoAndStop(this.§1t7508s0§.§1t935s0§());
               this.§1t7556s0§.visible = true;
               this.§1t7555s0§.addChild(this.§1t7556s0§);
            }
            else
            {
               this.§1t7619s0§();
            }
         }
      }
      
      internal function §1t7615s0§(param1:MouseEvent) : *
      {
         if(this.§1t7622s0§())
         {
            return;
         }
         this.§1t7619s0§();
      }
      
      internal function §1t7616s0§(param1:§1t33s0§, param2:int, param3:int, param4:§1t413s0§ = null) : *
      {
         var _loc5_:int = 0;
         var _loc6_:§1t414s0§ = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc10_:int = 0;
         this.§1t7528s0§.x = param2;
         this.§1t7528s0§.y = param3;
         this.§1t7528s0§.rotation = Math.random() * 360;
         this.§1t7528s0§.gotoAndPlay(1);
         this.§1t7528s0§.visible = true;
         var _loc9_:int = 0;
         while(_loc9_ < §1t24s0§.§1t8754s0§)
         {
            if(param4 != null)
            {
               _loc5_ = param4.§1t992s0§(_loc9_);
               if(_loc9_ == §1t24s0§.§1t8753s0§)
               {
                  _loc5_ += param4.loot.length;
               }
            }
            else
            {
               _loc5_ = param1.§1t986s0§(_loc9_);
            }
            if(_loc9_ == §1t24s0§.§1t8748s0§)
            {
               _loc7_ = 11 + 60;
               _loc8_ = 26;
            }
            else if(_loc9_ == §1t24s0§.§1t8749s0§)
            {
               _loc7_ = 750;
               _loc8_ = 80;
            }
            else if(_loc9_ == §1t24s0§.§1t8750s0§)
            {
               _loc7_ = 750;
               _loc8_ = 110;
            }
            else if(_loc9_ == §1t24s0§.§1t8751s0§)
            {
               _loc7_ = 750;
               _loc8_ = 140;
            }
            else if(_loc9_ == §1t24s0§.§1t8752s0§)
            {
               _loc7_ = 750;
               _loc8_ = 180;
            }
            else if(_loc9_ == §1t24s0§.§1t8747s0§)
            {
               _loc7_ = 0;
               _loc8_ = 400;
            }
            else if(_loc9_ == §1t24s0§.§1t8753s0§)
            {
               _loc7_ = 800;
               _loc8_ = 480;
            }
            _loc7_ = (_loc7_ - §1t1523s0§.§1t9359s0§) / §1t1523s0§.§1t9358s0§;
            _loc8_ = (_loc8_ - §1t1523s0§.§1t9360s0§) / §1t1523s0§.§1t9358s0§;
            if(_loc5_ > 5)
            {
               _loc5_ = 5;
            }
            if(param4 != null && _loc5_ > 3)
            {
               _loc5_ = 3;
            }
            _loc10_ = 0;
            while(_loc10_ < _loc5_)
            {
               _loc6_ = this.§1t7581s0§.§1t866s0§();
               this.§1t7582s0§.push(_loc6_);
               _loc6_.init(_loc9_,param2,param3,_loc7_,_loc8_);
               addChild(_loc6_);
               _loc10_++;
            }
            _loc9_++;
         }
      }
      
      internal function §1t7617s0§() : *
      {
         this.§1t6457s0§.visible = false;
         this.§1t7557s0§.visible = false;
         this.§1t7538s0§.visible = false;
         this.§1t7562s0§.visible = false;
         this.§1t7531s0§.visible = false;
         this.§1t7542s0§.visible = false;
         this.§1t7558s0§.visible = false;
         this.§1t7539s0§.visible = false;
         this.§1t7563s0§.visible = false;
         this.§1t7532s0§.visible = false;
         this.§1t7543s0§.visible = false;
         this.§1t7619s0§();
         this.closeWindow.visible = false;
         this.§1t7529s0§.visible = false;
         this.nodeName.visible = false;
         this.§1t7584s0§(false);
         this.§1t5163s0§.visible = false;
         this.§1t7564s0§.visible = false;
         this.§1t7565s0§.visible = false;
      }
      
      public function §1t7618s0§() : *
      {
         this.§1t6457s0§.visible = true;
         this.§1t7557s0§.visible = true;
         this.§1t7538s0§.visible = true;
         this.§1t7562s0§.visible = true;
         this.§1t7531s0§.visible = true;
         this.§1t7542s0§.visible = true;
         this.§1t7558s0§.visible = true;
         this.§1t7539s0§.visible = true;
         this.§1t7563s0§.visible = true;
         this.§1t7532s0§.visible = true;
         this.§1t7543s0§.visible = true;
         this.§1t7529s0§.visible = true;
         this.nodeName.visible = true;
         this.§1t7584s0§(true);
         this.§1t7609s0§();
         this.closeWindow.visible = true;
      }
      
      internal function §1t7619s0§() : *
      {
         this.§1t7556s0§.visible = false;
         this.§1t7508s0§ = null;
         this.§1t5090s0§ = null;
         if(this.§1t7576s0§ != null)
         {
            this.§1t7576s0§.§1t7351s0§(false);
         }
         this.§1t7576s0§ = null;
         this.§1t7592s0§();
         this.§1t7561s0§.visible = false;
         this.§1t7553s0§.hide();
         this.§1t7551s0§.hide();
         this.editButton.visible = false;
         this.§1t7584s0§(true);
         this.nodeName.label.text = this.§1t916s0§.§1t578s0§();
         §1t412s0§.instance.§1t7550s0§.text = "";
      }
      
      internal function §1t7620s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         if(this.§1t7508s0§ == null || this.§1t916s0§.§1t577s0§() < 2)
         {
            this.§1t7530s0§.show();
         }
         else
         {
            this.§1t7535s0§.show(this.§1t7508s0§,this.§1t916s0§);
         }
      }
      
      internal function §1t7621s0§(param1:MouseEvent) : *
      {
         if(this.§1t7622s0§())
         {
            return;
         }
         param1.stopImmediatePropagation();
         this.§1t7619s0§();
         var _loc2_:§1t29s0§ = §1t29s0§(param1.target);
         this.§1t7576s0§ = _loc2_;
         this.§1t7576s0§.§1t7351s0§(true);
         this.§1t7060s0§ = true;
         this.§1t7058s0§ = (param1.stageX - §1t1523s0§.§1t9359s0§) / §1t1523s0§.§1t9358s0§;
         this.§1t7059s0§ = (param1.stageY - §1t1523s0§.§1t9360s0§) / §1t1523s0§.§1t9358s0§;
         this.§1t7576s0§.§1t7338s0§();
      }
      
      internal function §1t7622s0§() : Boolean
      {
         return this.§1t7530s0§.visible || this.§1t7544s0§.visible || this.§1t7541s0§.visible || this.§1t7535s0§.visible || this.§1t7545s0§.visible || this.§1t7549s0§.visible || §1t406s0§.instance.§1t5947s0§.visible || this.§1t7548s0§.visible;
      }
      
      internal function §1t7071s0§(param1:MouseEvent) : *
      {
         if(this.§1t7551s0§.visible && this.§1t7551s0§.hitTestPoint(param1.stageX,param1.stageY))
         {
            return;
         }
         if(this.§1t7622s0§())
         {
            return;
         }
         if(this.§1t7576s0§ != null)
         {
            this.§1t7576s0§.§1t7351s0§(false);
         }
         this.§1t7576s0§ = null;
         this.§1t7060s0§ = true;
         this.§1t7058s0§ = (param1.stageX - §1t1523s0§.§1t9359s0§) / §1t1523s0§.§1t9358s0§;
         this.§1t7059s0§ = (param1.stageY - §1t1523s0§.§1t9360s0§) / §1t1523s0§.§1t9358s0§;
      }
      
      internal function §1t7072s0§(param1:MouseEvent) : *
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Boolean = false;
         if(this.§1t7622s0§())
         {
            return;
         }
         var _loc2_:int = (param1.stageX - §1t1523s0§.§1t9359s0§) / §1t1523s0§.§1t9358s0§;
         var _loc3_:int = (param1.stageY - §1t1523s0§.§1t9360s0§) / §1t1523s0§.§1t9358s0§;
         if(this.§1t7576s0§ != null)
         {
            if(!this.§1t7577s0§)
            {
               this.§1t7551s0§.show(this.§1t7576s0§);
               this.§1t7553s0§.hide();
               §1t88s0§.instance.§1t1516s0§("Snd_back");
            }
            else
            {
               _loc4_ = Math.floor(((_loc2_ - this.§1t7554s0§.x) / this.scale - this.§1t5098s0§) / §1t24s0§.§1t8776s0§);
               _loc5_ = Math.floor(-((_loc3_ - this.§1t7554s0§.y) / this.scale - 0) / §1t24s0§.§1t8775s0§) + this.§1t916s0§.§1t569s0§;
               if(_loc4_ < 0 || _loc4_ >= this.§1t916s0§.§1t570s0§ || _loc5_ < 0 || _loc5_ > this.§1t916s0§.§1t568s0§)
               {
                  this.§1t7619s0§();
               }
               else
               {
                  this.§1t7508s0§ = this.§1t916s0§.§1t558s0§[_loc4_][_loc5_];
                  if(this.§1t7508s0§ != null)
                  {
                     if(this.§1t7508s0§.§1t928s0§() == §1t24s0§.§1t8769s0§ && this.§1t7576s0§.§1t3312s0§())
                     {
                        §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
                        §1t406s0§.instance.§1t6527s0§("",§1t1521s0§.getString(5));
                        §1t406s0§.instance.§1t6486s0§.§1t5482s0§(§1t1521s0§.getString(22077,["<font color=\'#FFCC00\'>" + §1t1523s0§.charname + "</font>"]));
                     }
                     _loc6_ = false;
                     if(this.§1t7576s0§.§1t7305s0§)
                     {
                        if(!this.§1t7576s0§.§1t7306s0§ && !this.§1t7576s0§.§1t3312s0§() && this.§1t916s0§.§1t628s0§())
                        {
                           this.§1t7619s0§();
                           this.§1t7060s0§ = false;
                           this.§1t7577s0§ = false;
                           §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
                           §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(22073),§1t1521s0§.getString(5));
                           return;
                        }
                        _loc6_ = true;
                        if(this.§1t7576s0§.§1t7352s0§())
                        {
                           this.§1t7548s0§.show(this.§1t7576s0§);
                        }
                        this.§1t7576s0§.§1t7355s0§(false);
                        this.§1t916s0§.§1t602s0§(this.§1t7576s0§);
                        this.§1t7595s0§();
                     }
                     this.§1t916s0§.§1t610s0§(this.§1t7576s0§,this.§1t7508s0§,true,this.§1t7561s0§.scaleX > 0);
                     this.§1t7561s0§.visible = false;
                     if(!this.§1t7548s0§.visible)
                     {
                        this.§1t7551s0§.show(this.§1t7576s0§);
                     }
                     §1t88s0§.instance.§1t1516s0§("Snd_click");
                     this.§1t7553s0§.hide();
                     if(_loc6_)
                     {
                        this.§1t916s0§.§1t622s0§();
                        this.§1t7624s0§();
                     }
                     this.§1t7576s0§.§1t927s0§ = true;
                     §1t114s0§.instance.§1t1530s0§(§1t114s0§.§1t9962s0§);
                     §1t114s0§.instance.§1t1539s0§();
                  }
                  else
                  {
                     this.§1t7619s0§();
                  }
               }
            }
         }
         this.§1t7060s0§ = false;
         this.§1t7577s0§ = false;
      }
      
      public function update(param1:int) : *
      {
         var _loc2_:* = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:§1t29s0§ = null;
         if(!visible)
         {
            return;
         }
         if(this.§1t916s0§ != null)
         {
            this.§1t916s0§.update(param1);
         }
         if(this.§1t7553s0§.visible)
         {
            this.§1t7553s0§.update(param1);
         }
         if(this.§1t7551s0§.visible)
         {
            this.§1t7551s0§.update(param1);
         }
         if(this.§1t7544s0§.visible)
         {
            this.§1t7544s0§.update(param1);
         }
         if(this.§1t7060s0§)
         {
            _loc4_ = (stage.mouseX - §1t1523s0§.§1t9359s0§) / §1t1523s0§.§1t9358s0§;
            _loc5_ = (stage.mouseY - §1t1523s0§.§1t9360s0§) / §1t1523s0§.§1t9358s0§;
            if(_loc5_ < 0 || _loc5_ > §1t1523s0§.stageHeight || _loc4_ < 0 || _loc4_ > §1t1523s0§.stageWidth)
            {
               this.§1t7060s0§ = false;
               this.§1t7577s0§ = false;
               this.§1t7619s0§();
               return;
            }
            if(this.§1t7576s0§ != null)
            {
               _loc6_ = _loc4_ - this.§1t7058s0§;
               if(!this.§1t7577s0§)
               {
                  _loc7_ = _loc5_ - this.§1t7059s0§;
                  if(Math.abs(_loc6_) + Math.abs(_loc7_) > 3)
                  {
                     this.§1t7561s0§.visible = true;
                     this.§1t7561s0§.x = _loc4_;
                     this.§1t7561s0§.y = _loc5_;
                     this.§1t7561s0§.gotoAndStop(2);
                     this.§1t7577s0§ = true;
                     if(_loc6_ > 0)
                     {
                        this.§1t7561s0§.scaleX = Math.abs(this.§1t7561s0§.scaleX);
                     }
                     else
                     {
                        this.§1t7561s0§.scaleX = -Math.abs(this.§1t7561s0§.scaleX);
                     }
                  }
               }
               else
               {
                  if(_loc4_ > this.§1t7574s0§ - 50)
                  {
                     this.§1t7607s0§(-10,0);
                  }
                  else if(_loc4_ < 50)
                  {
                     this.§1t7607s0§(10,0);
                  }
                  if(_loc5_ > this.§1t7575s0§ - 50)
                  {
                     this.§1t7607s0§(0,-10);
                  }
                  else if(_loc5_ < 50)
                  {
                     this.§1t7607s0§(0,10);
                  }
                  this.§1t7561s0§.x = _loc4_;
                  this.§1t7561s0§.y = _loc5_;
                  if(_loc6_ >= -5 && _loc6_ <= 5)
                  {
                     if(this.§1t7561s0§.currentFrame != 2)
                     {
                        this.§1t7561s0§.gotoAndStop(2);
                     }
                     if(_loc6_ > 0 && this.§1t7561s0§.scaleX < 0)
                     {
                        this.§1t7561s0§.scaleX = Math.abs(this.§1t7561s0§.scaleX);
                     }
                     else if(_loc6_ < 0 && this.§1t7561s0§.scaleX > 0)
                     {
                        this.§1t7561s0§.scaleX = -Math.abs(this.§1t7561s0§.scaleX);
                     }
                  }
                  else
                  {
                     if(this.§1t7561s0§.currentFrame != 1)
                     {
                        this.§1t7561s0§.gotoAndStop(1);
                     }
                     if(_loc6_ > 0 && this.§1t7561s0§.scaleX < 0)
                     {
                        this.§1t7561s0§.scaleX = Math.abs(this.§1t7561s0§.scaleX);
                     }
                     else if(_loc6_ < 0 && this.§1t7561s0§.scaleX > 0)
                     {
                        this.§1t7561s0§.scaleX = -Math.abs(this.§1t7561s0§.scaleX);
                     }
                  }
               }
            }
            else if(_loc4_ != this.§1t7058s0§ && _loc5_ != this.§1t7059s0§ && !this.§1t7530s0§.visible)
            {
               _loc6_ = _loc4_ - this.§1t7058s0§;
               _loc7_ = _loc5_ - this.§1t7059s0§;
               if(Math.abs(_loc6_) + Math.abs(_loc7_) > 3)
               {
                  this.§1t7607s0§(_loc6_,_loc7_);
               }
            }
            this.§1t7058s0§ = _loc4_;
            this.§1t7059s0§ = _loc5_;
         }
         else if(this.§1t916s0§ != null)
         {
            _loc3_ = int(this.§1t916s0§.§1t553s0§.length);
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               _loc8_ = this.§1t916s0§.§1t553s0§[_loc2_];
               if(this.scale > 1 && _loc8_.hitTestPoint(stage.mouseX,stage.mouseY))
               {
                  _loc8_.§1t3269s0§(§1t1544s0§.§1t11141s0§);
               }
               _loc2_++;
            }
         }
         _loc3_ = int(this.§1t7582s0§.length);
         _loc2_ = int(_loc3_ - 1);
         while(_loc2_ >= 0)
         {
            this.§1t7582s0§[_loc2_].update();
            _loc2_--;
         }
      }
      
      public function §1t7623s0§(param1:§1t414s0§) : *
      {
         this.§1t7581s0§.§1t867s0§(param1);
         removeChild(param1);
         var _loc2_:int = this.§1t7582s0§.indexOf(param1);
         if(_loc2_ != -1)
         {
            this.§1t7582s0§.splice(_loc2_,1);
         }
      }
      
      public function §1t7624s0§() : *
      {
         this.§1t7539s0§.text = this.§1t916s0§.§1t579s0§(§1t24s0§.§1t8749s0§).toString();
         this.§1t7538s0§.bar.scaleX = this.§1t916s0§.§1t579s0§(§1t24s0§.§1t8749s0§) / this.§1t916s0§.§1t565s0§[§1t24s0§.§1t8749s0§];
         this.§1t7563s0§.text = this.§1t916s0§.§1t579s0§(§1t24s0§.§1t8750s0§).toString();
         this.§1t7562s0§.bar.scaleX = this.§1t916s0§.§1t579s0§(§1t24s0§.§1t8750s0§) / this.§1t916s0§.§1t565s0§[§1t24s0§.§1t8750s0§];
         this.§1t7543s0§.text = this.§1t916s0§.§1t579s0§(§1t24s0§.§1t8752s0§).toString();
         this.§1t7542s0§.bar.scaleX = this.§1t916s0§.§1t579s0§(§1t24s0§.§1t8752s0§) / this.§1t916s0§.§1t565s0§[§1t24s0§.§1t8752s0§];
         this.§1t7532s0§.text = this.§1t916s0§.§1t579s0§(§1t24s0§.§1t8751s0§).toString();
         this.§1t7531s0§.bar.scaleX = this.§1t916s0§.§1t579s0§(§1t24s0§.§1t8751s0§) / this.§1t916s0§.§1t565s0§[§1t24s0§.§1t8751s0§];
         this.§1t7558s0§.text = this.§1t916s0§.§1t579s0§(§1t24s0§.§1t8747s0§).toString();
         this.§1t7557s0§.bar.scaleX = this.§1t916s0§.§1t579s0§(§1t24s0§.§1t8747s0§) / this.§1t916s0§.§1t565s0§[§1t24s0§.§1t8747s0§];
         this.§1t6457s0§.coins.coinstext.text = this.§1t916s0§.§1t579s0§(§1t24s0§.§1t8748s0§).toString();
      }
      
      public function §1t7625s0§(param1:int, param2:int) : *
      {
         this.§1t7568s0§[param1][param2].§1t12819s0§.collectIcon.visible = true;
         §1t3318s0§.instance.§1t3463s0§("tc",true);
      }
      
      public function §1t7626s0§(param1:Boolean) : *
      {
         this.§1t7540s0§.visible = param1;
      }
      
      internal function §1t7627s0§(param1:MouseEvent) : *
      {
         if(this.§1t7622s0§())
         {
            return;
         }
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         this.§1t7541s0§.show();
      }
      
      public function §1t7628s0§() : §1t24s0§
      {
         return this.§1t916s0§;
      }
      
      public function show() : *
      {
         visible = true;
      }
      
      public function §1t5026s0§(param1:MouseEvent) : *
      {
         var _loc2_:§1t414s0§ = null;
         §1t88s0§.instance.§1t1516s0§("Snd_back");
         if(this.§1t916s0§.§1t574s0§.§1t3309s0§() != §1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9402s0§))
         {
            §1t1523s0§.§1t7357s0§(§1t1523s0§.§1t9402s0§,this.§1t916s0§.§1t574s0§.§1t3309s0§());
            §1t3317s0§.instance.§1t1946s0§();
         }
         this.§1t916s0§.§1t644s0§();
         §1t114s0§.instance.§1t1537s0§();
         this.destroy();
         this.removeEventListeners();
         visible = false;
         §1t406s0§.instance.§1t6614s0§();
         §1t1541s0§.§1t10045s0§();
         var _loc3_:int = int(this.§1t7582s0§.length);
         var _loc4_:* = int(_loc3_ - 1);
         while(_loc4_ >= 0)
         {
            _loc2_ = this.§1t7582s0§[_loc4_];
            this.§1t7581s0§.§1t867s0§(_loc2_);
            removeChild(_loc2_);
            _loc4_--;
         }
         this.§1t7582s0§.length = 0;
         §1t1525s0§.§1t9925s0§();
      }
      
      public function §1t7629s0§(param1:int) : *
      {
         this.§1t7608s0§(4);
         this.§1t7608s0§(1);
         this.§1t7608s0§(4);
         if(param1 == 0)
         {
            this.§1t7607s0§(-400,-480);
         }
         else
         {
            this.§1t7607s0§(560,-480);
         }
      }
      
      public function §1t7630s0§(param1:§1t28s0§) : *
      {
         this.§1t7599s0§(param1.§1t921s0§,param1.§1t922s0§);
         this.§1t7593s0§(param1.§1t921s0§,param1.§1t922s0§,param1.§1t928s0§(),param1.§1t929s0§(),param1.§1t933s0§(),param1.§1t931s0§());
      }
      
      public function §1t6899s0§() : *
      {
         this.§1t6457s0§.§1t6660s0§();
         this.§1t7541s0§.§1t6899s0§();
         this.§1t7535s0§.§1t6899s0§();
      }
      
      internal function §1t6553s0§(param1:MouseEvent) : *
      {
         if(§1t3317s0§.instance.§1t1833s0§)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(632),§1t1521s0§.getString(5));
         }
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         §1t406s0§.instance.§1t6498s0§.show();
      }
      
      internal function §1t6554s0§(param1:MouseEvent) : *
      {
         if(§1t3317s0§.instance.§1t1833s0§)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(632),§1t1521s0§.getString(5));
         }
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         this.§1t7617s0§();
         §1t406s0§.instance.§1t6554s0§(null);
      }
      
      internal function §1t6629s0§(param1:MouseEvent) : *
      {
         this.§1t6431s0§.visible = true;
      }
      
      internal function §1t6630s0§(param1:MouseEvent) : *
      {
         this.§1t6431s0§.visible = false;
      }
      
      internal function §1t7631s0§(param1:MouseEvent) : *
      {
         this.§1t7560s0§.visible = true;
      }
      
      internal function §1t7632s0§(param1:MouseEvent) : *
      {
         this.§1t7560s0§.visible = false;
      }
      
      internal function §1t6623s0§(param1:MouseEvent) : *
      {
         this.§1t6443s0§.visible = true;
      }
      
      internal function §1t6624s0§(param1:MouseEvent) : *
      {
         this.§1t6443s0§.visible = false;
      }
      
      internal function §1t6625s0§(param1:MouseEvent) : *
      {
         this.§1t6454s0§.visible = true;
      }
      
      internal function §1t6626s0§(param1:MouseEvent) : *
      {
         this.§1t6454s0§.visible = false;
      }
      
      internal function §1t6566s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         §1t406s0§.instance.§1t6478s0§.show();
         this.§1t7617s0§();
      }
      
      internal function §1t6601s0§(param1:Event) : *
      {
         if(§1t3317s0§.instance.§1t1833s0§ && param1 != null && !§1t1523s0§.§1t9483s0§)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_error");
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(978),§1t1521s0§.getString(5));
            this.§1t6602s0§();
            return;
         }
         if(param1 != null)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         }
         this.§1t5163s0§.visible = !this.§1t5163s0§.visible;
         §1t1523s0§.§1t9671s0§(this.§1t5163s0§.visible);
         if(this.§1t5163s0§.visible)
         {
            this.§1t5163s0§.§1t13123s0§.text = §1t1521s0§.getString(184);
            §1t1540s0§.§1t10025s0§().focus = this.§1t5163s0§.§1t13123s0§;
            this.§1t5163s0§.§1t13123s0§.setSelection(0,this.§1t5163s0§.§1t13123s0§.text.length);
            if(§1t1523s0§.§1t5195s0§ != 3)
            {
               this.§1t5195s0§ = §1t1523s0§.§1t5195s0§ - 1;
               this.§1t5243s0§(null);
            }
            else
            {
               this.§1t6655s0§(null);
            }
            this.§1t5163s0§.§1t13358s0§.scrollV = this.§1t5163s0§.§1t13358s0§.maxScrollV;
            this.§1t5163s0§.§1t16184s0§.scrollV = this.§1t5163s0§.§1t13358s0§.maxScrollV;
            this.§1t7564s0§.visible = false;
            this.§1t7565s0§.visible = false;
         }
         else
         {
            this.§1t6602s0§();
         }
      }
      
      internal function §1t6602s0§() : *
      {
         this.§1t5163s0§.visible = false;
         this.§1t7609s0§();
      }
      
      internal function §1t6557s0§(param1:MouseEvent) : *
      {
         var event:MouseEvent = param1;
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         if(§1t1523s0§.§1t9714s0§(20128) > 0)
         {
            §1t406s0§.instance.§1t6486s0§.§1t5486s0§();
            §1t406s0§.instance.§1t5481s0§(§1t1521s0§.getString(22093),this.§1t7401s0§,function():*
            {
            });
         }
         else
         {
            §1t406s0§.instance.§1t6533s0§();
         }
      }
      
      internal function §1t7401s0§() : *
      {
         §1t1523s0§.§1t9713s0§(20128,-1);
         this.§1t7634s0§(false);
         §1t3317s0§.instance.§1t1946s0§();
         this.§1t7633s0§();
      }
      
      public function §1t7633s0§() : *
      {
         var _loc1_:int = §1t1523s0§.§1t9714s0§(20128);
         if(_loc1_ == 0)
         {
            this.§1t7533s0§.text = "";
         }
         else
         {
            this.§1t7533s0§.text = _loc1_.toString();
         }
      }
      
      public function §1t7634s0§(param1:Boolean) : *
      {
         if(param1)
         {
            §1t3317s0§.instance.§1t1986s0§(7,"ninjacrate",10);
         }
         this.§1t6899s0§();
         this.§1t7549s0§.show();
         §1t3317s0§.instance.§1t1946s0§();
      }
      
      internal function §1t7635s0§(param1:MouseEvent) : *
      {
         §1t88s0§.instance.§1t1516s0§("Snd_click");
         §1t406s0§.instance.§1t6548s0§();
      }
      
      public function §1t5243s0§(param1:MouseEvent) : *
      {
         if(param1 != null)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         }
         ++this.§1t5195s0§;
         if(this.§1t5195s0§ == 4)
         {
            this.§1t6654s0§(null);
            return;
         }
         if(this.§1t5195s0§ == 1)
         {
            this.§1t5195s0§ = 2;
         }
         if(this.§1t5195s0§ == 3 || this.§1t5195s0§ == 2 && §1t1523s0§.§1t7746s0§() == 0)
         {
            this.§1t5195s0§ = 0;
         }
         if(this.§1t5195s0§ == 0)
         {
            this.§1t5163s0§.§1t15893s0§.§1t5769s0§(§1t1521s0§.getString(419));
         }
         else if(this.§1t5195s0§ == 1)
         {
            this.§1t5163s0§.§1t15893s0§.§1t5769s0§(§1t1521s0§.getString(420));
         }
         else if(this.§1t5195s0§ == 2)
         {
            this.§1t5163s0§.§1t15893s0§.§1t5769s0§(§1t1521s0§.getString(421));
         }
         §1t1523s0§.§1t5195s0§ = this.§1t5195s0§;
         this.§1t5240s0§();
      }
      
      public function §1t5238s0§(param1:String, param2:String, param3:String = "") : *
      {
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:* = undefined;
         var _loc7_:Array = null;
         if(param1 + param2 == this.§1t5237s0§ || param2 == "")
         {
            return;
         }
         this.§1t5237s0§ = param1 + param2;
         if(§1t1523s0§.§1t9472s0§)
         {
            if(§1t1541s0§.§1t10100s0§())
            {
               §1t88s0§.instance.§1t1506s0§();
            }
         }
         if(param1 == "")
         {
            if(param3 != "")
            {
               this.§1t5163s0§.§1t13358s0§.htmlText += "<b><font color=\'" + param3 + "\'>" + param2 + "</font></b>";
            }
            else
            {
               this.§1t5163s0§.§1t13358s0§.htmlText += "<b>" + param2 + "</b>";
            }
         }
         else
         {
            _loc4_ = param1.substr(0,1);
            _loc5_ = param1.substr(1,param1.length);
            _loc6_ = _loc4_.toUpperCase() + _loc5_;
            if(param1 != §1t1523s0§.charname)
            {
               if(param3 != "")
               {
                  this.§1t5163s0§.§1t13358s0§.htmlText += "<b><font color=\'" + param3 + "\'><u><a href=\'event:[CHR]" + param1 + "\'>" + _loc6_ + "</a></u>:   " + param2 + "</font></b>";
               }
               else
               {
                  this.§1t5163s0§.§1t13358s0§.htmlText += "<b><u><a href=\'event:[CHR]" + param1 + "\'>" + _loc6_ + "</a></u>:   " + param2 + "</b>";
               }
            }
            else if(param3 != "")
            {
               this.§1t5163s0§.§1t13358s0§.htmlText += "<b><font color=\'" + param3 + "\'>" + _loc6_ + ":   " + param2 + "</font></b>";
            }
            else
            {
               this.§1t5163s0§.§1t13358s0§.htmlText += "<b>" + _loc6_ + ":   " + param2 + "</b>";
            }
         }
         if(this.§1t5163s0§.§1t13358s0§.numLines > 50)
         {
            _loc7_ = this.§1t5163s0§.§1t13358s0§.htmlText.split("</P>");
            _loc7_.splice(0,1);
            this.§1t5163s0§.§1t13358s0§.htmlText = _loc7_.join("</P>") + "</P>";
         }
         if(this.§1t5163s0§.§1t13358s0§.numLines > 10)
         {
            if(this.§1t5163s0§.§1t13358s0§.scrollV >= this.§1t5163s0§.§1t13358s0§.maxScrollV - 3)
            {
               this.§1t5163s0§.§1t13358s0§.scrollV = this.§1t5163s0§.§1t13358s0§.maxScrollV;
            }
            else if(§1t1523s0§.§1t9472s0§ && §1t1540s0§.§1t9550s0§() && !§1t1541s0§.§1t10100s0§())
            {
               §1t88s0§.instance.§1t1506s0§();
            }
         }
         this.§1t5240s0§();
      }
      
      public function §1t6596s0§(param1:String, param2:String, param3:String = "") : *
      {
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:* = undefined;
         var _loc7_:Array = null;
         if(param1 + param2 == this.§1t6595s0§ || param2 == "")
         {
            return;
         }
         this.§1t6595s0§ = param1 + param2;
         if(param1 == "")
         {
            if(param3 != "")
            {
               this.§1t5163s0§.§1t16184s0§.htmlText += "<b><font color=\'" + param3 + "\'>" + param2 + "</font></b>";
            }
            else
            {
               this.§1t5163s0§.§1t16184s0§.htmlText += "<b>" + param2 + "</b>";
            }
         }
         else
         {
            _loc4_ = param1.substr(0,1);
            _loc5_ = param1.substr(1,param1.length);
            _loc6_ = _loc4_.toUpperCase() + _loc5_;
            if(param1 != §1t1523s0§.charname)
            {
               if(param3 != "")
               {
                  this.§1t5163s0§.§1t16184s0§.htmlText += "<b><font color=\'" + param3 + "\'><u><a href=\'event:[CHR]" + param1 + "\'>" + _loc6_ + "</a></u>:   " + param2 + "</font></b>";
               }
               else
               {
                  this.§1t5163s0§.§1t16184s0§.htmlText += "<b><u><a href=\'event:[CHR]" + param1 + "\'>" + _loc6_ + "</a></u>:   " + param2 + "</b>";
               }
            }
            else if(param3 != "")
            {
               this.§1t5163s0§.§1t16184s0§.htmlText += "<b><font color=\'" + param3 + "\'>" + _loc6_ + ":   " + param2 + "</font></b>";
            }
            else
            {
               this.§1t5163s0§.§1t16184s0§.htmlText += "<b>" + _loc6_ + ":   " + param2 + "</b>";
            }
         }
         if(this.§1t5163s0§.§1t16184s0§.numLines > 50)
         {
            _loc7_ = this.§1t5163s0§.§1t16184s0§.htmlText.split("</P>");
            _loc7_.splice(0,1);
            this.§1t5163s0§.§1t16184s0§.htmlText = _loc7_.join("</P>") + "</P>";
         }
         if(this.§1t5163s0§.§1t16184s0§.numLines > 10)
         {
            if(this.§1t5163s0§.§1t16184s0§.scrollV == this.§1t5163s0§.§1t16184s0§.maxScrollV - 1)
            {
               this.§1t5163s0§.§1t16184s0§.scrollV = this.§1t5163s0§.§1t16184s0§.maxScrollV;
            }
         }
         this.§1t5240s0§();
      }
      
      internal function §1t5240s0§() : *
      {
         this.§1t5163s0§.§1t5019s0§.visible = false;
         this.§1t5163s0§.§1t5020s0§.visible = false;
         if(this.§1t5163s0§.§1t13358s0§.visible)
         {
            if(this.§1t5163s0§.§1t13358s0§.numLines <= this.§1t5163s0§.§1t13358s0§.maxScrollV)
            {
               return;
            }
            if(this.§1t5163s0§.§1t13358s0§.scrollV < this.§1t5163s0§.§1t13358s0§.maxScrollV)
            {
               this.§1t5163s0§.§1t5019s0§.visible = true;
            }
            if(this.§1t5163s0§.§1t13358s0§.scrollV > 1)
            {
               this.§1t5163s0§.§1t5020s0§.visible = true;
            }
         }
         else
         {
            if(this.§1t5163s0§.§1t16184s0§.numLines <= this.§1t5163s0§.§1t16184s0§.maxScrollV)
            {
               return;
            }
            if(this.§1t5163s0§.§1t16184s0§.scrollV < this.§1t5163s0§.§1t16184s0§.maxScrollV)
            {
               this.§1t5163s0§.§1t5019s0§.visible = true;
            }
            if(this.§1t5163s0§.§1t16184s0§.scrollV > 1)
            {
               this.§1t5163s0§.§1t5020s0§.visible = true;
            }
         }
      }
      
      internal function §1t5241s0§(param1:Event) : *
      {
         this.§1t5240s0§();
      }
      
      public function §1t5239s0§(param1:String, param2:String = "", param3:Boolean = true) : *
      {
         var _loc4_:Array = null;
         if(param3)
         {
            this.§1t6597s0§(param1,param2);
         }
         if(param2 != "")
         {
            this.§1t5163s0§.§1t13358s0§.htmlText += "<b><font color=\'" + param2 + "\'>" + param1 + "</font></b>";
         }
         else
         {
            this.§1t5163s0§.§1t13358s0§.htmlText += "<b>" + param1 + "</b>";
         }
         if(this.§1t5163s0§.§1t13358s0§.numLines > 50)
         {
            _loc4_ = this.§1t5163s0§.§1t13358s0§.htmlText.split("</P>");
            _loc4_.splice(0,1);
            this.§1t5163s0§.§1t13358s0§.htmlText = _loc4_.join("</P>") + "</P>";
         }
         if(this.§1t5163s0§.§1t13358s0§.numLines > 10)
         {
            if(this.§1t5163s0§.§1t13358s0§.scrollV >= this.§1t5163s0§.§1t13358s0§.maxScrollV - 3)
            {
               this.§1t5163s0§.§1t13358s0§.scrollV = this.§1t5163s0§.§1t13358s0§.maxScrollV;
            }
            else if(§1t1523s0§.§1t9472s0§ && §1t1540s0§.§1t9550s0§() && !§1t1541s0§.§1t10100s0§())
            {
               §1t88s0§.instance.§1t1506s0§();
            }
         }
         this.§1t5240s0§();
      }
      
      public function §1t6597s0§(param1:String, param2:String = "") : *
      {
         var _loc3_:Array = null;
         if(param2 != "")
         {
            this.§1t5163s0§.§1t16184s0§.htmlText += "<b><font color=\'" + param2 + "\'>" + param1 + "</font></b>";
         }
         else
         {
            this.§1t5163s0§.§1t16184s0§.htmlText += "<b>" + param1 + "</b>";
         }
         if(this.§1t5163s0§.§1t16184s0§.numLines > 50)
         {
            _loc3_ = this.§1t5163s0§.§1t16184s0§.htmlText.split("</P>");
            _loc3_.splice(0,1);
            this.§1t5163s0§.§1t16184s0§.htmlText = _loc3_.join("</P>") + "</P>";
         }
         if(this.§1t5163s0§.§1t16184s0§.numLines > 10)
         {
            if(this.§1t5163s0§.§1t16184s0§.scrollV == this.§1t5163s0§.§1t16184s0§.maxScrollV - 1)
            {
               this.§1t5163s0§.§1t16184s0§.scrollV = this.§1t5163s0§.§1t16184s0§.maxScrollV;
            }
         }
         this.§1t5240s0§();
      }
      
      public function §1t6598s0§() : *
      {
         this.§1t5163s0§.§1t13358s0§.htmlText = "";
         this.§1t5163s0§.§1t16184s0§.htmlText = "";
         this.§1t5240s0§();
      }
      
      public function §1t6599s0§(param1:String) : *
      {
         var _loc2_:Array = null;
         this.§1t5163s0§.§1t13358s0§.htmlText += "<b>" + param1 + " connected</b>";
         if(this.§1t5163s0§.§1t13358s0§.numLines > 50)
         {
            _loc2_ = this.§1t5163s0§.§1t13358s0§.htmlText.split("</P>");
            _loc2_.splice(0,1);
            this.§1t5163s0§.§1t13358s0§.htmlText = _loc2_.join("</P>") + "</P>";
         }
         if(this.§1t5163s0§.§1t13358s0§.numLines > 10)
         {
            if(this.§1t5163s0§.§1t13358s0§.scrollV >= this.§1t5163s0§.§1t13358s0§.maxScrollV - 3)
            {
               this.§1t5163s0§.§1t13358s0§.scrollV = this.§1t5163s0§.§1t13358s0§.maxScrollV;
            }
            else if(§1t1523s0§.§1t9472s0§ && §1t1540s0§.§1t9550s0§() && !§1t1541s0§.§1t10100s0§())
            {
               §1t88s0§.instance.§1t1506s0§();
            }
         }
         this.§1t5240s0§();
      }
      
      internal function §1t6654s0§(param1:MouseEvent) : *
      {
         if(param1 != null)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         }
         this.§1t5163s0§.§1t15893s0§.§1t5769s0§(§1t1521s0§.getString(419));
         this.§1t5195s0§ = 0;
         §1t1523s0§.§1t5195s0§ = 0;
         this.§1t5163s0§.§1t16184s0§.visible = false;
         this.§1t5163s0§.§1t13358s0§.visible = true;
         this.§1t5240s0§();
      }
      
      internal function §1t6655s0§(param1:MouseEvent) : *
      {
         if(param1 != null)
         {
            §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
         }
         this.§1t5163s0§.§1t15893s0§.§1t5769s0§(§1t1521s0§.getString(11140));
         this.§1t5195s0§ = 3;
         §1t1523s0§.§1t5195s0§ = 3;
         this.§1t5163s0§.§1t16184s0§.visible = true;
         this.§1t5163s0§.§1t13358s0§.visible = false;
         this.§1t5163s0§.§1t16184s0§.scrollV = this.§1t5163s0§.§1t13358s0§.maxScrollV;
         this.§1t5240s0§();
      }
      
      internal function §1t5244s0§(param1:MouseEvent) : *
      {
         param1.stopPropagation();
         if(this.§1t5163s0§.§1t13123s0§.text == §1t1521s0§.getString(184))
         {
            this.§1t5163s0§.§1t13123s0§.text = "";
         }
      }
      
      internal function §1t5233s0§(param1:KeyboardEvent) : *
      {
         param1.stopImmediatePropagation();
         if(param1.keyCode == 13)
         {
            this.§1t5236s0§();
         }
      }
      
      internal function §1t6603s0§(param1:MouseEvent) : *
      {
         if(this.§1t5163s0§.§1t13123s0§.text != §1t1521s0§.getString(184))
         {
            this.§1t5236s0§();
         }
         §1t1540s0§.§1t10025s0§().focus = this.§1t5163s0§.§1t13123s0§;
      }
      
      internal function §1t5251s0§(param1:MouseEvent) : *
      {
         param1.stopPropagation();
         if(this.§1t5163s0§.§1t13358s0§.visible)
         {
            --this.§1t5163s0§.§1t13358s0§.scrollV;
         }
         else
         {
            --this.§1t5163s0§.§1t16184s0§.scrollV;
         }
         this.§1t5240s0§();
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
      }
      
      internal function §1t5252s0§(param1:MouseEvent) : *
      {
         param1.stopPropagation();
         if(this.§1t5163s0§.§1t13358s0§.visible)
         {
            ++this.§1t5163s0§.§1t13358s0§.scrollV;
         }
         else
         {
            ++this.§1t5163s0§.§1t16184s0§.scrollV;
         }
         this.§1t5240s0§();
         §1t88s0§.instance.§1t1516s0§("Snd_smallClick");
      }
      
      internal function §1t5236s0§() : *
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc1_:Array = this.§1t5163s0§.§1t13123s0§.text.split(" ");
         switch(_loc1_[0])
         {
            case "/help":
               break;
            case "/hidehud":
               this.§1t7617s0§();
               break;
            case "/showhud":
               this.§1t7618s0§();
               break;
            default:
               _loc2_ = §1t406s0§.instance.§1t5322s0§(this.§1t5163s0§.§1t13123s0§.text);
               if(_loc2_ != "")
               {
                  if(_loc2_ == this.§1t5234s0§)
                  {
                     ++this.§1t5235s0§;
                  }
                  else
                  {
                     this.§1t5235s0§ = 0;
                  }
                  this.§1t5234s0§ = _loc2_;
                  if(!§1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9460s0§) && !§1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9461s0§) && !§1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9462s0§))
                  {
                     if(this.§1t5235s0§ >= 5)
                     {
                        §1t1523s0§.§1t9726s0§(§1t1523s0§.§1t9461s0§,5 * 60);
                     }
                  }
                  if(§1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9460s0§))
                  {
                     this.§1t5195s0§ = 1;
                  }
                  _loc3_ = "#FFFFFF";
                  if(this.§1t5195s0§ == 2)
                  {
                     _loc4_ = §1t1523s0§.§1t7746s0§();
                     if(_loc4_ == 1)
                     {
                        _loc3_ = "#FF0000";
                     }
                     else if(_loc4_ == 2)
                     {
                        _loc3_ = "#00FF00";
                     }
                     else if(_loc4_ == 3)
                     {
                        _loc3_ = "#00FFFF";
                     }
                     else if(_loc4_ == 4)
                     {
                        _loc3_ = "#FFCC00";
                     }
                     else if(§1t1523s0§.§1t9663s0§(_loc4_))
                     {
                        _loc3_ = "#FF9900";
                     }
                  }
                  else if(this.§1t5195s0§ == 1)
                  {
                     _loc3_ = "#CCCCCC";
                  }
                  if(!§1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9461s0§))
                  {
                     if(this.§1t5195s0§ != 1)
                     {
                        §1t251s0§.§1t9190s0§().§1t3523s0§(_loc2_,this.§1t5195s0§);
                     }
                     §1t406s0§.instance.§1t5238s0§(§1t1523s0§.charname,_loc2_,_loc3_);
                     this.§1t5238s0§(§1t1523s0§.charname,_loc2_,_loc3_);
                  }
                  §1t3317s0§.instance.§1t1933s0§(_loc2_);
               }
         }
         this.§1t5163s0§.§1t13123s0§.text = "";
      }
   }
}

