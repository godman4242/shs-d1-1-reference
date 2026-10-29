package
{
   import flash.display.DisplayObject;
   import flash.display.LoaderInfo;
   import flash.display.MovieClip;
   import flash.display.Stage;
   import flash.display.StageAlign;
   import flash.display.StageDisplayState;
   import flash.display.StageScaleMode;
   import flash.events.Event;
   import flash.events.FullScreenEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.system.System;
   import flash.utils.setTimeout;
   
   public class §1t1540s0§
   {
      
      internal static var §1t9973s0§:Stage;
      
      internal static var §1t9974s0§:§1t112s0§;
      
      internal static var §1t9975s0§:§1t7017s0§;
      
      internal static var §1t9976s0§:§1t75s0§;
      
      internal static var §1t9977s0§:§1t6427s0§;
      
      internal static var §1t797s0§:int;
      
      internal static var action:int;
      
      internal static var u_blocker:§1t5267s0§;
      
      internal static var d_blocker:§1t5267s0§;
      
      internal static var l_blocker:§1t5267s0§;
      
      internal static var r_blocker:§1t5267s0§;
      
      internal static var §1t10064s0§:DisplayObject;
      
      internal static var §1t1039s0§:§1t1040s0§ = new §1t1040s0§();
      
      internal static var §1t9978s0§:Boolean = false;
      
      internal static var §1t9979s0§:Boolean = false;
      
      internal static var §1t9980s0§:Boolean = false;
      
      internal static var §1t9981s0§:Boolean = false;
      
      internal static var §1t9982s0§:int = §1t9984s0§;
      
      internal static var §1t9983s0§:int = 0;
      
      internal static var §1t9984s0§:int = 1;
      
      internal static var §1t9985s0§:int = 2;
      
      internal static var §1t9986s0§:int = 3;
      
      internal static var §1t9987s0§:int = 4;
      
      internal static var §1t9988s0§:int = 5;
      
      internal static var §1t9989s0§:int = 6;
      
      internal static var §1t9990s0§:int = 7;
      
      internal static var §1t9991s0§:int = 8;
      
      internal static var §1t9992s0§:int = 9;
      
      internal static var §1t9993s0§:int = 10;
      
      internal static var §1t9994s0§:int = 11;
      
      internal static var §1t9995s0§:int = 0;
      
      internal static var §1t9996s0§:int = 1;
      
      internal static var §1t9997s0§:int = 2;
      
      internal static var §1t9998s0§:int = 3;
      
      internal static var §1t9999s0§:int = 4;
      
      internal static var §1t10000s0§:int = 5;
      
      internal static var §1t10001s0§:int = 6;
      
      internal static var §1t10002s0§:int = 7;
      
      internal static var §1t10003s0§:int = 8;
      
      internal static var §1t10004s0§:int = 9;
      
      internal static var §1t10005s0§:int = 10;
      
      internal static var §1t10006s0§:int = 11;
      
      internal static var §1t10007s0§:int = 12;
      
      internal static var §1t10008s0§:int = 13;
      
      internal static var §1t10009s0§:int = 14;
      
      public static var §1t10023s0§:Boolean = false;
      
      internal static var counter:int = 0;
      
      internal static var §1t10055s0§:int = 0;
      
      public function §1t1540s0§()
      {
         super();
      }
      
      public static function §1t10010s0§() : int
      {
         return §1t9982s0§;
      }
      
      public static function §1t10011s0§(param1:int) : *
      {
         §1t9982s0§ = param1;
      }
      
      public static function §1t10012s0§() : Boolean
      {
         return §1t9982s0§ == §1t9984s0§;
      }
      
      public static function §1t10013s0§() : Boolean
      {
         return §1t9982s0§ == §1t9990s0§;
      }
      
      public static function §1t10014s0§() : Boolean
      {
         return §1t9982s0§ == §1t9986s0§;
      }
      
      public static function §1t10015s0§() : Boolean
      {
         return action == §1t10006s0§ || action == §1t10008s0§;
      }
      
      public static function §1t10016s0§(param1:Stage) : *
      {
         §1t9973s0§ = param1;
         §1t9973s0§.scaleMode = StageScaleMode.NO_SCALE;
         §1t9973s0§.align = StageAlign.TOP_LEFT;
         §1t9973s0§.addEventListener(Event.RESIZE,§1t10021s0§);
         §1t9973s0§.addEventListener(FullScreenEvent.FULL_SCREEN,§1t10019s0§);
         §1t9973s0§.showDefaultContextMenu = false;
         §1t10021s0§(null);
         §1t1039s0§.visible = false;
      }
      
      public static function §1t10017s0§() : *
      {
         var §1t9899s0§:§1t112s0§;
         var newScale:Number = §1t9973s0§.fullScreenHeight / 800;
         if(§1t9975s0§ != null)
         {
            §1t9975s0§.scaleX = newScale;
            §1t9975s0§.scaleY = newScale;
         }
         if(§1t9974s0§ != null)
         {
            §1t9974s0§.scaleX = newScale;
            §1t9974s0§.scaleY = newScale;
         }
         if(§1t406s0§.instance != null)
         {
            §1t406s0§.instance.scaleX = newScale;
            §1t406s0§.instance.scaleY = newScale;
         }
         if(§1t113s0§.instance != null)
         {
            §1t113s0§.instance.scaleX = newScale;
            §1t113s0§.instance.scaleY = newScale;
         }
         §1t9899s0§ = §1t1525s0§.§1t9940s0§();
         if(§1t9899s0§ != null)
         {
            §1t9899s0§.scaleX = newScale;
            §1t9899s0§.scaleY = newScale;
         }
         §1t9973s0§.fullScreenSourceRect = new Rectangle(0,0,800 * newScale,480 * newScale);
         §1t1523s0§.§1t9358s0§ = newScale;
         §1t1523s0§.§1t9359s0§ = 0;
         §1t1523s0§.§1t9360s0§ = 0;
         §1t1523s0§.§1t9362s0§ = false;
         try
         {
            §1t9973s0§.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
         }
         catch(error:Error)
         {
            §1t10020s0§();
         }
      }
      
      public static function §1t10018s0§() : *
      {
         if(§1t1523s0§.§1t9357s0§ && !§1t1523s0§.§1t9528s0§)
         {
            §1t9973s0§.displayState = StageDisplayState.NORMAL;
         }
      }
      
      internal static function §1t10019s0§(param1:FullScreenEvent) : *
      {
         if(param1.fullScreen)
         {
            §1t1523s0§.§1t9357s0§ = true;
         }
         else
         {
            §1t10020s0§();
         }
      }
      
      internal static function §1t10020s0§() : *
      {
         §1t1523s0§.§1t9357s0§ = false;
         if(§1t9982s0§ != §1t9984s0§)
         {
            §1t1523s0§.§1t9476s0§ = false;
            if(§1t406s0§.instance.§1t6478s0§ != null)
            {
               §1t406s0§.instance.§1t6478s0§.fullscreencheck.§1t5041s0§(false);
            }
         }
         if(§1t9975s0§ != null)
         {
            §1t9975s0§.scaleX = 1;
            §1t9975s0§.scaleY = 1;
         }
         if(§1t9974s0§ != null)
         {
            §1t9974s0§.scaleX = 1;
            §1t9974s0§.scaleY = 1;
         }
         if(§1t406s0§.instance != null)
         {
            §1t406s0§.instance.scaleX = 1;
            §1t406s0§.instance.scaleY = 1;
         }
         if(§1t113s0§.instance != null)
         {
            §1t113s0§.instance.scaleX = 1;
            §1t113s0§.instance.scaleY = 1;
         }
         var _loc1_:§1t112s0§ = §1t1525s0§.§1t9940s0§();
         if(_loc1_ != null)
         {
            _loc1_.scaleX = 1;
            _loc1_.scaleY = 1;
         }
         §1t1523s0§.§1t9358s0§ = 1;
         §1t10021s0§(null);
      }
      
      internal static function §1t10021s0§(param1:Event) : void
      {
         var _loc2_:int = 800;
         var _loc3_:int = 480;
         var _loc4_:int = 690;
         var _loc5_:Number = _loc2_ / _loc3_;
         var _loc6_:Number = _loc2_ / _loc4_;
         var _loc7_:Number = §1t9973s0§.stageWidth / §1t9973s0§.stageHeight;
         if(_loc7_ <= _loc6_)
         {
            _loc5_ = _loc6_;
            _loc3_ = _loc4_;
            §1t1523s0§.§1t9362s0§ = true;
            if(§1t406s0§.instance != null && §1t9982s0§ != §1t9984s0§)
            {
               §1t406s0§.instance.§1t6500s0§.init();
            }
         }
         else
         {
            §1t1523s0§.§1t9362s0§ = false;
         }
         var _loc8_:Number = 1;
         var _loc9_:Number = 0;
         var _loc10_:Number = 0;
         var _loc11_:Boolean = false;
         if(_loc5_ >= _loc7_)
         {
            _loc8_ = §1t9973s0§.stageWidth / _loc2_;
            _loc9_ = 0;
            _loc10_ = (§1t9973s0§.stageHeight - _loc3_ * _loc8_) / 2;
            _loc11_ = true;
         }
         else
         {
            _loc8_ = §1t9973s0§.stageHeight / _loc3_;
            _loc9_ = (§1t9973s0§.stageWidth - _loc2_ * _loc8_) / 2;
            _loc10_ = 0;
            _loc11_ = false;
         }
         §1t1523s0§.§1t9358s0§ = _loc8_;
         §1t1523s0§.§1t9359s0§ = _loc9_;
         §1t1523s0§.§1t9360s0§ = _loc10_;
         §1t1523s0§.§1t9361s0§ = _loc11_;
         §1t1523s0§.§1t9363s0§ = _loc2_;
         §1t1523s0§.§1t9364s0§ = _loc3_;
         if(§1t1523s0§.§1t9365s0§.currentScene.name == "loading")
         {
            §1t1523s0§.§1t9365s0§.§1t1039s0§.scaleX = _loc8_;
            §1t1523s0§.§1t9365s0§.§1t1039s0§.scaleY = _loc8_;
            §1t1523s0§.§1t9365s0§.§1t1039s0§.x = _loc9_;
            §1t1523s0§.§1t9365s0§.§1t1039s0§.y = _loc10_;
            §1t1523s0§.§1t9365s0§.§1t8078s0§.scaleX = _loc8_;
            §1t1523s0§.§1t9365s0§.§1t8078s0§.scaleY = _loc8_;
            §1t1523s0§.§1t9365s0§.§1t8078s0§.x = _loc9_;
            §1t1523s0§.§1t9365s0§.§1t8078s0§.y = _loc10_;
            §1t1523s0§.§1t9365s0§.adloadertext.scaleX = _loc8_;
            §1t1523s0§.§1t9365s0§.adloadertext.scaleY = _loc8_;
            §1t1523s0§.§1t9365s0§.adloadertext.x = _loc9_ + 274 * _loc8_;
            §1t1523s0§.§1t9365s0§.adloadertext.y = _loc10_ + 355 * _loc8_;
            §1t1523s0§.§1t9365s0§.epicAds.scaleX = _loc8_;
            §1t1523s0§.§1t9365s0§.epicAds.scaleY = _loc8_;
            §1t1523s0§.§1t9365s0§.epicAds.x = _loc9_ + 234 * _loc8_;
            §1t1523s0§.§1t9365s0§.epicAds.y = _loc10_ + 67 * _loc8_;
            u_blocker = §1t1523s0§.§1t9365s0§.u_blocker;
            d_blocker = §1t1523s0§.§1t9365s0§.d_blocker;
            l_blocker = §1t1523s0§.§1t9365s0§.l_blocker;
            r_blocker = §1t1523s0§.§1t9365s0§.r_blocker;
            §1t10022s0§();
            return;
         }
         var _loc12_:§1t112s0§ = §1t1525s0§.§1t9940s0§();
         if(_loc12_ != null)
         {
            _loc12_.§1t5250s0§();
         }
         if(§1t9975s0§ != null)
         {
            §1t9975s0§.§1t5250s0§();
         }
         if(§1t9974s0§ != null)
         {
            §1t9974s0§.scaleX = _loc8_;
            §1t9974s0§.scaleY = _loc8_;
            §1t9974s0§.x = _loc9_;
            §1t9974s0§.y = _loc10_;
         }
         if(§1t406s0§.instance != null)
         {
            §1t406s0§.instance.§1t5250s0§();
         }
         if(§1t113s0§.instance != null)
         {
            §1t113s0§.instance.§1t5250s0§();
         }
      }
      
      public static function §1t10022s0§(param1:MovieClip = null) : *
      {
         if(u_blocker == null)
         {
            u_blocker = new §1t5267s0§();
         }
         if(d_blocker == null)
         {
            d_blocker = new §1t5267s0§();
         }
         if(l_blocker == null)
         {
            l_blocker = new §1t5267s0§();
         }
         if(r_blocker == null)
         {
            r_blocker = new §1t5267s0§();
         }
         §1t9973s0§.addChild(u_blocker);
         §1t9973s0§.addChild(d_blocker);
         §1t9973s0§.addChild(l_blocker);
         §1t9973s0§.addChild(r_blocker);
         if(§1t1523s0§.§1t9359s0§ > -1 && §1t1523s0§.§1t9359s0§ < 1 && §1t1523s0§.§1t9360s0§ > -1 && §1t1523s0§.§1t9360s0§ < 1 || §1t9973s0§.stageWidth == 800 && (§1t9973s0§.stageHeight == 480 || §1t9973s0§.stageHeight == 690))
         {
            u_blocker.visible = false;
            d_blocker.visible = false;
            l_blocker.visible = false;
            r_blocker.visible = false;
            return;
         }
         if(§1t1523s0§.§1t9361s0§)
         {
            u_blocker.visible = true;
            d_blocker.visible = true;
            l_blocker.visible = false;
            r_blocker.visible = false;
         }
         else
         {
            u_blocker.visible = false;
            d_blocker.visible = false;
            l_blocker.visible = true;
            r_blocker.visible = true;
         }
         var _loc2_:int = 0;
         if(§1t1523s0§.§1t9527s0§)
         {
            _loc2_ = 1;
         }
         u_blocker.x = 0;
         u_blocker.y = 0;
         u_blocker.width = §1t9973s0§.stageWidth;
         u_blocker.height = §1t1523s0§.§1t9360s0§ + _loc2_;
         d_blocker.x = 0;
         d_blocker.y = §1t1523s0§.§1t9360s0§ + §1t1523s0§.§1t9364s0§ * §1t1523s0§.§1t9358s0§ - _loc2_;
         d_blocker.width = §1t9973s0§.stageWidth;
         d_blocker.height = §1t1523s0§.§1t9360s0§ + _loc2_;
         l_blocker.x = 0;
         l_blocker.y = 0;
         l_blocker.width = §1t1523s0§.§1t9359s0§;
         l_blocker.height = §1t9973s0§.stageHeight;
         r_blocker.x = §1t1523s0§.§1t9359s0§ + §1t1523s0§.§1t9363s0§ * §1t1523s0§.§1t9358s0§;
         r_blocker.y = 0;
         r_blocker.width = §1t1523s0§.§1t9359s0§;
         r_blocker.height = §1t9973s0§.stageHeight;
      }
      
      public static function §1t10024s0§() : *
      {
         if(§1t10023s0§)
         {
            §1t10022s0§(null);
            §1t406s0§.instance.§1t5163s0§.§1t13123s0§.text = §1t9973s0§.stageWidth + " " + §1t9973s0§.stageHeight + " " + §1t1523s0§.§1t9359s0§ + " " + §1t1523s0§.§1t9360s0§;
         }
         else
         {
            u_blocker.visible = false;
            d_blocker.visible = false;
            l_blocker.visible = false;
            r_blocker.visible = false;
            §1t406s0§.instance.§1t5163s0§.§1t13123s0§.text = §1t9973s0§.stageWidth + " " + §1t9973s0§.stageHeight + " " + §1t1523s0§.§1t9359s0§ + " " + §1t1523s0§.§1t9360s0§;
         }
         §1t10023s0§ = !§1t10023s0§;
      }
      
      public static function §1t10025s0§() : Stage
      {
         return §1t9973s0§;
      }
      
      public static function §1t10026s0§() : *
      {
         if(§1t9973s0§ == null)
         {
            return;
         }
         §1t9973s0§.addEventListener(Event.ENTER_FRAME,§1t10041s0§);
         new §1t1623s0§(§1t9973s0§);
         if(!§1t1523s0§.§1t9528s0§)
         {
            §1t10061s0§();
            if(§1t1523s0§.§1t9495s0§ && !§1t1523s0§.§1t9483s0§)
            {
               §1t10067s0§();
            }
            if(§1t1523s0§.§1t9503s0§)
            {
               §1t10068s0§();
            }
         }
      }
      
      public static function §1t10027s0§() : *
      {
         §1t9973s0§.removeEventListener(Event.ENTER_FRAME,§1t10041s0§);
         §1t1541s0§.§1t10099s0§();
      }
      
      public static function §1t10028s0§() : *
      {
         §1t9974s0§ = new §1t8074s0§();
         MovieClip(§1t9974s0§).redBG.visible = false;
         §1t9973s0§.addChild(§1t9974s0§);
         §1t9975s0§ = new §1t7017s0§();
         §1t9973s0§.addChild(§1t9975s0§);
         §1t9976s0§ = §1t10030s0§();
         §1t9976s0§.x = 150;
         §1t9976s0§.y = 400;
         §1t9976s0§.§1t1557s0§(§1t1544s0§.§1t10269s0§);
         MovieClip(§1t9974s0§).playercanvas.addChild(§1t9976s0§);
         §1t9974s0§.scaleX = §1t1523s0§.§1t9358s0§;
         §1t9974s0§.scaleY = §1t1523s0§.§1t9358s0§;
         §1t9982s0§ = §1t9984s0§;
         §1t88s0§.instance.§1t1499s0§(§1t133s0§.§1t11340s0§);
         §1t1540s0§.§1t10026s0§();
         §1t10021s0§(null);
         if(§1t1523s0§.§1t9529s0§ == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8882s0§) && §1t10060s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8985s0§)))
         {
            §1t3317s0§.instance.§1t2026s0§();
         }
      }
      
      public static function §1t10029s0§() : *
      {
         §1t9973s0§.removeChild(§1t9975s0§);
         §1t9975s0§ = new §1t7017s0§();
         §1t9973s0§.addChild(§1t9975s0§);
      }
      
      internal static function §1t10030s0§() : §1t75s0§
      {
         var _loc1_:§1t75s0§ = null;
         var _loc2_:String = §1t3317s0§.instance.§1t2011s0§();
         if(_loc2_ == "")
         {
            _loc1_ = new §1t75s0§();
            _loc1_.§1t1549s0§(new §1t17s0§(4017),new §1t17s0§(0),new §1t17s0§(6019),new §1t17s0§(0),new §1t17s0§(0),new §1t17s0§(0),new §1t17s0§(0),new §1t17s0§(11017),new §1t17s0§(12017),new §1t17s0§(13002));
         }
         else
         {
            _loc1_ = new §1t75s0§();
            §1t1523s0§.§1t1257s0§(_loc2_);
            _loc1_.§1t1549s0§(§1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9439s0§],§1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9440s0§],§1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9441s0§],§1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9442s0§],§1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9443s0§],§1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9444s0§],§1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9445s0§],§1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9446s0§],§1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9447s0§],§1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9448s0§],§1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9449s0§].§1t483s0§());
         }
         return _loc1_;
      }
      
      public static function §1t10031s0§() : *
      {
         if(§1t9976s0§ != null)
         {
            §1t9976s0§.§1t1549s0§(new §1t17s0§(4017),new §1t17s0§(0),new §1t17s0§(6019),new §1t17s0§(0),new §1t17s0§(0),new §1t17s0§(0),new §1t17s0§(0),new §1t17s0§(11017),new §1t17s0§(12017),new §1t17s0§(13002));
         }
         §1t1523s0§.§1t9587s0§().§1t1549s0§(new §1t17s0§(4017),new §1t17s0§(6019),new §1t17s0§(0),new §1t17s0§(0),new §1t17s0§(0),new §1t17s0§(0));
      }
      
      public static function §1t10032s0§() : *
      {
         §1t9982s0§ = §1t9983s0§;
         §1t3317s0§.instance.§1t2008s0§();
         MovieClip(§1t9974s0§).playercanvas.removeChild(§1t9976s0§);
         §1t9976s0§ = null;
         §1t9973s0§.removeChild(§1t9974s0§);
         §1t9974s0§ = null;
         §1t9973s0§.removeChild(§1t9975s0§);
         §1t9975s0§ = null;
         §1t10035s0§();
         §1t1039s0§.init(§1t1040s0§.§1t12374s0§);
         §1t3317s0§.instance.§1t1939s0§(§1t1523s0§.charname);
      }
      
      public static function §1t10033s0§() : Boolean
      {
         return §1t1039s0§.visible;
      }
      
      public static function §1t10034s0§() : String
      {
         var _loc2_:String = null;
         var _loc1_:int = Math.random() * 42;
         if(_loc1_ == 0)
         {
            _loc2_ = §1t1521s0§.getString(917);
         }
         else if(_loc1_ == 1)
         {
            _loc2_ = §1t1521s0§.getString(918);
         }
         else if(_loc1_ == 2)
         {
            _loc2_ = §1t1521s0§.getString(919);
         }
         else if(_loc1_ == 3)
         {
            _loc2_ = §1t1521s0§.getString(920);
         }
         else if(_loc1_ == 4)
         {
            _loc2_ = §1t1521s0§.getString(921);
         }
         else if(_loc1_ == 5)
         {
            _loc2_ = §1t1521s0§.getString(922);
         }
         else if(_loc1_ == 6)
         {
            _loc2_ = §1t1521s0§.getString(923);
         }
         else if(_loc1_ == 7)
         {
            _loc2_ = §1t1521s0§.getString(924);
         }
         else if(_loc1_ == 8)
         {
            _loc2_ = §1t1521s0§.getString(925);
         }
         else if(_loc1_ == 9)
         {
            _loc2_ = §1t1521s0§.getString(926);
         }
         else if(_loc1_ == 10)
         {
            _loc2_ = §1t1521s0§.getString(927);
         }
         else if(_loc1_ == 11)
         {
            _loc2_ = §1t1521s0§.getString(928);
         }
         else if(_loc1_ == 12)
         {
            _loc2_ = §1t1521s0§.getString(929);
         }
         else if(_loc1_ == 13)
         {
            _loc2_ = §1t1521s0§.getString(930);
         }
         else if(_loc1_ == 14)
         {
            _loc2_ = §1t1521s0§.getString(931);
         }
         else if(_loc1_ == 15)
         {
            _loc2_ = §1t1521s0§.getString(932);
         }
         else if(_loc1_ == 16)
         {
            _loc2_ = §1t1521s0§.getString(933);
         }
         else if(_loc1_ == 17)
         {
            _loc2_ = §1t1521s0§.getString(934);
         }
         else if(_loc1_ == 18)
         {
            _loc2_ = §1t1521s0§.getString(935);
         }
         else if(_loc1_ == 19)
         {
            _loc2_ = §1t1521s0§.getString(936);
         }
         else if(_loc1_ == 20)
         {
            _loc2_ = §1t1521s0§.getString(937);
         }
         else if(_loc1_ == 21)
         {
            _loc2_ = §1t1521s0§.getString(938);
         }
         else if(_loc1_ == 22)
         {
            _loc2_ = §1t1521s0§.getString(939);
         }
         else if(_loc1_ == 23)
         {
            _loc2_ = §1t1521s0§.getString(940);
         }
         else if(_loc1_ == 24)
         {
            _loc2_ = §1t1521s0§.getString(941);
         }
         else if(_loc1_ == 25)
         {
            _loc2_ = §1t1521s0§.getString(942);
         }
         else if(_loc1_ == 26)
         {
            _loc2_ = §1t1521s0§.getString(943);
         }
         else if(_loc1_ == 27)
         {
            _loc2_ = §1t1521s0§.getString(944);
         }
         else if(_loc1_ == 28)
         {
            _loc2_ = §1t1521s0§.getString(945);
         }
         else if(_loc1_ == 29)
         {
            _loc2_ = §1t1521s0§.getString(946);
         }
         else if(_loc1_ == 30)
         {
            _loc2_ = §1t1521s0§.getString(947);
         }
         else if(_loc1_ == 31)
         {
            _loc2_ = §1t1521s0§.getString(948);
         }
         else if(_loc1_ == 32)
         {
            _loc2_ = §1t1521s0§.getString(949);
         }
         else if(_loc1_ == 33)
         {
            if(§1t1523s0§.§1t9762s0§())
            {
               _loc2_ = §1t1521s0§.getString(723);
            }
            else
            {
               _loc2_ = §1t1521s0§.getString(950);
            }
         }
         else if(_loc1_ == 34)
         {
            _loc2_ = §1t1521s0§.getString(951);
         }
         else if(_loc1_ == 35)
         {
            _loc2_ = §1t1521s0§.getString(952);
         }
         else if(_loc1_ == 36)
         {
            _loc2_ = §1t1521s0§.getString(953);
         }
         else if(_loc1_ == 37)
         {
            _loc2_ = §1t1521s0§.getString(954);
         }
         else if(_loc1_ == 38)
         {
            _loc2_ = §1t1521s0§.getString(955);
         }
         else if(_loc1_ == 39)
         {
            _loc2_ = §1t1521s0§.getString(956);
         }
         else if(_loc1_ == 40)
         {
            _loc2_ = §1t1521s0§.getString(957);
         }
         else if(_loc1_ == 41)
         {
            _loc2_ = §1t1521s0§.getString(958);
         }
         else if(_loc1_ == 42)
         {
            _loc2_ = §1t1521s0§.getString(959);
         }
         return _loc2_;
      }
      
      public static function §1t10035s0§(param1:int = 0) : *
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         if(§1t1039s0§.visible)
         {
            return;
         }
         §1t9973s0§.addChild(§1t1039s0§);
         §1t1039s0§.scaleX = §1t1523s0§.§1t9358s0§;
         §1t1039s0§.scaleY = §1t1523s0§.§1t9358s0§;
         §1t1039s0§.x = §1t1523s0§.§1t9359s0§;
         §1t1039s0§.y = §1t1523s0§.§1t9360s0§;
         §1t1039s0§.init(param1);
         §1t1039s0§.visible = true;
         if(§1t1039s0§.tipstext.visible)
         {
            _loc2_ = Math.random() * 28;
            _loc3_ = §1t10034s0§();
            §1t1039s0§.tipstext.text = _loc3_;
         }
         §1t10022s0§();
      }
      
      public static function §1t10036s0§() : *
      {
         §1t1039s0§.visible = false;
      }
      
      public static function §1t10037s0§() : *
      {
         var _loc6_:int = 0;
         var _loc7_:Object = null;
         §1t9977s0§ = new §1t6427s0§(§1t9973s0§);
         §1t10036s0§();
         §1t9982s0§ = §1t9986s0§;
         var _loc1_:int = §1t1523s0§.§1t2218s0§();
         var _loc2_:Boolean = false;
         if(§1t1523s0§.§1t7356s0§(§1t1523s0§.§1t8755s0§) == 0 && !§1t1523s0§.§1t9565s0§("0"))
         {
            _loc1_ = 8382465;
            §1t1523s0§.§1t9763s0§(_loc1_);
            _loc2_ = true;
            §1t6427s0§.§1t9911s0§ = _loc1_;
         }
         var _loc3_:Point = §1t70s0§.instance.§1t1133s0§(_loc1_);
         if(_loc1_ != 666 && !§1t1524s0§.§1t7976s0§(_loc3_.x,_loc3_.y))
         {
            _loc6_ = §1t70s0§.instance.§1t1139s0§(_loc1_);
            if(_loc6_ < 10)
            {
               _loc1_ = 8382465;
            }
            else if(_loc6_ < 20)
            {
               _loc1_ = 8570879;
            }
            else if(_loc6_ < 30)
            {
               _loc1_ = 8800254;
            }
            else if(_loc6_ < 40)
            {
               _loc1_ = 9013236;
            }
            else if(_loc6_ < 50)
            {
               _loc1_ = 9037756;
            }
            else if(_loc6_ < 60)
            {
               _loc1_ = 9181094;
            }
            else if(_loc6_ < 70)
            {
               _loc1_ = 9168748;
            }
            else if(_loc6_ < 80)
            {
               _loc1_ = 9144102;
            }
            else
            {
               _loc1_ = 9365282;
            }
         }
         if(§1t1523s0§.§1t9725s0§(§1t1523s0§.§1t9462s0§))
         {
            _loc1_ = 666;
         }
         §1t1525s0§.§1t9916s0§(_loc1_);
         §1t1523s0§.§1t9586s0§().§1t3307s0§(1);
         §1t1524s0§.§1t9896s0§(_loc1_,_loc2_);
         §1t1523s0§.§1t9742s0§();
         var _loc4_:Boolean = false;
         if(§1t3317s0§.instance.§1t1833s0§)
         {
            §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(295),§1t1521s0§.getString(5));
            §1t251s0§.instance.§1t3627s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8936s0§),{});
         }
         else
         {
            if(§1t1523s0§.§1t9503s0§)
            {
               §1t251s0§.instance.§1t3616s0§();
            }
            if(§1t1523s0§.getLevel() >= 3 && §1t1523s0§.§1t9714s0§(30018) - §1t3317s0§.instance.§1t1847s0§() < 0 && !§1t126s0§.§1t9190s0§().§1t1700s0§())
            {
               §1t406s0§.instance.§1t5799s0§();
               _loc4_ = true;
            }
         }
         var _loc5_:int = §1t70s0§.instance.§1t1139s0§(_loc1_) - §1t1523s0§.getLevel();
         if(!_loc4_ && !§1t126s0§.§1t9190s0§().§1t1700s0§())
         {
            if(_loc5_ < -3)
            {
               §1t406s0§.instance.§1t6534s0§(§1t1521s0§.getString(702),§1t1521s0§.getString(5));
            }
            else if(_loc5_ > 3 && _loc1_ != 666)
            {
               §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(703),§1t1521s0§.getString(5));
            }
         }
         §1t1523s0§.§1t9755s0§();
         §1t1524s0§.§1t9866s0§(_loc1_);
         §1t1525s0§.§1t9933s0§();
         if(§1t1523s0§.§1t9373s0§.length > 0)
         {
            §1t1523s0§.§1t9712s0§(§1t1523s0§.§1t9427s0§,0);
         }
         §1t406s0§.instance.§1t6456s0§.§1t4235s0§();
         §1t10022s0§();
         §1t3317s0§.instance.§1t2024s0§();
         if(§1t1523s0§.§1t5740s0§)
         {
            §1t406s0§.instance.§1t6500s0§.init();
         }
         else
         {
            §1t406s0§.instance.§1t6500s0§.§1t5224s0§();
         }
         §1t406s0§.instance.§1t6653s0§(§1t3317s0§.instance.§1t1833s0§);
         if(§1t1523s0§.§1t9524s0§)
         {
            §1t1802s0§.instance.§1t1803s0§();
         }
         else if(§1t1523s0§.§1t9525s0§)
         {
            §1t2284s0§.instance.init();
         }
         if(§1t1523s0§.§1t9529s0§ == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8882s0§))
         {
            if(§1t10060s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8985s0§)))
            {
               if(§1t3317s0§.instance.§1t1833s0§)
               {
                  _loc7_ = new Object();
                  _loc7_.det = §1t1521s0§.getString(258);
                  §1t251s0§.instance.§1t3627s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8935s0§),_loc7_);
               }
               else
               {
                  §1t3318s0§.instance.§1t3409s0§(§1t1521s0§.getString(258));
               }
               §1t10027s0§();
            }
         }
      }
      
      public static function §1t10038s0§() : *
      {
         §1t9982s0§ = §1t9983s0§;
         §1t9973s0§.removeChild(§1t9977s0§);
         §1t9977s0§.destroy();
         §1t9977s0§ = null;
         §1t10027s0§();
         §1t10028s0§();
         §1t7017s0§.instance.§1t7034s0§();
      }
      
      public static function §1t10039s0§() : *
      {
         §1t9982s0§ = §1t9983s0§;
         §1t1523s0§.§1t9512s0§ = false;
         if(§1t1523s0§.§1t9586s0§() != null)
         {
            §1t1523s0§.§1t9586s0§().§1t1559s0§().§1t5493s0§();
         }
         §1t1525s0§.§1t9937s0§();
         §1t10027s0§();
         §1t10028s0§();
         §1t10018s0§();
         if(!§1t3317s0§.instance.§1t1833s0§ && §1t406s0§.instance != null)
         {
            §1t3317s0§.instance.§1t1946s0§();
            §1t7017s0§.instance.§1t7034s0§();
         }
         else
         {
            §1t3317s0§.instance.§1t1856s0§();
            §1t7017s0§.instance.§1t7030s0§();
            if(§1t406s0§.instance == null)
            {
               §1t7017s0§.instance.login.errormessage.text = §1t1521s0§.getString(991);
            }
         }
         §1t1523s0§.reset();
         if(§1t406s0§.instance != null)
         {
            §1t406s0§.instance.§1t6482s0§.§1t8014s0§ = 0;
         }
         §1t7017s0§.instance.§1t5250s0§();
         if(§1t9974s0§ != null)
         {
            §1t9974s0§.scaleX = §1t1523s0§.§1t9358s0§;
            §1t9974s0§.scaleY = §1t1523s0§.§1t9358s0§;
            §1t9974s0§.x = §1t1523s0§.§1t9359s0§;
            §1t9974s0§.y = §1t1523s0§.§1t9360s0§;
         }
         §1t10022s0§();
      }
      
      public static function §1t10040s0§(param1:int) : *
      {
         counter = param1;
      }
      
      internal static function §1t10041s0§(param1:Event) : void
      {
         if(§1t9982s0§ == §1t9984s0§)
         {
            §1t9974s0§.§1t8127s0§(-4);
            §1t9976s0§.§1t3268s0§();
         }
         else if(§1t9982s0§ == §1t9989s0§)
         {
            §1t9974s0§.§1t8127s0§(-4);
            §1t9976s0§.§1t3268s0§();
            ++counter;
            if(counter == 1)
            {
               §1t7017s0§.instance.§1t6496s0§.§1t6848s0§(§1t6497s0§.§1t9995s0§);
            }
            else if(counter == 25)
            {
               §1t10032s0§();
               §1t1623s0§.instance.§1t1635s0§();
            }
         }
         else if(§1t9982s0§ == §1t9986s0§)
         {
            §1t6427s0§.update();
            §1t1523s0§.update();
         }
         else if(§1t9982s0§ == §1t9990s0§ && !§1t9979s0§)
         {
            §1t1525s0§.update();
            §1t406s0§.instance.§1t6496s0§.update();
            if(action == §1t10002s0§ || action == §1t10007s0§)
            {
               §1t1523s0§.update();
            }
            else if(action == §1t10001s0§ || action == §1t10006s0§ || action == §1t10008s0§)
            {
               §1t251s0§.instance.update();
            }
         }
         §1t133s0§.instance.update();
      }
      
      public static function §1t10042s0§() : *
      {
         §1t9979s0§ = !§1t9979s0§;
      }
      
      public static function §1t10043s0§(param1:Boolean) : *
      {
         §1t9979s0§ = param1;
      }
      
      public static function §1t10044s0§() : *
      {
         action = §1t10007s0§;
      }
      
      public static function §1t10045s0§() : *
      {
         action = §1t10002s0§;
      }
      
      public static function §1t9939s0§() : Boolean
      {
         return action == §1t10009s0§;
      }
      
      public static function §1t10046s0§() : Boolean
      {
         return §1t9982s0§ != §1t9986s0§ && (action == §1t10001s0§ || action == §1t10006s0§ || action == §1t10008s0§);
      }
      
      public static function §1t10047s0§() : Boolean
      {
         return §1t9982s0§ != §1t9986s0§ && action == §1t10007s0§;
      }
      
      public static function §1t10048s0§() : Boolean
      {
         return action == §1t10005s0§;
      }
      
      public static function §1t9550s0§() : Boolean
      {
         return §1t9982s0§ != §1t9986s0§ && action == §1t10002s0§;
      }
      
      public static function §1t10049s0§() : Boolean
      {
         return action == §1t10006s0§;
      }
      
      public static function §1t10050s0§() : Boolean
      {
         return action == §1t10008s0§;
      }
      
      public static function §1t10051s0§() : Boolean
      {
         if(§1t10047s0§())
         {
            return false;
         }
         return !(§1t797s0§ == -1 && action == §1t10001s0§) && action != §1t10004s0§ && action != §1t10005s0§;
      }
      
      public static function §1t775s0§() : int
      {
         return action;
      }
      
      public static function §1t10052s0§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Vector.<§1t116s0§>, param7:int, param8:Array = null, param9:int = 0) : *
      {
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         if(!§1t3317s0§.instance.§1t2019s0§() && !§1t10062s0§())
         {
            §1t406s0§.instance.§1t6637s0§();
            return;
         }
         §1t406s0§.instance.§1t6535s0§(param2 == §1t10005s0§);
         if(§1t1525s0§.§1t9940s0§() != null)
         {
            §1t1525s0§.§1t9940s0§().visible = true;
         }
         var _loc10_:Boolean = §1t9982s0§ == §1t9990s0§;
         if(_loc10_)
         {
            §1t1525s0§.§1t9926s0§();
            §1t1525s0§.§1t9934s0§();
            §1t251s0§.instance.§1t3521s0§();
         }
         §1t9982s0§ = §1t9987s0§;
         §1t797s0§ = param1;
         §1t9978s0§ = _loc10_;
         action = param2;
         if(action != §1t10002s0§ && (param3 == §1t112s0§.§1t12602s0§ || param3 == -1 && §1t1525s0§.§1t9900s0§ == §1t112s0§.§1t12602s0§))
         {
            param3 = §1t112s0§.§1t12551s0§;
         }
         if(!_loc10_ || param3 != -1 && §1t1525s0§.§1t9900s0§ != param3)
         {
            _loc12_ = 0;
            _loc13_ = 0;
            if(param8 != null && param8[param9] != null)
            {
               _loc12_ = int(param8[param9].getBGParam());
               _loc13_ = int(param8[param9].getBGParam2());
            }
            §1t1525s0§.§1t9917s0§(action,§1t9973s0§,param3,param4,param5,_loc12_,_loc13_);
            §1t1744s0§.init();
            §1t1831s0§.init();
            §1t75s0§.§1t12425s0§();
            §1t1712s0§.init();
            §1t1541s0§.§1t10052s0§();
         }
         else if(action != §1t10002s0§)
         {
            §1t1525s0§.§1t9918s0§(action,param4,param5);
            §1t1541s0§.§1t10052s0§();
         }
         §1t1523s0§.§1t4443s0§();
         var _loc11_:§1t99s0§ = §1t1523s0§.§1t9586s0§();
         _loc11_.§1t1551s0§(§1t1525s0§.§1t9940s0§().§1t8148s0§());
         _loc11_.setPosition(param7,§1t1525s0§.§1t4467s0§());
         _loc11_.mcs.§1t5493s0§();
         if(action == §1t10001s0§ || action == §1t10006s0§)
         {
            §1t88s0§.instance.§1t1499s0§(§1t133s0§.§1t11339s0§);
            §1t1525s0§.§1t1014s0§(param7 < §1t1523s0§.stageWidth / 2);
            _loc11_.§1t4481s0§();
            _loc11_.§1t3269s0§(§1t1544s0§.§1t11141s0§);
            _loc11_.§1t1557s0§(§1t1544s0§.§1t10373s0§);
            if(action == §1t10006s0§)
            {
               _loc11_.§1t1559s0§().visible = false;
               §1t1525s0§.§1t5254s0§();
            }
         }
         else if(action == §1t10008s0§)
         {
            _loc11_.§1t1559s0§().visible = false;
            §1t1525s0§.§1t5254s0§();
         }
         else if(action == §1t10002s0§ || action == §1t10007s0§)
         {
            §1t1525s0§.§1t9919s0§(param8,param9,param7);
         }
         else if(action == §1t10005s0§)
         {
            §1t88s0§.instance.§1t1499s0§(§1t133s0§.§1t11345s0§);
         }
         else if(action == §1t10003s0§)
         {
            §1t88s0§.instance.§1t1499s0§(§1t133s0§.§1t11349s0§);
         }
         else
         {
            §1t88s0§.instance.§1t1505s0§();
         }
         if(param6 != null)
         {
            §1t1543s0§.init(param6);
         }
         §1t157s0§.§1t9190s0§().init();
         §1t9894s0§();
         if(action == §1t10002s0§)
         {
            §1t1541s0§.§1t10045s0§();
         }
         else if(action == §1t10006s0§ || action == §1t10008s0§)
         {
            §1t1541s0§.§1t10099s0§();
         }
         if(action == §1t10003s0§)
         {
            §1t1525s0§.§1t8147s0§();
         }
      }
      
      public static function §1t9894s0§() : *
      {
         §1t9982s0§ = §1t9990s0§;
         §1t1541s0§.§1t10097s0§();
      }
      
      public static function §1t10053s0§() : Boolean
      {
         return Math.abs(§1t5565s0§.instance.§1t5580s0§ - §1t1523s0§.getLevel()) <= 3;
      }
      
      public static function §1t10054s0§(param1:Boolean) : *
      {
         var _loc2_:§1t76s0§ = null;
         if(param1 || action == §1t10004s0§ || action == §1t10005s0§)
         {
            §1t9982s0§ = §1t9991s0§;
            if(action == §1t10004s0§)
            {
               §1t406s0§.instance.§1t6488s0§.§1t6204s0§();
               §1t3317s0§.instance.§1t1955s0§(50005,§1t1543s0§.§1t10239s0§());
               §1t1523s0§.§1t9586s0§().§1t3308s0§(§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9402s0§));
               §1t1523s0§.§1t9586s0§().§1t4442s0§(§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9405s0§));
               §1t6427s0§.§1t12477s0§();
            }
            else if(action == §1t10005s0§)
            {
               §1t251s0§.instance.§1t3521s0§();
               §1t406s0§.instance.§1t6488s0§.§1t6204s0§();
               §1t3317s0§.instance.§1t1955s0§(50006,§1t1543s0§.§1t10239s0§());
               §1t1523s0§.§1t9586s0§().§1t3308s0§(§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9402s0§));
               §1t1523s0§.§1t9586s0§().§1t4442s0§(§1t1523s0§.§1t9714s0§(§1t1523s0§.§1t9405s0§));
               if(§1t1523s0§.§1t9714s0§(60018) < §1t1543s0§.§1t10239s0§())
               {
                  §1t1523s0§.§1t1684s0§(60018,§1t1543s0§.§1t10239s0§(),true);
               }
               §1t6427s0§.§1t12477s0§();
            }
            else if(action == §1t9999s0§ || action == §1t10009s0§)
            {
               §1t406s0§.instance.§1t6488s0§.§1t6205s0§();
               §1t6427s0§.§1t12477s0§();
            }
            else if(action == §1t10001s0§)
            {
               _loc2_ = §1t1524s0§.§1t9874s0§(-1);
               if(_loc2_ != null && _loc2_.nid != "" && Math.abs(§1t1523s0§.getLevel() - _loc2_.lvl) > 2)
               {
                  §1t406s0§.instance.§1t6488s0§.§1t5850s0§();
               }
               if(§1t251s0§.instance.§1t3477s0§())
               {
                  if(!§1t251s0§.instance.§1t3506s0§())
                  {
                     §1t6427s0§.§1t12477s0§();
                  }
                  if(§1t113s0§.instance.§1t5222s0§())
                  {
                     if(§1t10053s0§())
                     {
                        §1t3317s0§.instance.§1t1894s0§(§1t1523s0§.charname,"draw");
                        §1t1523s0§.§1t7357s0§(§1t1523s0§.§1t9428s0§,§1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9428s0§) + 1);
                     }
                     §1t251s0§.instance.§1t3509s0§(2);
                  }
                  else if(param1)
                  {
                     if(§1t10053s0§())
                     {
                        §1t3317s0§.instance.§1t1894s0§(§1t1523s0§.charname,§1t1524s0§.§1t1582s0§(-1));
                        §1t1523s0§.§1t7357s0§(§1t1523s0§.§1t9421s0§,§1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9421s0§) + 1);
                     }
                     §1t406s0§.instance.§1t6500s0§.§1t4235s0§();
                     §1t251s0§.instance.§1t3509s0§(0);
                     §1t1523s0§.§1t1684s0§(60000,1);
                  }
               }
               else if(action != §1t10006s0§ && action != §1t10008s0§)
               {
                  §1t6427s0§.§1t12477s0§();
               }
            }
            else if(action != §1t10006s0§ && action != §1t10008s0§)
            {
               §1t406s0§.instance.§1t6488s0§.§1t6206s0§();
               §1t1523s0§.§1t1684s0§(60017,§1t1543s0§.§1t10239s0§());
               §1t1523s0§.§1t1684s0§(60016,§1t1543s0§.§1t10240s0§());
               §1t6427s0§.§1t12477s0§();
            }
         }
         else
         {
            §1t88s0§.instance.§1t1499s0§(§1t133s0§.§1t11354s0§);
            §1t9982s0§ = §1t9992s0§;
            §1t406s0§.§1t9190s0§().§1t6488s0§.§1t5850s0§();
            if(§1t10046s0§())
            {
               if(§1t251s0§.instance.§1t3477s0§() && §1t113s0§.instance.§1t5222s0§())
               {
                  if(§1t10053s0§())
                  {
                     §1t3317s0§.instance.§1t1894s0§(§1t1523s0§.charname,"draw");
                     §1t1523s0§.§1t7357s0§(§1t1523s0§.§1t9428s0§,§1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9428s0§) + 1);
                  }
                  §1t251s0§.instance.§1t3509s0§(2);
               }
               else
               {
                  §1t406s0§.instance.§1t6516s0§.show(-1,§1t5565s0§.instance.§1t5608s0§());
                  §1t406s0§.instance.§1t6516s0§.§1t6779s0§();
                  §1t251s0§.instance.§1t3509s0§(1);
               }
            }
         }
      }
      
      public static function §1t9895s0§() : *
      {
         if(§1t1523s0§.§1t9528s0§)
         {
            §1t10035s0§(§1t1040s0§.§1t12376s0§);
            setTimeout(§1t10056s0§,50);
         }
         else
         {
            §1t10056s0§();
         }
      }
      
      public static function §1t10056s0§() : *
      {
         var _loc6_:§1t76s0§ = null;
         var _loc7_:§1t76s0§ = null;
         var _loc8_:int = 0;
         var _loc9_:§1t71s0§ = null;
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = §1t9982s0§ == §1t9991s0§;
         if(action == §1t10006s0§ || action == §1t10008s0§)
         {
            §1t1523s0§.§1t9586s0§().§1t1559s0§().visible = true;
         }
         else if(_loc2_ || action == §1t10004s0§ || action == §1t10005s0§)
         {
            §1t113s0§.instance.§1t5223s0§();
            if(§1t797s0§ == -1 && action == §1t10001s0§)
            {
               §1t251s0§.instance.§1t1894s0§();
            }
            else if(§1t797s0§ != -1)
            {
               _loc1_ = true;
            }
            if(action != §1t10003s0§ && action != §1t10001s0§)
            {
               §1t1523s0§.§1t9581s0§();
            }
            else if(action == §1t10001s0§)
            {
               _loc6_ = §1t1524s0§.§1t9874s0§(-1);
               if(_loc6_ != null && (_loc6_.nid != "" || _loc6_.§1t509s0§() != §1t5565s0§.instance.§1t5579s0§))
               {
                  §1t1523s0§.§1t9581s0§();
               }
            }
         }
         else
         {
            if(§1t797s0§ == -1 && action == §1t10001s0§)
            {
               §1t251s0§.instance.§1t1894s0§();
            }
            else
            {
               §1t9978s0§ = false;
            }
            if(§1t5177s0§.instance.§1t6229s0§())
            {
               §1t1523s0§.§1t9578s0§();
            }
            else if(action == §1t10001s0§)
            {
               _loc7_ = §1t1524s0§.§1t9874s0§(-1);
               if(_loc7_ != null && (_loc7_.nid != "" || _loc7_.§1t509s0§() != §1t5565s0§.instance.§1t5579s0§))
               {
                  §1t1523s0§.§1t9580s0§();
               }
            }
            else
            {
               §1t1523s0§.§1t9580s0§();
            }
         }
         §1t1525s0§.§1t3311s0§();
         var _loc3_:int = action;
         var _loc4_:int = §1t1543s0§.§1t10239s0§();
         var _loc5_:int = _loc4_ / 100;
         if(_loc5_ <= 1)
         {
            _loc5_ = 1;
         }
         if(action != §1t10006s0§ && action != §1t10008s0§)
         {
            §1t1523s0§.§1t9634s0§(_loc5_);
         }
         else
         {
            §1t251s0§.instance.§1t3515s0§ = false;
         }
         §1t3317s0§.instance.§1t1946s0§();
         action = §1t10002s0§;
         §1t1523s0§.§1t4443s0§();
         if(§1t9978s0§ || §1t5177s0§.instance.§1t6229s0§())
         {
            §1t1525s0§.§1t9925s0§();
         }
         else
         {
            _loc8_ = §1t70s0§.instance.§1t1134s0§(§1t1525s0§.§1t9935s0§());
            _loc9_ = §1t70s0§.instance.§1t1126s0§(_loc8_ >> 12 & 0x0FFF,_loc8_ & 0x0FFF,false);
            if(Boolean(_loc9_.§1t1318s0§(§1t1525s0§.§1t9935s0§()) && _loc9_.§1t1328s0§()) && Boolean(§1t1525s0§.§1t7341s0§() > 0) && §1t1523s0§.§1t9714s0§(30021) != 0)
            {
               §1t1525s0§.§1t9922s0§(0,150,§1t1523s0§.§1t9714s0§(30021));
               §1t1523s0§.§1t9712s0§(30021,0);
            }
            else
            {
               §1t1525s0§.§1t9922s0§(§1t1523s0§.§1t7356s0§(§1t1523s0§.§1t9436s0§),150,§1t1523s0§.§1t2218s0§());
            }
         }
         §1t157s0§.§1t9190s0§().init();
         §1t9978s0§ = false;
         §1t9894s0§();
         §1t1541s0§.§1t10045s0§();
         if(_loc3_ == §1t10005s0§)
         {
            §1t406s0§.instance.§1t6482s0§.§1t8022s0§(_loc4_);
         }
         else
         {
            §1t1523s0§.§1t9742s0§();
         }
         if(§1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9448s0§] != null && §1t1523s0§.§1t7316s0§[§1t1523s0§.§1t9448s0§].§1t535s0§())
         {
            --§1t10055s0§;
            if(§1t10055s0§ <= 0)
            {
               §1t10055s0§ = 5;
               §1t406s0§.instance.§1t6532s0§();
               §1t1523s0§.§1t1684s0§(60004,1,true);
            }
         }
         System.pauseForGCIfCollectionImminent(0);
         §1t10036s0§();
         §1t406s0§.instance.§1t6496s0§.§1t6849s0§(§1t6497s0§.§1t9995s0§);
      }
      
      public static function §1t3652s0§(param1:int, param2:int) : *
      {
         action = §1t10002s0§;
         §1t1523s0§.§1t4443s0§();
         §1t1525s0§.§1t9925s0§();
         §1t157s0§.§1t9190s0§().init();
         §1t9978s0§ = false;
         §1t9894s0§();
         §1t1541s0§.§1t10045s0§();
         if(param1 != -1)
         {
            §1t6427s0§.§1t12475s0§(param1,param2);
         }
      }
      
      public static function §1t10057s0§() : *
      {
         §1t1523s0§.§1t4431s0§ = false;
         §1t10044s0§();
         §1t88s0§.instance.§1t1499s0§(§1t133s0§.§1t11345s0§);
         §1t1525s0§.§1t9921s0§();
         §1t411s0§.instance.y = 9.9;
         §1t402s0§.instance.y = 9.9;
         §1t406s0§.instance.§1t6592s0§();
         §1t406s0§.instance.§1t6535s0§();
         §1t406s0§.instance.§1t5163s0§.visible = false;
         §1t1541s0§.§1t10052s0§();
         §1t1525s0§.§1t9946s0§(§1t1525s0§.§1t9903s0§);
      }
      
      public static function §1t10058s0§() : *
      {
         if(!§1t1523s0§.§1t9503s0§)
         {
            §1t251s0§.instance.§1t2062s0§();
         }
         else
         {
            §1t251s0§.instance.§1t3607s0§();
         }
         §1t1525s0§.§1t9922s0§(§1t1525s0§.§1t7341s0§(),§1t1523s0§.§1t9586s0§().§1t1555s0§());
      }
      
      public static function test() : *
      {
      }
      
      internal static function §1t10060s0§(param1:String) : Boolean
      {
         return §1t10065s0§(§1t1523s0§.§1t9365s0§).url.indexOf(param1) != -1;
      }
      
      public static function §1t10061s0§() : *
      {
         var _loc1_:Object = §1t10065s0§(§1t1523s0§.§1t9365s0§).parameters;
         if(_loc1_.playbackmode == null)
         {
            return;
         }
         §1t9980s0§ = true;
         §1t3317s0§.instance.§1t1833s0§ = true;
         if(§1t251s0§.instance != null)
         {
            §1t251s0§.instance.connected = false;
         }
         §1t1523s0§.§1t5740s0§ = false;
         §1t1523s0§.charname = "guest";
         §1t1523s0§.§1t9544s0§();
         new §1t6427s0§(§1t9973s0§);
         new §1t1525s0§();
         new §1t251s0§();
         §1t1523s0§.§1t9583s0§();
         §1t1525s0§.§1t9944s0§(§1t1523s0§.§1t9586s0§());
         if(§1t406s0§.instance)
         {
            §1t406s0§.instance.§1t6500s0§.§1t5224s0§();
            §1t406s0§.instance.§1t6500s0§.§1t5736s0§(false);
         }
         if(§1t1523s0§.§1t9503s0§)
         {
            §1t10035s0§();
            §1t3318s0§.instance.§1t3428s0§(_loc1_.playbackid,_loc1_.playbackname);
         }
         else if(_loc1_.playbackid != "")
         {
            §1t3317s0§.instance.§1t1951s0§(_loc1_.playbackid);
         }
         else if(_loc1_.playbackname != "")
         {
            §1t3317s0§.instance.§1t1952s0§(_loc1_.playbackname);
         }
         else
         {
            §1t3317s0§.instance.§1t1951s0§("0");
         }
         if(_loc1_.showslash != null)
         {
            §1t9981s0§ = true;
         }
      }
      
      public static function §1t10062s0§() : Boolean
      {
         return §1t9980s0§;
      }
      
      public static function §1t10063s0§() : Boolean
      {
         return §1t9981s0§;
      }
      
      internal static function §1t10065s0§(param1:DisplayObject) : LoaderInfo
      {
         var _loc2_:DisplayObject = §1t10066s0§(param1);
         if(_loc2_ != null)
         {
            return _loc2_.loaderInfo;
         }
         return null;
      }
      
      internal static function §1t10066s0§(param1:DisplayObject) : DisplayObject
      {
         if(§1t10064s0§ == null)
         {
            if(param1.parent != null)
            {
               return §1t10066s0§(param1.parent);
            }
            §1t10064s0§ = param1;
            return §1t10064s0§;
         }
         return §1t10064s0§;
      }
      
      internal static function §1t10067s0§() : *
      {
         var _loc1_:§1t5372s0§ = null;
         if(§1t1523s0§.§1t9528s0§ || §1t1523s0§.§1t9529s0§ == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8882s0§))
         {
            return;
         }
         if(!§1t10060s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8881s0§)) && !§1t10060s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8986s0§)))
         {
            _loc1_ = new §1t5372s0§();
            _loc1_.prompt.text = §1t1521s0§.getString(11118);
            _loc1_.strtext.text = "";
            §1t9973s0§.addChild(_loc1_);
            §1t1541s0§.§1t10099s0§();
            §1t1540s0§.§1t10027s0§();
         }
      }
      
      public static function §1t10068s0§() : *
      {
         var _loc1_:Object = §1t10065s0§(§1t1523s0§.§1t9365s0§).parameters;
         §1t1523s0§.§1t9498s0§ = true;
      }
      
      public static function §1t10069s0§() : *
      {
         var _loc1_:Object = §1t10065s0§(§1t1523s0§.§1t9365s0§).parameters;
         if(_loc1_.pubid == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8987s0§) || _loc1_.kongregate_api_path != null)
         {
            §1t1523s0§.§1t9521s0§ = true;
         }
         else if(_loc1_.pubid == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8944s0§) && _loc1_.querystring_user_id != null && _loc1_.querystring_auth_token != null)
         {
            §1t1523s0§.§1t9522s0§ = true;
         }
         else if(_loc1_.pubid == §1t1056s0§.§1t9114s0§(§1t1056s0§.§1t8945s0§) && _loc1_.querystring_usertoken != null)
         {
            §1t1523s0§.§1t9523s0§ = true;
         }
         else if(§1t10060s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9035s0§)))
         {
            §1t1523s0§.§1t9524s0§ = true;
         }
         else if(§1t10060s0§(§1t1056s0§.§1t9114s0§(§1t1056s0§.§1t9045s0§)))
         {
            §1t1523s0§.§1t9525s0§ = true;
         }
      }
      
      public static function §1t10070s0§() : *
      {
         if(§1t1523s0§.§1t9521s0§)
         {
            new §1t1676s0§();
         }
         else if(§1t1523s0§.§1t9522s0§)
         {
            new §1t1743s0§();
         }
         else if(§1t1523s0§.§1t9523s0§)
         {
            new §1t49s0§();
         }
         else if(§1t1523s0§.§1t9524s0§)
         {
            new §1t1802s0§();
         }
         else if(§1t1523s0§.§1t9525s0§)
         {
            new §1t2284s0§();
         }
      }
      
      public static function §1t10071s0§() : *
      {
         var _loc1_:String = §1t10065s0§(§1t1523s0§.§1t9365s0§).parameters.language;
         if(_loc1_ != null && §1t1521s0§.§1t9281s0§(_loc1_))
         {
            §1t1523s0§.language = _loc1_;
            §1t1521s0§.language = _loc1_;
         }
         else
         {
            _loc1_ = §1t10065s0§(§1t1523s0§.§1t9365s0§).parameters.http_accept_language;
            if(_loc1_ != null)
            {
               _loc1_ = _loc1_.substr(0,2);
               if(_loc1_ == §1t1521s0§.§1t9277s0§)
               {
                  §1t1523s0§.language = _loc1_;
                  §1t1521s0§.language = _loc1_;
               }
            }
         }
      }
      
      public static function §1t10072s0§() : String
      {
         if(§1t1523s0§.§1t9526s0§)
         {
            return "999998";
         }
         if(§1t1523s0§.§1t9527s0§)
         {
            return "999999";
         }
         if(§1t1523s0§.§1t9524s0§)
         {
            return "NG";
         }
         if(§1t1523s0§.§1t9525s0§)
         {
            return "mindjolt";
         }
         var _loc1_:Object = §1t10065s0§(§1t1523s0§.§1t9365s0§).parameters;
         if(_loc1_.pubid == null)
         {
            return "";
         }
         return _loc1_.pubid;
      }
      
      public static function §1t10073s0§() : String
      {
         var _loc1_:Object = §1t10065s0§(§1t1523s0§.§1t9365s0§).parameters;
         if(_loc1_.pubid == null || _loc1_.http_user_host == null)
         {
            return "ip unknown";
         }
         return _loc1_.http_user_host;
      }
   }
}

