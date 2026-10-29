package
{
   import flash.display.Loader;
   import flash.display.Sprite;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.system.Capabilities;
   import flash.system.Security;
   
   public dynamic class MochiBot extends Sprite
   {
      
      public function MochiBot()
      {
         super();
      }
      
      public static function track(param1:Sprite, param2:String) : MochiBot
      {
         var _loc3_:MochiBot = null;
         var _loc4_:String = null;
         var _loc5_:URLVariables = null;
         var _loc6_:String = null;
         var _loc7_:URLRequest = null;
         var _loc8_:Loader = null;
         if(Security.sandboxType == "localWithFile")
         {
            return null;
         }
         _loc3_ = new MochiBot();
         param1.addChild(_loc3_);
         Security.allowDomain("*");
         Security.allowInsecureDomain("*");
         _loc4_ = "http://core.mochibot.com/my/core.swf";
         _loc5_ = new URLVariables();
         _loc5_["sb"] = Security.sandboxType;
         _loc5_["v"] = Capabilities.version;
         _loc5_["swfid"] = param2;
         _loc5_["mv"] = "8";
         _loc5_["fv"] = "9";
         _loc6_ = _loc3_.root.loaderInfo.loaderURL;
         if(_loc6_.indexOf("http") == 0)
         {
            _loc5_["url"] = _loc6_;
         }
         else
         {
            _loc5_["url"] = "local";
         }
         _loc7_ = new URLRequest(_loc4_);
         _loc7_.contentType = "application/x-www-form-urlencoded";
         _loc7_.method = URLRequestMethod.POST;
         _loc7_.data = _loc5_;
         _loc8_ = new Loader();
         _loc3_.addChild(_loc8_);
         _loc8_.load(_loc7_);
         return _loc3_;
      }
   }
}

