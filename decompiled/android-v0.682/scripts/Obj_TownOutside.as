package
{
   import flash.display.MovieClip;
   import flash.geom.ColorTransform;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2226")]
   public class Obj_TownOutside extends StageObject
   {
      
      public var pp_7:MovieClip;
      
      public var building3:MovieClip;
      
      public var pp_8:MovieClip;
      
      public var building2:MovieClip;
      
      public var pp_9:MovieClip;
      
      public var f_1:MovieClip;
      
      public var f_2:MovieClip;
      
      public var pp_10:MovieClip;
      
      public var f_3:MovieClip;
      
      public var pp_11:MovieClip;
      
      public var f_4:MovieClip;
      
      public var door:MovieClip;
      
      public var pp_12:MovieClip;
      
      public var f_5:MovieClip;
      
      public var f_6:MovieClip;
      
      public var pp_13:MovieClip;
      
      public var f_7:MovieClip;
      
      public var pp_14:MovieClip;
      
      public var f_8:MovieClip;
      
      public var pp_15:MovieClip;
      
      public var f_9:MovieClip;
      
      public var pp_1:MovieClip;
      
      public var pp_16:MovieClip;
      
      public var building5:MovieClip;
      
      public var pp_2:MovieClip;
      
      public var building4:MovieClip;
      
      public var f_10:MovieClip;
      
      public var pp_3:MovieClip;
      
      public var f_11:MovieClip;
      
      public var pp_4:MovieClip;
      
      public var gate:MovieClip;
      
      public var ff_1:MovieClip;
      
      public var pp_5:MovieClip;
      
      public var clansymbol:MovieClip;
      
      public var building1:MovieClip;
      
      public var pp_6:MovieClip;
      
      internal var ppLayer:Array = new Array();
      
      internal var farLayer:Array = new Array();
      
      internal var farthestLayer:Array = new Array();
      
      internal var ppScrollMod:Number = 1;
      
      public function Obj_TownOutside(props:String, objname:String = "")
      {
         super();
         addFrameScript(0,this.frame1);
         var strArray:Array = props.split(",");
         var townlevel:int = int(strArray[0]);
         var townside:int = int(strArray[1]);
         if(townside > 5)
         {
            townside = 0;
         }
         var color:uint = uint(strArray[2]);
         var gatesClosed:Boolean = strArray[3] == "1";
         var newColorTransform:ColorTransform = new ColorTransform();
         newColorTransform.color = color;
         if(townlevel <= 2)
         {
            if(color == 1)
            {
               gotoAndStop(2);
            }
            else if(color == 2)
            {
               gotoAndStop(3);
            }
            else if(color == 3)
            {
               gotoAndStop(4);
            }
            else
            {
               gotoAndStop(1);
            }
         }
         else if(townlevel == 3)
         {
            gotoAndStop(10);
            if(color >= 1 && color <= 4)
            {
               this.building1.gotoAndStop(color + 1);
               this.building2.gotoAndStop(color + 1);
               this.building3.gotoAndStop(color + 1);
               this.building4.gotoAndStop(color + 1);
            }
            else
            {
               this.building1.building.color.transform.colorTransform = newColorTransform;
               this.building2.building.color.transform.colorTransform = newColorTransform;
               this.building3.building.color.transform.colorTransform = newColorTransform;
               this.building4.building.color.transform.colorTransform = newColorTransform;
            }
         }
         else if(townlevel == 4)
         {
            gotoAndStop(11);
            this.clansymbol.gotoAndStop(townside + 1);
            if(color >= 1 && color <= 4)
            {
               this.building1.gotoAndStop(color + 1);
               this.building2.gotoAndStop(color + 1);
               this.building3.gotoAndStop(color + 1);
               this.building4.gotoAndStop(color + 1);
            }
            else
            {
               this.building1.building.color.transform.colorTransform = newColorTransform;
               this.building2.building.color.transform.colorTransform = newColorTransform;
               this.building3.building.color.transform.colorTransform = newColorTransform;
               this.building4.building.color.transform.colorTransform = newColorTransform;
            }
         }
         else if(townlevel == 5)
         {
            gotoAndStop(12);
            this.clansymbol.gotoAndStop(townside + 1);
            if(color >= 1 && color <= 4)
            {
               this.building1.gotoAndStop(color + 1);
               this.building2.gotoAndStop(color + 1);
               this.building3.gotoAndStop(color + 1);
               this.building4.gotoAndStop(color + 1);
            }
            else
            {
               this.building1.building.color.transform.colorTransform = newColorTransform;
               this.building2.building.color.transform.colorTransform = newColorTransform;
               this.building3.building.color.transform.colorTransform = newColorTransform;
               this.building4.building.color.transform.colorTransform = newColorTransform;
            }
         }
         else if(townlevel == 6)
         {
            gotoAndStop(13);
         }
         if(!gatesClosed)
         {
            this.door.visible = false;
         }
         this.registerMC(currentFrame,gatesClosed);
      }
      
      internal function registerMC(frame:int, gatesClosed:Boolean) : *
      {
         if(frame == 1)
         {
            this.ppLayer.push(this.pp_1);
            this.ppLayer.push(this.pp_2);
            this.ppLayer.push(this.pp_3);
            this.ppLayer.push(this.pp_4);
            this.ppLayer.push(this.pp_5);
            this.ppLayer.push(this.pp_6);
            this.ppLayer.push(this.pp_7);
            this.ppLayer.push(this.pp_8);
            this.ppLayer.push(this.pp_9);
            this.ppLayer.push(this.pp_10);
            this.ppLayer.push(this.pp_11);
            this.ppLayer.push(this.pp_12);
            this.ppLayer.push(this.pp_13);
            this.ppLayer.push(this.pp_14);
            this.ppLayer.push(this.pp_15);
            this.ppLayer.push(this.pp_16);
            this.ppLayer.push(this.gate);
            this.ppLayer.push(this.door);
            this.farLayer.push(this.f_1);
            this.farLayer.push(this.f_2);
            this.farLayer.push(this.f_3);
            this.farLayer.push(this.f_4);
            this.farLayer.push(this.f_5);
         }
         else if(frame == 2)
         {
            this.ppLayer.push(this.pp_1);
            this.ppLayer.push(this.pp_2);
            this.ppLayer.push(this.pp_3);
            this.ppLayer.push(this.pp_4);
            this.ppLayer.push(this.pp_5);
            this.ppLayer.push(this.pp_6);
            this.ppLayer.push(this.pp_7);
            this.ppLayer.push(this.pp_8);
            this.ppLayer.push(this.pp_9);
            this.ppLayer.push(this.pp_10);
            this.ppLayer.push(this.pp_11);
            this.ppLayer.push(this.pp_12);
            this.ppLayer.push(this.pp_13);
            this.ppLayer.push(this.pp_14);
            this.ppLayer.push(this.pp_15);
            this.ppLayer.push(this.pp_16);
            this.ppLayer.push(this.gate);
            this.ppLayer.push(this.door);
            this.farLayer.push(this.f_1);
            this.farLayer.push(this.f_2);
            this.farLayer.push(this.f_3);
            this.farLayer.push(this.f_4);
            this.farLayer.push(this.f_5);
            this.farLayer.push(this.f_6);
            this.farLayer.push(this.f_7);
            this.farLayer.push(this.f_8);
            this.farLayer.push(this.f_9);
            this.farLayer.push(this.f_10);
            this.farLayer.push(this.f_11);
         }
         else if(frame == 3)
         {
            this.ppLayer.push(this.pp_1);
            this.ppLayer.push(this.pp_2);
            this.ppLayer.push(this.pp_3);
            this.ppLayer.push(this.pp_4);
            this.ppLayer.push(this.pp_5);
            this.ppLayer.push(this.pp_6);
            this.ppLayer.push(this.pp_7);
            this.ppLayer.push(this.pp_8);
            this.ppLayer.push(this.pp_9);
            this.ppLayer.push(this.pp_10);
            this.ppLayer.push(this.pp_11);
            this.ppLayer.push(this.pp_12);
            this.ppLayer.push(this.pp_13);
            this.ppLayer.push(this.pp_14);
            this.ppLayer.push(this.pp_15);
            this.ppLayer.push(this.pp_16);
            this.ppLayer.push(this.gate);
            this.ppLayer.push(this.door);
            this.farLayer.push(this.f_1);
            this.farLayer.push(this.f_2);
            this.farLayer.push(this.f_3);
            this.farLayer.push(this.f_4);
            this.farLayer.push(this.f_5);
            this.farLayer.push(this.f_6);
            this.farLayer.push(this.f_7);
            this.farLayer.push(this.f_8);
            this.farLayer.push(this.f_9);
            this.farLayer.push(this.f_10);
            this.farLayer.push(this.f_11);
         }
         else if(frame == 4)
         {
            this.ppLayer.push(this.pp_1);
            this.ppLayer.push(this.pp_2);
            this.ppLayer.push(this.pp_3);
            this.ppLayer.push(this.pp_4);
            this.ppLayer.push(this.pp_5);
            this.ppLayer.push(this.pp_6);
            this.ppLayer.push(this.pp_7);
            this.ppLayer.push(this.pp_8);
            this.ppLayer.push(this.pp_9);
            this.ppLayer.push(this.pp_10);
            this.ppLayer.push(this.pp_11);
            this.ppLayer.push(this.pp_12);
            this.ppLayer.push(this.pp_13);
            this.ppLayer.push(this.pp_14);
            this.ppLayer.push(this.pp_15);
            this.ppLayer.push(this.pp_16);
            this.ppLayer.push(this.gate);
            this.ppLayer.push(this.door);
            this.farLayer.push(this.f_1);
            this.farLayer.push(this.f_2);
            this.farLayer.push(this.f_3);
            this.farLayer.push(this.f_4);
            this.farLayer.push(this.f_5);
         }
         else if(frame == 10)
         {
            this.ppLayer.push(this.pp_1);
            this.ppLayer.push(this.pp_2);
            this.ppLayer.push(this.pp_3);
            this.ppLayer.push(this.pp_4);
            this.ppLayer.push(this.pp_5);
            this.ppLayer.push(this.pp_6);
            this.ppLayer.push(this.gate);
            this.ppLayer.push(this.door);
            this.farLayer.push(this.building1);
            this.farLayer.push(this.building2);
            this.farLayer.push(this.building3);
            this.farLayer.push(this.building4);
            if(gatesClosed)
            {
               this.building5.visible = false;
            }
            else
            {
               this.farLayer.push(this.building5);
               ColorCode.blur(this.building5,4);
            }
         }
         else if(frame == 11)
         {
            this.ppLayer.push(this.pp_1);
            this.ppLayer.push(this.pp_2);
            this.ppLayer.push(this.pp_3);
            this.ppLayer.push(this.pp_4);
            this.ppLayer.push(this.gate);
            this.ppLayer.push(this.door);
            this.ppLayer.push(this.clansymbol);
            this.farLayer.push(this.building1);
            this.farLayer.push(this.building2);
            this.farLayer.push(this.building3);
            this.farLayer.push(this.building4);
            if(gatesClosed)
            {
               this.building5.visible = false;
            }
            else
            {
               this.farLayer.push(this.building5);
               ColorCode.blur(this.building5,4);
            }
         }
         else if(frame == 12)
         {
            this.ppLayer.push(this.pp_1);
            this.ppLayer.push(this.pp_2);
            this.ppLayer.push(this.pp_3);
            this.ppLayer.push(this.pp_4);
            this.ppLayer.push(this.gate);
            this.ppLayer.push(this.door);
            this.ppLayer.push(this.clansymbol);
            this.farLayer.push(this.building1);
            this.farLayer.push(this.building2);
            this.farLayer.push(this.building3);
            this.farLayer.push(this.building4);
            if(gatesClosed)
            {
               this.building5.visible = false;
            }
            else
            {
               this.farLayer.push(this.building5);
               ColorCode.blur(this.building5,4);
            }
            this.farthestLayer.push(this.ff_1);
            ColorCode.blur(this.ff_1,4);
         }
         else if(frame == 13)
         {
            this.ppLayer.push(this.pp_1);
            this.ppLayer.push(this.pp_2);
            this.ppLayer.push(this.gate);
            this.ppLayer.push(this.door);
            if(gatesClosed)
            {
               this.f_1.visible = false;
               this.f_2.visible = false;
            }
            else
            {
               this.farLayer.push(this.f_1);
               this.farLayer.push(this.f_2);
               ColorCode.blur(this.f_1,4);
               ColorCode.blur(this.f_2,8);
            }
         }
         var max:int = int(this.ppLayer.length);
         for(var i:int = 0; i < max; i++)
         {
            this.ppLayer[i].cacheAsBitmap = true;
         }
         max = int(this.farLayer.length);
         for(i = 0; i < max; i++)
         {
            this.farLayer[i].cacheAsBitmap = true;
            if(frame <= 4 || frame == 10)
            {
               this.farLayer[i].x -= 80;
            }
            else if(frame == 11 || frame == 12)
            {
               this.farLayer[i].x -= 100;
            }
         }
         if(frame <= 4 || frame == 10 || frame == 11 || frame == 12)
         {
            this.ppScrollMod = 0.8;
         }
         max = int(this.farthestLayer.length);
         for(i = 0; i < max; i++)
         {
            this.farthestLayer[i].cacheAsBitmap = true;
         }
      }
      
      override public function doScroll(dist:int) : *
      {
         var max:int = int(this.ppLayer.length);
         for(var i:int = 0; i < max; i++)
         {
            this.ppLayer[i].x += dist;
         }
         max = int(this.farLayer.length);
         if(this.ppScrollMod != 1)
         {
            for(i = 0; i < max; i++)
            {
               this.farLayer[i].x += dist * this.ppScrollMod;
            }
         }
         else
         {
            for(i = 0; i < max; i++)
            {
               this.farLayer[i].x += dist;
            }
         }
         max = int(this.farthestLayer.length);
         for(i = 0; i < max; i++)
         {
            this.farthestLayer[i].x += dist / 2;
         }
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

