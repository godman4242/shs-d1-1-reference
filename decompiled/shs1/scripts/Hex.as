package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol585")]
   public class Hex extends MovieClip
   {
      
      public var reinforceanim:MovieClip;
      
      public var hex:MovieClip;
      
      public var selecthighlight:MovieClip;
      
      public var num:TextField;
      
      internal var info:HexInfo;
      
      public var highlight:MovieClip;
      
      public function Hex()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function select() : *
      {
         selecthighlight.visible = true;
      }
      
      public function init(param1:HexInfo) : *
      {
         this.info = param1;
      }
      
      public function hexOutEvent(param1:Event) : void
      {
         highlight.visible = false;
      }
      
      public function getColumn() : *
      {
         return info.column;
      }
      
      public function hexOverEvent(param1:Event) : void
      {
         highlight.visible = true;
      }
      
      public function hexClickEvent(param1:Event) : void
      {
         HexManager.hexClick(this);
      }
      
      internal function frame1() : *
      {
         highlight.visible = false;
         selecthighlight.visible = false;
         this.addEventListener(MouseEvent.CLICK,hexClickEvent);
         this.addEventListener(MouseEvent.MOUSE_OVER,hexOverEvent);
         this.addEventListener(MouseEvent.MOUSE_OUT,hexOutEvent);
      }
      
      public function getHexInfo() : HexInfo
      {
         return info;
      }
      
      public function getRow() : *
      {
         return info.row;
      }
      
      public function updateDisplay() : *
      {
         var _loc1_:* = undefined;
         hex.gotoAndStop(info.side);
         num.text = info.strength.toString();
         num.x = -23;
         num.y = -20;
         num.scaleX = 1;
         num.scaleY = 1;
         if(info.strength == 0)
         {
            num.text = "";
         }
         if(info.hasPlayer)
         {
            _loc1_ = new Point(x,y);
            _loc1_ = StatsManager.instance.map.hexgrid.localToGlobal(_loc1_);
            _loc1_ = StatsManager.instance.map.globalToLocal(_loc1_);
            StatsManager.instance.map.hexplayer.x = _loc1_.x;
            StatsManager.instance.map.hexplayer.y = _loc1_.y - 8;
            num.x = -4;
            num.y = -8;
            num.scaleX = 0.8;
            num.scaleY = 0.8;
         }
      }
      
      public function unselect() : *
      {
         selecthighlight.visible = false;
      }
   }
}

