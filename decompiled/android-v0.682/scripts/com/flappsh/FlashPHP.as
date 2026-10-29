package com.flappsh
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   
   public class FlashPHP extends EventDispatcher
   {
      
      public var receivedVars:String;
      
      private var url:String;
      
      private var flashVars:Object;
      
      private var request:URLRequest;
      
      private var completeEvent:Event = new Event("ready");
      
      private var variables:URLVariables = new URLVariables();
      
      private var loader:URLLoader = new URLLoader();
      
      public function FlashPHP(param1:String, param2:Object)
      {
         super();
         this.flashVars = param2;
         this.url = param1;
         this.parseVariables();
      }
      
      private function parseVariables() : *
      {
         var _loc1_:* = undefined;
         for(_loc1_ in this.flashVars)
         {
            this.variables[_loc1_] = this.flashVars[_loc1_];
         }
         this.sendVariables();
      }
      
      private function sendVariables() : *
      {
         this.request = new URLRequest(this.url);
         this.request.method = URLRequestMethod.POST;
         this.request.data = this.variables;
         this.loader.dataFormat = URLLoaderDataFormat.TEXT;
         this.loader.addEventListener(Event.COMPLETE,this.variablesAreLoaded);
         this.loader.addEventListener(IOErrorEvent.IO_ERROR,this.errorCatch);
         this.loader.load(this.request);
      }
      
      internal function variablesAreLoaded(param1:Event) : *
      {
         this.receivedVars = this.loader.data;
         dispatchEvent(this.completeEvent);
      }
      
      public function errorCatch(param1:IOErrorEvent) : void
      {
         this.dispatchEvent(new Event("ERR"));
      }
   }
}

