package
{
   import flash.display.MovieClip;
   import flash.geom.ColorTransform;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2919")]
   public class §1t8485s0§ extends StageObject
   {
      
      public var building1:MovieClip;
      
      public var building2:MovieClip;
      
      public var building3:MovieClip;
      
      public var building4:MovieClip;
      
      public var building5:MovieClip;
      
      public var §1t5458s0§:MovieClip;
      
      public var door:MovieClip;
      
      public var f_1:MovieClip;
      
      public var f_10:MovieClip;
      
      public var f_11:MovieClip;
      
      public var f_2:MovieClip;
      
      public var f_3:MovieClip;
      
      public var f_4:MovieClip;
      
      public var f_5:MovieClip;
      
      public var f_6:MovieClip;
      
      public var f_7:MovieClip;
      
      public var f_8:MovieClip;
      
      public var f_9:MovieClip;
      
      public var ff_1:MovieClip;
      
      public var gate:MovieClip;
      
      public var pp_1:MovieClip;
      
      public var pp_10:MovieClip;
      
      public var pp_11:MovieClip;
      
      public var pp_12:MovieClip;
      
      public var pp_13:MovieClip;
      
      public var pp_14:MovieClip;
      
      public var pp_15:MovieClip;
      
      public var pp_16:MovieClip;
      
      public var pp_2:MovieClip;
      
      public var pp_3:MovieClip;
      
      public var pp_4:MovieClip;
      
      public var pp_5:MovieClip;
      
      public var pp_6:MovieClip;
      
      public var pp_7:MovieClip;
      
      public var pp_8:MovieClip;
      
      public var pp_9:MovieClip;
      
      internal var ppLayer:Array = new Array();
      
      internal var farLayer:Array = new Array();
      
      internal var farthestLayer:Array = new Array();
      
      internal var ppScrollMod:Number = 1;
      
      public function §1t8485s0§(param1:String, param2:String = "")
      {
         super();
         addFrameScript(0,this.frame1);
         var _loc3_:Array = param1.split(",");
         var _loc4_:int = int(_loc3_[0]);
         var _loc5_:int = int(_loc3_[1]);
         if(_loc5_ > 5)
         {
            _loc5_ = 0;
         }
         var _loc6_:uint = uint(_loc3_[2]);
         var _loc7_:Boolean = _loc3_[3] == "1" || _loc3_[3] == "true";
         var _loc8_:ColorTransform = new ColorTransform();
         _loc8_.color = _loc6_;
         if(_loc4_ <= 2)
         {
            if(_loc6_ == 1)
            {
               gotoAndStop(2);
            }
            else if(_loc6_ == 2)
            {
               gotoAndStop(3);
            }
            else if(_loc6_ == 3)
            {
               gotoAndStop(4);
            }
            else
            {
               gotoAndStop(1);
            }
         }
         else if(_loc4_ == 3)
         {
            gotoAndStop(10);
            if(_loc6_ >= 1 && _loc6_ <= 4)
            {
               this.building1.gotoAndStop(_loc6_ + 1);
               this.building2.gotoAndStop(_loc6_ + 1);
               this.building3.gotoAndStop(_loc6_ + 1);
               this.building4.gotoAndStop(_loc6_ + 1);
            }
            else
            {
               this.building1.building.color.transform.colorTransform = _loc8_;
               this.building2.building.color.transform.colorTransform = _loc8_;
               this.building3.building.color.transform.colorTransform = _loc8_;
               this.building4.building.color.transform.colorTransform = _loc8_;
            }
         }
         else if(_loc4_ == 4)
         {
            gotoAndStop(11);
            this.§1t5458s0§.gotoAndStop(_loc5_ + 1);
            if(_loc6_ >= 1 && _loc6_ <= 4)
            {
               this.building1.gotoAndStop(_loc6_ + 1);
               this.building2.gotoAndStop(_loc6_ + 1);
               this.building3.gotoAndStop(_loc6_ + 1);
               this.building4.gotoAndStop(_loc6_ + 1);
            }
            else
            {
               this.building1.building.color.transform.colorTransform = _loc8_;
               this.building2.building.color.transform.colorTransform = _loc8_;
               this.building3.building.color.transform.colorTransform = _loc8_;
               this.building4.building.color.transform.colorTransform = _loc8_;
            }
         }
         else if(_loc4_ == 5)
         {
            gotoAndStop(12);
            this.§1t5458s0§.gotoAndStop(_loc5_ + 1);
            if(_loc6_ >= 1 && _loc6_ <= 4)
            {
               this.building1.gotoAndStop(_loc6_ + 1);
               this.building2.gotoAndStop(_loc6_ + 1);
               this.building3.gotoAndStop(_loc6_ + 1);
               this.building4.gotoAndStop(_loc6_ + 1);
            }
            else
            {
               this.building1.building.color.transform.colorTransform = _loc8_;
               this.building2.building.color.transform.colorTransform = _loc8_;
               this.building3.building.color.transform.colorTransform = _loc8_;
               this.building4.building.color.transform.colorTransform = _loc8_;
            }
         }
         else if(_loc4_ == 6)
         {
            gotoAndStop(13);
         }
         if(!_loc7_)
         {
            this.door.visible = false;
         }
         this.§1t8126s0§(currentFrame,_loc7_);
      }
      
      internal function §1t8126s0§(param1:int, param2:Boolean) : *
      {
         if(param1 == 1)
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
         else if(param1 == 2)
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
         else if(param1 == 3)
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
         else if(param1 == 4)
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
         else if(param1 == 10)
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
            if(param2)
            {
               this.building5.visible = false;
            }
            else
            {
               this.farLayer.push(this.building5);
               §1t1643s0§.blur(this.building5,4);
            }
         }
         else if(param1 == 11)
         {
            this.ppLayer.push(this.pp_1);
            this.ppLayer.push(this.pp_2);
            this.ppLayer.push(this.pp_3);
            this.ppLayer.push(this.pp_4);
            this.ppLayer.push(this.gate);
            this.ppLayer.push(this.door);
            this.ppLayer.push(this.§1t5458s0§);
            this.farLayer.push(this.building1);
            this.farLayer.push(this.building2);
            this.farLayer.push(this.building3);
            this.farLayer.push(this.building4);
            if(param2)
            {
               this.building5.visible = false;
            }
            else
            {
               this.farLayer.push(this.building5);
               §1t1643s0§.blur(this.building5,4);
            }
         }
         else if(param1 == 12)
         {
            this.ppLayer.push(this.pp_1);
            this.ppLayer.push(this.pp_2);
            this.ppLayer.push(this.pp_3);
            this.ppLayer.push(this.pp_4);
            this.ppLayer.push(this.gate);
            this.ppLayer.push(this.door);
            this.ppLayer.push(this.§1t5458s0§);
            this.farLayer.push(this.building1);
            this.farLayer.push(this.building2);
            this.farLayer.push(this.building3);
            this.farLayer.push(this.building4);
            if(param2)
            {
               this.building5.visible = false;
            }
            else
            {
               this.farLayer.push(this.building5);
               §1t1643s0§.blur(this.building5,4);
            }
            this.farthestLayer.push(this.ff_1);
            §1t1643s0§.blur(this.ff_1,4);
         }
         else if(param1 == 13)
         {
            this.ppLayer.push(this.pp_1);
            this.ppLayer.push(this.pp_2);
            this.ppLayer.push(this.gate);
            this.ppLayer.push(this.door);
            if(param2)
            {
               this.f_1.visible = false;
               this.f_2.visible = false;
            }
            else
            {
               this.farLayer.push(this.f_1);
               this.farLayer.push(this.f_2);
               §1t1643s0§.blur(this.f_1,4);
               §1t1643s0§.blur(this.f_2,8);
            }
         }
         var _loc3_:int = int(this.ppLayer.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            this.ppLayer[_loc4_].cacheAsBitmap = true;
            _loc4_++;
         }
         _loc3_ = int(this.farLayer.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.farLayer[_loc4_].cacheAsBitmap = true;
            if(param1 <= 4 || param1 == 10)
            {
               this.farLayer[_loc4_].x -= 80;
            }
            else if(param1 == 11 || param1 == 12)
            {
               this.farLayer[_loc4_].x -= 100;
            }
            _loc4_++;
         }
         if(param1 <= 4 || param1 == 10 || param1 == 11 || param1 == 12)
         {
            this.ppScrollMod = 0.8;
         }
         _loc3_ = int(this.farthestLayer.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.farthestLayer[_loc4_].cacheAsBitmap = true;
            _loc4_++;
         }
      }
      
      override public function §1t2289s0§(param1:int) : *
      {
         var _loc2_:int = int(this.ppLayer.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.ppLayer[_loc3_].x += param1;
            _loc3_++;
         }
         _loc2_ = int(this.farLayer.length);
         if(this.ppScrollMod != 1)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               this.farLayer[_loc3_].x += param1 * this.ppScrollMod;
               _loc3_++;
            }
         }
         else
         {
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               this.farLayer[_loc3_].x += param1;
               _loc3_++;
            }
         }
         _loc2_ = int(this.farthestLayer.length);
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            this.farthestLayer[_loc3_].x += param1 / 2;
            _loc3_++;
         }
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

