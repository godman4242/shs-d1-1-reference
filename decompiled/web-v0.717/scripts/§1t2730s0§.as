package
{
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.system.Security;
   
   public class §1t2730s0§
   {
      
      private static var §1t11758s0§:String;
      
      private static var §1t11759s0§:MovieClip;
      
      private static var callback:Function;
      
      private static var options:Object;
      
      public static var service:Object = {"connect":§1t11762s0§};
      
      public static var ad:Object = {"1t11757s0":§1t11757s0§};
      
      private static var version:String = "1.0.4";
      
      public function §1t2730s0§()
      {
         super();
      }
      
      public static function §1t11757s0§(param1:Object = null) : void
      {
         if(§1t11759s0§ == null)
         {
         }
         if(param1 == null)
         {
            param1 = {};
         }
         if(service.§1t11757s0§ != undefined)
         {
            service.§1t11757s0§(param1);
         }
         else
         {
            §1t2730s0§.options = param1;
            if(param1["ad_started"] == null)
            {
               param1["1t11759s0"].stop();
            }
         }
      }
      
      private static function §1t11761s0§(param1:Event) : void
      {
         if(param1.currentTarget.content != null && param1.currentTarget.content.service != null)
         {
            service = param1.currentTarget.content.service;
            service.connect(§1t11758s0§,§1t11759s0§,callback);
            if(options != null)
            {
               service.§1t11757s0§(options);
            }
            service.§1t14806s0§().info("MindJoltAPI loader version [" + version + "]");
         }
      }
      
      private static function §1t11762s0§(param1:String, param2:MovieClip, param3:Function = null) : void
      {
         var _loc4_:Object = null;
         var _loc5_:Loader = null;
         §1t2730s0§.§1t11758s0§ = param1;
         §1t2730s0§.§1t11759s0§ = param2;
         §1t2730s0§.callback = param3;
         if(service.§1t14403s0§ == null)
         {
            Security.allowDomain("static.mindjolt.com");
            _loc4_ = LoaderInfo(param2.root.loaderInfo).parameters;
            _loc5_ = new Loader();
            _loc5_.contentLoaderInfo.addEventListener(Event.COMPLETE,§1t11761s0§);
            _loc5_.load(new URLRequest(_loc4_.§1t14809s0§ || "http://static.mindjolt.com/api/as3/api_local_as3.swf"));
            param2.addChild(_loc5_);
         }
      }
   }
}

