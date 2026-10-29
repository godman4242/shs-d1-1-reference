package
{
   public class §1t2300s0§
   {
      
      private static var mapVector:Vector.<§1t173s0§> = new Vector.<§1t173s0§>();
      
      private static var cloudsPool:Vector.<§1t173s0§> = new Vector.<§1t173s0§>();
      
      public function §1t2300s0§()
      {
         super();
      }
      
      public static function §1t9318s0§(param1:int) : §1t173s0§
      {
         var _loc4_:§1t173s0§ = null;
         var _loc5_:§1t173s0§ = null;
         var _loc6_:Vector.<§1t72s0§> = null;
         var _loc7_:§1t72s0§ = null;
         var _loc8_:Vector.<int> = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:§1t72s0§ = null;
         var _loc15_:§1t108s0§ = null;
         var _loc16_:§1t108s0§ = null;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc2_:int = int(mapVector.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(mapVector[_loc3_].mapID == param1)
            {
               _loc4_ = mapVector[_loc3_];
               mapVector.splice(_loc3_,1);
               return _loc4_;
            }
            _loc3_++;
         }
         if(param1 >= 0)
         {
            _loc5_ = new §1t173s0§(§1t1522s0§.§1t9318s0§(param1),param1);
            _loc5_.nodePath.graphics.lineStyle(2,0,100);
            _loc6_ = §1t1524s0§.§1t9884s0§(param1);
            _loc9_ = int(_loc6_.length);
            _loc10_ = §1t1523s0§.getLevel();
            if(_loc9_ > 0)
            {
               _loc11_ = _loc6_[0].id;
               _loc12_ = _loc6_[_loc9_ - 1].id;
               _loc3_ = 0;
               while(_loc3_ < _loc9_)
               {
                  _loc7_ = _loc6_[_loc3_];
                  _loc8_ = _loc7_.§1t1179s0§;
                  _loc13_ = int(_loc8_.length);
                  _loc15_ = §1t1524s0§.§1t9888s0§(param1);
                  _loc19_ = 0;
                  while(_loc19_ < _loc13_)
                  {
                     _loc14_ = §1t1524s0§.§1t9886s0§(_loc8_[_loc19_]);
                     if(_loc14_.level > _loc10_)
                     {
                        break;
                     }
                     _loc16_ = §1t1524s0§.§1t9888s0§(_loc14_.map);
                     _loc17_ = (_loc16_.x - _loc15_.x) * 400 + _loc14_.x;
                     _loc18_ = (_loc16_.y - _loc15_.y) * 400 + _loc14_.y;
                     if(_loc17_ > 400 || _loc17_ < 0)
                     {
                        if(_loc18_ > 400)
                        {
                           _loc20_ = _loc18_ - 400;
                           if(_loc17_ > 400)
                           {
                              _loc21_ = _loc17_ - 400;
                              if(_loc21_ < _loc20_)
                              {
                                 _loc18_ = (_loc18_ - _loc7_.y) * (400 - _loc7_.x) / (_loc17_ - _loc7_.x) + _loc7_.y;
                                 _loc17_ = 400;
                              }
                              else
                              {
                                 _loc17_ = (_loc17_ - _loc7_.x) * (400 - _loc7_.y) / (_loc18_ - _loc7_.y) + _loc7_.x;
                                 _loc18_ = 400;
                              }
                           }
                           else
                           {
                              _loc21_ = -_loc17_;
                              if(_loc21_ < _loc20_)
                              {
                                 _loc18_ = (_loc18_ - _loc7_.y) * -_loc7_.x / (_loc17_ - _loc7_.x) + _loc7_.y;
                                 _loc17_ = 0;
                              }
                              else
                              {
                                 _loc17_ = (_loc17_ - _loc7_.x) * -_loc7_.y / (_loc18_ - _loc7_.y) + _loc7_.x;
                                 _loc18_ = 0;
                              }
                           }
                        }
                        else if(_loc18_ < 0)
                        {
                           _loc20_ = -_loc18_;
                           if(_loc17_ > 400)
                           {
                              _loc21_ = _loc17_ - 400;
                              if(_loc21_ < _loc20_)
                              {
                                 _loc18_ = (_loc18_ - _loc7_.y) * (400 - _loc7_.x) / (_loc17_ - _loc7_.x) + _loc7_.y;
                                 _loc17_ = 400;
                              }
                              else
                              {
                                 _loc17_ = (_loc17_ - _loc7_.x) * (400 - _loc7_.y) / (_loc18_ - _loc7_.y) + _loc7_.x;
                                 _loc18_ = 400;
                              }
                           }
                           else
                           {
                              _loc21_ = -_loc17_;
                              if(_loc21_ < _loc20_)
                              {
                                 _loc18_ = (_loc18_ - _loc7_.y) * -_loc7_.x / (_loc17_ - _loc7_.x) + _loc7_.y;
                                 _loc17_ = 0;
                              }
                              else
                              {
                                 _loc17_ = (_loc17_ - _loc7_.x) * -_loc7_.y / (_loc18_ - _loc7_.y) + _loc7_.x;
                                 _loc18_ = 0;
                              }
                           }
                        }
                        else if(_loc17_ > 400)
                        {
                           _loc18_ = (_loc18_ - _loc7_.y) * (400 - _loc7_.x) / (_loc17_ - _loc7_.x) + _loc7_.y;
                           _loc17_ = 400;
                        }
                        else
                        {
                           _loc18_ = (_loc18_ - _loc7_.y) * -_loc7_.x / (_loc17_ - _loc7_.x) + _loc7_.y;
                           _loc17_ = 0;
                        }
                     }
                     else if(_loc18_ > 400)
                     {
                        _loc17_ = (_loc17_ - _loc7_.x) * (400 - _loc7_.y) / (_loc18_ - _loc7_.y) + _loc7_.x;
                        _loc18_ = 400;
                     }
                     else if(_loc18_ < 0)
                     {
                        _loc17_ = (_loc17_ - _loc7_.x) * -_loc7_.y / (_loc18_ - _loc7_.y) + _loc7_.x;
                        _loc18_ = 0;
                     }
                     _loc5_.nodePath.graphics.moveTo(_loc7_.x,_loc7_.y);
                     _loc5_.nodePath.graphics.lineTo(_loc17_,_loc18_);
                     _loc19_++;
                  }
                  _loc3_++;
               }
            }
            return _loc5_;
         }
         _loc2_ = int(cloudsPool.length);
         if(_loc2_ > 0)
         {
            return cloudsPool.pop();
         }
         return new §1t173s0§(§1t1522s0§.§1t9318s0§(-1),-1);
      }
      
      public static function returnMap(param1:§1t173s0§) : void
      {
         if(param1.mapID < 0)
         {
            cloudsPool.push(param1);
         }
         else
         {
            mapVector.push(param1);
         }
      }
   }
}

