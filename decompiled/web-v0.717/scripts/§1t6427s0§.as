package
{
   import flash.display.MovieClip;
   import flash.display.Stage;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol167")]
   public class §1t6427s0§ extends MovieClip
   {
      
      public static var §1t9911s0§:int;
      
      public static var §1t12464s0§:Boolean;
      
      public static var map:§1t8165s0§;
      
      public static var §1t9549s0§:§1t406s0§;
      
      private static var §1t12465s0§:int;
      
      private static var §1t12466s0§:int;
      
      public static var §1t12467s0§:Boolean = false;
      
      public function §1t6427s0§(param1:Stage)
      {
         super();
         §1t9549s0§ = §1t406s0§.§1t9190s0§();
         §1t9549s0§.§1t6612s0§();
         param1.addChild(§1t9549s0§);
         §1t9549s0§.visible = true;
         §1t9911s0§ = §1t1523s0§.§1t2218s0§();
         §1t1523s0§.§1t7363s0§();
         §1t9549s0§.§1t6578s0§();
         §1t9549s0§.§1t6496s0§.§1t6849s0§(§1t6497s0§.§1t9995s0§);
         §1t12464s0§ = true;
      }
      
      public static function §1t9954s0§() : *
      {
         var _loc1_:int = §1t1523s0§.getLevel();
         §1t9549s0§.§1t6488s0§.show();
         var _loc2_:* = §1t1523s0§.getLevel();
         if(_loc1_ < _loc2_)
         {
            §1t9955s0§(_loc2_ - _loc1_);
         }
         §1t9549s0§.§1t6578s0§();
      }
      
      public static function §1t9916s0§(param1:int) : *
      {
         §1t9911s0§ = param1;
      }
      
      public static function §1t9935s0§() : int
      {
         return §1t9911s0§;
      }
      
      public static function §1t9955s0§(param1:int) : *
      {
         var _loc2_:* = undefined;
         _loc2_ = §1t1523s0§.getLevel();
         var _loc3_:int = §1t1523s0§.§1t5928s0§(_loc2_) - §1t1523s0§.§1t912s0§();
         §1t9549s0§.§1t6490s0§.show(_loc2_,_loc3_,param1);
         §1t9549s0§.§1t6490s0§.§1t6086s0§(§1t9549s0§.§1t6488s0§);
         §1t9549s0§.§1t6488s0§.visible = false;
         §1t9549s0§.§1t6642s0§(_loc2_);
      }
      
      public static function update() : *
      {
         map.update();
      }
      
      public static function §1t12468s0§(param1:int) : *
      {
         var _loc4_:§1t107s0§ = null;
         var _loc8_:int = 0;
         var _loc9_:§1t107s0§ = null;
         §1t9911s0§ = param1;
         §1t9549s0§.§1t6574s0§().visible = false;
         §1t9549s0§.§1t6574s0§().§1t6385s0§();
         var _loc2_:§1t72s0§ = §1t1524s0§.§1t9886s0§(§1t9911s0§);
         var _loc3_:Vector.<§1t107s0§> = §1t1524s0§.§1t9867s0§();
         var _loc5_:int = int(_loc3_.length);
         var _loc6_:Boolean = false;
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_)
         {
            if(§1t1540s0§.§1t9982s0§ == §1t1540s0§.§1t9986s0§ && _loc3_[_loc7_].auto > 0)
            {
               _loc6_ = true;
               _loc4_ = _loc3_[_loc7_];
               §1t12475s0§(_loc4_.id,_loc4_.§1t1103s0§);
               return;
            }
            _loc7_++;
         }
         if(_loc6_ == false)
         {
            if(_loc2_.§1t1184s0§())
            {
               §1t9549s0§.§1t6574s0§().§1t6387s0§(§1t407s0§.§1t12441s0§,true);
            }
            §1t9549s0§.§1t6574s0§().§1t6393s0§(_loc2_.type,_loc2_.§1t1153s0§(),true);
            _loc8_ = int(_loc3_.length);
            _loc7_ = 0;
            while(_loc7_ < _loc8_)
            {
               _loc9_ = _loc3_[_loc7_];
               if(_loc9_.§1t1104s0§ != "" && _loc9_.type != §1t1711s0§.§1t11266s0§)
               {
                  if(_loc9_.§1t1111s0§() != null)
                  {
                     §1t9549s0§.§1t6574s0§().§1t6391s0§(_loc9_.title,_loc9_.§1t1104s0§,_loc9_.type,_loc9_.id,_loc9_.§1t1103s0§,_loc9_.ap);
                  }
                  else
                  {
                     §1t9549s0§.§1t6574s0§().§1t6389s0§(_loc9_.title,_loc9_.§1t1104s0§,_loc9_.type,_loc9_.id,_loc9_.§1t1103s0§,_loc9_.ap);
                  }
               }
               if(§1t9549s0§.§1t6574s0§().§1t6386s0§() == 7)
               {
                  break;
               }
               _loc7_++;
            }
            §1t9549s0§.§1t6574s0§().visible = true;
         }
      }
      
      public static function §1t12469s0§(param1:int, param2:Boolean) : void
      {
         var _loc6_:§1t107s0§ = null;
         §1t9911s0§ = param1;
         §1t9549s0§.§1t6574s0§().visible = false;
         var _loc3_:§1t72s0§ = §1t1524s0§.§1t9886s0§(§1t9911s0§);
         var _loc4_:Vector.<§1t107s0§> = §1t1524s0§.§1t9869s0§(§1t9911s0§,_loc3_.map);
         §1t9549s0§.§1t6574s0§().§1t6385s0§();
         if(param2)
         {
            §1t9549s0§.§1t6574s0§().§1t6387s0§(§1t407s0§.§1t12439s0§,true);
         }
         §1t9549s0§.§1t6574s0§().§1t6393s0§(_loc3_.type,_loc3_.§1t1153s0§(),false);
         var _loc5_:int = int(_loc4_.length);
         var _loc7_:Vector.<§1t107s0§> = new Vector.<§1t107s0§>();
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         while(_loc9_ < _loc5_)
         {
            _loc6_ = _loc4_[_loc9_];
            if(_loc6_.§1t1104s0§ != "" && _loc6_.§1t1103s0§ == 0)
            {
               _loc8_++;
            }
            else if(_loc6_.§1t1104s0§ != "")
            {
               §1t9549s0§.§1t6574s0§().§1t6391s0§(_loc6_.title,_loc6_.§1t1104s0§,_loc6_.type,_loc6_.id,_loc6_.§1t1103s0§,_loc6_.ap);
            }
            if(§1t9549s0§.§1t6574s0§().§1t6386s0§() == 7)
            {
               break;
            }
            _loc9_++;
         }
         if(_loc8_ > 0)
         {
            §1t9549s0§.§1t6574s0§().§1t6391s0§("",§1t1521s0§.getString(194),0,0,0,0);
         }
         §1t9549s0§.§1t6574s0§().visible = true;
      }
      
      public static function §1t12470s0§(param1:int, param2:int) : Vector.<int>
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Boolean = false;
         var _loc7_:int = 0;
         var _loc3_:Vector.<int> = new Vector.<int>();
         if(param1 > param2)
         {
            param1 = param2;
         }
         while(_loc3_.length < param1)
         {
            _loc4_ = Math.random() * param2;
            _loc7_ = int(_loc3_.length);
            _loc6_ = false;
            _loc5_ = 0;
            while(_loc5_ < _loc7_ && !_loc6_)
            {
               if(_loc3_[_loc5_] == _loc4_)
               {
                  _loc6_ = true;
               }
               _loc5_++;
            }
            if(!_loc6_)
            {
               _loc3_.push(_loc4_);
            }
         }
         return _loc3_;
      }
      
      public static function §1t6575s0§() : *
      {
         §1t9549s0§.§1t6574s0§().visible = true;
      }
      
      public static function §1t12471s0§() : *
      {
         §1t9549s0§.visible = true;
      }
      
      public static function §1t12472s0§() : *
      {
         §1t9549s0§.§1t6565s0§(null);
      }
      
      public static function §1t12473s0§(param1:Boolean) : *
      {
      }
      
      public static function §1t8196s0§(param1:Boolean) : *
      {
         if(map != null)
         {
            map.§1t8196s0§(param1);
         }
      }
      
      public static function §1t12474s0§(param1:int) : *
      {
         §1t12465s0§ = param1;
      }
      
      public static function refreshMap() : *
      {
         map.refreshMap();
      }
      
      public static function §1t12475s0§(param1:int, param2:int) : *
      {
         if(§1t1523s0§.§1t641s0§(param1))
         {
            return;
         }
         §1t406s0§.instance.§1t6631s0§(0,0,"");
         §1t6495s0§.instance.§1t1023s0§(0);
         §1t12465s0§ = param1;
         §1t12466s0§ = param2;
         §1t9549s0§.§1t6574s0§().visible = false;
         §1t126s0§.§1t9190s0§().§1t1690s0§(§1t1524s0§.§1t9872s0§(§1t12465s0§,§1t12466s0§).intro);
      }
      
      public static function §1t12476s0§() : *
      {
         var _loc1_:§1t85s0§ = null;
         if(§1t12465s0§ != -1)
         {
            if(§1t12465s0§ != §1t123s0§.§1t11212s0§ && §1t1524s0§.§1t9871s0§(§1t12465s0§).type != §1t1711s0§.§1t11266s0§ && §1t1523s0§.§1t9566s0§(§1t12465s0§) == false)
            {
               §1t406s0§.instance.§1t6527s0§(§1t1521s0§.getString(195),§1t1521s0§.getString(5));
            }
            else
            {
               _loc1_ = §1t1524s0§.§1t9872s0§(§1t12465s0§,§1t12466s0§);
               if(_loc1_.action > 0 && _loc1_.wave.length > 0)
               {
                  §1t1524s0§.§1t9894s0§(_loc1_,§1t12465s0§);
               }
               else
               {
                  §1t12477s0§();
               }
            }
         }
      }
      
      public static function §1t12477s0§() : *
      {
         if(§1t12465s0§ == §1t123s0§.§1t11211s0§)
         {
            §1t12478s0§();
         }
         else
         {
            §1t126s0§.§1t9190s0§().§1t1691s0§(§1t1524s0§.§1t9872s0§(§1t12465s0§,§1t12466s0§).ending);
         }
      }
      
      public static function §1t12478s0§() : *
      {
         var _loc3_:§1t77s0§ = null;
         var _loc4_:int = 0;
         var _loc5_:§1t63s0§ = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:§1t17s0§ = null;
         var _loc10_:int = 0;
         var _loc1_:Boolean = false;
         if(§1t12465s0§ == §1t123s0§.§1t11212s0§)
         {
            _loc1_ = §1t1523s0§.§1t9570s0§(§1t123s0§.instance.§1t1563s0§,§1t123s0§.instance.§1t1564s0§,§1t123s0§.instance.§1t1565s0§,§1t123s0§.instance.§1t1566s0§,§1t123s0§.instance.§1t1567s0§);
         }
         else if(§1t12465s0§ != §1t123s0§.§1t11211s0§ && §1t1524s0§.§1t9871s0§(§1t12465s0§).type != §1t1711s0§.§1t11266s0§)
         {
            _loc1_ = §1t1523s0§.§1t9572s0§(§1t12465s0§);
            §1t1524s0§.§1t9868s0§(§1t12465s0§,§1t12466s0§);
            §1t1524s0§.§1t9866s0§(§1t1525s0§.§1t9935s0§());
         }
         if(§1t1540s0§.§1t10014s0§())
         {
            §1t12468s0§(§1t1523s0§.§1t2218s0§());
            map.showConnected();
         }
         else if(§1t1540s0§.§1t9550s0§())
         {
            §1t1525s0§.§1t8143s0§(§1t1523s0§.§1t9586s0§().§1t1559s0§());
            §1t402s0§.instance.§1t6343s0§(§1t1525s0§.§1t9935s0§(),§1t1525s0§.§1t7341s0§(),§1t1525s0§.roomData);
         }
         var _loc2_:int = 0;
         if(§1t12465s0§ != §1t123s0§.§1t11211s0§)
         {
            _loc3_ = §1t1524s0§.§1t9872s0§(§1t12465s0§,§1t12466s0§).§1t992s0§();
            if(_loc3_ != null && !_loc3_.forShow)
            {
               §1t9549s0§.§1t6488s0§.§1t6201s0§(_loc3_.§1t833s0§());
               _loc2_ = int(_loc3_.loot.length);
               _loc4_ = §1t1525s0§.§1t9936s0§();
               _loc10_ = 0;
               while(_loc10_ < _loc2_)
               {
                  _loc5_ = _loc3_.loot[_loc10_];
                  _loc6_ = _loc5_.chance * 100;
                  _loc8_ = _loc5_.getQty();
                  if(_loc5_.§1t1411s0§() == "")
                  {
                     _loc9_ = null;
                     _loc7_ = _loc5_.§1t760s0§();
                  }
                  else
                  {
                     _loc9_ = §1t17s0§.§1t8745s0§(_loc5_.§1t1411s0§());
                     _loc9_.§1t485s0§(_loc8_);
                  }
                  if(_loc6_ == 100 || Math.random() * 100 < _loc6_)
                  {
                     if(_loc9_ != null)
                     {
                        if(_loc8_ > 0)
                        {
                           §1t9549s0§.§1t6488s0§.§1t6185s0§(_loc9_);
                        }
                        else if(_loc8_ < 0)
                        {
                           §1t1523s0§.§1t7692s0§(_loc9_);
                        }
                     }
                     else if(_loc7_ == 0 || _loc7_ == 11)
                     {
                        §1t9549s0§.§1t6488s0§.§1t5846s0§(_loc8_);
                     }
                     else if(_loc7_ == 1)
                     {
                        §1t9549s0§.§1t6488s0§.§1t5846s0§(5 * _loc8_);
                     }
                     else if(_loc7_ == 50007)
                     {
                        §1t1523s0§.§1t9713s0§(50007,_loc8_);
                     }
                     else if(§1t1523s0§.§1t9623s0§(_loc7_))
                     {
                        if(_loc8_ > 0)
                        {
                           §1t9549s0§.§1t6488s0§.§1t5845s0§(_loc7_,_loc4_,_loc8_);
                        }
                        else if(_loc8_ < 0)
                        {
                           §1t1523s0§.§1t9713s0§(_loc7_,_loc8_);
                        }
                     }
                  }
                  _loc10_++;
               }
            }
         }
         if(§1t12467s0§)
         {
            §1t12467s0§ = false;
            §1t406s0§.instance.§1t6488s0§.§1t5826s0§();
            §1t406s0§.instance.§1t6496s0§.§1t6850s0§(§1t6497s0§.§1t12490s0§);
            §1t406s0§.instance.§1t6456s0§.setNodeId(§1t9911s0§);
         }
         else if(_loc1_ && §1t1524s0§.§1t9871s0§(§1t12465s0§).§1t1450s0§)
         {
            §1t9549s0§.§1t6536s0§(§1t12465s0§);
         }
         §1t12465s0§ = -1;
         §1t3317s0§.instance.§1t1946s0§();
         if(!§1t12467s0§)
         {
            §1t9954s0§();
            §1t9549s0§.§1t6489s0§.show();
         }
      }
      
      public static function §1t12479s0§() : *
      {
         §1t1524s0§.§1t9896s0§(§1t9911s0§,false);
      }
      
      public function destroy() : *
      {
         §1t406s0§.instance = null;
      }
   }
}

