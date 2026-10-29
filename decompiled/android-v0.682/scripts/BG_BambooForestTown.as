package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2112")]
   public class BG_BambooForestTown extends GameStage
   {
      
      public var fg_4:MovieClip;
      
      public var f_14:MovieClip;
      
      public var ff_3:MovieClip;
      
      public var fg_5:MovieClip;
      
      public var ground_2:MovieClip;
      
      public var f_15:MovieClip;
      
      public var ff_4:MovieClip;
      
      public var fg_10:MovieClip;
      
      public var fg_6:MovieClip;
      
      public var f_16:MovieClip;
      
      public var ff_5:MovieClip;
      
      public var fg_7:MovieClip;
      
      public var fg_11:MovieClip;
      
      public var f_17:MovieClip;
      
      public var f_1:MovieClip;
      
      public var ff_6:MovieClip;
      
      public var fg_12:MovieClip;
      
      public var fg_8:MovieClip;
      
      public var ground_1:MovieClip;
      
      public var f_18:MovieClip;
      
      public var f_2:MovieClip;
      
      public var ff_7:MovieClip;
      
      public var fg_9:MovieClip;
      
      public var f_19:MovieClip;
      
      public var f_3:MovieClip;
      
      public var f_4:MovieClip;
      
      public var f_5:MovieClip;
      
      public var playercanvas:Canvas;
      
      public var f_6:MovieClip;
      
      public var f_7:MovieClip;
      
      public var f_8:MovieClip;
      
      public var f_9:MovieClip;
      
      public var redBG:RedBG;
      
      public var f_10:MovieClip;
      
      public var fg_1:MovieClip;
      
      public var f_11:MovieClip;
      
      public var fg_2:MovieClip;
      
      public var f_12:MovieClip;
      
      public var ff_1:MovieClip;
      
      public var fg_3:MovieClip;
      
      public var f_13:MovieClip;
      
      public var ff_2:MovieClip;
      
      public function BG_BambooForestTown()
      {
         super();
         contentWidth = 1600;
         groundY = 400;
         flatGround = true;
         this.redBG.visible = false;
         farthestLayerCount = 7;
         farLayerCount = 19;
         playerPlaneLayerCount = 0;
         groundLayerCount = 2;
         foregroundLayerCount = 12;
         registerMC();
      }
   }
}

