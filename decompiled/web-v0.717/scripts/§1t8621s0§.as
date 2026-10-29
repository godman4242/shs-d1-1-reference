package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2846")]
   public class §1t8621s0§ extends §1t399s0§
   {
      
      public var harvestArrow:§1t5038s0§;
      
      public var vege0:§1t131s0§;
      
      public var vege1:§1t131s0§;
      
      public var vege2:§1t131s0§;
      
      public var vege3:§1t131s0§;
      
      public var vege4:§1t131s0§;
      
      public var vege5:§1t131s0§;
      
      public var vege6:§1t131s0§;
      
      public var vege7:§1t131s0§;
      
      public var vege8:§1t131s0§;
      
      public var vege9:§1t131s0§;
      
      internal var §1t4567s0§:Array = new Array();
      
      internal var counter:int = 1;
      
      public function §1t8621s0§(param1:String, param2:String = "")
      {
         super();
         this.props = param1;
         if(param2 == "")
         {
            objectName = "Vegetable Patch";
         }
         else
         {
            objectName = param2;
         }
         §1t8503s0§ = §1t407s0§.§1t12444s0§;
         this.§1t4567s0§.push(this.vege0);
         this.§1t4567s0§.push(this.vege1);
         this.§1t4567s0§.push(this.vege2);
         this.§1t4567s0§.push(this.vege3);
         this.§1t4567s0§.push(this.vege4);
         this.§1t4567s0§.push(this.vege5);
         this.§1t4567s0§.push(this.vege6);
         this.§1t4567s0§.push(this.vege7);
         this.§1t4567s0§.push(this.vege8);
         this.§1t4567s0§.push(this.vege9);
         var _loc3_:int = 0;
         while(_loc3_ < 10)
         {
            this.§1t4567s0§[_loc3_].gotoAndStop(int(Math.random() * 7 + 1));
            this.§1t4567s0§[_loc3_].rotation = Math.random() * 20 - 10;
            _loc3_++;
         }
         this.harvestArrow.visible = false;
         §1t1521s0§.§1t9290s0§(this.harvestArrow.arrow.arrowtext,true);
         this.harvestArrow.arrow.arrowtext.text = §1t1521s0§.getString(254);
         this.showVegState();
      }
      
      internal function showVegState() : *
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:Number = NaN;
         var _loc1_:int = int(props);
         var _loc2_:int = §1t1523s0§.§1t9714s0§(_loc1_);
         var _loc3_:int = §1t1523s0§.§1t9714s0§(_loc1_ + 1);
         var _loc4_:int = §1t1523s0§.§1t9714s0§(_loc1_ + 2);
         var _loc5_:int = §1t1523s0§.§1t9714s0§(_loc1_ + 3);
         var _loc8_:int = 15 * 60;
         var _loc9_:int = 0;
         var _loc10_:int = 1;
         var _loc11_:int = 2;
         var _loc12_:int = 3;
         switch(_loc2_)
         {
            case 0:
               _loc6_ = _loc9_;
               break;
            case 1:
               _loc7_ = 15 * 60;
               if(§1t3317s0§.instance.§1t1847s0§() - _loc3_ < _loc7_)
               {
                  _loc6_ = _loc10_;
               }
               else if(§1t3317s0§.instance.§1t1847s0§() - _loc3_ < _loc7_ + _loc8_)
               {
                  _loc6_ = _loc11_;
               }
               else
               {
                  _loc6_ = _loc12_;
               }
               break;
            case 2:
               _loc7_ = 60 * 60;
               if(§1t3317s0§.instance.§1t1847s0§() - _loc3_ < _loc7_)
               {
                  _loc6_ = _loc10_;
               }
               else if(§1t3317s0§.instance.§1t1847s0§() - _loc3_ < _loc7_ + _loc8_)
               {
                  _loc6_ = _loc11_;
               }
               else
               {
                  _loc6_ = _loc12_;
               }
               break;
            case 3:
               _loc7_ = 6 * 60 * 60;
               if(§1t3317s0§.instance.§1t1847s0§() - _loc3_ < _loc7_)
               {
                  _loc6_ = _loc10_;
               }
               else if(§1t3317s0§.instance.§1t1847s0§() - _loc3_ < _loc7_ + _loc8_)
               {
                  _loc6_ = _loc11_;
               }
               else
               {
                  _loc6_ = _loc12_;
               }
               break;
            case 4:
               _loc7_ = 12 * 60 * 60;
               if(§1t3317s0§.instance.§1t1847s0§() - _loc3_ < _loc7_)
               {
                  _loc6_ = _loc10_;
               }
               else
               {
                  _loc6_ = _loc11_;
               }
         }
         if(_loc6_ == _loc9_)
         {
            _loc13_ = 0;
            while(_loc13_ < 10)
            {
               this.§1t4567s0§[_loc13_].visible = false;
               _loc13_++;
            }
         }
         if(_loc6_ == _loc10_)
         {
            _loc14_ = (§1t3317s0§.instance.§1t1847s0§() - _loc3_) / _loc7_;
            if(_loc14_ > 1 || _loc14_ < 0)
            {
               _loc14_ = 1;
            }
            _loc13_ = 0;
            while(_loc13_ < 10)
            {
               this.§1t4567s0§[_loc13_].scaleX = _loc14_;
               this.§1t4567s0§[_loc13_].scaleY = _loc14_;
               _loc13_++;
            }
         }
         if(_loc6_ == _loc12_)
         {
            _loc13_ = 0;
            while(_loc13_ < 10)
            {
               §1t1643s0§.§1t11214s0§(this.§1t4567s0§[_loc13_],3088128);
               _loc13_++;
            }
         }
         if(_loc6_ == _loc11_)
         {
            this.harvestArrow.visible = true;
         }
         else
         {
            this.harvestArrow.visible = false;
         }
      }
      
      override public function interact() : *
      {
         §1t406s0§.instance.§1t5947s0§.show(§1t401s0§.§1t12351s0§,int(props));
      }
      
      override public function §1t6733s0§() : String
      {
         return §1t1521s0§.getString(255);
      }
      
      override public function §1t8518s0§(param1:MovieClip) : Boolean
      {
         --this.counter;
         if(this.counter <= 0)
         {
            this.counter = 24;
            this.showVegState();
         }
         return abs(x - param1.x) < 50;
      }
   }
}

