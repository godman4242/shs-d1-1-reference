package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2059")]
   public class BG_TownVillage extends GameStage
   {
      
      public var ff_3:MovieClip;
      
      public var ground_2:MovieClip;
      
      public var ff_4:MovieClip;
      
      public var ground_3:MovieClip;
      
      public var ff_5:MovieClip;
      
      public var f_1:MovieClip;
      
      public var ff_6:MovieClip;
      
      public var ground_1:MovieClip;
      
      public var f_2:MovieClip;
      
      public var ff_7:MovieClip;
      
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
      
      public var f_11:MovieClip;
      
      public var f_12:MovieClip;
      
      public var ff_1:MovieClip;
      
      public var ground_4:MovieClip;
      
      public var ff_2:MovieClip;
      
      public function BG_TownVillage()
      {
         super();
         contentWidth = 1600;
         groundY = 400;
         flatGround = true;
         this.redBG.visible = false;
         farthestLayerCount = 7;
         farLayerCount = 12;
         playerPlaneLayerCount = 0;
         groundLayerCount = 4;
         foregroundLayerCount = 0;
         registerMC();
         var color:uint = NodeGenerator.instance.getTownStyle(StageManager.getCurrentNode());
         if(color >= 1 && color <= 4)
         {
            this.f_1.gotoAndStop(color + 1);
            this.f_2.gotoAndStop(color + 1);
            this.f_3.gotoAndStop(color + 1);
            this.f_4.gotoAndStop(color + 1);
            this.f_5.gotoAndStop(color + 1);
            this.f_6.gotoAndStop(color + 1);
         }
         else
         {
            this.f_1.gotoAndStop(1);
            this.f_2.gotoAndStop(1);
            this.f_3.gotoAndStop(1);
            this.f_4.gotoAndStop(1);
            this.f_5.gotoAndStop(1);
            this.f_6.gotoAndStop(1);
         }
      }
      
      override public function redFreeze() : *
      {
         this.redBG.visible = true;
         super.redFreeze();
      }
      
      override public function unRedFreeze() : *
      {
         this.redBG.visible = false;
         super.unRedFreeze();
      }
   }
}

