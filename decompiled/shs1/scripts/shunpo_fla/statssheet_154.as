package shunpo_fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol783")]
   public dynamic class statssheet_154 extends MovieClip
   {
      
      public var achievementkills:MovieClip;
      
      public var hp:TextField;
      
      public var achievementheadshot:MovieClip;
      
      public var slashes:TextField;
      
      public var achievementbanner:MovieClip;
      
      public var achievementarrowheadshot:MovieClip;
      
      public var deflect:TextField;
      
      public var objective:TextField;
      
      public var sectorlabel:MovieClip;
      
      public var sectorcount:TextField;
      
      public var achievementfights:MovieClip;
      
      public var achievementdeaths:MovieClip;
      
      public var timing:TextField;
      
      public var deaths:TextField;
      
      public var arrows:TextField;
      
      public var score:TextField;
      
      public var turns:TextField;
      
      public var combo:TextField;
      
      public var sectortotal:TextField;
      
      public var battles:TextField;
      
      public var achievementitem:MovieClip;
      
      public var achievementhex:MovieClip;
      
      public var banners:TextField;
      
      public var achievementmaxslash:MovieClip;
      
      public var kills:TextField;
      
      public var headshots:TextField;
      
      public var smallsmallsticker:SimpleButton;
      
      public var mission:TextField;
      
      public var items:TextField;
      
      public var contbtn:SimpleButton;
      
      public var arrowheadshots:TextField;
      
      public function statssheet_154()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function sse4ClickEvent(param1:Event) : void
      {
         var url:String = null;
         var request:URLRequest = null;
         var event:Event = param1;
         url = "http://www.goldenjoystick.com/";
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
      
      internal function frame1() : *
      {
         if(!StatsManager.instance.bossDefeated)
         {
            contbtn.visible = false;
         }
         contbtn.addEventListener(MouseEvent.CLICK,contClickEvent);
         smallsmallsticker.addEventListener(MouseEvent.CLICK,sse4ClickEvent);
      }
      
      public function contClickEvent(param1:Event) : void
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
   }
}

