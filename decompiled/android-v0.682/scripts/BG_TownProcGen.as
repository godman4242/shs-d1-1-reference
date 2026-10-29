package
{
   import flash.display.MovieClip;
   import flash.geom.ColorTransform;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2109")]
   public class BG_TownProcGen extends GameStage
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
      
      public var sky:MovieClip;
      
      public var f_10:MovieClip;
      
      public var f_11:MovieClip;
      
      public var f_12:MovieClip;
      
      public var ff_1:MovieClip;
      
      public var ground_4:MovieClip;
      
      public var ff_2:MovieClip;
      
      internal var hasJunction:Boolean;
      
      public function BG_TownProcGen(towntype:int, bgParam:int)
      {
         var i:int = 0;
         super();
         contentWidth = 1600;
         groundY = 400;
         flatGround = true;
         farthestLayerCount = 7;
         farLayerCount = 12;
         playerPlaneLayerCount = 0;
         groundLayerCount = 4;
         foregroundLayerCount = 0;
         this.registerMC();
         this.redBG.visible = false;
         var color:uint = NodeGenerator.instance.getTownStyle(StageManager.getCurrentNode());
         var newColorTransform:ColorTransform = new ColorTransform();
         newColorTransform.color = color;
         this.hasJunction = bgParam == 1 && color <= 4;
         if(towntype == 0)
         {
            for(i = 0; i < 6; i++)
            {
               farArray[i].visible = false;
            }
         }
         else if(towntype == 1)
         {
            for(i = 0; i < 6; i++)
            {
               farArray[i].visible = true;
               farArray[i].gotoAndStop(1);
            }
         }
         else if(towntype == 2)
         {
            for(i = 0; i < 6; i++)
            {
               farArray[i].visible = true;
               farArray[i].gotoAndStop(2);
            }
         }
         for(i = 6; i < 12; i++)
         {
            if(color >= 1 && color <= 4)
            {
               farArray[i].gotoAndStop(color + 1);
            }
            else
            {
               farArray[i].gotoAndStop(1);
               farArray[i].building.color.transform.colorTransform = newColorTransform;
            }
         }
         var rng:RNG = new RNG(StageManager.getCurrentNode());
         this.sky.gotoAndStop(rng.rand(10) + 1);
      }
      
      override public function registerMC() : *
      {
         var i:int = 0;
         var mc:MovieClip = null;
         for(i = 1; i <= farthestLayerCount; i++)
         {
            mc = MovieClip(this.getChildByName("ff_" + i));
            farthestArray.push(mc);
            mc.cacheAsBitmap = true;
            mc.flipped = this.scaleX < 0 || mc.transform.matrix.a < 0;
            ColorCode.blur(mc,8);
            if(Boolean(mc.flipped) && (mc.x < 0 || mc.x - mc.width > screenWidth))
            {
               mc.visible = false;
            }
            else if(!mc.flipped && (mc.x + mc.width < 0 || mc.x > screenWidth))
            {
               mc.visible = false;
            }
         }
         farthestArray.fixed = true;
         for(i = 1; i <= farLayerCount; i++)
         {
            mc = MovieClip(this.getChildByName("f_" + i));
            farArray.push(mc);
            mc.cacheAsBitmap = true;
            mc.flipped = this.scaleX < 0 || mc.transform.matrix.a < 0;
            if(this.hasJunction)
            {
               ColorCode.blur(mc,8);
            }
            else
            {
               ColorCode.blur(mc,4);
            }
            if(Boolean(mc.flipped) && (mc.x < 0 || mc.x - mc.width > screenWidth))
            {
               mc.visible = false;
            }
            else if(!mc.flipped && (mc.x + mc.width < 0 || mc.x > screenWidth))
            {
               mc.visible = false;
            }
         }
         farArray.fixed = true;
         for(i = 1; i <= playerPlaneLayerCount; i++)
         {
            mc = MovieClip(this.getChildByName("pp_" + i));
            playerPlaneArray.push(mc);
            mc.cacheAsBitmap = true;
            mc.flipped = this.scaleX < 0 || mc.transform.matrix.a < 0;
            if(Boolean(mc.flipped) && (mc.x < 0 || mc.x - mc.width > screenWidth))
            {
               mc.visible = false;
            }
            else if(!mc.flipped && (mc.x + mc.width < 0 || mc.x > screenWidth))
            {
               mc.visible = false;
            }
         }
         playerPlaneArray.fixed = true;
         for(i = 1; i <= groundLayerCount; i++)
         {
            mc = MovieClip(this.getChildByName("ground_" + i));
            groundArray.push(mc);
            mc.cacheAsBitmap = true;
            mc.flipped = this.scaleX < 0 || mc.transform.matrix.a < 0;
            ColorCode.blur(mc,4);
         }
         groundArray.fixed = true;
         for(i = 1; i <= foregroundLayerCount; i++)
         {
            mc = MovieClip(this.getChildByName("fg_" + i));
            foregroundArray.push(mc);
            mc.cacheAsBitmap = true;
            mc.flipped = this.scaleX < 0 || mc.transform.matrix.a < 0;
            ColorCode.blur(mc,8);
            if(Boolean(mc.flipped) && (mc.x < 0 || mc.x - mc.width > screenWidth))
            {
               mc.visible = false;
            }
            else if(!mc.flipped && (mc.x + mc.width < 0 || mc.x > screenWidth))
            {
               mc.visible = false;
            }
         }
         foregroundArray.fixed = true;
      }
      
      override public function scrollStage(dist:int) : *
      {
         var i:int = 0;
         var thing:MovieClip = null;
         var nextThing:MovieClip = null;
         for(i = 0; i < farthestLayerCount; i++)
         {
            thing = farthestArray[i];
            if(this.hasJunction)
            {
               thing.x += dist * 6 / 8;
               checkWrapAround(thing,4,dist);
               if(!thing.visible)
               {
                  checkMakeVisible(thing,dist);
               }
            }
            else
            {
               thing.x += dist / 4;
               checkWrapAround(thing,4,dist);
               if(!thing.visible)
               {
                  checkMakeVisible(thing,dist);
               }
            }
         }
         for(i = 0; i < farLayerCount; i++)
         {
            thing = farArray[i];
            if(this.hasJunction)
            {
               thing.x += dist * 7 / 8;
               checkWrapAround(thing,3,dist);
               if(!thing.visible)
               {
                  checkMakeVisible(thing,dist);
               }
            }
            else
            {
               thing.x += dist / 3;
               checkWrapAround(thing,3,dist);
               if(!thing.visible)
               {
                  checkMakeVisible(thing,dist);
               }
            }
         }
         for(i = 0; i < playerPlaneLayerCount; i++)
         {
            thing = playerPlaneArray[i];
            thing.x += dist;
            checkWrapAround(thing,2,dist);
            if(!thing.visible)
            {
               checkMakeVisible(thing,dist);
            }
         }
         for(i = 0; i < groundLayerCount; i++)
         {
            thing = groundArray[i];
            thing.x += dist;
            checkWrapAround(thing,1,dist);
         }
         for(i = 0; i < foregroundLayerCount; i++)
         {
            thing = foregroundArray[i];
            thing.x += dist * 2;
            checkWrapAround(thing,0,dist);
            if(!thing.visible)
            {
               checkMakeVisible(thing,dist);
            }
         }
         stagePosition += dist;
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

