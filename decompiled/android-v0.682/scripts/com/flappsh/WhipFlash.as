package com.flappsh
{
   import com.adobe.serialization.json.*;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.system.*;
   
   public class WhipFlash extends MovieClip
   {
      
      private static var instance:WhipFlash;
      
      private static var _gameID:String;
      
      private static var _theStage:Stage;
      
      private static var wfManager:MovieClip;
      
      private static var swfAddy:String;
      
      private static var _local:Boolean;
      
      private static var allowInstance:Boolean = false;
      
      public function WhipFlash()
      {
         super();
         if(!allowInstance)
         {
            throw new Error("You cannot instantiate the WhipFlash class. Use the static function \"WhipFlash.initialize()\" to use WhipFlash");
         }
      }
      
      public static function initialize(param1:Stage, param2:String, param3:Boolean = false) : void
      {
         var _loc4_:Object = null;
         var _loc5_:* = undefined;
         if(param1 == null)
         {
            throw new Error("Whipflash Error: parameter \'theStage\' must not be null when initializing Whipflash");
         }
         if(instance == null)
         {
            Security.allowDomain("www.whipflash.com");
            Security.allowDomain("whipflash.com");
            Security.loadPolicyFile("http://www.whipflash.com/crossdomain.xml");
            Security.allowDomain("*");
            allowInstance = true;
            instance = new WhipFlash();
            _gameID = param2;
            _theStage = param1;
            allowInstance = false;
            _local = param3;
            _loc4_ = new Object();
            _loc4_.id = "getswf";
            _loc4_.x = param2;
            _loc5_ = new FlashPHP("http://www.whipflash.com/api.php",_loc4_);
            _loc5_.addEventListener("ERR",instance.flashPHPError);
            _loc5_.addEventListener("ready",instance.processPHP);
            return;
         }
         throw new Error("Whipflash can only be initialized once per game");
      }
      
      public static function showInterface(param1:Function, param2:Boolean = false) : *
      {
         if(wfManager == null)
         {
            throw new Error("Whipflash Error: You must call WhipFlash.Initialize() at the beginning of your game to use WhipFlash");
         }
         wfManager.showInterface(param1,param2);
      }
      
      private function gameLoaded(param1:Event) : void
      {
         WhipFlash.wfManager = param1.target.content as MovieClip;
         WhipFlash.wfManager.initialize(WhipFlash._theStage,WhipFlash._gameID);
         WhipFlash._theStage.addChild(WhipFlash.wfManager);
      }
      
      private function flashPHPError(param1:Event) : void
      {
         trace(param1);
      }
      
      private function processPHP(param1:Event) : void
      {
         var loaderContext:LoaderContext = null;
         var gameLoader:Loader = null;
         var e:Event = param1;
         var tempString:String = e.target.receivedVars;
         var tempData:Object = JSOND.decode(tempString);
         var id:String = tempData.id;
         switch(id)
         {
            case "getswf":
               if(int(tempData.resultCode) < 1)
               {
                  trace("Whipflash Error: ",tempData.errorMessage);
               }
               else
               {
                  if(WhipFlash._local)
                  {
                     trace("Warning: Testing WhipFlash Locally. Please set the \'testingLocally\' arg in WhipFlash.initialize() to false before release.");
                  }
                  WhipFlash.swfAddy = tempData.swiffy;
                  loaderContext = new LoaderContext();
                  loaderContext.applicationDomain = ApplicationDomain.currentDomain;
                  loaderContext.securityDomain = SecurityDomain.currentDomain;
                  gameLoader = new Loader();
                  gameLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.gameLoaded);
                  try
                  {
                     gameLoader.load(new URLRequest(WhipFlash.swfAddy),WhipFlash._local ? null : loaderContext);
                  }
                  catch(e:Error)
                  {
                     trace("WhipFlash Loading Error. Please make sure you\'ve set the testingLocally arg in WhipFlash.initialize() to true.");
                  }
               }
         }
      }
   }
}

