package
{
   public class XMLBG
   {
      
      public var id:int;
      
      internal var name:String = "";
      
      internal var groundY:int = 400;
      
      internal var flatGround:Boolean = true;
      
      internal var contentWidth:int = 1600;
      
      internal var wrapAround:Boolean = true;
      
      internal var farthestLayerCount:int = 0;
      
      internal var farLayerCount:int = 0;
      
      internal var playerPlaneLayerCount:int = 0;
      
      internal var groundLayerCount:int = 0;
      
      internal var foregroundLayerCount:int = 0;
      
      internal var farthestLayerWrap:int = 1600;
      
      internal var farLayerWrap:int = 1600;
      
      internal var playerPlaneLayerWrap:int = 1600;
      
      internal var groundLayerWrap:int = 1600;
      
      internal var foregroundLayerWrap:int = 1600;
      
      internal var farthestLayerBlur:int = 8;
      
      internal var farLayerBlur:int = 4;
      
      internal var playerPlaneLayerBlur:int = 0;
      
      internal var groundLayerBlur:int = 4;
      
      internal var foregroundLayerBlur:int = 8;
      
      internal var farthestLayerScroll:Number = 0.25;
      
      internal var farLayerScroll:Number = 0.3333333333333333;
      
      internal var playerPlaneLayerScroll:Number = 0.5;
      
      internal var groundLayerScroll:Number = 1;
      
      internal var foregroundLayerScroll:Number = 2;
      
      public function XMLBG(xml:XML)
      {
         super();
         if(xml == null)
         {
            return;
         }
         this.id = xml.id;
         this.name = xml.name;
         if(xml.groundy.toString() != "")
         {
            this.groundY = xml.groundy;
         }
         if(xml.flatground.toString() != "")
         {
            this.flatGround = xml.flatground == "1";
         }
         if(xml.contentwidth.toString() != "")
         {
            this.contentWidth = xml.contentwidth;
         }
         if(xml.wrap.toString() != "")
         {
            this.wrapAround = xml.wrap == "1";
         }
         if(xml.ffcount.toString() != "")
         {
            this.farthestLayerCount = xml.ffcount;
         }
         if(xml.fcount.toString() != "")
         {
            this.farLayerCount = xml.fcount;
         }
         if(xml.ppcount.toString() != "")
         {
            this.playerPlaneLayerCount = xml.ppcount;
         }
         if(xml.gcount.toString() != "")
         {
            this.groundLayerCount = xml.gcount;
         }
         if(xml.fgcount.toString() != "")
         {
            this.foregroundLayerCount = xml.fgcount;
         }
         if(xml.ffwrap.toString() != "")
         {
            this.farthestLayerWrap = xml.ffwrap;
         }
         if(xml.fwrap.toString() != "")
         {
            this.farLayerWrap = xml.fwrap;
         }
         if(xml.ppwrap.toString() != "")
         {
            this.playerPlaneLayerWrap = xml.ppwrap;
         }
         if(xml.gwrap.toString() != "")
         {
            this.groundLayerWrap = xml.gwrap;
         }
         if(xml.fgwrap.toString() != "")
         {
            this.foregroundLayerWrap = xml.fgwrap;
         }
         if(xml.ffblur.toString() != "")
         {
            this.farthestLayerBlur = xml.ffblur;
         }
         if(xml.fblur.toString() != "")
         {
            this.farLayerBlur = xml.fblur;
         }
         if(xml.ppblur.toString() != "")
         {
            this.playerPlaneLayerBlur = xml.ppblur;
         }
         if(xml.gblur.toString() != "")
         {
            this.groundLayerBlur = xml.gblur;
         }
         if(xml.fgblur.toString() != "")
         {
            this.foregroundLayerBlur = xml.fgblur;
         }
         if(xml.ffscroll.toString() != "")
         {
            this.farthestLayerScroll = xml.ffscroll;
         }
         if(xml.fscroll.toString() != "")
         {
            this.farLayerScroll = xml.fscroll;
         }
         if(xml.ppscroll.toString() != "")
         {
            this.playerPlaneLayerScroll = xml.ppscroll;
         }
         if(xml.gscroll.toString() != "")
         {
            this.groundLayerScroll = xml.gscroll;
         }
         if(xml.fgscroll.toString() != "")
         {
            this.foregroundLayerScroll = xml.fgscroll;
         }
      }
   }
}

