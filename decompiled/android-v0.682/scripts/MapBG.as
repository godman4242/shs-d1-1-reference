package
{
   import flash.display.MovieClip;
   import flash.display.Shape;
   
   public class MapBG extends MovieClip
   {
      
      public var BG:MovieClip;
      
      public var mapID:int;
      
      public var nodePath:Shape;
      
      public function MapBG(background:MovieClip = null, ID:int = -1)
      {
         super();
         this.BG = background;
         addChild(this.BG);
         this.nodePath = new Shape();
         addChild(this.nodePath);
         this.mapID = ID;
      }
   }
}

