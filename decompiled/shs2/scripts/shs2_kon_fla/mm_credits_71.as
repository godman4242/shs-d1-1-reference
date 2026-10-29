package shs2_kon_fla
{
   import adobe.utils.*;
   import flash.accessibility.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2263")]
   public dynamic class mm_credits_71 extends MovieClip
   {
      
      public var lutcreditsbutton:SimpleButton;
      
      public var rayteoactivebutton:SimpleButton;
      
      public var backbutton:SimpleButton;
      
      public var adamalonsobutton:SimpleButton;
      
      public function mm_credits_71()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         backbutton.addEventListener(MouseEvent.CLICK,MovieClip(parent).backClickEvent);
         lutcreditsbutton.addEventListener(MouseEvent.CLICK,lutcreditsClickEvent);
         rayteoactivebutton.addEventListener(MouseEvent.CLICK,rayClickEvent);
         adamalonsobutton.addEventListener(MouseEvent.CLICK,adamClickEvent);
      }
      
      public function lutcreditsClickEvent(param1:Event) : void
      {
         var url:String = null;
         var request:URLRequest = null;
         var event:Event = param1;
         url = "http://lutc.blogspot.com";
         request = new URLRequest(url);
         try
         {
            navigateToURL(request,"_blank");
         }
         catch(e:Error)
         {
            trace("Error occurred!");
         }
      }
      
      public function rayClickEvent(param1:Event) : void
      {
         var url:String = null;
         var request:URLRequest = null;
         var event:Event = param1;
         url = "http://rayteoactive.wordpress.com";
         request = new URLRequest(url);
         try
         {
            navigateToURL(request,"_blank");
         }
         catch(e:Error)
         {
            trace("Error occurred!");
         }
      }
      
      public function adamClickEvent(param1:Event) : void
      {
         var url:String = null;
         var request:URLRequest = null;
         var event:Event = param1;
         url = "http://www.adamalonso.com";
         request = new URLRequest(url);
         try
         {
            navigateToURL(request,"_blank");
         }
         catch(e:Error)
         {
            trace("Error occurred!");
         }
      }
   }
}

