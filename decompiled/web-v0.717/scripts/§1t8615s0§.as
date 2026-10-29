package
{
   import flash.display.MovieClip;
   import flash.geom.ColorTransform;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2978")]
   public class §1t8615s0§ extends §1t399s0§
   {
      
      public static var §1t11506s0§:int = 0;
      
      public static var §1t12629s0§:int = 1;
      
      public static var §1t12630s0§:int = 2;
      
      public static var §1t12631s0§:int = 3;
      
      public static var §1t12632s0§:int = 4;
      
      public static var §1t12633s0§:int = 5;
      
      public static var §1t12634s0§:int = 6;
      
      public static var §1t12635s0§:int = 7;
      
      public static var §1t12636s0§:int = 8;
      
      public static var §1t12637s0§:int = 9;
      
      public static var §1t12638s0§:int = 10;
      
      public static var §1t12639s0§:int = 11;
      
      public static var §1t12640s0§:int = 12;
      
      public static var §1t12641s0§:int = 13;
      
      public static var §1t12642s0§:int = 14;
      
      public static var §1t12643s0§:int = 15;
      
      public static var §1t12644s0§:int = 16;
      
      public static var §1t12645s0§:int = §1t12632s0§ + 1000;
      
      public static var §1t12646s0§:int = §1t12633s0§ + 1000;
      
      public static var §1t12647s0§:int = §1t12634s0§ + 1000;
      
      public static var §1t12648s0§:int = §1t12635s0§ + 1000;
      
      public static var §1t12649s0§:int = §1t12636s0§ + 1000;
      
      public static var §1t12650s0§:int = §1t12637s0§ + 1000;
      
      public static var §1t12651s0§:int = §1t12638s0§ + 1000;
      
      public static var §1t12652s0§:int = §1t12639s0§ + 1000;
      
      public static var §1t12653s0§:int = §1t12640s0§ + 1000;
      
      public static var §1t12654s0§:int = §1t12641s0§ + 1000;
      
      public static var §1t12655s0§:int = 17;
      
      public static var §1t12656s0§:int = 18;
      
      public static var §1t12657s0§:int = 19;
      
      public static var §1t12658s0§:int = 20;
      
      public static var §1t12659s0§:int = 21;
      
      public static var §1t12660s0§:int = 22;
      
      public static var §1t12661s0§:int = 23;
      
      public static var §1t12662s0§:int = 24;
      
      public static var §1t12663s0§:int = 25;
      
      public static var §1t12664s0§:int = 26;
      
      public static var §1t12665s0§:int = 27;
      
      public static var §1t12666s0§:int = 28;
      
      public static var §1t12667s0§:int = 29;
      
      public static var §1t12668s0§:int = 30;
      
      public static var §1t12669s0§:int = 31;
      
      public static var §1t12670s0§:int = 32;
      
      public static var §1t12671s0§:int = 33;
      
      public static var §1t12672s0§:int = 34;
      
      public static var §1t12673s0§:int = 35;
      
      public static var §1t12674s0§:int = 36;
      
      public static var §1t12675s0§:int = 37;
      
      public var building:MovieClip;
      
      public var building2:MovieClip;
      
      public var building3:MovieClip;
      
      public var building4:MovieClip;
      
      public var ff_1:MovieClip;
      
      public var hotspot:RedBG;
      
      internal var buildingType:int = 0;
      
      public function §1t8615s0§(param1:String, param2:String = "")
      {
         var _loc5_:ColorTransform = null;
         super();
         this.props = param1;
         if(param2 == "")
         {
            objectName = "building";
         }
         else
         {
            objectName = param2;
         }
         var _loc3_:Array = param1.split(",");
         this.buildingType = int(_loc3_[0]);
         var _loc4_:uint = uint(_loc3_[1]);
         if(_loc4_ == 1)
         {
            if(this.buildingType == §1t12629s0§)
            {
               this.buildingType = §1t12663s0§;
            }
            else if(this.buildingType == §1t12630s0§)
            {
               this.buildingType = §1t12655s0§;
            }
            else if(this.buildingType == §1t12631s0§)
            {
               this.buildingType = §1t12656s0§;
            }
            else if(this.buildingType == §1t12643s0§ || this.buildingType == §1t12644s0§)
            {
               this.buildingType = §1t12666s0§;
            }
            else if(this.buildingType == §1t12642s0§)
            {
               this.buildingType = §1t12670s0§;
            }
         }
         else if(_loc4_ == 2)
         {
            if(this.buildingType == §1t12629s0§)
            {
               this.buildingType = §1t12664s0§;
            }
            else if(this.buildingType == §1t12630s0§)
            {
               this.buildingType = §1t12657s0§;
            }
            else if(this.buildingType == §1t12631s0§)
            {
               this.buildingType = §1t12658s0§;
            }
            else if(this.buildingType == §1t12643s0§ || this.buildingType == §1t12644s0§)
            {
               this.buildingType = §1t12667s0§;
            }
            else if(this.buildingType == §1t12642s0§)
            {
               this.buildingType = §1t12671s0§;
            }
         }
         else if(_loc4_ == 3)
         {
            if(this.buildingType == §1t12629s0§)
            {
               this.buildingType = §1t12665s0§;
            }
            else if(this.buildingType == §1t12630s0§)
            {
               this.buildingType = §1t12659s0§;
            }
            else if(this.buildingType == §1t12631s0§)
            {
               this.buildingType = §1t12660s0§;
            }
            else if(this.buildingType == §1t12643s0§ || this.buildingType == §1t12644s0§)
            {
               this.buildingType = §1t12668s0§;
            }
            else if(this.buildingType == §1t12642s0§)
            {
               this.buildingType = §1t12672s0§;
            }
         }
         else if(_loc4_ == 4)
         {
            if(this.buildingType == §1t12630s0§)
            {
               this.buildingType = §1t12661s0§;
            }
            else if(this.buildingType == §1t12631s0§)
            {
               this.buildingType = §1t12662s0§;
            }
            else if(this.buildingType == §1t12643s0§ || this.buildingType == §1t12644s0§)
            {
               this.buildingType = §1t12669s0§;
            }
            else if(this.buildingType == §1t12642s0§)
            {
               this.buildingType = §1t12673s0§;
            }
         }
         if(this.buildingType == §1t12639s0§ && §1t1523s0§.§1t9761s0§())
         {
            this.buildingType = §1t12674s0§;
         }
         gotoAndStop(this.buildingType);
         this.hotspot.visible = false;
         this.hotspot.buttonMode = true;
         switch(this.buildingType)
         {
            case §1t12629s0§:
            case §1t12655s0§:
            case §1t12656s0§:
            case §1t12657s0§:
            case §1t12658s0§:
            case §1t12659s0§:
            case §1t12660s0§:
            case §1t12661s0§:
            case §1t12662s0§:
            case §1t12663s0§:
            case §1t12664s0§:
            case §1t12665s0§:
            case §1t12666s0§:
            case §1t12667s0§:
            case §1t12668s0§:
            case §1t12669s0§:
               §1t8503s0§ = §1t407s0§.§1t12443s0§;
               §1t8501s0§ = false;
               break;
            case §1t12630s0§:
            case §1t12631s0§:
            case §1t12643s0§:
            case §1t12644s0§:
               _loc5_ = new ColorTransform();
               _loc5_.color = _loc4_;
               this.building.color.transform.colorTransform = _loc5_;
               §1t8503s0§ = §1t407s0§.§1t12443s0§;
               §1t8501s0§ = false;
               break;
            case §1t12642s0§:
               _loc5_ = new ColorTransform();
               _loc5_.color = _loc4_;
               this.building.color.transform.colorTransform = _loc5_;
               this.building2.color.transform.colorTransform = _loc5_;
               this.building3.color.transform.colorTransform = _loc5_;
               this.building4.color.transform.colorTransform = _loc5_;
               §1t8503s0§ = §1t407s0§.§1t12443s0§;
               §1t8501s0§ = false;
               break;
            case §1t12670s0§:
            case §1t12671s0§:
            case §1t12672s0§:
            case §1t12673s0§:
               §1t8503s0§ = §1t407s0§.§1t12443s0§;
               §1t8501s0§ = false;
               break;
            case §1t12639s0§:
            case §1t12674s0§:
               §1t8503s0§ = §1t407s0§.§1t12443s0§;
               §1t8501s0§ = true;
               break;
            case §1t12632s0§:
               §1t8503s0§ = §1t407s0§.§1t12443s0§;
               §1t8501s0§ = true;
               break;
            case §1t12635s0§:
               §1t8503s0§ = §1t407s0§.§1t12443s0§;
               §1t8501s0§ = true;
               break;
            case §1t12636s0§:
               §1t8503s0§ = §1t407s0§.§1t12439s0§;
               §1t8501s0§ = true;
               break;
            case §1t12634s0§:
               §1t8503s0§ = §1t407s0§.§1t12443s0§;
               §1t8501s0§ = true;
               break;
            case §1t12633s0§:
               §1t8503s0§ = §1t407s0§.§1t12439s0§;
               §1t8501s0§ = true;
               break;
            case §1t12637s0§:
               §1t8503s0§ = §1t407s0§.§1t12443s0§;
               §1t8501s0§ = true;
               break;
            case §1t12638s0§:
               §1t8503s0§ = §1t407s0§.§1t12443s0§;
               §1t8501s0§ = true;
               break;
            case §1t12640s0§:
            case §1t12675s0§:
               §1t8503s0§ = §1t407s0§.§1t12443s0§;
               §1t8501s0§ = true;
               break;
            case §1t12641s0§:
               §1t8503s0§ = §1t407s0§.§1t12443s0§;
               §1t8501s0§ = true;
         }
         buttonMode = §1t8501s0§;
         cacheAsBitmap = true;
      }
      
      public static function §1t12676s0§(param1:int) : int
      {
         switch(param1)
         {
            case §1t12629s0§:
            case §1t12630s0§:
            case §1t12631s0§:
            case §1t12636s0§:
            case §1t12637s0§:
            case §1t12638s0§:
            case §1t12639s0§:
            case §1t12640s0§:
            case §1t12642s0§:
            case §1t12675s0§:
               return 1;
            case §1t12632s0§:
            case §1t12633s0§:
            case §1t12634s0§:
            case §1t12635s0§:
            case §1t12641s0§:
            case §1t12643s0§:
            case §1t12644s0§:
               return 2;
            case §1t12655s0§:
            case §1t12656s0§:
            case §1t12657s0§:
            case §1t12658s0§:
            case §1t12659s0§:
            case §1t12660s0§:
            case §1t12661s0§:
            case §1t12662s0§:
            case §1t12663s0§:
            case §1t12664s0§:
            case §1t12665s0§:
            case §1t12670s0§:
            case §1t12671s0§:
            case §1t12672s0§:
            case §1t12673s0§:
               return 1;
            case §1t12666s0§:
            case §1t12667s0§:
            case §1t12668s0§:
            case §1t12669s0§:
               return 2;
            default:
               return 0;
         }
      }
      
      public static function §1t12677s0§() : Array
      {
         return [§1t12639s0§,§1t12632s0§,§1t12640s0§];
      }
      
      public static function §1t12678s0§() : Array
      {
         return [§1t12636s0§,§1t12638s0§,§1t12635s0§,§1t12641s0§];
      }
      
      public static function §1t12679s0§() : Array
      {
         return [§1t12633s0§,§1t12637s0§,§1t12634s0§];
      }
      
      override public function §1t8523s0§() : *
      {
         var _loc1_:§1t85s0§ = null;
         if(§1t8502s0§ != null)
         {
            _loc1_ = §1t1524s0§.§1t9872s0§(§1t8502s0§.id,§1t8502s0§.§1t1103s0§);
            if(§1t1523s0§.§1t640s0§(_loc1_.condition))
            {
               if(§1t1523s0§.§1t9606s0§(_loc1_.ap))
               {
                  §1t6427s0§.§1t12475s0§(§1t8502s0§.id,§1t8502s0§.§1t1103s0§);
               }
               else
               {
                  §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(100),§1t1521s0§.getString(5));
               }
            }
            else
            {
               §1t406s0§.instance.§1t6527s0§(_loc1_.failtext,§1t1521s0§.getString(5));
            }
            return;
         }
         if(§1t8503s0§ == §1t407s0§.§1t12439s0§)
         {
            §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6851s0§(this);
            §1t406s0§.§1t9190s0§().§1t6496s0§.§1t6848s0§(§1t6497s0§.§1t12442s0§);
         }
         else
         {
            this.interact();
         }
      }
      
      override public function interact() : *
      {
         var _loc1_:§1t69s0§ = null;
         switch(this.buildingType)
         {
            case §1t12639s0§:
            case §1t12674s0§:
               §1t406s0§.instance.§1t5947s0§.show(§1t401s0§.§1t12349s0§);
               break;
            case §1t12632s0§:
               §1t406s0§.instance.§1t5947s0§.show(§1t401s0§.§1t12350s0§);
               break;
            case §1t12635s0§:
               §1t406s0§.instance.§1t5947s0§.show(§1t401s0§.§1t12352s0§);
               break;
            case §1t12636s0§:
               §1t1525s0§.§1t9922s0§(100,50);
               break;
            case §1t12634s0§:
               §1t406s0§.instance.§1t5947s0§.show(§1t401s0§.§1t12357s0§);
               break;
            case §1t12633s0§:
               §1t1525s0§.§1t9922s0§(110,50);
               break;
            case §1t12637s0§:
               §1t406s0§.instance.§1t5947s0§.show(§1t401s0§.§1t12356s0§);
               break;
            case §1t12638s0§:
               §1t406s0§.instance.§1t5947s0§.show(§1t401s0§.§1t12353s0§);
               break;
            case §1t12640s0§:
               _loc1_ = §1t123s0§.instance.§1t1604s0§(§1t1525s0§.§1t9935s0§(),§1t1525s0§.§1t7341s0§(),§1t123s0§.§1t11210s0§,§1t3317s0§.instance.§1t1848s0§(),§1t1799s0§.§1t11448s0§);
               §1t1524s0§.§1t9873s0§(_loc1_);
               if(§1t1523s0§.§1t9606s0§(_loc1_.§1t1452s0§[0].ap))
               {
                  §1t6427s0§.§1t12475s0§(§1t123s0§.§1t11212s0§,0);
               }
               else
               {
                  §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(100),§1t1521s0§.getString(5));
               }
               break;
            case §1t12641s0§:
               §1t406s0§.instance.§1t5947s0§.show(§1t401s0§.§1t12362s0§);
               break;
            case §1t12675s0§:
               §1t406s0§.instance.§1t5947s0§.show(§1t401s0§.§1t12363s0§);
         }
      }
      
      override public function §1t6733s0§() : String
      {
         switch(this.buildingType)
         {
            case §1t12629s0§:
            case §1t12663s0§:
            case §1t12664s0§:
            case §1t12665s0§:
               return §1t1521s0§.getString(731);
            case §1t12630s0§:
            case §1t12631s0§:
            case §1t12643s0§:
            case §1t12644s0§:
            case §1t12655s0§:
            case §1t12656s0§:
            case §1t12657s0§:
            case §1t12658s0§:
            case §1t12659s0§:
            case §1t12660s0§:
            case §1t12661s0§:
            case §1t12662s0§:
            case §1t12666s0§:
            case §1t12667s0§:
            case §1t12668s0§:
            case §1t12669s0§:
               return §1t1521s0§.getString(731);
            case §1t12642s0§:
            case §1t12670s0§:
            case §1t12671s0§:
            case §1t12672s0§:
            case §1t12673s0§:
               return §1t1521s0§.getString(732);
            case §1t12639s0§:
            case §1t12674s0§:
               return §1t1521s0§.getString(733);
            case §1t12632s0§:
               return §1t1521s0§.getString(734);
            case §1t12635s0§:
               return §1t1521s0§.getString(735);
            case §1t12636s0§:
               return §1t1521s0§.getString(736);
            case §1t12634s0§:
               return §1t1521s0§.getString(737);
            case §1t12633s0§:
               return §1t1521s0§.getString(738);
            case §1t12637s0§:
               return §1t1521s0§.getString(739);
            case §1t12638s0§:
               return §1t1521s0§.getString(740);
            case §1t12640s0§:
               return §1t1521s0§.getString(741);
            case §1t12641s0§:
               return §1t1521s0§.getString(742);
            case §1t12675s0§:
               return §1t1521s0§.getString(743);
            default:
               return "";
         }
      }
      
      override public function §1t8518s0§(param1:MovieClip) : Boolean
      {
         return abs(x - param1.x + (this.hotspot.x + this.hotspot.width / 2)) < 100;
      }
      
      override public function §1t8524s0§(param1:int, param2:int) : Boolean
      {
         return this.hotspot.hitTestPoint(param1,param2);
      }
      
      override public function §1t8525s0§() : Boolean
      {
         return true;
      }
   }
}

